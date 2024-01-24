import 'package:flutter/material.dart';

SizedBox sizedten(BuildContext ctx) {
  return SizedBox(
    height: (MediaQuery.of(ctx).size.height) / 80,
  );
}

SizedBox sizedtwenty(BuildContext ctx) {
  return SizedBox(
    height: (MediaQuery.of(ctx).size.height) / 40,
  );
}

SizedBox sizedwfive(BuildContext ctx) {
  return SizedBox(
    width: (MediaQuery.of(ctx).size.height) / 160,
  );
}

SizedBox sizedwten(BuildContext ctx) {
  return SizedBox(
    width: (MediaQuery.of(ctx).size.height) / 80,
  );
}