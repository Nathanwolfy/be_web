window.onload = () => {
    let elementCalendrier = document.getElementById("calendrier")

    let xmlhttp = new XMLHttpRequest()

    xmlhttp.onreadystatechange = () => {
        if (xmlhttp.readyState = 4) {
            if (xmlhttp.status = 200) {
                let evenements = JSON.parse(xmlhttp.responseText)

                let calendrier = new FullCalendar.Calendar(elementCalendrier, {
                    initialView: 'dayGridMonth',
                    locale: 'fr',
                    headerToolbar: {
                        start: 'prev,next today',
                        center: 'title',
                        end: 'dayGridMonth timeGridWeek'
                    },
                    buttonText: {
                        today: 'Aujourd\'hui',
                        month: 'Mois',
                        week: 'Semaine'
                    },
                    events: evenements,
                    nowIndicator: true
                })

                calendrier.render()
            }
        }
    }

    xmlhttp.open('get', url, tru)
    xmlhttp.send(null)

    //On instancie le calendrier
}