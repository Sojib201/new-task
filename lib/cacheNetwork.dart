import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetwork extends StatefulWidget {
  const CacheNetwork({super.key});

  @override
  State<CacheNetwork> createState() => _CacheNetworkState();
}

class _CacheNetworkState extends State<CacheNetwork> {
  String imgURL =
      'https://cdn-images-3.listennotes.com/podcasts/hii-b3H-R8cLnBo-HsphYnjlby6.1400x1400.jpg?_gl=1*1iom6ve*_ga*MTcxNjA1MzE1OC4xNzMzMzkwMDgx*_ga_T0PZE2Z7L4*MTczMzM5MDA4MC4xLjAuMTczMzM5MDA4Mi41OC4wLjA.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cache Network Image'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Text('Cache Network Image',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              CachedNetworkImage(
                imageUrl: imgURL,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 200,
                width: 200,
              ),
              SizedBox(height: 50,),
              Text('Regular Network Image',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Image.network(imgURL,height: 200,width: 200,errorBuilder: (context, error, stackTrace) {return Text('Network Disconnected');

              },)
        
            ],
          ),
        ),
      ),
    );
  }
}
