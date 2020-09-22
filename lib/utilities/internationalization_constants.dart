const seriesTitle = 'Series';
const pointTitle = 'Puntos';
const numberGamePoints = '200';
const seriesNumber = '2/3';
const pointsTitle = "Puntos";
const pointsToWinTitle = "Restantes";

Map<String, Map<String, String>> i18nVariables = {
  "i18n.seriesTitle": {"en": 'Series', "es": 'Series'},
  "i18n.points": {"en": 'Points', "es": "Puntos"},
  "i18n.restants": {"en": 'Restants', "es": "Restantes"},
  "i18n.save": {"en": "Add", "es": "Añadir"}
};

String i18n({String locale, String value}) => i18nVariables[value][locale];
