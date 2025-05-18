//JUANA TENAGLIA comision #1
PImage imagen1; // Portada
PImage imagen2; // Fondo
PImage imagen3; // Escena bicicleta
PFont font, miFuente;

int e = 1; // Estado de pantalla
int Animado = 0;
float tam = 4;

int mov1 = 0, mov3 = 0, mov5 = 0; // Variables de animación

String strangerthings = "serie";

void setup() {
  size(640, 480);

  font = loadFont("Georgia-24.vlw");
  miFuente = loadFont("Forsaking-32.vlw");

  textFont(miFuente, 32);
  textAlign(CENTER, CENTER);

  imagen1 = loadImage("portada.jpg");
  imagen2 = loadImage("fondo.jpg");
  imagen3 = loadImage("escenabiscicleta.jpg");
}

void draw() {
  if (e == 1) {
    // Pantalla 1: Portada
    background(0);
    if (Animado < 180) {
      Animado++;
    }
    image(imagen1, 0, 0, Animado * 3, Animado * 3);
    
    if (frameCount / 60 > 3) {
      e = 2;
    }

  } else if (e == 2) {
    // Pantalla 2: Descripción
    background(180, 200, 150);
    image(imagen2, 0, 0, 640, 480);
    
    if (tam < 15) {
      tam += 0.05;
    }

    fill(255);
    textSize(15);
    textAlign(CENTER, CENTER);
    text("Stranger Things es una serie de televisión creada por The Duffer Brothers y estrenada en Netflix en 2016. Es una mezcla de ciencia ficción, horror, drama y nostalgia ochentera.", width / 2, height * 0.9);
    
    mov5++;
    if (mov5 >= 240) {
      mov3++;
      if (mov3 >= 210) {
        e = 3;
      }
    }

  } else if (e == 3) {
    // Pantalla 3: Escena bicicleta
    background(200, 200, 200);
    image(imagen3, 0, 0, 640, 480);

    if (mov1 < 230) {
      mov1++;
    }

    fill(255);
    textSize(tam);
    textAlign(RIGHT, RIGHT);
    text("La historia comienza con la desaparición de un niño llamado Will Byers.", width / 2, height * 0.9);

    float escala = min((float)width / imagen3.width, (float)height / imagen3.height);
    float imgAncho = imagen3.width * escala;
    float imgAlto = imagen3.height * escala;
    float x = (width - imgAncho) / 3;
    float y = (height - imgAlto) / 3;
    image(imagen3, x, y, imgAncho, imgAlto);

    if (tam < 15) {
      tam += 0.05;
    }
  }
}

void keyPressed() {
  if (key == '1') {
    e = 1;
    strangerthings = "serie";
    frameCount = 0;
    Animado = 0;
  } else if (key == '2') {
    e = 2;
    strangerthings = "trama principal";
    mov5 = 0;
    mov3 = 0;
  } else if (key == '3') {
    e = 3;
    strangerthings = "otra pantalla";
    mov1 = 0;
  }
}
