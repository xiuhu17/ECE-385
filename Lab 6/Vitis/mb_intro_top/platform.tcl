# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/zhihaow6/Desktop/Vitis/Lab6.1/mb_intro_top/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/zhihaow6/Desktop/Vitis/Lab6.1/mb_intro_top/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mb_intro_top}\
-hw {/home/zhihaow6/Desktop/Vivado/Lab 6.1/mb_intro_top.xsa}\
-out {/home/zhihaow6/Desktop/Vitis/Lab6.1}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {mb_intro_top}
platform generate -quick
platform generate
platform config -updatehw {/home/zhihaow6/Desktop/Vivado/Lab 6.1/mb_intro_top.xsa}
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {/home/zhihaow6/Desktop/Vivado/Lab 6.1/mb_intro_top.xsa}
platform active {mb_intro_top}
platform config -updatehw {/home/zhihaow6/Desktop/Vivado/Lab 6.1/mb_intro_top.xsa}
platform config -updatehw {/home/zhihaow6/Desktop/Vivado/Lab 6.1/mb_intro_top.xsa}
platform config -updatehw {/home/zhihaow6/Desktop/Vivado/Lab 6.1/mb_intro_top.xsa}
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
