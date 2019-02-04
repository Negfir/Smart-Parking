@echo off
set xv_path=C:\\Xilinx15\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 7fca535ce508416581dbc65209bb580f -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Test_behav xil_defaultlib.Test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
