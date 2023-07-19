// #let script-size = 7.97224pt
// #let footnote-size = 8.50012pt
// #let small-size = 9.24994pt
// #let normal-size = 10.00002pt
// #let large-size = 11.74988pt

#let neurocog(
  title: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "a4",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    // margin: (left: 23mm, right: 25mm, top: 27mm, bottom: 27mm),
    numbering: ("1/1"),
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
  set par(justify: true)
  // set text(lang: lang,
  //          region: region,
  //          font: font,
  //          size: fontsize)
  set heading(numbering: sectionnumbering)


  // Save heading and body font families in variables.
  let body-font = "Ale­greya"
  let sans-font = "Ale­greya Sans"

  // Set body font family.
  set text(font: body-font, lang: "en", size: 12pt)
  show math.equation: set text(weight: 400)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)

  show heading: set text(font: sans-font)


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


  // Logo
  block(
    figure(
      image("logo.png"),
    )
)

  // Title row.
  // align(center)[
  //   #block(text(font: sans-font, weight: 700, 1.75em, title))
  //   #v(2.2em, weak: true)
  // ]

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[Abstract] #h(1em) #abstract
    ]
  }

  if toc {
    block(above: 0em, below: 2em)[
    #outline(
      title: auto,
      depth: none
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
