workflow "New workflow" {
  resolves = ["Pandoc Document Conversion"]
  on = "push"
}

action "Pandoc Document Conversion" {
  uses = "maxheld83/pandoc@v0.1.1"
  args = "--standalone --output=pdf/main.pdf main.tex"
  env = {
    OUT_DIR = "pdf"
  }
}
