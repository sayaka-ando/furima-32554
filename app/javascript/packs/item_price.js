window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    (inputValue);

    const addTaxDom = document.getElementById('add-tax-price')
    addTaxDom.innerHTML = (Math.floor(inputValue* 0.1));
      console.log(addTaxDom)

      const profitNumber = document.getElementById('profit')
        const addTax = inputValue * 0.1
        console.log(addTax)
        profitNumber.innerHTML = (Math.floor(inputValue - addTax));
          console.log(profitNumber);

  })
});