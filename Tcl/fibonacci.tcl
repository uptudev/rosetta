set a 0
puts $a
set b 1
puts $b
while {true} {
    set c [expr "$a + $b"]
    if {$c > 18446744073709551615} {break}
    puts $c
    set a $b
    set b $c
}
