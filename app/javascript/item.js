function price(){
  const priceInput = document.getElementById("item-price");
  const fee = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
    priceInput.addEventListener('keyup', () => {
        const value = priceInput.value;

      if (value >= 300 && value <= 9999999){
        const tax = value * 0.1
        const realProfit = value - tax
        fee.innerHTML = Math.round(tax);
        profit.innerHTML = Math.round(realProfit);
    } else {
      const tax = '-';
      const realProfit = '-';
      fee.innerHTML = tax;
      profit.innerHTML = realProfit;
    }
  });

}
window.addEventListener('load', price);