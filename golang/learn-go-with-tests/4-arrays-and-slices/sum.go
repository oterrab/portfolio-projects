package main

// 1
//
// func Sum(numbers [5]int) int {
// 	return 0
// }

// 2
//
// func Sum(numbers [5]int) int {
// 	sum := 0
// 	for i := 0; i < 5; i++ {
// 		sum += numbers[i]
// 	}
// 	return sum
// }

// Range lets you iterate over an array. On each iteration, range returns two values - the index and the value. We are choosing to ignore the index value by using _ blank identifier. it represents a write-only value to be used as a place-holder where a variable is needed but the actual value is irrelevant. // SEEMS VERY AWESOME!

// For instance, when calling a function that returns a value and an error, but only the error is important, use the blank identifier to discard the irrelevant value. // Or in this case, the index is irrelevant and the value is important.

func Sum(numbers [5]int) int {
	sum := 0
	for _, number := range numbers {
		sum += number
	}
	return sum
}

// When a program is under active development, however, unused imports and variables often arise and it can be annoying to delete them just to have the compilation proceed, only to have them be needed again later. The blank identifier provides a workaround.

// To silence complaints about the unused imports, use a blank identifier to refer to a symbol from the imported package. Similarly, assigning the unused variable fd to the blank identifier will silence the unused variable error.
//
// var _ = fmt.Printf // For debugging; delete when done.
//  _ = fd
//