// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}



#let article(
  title: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
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
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

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
#show: doc => article(
  cols: 1,
  doc,
)


= Summary and Formulation
<summary-and-formulation>
XXXX is a 28-year-old left-handed female with a history of medically refractory epilepsy who was referred for neuropsychological testing as part of a comprehensive presurgical work-up. General cognitive ability is well within normal limits, and there is no evidence of decline from premorbid estimates. No deficits were detected in the domains of attention, processing speed, motor functioning, or visuospatial skills. Although many aspects of executive functioning, language functioning, and memory were within normal limits, she demonstrated mildly inefficient problem solving and hypothesis testing, weaknesses in word retrieval, and inefficiency in new learning of verbal information. There is no evidence of a mood disorder at this time.

In conclusion, the cognitive profile is mildly localizing and lateralizing as there are elements that suggest relative left temporal involvement. That said, there were features seen during testing that suggested mild frontal systems disruption as well. Although Ms. XXXX lives alone, she has arranged to have her mother stay with her for a week or two after surgery to help her and provide support in the immediate postacute period. She seems to have a good understanding of and appropriate expectations for the surgery. Taken together with her current asymptomatic mood profile, there are no obvious psychological risk factors for a poor outcome or need for presurgical mental health intervention.

= Diagnostic Impression
<diagnostic-impression>
- 315.00 (F81.0) Specific Learning Disorder, With Impairment in Reading (word reading accuracy, reading rate or fluency, reading comprehension)
- 315.2 (F81.81) Specific Learning Disorder, With Impairment in Written Expression (spelling accuracy)
- 314.01 (F90.9) Unspecified Attention-Deficit/Hyperactivity Disorder (ADHD)
