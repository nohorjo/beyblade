use <attack-ring-base.scad>

module half() {
    translate([-10.5, 3])
    difference() {
        import("lib/the-drowned-valkarie.stl");
        translate([-87, -55])
        rotate(3)
        cube([100, 100, 10]);
    }
}

module the_drowned_valkarie() {
    with_base() {
        half();
        rotate(180)
        half();
    }
}

the_drowned_valkarie();
