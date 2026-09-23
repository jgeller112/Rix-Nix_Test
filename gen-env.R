# Generates default.nix: the full environment for nix_rix_example.qmd.
# Rerun this file (not hand-edit default.nix) to change the environment.
library(rix)

rix(
  date   = "2026-08-24",
  r_pkgs = c("brms", "palmerpenguins", "knitr", "rmarkdown"),
  git_pkgs = list(               # cmdstanr isn't on CRAN: pin a GitHub release
    package_name = "cmdstanr",
    repo_url     = "https://github.com/stan-dev/cmdstanr",
    commit       = "da99e2ba954658bdad63bffb738c4444c33a4e0e"   # v0.9.0
  ),
  system_pkgs = c("quarto", "cmdstan"),   # Quarto and the Stan toolchain, pinned too
  shell_hook  = paste(
    "export CMDSTAN=$(dirname $(dirname $(command -v stan)))/opt/cmdstan",
    "export PRECOMPILED_HEADERS=false",   # CmdStan lives in the read-only Nix store
    sep = "\n"
  ),
  ide    = "none",
  project_path = ".",
  overwrite    = TRUE
)
