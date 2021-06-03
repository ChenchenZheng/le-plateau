const input = document.getElementById('event_nb_players');

const minusButton = document.querySelector('.minus-btn')
if(minusButton) {
  minusButton.addEventListener('click', function() {
    input.value = parseInt(input.value) - 1;
  });
}

const plusButton = document.querySelector('.plus-btn');
if(plusButton) {
  plusButton.addEventListener('click', function() {
    input.value = parseInt(input.value) + 1;
  })
}
