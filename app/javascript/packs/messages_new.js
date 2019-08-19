import SimpleCrypto from "simple-crypto-js";

document.addEventListener("turbolinks:load", () => {
  const form = document.getElementById("new_message");
  
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const error_msg_el = document.getElementById("error_explanation");
    const password = form.elements.password.value;
    const password_confirmation = form.elements.password_confirmation.value;
    const msg = form.elements.message_enc_body.value;

    if (msg && password === password_confirmation) {
      const simpleCrypto = new SimpleCrypto(password);
      const encrypted_msg = simpleCrypto.encrypt(msg);
      form.elements.message_enc_body.value = encrypted_msg;
      form.submit();
    } else {
      error_msg_el.innerHTML = "";
      if (!msg) {
        error_msg_el.innerHTML += "<p>Message can't be blank</p>";
      }
      if (password !== password_confirmation) {
        error_msg_el.innerHTML += "<p>Passwords don't match</p>";
      }
    }
  });

  form.querySelectorAll("input, textarea").forEach(el => {
    el.addEventListener("input", () => {
      form.elements.commit.disabled = false;
    })
  });
});
