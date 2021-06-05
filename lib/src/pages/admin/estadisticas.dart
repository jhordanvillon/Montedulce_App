import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:montedulce_integrador/src/pages/admin/widget/titulo_widget.dart';
class EstadisticasPage extends StatefulWidget {
  @override
  _EstadisticasPageState createState() => _EstadisticasPageState();
}

class _EstadisticasPageState extends State<EstadisticasPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFEFDE1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TituloWidget(titulo: 'Estadisticas'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardPedidos(size:size,numero: 250,tipo: 'Pedidos del día',imgLink: 'assets/pedidos_dia.png'),
                    _cardPedidos(size: size,numero: 1800,tipo:'Pedidos totales',imgLink: 'assets/pedidos_totales.png')
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _cardProducto(size: size),
                      _cardReporteDia(size:size)
                    ],
                  ),
                ),
                Container(
                  child: _cardReporteTotal(size:size),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardReporteTotal({Size size}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.only(top: 15),
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 3.0
              )
            ],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Container(
            child: Center(
              child: Text('Ventas Totales',style: TextStyle(color: Color(0xff622420),fontSize: 18),),
            ),
          ),
          SizedBox(height: 20,),
          _graphics(size: size)
        ],
      ),
    );
  }

  Widget _cardPedidos({int numero,Size size,String tipo,String imgLink}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 160,
      width: size.width*0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 3.0
              )
            ],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            child: Center(
              child: Text(tipo,style:TextStyle(fontSize: 18,color:Color(0xff622420))),
            ),
          ),
          Container(
            height: 80,
            width: 80,
            child: Image(
              image: AssetImage(imgLink),
            ),
          ),
          Container(
            child: Center(
              child: Text(numero.toString(),style: TextStyle(fontSize: 18,color: Color(0xff622420)),),
            ),
          )
        ],
      ),
    );
  }

  Widget _cardProducto({Size size}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 190,
      width: size.width*0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 3.0
              )
            ],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Container(
            child: Center(
              child: Text('Producto mas vendido',style:TextStyle(fontSize: 18,color:Color(0xff622420)),textAlign: TextAlign.center,),
            ),
          ),
          Container(
            height: 80,
            width: 80,
            child: Image(
              image: AssetImage('assets/torta1.png'),
            ),
          ),
          Container(
            child: Center(
              child: Text('Torta de chocolate',style:TextStyle(fontSize: 16,color:Color(0xff622420))),
            ),
          ),
          Container(
            child: Center(
              child: Text('3500 Unidades',style:TextStyle(fontSize: 14,color:Color(0xff622420))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardReporteDia({Size size}){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 190,
      width: size.width*0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3.0,
                blurRadius: 3.0
              )
        ],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Center(
              child: Text('Ventas del dia',style:TextStyle(fontSize: 18,color:Color(0xff622420)),textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            width: size.width*0.4,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 20,
                    title: '20%',
                    color: Colors.blue
                  ),
                  PieChartSectionData(
                    value: 40,
                    title: '40%',
                    color: Colors.yellow
                  ),
                  PieChartSectionData(
                    value: 10,
                    title: '10%',
                    color: Colors.orange
                  ),
                  PieChartSectionData(
                    value: 30,
                    title: '30%',
                    color: Colors.green
                  ),
                ]
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _graphics({Size size}){
    return Container(
      height: 180,
      width: size.width*0.8,
      child: LineChart(
        LineChartData(
          minY: 0.0,
          minX: 0.0,
          backgroundColor: Colors.white,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.white,
            ),
            touchCallback: (LineTouchResponse touchResponse) {},
            handleBuiltInTouches: true,
          ),
          borderData: FlBorderData(
            border: Border.all(
              color: Colors.white
            )
          ),
          gridData: FlGridData(
            show: false
          ),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              getTextStyles: (value) => const TextStyle(
                color: Color(0xff622420),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              showTitles: true,
              reservedSize: 22,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 1:
                    return 'ENE';
                  case 2:
                    return 'FEB';
                  case 3:
                    return 'MAR';
                  case 4:
                    return 'ABR';
                  case 5:
                    return 'MAY';
                }
                return '';
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTextStyles: (value) => const TextStyle(
                color: Color(0xff622420),
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 0:
                    return 'S/ 0';
                  case 1:
                    return 'S/ 1000';
                  case 2:
                    return 'S/ 2000';
                  case 3:
                    return 'S/ 3000';
                  case 4:
                    return 'S/ 4000';
                  case 5:
                    return 'S/ 5000';
                }
                return '';
              },
            )
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, 0.8),
                FlSpot(2, 4.8),
                FlSpot(3, 3),
                FlSpot(4, 4),
                FlSpot(5, 3.6),
              ],
              barWidth: 1,
              isCurved: false,
              colors: [
                Color(0xff622420)
              ],
              dotData: FlDotData(
                show: false
              ),
            )
          ]
        )
      ),
    );
  }
}