const yButton = document.querySelector('#btn-y');
const xButton = document.querySelector('#btn-x');
const ySelect = document.querySelector('#select-y');
const xSelect = document.querySelector('#select-x');

yButton.addEventListener('click', (event) =>{
  yButton.disabled = true;
  yButton.classList.add('clicked');
  ySelect.disabled = true;
})

xButton.addEventListener('click', (event) =>{
  xButton.disabled = true;
  xButton.classList.add('clicked');
  xSelect.disabled = true;
})
