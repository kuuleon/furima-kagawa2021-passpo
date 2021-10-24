window.addEventListener('load', () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const priceInput = document.getElementById("item-price");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address[number]"),
      cvc: formData.get("address[cvc]"),
      exp_month: formData.get("address[exp_month]"),
      exp_year: `20${formData.get("address[exp_year]")}`,
    };
 
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
      const addPofitDom = document.getElementById("profit");
      addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
  });
 })
});


