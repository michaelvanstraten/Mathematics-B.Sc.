#import "definitions.typ"

#set enum(numbering: "(1.1)")
#set math.mat(delim: "[")

#let ex-counter = counter("exercise")
#let exercise(points, body) = block(spacing: 0.65em)[
  #ex-counter.step()
  *Übung #context ex-counter.display()* (#text(number-type: "old-style")[#points] Punkte).
  #body
]

#let csu = [#smallcaps[Cauchy]–#smallcaps[Schwarz]-Ungleichung]
