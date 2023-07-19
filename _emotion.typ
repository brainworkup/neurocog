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


#figure([#image("_emotion_files/figure-typst/fig-emotion-1.svg")],
  caption: [
    Mood/Self-Report
  ]
)
<fig-emotion>

#align(center)[#table(
  columns: 4,
  align: (col, row) => (left,center,center,center,).at(col),
  inset: 6pt,
  [#strong[Scale]], [#strong[Score]], [#strong[‰ Rank]], [#strong[Range]],
  [Somatic Complaints],
  [67],
  [95],
  [Above Average],
  [Conversion],
  [60],
  [84],
  [High Average],
  [Somatization],
  [59],
  [81],
  [High Average],
  [Health Concerns],
  [73],
  [98],
  [Exceptionally High],
  [Anxiety],
  [69],
  [97],
  [Above Average],
  [Cognitive (A)],
  [71],
  [98],
  [Exceptionally High],
  [Affective (A)],
  [73],
  [98],
  [Exceptionally High],
  [Physiological (A)],
  [58],
  [78],
  [High Average],
  [Anxiety-Related Disorders],
  [75],
  [99],
  [Exceptionally High],
  [Obsessive-Compulsive],
  [62],
  [88],
  [High Average],
  [Phobias],
  [51],
  [53],
  [Average],
  [Traumatic Stress],
  [89],
  [99],
  [Exceptionally High],
  [Depression],
  [72],
  [98],
  [Exceptionally High],
  [Cognitive (D)],
  [64],
  [91],
  [Above Average],
  [Affective (D)],
  [74],
  [99],
  [Exceptionally High],
  [Physiological (D)],
  [67],
  [95],
  [Above Average],
  [Mania],
  [68],
  [96],
  [Above Average],
  [Activity Level],
  [63],
  [90],
  [High Average],
  [Grandiosity],
  [67],
  [95],
  [Above Average],
  [Irritability],
  [62],
  [88],
  [High Average],
  [Paranoia],
  [67],
  [95],
  [Above Average],
  [Hypervigilance],
  [51],
  [53],
  [Average],
  [Persecution],
  [75],
  [99],
  [Exceptionally High],
  [Resentment],
  [66],
  [94],
  [Above Average],
  [Schizophrenia],
  [73],
  [98],
  [Exceptionally High],
  [Psychotic Experiences],
  [50],
  [50],
  [Average],
  [Social Detachment],
  [76],
  [99],
  [Exceptionally High],
  [Thought Disorder],
  [73],
  [98],
  [Exceptionally High],
  [Borderline Features],
  [69],
  [97],
  [Above Average],
  [Affective Instability],
  [63],
  [90],
  [High Average],
  [Identity Problems],
  [71],
  [98],
  [Exceptionally High],
  [Negative Relationships],
  [65],
  [93],
  [Above Average],
  [Self-Harm],
  [60],
  [84],
  [High Average],
  [Antisocial Features],
  [53],
  [61],
  [Average],
  [Antisocial Behaviors],
  [45],
  [30],
  [Average],
  [Egocentricity],
  [72],
  [98],
  [Exceptionally High],
  [Stimulus-Seeking],
  [45],
  [30],
  [Average],
  [Aggression],
  [32],
  [3],
  [Below Average],
  [Aggressive Attitude],
  [34],
  [5],
  [Below Average],
  [Verbal Aggression],
  [31],
  [2],
  [Below Average],
  [Physical Aggression],
  [42],
  [21],
  [Low Average],
  [Alcohol Problems],
  [43],
  [24],
  [Low Average],
  [Drug Problems],
  [42],
  [21],
  [Low Average],
  [ALC Estimated Score],
  [57],
  [75],
  [High Average],
  [DRG Estimated Score],
  [56],
  [72],
  [Average],
  [Suicidal Ideation],
  [43],
  [24],
  [Low Average],
  [Stress],
  [64],
  [91],
  [Above Average],
  [Nonsupport],
  [58],
  [78],
  [High Average],
  [Treatment Rejection],
  [31],
  [2],
  [Below Average],
  [Dominance],
  [44],
  [27],
  [Average],
  [Warmth],
  [42],
  [21],
  [Low Average],
)
#align(center, [Mood/Self-Report])
]

```
  [1] "_academics_raw.qmd"    "_academics_text.qmd"   "_academics.qmd"       
  [4] "_adhd_cache"           "_adhd_files"           "_adhd_raw.qmd"        
  [7] "_adhd_text.qmd"        "_adhd.pdf"             "_adhd.qmd"            
 [10] "_adhd.typ"             "_behav_obs_files"      "_behav_obs.html"      
 [13] "_behav_obs.qmd"        "_emotion_cache"        "_emotion_files"       
 [16] "_emotion_raw.qmd"      "_emotion_text.qmd"     "_emotion.pdf"         
 [19] "_emotion.qmd"          "_emotion.rmarkdown"    "_emotion.typ"         
 [22] "_executive_cache"      "_executive_files"      "_executive_raw.qmd"   
 [25] "_executive_text.qmd"   "_executive.pdf"        "_executive.qmd"       
 [28] "_executive.typ"        "_extensions"           "_iq_cache"            
 [31] "_iq_files"             "_iq_raw.qmd"           "_iq_text.qmd"         
 [34] "_iq.pdf"               "_iq.qmd"               "_iq.typ"              
 [37] "_memory_cache"         "_memory_files"         "_memory_raw.qmd"      
 [40] "_memory_text.qmd"      "_memory.pdf"           "_memory.qmd"          
 [43] "_memory.typ"           "_motor_text.qmd"       "_motor.qmd"           
 [46] "_nse_files"            "_nse.html"             "_nse.qmd"             
 [49] "_quarto.yml"           "_recs_files"           "_recs.html"           
 [52] "_recs.qmd"             "_sirf.pdf"             "_sirf.qmd"            
 [55] "_sirf.typ"             "_spatial_cache"        "_spatial_files"       
 [58] "_spatial_raw.qmd"      "_spatial_text.qmd"     "_spatial.pdf"         
 [61] "_spatial.qmd"          "_spatial.typ"          "_verbal_cache"        
 [64] "_verbal_files"         "_verbal_raw.qmd"       "_verbal_text.qmd"     
 [67] "_verbal.pdf"           "_verbal.qmd"           "_verbal.typ"          
 [70] "csv"                   "docs"                  "fig_caars.pdf"        
 [73] "fig_caars.png"         "fig_cefi.pdf"          "fig_cefi.png"         
 [76] "fig_emotion.pdf"       "fig_emotion.png"       "fig_executive.pdf"    
 [79] "fig_executive.png"     "fig_g.pdf"             "fig_g.png"            
 [82] "fig_iq.pdf"            "fig_iq.png"            "fig_memory.pdf"       
 [85] "fig_memory.png"        "fig_spatial.pdf"       "fig_spatial.png"      
 [88] "fig_verbal.pdf"        "fig_verbal.png"        "index_scores.xlsx"    
 [91] "jwt_sig.png"           "LICENSE"               "neurobehav.csv"       
 [94] "neurocog.csv"          "neurocog.Rproj"        "neuropsych.csv"       
 [97] "README.md"             "table_adhd.pdf"        "table_adhd.png"       
[100] "table_emotion.png"     "table_executive.pdf"   "table_executive.png"  
[103] "table_iq.pdf"          "table_iq.png"          "table_memory.pdf"     
[106] "table_memory.png"      "table_spatial.pdf"     "table_spatial.png"    
[109] "table_verbal.pdf"      "table_verbal.png"      "tbl_range.png"        
[112] "template_cache"        "template_files"        "template.qmd"         
[115] "template.typ"          "test_score_ranges.csv" "validity.csv"         
```
