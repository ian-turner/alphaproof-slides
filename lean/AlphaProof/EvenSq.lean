import Mathlib

-- Tactic-style proof
theorem even_sq (n : Int) (h : 2 ∣ n) : 2 ∣ n ^ 2 := by
  obtain ⟨k, hk⟩ := h
  exact ⟨2 * k ^ 2, by rw [hk]; ring⟩

-- Calc-style proof (no ring)
theorem even_sq_calc (n : Int) (h : 2 ∣ n) : 2 ∣ n ^ 2 :=
  let ⟨k, hk⟩ := h
  ⟨2 * k ^ 2, calc
    n ^ 2 = (2 * k) ^ 2       := by rw [hk]
        _ = 2 * k * (2 * k)   := by rw [sq]
        _ = 2 * (k * (2 * k)) := by rw [mul_assoc]
        _ = 2 * (2 * (k * k)) := by rw [mul_left_comm k 2 k]
        _ = 2 * (2 * k ^ 2)   := by rw [← sq k]⟩
