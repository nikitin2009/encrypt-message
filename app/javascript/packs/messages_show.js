import SimpleCrypto from "simple-crypto-js";

document.addEventListener("turbolinks:load", () => {
  const form = document.getElementById("pass_form");
  
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const error_msg_el = document.getElementById("error_explanation");
    const msg_el = document.getElementById("message");

    const password = form.elements.password.value;

    const simpleCrypto = new SimpleCrypto(password);
    const decrypted_msg = simpleCrypto.decrypt(msg_el.innerText);

    if (decrypted_msg) {
      msg_el.innerText = decrypted_msg;
      msg_el.classList.remove("hidden");
      form.classList.add("hidden");
      error_msg_el.innerText = "";
    } else {
      error_msg_el.innerText = "Wrong password!";
    }
  });

});
