
all: $(patsubst %.scad,stl/%.stl,$(wildcard *.scad))

include $(wildcard stl/*.deps)

stl/%.stl: %.scad
	openscad -D '$$fn=100' -m make -o $@ -d $@.deps $<

clean:
	rm stl/*

