package iteration

// 1
// func Repeat(character string) string {
// 	var repeated string
// 	repeated = newFunction(repeated, character)
// 	return repeated
// }

// func newFunction(repeated string, character string) string {
// 	for i := 0; i < 5; i++ {
// 		repeated = repeated + character
// 	}
// 	return repeated
// }

const repeatCount = 5

func Repeat(character string) string {
	var repeated string
	for i := 0; i < repeatCount; i++ {
		repeated += character
	}
	return repeated
}