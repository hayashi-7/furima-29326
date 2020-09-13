function tax () {
  const addTaxPrice = document.getElementById('add-tax-price');
  const ItemPrice = document.getElementById("item-price");
  const profit = document.getElementById("profit");
    ItemPrice.addEventListener('input',()  => {
      let value = ItemPrice.value
        addTaxPrice.innerHTML = Math.floor(value * 0.1)
        profit.innerHTML = Math.floor(value * 0.9)
        });
};
window.addEventListener("load", tax)