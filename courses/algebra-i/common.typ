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
        Algebra und Funktionentheorie #h(1fr) Michael van Straten \ *Lösungen*:
        #number. Übungsblatt \
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
    #set enum(numbering: "(a).(i)", indent: 1em)
    #set math.mat(delim: "(")
    #show sym.lt.eq: $lt.eq.slant$
    #show sym.gt.eq: $gt.eq.slant$
    #show math.equation.where(block: true): eq => {
      block(width: 100%, inset: 0pt, align(center, eq))
    }
    #doc
  ]
}


#let aufgabe-counter = counter("aufgabe")
#let aufgabe(body) = block(spacing: 0.65em)[
  #aufgabe-counter.step()
  *Aufgabe #context aufgabe-counter.display().*
  #body
]
