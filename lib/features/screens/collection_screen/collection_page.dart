import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pixelfield/core/app_colors.dart';
import 'package:pixelfield/core/custom_text.dart';
import 'package:pixelfield/core/custom_text_field_search.dart';
import 'package:pixelfield/core/text_styles.dart';
import 'package:pixelfield/features/controllers/product_controller/list_product_cubit.dart';
import 'package:pixelfield/features/controllers/product_controller/list_product_state.dart';
import 'package:pixelfield/features/screens/product/product_details.dart';
import 'package:pixelfield/features/screens/widgets/collection_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late ListProductControllerCubit listProductControllerCubit;
  final RefreshController refreshController =  RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listProductControllerCubit = BlocProvider.of<ListProductControllerCubit>(context)..getProductCubit();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ListProductControllerCubit,ListProductState>(builder: (context,state){
      return  Column(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextSearchField(
              placeholder: "Search",
              controller: listProductControllerCubit.searchController,
              onChange: listProductControllerCubit.onSearchChanged,
              suffix: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:   const Icon(Icons.search),
              ),
            ),
          ),
            const SizedBox(height: 20,),
            Builder(builder: (context){
              if(state is ListProductLoaded){
              return  Expanded(
                child: SmartRefresher(
                  reverse: false,
                  enablePullDown: true,
                  enablePullUp: true,
                  footer: CustomFooter(
                    builder: (BuildContext context,LoadStatus? mode){
                      Widget body ;
                      if(mode==LoadStatus.idle){
                        body =  const Text("No more Data");
                      }
                      else if(mode==LoadStatus.loading){
                        body =  const CupertinoActivityIndicator();
                      }
                      else if(mode == LoadStatus.failed){
                        body = const Text("Load Failed!Click retry!");
                      }
                      else if(mode == LoadStatus.canLoading){
                        body = const Text("release to load more");
                      }
                      else{
                        body = const Text("No more data");
                      }
                      return Container(
                        height: 55.0,
                        child: Center(child:body),
                      );
                    },
                  ),
                  controller: refreshController,
                  onRefresh: (){
                    listProductControllerCubit.onRefresh(refreshController);
                  },
                  onLoading: (){
                    listProductControllerCubit.onLoading(refreshController);
                  },
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
                    itemCount: state.listProducts.length,
                    gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 305,
                        mainAxisSpacing: 10,
                        crossAxisSpacing:8

                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(() => const ProductDetailsPage());
                        },
                        child: CollectionItem(
                          title: state.listProducts[index].title ?? "",
                          subtitle:state.listProducts[index].subTitle ?? "",
                          details: "${state.listProducts[index].quantity ?? "0"}/${state.listProducts[index].stock ?? "0"}",
                        ),
                      );
                    },
                  ),
                ),
              );
              }else if(state is ListProductInitial){
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is ListProductError){
                return Center(child: CustomText(text: state.message, style: TextStyles.subHeaderStyle),);
              }else{
                return const SizedBox.shrink();
              }
             }),

        ],
      );


    });
  }
}