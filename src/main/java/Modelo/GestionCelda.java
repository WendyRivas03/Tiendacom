
package Modelo;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class GestionCelda extends DefaultTableCellRenderer{
    
    public Component getTableCellRenderComponent(JTable tabla, Object value, boolean isSelected,
    boolean hasFocus,int row, int column){
        Component c = super.getTableCellRendererComponent(tabla, value, isSelected, hasFocus, row, column);
        c.setForeground(new java.awt.Color(0, 0, 0));
        c.setFont(new java.awt.Font("Yu Gothic UI", 0, 14));
        return null;
        
    }
}
