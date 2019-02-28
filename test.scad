use <base.scad>
use <attack-ring-base.scad>
use <launcher.scad>
use <rip-cord.scad>
use <t-attack-ring-the-drowned-valkarie.scad>

attack_ring_height = 16;

render() {
    base();
    translate([0, 0, attack_ring_height])
    rotate(15)
    the_drowned_valkarie();
    translate([0, 0, attack_ring_height - 5 + 50]) {
        launcher();
        translate([-225, -12.5, 15.5])
        rip_cord(250);
    }
}
