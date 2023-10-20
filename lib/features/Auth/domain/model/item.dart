class Item{
  String imgpath;
  double price;
  String location;
  String name;

  Item({required this.imgpath, required this.price,  this.location="main", required this.name});
}

final List<Item> items = [
    Item(name:"Tulip",    imgpath: "assets/images/1.webp", price: 12.99,location:"sanaa street"),
  Item(name:"Narcissus",  imgpath: "assets/images/2.webp", price: 14.99,location:"sanaa street"),
  Item(name:"Achburensis",imgpath: "assets/images/3.webp", price: 12.99,location:"sanaa street"),
  Item(name:"Gardenia",   imgpath: "assets/images/4.webp", price: 20.99,location:"sanaa street"),
  Item(name:"Dahlia",     imgpath: "assets/images/5.webp", price: 12.90,location:"sanaa street"),
  Item(name:"Snow Drop",  imgpath: "assets/images/6.webp", price: 25.80,location:"sanaa street"),
  Item(name:"Monflower",  imgpath: "assets/images/7.webp", price: 33.66,location:"sanaa street"),
  Item(name:"Daffodil",   imgpath: "assets/images/8.webp", price: 12.100,location:"sanaa street"),
];


final List<Item> itemss =[



];