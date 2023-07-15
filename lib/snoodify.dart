import 'package:flutter/material.dart';

class snoodify extends StatefulWidget {
  const snoodify({Key? key}) : super(key: key);

  @override
  State<snoodify> createState() => _snoodifyState();
}

class _snoodifyState extends State<snoodify> {
  List<GridItem> gridItems = [
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Ladies Room',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Male Room',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Kids Room',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Gender-Fluid Room',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Luxury Brands',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Oversized Clothes',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Plus Size',
    ),
    GridItem(
      image: 'assets/images/shop.png',
      text: 'Other',
    ),
  ];

  final List<String> pages = [
    'All',
    'Dresses',
    'Over-sized Tees',
    'Pants',
    'Joggers'
  ];

  final List<Product> products = [
    Product(
        name: 'Brand Name', price: 'INR 2100', image: 'assets/images/shop.png'),
    Product(
        name: 'Brand Name', price: 'INR 1900', image: 'assets/images/shop.png'),
    // Add more products if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              // Handle back button press
            },
          ),
          title: Text(
            'Fashion',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.black,
              onPressed: () {
                // Handle icon1 press
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border_rounded),
              color: Colors.black,
              onPressed: () {
                // Handle icon1 press
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_bag_outlined),
              color: Colors.black,
              onPressed: () {
                // Handle icon1 press
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GridTile(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                      gridItems[index].image,
                                      height: 15,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    gridItems[index].text,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: gridItems.length,
                      ),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 8.0,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/shop3.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 5),
                            height: 50,
                            child: Text(
                              'Trending in Fashion',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            pages.length,
                            (index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[300],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                onPressed: () {
                                  // Handle button press
                                  print('Button ${pages[index]} pressed');
                                },
                                child: Text(
                                  pages[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: Container(
                      height: 300,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container( width: 200, height: 140,

                                child: Image.asset(products[index].image, ),

                                ),
                                SizedBox(height: 8.0),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 10),

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          products[index].name,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),

                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    products[index].price,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class GridItem {
  final String image;
  final String text;

  GridItem({
    required this.image,
    required this.text,
  });
}

class Product {
  final String name;
  final String price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}
