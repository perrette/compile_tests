# compile_tests
Test compilations, shared vs static libraries

Conclusion: very similar use of shared and static libraries. Shared library requires -Wl,-rpath,lib

Examples:

```
# compilation using shared library
make clean shared main
./bin/main  # that works !

# try removing the libray
ls *
rm -rf lib 
./bin/main   # that fails !

# compilation using static library
make clean static main
./bin/main  # that works

# try removing the libray
ls *
rm -rf lib 
./bin/main   # that still works !
```

