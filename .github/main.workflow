workflow "New workflow" {
  resolves = ["Pandoc Document Conversion"]
  on = "push"
}

action "Pandoc Document Conversion" {
  uses = "maxheld83/pandoc@v0.1.1"
  runs = "pdflatex"
  args = "-output-directory pdf main.tex"
}
