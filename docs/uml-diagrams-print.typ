// PQ-BMS — UML Diagrams Print
// Auto-generated Typst document for full-page UML diagram printing

#set text(font: "Helvetica", size: 12pt)

// ── Title Page (portrait) ──
#page(paper: "a4", margin: 1cm)[
  #align(center + horizon)[
    #text(size: 28pt, weight: "bold")[PQ-BMS]
    #v(0.5cm)
    #text(size: 18pt)[UML Diagrams]
    #v(1cm)
    #text(size: 12pt, fill: luma(100))[Black Sphere Industries]
    #v(0.3cm)
    #text(size: 10pt, fill: luma(140))[Generated #datetime.today().display()]
  ]
]

// ── Architecture Diagram (landscape: 4993x1398) ──
#page(paper: "a4", margin: 1cm, flipped: true)[
  #text(size: 9pt, fill: luma(100))[Architecture Diagram]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-architecture.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── Class Diagram (portrait: 1936x3112) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Class Diagram]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-class-diagram.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── All Diagrams Overview (landscape: 11815x4321) ──
#page(paper: "a4", margin: 1cm, flipped: true)[
  #text(size: 9pt, fill: luma(100))[All Diagrams Overview]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-diagrams.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── Sequence — Main (portrait: 1786x4141) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Sequence Diagram — Main]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-seq-main.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── Sequence — Secondary (portrait: 1609x3461) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[Sequence Diagram — Secondary]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-seq-secondary.svg", fit: "contain", width: 100%, height: 100%)
  ]
]

// ── State Diagram (portrait: 1316x2075) ──
#page(paper: "a4", margin: 1cm, flipped: false)[
  #text(size: 9pt, fill: luma(100))[State Diagram]
  #v(0.15cm)
  #block(width: 100%, height: 1fr)[
    #image("uml-states.svg", fit: "contain", width: 100%, height: 100%)
  ]
]
