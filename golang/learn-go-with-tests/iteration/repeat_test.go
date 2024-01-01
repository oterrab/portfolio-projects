package iteration

import "testing"

func TestRepeat(t *testing.T) {
	t.Run("Repeating a", func(t *testing.T) {
		repeated := Repeat("a")
		expected := "aaaaa"

		assertCorrectMessage(t, repeated, expected)
	})
}

func assertCorrectMessage(t testing.TB, repeated, expected string) {
	t.Helper()
	if repeated != expected {
		t.Errorf("expected '%q' but got '%q'", expected, repeated)
	}
}

func BenchmarkRepeat(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Repeat("a")
	}
}