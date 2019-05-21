workflow "Release pdf" {
  resolves = ["Pandoc Document Conversion"]
  on = "release"
}

action "Pandoc Document Conversion" {
  uses = "maxheld83/pandoc@v0.1.1"
  args = "--standalone --output=pdf/main.pdf main.tex"
  env = {
    OUT_DIR = "pdf"
  }
}

action "Release" {
  uses = "fnkr/github-action-ghr@v1"
  needs = ["Build"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHR_PATH = "pdf/main.pdf"
  }
}
