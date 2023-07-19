#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 10.00002pt
#let large-size = 11.74988pt

#let neuropsych-report(
  title: "", 
  authors: (), 
  date: none,
  // The path to a bibliography file if you want to cite some external
  // works.
  // The article's paper size. Also affects the margins.
  paper-size: "a4",
  bibliography-file: none,
  body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 23mm, right: 25mm, top: 27mm, bottom: 27mm),
    // margin: (top: 117pt, left: 118pt, right: 119pt, bottom: 96pt),
    numbering: ("1/1"),
    number-align: center,
    header: locate(
        loc => if [#loc.page()] == [1] {
            []
        } else {
            [
              #set text(9pt)
              #smallcaps[
               *CONFIDENTIAL*\
               Patient Name
             ]
           ]
        }
    )
)

  // Save heading and body font families in variables.
  let body-font = "Ale­greya"
  let sans-font = "Ale­greya Sans"

  // Set body font family.
  set text(font: body-font, lang: "en", size: 12pt)
  show math.equation: set text(weight: 400)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  show heading: set text(font: sans-font)
    
  // set heading(numbering: "1.a")

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    if it.level > 3 {
      parbreak()
      text(10pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  // Configure lists and links.
  set enum(indent: 10pt, body-indent: 5pt)
  set list(indent: 10pt, body-indent: 5pt)
  show link: set text(font: "New Computer Modern Mono")

  // Configure citation and bibliography styles.
  set cite(style: "numerical", brackets: true)
  set bibliography(style: "apa", title: "References")

  set par(leading: 0.75em)

  // Logo
  block(
    figure(
      image("logo.png"),
    )
)

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
    #v(2.2em, weak: true)
    // #date
  ]

  // Main body.
  set text(hyphenate: true)

  body


}
