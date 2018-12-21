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

    document.getElementById("name").innerHTML = instance.returnName.call();

  });

  // getting height
  CatContract.deployed().then(function(instance) {

    document.getElementById("height").innerHTML = instance.returnHeight.call();

  });

  // getting weight
  CatContract.deployed().then(function(instance) {

    document.getElementById("weight").innerHTML = instance.returnWeight.call();

  });

  // getting age
  CatContract.deployed().then(function(instance) {

    document.getElementById("age").innerHTML = instance.returnAge.call();

  });

  // getting energy point
  CatContract.deployed().then(function(instance) {

    document.getElementById("energypoint").innerHTML = instance.returnEnergypoint.call();

  });

  // getting emotion
  CatContract.deployed().then(function(instance) {

    document.getElementById("emotion").innerHTML = instance.returnEmotion.call();

  });

  // getting color
  CatContract.deployed().then(function(instance) {

    document.getElementById("color").innerHTML = instance.returnColor.call();

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
