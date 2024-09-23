
class Category{
  final String name;
  final int numOfCourse;
  final String image;

  Category(this.name,this.numOfCourse, this.image);
}

var categoriesData  = [
  {"name":"Marketing", "courses":17, 'image':"assets/images/marketing.png"},
  {"name":"UX Design", "courses":25, 'image':"assets/images/ux_design.png"},
  {"name":"Photography", "courses":13, 'image':"assets/images/photography.png"},
  {"name":"Business", "courses":17, 'image':"assets/images/business.png"}
];

List<Category> categories = categoriesData
    .map((item) => Category(item['name'] as String, item['courses'] as int, item['image'] as String))
    .toList();



