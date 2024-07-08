const tracks = document.querySelectorAll("#album-tracklist > li");
const refreshModalElement = document.getElementById("refresh-modal");
const refreshModal = new bootstrap.Modal(refreshModalElement, {backdrop: "static", keyboard: false});
tracks.forEach(function(item){
    item.addEventListener("click", function(){
        refreshModalElement.addEventListener('shown.bs.modal', () => {
            window.location = this.dataset.url;
            setTimeout(function(){refreshModal.hide();}, 500);
        });
        refreshModal.show();
    });
});
