const dynamicTabs = () => {
  const onglets = document.querySelectorAll('.onglets')
  onglets.forEach(onglet => {
    onglet.addEventListener('click', () => {
      document.querySelector(".active-tab").classList.remove("active-tab")
      document.querySelector(".active-content").classList.add("inactive-content")
      document.querySelector(".active-content").classList.remove("active-content")

      onglet.classList.add("active-tab")
      const dataAnim = parseInt(onglet.dataset.anim)
      document.querySelectorAll(".content")[dataAnim - 1].classList.add("active-content")
      document.querySelectorAll(".content")[dataAnim - 1].classList.remove("inactive-content")
    })
  })
}
export { dynamicTabs };
