window.addEventListener("load", () => {
  const links = document.querySelectorAll("a[data-remote]");
  links.forEach((element) => {
    element.addEventListener("ajax:success", (event) => {
      const [data, _status, _xhr] = event.detail;
      let tr = document.querySelector(`[data-rental-id="${element.dataset['id']}"]`)

      tr.remove();
      alert(data);
    });
    element.addEventListener("ajax:error", (event) => {
      const [data, _status, _xhr] = event.detail;

      alert(data);
    });
  });
});