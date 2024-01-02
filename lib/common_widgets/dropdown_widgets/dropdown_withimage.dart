import 'package:base_flutter_provider_project/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


import '../../constants/local_images.dart';
import '../../data/models/Explore_model/ExploreModel.dart';
import '../../utils/common_functions.dart';
import '../../viewModel/dashboard_view_model.dart';
import '../../viewModel/explore_view_model.dart';


class DropdownItem {
  final String text;
  final String imagePath;


  DropdownItem({
    required this.text,
    required this.imagePath,
  });
}


class DropdownWithImageSelection extends StatefulWidget {

  final ValueChanged<DropdownItem?>? onItemSelected;
  final ValueChanged<Stocks?>? onItemSelected2;
  final double devicewidth;
  final bool isExploreDetail;
  final Stocks? selectedStocks;

  DropdownWithImageSelection({

    this.onItemSelected,
    this.onItemSelected2,
    required this.devicewidth,
    required this.isExploreDetail,
    required this.selectedStocks,

  });

  @override
  _DropdownWithImageSelectionState createState() =>
      _DropdownWithImageSelectionState();
}

class _DropdownWithImageSelectionState
    extends State<DropdownWithImageSelection> {
  DropdownItem? _selectedItem;
  Stocks? _selectedItem2;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('widget.isExploreDetail.... ${widget.isExploreDetail}');
    return  widget.isExploreDetail?
    Consumer<ExploreViewModel>(
        builder: (context, expdata, child) {
       //   print('expdata.... ${expdata.exploreModel?.data?.stocks?[0].name}');
          addStock(expdata.exploreModel?.data?.stocks);
            return  Container(
         //    color: Colors.orange.shade100,
            height: 50,
            width: widget.devicewidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex:1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                      ),
                      child: Image.network(
                     //   widget.items[_selectedIndex].imagePath,
                          expdata.exploreModel?.data?.stocks?[_selectedIndex].photoUrl ?? "",
                      ),
                    ),
                  ),
                ),
               // SizedBox(width: 18),
                Expanded(
                  flex: 3,
                  child: DropdownButton<int>(
                    isDense: true,
                    isExpanded: true,
                    value: _selectedIndex,
                    itemHeight: null,
                    onChanged: (int? newIndex) {
                      setState(() {
                        _selectedIndex = newIndex!;
                      //  _selectedItem = widget.items[newIndex];
                        _selectedItem2 =expdata.exploreModel?.data?.stocks?[newIndex];
                      });
                     // widget.onItemSelected?.call(_selectedItem);
                      widget.onItemSelected2?.call(_selectedItem2);
                    },
                    items: expdata.exploreModel?.data?.stocks?.asMap().entries.map((entry) {
                      int index = entry.key;
                     // DropdownItem item = entry.value;
                      Stocks item = entry.value;
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Container(
                            child: Text(item.name??"",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      );
                    }).toList(),
                    underline: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Appcolors.txtlitegrey,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    icon: Icon(Icons.arrow_drop_down), // Add the dropdown icon here
                  ),
                ),
              ],
            ),
          );
        }) :


    Consumer<DashboardViewModel>(
        builder: (context, dashfildata, child) {
          return  Container(
             // color: Colors.orange,
            height: 50,
            width: widget.devicewidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex:1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6)),
                      ),
                      child: Container(
                        // bgclr 1
                    //    color: Colors.blue,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child:  dashfildata.dashboardFilterResponseModel?.data?[_selectedIndex].stock?.photoUrl != null &&  dashfildata.dashboardFilterResponseModel?.data?[_selectedIndex].stock?.photoUrl != ""
                                    ?  Image.network(
                                    dashfildata.dashboardFilterResponseModel?.data?[_selectedIndex].stock?.photoUrl ?? "",
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ) : PlaceholderImage(),
                              ),
                            ),
                          ],
                        ),
                      )




                    ),
                  ),
                ),
              //  SizedBox(width: 18),
                Expanded(
                  flex: 5,
                  child: DropdownButton<int>(
                    isDense: true,
                    isExpanded: true,
                    value: _selectedIndex,
                    itemHeight: null,
                    onChanged: (int? newIndex) {
                      setState(() {
                        _selectedIndex = newIndex!;
                        _selectedItem2 =dashfildata.dashboardFilterResponseModel?.data?[newIndex].stock;
                      });
                      widget.onItemSelected2?.call(_selectedItem2);
                    },
                  //  items: expdata.exploreModel?.data?.stocks?.asMap().entries.map((entry) {
                    items: dashfildata.dashboardFilterResponseModel?.data?.asMap().entries.map((entry) {
                      int index = entry.key;
                      // DropdownItem item = entry.value;
                      Stocks? item = entry.value.stock;
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Container(
                            child: Text(item?.name??"")),
                      );
                    }).toList(),
                    underline: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Appcolors.txtlitegrey,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    icon:   SvgPicture.asset(LocalSVGImages.buydwn,
                        height: 15, width: 15), // Add the dropdown icon here
                  ),
                ),
              ],
            ),
          );
        });


  }

  void addStock(List<Stocks>? stocks) {
    if(stocks != null && stocks.isNotEmpty){
      for(var i = 0; i < stocks.length; i++){
        if(widget.selectedStocks?.name == stocks[i].name){
          print('stock length ${i}');
          _selectedIndex =i;
        }

      }
    }
  }
}

/*
class DropdownWithImageSelection extends StatefulWidget {
  final List<DropdownItem> items;
  final ValueChanged<DropdownItem?>? onItemSelected;
  final double devicewidth;

  DropdownWithImageSelection({
    required this.items,
    required this.devicewidth,
    this.onItemSelected,
  });

  @override
  _DropdownWithImageSelectionState createState() =>
      _DropdownWithImageSelectionState();
}

class _DropdownWithImageSelectionState
    extends State<DropdownWithImageSelection> {
  DropdownItem? _selectedItem;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: widget.devicewidth,
      color: Colors.orange,
      child: DropdownButton<int>(
        value: _selectedIndex,
        onChanged: (int? newIndex) {
          setState(() {
            _selectedIndex = newIndex!;
            _selectedItem = widget.items[newIndex];
          });
          widget.onItemSelected?.call(_selectedItem);
        },
        items: widget.items.asMap().entries.map((entry) {
          int index = entry.key;
          DropdownItem item = entry.value;
          return DropdownMenuItem<int>(
            value: index,
            child: Container(
              width: widget.devicewidth/2+50,
              height: 80,
            //  color: Colors.yellow,
              child: Row(
                children: [
                  Expanded(
                    flex:3,
                    child: Image.network(
                      item.imagePath,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                      flex: 2,
                      child: Text(item.text)),
                ],
              ),
            ),
          );
        }).toList(),
        underline: Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 18),
          child: Container(
            width: widget.devicewidth,
            height: 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Appcolors.txtlitegrey,
                  width: 1
                )
              )
            ),
          ),
        ),
      ),
    );
  }
}
*/
