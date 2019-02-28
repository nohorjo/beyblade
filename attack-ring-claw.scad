use <lib/openscad-lib/prism.scad>
use <attack-ring-base.scad>

attack_ring_base();
for (i = [0:2]) {
    rotate(i * 120)
    translate([0, 18])
    prism(
        [
            [-2, 0],
            [-3, 8],
            [9, -2]
        ],
        2
    );
}
