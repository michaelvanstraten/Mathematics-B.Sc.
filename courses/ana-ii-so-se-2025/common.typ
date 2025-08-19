#import "definitions.typ"

#let problemset(number) = {
  doc => [
    #set page(
      numbering: "1",
      margin: (
        top: 3cm,
        bottom: 1.5cm,
        outside: 2.0cm,
        inside: 2.0cm,
      ),
      header: [
        Analysis II\* #h(1fr) Michael van Straten \ *Lösungen*: #number.
        Übungsblatt \
        #block(above: 4pt, line(length: 100%, stroke: 0.5pt))
      ],
    )
    #set par(leading: 0.55em, justify: true)
    #set text(
      font: "New Computer Modern",
      size: 10pt,
      number-type: "old-style",
      lang: "de",
    )
    #show heading: set block(above: 1.4em, below: 1em)
    #set enum(numbering: "(1.a)", indent: 1em)
    #set math.mat(delim: "(")
    #show sym.lt.eq: $lt.eq.slant$
    #show sym.gt.eq: $gt.eq.slant$
    #show math.equation.where(block: true): eq => {
      block(width: 100%, inset: 0pt, align(center, eq))
    }
    #doc
  ]
}


#let ex-counter = counter("exercise")
#let exercise(points, body) = block(spacing: 0.65em)[
  #ex-counter.step()
  *Übung #context ex-counter.display()* (#text(
    number-type: "old-style",
  )[#points] Punkte).
  #body
]

#let csu = [#smallcaps[Cauchy]–#smallcaps[Schwarz]-Ungleichung]

#let scr(it) = text(features: ("ss01",), box($cal(it)$))

#let distance = math.op("d")
#let Sym = math.op("Sym", limits: false)
