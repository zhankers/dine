(function($) {
  'use strict';
var dataSet = [
    [ "40521","  <img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>pizza",  "5421", "In Stock", "$32", "<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "98521", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>shake", "8422", "In Stock", "$17","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "45454", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Burger",  "1562", "In Stock", "$86","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "12121", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Noodels",  "6224", "In Stock", "$43","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "56454", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>cake",  "5407", "Out Of Stock", "$16","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "25252", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'> Sandwich", "4804", "In Stock", "$37","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45454", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Spicy Sandwich", "9608", "Out Of Stock", "$13","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "64541", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Peri Peri Fries",  "6200", "In Stock", "$32" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56562", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Pasta",  "2360", "In Stock", "$20" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "51558", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Nachos",  "1667", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "55841", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Mexican Pizza", "3814", "Out Of Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "55811", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'> Pastries",  "9497", "In Stock", "$34","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "01475", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>French Fries",  "6741", "In Stock", "$47" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "55454", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'> Munchurian",  "3597", "In Stock", "$31" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "12145", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Garlic Bread", "1965", "Out Of Stock", "$3","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "52351", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'> Spaghetti",  "1581", "In Stock", "$19","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45823", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Mix Sause Pasta",  "3059", "In Stock", "$7","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "98541", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Fried Egg Sandwich ",  "1721", "In Stock", "$23" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "22366", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Multigrain Hot Cereal",  "2558", "Out Of Stock", "$13" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56465", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Spicy Sandwich",  "2290", "In Stock", "$21","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "34256", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>shake",  "1937", "In Stock", "$34" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "45484", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Dim sum",  "6154", "In Stock", "$6","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "41028", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>spicy chicken soupe ",  "8330", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "15485", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Baked Nachos",  "3023", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "48568", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Spaghetti",  "5797", "In Stock", "$1,2","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45815", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Munchurian",  "8822", "In Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "46542", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Noodels",  "9239", "In Stock", "$35","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "65412", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Fried Egg Sandwich",  "1314", "In Stock", "$20","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "89658", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Hot Cereal",  "2947", "In Stock", "$8","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "02351", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>French Crostini",  "8899", "In Stock", "$16" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56212", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Spicy Noodels",  "2769", "Out Of Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "78065", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Lemon Yogurt Parfait", "6832", "In Stock", "$11" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56121", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Potato Fries",  "3606", "In Stock", "$14","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "14526", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Lemon Rice",  "2860", "In Stock", "$21" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "15451", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Fried Rice",  "8240", "In Stock", "$32","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "14451", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>pizza",  "5384", "Out Of Stock", "$85","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ]
  ];


var dataSet2 = [
    [ "40521","  <img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>pizza",  "5421", "In Stock", "$32", "<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "98521", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>shake", "8422", "In Stock", "$17","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "45454", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Burger",  "1562", "In Stock", "$86","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "12121", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Noodels",  "6224", "In Stock", "$43","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "56454", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>cake",  "5407", "Out Of Stock", "$16","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "25252", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'> Sandwich", "4804", "In Stock", "$37","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45454", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Spicy Sandwich", "9608", "Out Of Stock", "$13","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "64541", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Peri Peri Fries",  "6200", "In Stock", "$32" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56562", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Pasta",  "2360", "In Stock", "$20" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "51558", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Nachos",  "1667", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "55841", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Mexican Pizza", "3814", "Out Of Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "55811", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'> Pastries",  "9497", "In Stock", "$34","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "01475", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>French Fries",  "6741", "In Stock", "$47" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "55454", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'> Munchurian",  "3597", "In Stock", "$31" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "12145", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Garlic Bread", "1965", "Out Of Stock", "$3","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "52351", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'> Spaghetti",  "1581", "In Stock", "$19","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45823", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Mix Sause Pasta",  "3059", "In Stock", "$7","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "98541", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Fried Egg Sandwich ",  "1721", "In Stock", "$23" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "22366", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Multigrain Hot Cereal",  "2558", "Out Of Stock", "$13" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56465", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Spicy Sandwich",  "2290", "In Stock", "$21","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "34256", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>shake",  "1937", "In Stock", "$34" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "45484", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Dim sum",  "6154", "In Stock", "$6","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "41028", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>spicy chicken soupe ",  "8330", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "15485", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Baked Nachos",  "3023", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "48568", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Spaghetti",  "5797", "In Stock", "$1,2","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45815", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Munchurian",  "8822", "In Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "46542", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Noodels",  "9239", "In Stock", "$35","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "65412", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Fried Egg Sandwich",  "1314", "In Stock", "$20","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "89658", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Hot Cereal",  "2947", "In Stock", "$8","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "02351", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>French Crostini",  "8899", "In Stock", "$16" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56212", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Spicy Noodels",  "2769", "Out Of Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "78065", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Lemon Yogurt Parfait", "6832", "In Stock", "$11" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56121", "<img src='../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Potato Fries",  "3606", "In Stock", "$14","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "14526", "<img src='../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Lemon Rice",  "2860", "In Stock", "$21" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "15451", "<img src='../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Fried Rice",  "8240", "In Stock", "$32","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "14451", "<img src='../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>pizza",  "5384", "Out Of Stock", "$85","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ]
  ];



var dataSet1= [
    [ "40521", "<img src='../../assets/img/costic/customer-1.jpg' style='width:50px; height:30px;'> Merry",  "Hall Street", "kbc@gfail.com", " Garlic Bread" ,"$43"],
    [ "98521", "<img src='../../assets/img/costic/customer-2.jpg' style='width:50px; height:30px;'> Joe",  "Hall Street", "lbc@gfail.com", " Pizza" ,"$48"],
    [ "45454", "<img src='../../assets/img/costic/customer-3.jpg' style='width:50px; height:30px;'> Bella",  "Huston Loan", "abc@gfail.com", " Burger" ,"$43" ],
    [ "12121", "<img src='../../assets/img/costic/customer-4.jpg' style='width:50px; height:30px;'> Herry",  "Jk Road", "ghj@gfail.com", " Burger","$56" ],
    [ "56454", "<img src='../../assets/img/costic/customer-5.jpg' style='width:50px; height:30px;'> Joe",  "Hall Street", "abc@gfail.com", "Garlic Bread" ,"$43" ],
    [ "25252", "<img src='../../assets/img/costic/customer-6.jpg' style='width:50px; height:30px;'> Dum sum",  "Hall Street", "bbc@gfail.com", " Pizza" ,"$43" ],
    [ "45454", "<img src='../../assets/img/costic/customer-7.jpg' style='width:50px; height:30px;'> Herry",  "New York", "ghj@gfail.com", " Garlic Bread","$56" ],
    [ "64541", "<img src='../../assets/img/costic/customer-8.jpg' style='width:50px; height:30px;'> Herry",  "Jk Road", "khj@gfail.com", " Garlic Bread","$56"],
    [ "56562", "<img src='../../assets/img/costic/customer-9.jpg' style='width:50px; height:30px;'> Bella",  "Hall Street", "lhj@gfail.com", " Garlic Bread","$36"],
    [ "51558", "<img src='../../assets/img/costic/customer-10.jpg' style='width:50px; height:30px;'> Merry",  "Hall Street", "ihj@gfail.com", " Pizza","$56"],
    [ "55841", "<img src='../../assets/img/costic/customer-1.jpg' style='width:50px; height:30px;'> Herry",  "JK Road", "mhj@gfail.com", " Garlic Bread","$56" ],
    [ "55811", "<img src='../../assets/img/costic/customer-2.jpg' style='width:50px; height:30px;'> Max",  "Hall Street", "ghj@gfail.com", " Noodles","$56" ],
    [ "01475", "<img src='../../assets/img/costic/customer-3.jpg' style='width:50px; height:30px;'>  Joe",  "Street 21", "dhj@gfail.com", " Sandwich","$46"],
    [ "55454", "<img src='../../assets/img/costic/customer-4.jpg' style='width:50px; height:30px;'> Max",  "Street 21", "bhj@gfail.com", " Sandwich","$46"],
    [ "12145", "<img src='../../assets/img/costic/customer-5.jpg' style='width:50px; height:30px;'> Bella",  "Huston Loan", "abc@gfail.com", " Burger" ,"$43" ],
    [ "52351", "<img src='../../assets/img/costic/customer-6.jpg' style='width:50px; height:30px;'> Herry",  "Jk Road", "ghj@gfail.com", " Burger","$56" ],
    [ "45823", "<img src='../../assets/img/costic/customer-7.jpg' style='width:50px; height:30px;'> Joe",  "Jk Road", "abc@gfail.com", " Burger" ,"$43" ],
    [ "98541", "<img src='../../assets/img/costic/customer-8.jpg' style='width:50px; height:30px;'> Merry",  "Hall Street", "kbc@gfail.com", " Garlic Bread" ,"$43" ],
    [ "22366", "<img src='../../assets/img/costic/customer-9.jpg' style='width:50px; height:30px;'> Bella",  "Huston Loan", "abc@gfail.com", " Burger" ,"$43"],
    [ "56465", "<img src='../../assets/img/costic/customer-10.jpg' style='width:50px; height:30px;'> Jake",  "Huston Loan", "abc@gfail.com", " Burger" ,"$43"  ],
    [ "34256", "<img src='../../assets/img/costic/customer-1.jpg' style='width:50px; height:30px;'> Joe",  "Jk Road", "abc@gfail.com", " Sandwich" ,"$43"],
    [ "45484", "<img src='../../assets/img/costic/customer-2.jpg' style='width:50px; height:30px;'> Dum sum",  "Hall Street", "bbc@gfail.com", "  Pizza" ,"$43" ],
    [ "41028","<img src='../../assets/img/costic/customer-3.jpg' style='width:50px; height:30px;'> Dum sum",  "Hall Street", "bbc@gfail.com", " Pizza" ,"$43" ],
    [ "15485", "<img src='../../assets/img/costic/customer-4.jpg' style='width:50px; height:30px;'> Herry",  "Jk Road", "ghj@gfail.com", " Burger","$56"],
    [ "48568", "<img src='../../assets/img/costic/customer-5.jpg' style='width:50px; height:30px;'> Bella",  "Hall Street", "lhj@gfail.com", " Garlic Bread","$36" ],
    [ "45815", "<img src='../../assets/img/costic/customer-6.jpg' style='width:50px; height:30px;'> Joe",  "Jk Road", "abc@gfail.com", "Sandwich" ,"$43"  ],
    [ "46542", "<img src='../../assets/img/costic/customer-7.jpg' style='width:50px; height:30px;'> Joe",  "Jk Road", "abc@gfail.com", "Egg Sandwich" ,"$43"  ],
    [ "65412", "<img src='../../assets/img/costic/customer-8.jpg' style='width:50px; height:30px;'> Joe",  "Hall Street", "lbc@gfail.com", "  Pizza" ,"$54" ],
    [ "89658", "<img src='../../assets/img/costic/customer-9.jpg' style='width:50px; height:30px;'> Herry",  "Jk Road", "ghj@gfail.com", " Burger","$56" ],
    [ "02351", "<img src='../../assets/img/costic/customer-10.jpg' style='width:50px; height:30px;'> Max",  "Hall Street", "ghj@gfail.com", " Noodles","$56"],
    [ "56212", "<img src='../../assets/img/costic/customer-1.jpg' style='width:50px; height:30px;'> Herry",  "New York", "ghj@gfail.com", " Garlic Bread","$56" ],
    [ "78065", "<img src='../../assets/img/costic/customer-2.jpg' style='width:50px; height:30px;'> Herry",  "New York", "ahj@gfail.com", " French Fries","$56"],
    [ "56121", "<img src='../../assets/img/costic/customer-3.jpg' style='width:50px; height:30px;'> Herry",  "New York", "ghj@gfail.com", " French Fries","$56" ],
    [ "14526", "<img src='../../assets/img/costic/customer-4.jpg' style='width:50px; height:30px;'> Lulia",  "Street 21", "ehj@gfail.com", " Pizza","$56"],
    [ "15451", "<img src='../../assets/img/costic/customer-5.jpg' style='width:50px; height:30px;'> Max",  "Hall Street", "ghj@gfail.com", "  Noodles","$56" ],
    [ "14451", "<img src='../../assets/img/costic/customer-6.jpg' style='width:50px; height:30px;'> Dum sum",  "Hall Street", "bbc@gfail.com", " Pizza" ,"$43" ]
  ];

   var dataSet6 = [
    [ "40521","  <img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>pizza",  "5421", "In Stock", "$32", "<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "98521", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>shake", "8422", "In Stock", "$17","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "45454", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Burger",  "1562", "In Stock", "$86","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "12121", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Noodels",  "6224", "In Stock", "$43","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "56454", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>cake",  "5407", "Out Of Stock", "$16","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "25252", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'> Sandwich", "4804", "In Stock", "$37","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45454", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Spicy Sandwich", "9608", "Out Of Stock", "$13","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "64541", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Peri Peri Fries",  "6200", "In Stock", "$32" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56562", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Pasta",  "2360", "In Stock", "$20" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "51558", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Nachos",  "1667", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "55841", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Mexican Pizza", "3814", "Out Of Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "55811", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'> Pastries",  "9497", "In Stock", "$34","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "01475", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>French Fries",  "6741", "In Stock", "$47" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "55454", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'> Munchurian",  "3597", "In Stock", "$31" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "12145", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Garlic Bread", "1965", "Out Of Stock", "$3","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "52351", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'> Spaghetti",  "1581", "In Stock", "$19","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45823", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Mix Sause Pasta",  "3059", "In Stock", "$7","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "98541", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Fried Egg Sandwich ",  "1721", "In Stock", "$23" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "22366", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Multigrain Hot Cereal",  "2558", "Out Of Stock", "$13" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56465", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Spicy Sandwich",  "2290", "In Stock", "$21","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "34256", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>shake",  "1937", "In Stock", "$34" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "45484", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Dim sum",  "6154", "In Stock", "$6","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "41028", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>spicy chicken soupe ",  "8330", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "15485", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Baked Nachos",  "3023", "In Stock", "$10" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "48568", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Spaghetti",  "5797", "In Stock", "$1,2","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "45815", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Munchurian",  "8822", "In Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "46542", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>Noodels",  "9239", "In Stock", "$35","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "65412", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Fried Egg Sandwich",  "1314", "In Stock", "$20","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "89658", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Hot Cereal",  "2947", "In Stock", "$8","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "02351", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>French Crostini",  "8899", "In Stock", "$16" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56212", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Spicy Noodels",  "2769", "Out Of Stock", "$9","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "78065", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Lemon Yogurt Parfait", "6832", "In Stock", "$11" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "56121", "<img src='../../assets/img/costic/cereals.jpg' style='width:50px; height:30px;'>Potato Fries",  "3606", "In Stock", "$14","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "14526", "<img src='../../assets/img/costic/egg-sandwich.jpg' style='width:50px; height:30px;'>Lemon Rice",  "2860", "In Stock", "$21" ,"<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>"],
    [ "15451", "<img src='../../assets/img/costic/pizza.jpg' style='width:50px; height:30px;'>Fried Rice",  "8240", "In Stock", "$32","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ],
    [ "14451", "<img src='../../assets/img/costic/french-fries.jpg' style='width:50px; height:30px;'>pizza",  "5384", "Out Of Stock", "$85","<a href='#'><i class='fas fa-pencil-alt text-secondary'></i></a> <a href='a'><i class='far fa-trash-alt ms-text-danger'></i></a>" ]
  ];




  var tableOne = $('#data-table-1').DataTable( {
    data: dataSet2,
    columns: [
      { title: "Product ID" },
      { title: "Product Name" },

      { title: "Quantity" },
      { title: "Status" },
      { title: "Price" }
    ],
  });




  var tableTwo = $('#data-table-2').DataTable( {
    data: dataSet,
    columns: [
      { title: "Product ID" },
      { title: "Product Name" },

      { title: "Quantity" },
      { title: "Status" },
      { title: "Price" }
    ],
  });
  var tableThree = $('#data-table-3').DataTable( {
    data: dataSet,
    columns: [
      { title: "Product ID" },
      { title: "Product Name" },

      { title: "Quantity" },
      { title: "Status" },
      { title: "Price" }
    ],
    scrollY: 400
  });
  var tableFour = $('#data-table-4').DataTable( {
    data: dataSet1,
    columns: [
      { title: "Customer ID" },
      { title: "Customer Name" },

      { title: "Location" },
      { title: "Email ID" },
      { title: "Ordered Item" },
      { title: "Bill" }

    ],
  });


  var tableFour = $('#data-table-5').DataTable( {
    data: dataSet,
    columns: [
      { title: "Product ID" },
      { title: "Product Name" },

      { title: "Quantity" },
      { title: "Status" },
      { title: "Price" },


    ],
  });

var tableOne = $('#data-table-6').DataTable( {
    data: dataSet6,
    columns: [
      { title: "Product ID" },
      { title: "Product Name" },

      { title: "Quantity" },
      { title: "Status" },
      { title: "Price" }
    ],
  });



})(jQuery);
