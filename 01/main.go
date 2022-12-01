package main

import (
	"fmt"
	"log"
	"os"
	"sort"
	"time"
	"strings"
	"github.com/ctfries/advent-of-code/2022/go/utils"
)

// today's input data type
type dataType []string

// how to read today's inputs
var fileReader = utils.ReadNewLineGroups

func partOne(data dataType) (ans int, err error) {
	groups := parseGroupedCalorieList(data)

	ans = utils.Max(groups...)

	return
}

func partTwo(data dataType) (ans int, err error) {
	groups := parseGroupedCalorieList(data)
	//utils.sortDesc(groups)
	sort.Slice(groups, func(i, j int) bool {
		return groups[i] > groups[j]
	})
	ans = groups[0] + groups[1] + groups[2]
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
func parseGroupedCalorieList(data dataType) []int {
	out := make([]int, 0, len(data))

	for _, group := range data {
		sum := 0
		for _, num_str := range strings.Split(group, "\n") {
			sum += utils.ParseInt(num_str)
		}
		out = append(out, sum)
	}

	return out
}