import 'package:flutter/material.dart';
import 'package:newz/components/articles_detailed_view.dart';
import 'package:newz/models/news.dart';
import 'package:newz/models/news_data.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  List<NewsData> articles = [];

  bool _loading = true;

  @override
  void initState() {
    // implement initState
    super.initState();
    getNewsArticles();
  }

  getNewsArticles() async {
    News newh = News();
    await newh.getNews();
    articles = newh.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 120,vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black45,
              ),
              child: Text(
                'Newz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _loading ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ) : Container(
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
              height: size.height,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsTile(
          imageUrl: articles[index].urlToImage!,
          title: articles[index].title!,
          description: articles[index].description!,
          url: articles[index].url!,
                  );
                }
                ),
            ),
        ],
      ),
    );
  }
}


//News tiles
class NewsTile extends StatelessWidget {

  final String imageUrl, title, description, url;

  NewsTile({required this.imageUrl, required this.title, required this.description, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(articleUrl: url,),),);
      },
          child: Container(
        child: Column(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(imageUrl,)),
                SizedBox(height: 15.0),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),),
                SizedBox(height: 10.0),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}