﻿xo.listener.on(`change::@state:active`, function({document}) {
    let selections = document.select(`//@state:active`)
    let other_selections = selections.filter(attr => attr !== this)
    other_selections.remove()    
})

function buscarEstudio() {
  event.preventDefault(); // 🔹 evita el postback
  location.href = event.target.action;
}