#!/bin/bash
a=$(wofi -c=wofiR/config -s=wofiR/style.css -drun) && qutebrowser $a
