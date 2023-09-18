import 'package:e_commerce/controller/favirote_feature/fav_cubit.dart';
import 'package:e_commerce/controller/favirote_feature/fav_state.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/controller/payment/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaviroteCubit, FaviroteState>(builder: (context, state) {
      FaviroteCubit faviroteCubit = Provider.of(context);
      faviroteCubit.removeTotalPrice;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                width: 370,
                margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.amber.withOpacity(0.2)),
                child: Column(
                  children: [
                    Text(
                      "${S.of(context).total_price} ${faviroteCubit.getTotalPrice().toStringAsFixed(2)}",
                      style: const TextStyle(fontFamily: "Rubik"),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () => PaymentManager.makePayment(120, "USD"),
                      color: Colors.green.withOpacity(.3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        S.of(context).payment,
                        style: const TextStyle(fontFamily: "Rubik"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
