(function($) {
  'use strict';

  //Pie Chart
  new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Hunger House", "Food Lounge", "Delizious", "Red Resturant", "Hunger Lounge"],
      datasets: [{
        label: "Users (thousands)",
        backgroundColor: ["#ff0018", "#f7b11b","#ff6c60","#8663e1","#08bf6f"],
        data: [725,890,729,316,275]
      }]
    },
    options: {
      title: {
        display: false,
        text: 'Users By Country'
      },
      legend: {
        display: false
      },
    }
  });

  })(jQuery);