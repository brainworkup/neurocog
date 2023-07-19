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
#show: doc => neurocog(
  title: [NEUROCOGNITIVE EXAMINATION],
  authors: (
    ( name: [Joey Trampush],
      affiliation: [],
      email: [] ),
    ),
  date: [2023-07-19],
  cols: 1,
  doc,
)


#v(2pt, weak: true)
*PATIENT NAME:* Biggie Smalls\
*DATES OF EXAM:* 2023-01-01, 2023-01-01, 2023-01-01 \
= TESTS ADMINISTERED
<tests-administered>
#set list(marker: ([•], [--]))
- Comprehensive Neuropsychiatric Symptom and History Interview
- Conners' Adult ADHD Diagnostic Interview for DSM-IV (CAADID), Part I: History
- Conners' Adult ADHD Rating Scales--Self-Report: Long Version (CAARS--S:L)
- Conners' Adult ADHD Rating Scales--Observer Report: Long Version (CAARS--O:L)
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Self-Report Form
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Observer Form
- Dot Counting Test
- WAIS-IV Coding
- WRAT-5 Word Reading
- Neuropsychological Assessment Battery, Screener (NAB):
  - Attention, Language, Memory, Spatial, and Executive Functions Modules
- NIH Executive Abilities: Measures and Instruments for Neurobehavioral Evaluation and Research (NIH EXAMINER):
  - Unstructured Task, Verbal Fluency, and Behavior Rating Scale
- Rey-Osterrieth Complex Figure Test (ROCFT)
- Trail Making Test
- Personality Assessment Inventory (PAI)
= NEUROBEHAVIORAL STATUS EXAM
<neurobehavioral-status-exam>
== Referral
<referral>
Ms. XXXX was referred for neuropsychological testing as part of a comprehensive presurgical work-up of her epilepsy syndrome. The results will be used in surgical and treatment planning

== Background
<background>
The following information was obtained during an interview with Ms. XXXX and from review of available medical records. Ms. XXXX has a history of seizures since age 14. While they were initially well controlled, in the last 3 years they have become refractory to multiple seizure medications. She currently experiences one to two seizures per week. Seizures are characterized by behavioral and speech arrest, and last approximately 2 minutes. Postictally, she is mildly confused with language disruption, but she returns to baseline in approximately 10 minutes. She is treated with Depakote, Keppra, and Lamictal.

Cognitive complaints: mild memory and word-finding issues over the last 2 years.

=== Past Neuropsychological Test Results
<past-neuropsychological-test-results>
Patient denied having prior testing.

=== Other Medical History
<other-medical-history>
- Frequent sinus infections.
- Other medications: Femcon, folic acid.
- Appetite/weight: Normal, no changes.
- Sleep: Normal, no changes.
- Alcohol/tobacco: No history of abuse; denied current use.

=== Surgical History
<surgical-history>
Sinus surgery.

=== Psychiatric History
<psychiatric-history>
Patient denied.

=== Family History
<family-history>
Patient denied a family history of neurological conditions. Her brother was diagnosed with ADHD.

=== Cultural/Social Background
<culturalsocial-background>
Ms. XXXX is a Caucasian female who was born and raised in XXXX. She is single, never married, and has no children.

=== Educational History
<educational-history>
Ms. XXXX graduated from college and completed some Master’s-level courses. She did not endorse any difficulties with advancing through school.

=== Occupational History
<occupational-history>
Ms. XXXX has worked full time as an administrator in a small company. She has maintained this job for the past 6 years.

= NEUROCOGNITIVE FINDINGS
<neurocognitive-findings>
== Behavioral Observations
<behavioral-observations>
- #emph[Appearance:] Appropriate grooming and dress for context.
- #emph[Behavior/attitude:] Cooperative, engaged.
- #emph[Speech/language:] Fluent and normal in rate, volume, and prosody.
- #emph[Mood/affect:] Neutral, range was full and appropriate.
- #emph[Sensory/motor:] Performance was not limited by any obvious sensory or motor difficulties.
- #emph[Cognitive process:] Coherent and goal directed.
- #emph[Motivation/effort:] Normal.

== Intelligence/General Ability
<intelligencegeneral-ability>
<qtbl-iq>
#figure([#image("table_iq.png", width: 70%)],
  caption: [
    Composite intellectual and neuropsychological index scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-iq-1.svg")],
  caption: [
    #emph[General Ability] refers to an overall capacity to reason, to solve problems, and to learn useful information. #emph[Crystallized Knowledge] refers to the ability to learn and use language to reason and understand how the world works. #emph[Fluid Reasoning] refers to the ability to use logical reasoning to figure things out without being told exactly how things work, analyze and solve novel problems, identify patterns and relationships that underpin these problems, and apply logic.
  ]
)
<fig-iq>

== Academic Skills
<academic-skills>
== Verbal/Language
<verballanguage>
<qtbl-verbal>
#figure([#image("table_verbal.png", width: 70%)],
  caption: [
    Language processing test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-verbal-1.svg")],
  caption: [
    Verbal/Language refers to the ability to access and apply acquired word knowledge, to verbalize meaningful concepts, to understand complex multistep instructions, to think about verbal information, and to express oneself using words.
  ]
)
<fig-verbal>

== Visual Perception/Construction
<visual-perceptionconstruction>
<qtbl-spatial>
#figure([#image("table_spatial.png", width: 70%)],
  caption: [
    Visuospatial processing test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
== Attention/Executive
<attentionexecutive>
<qtbl-executive>
#figure([#image("table_executive.png", width: 70%)],
  caption: [
    Attention and executive functioning test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-executive-1.svg", width: 70%)],
  caption: [
    Attentional and executive functions underlie most, if not all, domains of cognitive performance. These are behaviors and skills that allow individuals to successfully carry-out instrumental and social activities, academic work, engage with others effectively, problem solve, and successfully interact with the environment to get needs met.
  ]
)
<fig-executive>

== Memory
<memory>
<qtbl-memory>
#figure([#image("table_memory.png", width: 70%)],
  caption: [
    Learning and memory test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-memory-1.svg")],
  caption: [
    #emph[Learning and memory] refer to the rate and ease with which new information (e. g., facts, stories, lists, faces, names) can be encoded, stored, and later recalled from long-term memory.
  ]
)
<fig-memory>

== ADHD/Executive Functioning
<adhdexecutive-functioning>
<qtbl-adhd>
#figure([#image("table_adhd.png", width: 70%)],
  caption: [
    CAARS and CEFI ADHD rating scales
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-adhd-1.svg")],
  caption: [
    Attention and executive functions are multidimensional concepts that contain several related processes. Both concepts require self-regulatory skills and have some common subprocesses; therefore, it is common to treat them together, or even to refer to both processes when talking about one or the other.
  ]
)
<fig-adhd>

== Emotional/Behavioral/Personality
<emotionalbehavioralpersonality>
<qtbl-emotion>
#figure([#image("table_emotion.png", width: 70%)],
  caption: [
    Behavioral, Personality, and Emotional Functioning
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-emotion-1.svg")],
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

#pagebreak()
= SUMMARY/IMPRESSION
<summaryimpression>
#figure([#image("template_files/figure-typst/fig-domain-plot-1.svg")],
  caption: [
    #emph[Note:] #emph[z]-scores have a mean of 0 and a standard deviation of 1.
  ]
)
<fig-domain-plot>

== Summary and Formulation
<summary-and-formulation>
XXXX is a 28-year-old left-handed female with a history of medically refractory epilepsy who was referred for neuropsychological testing as part of a comprehensive presurgical work-up. General cognitive ability is well within normal limits, and there is no evidence of decline from premorbid estimates. No deficits were detected in the domains of attention, processing speed, motor functioning, or visuospatial skills. Although many aspects of executive functioning, language functioning, and memory were within normal limits, she demonstrated mildly inefficient problem solving and hypothesis testing, weaknesses in word retrieval, and inefficiency in new learning of verbal information. There is no evidence of a mood disorder at this time.

In conclusion, the cognitive profile is mildly localizing and lateralizing as there are elements that suggest relative left temporal involvement. That said, there were features seen during testing that suggested mild frontal systems disruption as well. Although Ms. XXXX lives alone, she has arranged to have her mother stay with her for a week or two after surgery to help her and provide support in the immediate postacute period. She seems to have a good understanding of and appropriate expectations for the surgery. Taken together with her current asymptomatic mood profile, there are no obvious psychological risk factors for a poor outcome or need for presurgical mental health intervention.

== Diagnostic Impression
<diagnostic-impression>
- 315.00 (F81.0) Specific Learning Disorder, With Impairment in Reading (word reading accuracy, reading rate or fluency, reading comprehension)
- 315.2 (F81.81) Specific Learning Disorder, With Impairment in Written Expression (spelling accuracy)
- 314.01 (F90.9) Unspecified Attention-Deficit/Hyperactivity Disorder (ADHD)

= RECOMMENDATIONS
<recommendations>
== Recommendations for Medical/Healthcare
<recommendations-for-medicalhealthcare>
- Rec 1
- Rec 2
- Rec 3

== Recommendations for School
<recommendations-for-school>
- Rec 1
- Rec 2
- Rec 3

== Recommendations for Home/Family
<recommendations-for-homefamily>
- Rec 1
- Rec 2
- Rec 3

== Recommendations for Follow-Up Evaluation
<recommendations-for-follow-up-evaluation>
- Follow-up assessment is not recommended at this time unless further concerns arise that need to be addressed.

- Follow-up assessment in 12-18 months is recommended to gauge (ref:first-name)’s progress and to assess the impact of the above interventions, unless further concerns arise that need to be addressed sooner.

It was a pleasure to work with Mr. Smalls. Please contact me with any questions or concerns regarding this patient.

Sincerely,

#image("jwt_sig.png", width: 20%)

#strong[Joey W. Trampush, Ph.D.] \
Assistant Professor of Psychiatry \
Department of Psychiatry and the Behavioral Sciences \
University of Southern California Keck School of Medicine \
CA License PSY29212

#pagebreak()
= APPENDIX
<appendix>
== Test Selection Procedures
<test-selection-procedures>
Neuropsychological tests are intrinsically performance-based, and cognitive performance assessed during this neuropsychological evaluation is summarized above. Where appropriate, qualitative observations are included. Cultural considerations were made when selecting measures, interpreting results, and making diagnostic impressions and recommendations. Results from formal tests are reported in comparison to other individuals the same age, sex, and educational level as range of functioning (e.g., below average, average, above average). Test score labels are intended solely to be descriptive, identifying positions of scores relative to a normal curve distribution, and should be interpreted within the context of the patient’s individual presentation and history. Although standardized scores provide the clinician with an important and necessary understanding of the patient’s test performance compared with a normative group, they do not on their own lead to accurate diagnosis or treatment recommendations.

== Conversion of Test Scores
<conversion-of-test-scores>



