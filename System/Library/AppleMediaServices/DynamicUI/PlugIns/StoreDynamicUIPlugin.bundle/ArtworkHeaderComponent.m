@interface ArtworkHeaderComponent
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC20StoreDynamicUIPlugin22ArtworkHeaderComponent)init;
- (_TtC20StoreDynamicUIPlugin22ArtworkHeaderComponent)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ArtworkHeaderComponent

- (_TtC20StoreDynamicUIPlugin22ArtworkHeaderComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22ArtworkHeaderComponent *)sub_16C44( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_16E40();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_16EE4();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v8 = self;
  double v9 = sub_18178(width, height, a4);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC20StoreDynamicUIPlugin22ArtworkHeaderComponent)init
{
}

- (void).cxx_destruct
{
  swift_release();
}

@end