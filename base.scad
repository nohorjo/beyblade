point_height = 3;
weight_width = 5.5;
weight_length = 13;
top_height = 6;
top_diameter = 35;
thickness = 2;
core_thickness = 15;
top_z = point_height + 7;
core_height = top_z + top_height + thickness - 1;
echo("height", core_height + point_height);
echo("width", top_diameter);

module base_core() {
    module core_cuts() {
        translate([0, 0, core_height - (thickness * 2)]) {
            translate([- core_thickness / 2, core_thickness / 3])
            cube([core_thickness, core_thickness, 10]);
            rotate(-25)
            intersection() {
                difference() {
                    cylinder(thickness, d = core_thickness + 1);
                    cylinder(thickness, d = core_thickness - thickness);
                }
                cube([core_thickness, core_thickness, thickness]);
            }
            translate([0, 0, -thickness])
            difference() {
                difference() {
                    cylinder(core_height, d = 9);
                    cylinder(core_height, d = 6);
                }
                translate([-10, 0])
                cube(20);
                translate([0, -5, 5]) {
                    rotate(-40, [0, 1]) {
                        cube(20);
                        translate([-23, 0, -5])
                        cube(20);
                    }
                    cube(20);
                }
                translate([0, -thickness])
                cube(10);
            }
            difference() {
                cylinder(core_height, d = 9);
                cylinder(core_height, d = 7);
            }
        }
    }

    cylinder(point_height, d = 3);
    translate([0, 0, point_height])
    difference() {
        cylinder(core_height, d = core_thickness);
        core_cuts();
        rotate(180, [0, 0, 1])
        core_cuts();
    }
    translate([0, 0, top_z - thickness])
    cylinder(thickness, d = core_thickness + thickness);
}

module weight_section() {
    module weight_containers() {
        for (i = [0:3]) {
            rotate(90 * i)
            translate([-weight_width - 1, core_thickness / 2, thickness])
            difference() {
                cube([weight_length + 1, weight_width + 1, weight_width]);
                translate([0.5, 0.5])
                cube([weight_length, weight_width, weight_width]);
            }
        }
    }

    difference() {
        cylinder(top_height, d = top_diameter);
        translate([0, 0, thickness])
        cylinder(top_height - thickness, d = top_diameter - (thickness * 2));
        cylinder(thickness, d = core_thickness);
    }
    weight_containers();
}

module base() {
    base_core();
    translate([0, 0, top_z])
    weight_section();
}

render()
base();

