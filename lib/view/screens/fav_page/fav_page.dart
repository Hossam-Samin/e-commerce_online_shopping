import 'package:e_commerce/controller/favirote_feature/fav_cubit.dart';
import 'package:e_commerce/controller/favirote_feature/fav_state.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/view/constans/app_assets_images/app_assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../controller/favirote_feature/db_helper.dart';
import '../../../model/favirote_model/favirote_model.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaviroteCubit, FaviroteState>(builder: (context, state) {
      FaviroteCubit faviroteCubit = Provider.of(context);
      return Scaffold(
        body: FutureBuilder<List<FaviroteModel>>(
          future: faviroteCubit.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    margin: const EdgeInsets.only(top: 80),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(bottom: 70),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.3,
                        image: AssetImage(AppAssets.noResult),
                      ),
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor: Colors.deepPurple.shade100,
                                    icon: Icons.add_circle_outline_rounded,
                                    label: S.of(context).add,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  const SizedBox(width: 10),
                                  SlidableAction(
                                    onPressed: (context) {
                                      dbHelper!
                                          .delete(snapshot.data![index].id);
                                      faviroteCubit.removeCounter();
                                      faviroteCubit.removeTotalPrice(snapshot
                                          .data![index].price!
                                          .toDouble());
                                    },
                                    backgroundColor: Colors.redAccent,
                                    icon: Icons.delete_rounded,
                                    label: S.of(context).delete,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ],
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.amber.withOpacity(0.2)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 100,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "${snapshot.data![index].images}"),
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                    "${snapshot.data![index].title}",
                                                    style: const TextStyle(
                                                      fontFamily: "Rubik",
                                                    )),
                                                subtitle: Text(
                                                    r"$ "
                                                    "${snapshot.data![index].price} ",
                                                    style: const TextStyle(
                                                      fontFamily: "Rubik",
                                                    )),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        faviroteCubit
                                                            .removeIncAndDecCounter();
                                                      },
                                                      icon: const Icon(Icons
                                                          .remove_circle_outline_rounded),
                                                    ),
                                                  ),
                                                  Text(
                                                    faviroteCubit
                                                        .getIncAndDecCounter()
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: "Rubik"),
                                                  ),
                                                  Expanded(
                                                    child: IconButton(
                                                      onPressed: () {
                                                        faviroteCubit
                                                            .addIncAndDecCounter();
                                                      },
                                                      icon: const Icon(Icons
                                                          .add_circle_outline_rounded),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    });
  }
}
