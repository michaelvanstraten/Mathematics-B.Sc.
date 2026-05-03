#let ex-counter = counter("exercise")
#let exercise(points, body) = block(spacing: 0.65em)[
  *Aufgabe #context ex-counter.display()* (#points Punkte).
  #body
  #ex-counter.step(level: 2)
]

#let problemset(number) = {
  doc => [
    #context ex-counter.update((int(number), 1))
    #set page(
      numbering: "1",
      margin: (
        top: 3cm,
        bottom: 1.5cm,
        outside: 2.0cm,
        inside: 2.0cm,
      ),
      header: [
        Grundlagen der Numerischen Mathematik und Optimierung #h(1fr) Michael
        van Straten \
        *Lösungen*: Serie #number \
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
    #set enum(numbering: "(a)", indent: 1em)
    #set math.mat(delim: "[")
    #show heading: set block(above: 1.4em, below: 1em)
    #show sym.lt.eq: $lt.eq.slant$
    #show sym.gt.eq: $gt.eq.slant$
    #show math.equation.where(block: true): eq => {
      block(width: 100%, inset: 0pt, align(center, eq))
    }

    #doc
  ]
}
