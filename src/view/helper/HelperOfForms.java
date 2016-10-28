/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view.helper;

import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author winvm
 */
public class HelperOfForms {

    /**
     * Return the value of the cell indicated.
     *
     * @param table JTable
     * @param model DefaultTableModel
     * @param column Column of the model
     * @return int
     * @throws Exception
     */
    public static int getValueOfCell(JTable table, DefaultTableModel model, int column) throws Exception {
        Integer index = table.convertRowIndexToModel(table.getSelectedRow());
        return Integer.valueOf(model.getValueAt(index, column).toString());
    }

    public static void initTable(JTable table, CustomTableModel model, String[] columns) {
        for (String column : columns) {
            model.addColumn(column);
        }
        table.setModel(model);
    }

    public static void cleanModel(CustomTableModel model) {
        int rows = model.getRowCount();
        for (int i = 0; i < rows; i++) {
            model.removeRow(0);
        }
    }

    public static void cleanJComboBox(JComboBox comboBox, String message) {
        comboBox.removeAllItems();
        comboBox.addItem(message);
    }

}
