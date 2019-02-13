/* global axios */

console.log("index.js connected");

axios.get("http://localhost:3000/products").then(function(response) {
  var products = response.data;
  console.log(products);
});