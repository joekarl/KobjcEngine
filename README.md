The point of this is to create a reusable game engine core, written in Objective-C, based on SDL for input and OpenGl for graphics that will be usable on linux, OSX, and maybe if I get around to it, windows.

The project is using GNUmakefiles for building so should be fairly simple. To build the demo, enter the demo folder and type make. This will build the engine and the demo. To run the demo, just run the run.sh script.

The engine is output as a shared and a static library for easy use.
