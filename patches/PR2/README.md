The c compiler on z/OS leaves conftest.o after compiling, which causes a bunch of tests to fail when the test framework compares the directory before and after a compilation.
- lang.m4.patch

