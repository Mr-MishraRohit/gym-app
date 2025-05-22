class SliderModel{
  String image;
  String icons;
  String title;
  String description;


// Constructor for variables
  SliderModel({required this.title, required this.description, required this.image, required this.icons});

  void setImage(String getImage){
    image = getImage;
  }
  void setIcons(String getIcons){
    icons = getIcons;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDescription(String getDescription){
    description = getDescription;
  }

  String getImage(){
    return image;
  }
  String getIcons(){
    return icons;
  }

  String getTitle(){
    return title;
  }
  String getDescription(){
    return description;
  }
}
