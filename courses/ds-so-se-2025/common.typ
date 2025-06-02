#let problemset(number) = {
  let author(name, matrikelnummer: "--") = box[
    #name \
    #matrikelnummer
  ]

  let header = pad(y: 1cm, align(center, [
    = Digitale Systeme SS2025 \
    == Abgabe zu Hausaufgaben #number
    #box[
      #author("Fabian Kubala") #h(1fr) #author(
        "David S. Spyra",
        matrikelnummer: 633014,
      ) #h(1fr) #author("Michael van Straten", matrikelnummer: 637986) #h(1fr)
      #author("Steven C.H. Szobries", matrikelnummer: 630097)
    ] \
    #block(above: 1em, line(length: 100%, stroke: 0.5pt))
  ]))

  let margin = 2cm

  doc => context [
    #set text(font: "Helvetica")

    #set page(
      numbering: "1",
      margin: (
        top: measure(width: page.width, header).height,
        rest: margin,
      ),
      header: header,
      header-ascent: 0pt,
    )
    #doc
  ]
}

#let ex-counter = counter("exercise")
#let exercise(points, body) = block(spacing: 0.65em)[
  #ex-counter.step()
  *Aufgabe #context ex-counter.display() #h(1fr) (#points Punkte)*.
  #body
]

