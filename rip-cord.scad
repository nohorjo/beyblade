use <lib/openscad-lib/gears.scad>

thickness = 2;

module rip_cord(length) {
    ring_inner_diameter = 20;
    ring_thickness = thickness * 2;
    ring_support_hyp = 7.5;

    echo("rip cord length", length + ring_inner_diameter + ring_thickness);

    ratchet_stick_pawl(thickness, length, thickness, thickness, length / 5);
    translate([length + (ring_inner_diameter / 2), 0]) {
        difference() {
            cylinder(thickness, d = ring_inner_diameter + ring_thickness);
            cylinder(thickness, d = ring_inner_diameter);
        }
        difference() {
            translate([-ring_inner_diameter / 2, 0])
            rotate(45)
            translate([-ring_support_hyp / 2, -ring_support_hyp / 2])
            cube([ring_support_hyp, ring_support_hyp, thickness]);
            cylinder(thickness, d = ring_inner_diameter);
        }
    }
}

rip_cord(250);
