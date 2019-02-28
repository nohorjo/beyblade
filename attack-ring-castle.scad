use <attack-ring-base.scad>

attack_ring_base();
for (i = [0:5]) {
    rotate(i * 60)
    translate([-3, 18])
    cube([6, 4, 2]);
}
