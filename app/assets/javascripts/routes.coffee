# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ()->
    $('a.edit_route').click (e)-> 
        e.preventDefault()

        route_id = $(this).data('routeId')
        form = $("#edit_route_#{route_id}")
        title = $("#title_route_#{route_id}")

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
