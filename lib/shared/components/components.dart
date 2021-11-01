import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/modules/webview/webview.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

Widget defaultForm({
  context,
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  bool visible = false,
  Function? suffixPressed,
  required Function validate,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CacheHelper.getData(key: 'theme') == true
            ? Colors.grey[900]
            : Colors.white,
      ),
      child: TextFormField(
          controller: controller,
          onFieldSubmitted: (value) => onSubmit!(value),
          onChanged: (value) => onChange!(value),
          validator: (value) => validate(value),
          onTap: () => onTap!(),
          keyboardType: type,
          obscureText: isPassword,
          style: TextStyle(
            color: CacheHelper.getData(key: 'theme') == true
                ? Colors.white
                : Colors.black,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            prefixIcon: Icon(
              prefix,
              color: Colors.grey,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                onPressed: () => suffixPressed!(), icon: Icon(suffix))
                : null,
            labelStyle: TextStyle(color:CacheHelper.getData(key: 'theme')? Colors.grey:Colors.black),
          )),
    );
Widget newsView({required dynamic n, required int i, required context}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              NewsCubit.get(context).selectItem(index);
              //pushTo(context, WebViewScreen(n[index]['url']));
            },
            child: Container(
              color: NewsCubit.get(context).selected==index && NewsCubit.get(context).isDesktop ?Colors.blue:null,
              child: Card(
                color: CacheHelper.getData(key: 'theme')?Colors.grey[900]:Colors.white,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(

                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: '${n[index]['urlToImage']}',
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Icon(Icons.image_not_supported,size: 100,color: Colors.blue,),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${n[index]['title']} ",
                              maxLines: 3,
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              "${n[index]['publishedAt']}",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,

          ),
          itemCount: i),
    );
void pushTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
void pushToAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      ((route) =>false));
}