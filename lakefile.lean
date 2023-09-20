import Lake
open Lake DSL

package «lean4-course» {
  moreServerArgs := #["-DautoImplicit=false"]
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib «Lean4Course» {
  moreLeanArgs := #["-DautoImplicit=false"]
  globs := #[.submodules `course]
}
