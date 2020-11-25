


  /* Youtube Subs */
  var data_1 = [7, 6, 3, 5, 4, 2, 3, 6, 8, 5, 7];
  var data_2 = [0, -4, -2, 0, -5, -3, 0, 0, -2, -5, -3];
  var labels = ["12 AM", "2 PM", "4 PM", "6 PM", "8 PM", "10 PM", "12 PM", "2 PM", "6 PM", "8 AM", "10 PM"];
  var youtubeSubs = new Chart(document.getElementById("youtube-subscribers"), {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
            label: "Repeat order",
            backgroundColor: '#ff0018',
            data: data_1
         }, {
            label: "New order",
            backgroundColor: '#000000',
            data: data_2
         }],
      },
      options: {
        legend: { display: false },
        title: {
          display: false,
        },
        scales: {
          xAxes: [{
            stacked: true,
          }],
          yAxes: [{
            stacked: true
          }]
        },
      }
  });

  