class ProductModel {
  final int id;
  final String name;
  final String image;
  final String category;
  final int price;
  final String description;
  final String fabricCare;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.description,
    required this.fabricCare,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['title'] ?? '',
      image: json['images'][0] ?? '',
      category: json['category']['name'] ?? '',
      price: (json['price'] as num).toInt(),
      description: json['description'],
      fabricCare: 'Dry clean only. 100% Premium Silk.',
    );
  }
}

// final List<ProductModel> dummyProducts = [
//   ProductModel(
//     id: 1,
//     name: 'Obsidian Silk Trench',
//     category: 'Outerwear',
//     price: 895,
//     image:
//         'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'A classic obsidian silk trench coat crafted for modern luxury and timeless elegance.',
//     fabricCare: 'Dry clean only. 100% Premium Silk.',
//   ),
//   ProductModel(
//     id: 2,
//     name: 'Oversized Cotton Hoodie',
//     category: 'Streetwear',
//     price: 320,
//     image:
//         'https://images.unsplash.com/photo-1556905055-8f358a7a47b2?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Heavyweight organic cotton hoodie with a relaxed, modern streetwear drop-shoulder fit.',
//     fabricCare: 'Machine wash cold with like colors. 100% Organic Cotton.',
//   ),
//   ProductModel(
//     id: 3,
//     name: 'Tailored Wool Trousers',
//     category: 'Men',
//     price: 450,
//     image:
//         'https://images.unsplash.com/photo-1617137984095-74e4e5e3613f?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Slim-fit formal wool trousers tailored with precise pleating for executive comfort.',
//     fabricCare: 'Dry clean only. 90% Wool, 10% Cashmere.',
//   ),
//   ProductModel(
//     id: 4,
//     name: 'Minimalist Leather Bag',
//     category: 'Accessories',
//     price: 680,
//     image:
//         'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Sleek everyday shoulder bag made from full-grain leather with brass hardware.',
//     fabricCare: 'Wipe clean with a soft leather conditioner.',
//   ),
//   ProductModel(
//     id: 5,
//     name: 'Double-Breasted Blazer',
//     category: 'Women',
//     price: 790,
//     image:
//         'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Sharp silhouette blazer featuring subtle shoulder pads and custom tortoiseshell buttons.',
//     fabricCare: 'Dry clean only. Viscose blend.',
//   ),
//   ProductModel(
//     id: 6,
//     name: 'Cashmere Knit Sweater',
//     category: 'Outerwear',
//     price: 520,
//     image:
//         'https://images.unsplash.com/photo-1576995853123-5a10305d93c0?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Ultra-soft knitted crewneck sweater designed for lightweight warmth during cold seasons.',
//     fabricCare: 'Hand wash cold or dry clean. 100% Mongolian Cashmere.',
//   ),
//   ProductModel(
//     id: 7,
//     name: 'Classic Denim Jacket',
//     category: 'Streetwear',
//     price: 280,
//     image:
//         'https://images.unsplash.com/photo-1543076447-215ad9ba6923?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Vintage washed denim jacket featuring reinforced stitching and custom metal buttons.',
//     fabricCare: 'Machine wash inside out. 100% Rigid Denim.',
//   ),
//   ProductModel(
//     id: 8,
//     name: 'Pleated Midi Skirt',
//     category: 'Women',
//     price: 360,
//     image:
//         'https://images.unsplash.com/photo-1583496661160-fb5886a0aaaa?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'High-waisted knife-pleated midi skirt with a subtle satin shimmer effect.',
//     fabricCare: 'Gentle machine wash in mesh bag. 100% Polyester.',
//   ),
//   ProductModel(
//     id: 9,
//     name: 'Leather Chelsea Boots',
//     category: 'Accessories',
//     price: 490,
//     image:
//         'https://images.unsplash.com/photo-1608256246200-53e635b5b65f?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Handcrafted leather boots with elastic side panels and durable rubber soles.',
//     fabricCare: 'Treat with leather wax periodically. Genuine Calfskin.',
//   ),
//   ProductModel(
//     id: 10,
//     name: 'Structured Linen Shirt',
//     category: 'Men',
//     price: 210,
//     image:
//         'https://images.unsplash.com/photo-1598033129183-c4f50c736f10?q=80&w=1000&auto=format&fit=crop',
//     description:
//         'Breathable European linen shirt perfect for smart-casual summer layering.',
//     fabricCare: 'Machine wash warm, hang dry. 100% Linen.',
//   ),
// ];
