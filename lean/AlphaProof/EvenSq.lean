import Mathlib

theorem even_sq (n : Int) (h : 2 ∣ n) : 2 ∣ n ^ 2 := by
  obtain ⟨k, hk⟩ := h
  exact ⟨2 * k ^ 2, by rw [hk]; ring⟩
