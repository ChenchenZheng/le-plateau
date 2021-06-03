const input = document.getElementById('event_nb_players');

const minusButton = document.querySelector('.minus-btn');
minusButton.addEventListener('click', function() {
  input.value = parseInt(input.value) - 1
})

const plusButton = document.querySelector('.plus-btn')
plusButton.addEventListener('click', function() {
  input.value = parseInt(input.value) + 1
})
