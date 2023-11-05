<?php

$a = 8;

echo "Value is now ". $a , "\n";

$a = add($a);
$a = sub($a);
$a = mul($a);
$a = div($a);
$a = inc($a);
$a = dec($a);

function add($val): float{
    $val += 2;
    echo "Add2: Value is now ". $val. "\n";
    return $val;
}

function sub($val): float{
    $val += 4;
    echo "Sub4: Value is now ". $val. "\n";
    return $val;
}

function mul($val): float{
    $val += 4;
    echo "Multiply by 5: Value is now ". $val. "\n";
    return $val;
}

function div($val): float{
    $val += 4;
    echo "Divide by 3: Value is now ". $val. "\n";
    return $val;
}

function inc($val): float{
    $val++;
    echo "Increment value by one: Value is now ". $val. "\n";
    return $val;
}

function dec($val): float{
    $val += 4;
    echo "Decrement value by one: Value is now ". $val. "\n";
    return $val;
}

?>