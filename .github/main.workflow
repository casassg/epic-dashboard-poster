workflow "Release pdf" {
  on = "release"
  resolves = ["Release"]
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
  needs = ["Pandoc Document Conversion"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHR_PATH = "pdf/main.pdf"
  }
}
