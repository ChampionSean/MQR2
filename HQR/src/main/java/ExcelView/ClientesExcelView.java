/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExcelView;

import MapeoBD.Cliente;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

/**
 *
 * @author Salvador
 */
public class ClientesExcelView extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, 
                                        HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    response.setHeader("Content-Disposition", "attachment; filename=\"datos Clientes.xls\"");

    Sheet sheet = workbook.createSheet("Datos_Clientes");
    List<Cliente> clientes = (List) model.get("clientes");
    
    Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("Correo");
        header.createCell(1).setCellValue("Nombre");
        header.createCell(2).setCellValue("Apellido Paterno");
        header.createCell(3).setCellValue("Apellido Materno");
        header.createCell(4).setCellValue("Telefono Local");
        header.createCell(5).setCellValue("Telefono Movil");
        header.createCell(6).setCellValue("Area");
        header.createCell(7).setCellValue("Puesto");
        header.createCell(8).setCellValue("Nombre Empresa");
        
    int contador = 1;
       
        for (Cliente cliente : clientes) {
             
            Row courseRow = sheet.createRow(contador);
                courseRow.createCell(0).setCellValue(cliente.getPersona_id().getCorreo());          
                courseRow.createCell(1).setCellValue(cliente.getPersona_id().getNombre());
                courseRow.createCell(2).setCellValue(cliente.getPersona_id().getApellido_paterno());
                courseRow.createCell(3).setCellValue(cliente.getPersona_id().getApellido_materno());
                courseRow.createCell(4).setCellValue(cliente.getPersona_id().getTelefono_local());
                courseRow.createCell(5).setCellValue(cliente.getPersona_id().getTelefono_movil());             
                courseRow.createCell(6).setCellValue(cliente.getArea());
                courseRow.createCell(7).setCellValue(cliente.getPuesto());
                courseRow.createCell(8).setCellValue(cliente.getNombre_empresa());
                
            contador++;
        
        }
    // Hace que el ancho de la comlumna sea lo suficientemente grande
        // para que la información sea desplegada adecuadamente.
        sheet.autoSizeColumn(0);
        sheet.autoSizeColumn(1);
        sheet.autoSizeColumn(2);
        sheet.autoSizeColumn(3);
        sheet.autoSizeColumn(4);
        sheet.autoSizeColumn(5);
        sheet.autoSizeColumn(6);
        sheet.autoSizeColumn(7);
        sheet.autoSizeColumn(8);
        
        
    }
}