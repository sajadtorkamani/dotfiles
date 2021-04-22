<?php
#!/usr/bin/env php

$quotes = [
    "Act only according to that maxim whereby you can, at the same time, will that it should become a universal law.",
    "Perfectionism is the enemy of progress.",
    "Progress not perfection",
    "I have learned to seek my happiness by limiting my desires, rather than in attempting to satisfy them.",
    'We are all going to die.',
    "Love yourself first because that's who you'll be spending the rest of your life with.",
    "Be kind to others for any person you meet could be only a few steps from unravelling.",
    "Humour is the saving grace of humanity.",
    "We become powerful when we stop making excuses for ourselves and when we give up the self-defeating habit of blaming others for our problems.",
    "You're a dead man walking.",
    "No one knows what they're doing",
    "Good intentions don't work. Mechanisms do.",
    "The greatest prison people live in is the fear of what other people think."
];

echo $quotes[array_rand($quotes)];

