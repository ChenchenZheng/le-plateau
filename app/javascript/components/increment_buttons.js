const incrementButtons = () => {
  const input = document.getElementById('event_nb_players');

  const minusButton = document.querySelector('.minus-btn')
  if(minusButton !== null ) {
    minusButton.addEventListener('click', function() {
      if (parseInt(input.value) > 0) {
        input.value = parseInt(input.value) - 1;
      }
    });
  }

  const plusButton = document.querySelector('.plus-btn');
  if(plusButton !== null) {
    plusButton.addEventListener('click', function() {
      input.value = parseInt(input.value) + 1;
    })
  }
};

export {incrementButtons};
