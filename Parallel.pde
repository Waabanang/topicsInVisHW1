Item items[];
Line lines[];
boolean fill;
int top;

int selection = -1;


void setup(){
  size(1800, 900);
  tableReader("cars-cleaned.tsv");
}

void draw(){
  background(color(150));
  //draw lines
  fill(color(0));
  stroke(color(0));
  float lineLength = height * 0.75;
  float lineSpacing = (width - (width * 0.25)) * (1/(float)lines.length); 
  for (int i = 0; i < lines.length; i++){
    if (lines[i].show){
      line(width * 0.25 + (lineSpacing * i), height * 0.1,  width * 0.25 + (lineSpacing * i), lineLength + height * 0.1);
      text(lines[i].max, width * 0.25 + (lineSpacing * i), lineLength + height * 0.125);
      text(lines[i].min, width * 0.25 + (lineSpacing * i), height * 0.1);
      text(lines[i].label, width * 0.25 + (lineSpacing * i), lineLength + height * 0.15);
      //ticks are for chumps anyway
      //for (int n = 0; n < 50; n++){
      //  line( width * 0.25 + (lineSpacing * i), (n * (1/50 * lineLength)) + height * 0.1, 
      //   width * 0.25 + (lineSpacing * i) + 10, (n * (1/50 * lineLength))  + height * 0.1);
      //}
    }
  }
  //draw legend
  float w = (width * 0.2)/2;
  float h = lineLength/25;
  
  fill(color(255));
  rect(width * 0.025, height * 0.1, width * 0.2, lineLength); 
  rect(width * 0.025, height * 0.1 - h, w, h);
  rect(width * 0.025 + w, height * 0.1 - h, w, h);
  fill(color(0));
  text("Show All", width * 0.025 + (w/3), height * 0.1 - (h/2));
  text("Hide All", width * 0.025 + (w/3) + w, height * 0.1 - (h/2));
  for (int i = 0; i < 50; i++){
    noFill();
    if ((i + top) < items.length){
      if (i < 25) {
        rect(width * 0.025, (h * i) + height * 0.1, w, h);
        fill(items[i + top].c);
        ellipse(width * 0.025 + h/2, h/2 + (h * i) + height * 0.1, h, h);
        fill(color(0));
        text(items[i + top].label, h + width * 0.025, h/2 + (h * i) + height * 0.1);
        if (!items[i + top].show) {
          fill(color(0, 0, 0, 150));
          rect(width * 0.025, (h * i) + height * 0.1,w, h);
        }
      }
      if (i >= 25) {
        rect(width * 0.025 + w, (h * (i - 25)) + height * 0.1, w, h);
        fill(items[i + top].c);
        ellipse(width * 0.025 + w + h/2, h/2 + (h * (i - 25)) + height * 0.1, h, h);
        fill(color(0));
        text(items[i + top].label, h + width * 0.025 + w, h/2 + (h * (i - 25)) + height * 0.1);
        if (!items[i + top].show) {
          fill(color(0, 0, 0, 150));
          rect(width * 0.025 + w, (h * (i - 25)) + height * 0.1,w, h);
        }
      }
    }
  }
  noFill();
  rect(width * 0.025 + w/3, height * 0.1 + lineLength + h, w/3, h * 2);
  fill(color(0));
  triangle(width * 0.025 + w * 2/3, height * 0.1 + lineLength + h 
         , width * 0.025 + w * 2/3, height * 0.1 +  lineLength + (h * 3)
         , width * 0.025 + w/3, height * 0.1 + lineLength + (h * 2)); 
  noFill();
  rect((width * 0.025 + w/3) + w, height * 0.1 + lineLength + h, w/3, h * 2);
  fill(color(0));
  triangle((width * 0.025 + w/3) + w, height * 0.1 + lineLength + h 
         , (width * 0.025 + w/3) + w, height * 0.1 +  lineLength + (h * 3)
         , (width * 0.025 + w * 2/3) + w, height * 0.1 + lineLength + (h * 2)); 
         
  noFill();    
  rect(width * 0.25, height * 0.9, (lineSpacing * lines.length) - 5, height * 0.05);
  rect(width * 0.25, height * 0.95, (lineSpacing * lines.length) - 5, height * 0.05);
  for (int l = 0; l < lines.length; l++){
    noFill();
    if(l == selection) {fill(color(250, 250, 0));}
    rect((width *  0.25) + (l * lineSpacing), height * 0.95, lineSpacing, height * 0.05);
    if (lines[l].show) fill(color(0));
    rect((width *  0.25) + (l * lineSpacing), height * 0.9, lineSpacing, height * 0.05);
  }
  
  //draw items
  for (int i = 0; i < items.length; i++){
    fill(items[i].c);
    stroke(items[i].c); 
    if (items[i].show){
      for (int l = 0; l < lines.length; l++){
        if (lines[l].show){
          float y = height * 0.1;
          float x = width * 0.25 + (lineSpacing * l);
          y += lineLength * ( (items[i].attributes.get(lines[l].label) - lines[l].min) / ((lines[l].max) - lines[l].min) );
          ellipse(x, y, 9, 9);
          int nextShow = l + 1;
          for (int ns = l + 1; ns < lines.length; ns++) {
            if (lines[ns].show) {
              nextShow = ns;
              break;
            }
          } 
          if (l+1 < lines.length){
            float y1 = height * 0.1;
            float x1 = width * 0.25 + (lineSpacing * (nextShow));
            y1 += lineLength * ((items[i].attributes.get(lines[nextShow].label) - lines[nextShow].min)/(lines[nextShow].max - lines[nextShow].min));
            line(x, y, x1, y1);
          }
        }
      }
    }
  }
}

void mouseClicked() {
  if (clickIn(width * 0.025 + ((width * 0.2)/2)/3, height * 0.1 + (height * 0.75) + ((height * 0.75)/25),
             (width * 0.025 + ((width * 0.2)/2)/3) + (width * 0.2)/2, (height * 0.1 + (height * 0.75) + ((height * 0.75)/25)) + (height * 0.75)/25)){
    if (top > 0) top -= 100;
  }
  else if (clickIn(width * 0.025 + ((width * 0.2))/3, height * 0.1 + (height * 0.75) + ((height * 0.75)/25),
             (width * 0.025 + ((width * 0.2))/3) + (width * 0.2)/2, (height * 0.1 + (height * 0.75) + ((height * 0.75)/25)) + (height * 0.75)/25)){
    if (top < items.length) top += 100;
  } else if (clickIn(width * 0.025, height * 0.1, width * 0.025 + width * 0.2, height * 0.1 + height * 0.75)){    
    for (int i = 0; i < 50; i++){
      noFill();
      if ((i + top) < items.length){
        if (i < 25) {
          if(clickIn(width * 0.025, 
                    (((height * 0.75)/25) * i) + height * 0.1,
                    width * 0.025 + ((width * 0.2)/2), 
                    ((height * 0.75)/25) + (((height * 0.75)/25) * i) + height * 0.1)){
            items[i + top].show = !(items[i + top].show);
          }
        } else {
          if(clickIn((width * 0.025) + (width * 0.2)/2, 
                    ((((height * 0.75)/25) * (i - 25)) + height * 0.1), 
                    (width * 0.025 + 2 * (width * 0.2)), 
                    (((height * 0.75)/25) + (((height * 0.75)/25) * (i - 25)) + height * 0.1))){
            items[i + top].show = !(items[i + top].show);
          }
        }
      }
    }
  } else if (clickIn(width * 0.025, 
                     height * 0.1 - ((height * 0.75)/25), 
                     width * 0.025 + ((width * 0.2)/2), 
                     height * 0.1 + ((height * 0.75)/25))){
    for (Item i: items){
      i.show = true; 
    }
  } else if (clickIn(width * 0.025 + ((width * 0.2)/2), 
                     height * 0.1 - ((height * 0.75)/25), 
                     width * 0.025 + (width * 0.2), 
                     height * 0.1 + ((height * 0.75)/25))){
    for (Item i: items){
      i.show = false; 
    }
  } else if (clickIn(width * 0.25, 
                     height * 0.9,
                     width * 0.25 + ((((width - (width * 0.25)) * (1/(float)lines.length)) * lines.length) - 5),
                     height * 0.9 + height * 0.05)){
    float ls = (width - (width * 0.25)) * (1/(float)lines.length);
    for (int i = 0; i < lines.length; i++){
      if ((mouseX > (i * ls) + width*0.25) && (mouseX < ((i + 1) * ls) + width*0.25)){
        lines[i].show = !lines[i].show;
      }
    }
  } else if (clickIn(width * 0.25, 
                     height * 0.95,
                     width * 0.25 + ((((width - (width * 0.25)) * (1/(float)lines.length)) * lines.length) - 5),
                     height * 0.95 + height * 0.05)){
    float ls = (width - (width * 0.25)) * (1/(float)lines.length);
    for (int i = 0; i < lines.length; i++){
      if ((mouseX > (i * ls) + width*0.25) && (mouseX < ((i + 1) * ls) + width*0.25)){
        if (selection < 0) {
          selection = i;
        } else if (selection >= 0){
          Line temp = lines[selection]; 
          lines[selection] = lines[i];
          lines[i] = temp;
          selection = -1;
        }
      }
    }
  }
}


boolean clickIn(float x1, float y1, float x2, float y2){
  return mouseX > x1 &&
         mouseX < x2 &&
         mouseY > y1 &&
         mouseY < y2;
}

void tableReader(String filename){
  Table table = loadTable(filename, "tsv");
  items = new Item[table.getRowCount() - 1];
  lines = new Line[table.getColumnCount() - 1];
  for (int i = 1; i < table.getRowCount(); i++){
    color c = color(random(250), random(250), random(250));
    items[i-1] = new Item(table.getString(i, 0), c, table.getRow(i), table.getRow(0));
  }
  for (int i = 1; i < table.getColumnCount(); i++){
    lines[i-1] = new Line(table.getStringColumn(i));
  }
}