#!/bin/bash

DIR=`dirname $0`
ROOT=$DIR/..

# Format code in project.

perltidy                                                                      \
    -l=79                                                                     \
    -b -bext='/'                                                              \
    $ROOT/example.pl                                                          \
    $ROOT/Mslm/t/*                                                            \
    $ROOT/Mslm/lib/*.pm                                                       \
    $ROOT/Mslm/lib/Mslm/*.pm
