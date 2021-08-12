## JPL Discussion of F’ port for FreeRTOS
Basic discussion on porting F’ to use FreeRTOS can be found in [this 3 year old post](https://github.com/nasa/fprime/issues/7). I have found no additional work on the port by JPL.
## CMU Fork of F’
Students at CMU working on a lunar rover tried their hand at porting F’ to run FreeRTOS on the Hercules RM46L852 microcontroller. [The latest work](https://github.com/ErynQian/fprime) is slightly older than [issues they were having](https://github.com/nasa/fprime/issues/7#issuecomment-495035872), so they were not able to build F’.
One addition made to their fork of F’ is the directory fprime/Os/FreeRTOS which contains implementations for the classes in fprime/Os. These classes are written by the student team and are rudimentary and incomplete. The FreeRTOS directory includes the Trace Recorder Library and two additional directories: FreeRTOS-Real and FreeRTOS-sim. They contain the source code for FreeRTOS, which differs from that used on the STM32 port of cFS.
## F’ on STM32
I began the fprimeSTM32 repo by following the instructions in the original JPL discussion post. Therefore I made the same changes as the CMU fork and replaced all mentions of the TI Hercules board with the STM32 Eval board.
My approach to this was to observe the relationship between F’ and FreeRTOS on the CMU fork and attempt to develop the same relationship between F’ and FreeRTOS in my own fork of F’s NASA v1.2 branch.
## Next steps:
- Write custom implementations for classes defined in fprime/Os compatible with STM32 FreeRTOS source code
- Choose a compatible compiler 
- Change filepaths in compiler configuration file (i.e. direct LINK_LIB to the library creation tool that will be used)
- ...

## Setting up the workspace
1. Create a new workspace in STM32CubeIDE.
2. Right click in the Project Explorer, select “Import projects,” expand “C/C++,” select “Existing Code as Makefile Project,” and press Next
3. Set the path to the “fprime” directory and press “finish”
4. Right click in the Project Explorer, select “Import projects,” expand “General,” and select “Existing Projects into Workspace,” and press Next
5. Beside “Select root directory” press Browse to set the root directory to the location of the workspace containing the “stm” project in the STM32 port of cFS
6. Deselect all projects and select only the “stm” project
7. Check “Copy projects into workspace” under Options and then press Finish
8. Now you can follow the instructions from the github post to modify configuration files. 