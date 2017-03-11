# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready -> 
    $('a.edit_station').click (e)-> 
        e.preventDefault()

        station_id = $(this).data("stationId")
        form = $("#edit_railway_station_#{station_id}")
        title = $("#railway_station_title_#{station_id}")

        unless $(this).hasClass('cancel') 
            $(this).html('Отмена')
            $(this).addClass('cancel')
        else 
            $(this).html('Изменить')
            $(this).removeClass('cancel')
        
        form.toggle()
        title.toggle()
        return undefined
    return undefined
