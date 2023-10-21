[![Automatic version updates](https://github.com/ZOSOpenTools/autoconfport/actions/workflows/bump.yml/badge.svg)](https://github.com/ZOSOpenTools/autoconfport/actions/workflows/bump.yml)

# autoconfport
Delta files to build autoconf for z/OS

## Build tips
- Use the TESTSUITEFLAGS make option on the `ZOPEN_CHECK_OPTS` envar to select individual tests to run.
```
export ZOPEN_CHECK_OPTS="check TESTSUITEFLAGS='318'"; export ZOPEN_INSTALL=skip; zopen build
```
