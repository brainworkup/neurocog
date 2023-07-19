#show: neuropsych-report.with(
$if(title)$
  title: "$title$",
$endif$

$if(date)$
  title: "$date$",
$endif$

$if(by-author)$
   authors: (
  $for(by-author)$
  (
    name: "$it.name.literal$",
    email: "$it.email$",
    url: "$it.url$",
    $for(it.affiliations/first)$department: [$it.department$],
    organization: [$it.name$],
    location: [$it.city$, $it.region$ $it.postal-code$],
    $endfor$
  )$sep$,
  $endfor$,
  ),
$endif$

$if(bibliography)$
  bibliography-file: "$bibliography$",
$endif$

)
