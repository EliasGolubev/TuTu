# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ()->
    $('a.edit_train').click (e)->
        e.preventDefault()
        
        train_id = $(this).data('trainId')
        form = $("#edit_train_#{train_id}")
        title = $("#edit-title_#{train_id}")
        
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