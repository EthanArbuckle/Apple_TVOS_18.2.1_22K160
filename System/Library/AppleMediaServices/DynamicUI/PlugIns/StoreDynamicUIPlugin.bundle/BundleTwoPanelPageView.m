@interface BundleTwoPanelPageView
- (_TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleTwoPanelPageView

- (_TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView *)sub_3A0BC( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3A298();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3A318();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView_detailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView_servicesGrid));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22BundleTwoPanelPageView_contentView));
}

@end