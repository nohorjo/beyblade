thickness = 2;
base_diameter = 35;
core_diameter = 15;
attack_ring_diameter = base_diameter + thickness;

module attack_ring_base() {
    clip_length = base_diameter;
    clip_width = core_diameter / 1.75;

    difference() {
        cylinder(thickness, d = attack_ring_diameter);
        cylinder(thickness, d = core_diameter + 5);
    }
    difference() {
        translate([-clip_length / 2, -clip_width / 2])
        cube([clip_length, clip_width, thickness]);
        cylinder(thickness, d = core_diameter - thickness + 0.5);
    }
}

module with_base() {
    difference() {
        children();
        cylinder(thickness, attack_ring_diameter);
        cylinder(10, core_diameter);
    }
    attack_ring_base();
}

attack_ring_base();
