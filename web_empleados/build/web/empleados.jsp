<%-- 
    Document   : empleados.jsp
    Created on : 12/10/2023, 22:05:33
    Author     : Alejandro Barrientos
--%>
<%-- <%@page import="modelo.Puesto" %> --%>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <h1>Formulario Empleados</h1>
        <button type="button" class="btn btn-info btn-lg" data-bs-toggle="modal" data-bs-target="#modal_empleado" onclick="limpiar()">Nuevo</button>
        
        <div class="container">
            
            <div class="modal fade" id="modal_empleado" role="dialog" <!--tabindex="-1"-->>
                <div class="modal-dialog">
                    
                  <!-- Modal content -->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="sr_empleado" method="post" class="form-group">
                            <label for="lbl_id"><b>ID:</b></label>
                            <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                            <label for="lbl_codigo"><b>Codigo:</b></label>
                            <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo: E001" required>
                            <label for="lbl_nombres"><b>Nombres:</b></label>
                            <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
                            <label for="lbl_apellidos"><b>Apellidos:</b></label>
                            <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 Apellido 2" required>
                            <label for="lbl_direcciion"><b>Direccion:</b></label>
                            <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: # Casa Calle Zona Ciudad" required>
                            <label for="lbl_telefono"><b>Telefono:</b></label>
                            <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 55555555" required>
                            <label for="lbl_telefono"><b>DPI:</b></label>
                            <input type="number" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="Ejemplo: 3048345640116" required>
                            <label for="lbl_telefono"><b>Genero:</b></label>
                            <input type="number" name="txt_genero" id="txt_genero" class="form-control" placeholder="Ejemplo: 1|0" required>
                            <label for="lbl_fn"><b>Fecha Nacimiento:</b></label>
                            <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                            <label for="lbl_puesto"><b>Puesto:</b></label>
                            <select name="drop_puesto" id="drop_puesto" class="form-control">
                                <%
                              //      Puesto puesto = new Puesto();
                                //    HashMap<String,String> drop = puesto.drop_puesto();
                                  //  for(String i: drop.keySet()){
                                   // out.println("<option value='" + i + "' >" + drop.get(i) + "</option>");
                                    //}
                                %>
                            </select>
                            <label for="lbl_fn"><b>Fecha Inicio Labores:</b></label>
                            <input type="datetime-local" name="txt_fil" id="txt_fil" class="form-control" required>
                            <label for="lbl_fi"><b>Fecha Ingreso:</b></label>
                            <input type="date" name="txt_fi" id="txt_fi" class="form-control" required>
                            <br>
                            <div class="btn-group" role="group">
                                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-success">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-warning">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                            </div>
                            <button name="btn_limpiar" id="btn_limpiar" value="limpiar" class="btn btn-secondary" onclick="limpiar()">Limpiar</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                  </div>
                </div>
              </div>
            
            
                <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Direccion</th>
                    <th scope="col">Telefono</th>
                    <th scope="col">DPI</th>
                    <th scope="col">Genero</th>
                    <th scope="col">Fecha Nacimiento</th>
                    <th scope="col">Puesto</th>
                    <th scope="col">Fecha Inicio Labores</th>
                    <th scope="col">Fecha Ingreso</th>
                  </tr>
                </thead>
                <tbody id="tbl_empleados">
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for(int t=0;t<tabla.getRowCount();t++){
                            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_p=" + tabla.getValueAt(t,11) + ">");
                            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,9) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t,10) + "</td>");
                            out.println("</tr>");
                        }   
                    %>
                    
                </tbody>
              </table>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_codigo").val('');
                $("#txt_nombres").val('');
                $("#txt_apellidos").val('');
                $("#txt_direccion").val('');
                $("#txt_telefono").val('');
                $("#txt_fn").val('');
                $("#drop_puesto").val(1);
            }
            
            $('#tbl_empleados').on('click','tr td',function(evt){
                var target,id,id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento; 
                target = $(event.target);
                id = target.parent().data('id');
                id_p = target.parent().data('id_p'); 
                codigo = target.parent("tr").find("td").eq(0).html();
                nombres= target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono = target.parent("tr").find("td").eq(4).html();
                nacimiento = target.parent("tr").find("td").eq(5).html();
                $("#txt_id").val(id);
                $("#txt_codigo").val(codigo);
                $("#txt_nombres").val(nombres);
                $("#txt_apellidos").val(apellidos);
                $("#txt_direccion").val(direccion);
                $("#txt_telefono").val(telefono);
                $("#txt_fn").val(nacimiento);
                $("#drop_puesto").val(id_p);
                $("#modal_empleado").modal('show');
             });
            
        </script>
        
        
    </body>
</html>
