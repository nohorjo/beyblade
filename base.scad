point_height = 3;
weight_width = 5.5;
weight_length = 13;
top_height = 10;
top_diameter = 40;
thickness = 2;
core_thickness = 15;
top_z = point_height + 10;

module base() {
    module weight_container(hole = false) {
        for (i = [0:3]) {
            rotate(90 * i)
            translate([-weight_width - 1, (core_thickness / 2) + 3.5, thickness])
            difference() {
                cube([weight_length + 1, weight_width + 1, weight_width]);
                translate([0.5, 0.5])
                cube([weight_length, weight_width, weight_width]);
            }
        }
    }

    cylinder(point_height, d = 3);
    translate([0, 0, point_height])
    cylinder(top_z + top_height, d = core_thickness);
    translate([0, 0, top_z]) {
        difference() {
            cylinder(top_height, d = top_diameter);
            translate([0, 0, thickness])
            cylinder(top_height - thickness, d = top_diameter - (thickness * 2));
            weight_container(hole = true);
        }
        weight_container();
    }
}

base();
