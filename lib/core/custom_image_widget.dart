import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageWidget {
  static displayImage(imagePath, {double radius = 30.0, double? height, double? width}) {
    return CachedNetworkImage(
        imageUrl: "$imagePath",
        height: height,
        width: width,
        placeholder: (context, url) {
          return radius > 0
              ? Container(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10, bottom: 5),
            width: radius ,
            height:radius ,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black26
            ),

          )
              : Container(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10, bottom: 5),
            width: radius ,
            height: radius ,
            decoration:  BoxDecoration(
              // shape: BoxShape.circle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.withOpacity(0.1))
            ),

          );
        },
        errorWidget: (context, url, error) {
          return radius > 0
              ?
          Container(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10, bottom: 5),
            width: radius,
            height: radius,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black26,
              border: Border.all(color: Colors.grey[100]!),
            ),

          )
              :
          Container(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10, bottom: 5),
            width: radius,
            height: radius,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black26,
              border: Border.all(color: Colors.grey[100]!),
            ),

          );
        },
        imageBuilder: (context, image) {
          return radius > 0
              ? CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: image,
            radius: radius,
          )
              : Image(
            image: image,
            fit: BoxFit.cover,
          );
        });
  }

  static displayLocalImage(String filePath, {double radius = 30.0, double? height, double? width, Color? color}) {
    return radius > 0
        ? CircleAvatar(
      backgroundColor: Colors.black26,
      backgroundImage: (AssetImage('assets/images/$filePath')) as ImageProvider<Object>?,
      radius: radius,
    )
        : Image(
      fit: BoxFit.fitHeight,
      height: height,
      width: width,
      color: color,

      image: ( AssetImage('assets/images/$filePath',)) as ImageProvider<Object>,
    );
  }// Example color
}