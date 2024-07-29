import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/widget/article_item_widget.dart';
import 'package:flutter_wan_android/app/modules/widget/carousel/carousel_slider.dart';
import 'package:flutter_wan_android/app/routes/routes.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_page.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'search/search_delegate_page.dart';

class HomePage extends GetRefreshPage<HomeController> {
  const HomePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: Text(Strings.label.tr,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            centerTitle: false,
            snap: true,
            pinned: true,
            floating: true,
            actions: [
              IconButton(
                  onPressed: () => showSearch(
                      context: context,
                      delegate: SearchBarDelegate(
                          controller: controller, hintText: Strings.search.tr)),
                  icon: const Icon(Icons.search))
            ],
          ),
        ];
      },
      body: buildObxRefreshListPage<ArticleEntity>(
        padding: const EdgeInsets.all(6),
        separatorBuilder: (item, index) => const SizedBox(height: 3),
        itemBuilder: (item, index) {
          var banner = item.banner;

          if (banner != null && banner.isNotEmpty) {
            return CarouselSlider.builder(
                options: CarouselOptions(
                  height: 240,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                ),
                itemCount: banner.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: borderRadius()),
                    child: InkWell(
                      borderRadius: borderRadius(),
                      onTap: () => Routes.toNamed(Routes.articleDetail,
                          args: ArticleEntity(
                              title: banner[itemIndex].title,
                              link: banner[itemIndex].url)),
                      child: ClipRRect(
                        borderRadius: borderRadius(),
                        child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: banner[itemIndex].imagePath ?? ""),
                      ),
                    ),
                  );
                });
          }

          return ArticleItemWidget(item);
        },
      ),
    );
  }

  borderRadius() => const BorderRadius.all(Radius.circular(8));
}
