
all: $(patsubst %.scad,stl/%.stl,$(wildcard *.scad))

stl/%.stl: %.scad $(shell find lib)
	openscad -D '$$fn=100' -o $@ $<

clean:
	rm stl/*

