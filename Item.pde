class Item{
  private String label;
  private color c;
  private boolean show;
  public FloatDict attributes;
  
  
  Item(String label, color c, TableRow row, TableRow attrLabels){
    this.label = label;
    this.c = c;
    this.show = false;
    this.attributes = new FloatDict();
    print(label + "= \n");
    for (int i = 1; i < row.getColumnCount(); i++){
      this.attributes.set(attrLabels.getString(i), row.getFloat(i));
      print( "\t " + attrLabels.getString(i) + ": " + row.getFloat(i) + "\n");
    }
    print("\n");
  }

}