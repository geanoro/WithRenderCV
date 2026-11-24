((* if cv.photo *))
#two-col(
  left-column-width: design-header-photo-width * 1.1,
  right-column-width: 1fr,
  left-content: [
    #align(
      left + horizon,
      image("profile_picture.jpg", width: design-header-photo-width),
    )
  ],
  column-gutter: 0cm,
  right-content: [
((* endif *))
((* if cv.name *))
= <<cv.name|escape_typst_characters>>
((* endif *))
((* if cv.headline *))
#v(-0.45cm)
#align(center)[#text(size: 1.15em)[<<cv.headline|escape_typst_characters>>]]
#v(0.25cm)
((* endif *))

// Print connections:
#let connections-list = (
((* for connection in cv.connections *))
  [((*- if connection["url"] and design.header.make_connections_links -*))
  #box(original-link("<<connection["url"]>>")[
  ((*- endif -*))
  ((*- if design.header.use_icons_for_connections -*))
    #fa-icon("<<connection["typst_icon"]>>", size: 0.9em) #h(0.05cm)
  ((*- endif -*))
  ((*- if not design.header.use_urls_as_placeholders_for_connections or not connection["url"] -*))
    <<connection["placeholder"]|escape_typst_characters>>
  ((*- else -*))
    <<connection["clean_url"]|escape_typst_characters>>
  ((*- endif -*))
  ((*- if connection["url"] and design.header.make_connections_links -*))
  ])
  ((*- endif -*))],
((* endfor *))
)
#connections(connections-list)

((* if cv.key_skills *))
#v(-0.1cm)
#align(center)[#text(weight: "bold")[<<cv.key_skills|escape_typst_characters>>]]
((* endif *))
((* if cv.intro *))
#v(0.3cm)
((* for para in cv.intro.split("\n\n") *))
#block(above: 0cm, below: 0.2cm)[<<para|escape_typst_characters>>]
((* endfor *))
((* endif *))
((* if cv.key_skills or cv.intro *))
#v(0.2cm)
((* endif *))

((* if cv.photo *))
  ],
)
((* endif *))
