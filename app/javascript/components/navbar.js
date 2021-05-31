const addClassActive = () => {
  const accueil = document.getElementById("accueil");
  const events = document.getElementById("events");
  const newEvent = document.getElementById("new-event");
  const currentUrl = window.location.href;
  
  if (accueil.href === currentUrl) {
    accueil.classList.add("active");
  }
  
  if (events.href === currentUrl) {
    events.classList.add("active");
  }
  
  if (newEvent.href === currentUrl) {
    newEvent.classList.add("active");
  }
}

export { addClassActive };
