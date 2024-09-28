const homeSection = document.getElementById("empty-section");
const addSection = document.getElementById("add-products-section");
const updateSection = document.getElementById("update-products-section");
const deleteSection = document.getElementById("delete-products-section");
const viewOrderSection = document.getElementById("view-orders-section");
const viewProductSection = document.getElementById("view-products-section");



function addFun(){
    homeSection.style.display="none";
    addSection.style.display="block";
    updateSection.style.display="none";
    deleteSection.style.display="none";
    viewOrderSection.style.display="none";
    viewProductSection.style.display="none";
    
}
function removeFun(){
    homeSection.style.display="none";
    addSection.style.display="none";
    updateSection.style.display="none";
    deleteSection.style.display="block";
    viewOrderSection.style.display="none";
    viewProductSection.style.display="none";

}

function updateFun(){
    homeSection.style.display="none";
    addSection.style.display="none";
    updateSection.style.display="block";
    deleteSection.style.display="none";
    viewOrderSection.style.display="none";
    viewProductSection.style.display="none";

}
function showFun(){
    homeSection.style.display="none";
    addSection.style.display="none";
    updateSection.style.display="none";
    deleteSection.style.display="none";
    viewOrderSection.style.display="none";
    viewProductSection.style.display="block";

}
function orderFun(){
    homeSection.style.display="none";
    addSection.style.display="none";
    updateSection.style.display="none";
    deleteSection.style.display="none";
    viewOrderSection.style.display="block";
    viewProductSection.style.display="none";

}

function formSubmit(event){
    event.preventDefault();
}