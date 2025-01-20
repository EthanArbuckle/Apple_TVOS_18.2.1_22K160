@interface ServiceProductPageView
- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceProductPageView

- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22ServiceProductPageView *)sub_92C48( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_92D58();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_92E94();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_detailsView));
  sub_9404C(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_pageType));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView));
}

@end