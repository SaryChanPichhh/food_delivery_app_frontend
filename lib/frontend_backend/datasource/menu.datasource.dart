import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/dto/respone/menu.res.dto.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MenuDataSource extends DataGridSource {
  MenuDataSource({required List<MenuResponeDto> menus}) {
    dataGridRows = menus.map<DataGridRow>((menu) {
      return DataGridRow(
        cells: [
          DataGridCell<String>(columnName: 'id', value: menu.id),
          DataGridCell<String>(columnName: 'name', value: menu.name),
          DataGridCell<String>(
            columnName: 'description',
            value: menu.description,
          ),
          DataGridCell<String>(columnName: 'price', value: menu.price),
          DataGridCell<String>(columnName: 'cateName', value: menu.resName),
          DataGridCell<String>(columnName: 'resName', value: menu.resName),
        ],
      );
    }).toList();
  }
  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int rowIndex = dataGridRows.indexOf(row);

    final bool isEven = rowIndex % 2 == 0;
    return DataGridRowAdapter(
      color: isEven ? Colors.green.shade50 : Colors.white,
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
