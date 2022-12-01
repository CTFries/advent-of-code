package utils
import (
	"fmt"
	"strconv"
)

type numeric interface {
	int | int8 | int16 | int32 | int64 |
		uint | uint8 | uint16 | uint32 | uint64 |
		float32 | float64
}

func Max[T numeric](nums ...T) T {
	max := nums[0]

	for _, val := range nums {
		if val > max {
			max = val
		}
	}

	return max
}

func ParseInt(str string) int {
	num, err := strconv.Atoi(str)

	if err != nil {
		panic(fmt.Sprintf("Could not parse number: %s - %v", str, err))
	}

	return num
}