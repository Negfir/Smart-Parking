@echo off
set xv_path=C:\\Xilinx15\\Vivado\\2015.4\\bin
call %xv_path%/xsim Test_behav -key {Behavioral:sim_1:Functional:Test} -tclbatch Test.tcl -view C:/Users/negfi/Documents/AUT/5thSemester/DigitalDesignAutomation/Project/Phaze1/Smart Parking/Test_behav.wcfg -view C:/Users/negfi/Documents/AUT/5thSemester/DigitalDesignAutomation/Project/Phaze1/Smart Parking/Test_behav1.wcfg -view C:/Users/negfi/Documents/AUT/5thSemester/DigitalDesignAutomation/Project/Phaze1/Smart Parking/Test_behav2.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
