import 'dart:io';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/api/productos_api.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
import 'package:montedulce_integrador/src/widgets/card_mis_pedidos.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:montedulce_integrador/src/models/Producto.dart';
import 'package:share_extend/share_extend.dart';
import 'package:path_provider/path_provider.dart';

class ReportesPage extends StatefulWidget {
  @override
  _ReportesPageState createState() => _ReportesPageState();
}

class _ReportesPageState extends State<ReportesPage> {

  List<String> listas = ['sds','sdsd','sdsd','sdsd','sdsds','sds'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TituloWidget(titulo: 'Reportes'),
                SizedBox(height: 15.0,),
                Container(
                  height: size.height * 0.75,
                  child: Column(
                    children: [
                      CardPedidoWidget(titulo: "Productos", subtitulo: "Reporte de todos los", subtitulo2: "prouctos", ruta: null, selected: (){
                        _crearPdf(context);
                      }),
                      CardPedidoWidget(titulo: "Pedidos", subtitulo: "Reporte de todos los", subtitulo2: "pedidos", ruta: null, selected: (){
                        _crearPdf2(context);
                      })
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder futureProducto(){
    return FutureBuilder(
      future:  ProductoApi.instance.ListarProducto(),
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return _crearPdf(context);
        }else{
          return Center(child: CircularProgressIndicator(strokeWidth: 4,));
        }
      }
    );
  }
  
  _crearPdf(BuildContext context) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(pdfLib.MultiPage(
      margin: pdfLib.EdgeInsets.all(32),
      build: (context) {
        return <pdfLib.Widget>[
          pdfLib.Header(
              level: 0,
              child: pdfLib.Row(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                  children: <pdfLib.Widget>[
                    pdfLib.Text('Montedulce', textScaleFactor: 2),
                  ])),
          pdfLib.Header(level: 1, text: 'Reporte de productos'),
          pdfLib.Table.fromTextArray(context: context, data: const <List<String>>[
            <String>['Nombre', 'Precio','Categoria'],
            <String>['Torta Helada', '40.0','Tortas'],
            <String>['Torta de chantilli', '45.0','Tortas'],
            <String>['Torta de pina', '15.0','Torta frita'],
            <String>['Torta de Mashmellow', '99.0','Tortas'],
            <String>['Torta de chocolate', '94.0','Tortas']
          ]),
        ];
      },

    ));

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final path = '$dir/pdfProducto.pdf';

    final File file = File(path);
    file.writeAsBytesSync(List.from(await pdf.save()));

    Navigator.push(context,MaterialPageRoute(builder: (context) => PDFScreen(path)));
  }

  _crearPdf2(BuildContext context) async {
    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);
    pdf.addPage(pdfLib.MultiPage(
      margin: pdfLib.EdgeInsets.all(32),
      build: (context) {
        return <pdfLib.Widget>[
          pdfLib.Header(
              level: 0,
              child: pdfLib.Row(
                  mainAxisAlignment: pdfLib.MainAxisAlignment.spaceBetween,
                  children: <pdfLib.Widget>[
                    pdfLib.Text('Montedulce', textScaleFactor: 2),
                  ])),
          pdfLib.Header(level: 1, text: 'Reporte de pedidos'),
          pdfLib.Table.fromTextArray(context: context, data: const <List<String>>[
            <String>['Fecha', 'Estado','Codigo de pago',' Usuario ID'],
            <String>['2021-06-26 5:44:00','contraEntrega',' ','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-06-26 14:22:30','Pendiente','response','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-06-26 23:45:11','Pendiente','pi_1J6lBTD5X8pdWHCbCmAzYhIC','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-06-26 23:06:05','ContraEntrega','','07da76e2-4ddb-4e67-9183-c188b8ebdb90'],
            <String>['2021-06-26 5:41:06','ContraEntrega','','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-06-26 23:39:25','Pendiente','pi_1J6l5qD5X8pdWHCbpbjCSMeO','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-06-26 22:26:34','Pendiente',' ','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-06-26 14:10:22','Pendiente','reposnse','7981fecb-3c34-4598-b137-0cbcd699db31'],
            <String>['2021-06-26 23:40:12','Pendiente','pi_1J9IC2D5X8pdWHCbjt4A1HCQ','778b3d67-4caf-4490-af9c-1ba650de2e37'],
            <String>['2021-07-24 22:40:12','Pendiente','pi_1J9IC2D5X8pdWHCbjt4A1HCQ','778b3d67-4caf-4490-af9c-1ba650de2e37'],
          ]),
        ];
      },

    ));

    final String dir = (await getApplicationSupportDirectory()).path;
    final path = '$dir/pdfPedido.pdf';
    print('AQUI -> '+'$dir/pdfPedido.pdf');
    final File file = File(path);
    file.writeAsBytesSync(List.from(await pdf.save()));
    Navigator.push(context,MaterialPageRoute(builder: (context) => PDFScreen(path)));
  }
}

class PDFScreen extends StatelessWidget {
  
  PDFScreen(this.pathPDF);
  final String pathPDF;
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("Documento"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share), 
            onPressed: (){
              ShareExtend.share(pathPDF,"file",sharePanelTitle: "Enviar PDF");
            }
          ),
        ],
      ),
      path: pathPDF,
    );
  }
}