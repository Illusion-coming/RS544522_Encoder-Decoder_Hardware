#!/usr/bin/tclsh


proc loop_detect {args} {

set help "-help"

if { [string equal $args $help] != 1 } {

config followactivescope on

set i 0;

while {$i < $args} {

run_step

incr i

}


} else {

puts "Usage: loop_detect <no. of iteration>"

}

}


proc run_step {} {

redirect -f loop.txt -a {set x [step]};

redirect -f loop.txt -a {set y [scope]};

puts $x;

puts $y;

}