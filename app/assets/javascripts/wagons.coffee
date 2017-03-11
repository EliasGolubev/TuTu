# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(window).load () ->
    type = $('select#wagon_type').val()

    selectWagonsView(type)

    return undefined

$(document).ready () ->

    $('select#wagon_type').change () ->
        type = $(this).val()
      
        selectWagonsView(type)
        
        return undefined

    
    return undefined

setCoupeWagon = () ->
    $('.top_seats').removeClass("hidden")
    $('.lower_seats').removeClass("hidden")
    $('.side_top_seats').addClass("hidden")
    $('.side_bottom_seats').addClass("hidden")
    $('.sitting_seats').addClass("hidden")

setEconomyWagon = () ->
    $('.top_seats').removeClass("hidden")
    $('.lower_seats').removeClass("hidden")
    $('.side_top_seats').removeClass("hidden")
    $('.side_bottom_seats').removeClass("hidden")
    $('.sitting_seats').addClass("hidden")

setSVWagon = () ->
    console.log("This is SV Wagon")
    $('.top_seats').addClass("hidden")
    $('.lower_seats').removeClass("hidden")
    $('.side_top_seats').addClass("hidden")
    $('.side_bottom_seats').removeClass("hidden")
    $('.sitting_seats').addClass("hidden")

setSittingWagon = () ->
    $('.top_seats').addClass("hidden")
    $('.lower_seats').addClass("hidden")
    $('.side_top_seats').addClass("hidden")
    $('.side_bottom_seats').addClass("hidden")
    $('.sitting_seats').removeClass("hidden")

selectWagonsView = (type) ->
    if type == "CoupeWagon"
        setCoupeWagon()
        
    if type == "EconomyWagon"
        setEconomyWagon()
        
    if type == "SVWagon"
        setSVWagon()
        
    if type == "SittingWagon"
        setSittingWagon()