library;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam_task/src/core/controllers/base_controller_state.dart';
import 'package:izam_task/src/core/controllers/base_list_controller.dart';
import 'package:izam_task/src/core/controllers/cubit_status.dart';
import 'package:izam_task/src/features/catalog/catalog.dart';
import 'package:json_annotation/json_annotation.dart';

part 'domain/models/cart_item.dart';

part 'presentation/controllers/cart_controller.dart';

part 'presentation/views/cart_view.dart';
part 'presentation/views/receipt_sheet.dart';

part 'cart.g.dart';