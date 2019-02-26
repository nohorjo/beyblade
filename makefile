
all: $(patsubst %.scad,stl/%.stl,$(wildcard *.scad))

stl/%.stl: %.scad # lib/*.scad
	openscad -D '$$fn=100' -o $@ $<

clean:
	rm stl/*

