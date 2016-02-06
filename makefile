FC=gfortran
s=src
o=obj
l=lib
i=include
b=bin

all: static main
main: $(b)/main
static: $(l)/libmod1.a
shared: $(l)/libmod1.so

$(b)/main: $(o)/prog.o
	@mkdir -p $(b)
	$(FC) $(o)/prog.o -o $@ -lmod1 -L$(l) -Wl,-rpath,$(l)

$(l)/libmod1.so: $(o)/mod1.o
	@mkdir -p $(l)
	$(FC) -shared -fPIC $< -o $@
	
$(l)/libmod1.a: $(o)/mod1.o
	@mkdir -p $(l)
	ar rc $@ $<

$(o)/%.o: $(s)/%.f90
	@mkdir -p $(o) $(i)
	$(FC) -c $^ -I$(i) -J$(i) -fPIC -o $@


clean:
	rm -fr $(o) $(i) $(l) $(b)
