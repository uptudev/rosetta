<?php
$a = 0;
echo "$a\n";
$b = 1;
echo "$b\n";

while(($a + $b) < 18446744073709551615) {
    $c = $a + $b;
    $cstr = sprintf('%lu', $c);    
    echo "$cstr\n";
    $a = $b;
    $b = $c;
}

echo "Overflowed!\n";
?>
