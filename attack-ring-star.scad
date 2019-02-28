use <lib/openscad-lib/prism.scad>
use <attack-ring-base.scad>

attack_ring_base();
for (i = [0:3]) {
    rotate(i * 90)
    translate([0, 18])
    prism(
        [
            [-4, 0],
            [4, 0],
            [0, 5]
        ],
        2
    );
}
