// Import the page's CSS. Webpack will know what to do with it.
import "../stylesheets/app.css";

// Import libraries we need.
import { default as Web3} from 'web3';
import { default as contract } from 'truffle-contract'

// Import our contract artifacts and turn them into usable abstractions.
import cat_artifacts from '../../build/contracts/cat.json'

// var json = require("./build/contracts/cat.json");
// var contract = require("truffle-contract");
var CatContract = contract(cat_artifacts);

// MyContract.setProvider(new Web3.providers.HttpProvider("http://127.0.0.1:8545"));
window.onload = function() {
  
  window.web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
	CatContract.setProvoder(web3.currentProvider);

  // getting the name
  CatContract.deployed().then(function(instance) {

    return instance.returnName.call();

  }).then(function(value) {

    document.getElementById("name").innerHTML = value.valueOf();

  }).catch(function(e) {
    console.log(e);
  });

  // getting height
  CatContract.deployed().then(function(instance) {

    return instance.returnHeight.call();

  }).then(function(value) {

    document.getElementById("height").innerHTML = value.valueOf();

  }).catch(function(e) {
    console.log(e);
  });

  // getting weight
  CatContract.deployed().then(function(instance) {

    return instance.returnWeight.call();

  }).then(function(value) {

    document.getElementById("weight").innerHTML = value.valueOf();

  }).catch(function(e) {
    console.log(e);
  });

  // getting age
  CatContract.deployed().then(function(instance) {

    return instance.returnAge.call();

  }).then(function(value) {

    document.getElementById("age").innerHTML = value.valueOf();

  }).catch(function(e) {
    console.log(e);
  });

  // getting energy point
  CatContract.deployed().then(function(instance) {  

    return instance.returnEnergypoint.call();

  }).then(function(value) {

    document.getElementById("energypoint").innerHTML = value.valueOf();

  }).catch(function(e) {
    console.log(e);
  });

  // getting emotion
  CatContract.deployed().then(function(instance) {  

    return instance.returnEmotion.call();

  }).then(function(value) {

    document.getElementById("emotion").innerHTML = value.valueOf();
    
  }).catch(function(e) {
    console.log(e);
  });

  // getting color
  CatContract.deployed().then(function(instance) {  

    return instance.returnColor.call();

  }).then(function(value) {

    document.getElementById("color").innerHTML = value.valueOf();
    
  }).catch(function(e) {
    console.log(e);
  });

}

window.run = function() {

  CatContract.deployed().then(function(instance) {

    instance.run();

  });

}

window.fishing = function() {

  CatContract.deployed().then(function(instance) {

    instance.fishing();

  });

}

window.sleep = function() {

  CatContract.deployed().then(function(instance) {

    instance.sleep();

  });

}

window.sports = function() {

  CatContract.deployed().then(function(instance) {

    instance.sports();

  });

}

window.playwith = function() {

  CatContract.deployed().then(function(instance) {

    instance.playwith();

  });

}

window.grow = function() {

  CatContract.deployed().then(function(instance) {

    instance.grow();

  });

}

window.kill = function() {

  CatContract.deployed().then(function(instance) {

    instance.kill();

  });

}
