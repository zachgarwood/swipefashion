library item;

class Item {
    String name;
    double price;
    String image;
    String url;

    Item(this.name, this.price, this.image, this.url);

    Item.fromJson(Map<String, dynamic> json): this(json['name'], json['price'], json['image'], json['url']);
}
