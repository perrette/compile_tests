# compile_tests
Test compilations, shared vs static libraries

Conclusion: very similar use of shared and static libraries. Compilation with shared library requires knowledge of `.so` path on runtime, via `-Wl,-rpath,lib` option. Static library is simpler to use.

Examples:

```
# compilation using shared library
make clean shared main
./bin/main  # that works !

# try removing the library
ls *
rm -rf lib
./bin/main   # that fails !

# compilation using static library
make clean static main
./bin/main  # that works

# try removing the libray and all compilation objects
ls *
rm -rf lib obj include
./bin/main   # that still works !
```

