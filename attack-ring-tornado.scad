use <attack-ring-base.scad>

attack_ring_base();
for (i = [0:4]) {
    rotate(i * 72)
    translate([0, 18])
    cylinder(2, d = 10);
}
