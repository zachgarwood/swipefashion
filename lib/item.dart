library item;

class Item {
    int id;
    String name;
    double price;
    String image;
    String url;

    Item(this.id, this.name, this.price, this.image, this.url);

    Item.fromJson(Map<String, dynamic> json): this(json['id'], json['name'], json['price'], json['image'], json['url']);
}
