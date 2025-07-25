library;

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izam_task/src/core/controllers/base_controller_state.dart';
import 'package:izam_task/src/core/controllers/base_list_controller.dart';
import 'package:izam_task/src/core/controllers/cubit_status.dart';
import 'package:izam_task/src/core/error/exception.dart';
import 'package:izam_task/src/core/router/routes.dart';
import 'package:izam_task/src/core/utils/injector.dart';
import 'package:izam_task/src/features/cart/cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data/catalog_datasource.dart';
part 'data/catalog_repository.dart';

part 'domain/models/catalog_item.dart';

part 'presentation/controllers/catalog_controller.dart';

part 'presentation/views/catalog_item_builder.dart';
part 'presentation/views/catalog_view.dart';

part 'catalog.g.dart';
