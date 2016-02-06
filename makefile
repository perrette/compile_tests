FC=gfortran
s=src
o=obj
l=lib
i=include
b=bin

all: static shared
static: $(b)/main_a
shared: $(b)/main_so

$(b)/main_a: $(l)/libmod1.a $(o)/prog.o
	@mkdir -p $(b)
	$(FC) -static $(o)/prog.o -o $@ -lmod1 -L$(l)

$(b)/main_so: $(l)/libmod1.so $(o)/prog.o
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
