use <base.scad>
use <attack-ring-base.scad>
use <launcher.scad>
use <rip-cord.scad>

attack_ring_height = 16;

render() {
    base();
    translate([0, 0, attack_ring_height])
    rotate(15)
    attack_ring_base();
    translate([0, 0, attack_ring_height - 5]) {
        launcher();
        translate([-225, -12.5, 15.5])
        rip_cord(250);
    }
}
