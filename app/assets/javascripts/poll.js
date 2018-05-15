var timeoutfunc;
function RefreshTable(tableId, urlData)
{
  $.getJSON(urlData, null, (data) => {
    $('#votes_count').html("<strong>Total: </strong>" + data.votes_count);

    teams = JSON.parse(data.teams);
    for (var i=0; i<teams.length; i++) {
      team = teams[i];

      rows = $("#result-table tbody tr");
      row = rows[i];

      for (var j=1; j<row.cells.length; j++) {
        cell = row.cells[j];
        if (j == 1) { // Nome da equipe
          cell.textContent = team.name;
        } else if (j == 2) { // Votos
          cell.textContent = team.votes;
        } else if (j == 3) { // Porcentagem
          cell.textContent = ((team.votes / data.votes_count) * 100).toFixed(1);;
        }
      }
    }

    console.log("Total: " + data.votes_count);
  }
 )
 .fail(() => {
   clearTimeout(timeoutfunc)
 });
}

function AutoReload() {
  RefreshTable('#result-table', '/result.json');
  timeoutfunc = setTimeout(function(){AutoReload();}, 5000);
}

$(document).ready(function () {
  AutoReload();
});
