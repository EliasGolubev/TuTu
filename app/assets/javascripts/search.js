$(document).ready(function(){
  $('.search_form').submit(function(){
    var start_station;
    var end_station;

    start_station = $(this).find('#first_station_railway_station_id');
    end_station = $(this).find('#last_station_railway_station_id');

    if (start_station.val() == end_station.val()) {
      alert('Выбери конечную станцию');
      return false;
    }
  });
});