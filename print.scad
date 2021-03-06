use <attack-ring-base.scad>
use <base.scad>
use <launcher.scad>
use <rip-cord.scad>

translate([20, 20])
render() {
    translate([0, 0, 24])
    rotate(180, [1, 0])
    base_core();

    translate([0, 80])
    weight_section();

    translate([-15, 160])
    rotate(-45)
    rip_cord(220);

    translate([0, 40])
    attack_ring_base();

    translate([35, 25, 8])
    rotate(180, [1, 0])
    top_housing();

    translate([70, 25])
    bottom_housing();

    translate([30, 60, 19])
    rotate(180, [1, 0])
    main_gear();
}
