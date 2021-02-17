void setup(){
  size(displayWidth, displayHeight);
  background(#000000);
  int formatx, formaty;
  PImage img = loadImage("Odyssey.png");
  if (img.width == img.height){
    formatx = 860; formaty = 860;
  }
  else if (img.width == img.height * 16 / 9){
    formatx = 860; formaty = 540;
  }
  else {
    formatx = img.width; formaty = img.height;
  }
  image(img, 10, 10, formatx, formaty);
  noFill();
  noStroke();
  textSize(30);
  textAlign(CENTER, TOP);
  text("Dimensions : " + img.width + " x " + img.height + " pixels", formatx / 2, formaty + 10);
  textSize(13);
  text("histogramme de la composante rouge", 1018, 120);
  text("histogramme de la composante verte", 1018, 250);
  text("histogramme de la composante bleue", 1018, 380);
  text("histogramme luminosité", 1018, 510);
  histo_rouge_img(img, 890, 20, 256, 100);
  histo_vert_img(img, 890, 150, 256, 100);
  histo_blue_img(img, 890, 280, 256, 100);
  histo_bright_img(img, 890, 410, 256, 100);
}

int get_max(int [] tabl){
  int maxi = tabl[0];
  for (int i = 1; i < tabl.length; i++){
    if (maxi < tabl[i]){
      maxi = tabl[i];
    }
  }
  return maxi;
}

int [] histo_blue_liste(PImage img){
  int [] return_val = new int [256];
  for (int i = 0; i < img.width; i++){
    for (int j = 0; j < img.height; j++){
      return_val[int(blue(img.get(i, j)))]++;
    }
  }
  return return_val;
}

void histo_blue_img(PImage img, int x, int y, int widthh, int heighth){
  int h, maxi;
  y += heighth;
  stroke(#0000ff);
  int [] his_blue;
  his_blue = histo_blue_liste(img);
  maxi = get_max(his_blue);
  for (int i = 0; i < 256; i++){
    h = y - int(map(his_blue[i], 0, maxi, 0, heighth));
    line(x + int(i  * widthh / 255), y, x + int(i  * widthh / 255), h);
  }
}

int [] histo_bright_liste(PImage img){
  color px;
  int [] return_val = new int [256];
  for (int i = 0; i < img.width; i++){
    for (int j = 0; j < img.height; j++){
      px = img.get(i, j);
      return_val[int( .3 * green(px) +  .6 * red(px) + .1 * blue(px))]++;
    }
  }
  return return_val;
}

void histo_bright_img(PImage img, int x, int y, int widthh, int heighth){
  int h, maxi;
  y += heighth;
  stroke(#777777);
  int [] his_bright;
  his_bright = histo_bright_liste(img);
  maxi = get_max(his_bright);
  for (int i = 0; i < 256; i++){
    h = y - int(map(his_bright[i], 0, maxi, 0, heighth));
    line(x + int(i  * widthh / 255), y, x + int(i  * widthh / 255), h);
  }
}

int [] histo_rouge_liste(PImage img){
  int [] return_val = new int [256];
  for (int i = 0; i < img.width; i++){
    for (int j = 0; j < img.height; j++){
      return_val[int(red(img.get(i, j)))]++;
    }
  }
  return return_val;
}

void histo_rouge_img(PImage img, int x, int y, int widthh, int heighth){
  int h, maxi;
  y += heighth;
  stroke(#ff0000);
  int [] his_rouge;
  his_rouge = histo_rouge_liste(img);
  maxi = get_max(his_rouge);
  for (int i = 0; i < 256; i++){
    h = y - int(map(his_rouge[i], 0, maxi, 0, heighth));
    line(x + int(i  * widthh / 255), y, x + int(i  * widthh / 255), h);
  }
}

int [] histo_vert_liste(PImage img){
  int [] return_val = new int [256];
  for (int i = 0; i < img.width; i++){
    for (int j = 0; j < img.height; j++){
      return_val[int(green(img.get(i, j)))]++;
    }
  }
  return return_val;
}

void histo_vert_img(PImage img, int x, int y, int widthh, int heighth){
  int h, maxi;
  y += heighth;
  stroke(#00ff00);
  int [] his_vert;
  his_vert = histo_vert_liste(img);
  maxi = get_max(his_vert);
  for (int i = 0; i < 256; i++){
    h = y - int(map(his_vert[i], 0, maxi, 0, heighth));
    line(x + int(i  * widthh / 255), y, x + int(i  * widthh / 255), h);
  }
}
