package integers

import "testing"

func TestAdder(t *testing.T) {
	t.Run("Adding 2+2", func(t *testing.T) {
		sum := Add(2, 2)
		expected := 4
		assertCorrectMessage(t, sum, expected)
	})
}

func assertCorrectMessage(t testing.TB, sum, expected int) {
	t.Helper()
	if sum != expected {
		t.Errorf("expected '%d' but got '%d'", expected, sum)
	}
}