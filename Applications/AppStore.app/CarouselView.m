@interface CarouselView
- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D312CarouselView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D312CarouselView)initWithFrame:(CGRect)a3;
- (void)addSubview:(id)a3;
@end

@implementation CarouselView

- (void)addSubview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CarouselView();
  id v4 = a3;
  id v5 = v8.receiver;
  -[CarouselView addSubview:](&v8, "addSubview:", v4);
  uint64_t v6 = objc_opt_self(&OBJC_CLASS___UIPageControl);
  v7 = (void *)swift_dynamicCastObjCClass(v4, v6);
  if (v7) {
    objc_msgSend(v7, "setBackgroundStyle:", 2, v8.receiver, v8.super_class);
  }
}

- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D312CarouselView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CarouselView();
  return -[CarouselView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8AppStoreP33_FB675DCC57E52337D02F13F14B8B52D312CarouselView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CarouselView();
  return -[CarouselView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end