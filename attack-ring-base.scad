thickness = 2;
base_diameter = 35;
core_diameter = 15;

module attack_ring_base() {
    clip_length = base_diameter;
    clip_width = core_diameter / 1.75;

    difference() {
        cylinder(thickness, d = base_diameter + thickness);
        cylinder(thickness, d = core_diameter + 5);
    }
    rotate(15)
    difference() {
        translate([-clip_length / 2, -clip_width / 2])
        cube([clip_length, clip_width, thickness]);
        cylinder(thickness, d = core_diameter - thickness + 0.5);
    }
}

attack_ring_base();
