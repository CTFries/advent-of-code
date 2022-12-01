#!/bin/bash

NEW_DAY=$1
NEW_DAY_NAME="day-$NEW_DAY"

usage() {
    cat >&2 <<END_USAGE

Create a new boilerplate directory from a template

USAGE:
    ./create-day.sh 01
END_USAGE
}

if [ -z $NEW_DAY ]; then
  echo "Provide ## for new day directory"
	usage
  exit 1
fi

mkdir $NEW_DAY

cd $NEW_DAY

# start touching things
touch README.md
touch input.txt

# create main go file
cat > main.go <<EOF
package main

import (
	"fmt"
	"log"
	"os"
	"time"
	"github.com/CTFries/advent-of-code/2022/go/utils"
)

// today's input data type
type dataType []string
// how to read today's inputs
var fileReader = utils.ReadLines
func partOne(data dataType) (ans int, err error) {
	return
}
func partTwo(data dataType) (ans int, err error) {
	return
}
// initialize the app by setting log flags
func init() {
	log.SetFlags(log.Llongfile)
}
// run the solvers
func main() {
	filename := utils.GetInputFile()
	data, err := fileReader(filename)
	if err != nil {
		fmt.Println(fmt.Errorf("failed to read file: %s - %w", filename, err))
		os.Exit(1)
	}
	fncs := map[string]func(dataType) (int, error){
		"partOne": partOne,
		"partTwo": partTwo,
	}
	// run partOne and partTwo
	for k, fun := range fncs {
		s := time.Now()
		val, err := fun(dataType(data))
		if err != nil {
			fmt.Println(fmt.Errorf("%s failed: %w", k, err))
			os.Exit(1)
		}
		fmt.Printf("%s: %v (%v)\n", k, val, time.Since(s))
	}
}

// Supporting Funcs
EOF