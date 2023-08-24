class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  final String image;

  Answer(this.answerText, this.isCorrect, this.image);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Que es uht: ",
    [
      Answer("""UHT son las siglas de "Ultra High Temperature", que en español se traduce como "Ultra Alta Temperatura.". Es un proceso de tratamiento térmico utilizado en la industria alimentaria para la conservación de los alimentos. También es conocido como proceso de esterilización UHT o pasteurización UHT. 

El proceso UHT permite la eliminación de la mayoría de las bacterias y esporas que pueden causar deterioro o enfermedades transmitidas por alimentos. Gracias a esto, los alimentos tratados con UHT pueden ser almacenados sin necesidad de refrigeración durante largos períodos de tiempo, siempre y cuando el envase permanezca sellado. Una vez abierto el envase, el alimento debe refrigerarse y consumirse en un tiempo más corto. 

La leche UHT es un ejemplo muy común de producto tratado con este proceso. Es una forma de conservar la leche a temperatura ambiente por más tiempo sin necesidad de refrigeración hasta que el envase sea abierto.""", 
    true, 
    'assets/images/q1.jpg'
    
    ),
    ],
  ));

  list.add(Question(
    "Ultra pasteurizacion de la leche.",
    [
      Answer("""El proceso UHT consiste en calentar los alimentos líquidos, como la leche, zumos, sopas o salsas, a una temperatura muy alta (generalmente entre 138 °C 	) durante un corto período de tiempo, normalmente entre 2 y 5 segundos. Después de este tratamiento térmico, el alimento se enfría rápidamente para evitar el crecimiento de microorganismos y garantizar su seguridad microbiológica.
      """
      
      , true, 
    'assets/images/q2.jpg'
      ),
    ],
  ));

  list.add(Question(
    "Pasteurizacion para poder eliminar la mayoría de microorganismos.",
    [
      Answer("""El tiempo en que se calienta la leche ultra pasteurizada generalmente es de unos pocos segundos. En promedio, la leche se calienta a una temperatura de alrededor de 138 °C durante aproximadamente 2 a 4 segundos. Este proceso rápido y eficiente es lo que permite que la leche sea segura para su consumo y tenga una vida útil más prolongada sin necesidad de refrigeración antes de abrir el envase. 

Una vez que la leche ha sido sometida al proceso de ultra pasteurización y se ha enfriado rápidamente, se envasa en recipientes herméticos para mantener su calidad y seguridad hasta que el envase sea abierto. Luego de abrir el envase, se recomienda refrigerar la leche y consumirla dentro del plazo recomendado por el fabricante para mantener su frescura y sabor. """, 
      true, 
    'assets/images/q3.jpg'
      
      
      ),
    ],
  ));

  list.add(Question(
    "Etapas del proceso de pasteurización de la leche.",
    [
      Answer("""La ultra pasteurización de la leche implica un proceso rápido y eficiente de calentamiento y enfriamiento para eliminar la mayoría de los microorganismos presentes y prolongar la vida útil del producto. Las etapas de la ultra pasteurización de la leche son las siguientes: 

Preparación: La leche cruda se recoge y se somete a pruebas de calidad y seguridad para asegurar que cumpla con los estándares requeridos antes de comenzar el proceso de ultra pasteurización. 

Calentamiento: La leche se calienta a una temperatura muy alta, generalmente alrededor de 135 °C (275 °F), utilizando tecnologías de calentamiento rápido, como intercambiadores de calor de placas o tubulares. Esta alta temperatura permite eliminar la mayoría de los microorganismos, incluyendo bacterias y esporas, que pueden estar presentes en la leche cruda. 

Sostenimiento térmico: Una vez que la leche ha alcanzado la temperatura requerida, se mantiene a esa temperatura durante un corto período de tiempo, típicamente entre 2 y 5 segundos. Esta etapa de sostenimiento térmico es crucial para garantizar la eficacia de la pasteurización y la eliminación de microorganismos patógenos. 

Enfriamiento: Después de la etapa de sostenimiento térmico, la leche ultra pasteurizada se enfría rápidamente para detener el proceso de calentamiento y evitar que la leche se cocine o cambie sus propiedades organolépticas.  

Envasado: La leche ultra pasteurizada se envasa en recipientes herméticos y estériles para evitar la contaminación posterior y mantener la calidad del producto. Los envases pueden ser de cartón aséptico, botellas de vidrio, o bolsas flexibles, entre otros. 
      """, 
      true, 
    'assets/images/q4.jpg'
      
      ),
    ],
  ));

  
  list.add(Question(
    "Tanque aséptico.",
    [
      Answer(
          """Un tanque aséptico, también conocido como tanque aséptico, es un tipo de recipiente o contenedor utilizado en la industria alimentaria y de bebidas para el almacenamiento y transporte de productos líquidos que han sido sometidos a procesos de esterilización, como la ultra pasteurización o el tratamiento UHT (Ultra High Temperature). 

El objetivo principal de un tanque aseptico es mantener la esterilidad del producto almacenado, evitando la entrada de microorganismos del entorno exterior y protegiendo el contenido de la contaminación. Estos tanques están diseñados para mantener condiciones controladas y prevenir la proliferación de bacterias, hongos y otros microorganismos que puedan afectar la calidad y seguridad del producto.
          """,
          true, 
    'assets/images/q5.jpg'
          ),
    ],
  ));

 

  list.add(Question(
    "Condiciones de un tanque aséptico para poder mantener la esterilidad del producto",
    [
      Answer("""En resumen, para mantener la esterilidad de los productos almacenados en tanques asepticos, se deben mantener condiciones de sellado hermético, limpieza y desinfección adecuadas, control de temperatura y microbiológico, y protección contra la luz y el oxígeno, cumpliendo con las normativas aplicables. """, 
      true, 
    'assets/images/q6.png'
      )
    ],
  ));

  list.add(Question(
    "Intercambiador de placas.",
    [
      Answer("""Un intercambiador de placas, también conocido como intercambiador de calor de placas o intercambiador de calor de placas y juntas, es un dispositivo utilizado para transferir calor entre dos fluidos que tienen diferentes temperaturas. Este equipo es ampliamente utilizado en la industria para diversas aplicaciones, incluyendo calentamiento, enfriamiento y recuperación de calor. 

El intercambiador de placas consta de varias placas metálicas delgadas que están colocadas en paralelo y separadas por pequeñas juntas. Los fluidos que necesitan intercambiar calor fluyen a través de canales alternos formados por las placas. A medida que los fluidos pasan por estos canales, el calor se transfiere de uno al otro a través de las placas metálicas. 
""", 
      true, 
    'assets/images/q7.png'
      )
    ],
  ));

  list.add(Question(
    "Sensor pt100",
    [
      Answer("""Un sensor PT100 es un tipo de sensor de temperatura utilizado para medir temperaturas con alta precisión y estabilidad. El término "PT100" hace referencia a su característica principal: es un sensor de resistencia de platino (Pt) que tiene una resistencia de 100 ohmios a 0 grados Celsius. 

La resistencia de platino es un material que presenta una relación lineal y predecible entre su resistencia eléctrica y la temperatura. A medida que cambia la temperatura, la resistencia del sensor PT100 también cambia de manera proporcional y conocida. Esta relación se basa en la resistencia eléctrica del platino y se define por normas internacionales, como la norma IEC 60751. 
""", 
      true, 
    'assets/images/q8.png'
      )
    ],
  ));

  list.add(Question(
    "El flujómetro.",
    [
      Answer("""Un flujómetro, también conocido como medidor de flujo o caudalímetro, es un dispositivo utilizado para medir la cantidad de flujo de un fluido (líquido o gas) que pasa por un punto específico en un sistema. El objetivo principal de un flujómetro es proporcionar información sobre la velocidad, el caudal o la cantidad de flujo que está pasando por una tubería, conducto o canal. 

Los flujómetros son ampliamente utilizados en diversas industrias y aplicaciones, incluyendo procesos industriales, sistemas de suministro de agua, control de calidad, monitoreo ambiental y aplicaciones médicas, entre otras. La elección del tipo de flujómetro adecuado depende de factores como el tipo de fluido, la precisión requerida, el rango de caudal y las condiciones de operación. 
""", 
      true, 
    'assets/images/q9.jpg'
      )
    ],
  ));

  list.add(Question(
    "Motor trifásico.",
    [
      Answer("""Un motor trifásico es un tipo de motor eléctrico que utiliza una fuente de energía eléctrica trifásica para generar movimiento mecánico. Está compuesto por tres devanados o bobinas, cada uno conectado a una de las fases de un sistema trifásico de corriente alterna. Cuando se suministra corriente a estas tres bobinas en secuencia, se crea un campo magnético rotativo en el interior del motor, lo que induce un movimiento giratorio en el eje del motor. Los motores trifásicos son ampliamente utilizados en diversas aplicaciones industriales debido a su eficiencia y capacidad para generar un alto par motor.  
""", 
      true, 
    'assets/images/q10.jpg'
      )
    ],
  ));

  list.add(Question(
    "Como llevar a cabo la inversión del sentido de rotación en un motor eléctrico trifásico:",
    [
      Answer("""Para cambiar la dirección de rotación de un motor eléctrico, en especial un motor trifásico, debes realizar el siguiente procedimiento: 

Apaga la alimentación: Asegúrate de que el motor y el circuito eléctrico estén apagados antes de hacer cualquier cambio. 

Identifica las fases: Observa las conexiones de las fases en el motor y en el circuito. Cada fase tiene una etiqueta o color específico, como L1, L2 y L3. Identifica cuál de las fases corresponde a cuál. 

Intercambia dos fases: El cambio de giro se logra intercambiando las conexiones de dos de las fases. Por ejemplo, si cambias las conexiones de L1 y L2, estarás invirtiendo la dirección de rotación del motor. 

Verifica la conexión: Asegúrate de que las conexiones estén bien aseguradas. Utiliza conectores adecuados y asegúrate de que no haya cables sueltos. 

Enciende el motor: Una vez que hayas realizado el cambio de las conexiones de las fases, enciende el motor y observa si la dirección de rotación ha cambiado de acuerdo a tus necesidades. 

Verifica el funcionamiento: Además de la dirección de rotación, verifica que el motor funcione correctamente en términos de rendimiento y ruido 
""", 
      true, 
    'assets/images/q11.jpg'
      )
    ],
  ));

  list.add(Question(
    "Procedimiento para descomponer las moléculas de grasa en partículas más diminutas en la leche.",
    [
      Answer("""El proceso de homogeneización es una técnica utilizada en la industria alimentaria para reducir el tamaño de las partículas presentes en un líquido y lograr una distribución uniforme de ellas. En el contexto de la leche y otros productos lácteos, la homogeneización implica someter el líquido a alta presión, generalmente a través de una serie de válvulas estrechas. Este proceso rompe las partículas de grasa y otros componentes en partículas más pequeñas y uniformemente dispersas en la leche. 

La homogeneización tiene varios beneficios, entre ellos: 

Mejora de la textura: La reducción del tamaño de las partículas mejora la sensación en la boca y la textura de la leche, dándole una apariencia más suave y uniforme. 

Prevención de separación: Al reducir el tamaño de las partículas de grasa, se evita que estas se agrupen y se separen de la leche, lo que contribuye a mantener una mezcla uniforme. 

Aumento de la vida útil: La homogeneización puede aumentar la vida útil de la leche y otros productos al mejorar la estabilidad de la mezcla. 

Mejora de la apariencia: La leche homogeneizada tiende a tener un aspecto más atractivo, ya que no muestra capas de grasa separadas. 
""", 
      true, 
    'assets/images/q12.jpg'
      )
    ],
  ));

  list.add(Question(
    "Bornes del contactor con números 13-14.’ ",
    [
      Answer("""Un contactor es un dispositivo electromagnético utilizado para controlar el flujo de corriente eléctrica en un circuito. Funciona como un interruptor controlado por una bobina electromagnética. Los contactores se utilizan comúnmente en aplicaciones industriales y comerciales para manejar cargas eléctricas de alta potencia, como motores, luces y sistemas de calefacción y refrigeración. 

Un contactor típico tiene un conjunto de contactos principales, que se abren o cierran cuando la bobina es energizada o desenergizada, respectivamente. Esto permite controlar la conexión y desconexión de la corriente eléctrica hacia la carga que está siendo alimentada por el contactor.

Los contactores también pueden tener contactos auxiliares que se utilizan para enviar señales o realizar funciones de control en otros dispositivos del circuito. 

En resumen, un contactor es un componente clave en la automatización y el control de sistemas eléctricos de gran potencia, ya que permite manejar la energía eléctrica de manera segura y eficiente. 
""", 
      true, 
    'assets/images/q14.jpg'
      )
    ],
  ));


 
  
  return list;
}
