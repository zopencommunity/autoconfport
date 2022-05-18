There are a few places where the hard-coded signal values cause warnings (or worse). 
The fix is to use SIGxxx instead of an integer. This change is made in:
- config.guess.patch
- configure.patch 
- general.m4.patch
- status.m4.patch

There is a check for an error message to match a specific format, but on z/OS, we 
precede error messages with an error number so they can be looked up in the online 
manuals. To fix this, we replace EDC[0-9][0-9][0-9][0-9]I with nothing so that the 
error message will match up. This change is made in:
-local.at.patch     
