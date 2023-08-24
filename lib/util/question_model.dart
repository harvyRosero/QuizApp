class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}


class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}


List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Que es ''UHT''?",
    [
      Answer("Ultra hight temperature", true),
      Answer("Ultra hard temperature ", false),
      Answer("Hard temperature ultra", false),
      Answer("Temperatura demasiado alta", false),
    ],
  ));

  list.add(Question(
    "¿Que  temperatura de ultrapasteurizacion se procesa la leche?",
    [
      Answer("150 C°", false),
      Answer("130 C°", false),
      Answer("155 C°", false),
      Answer("138 °C", true),
    ],
  ));

  list.add(Question(
    "¿Cuanto tiempo se debe calentar la leche para hacer el proceso de esterilización?",
    [
      Answer("Durante 8 a 10 segundos ", false),
      Answer("Durante 4 a 6 segundos ", false),
      Answer("Durante 2 a 4 segundos", true),
      Answer("Durante 10 segundos o mas..", false),
    ],
  ));

  list.add(Question(
    "¿Cuales son las etapas del proceso de UHT  de la leche?",
    [
      Answer("Etapas de enfriamiento calentamiento ", false),
      Answer("Etapas de calentamiento y enfriamiento  ", true),
      Answer("Etapas de enfriamiento calentamiento y enfriamiento", false),
      Answer("Ninguna de las anteriores...", false),
    ],
  ));

  list.add(Question(
    "¿Que es un tanque aseptico",
    [
      Answer(
          "Se usa para almacenar productos de alimentos como por ejemplo granos.",
          false),
      Answer(
          "Se usa para el almacenamiento de productos alimneticios como  por ejemplo cafe molido. ",
          false),
      Answer(
          "Se usa para el almacenamiento de productos alimenticios como  pastas.",
          false),
      Answer(
          "se usa para el almacenamiento de productos alimenticios líquidos como leche,yogur, avenas. ",
          true),
    ],
  ));

  list.add(Question(
    "¿Que condiciones debe tener un tanque aseptico para poder mantener la esterilizadad del producto?",
    [
      Answer("Mantener la temperatura controlada ejemplo las barreras de vapor.", false),
      Answer(
          "Mantener sellado hermético del tanque ", false),
      Answer("Realizar una limpieza y desinfección del tanque antes de llenar con producto esterilizado.", false),
      Answer("Todas las anteriores", true),
    ],
  ));
  

  list.add(Question(
    "¿Qué es un intercambiador de placas?",
    [
      Answer(
          "Dispositivo para transferir calor entre dos fluidos que tienen diferentes temperaturas.",
          true),
      Answer(
          "Dispositivo para transportar la leche desde un punto a hasta el punto b.",
          false),
      Answer(
          "Dispositivo para el almacenamiento de la leche.",
          false),
      Answer(
          "Dispositivo para darle sabor a la leche. ",
          false),
    ],
  ));

  list.add(Question(
    "¿Qué es un sensor pt100?",
    [
      Answer(
          "Sensor de temperatura utilizado para medir temperaturas con alta precisión y estabilidad .",
          true),
      Answer(
          "Sensor para medir unidades de presión.",
          false),
      Answer(
          "Sensor para medir el flujo de un líquido.",
          false),
      Answer(
          "Sensor para medir la resistencia de un motor.",
          false),
    ],
  ));

  list.add(Question(
    "¿Qué es un flujómetro?",
    [
      Answer(
          "Se utiliza para medir el flujo de corriente desde un punto A hacia un punto B.",
          false),
      Answer(
          "Se utiliza para medir la cantidad de flujo de un fluido que pasa por un punto específico de un sistema. ",
          true),
      Answer(
          "Se utiliza para medir la cantidad de microorganismo están pasando por un sistema.",
          false),
      Answer(
          "Ninguna de las anteriores.",
          false),
    ],
  ));

  list.add(Question(
    "¿Un _____  es  dispositivo eléctrico, capaz de transformar energía eléctrica trifásica en energía mecánica rotativa.",
    [
      Answer(
          "Capacitor",
          false),
      Answer(
          "Transformador.",
          false),
      Answer(
          "Rotor",
          false),
      Answer(
          "Motor trifásico. ",
          true),
    ],
  ));

  list.add(Question(
    "Para llevar a cabo la inversión del sentido de rotación en un motor eléctrico trifásico, es necesario cambiar las puntas:",
    [
      Answer(
          "L1 y L2.",
          false),
      Answer(
          "L1 y L3.",
          false),
      Answer(
          "L2 y L3.",
          false),
      Answer(
          " Todas las anteriores.",
          true),
    ],
  ));

  list.add(Question(
    "¿Qué procedimiento descompone las moléculas de grasa en partículas más diminutas en la leche?",
    [
      Answer(
          "Pasteurización",
          false),
      Answer(
          "Fermentación.",
          false),
      Answer(
          "Homogenización. ",
          true),
      Answer(
          "Coagulación",
          false),
    ],
  ));

  list.add(Question(
    "¿Qué tipo de tratamiento lácteo se efectúa a temperaturas superiores para extender la duración de conservación de la leche sin requerir refrigeración?",
    [
      Answer(
          "Pasteurización.",
          false),
      Answer(
          "Esterilización",
          false),
      Answer(
          "Homogenización.",
          false),
      Answer(
          "Ultra pasteurización.",
          true),
    ],
  ));

  list.add(Question(
    "¿En el contactor los bornes con números 13-14 es:",
    [
      Answer(
          "Temporizador",
          false),
      Answer(
          "NA",
          true),
      Answer(
          "De fuerza",
          false),
      Answer(
          "NC",
          false),
    ],
  ));

  list.add(Question(
    "Para elegir un contactor es necesario:",
    [
      Answer(
          "La carga en KVA.",
          false),
      Answer(
          "La carga en KW.",
          false),
      Answer(
          "El tipo de control. ",
          false),
      Answer(
          "Todas las anteriores.",
          true),
    ],
  ));

  return list;
}
