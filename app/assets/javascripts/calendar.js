$(document).ready(function() {

    $('#calendar').fullCalendar({
      events: [
     {
         title  : 'test event',
         start  : '2017-01-01'
     },
     {
         title  : 'test event2',
         start  : '2017-01-05',
         end    : '2017-01-07'
     },
     {
         title  : 'event3',
         start  : '2017-01-09T12:30:00',
         allDay : false // will make the time show
     }
 ]

    })

})
