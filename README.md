# autoconfport
Delta files to build autoconf for z/OS

## Build tips
- Use the TESTSUITEFLAGS make option on the `PORT_CHECK_OPTS` envar to select individual tests to run.
```
export PORT_CHECK_OPTS="check TESTSUITEFLAGS='318'"; export PORT_INSTALL=skip; build.sh
```
