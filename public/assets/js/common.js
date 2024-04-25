"use strict";

const q = document.getElementById("q");
const searchTrigger = document.getElementById("header-search");
const searchModalElement = document.getElementById('search-modal');
const searchModal = new bootstrap.Modal(searchModalElement);

/**
 * BUSCADOR
*/
searchTrigger.addEventListener("click", (e) => {
    searchModal.show();
});
searchModalElement.addEventListener("shown.bs.modal", e => {
    q.focus();
});
searchModalElement.addEventListener("hide.bs.modal", e => {
    q.value = "";
});

/*
window.addEventListener("load", (event) => {
});
*/