import Lake
open Lake DSL

package «lean4-course» {
  -- add any package configuration options here
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «Lean4Course» {
  -- add any library configuration options here
}
