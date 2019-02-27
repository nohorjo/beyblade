use <base.scad>
use <attack-ring-base.scad>

attack_ring_height = 20;

render() {
    base();
    translate([0, 0, attack_ring_height])
    attack_ring_base();
}
