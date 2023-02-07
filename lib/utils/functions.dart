import 'package:flutter/material.dart';

import 'constantes.dart';

Future<DateTime?> showMyDatePciker(
  BuildContext context,
) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: minDate,
    lastDate: maxDate,
    fieldLabelText: "Pick Date",
    fieldHintText: 'Month/Date/Year',
  );
}
