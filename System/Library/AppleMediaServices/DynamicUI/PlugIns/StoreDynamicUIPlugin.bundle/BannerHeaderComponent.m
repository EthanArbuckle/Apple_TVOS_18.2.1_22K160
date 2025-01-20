@interface BannerHeaderComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)init;
- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BannerHeaderComponent

- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent *)sub_19D98();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1A594();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1A650();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v5 = self;
  sub_1B540();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC20StoreDynamicUIPlugin21BannerHeaderComponent)init
{
}

- (void).cxx_destruct
{
  sub_AC90( *(void *)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BannerHeaderComponent_artworkFetcher],  *(void *)&self->bannerStyle[OBJC_IVAR____TtC20StoreDynamicUIPlugin21BannerHeaderComponent_artworkFetcher]);
}

@end