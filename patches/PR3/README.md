In test 567, LIBS is set during the first run of configure so it appears in state-env.c-native.r1, but on the second run of configure when the cache is picked up LIBS is not set, so it does not appear in state-env.c-native.r2. There is a macro that is generating a script that sets LIBS in the first case, but not the second. So then I did a search on this problem to see if anyone else ran into it before....
Turns out yes, someone in 2005 ran into a related problem and there is a fix.
https://lists.gnu.org/archive/html/bug-autoconf/2005-07/msg00018.html
This fix is similar.  It will replace all envars that are set using double quotes to a null string using, with nothing, so that the subsequent comparison passes.
