
# Project Title  
This is a system that uses Xilinx Dynamic Function eXchange for ultra96v2 board.  

## Run Locally  

#### Clone the project  

~~~bash  
  git clone https://github.com/luiscarlos63/ultra96v2_crypt.git
~~~

#### Open the project 
Open vivado in the cloned project folder
~~~bash  
  Vivado->Run TCL script->/ultra96v2_dfx.tcl
~~~
This opens and sets up the Vivado project. The centre of system is the
Block Design. The project is **almost** ready to generate bitstreams.

### Pre-Systesis
The only thing left to do is create a wrapper for the Block Design.
- Right-click on *design_1* and select Create HDL Wrapper.

### Systesis
Systesis runs all the Out-Of-Context modules, including the 
IPs that are used inside the Reconfigurable partitions


### Implementation
Implementation occurs in **configurations** this project only
uses 3 configurations.
You can see the way the IPs are distributed among the **configurations**, for that, in Vivado, open:
~~~
Flow Navigator-> Project Manager-> Dynamic Function eXchange Wizard
~~~
Here you will find:

- Which Reconfigurable Modules (they represent the IPs) are
associated with which partitions
- The configurations for the implementation This configurations 
basically represent the 3 full bitstreams that are generated by Vivado.
- Lastly it shows the Implementation runs that correspond to each configuration.

### Generate bitstreams
To generate the proper bitstreams expected by system go to:

~~~
Design Runs->Select the 3 Implementation runs-> Right click -> Generate bitstreams -> Select -bin_file 
~~~

After the bitstreams are generated you need to copy them to a folder.
This bitstream are in:
~~~
PROJECT_FOLDER/vivado_project/ultra96v2_dfx.runs/impl_1
                                                /child_0_impl_1
                                                /child_1_impl_1
~~~
Each of these directories has 3 files with **.bin** extension. These are the files you should copy.

### Prepare bitstreams
After they are placed in a folder, copy the files inside 
*PROJECT_FOLDER/scripts*
to that folder. **Change the first line in *prepare_partial* for you full path to the folder you copied the bitstreams** 

#### From the vivado console
~~~
source [get_property REPOSITORY [get_ipdefs *dfx_controller:1.0]]/xilinx/dfx_controller_v1_0/tcl/api.tcl –notrace​
source /full_path_to_folder/prepare_partial
~~~
This will generate a folder with the bitstreams in the format expected by **ICAP**
#### From the shell
~~~bash
./encrypt.sh
~~~
This will encrypt the bitsreams, now you just need to copy them to the SD card.

### Export hardware
~~~
File->Export->Export Hardware
~~~
Use the option *include bistream*


### Software
#### Platform
In Vitis create a platform based on the **.xsa** from vivado exported hardware.

In the *Board Support Package -> modify BSP Settings* and add **xilffs** library
Also, you need to change UART0 to UART1.

#### Application
Create an Application based on the previously mentions platform.
Add the sources from  *PROJECT_FOLDER/sw*.

#### compile and run.

### Interaction.
The Application allows 6 options:
- Options 1 to 3: Reading.
- Options 4 to 6: Reconfiguration. After selecting the reconfiguration option, you will be prompted to choose the region to reconfigure (RP_1 - 1, RP_2 - 2, or RP_3 - 3).
