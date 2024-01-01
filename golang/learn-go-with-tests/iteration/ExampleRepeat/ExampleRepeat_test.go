package iteration

import "testing"

func TestExampleRepeat(t *testing.T) {

	t.Run("Repeating a", func(t *testing.T) {
		repeated := ExampleRepeat("a", 6)
		expected := "aaaaaa"

		assertCorrectMessage(t, expected, repeated)
	})
}

func assertCorrectMessage(t testing.TB, expected string, repeated string) {
	t.Helper()
	if expected != repeated {
		t.Errorf("expected %q repeated %q", expected, repeated)
	}
}