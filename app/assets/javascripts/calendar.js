$(document).ready(function() {

    $('#calendar').fullCalendar({
      // events: '/events.json'
        header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,


    });
});
