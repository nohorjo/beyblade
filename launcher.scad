use <lib/openscad-lib/gears.scad>

thickness = 2;

mount_diameter = 9;
mount_height = 15;

gear_height = thickness * 2;
gear_inner_diameter = 50 / PI;
gear_outer_diameter = gear_inner_diameter + (2 * thickness);

housing_inner_length = gear_outer_diameter + 1;
housing_inner_width = gear_outer_diameter + 8;
housing_outer_length = housing_inner_length + (thickness * 3);
housing_outer_width = housing_inner_width + (thickness * 3);
housing_length_thickness = (housing_outer_length - housing_inner_length) / 2;
housing_width_thickness = (housing_outer_width - housing_inner_width) / 2;
housing_y = (gear_outer_diameter / 2) - housing_inner_width;

total_height = gear_height + thickness;

module main_gear() {
    translate([0, 0, gear_height + mount_height]) 
    rotate(180, [1, 0])
    ratchet_gear(gear_height, gear_inner_diameter, thickness, 10);
    difference() {
        union() {
            difference() {
                cylinder(mount_height, d = mount_diameter);
                cylinder(mount_height, d = mount_diameter - 2);
            }
            intersection() {
                difference() {
                    cylinder(mount_height, d = mount_diameter);
                    cylinder(mount_height, d = mount_diameter - 3);
                }
                translate([0, 15, 3])
                rotate(90, [1, 0])
                cylinder(30, d = 3);
            }
        }
        translate([0, 5, 5])
        rotate(90, [1, 0])
        difference() {
            translate([-5, -5])
            cube([10, 5, 10]);
            difference() {
                cylinder(10, d = 7.5);
                translate([-5, 0])
                cube([10, 5, 10]);
            }
        }
        translate([0, -5]) {
            translate([2, 0])
            cube(10);
            translate([-12, 0])
            cube(10);
        }
    }
}

module housing_pins() {
    translate([0, housing_y]) {
        translate([0, housing_width_thickness / 2]) {
            translate([(housing_inner_length + housing_length_thickness) / 2, 0])
            cylinder(total_height + 1, d = 2);
            translate([-(housing_inner_length + housing_length_thickness) / 2, 0])
            cylinder(total_height + 1, d = 2);
        }
        translate([0, (housing_width_thickness * 1.5) + housing_inner_width]) {
            translate([(housing_inner_length + housing_length_thickness) / 2, 0])
            cylinder(total_height + 1, d = 2);
            translate([-(housing_inner_length + housing_length_thickness) / 2, 0])
            cylinder(total_height + 1, d = 2);
       }
    }
}

module bottom_housing() {
    spring_angle = 30;
    spring_length = housing_inner_length / 1.2;

    difference() {
        translate([-housing_outer_length / 2, housing_y])
        difference() {
            cube([housing_outer_length, housing_outer_width, total_height]);
            translate([housing_length_thickness, housing_width_thickness, thickness / 2])
            cube([housing_inner_length, housing_inner_width, total_height]);
        }
        translate([0, 0, -5])
        cylinder(10, d = mount_diameter + 0.5);
        translate([(-housing_outer_length / 2) - 0.5, -((gear_outer_diameter / 2) + thickness), thickness])
        cube([housing_outer_length + 1, (thickness * 2) + 0.5, thickness + 0.5]);
        housing_pins();
    }
    translate([10, housing_y, (thickness / 2) + 0.5])
    rotate(-spring_angle)
    translate([-spring_length, 0])
    cube([spring_length, 1, gear_height]);
}

module top_housing() {
    translate([-housing_outer_length / 2, housing_y, total_height])
    cube([housing_outer_length, housing_outer_width, thickness]);
    housing_pins();
}

module launcher() {
    main_gear();
    translate([0, 0, mount_height - (gear_height / 2)]) {
        bottom_housing();
        top_housing();
    }
}

render()
launcher();
