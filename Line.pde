class Line{
  public String label; 
  private float min, max;
  private boolean show;
  Line(String values[]){
    this.show = true;
    this.label = values[0];
    this.min = Float.parseFloat(values[1]);
    this.max = Float.parseFloat(values[1]);
    
    int i = 0; 
    for (String val: values){
      if (i != 0){
        float v = Float.parseFloat(val);
        if (v > max) this.max = v;
        if (v < min) this.min = v; 
      }
      i++;
    }
    
    //print("\n name: " + this.label + 
    //      "\n min, max: " + this.min + ", " + this.max + 
    //      "\n"); 
  }
}