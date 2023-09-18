import 'package:e_commerce/controller/favirote_feature/fav_cubit.dart';
import 'package:e_commerce/controller/favirote_feature/fav_state.dart';
import 'package:e_commerce/model/favirote_model/favirote_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../controller/favirote_feature/db_helper.dart';

class CustomCategoriesCard extends StatefulWidget {
  CustomCategoriesCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  String image;
  String title;
  double price;

  @override
  State<CustomCategoriesCard> createState() => _CustomCategoriesCardState();
}

class _CustomCategoriesCardState extends State<CustomCategoriesCard> {
  DBHelper? dbHelper = DBHelper();
  bool favIcon = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaviroteCubit, FaviroteState>(builder: (context, state) {
      FaviroteCubit faviroteCubit = Provider.of(context);
      return Container(
        margin: const EdgeInsets.all(20),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.fill,
                opacity: .6)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: IconButton(
                onPressed: () {
                  dbHelper!
                      .insert(FaviroteModel(
                    images: widget.image,
                    title: widget.title,
                    price: widget.price,
                  ))
                      .then((value) {
                    print("Cart is added");
                    faviroteCubit.addCounter();
                    faviroteCubit.addTotalPrice(widget.price);
                  }).onError((error, stackTrace) {
                    print(error.toString());
                  });
                  setState(() {
                    favIcon = !favIcon;
                  });
                },
                icon: favIcon == true
                    ? const Icon(Icons.favorite_outline_rounded)
                    : const Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.redAccent,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: ListTile(
                title: Text(
                  widget.title,
                  style: const TextStyle(fontFamily: "Rubik", fontSize: 14),
                ),
                subtitle: Text(
                  r"$ " "${widget.price}",
                  style: const TextStyle(fontFamily: "Rubik"),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
