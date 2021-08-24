
# Softwareless

What if, all software disappeared?

  

## Background

A few years ago, I saw a reddit post in which the OP asked if it would be possible to program a regular PC without using another PC. You would not be able to download any existing software from a network, install software from flash drives, CDs, etc.

The question also asked what would be the minimal amount of software needed to accomplish this goal.

The consensus was, that to do that you would need at least a piece of software that could write to arbitrary memory locations. From there you could write an editor, a compiler, and other software.

  

That answer never really satisfied me, from point of view of an embedded developer, one knows that the software running on the PC is only a small part of the puzzle. There's probably software running on the keyboard, disk drives, and of course, there's BIOS. So a modern PC probably could not be programmed without the help of any external software.

  

But what about designing a computer, in such a way that this would be possible?

  

This of course has been done in the past, first programs running on first computers could not be compiled since there were no compilers/assemblers available, ... since those would count as the first programs. Back then, people used various ways of getting programs onto computers: manually weaving wires in core rope memory, using switches in front of computers to arbitrarily modify memory, etc. So it's known that's possible, but just how hard would it be to replicate, given the last 70-ish years of progress?

  

## Why

  

With this project I want to accomplish some personal goals:

* create a RISC-V core

* create an OS

* design language and create a compiler for it

* design and develop some hardware able to support the previous goals

  

## Rules

  

* No external software can be run on the Computer
* Every automation has to be done on the Computer only
  * e.g. you cannot just compile software on a regular PC and then just type compiled program into the Computer
  * text editors are ok, just no macros, scripting, etc.
  * EDA tools can only be used to create hardware, you cannot use them to load ROMs into memory.
* No external HDL and hardware design: all HDL has to be created from scratch, same for schematics and board designs
  * I'll allow copying reference designs, provided by device manufacturers
* Omniscience: you may use every resource available to further your knowledge

  

Yes, I know the rules are very NIHish, I hope that by following those rules I finally get sick of reinventing the wheel and decide to use more ready libraries in the future :)

  

## Goals

*   Create a RISC-V processor
  * Device agnostic HDL, it has to be able to be synthesized on most of available FPGAs
*   Design and assemble terminal capable of interfacing with the designed RISC-V processor
  * keyboard
  * text display
  * CPU interface/protocol
* Design and create a basic set of software
  * text editor
  * file system
  * shell
* assembler
* Design a language and create a compiler for it
* Add a video capability to the processor system
  * text and graphics
  * some color
* Add networking
  * build a second board with working CPU
  * connect them
  * exchange data

And for the ultimate goal: I want to be able to do the thing that the computers were solely designed for, taking pictures of cats and sending them to each other :)

This list does not contain all goals that will be achieved and will be modified in time.
