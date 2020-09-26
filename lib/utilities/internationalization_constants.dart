const seriesTitle = 'Series';
const pointTitle = 'Puntos';
const pointsTitle = "Puntos";
const pointsToWinTitle = "Restantes";

Map<String, Map<String, String>> i18nVariables = {
  "i18n.seriesTitle": {"en": 'Series', "es": 'Series'},
  "i18n.points": {"en": 'Points', "es": "Puntos"},
  "i18n.restants": {"en": 'Restants', "es": "Restantes"},
  "i18n.save": {"en": "Add", "es": "Añadir"},
  "i18n.configurations": {"en": "Configurations", "es": "Configuraciones"},
  "i18n.editTeams": {"en": "Edit Teams", "es": "Editar Equipos"},
  "i18n.puntation": {"en": "Score", "es": "Puntuación"},
  "i18n.changeLanguage": {"en": "Change Language", "es": "Cambiar Idioma"},
  "i18n.buttonSaveSettings": {"en": "Save", "es": "Guardar"},
  "i18n.results": {"en": "Results", "es": "Resultados"},
  "i18n.theWinnerIs": {
    "en": "The team winner is: ",
    "es": "El equipo ganador es: "
  },
  "i18n.teamA": {"en": "Team A", "es": "Equipo A"},
  "i18n.teamB": {"en": "Team B", "es": "Equipo B"},
  "i18n.playerOne": {"en": "Player #1", "es": "Jugador #1"},
  "i18n.playerTwo": {"en": "Player #2", "es": "Jugador #2"},
};

String i18n({String locale, String value}) => i18nVariables[value][locale];
