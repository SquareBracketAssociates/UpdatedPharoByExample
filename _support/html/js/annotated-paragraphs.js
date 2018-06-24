function transformAnnotatedParagraphs(pClass, pTitle) {
    $("p." + pClass).wrap( "<div class='annotated-paragraph "
                           + pClass + "' />" ).prepend("<h4>"+ pTitle +"</h4>");
}

transformAnnotatedParagraphs("note", "Note");
transformAnnotatedParagraphs("todo", "To do");
