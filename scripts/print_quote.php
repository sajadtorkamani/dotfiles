<?php
#!/usr/bin/env php

$quotes = [
    "Act only according to that maxim whereby you can, at the same time, will that it should become a universal law. - Immanuel Kant",
    "Perfectionism is the enemy of progress.",
    'We are all going to die.',
    "Love yourself first because that's who you'll be spending the rest of your life with."
];

echo $quotes[array_rand($quotes)];

