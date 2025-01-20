@interface ServiceOptionComponent
- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceOptionComponent

- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent *)sub_880C4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin22ServiceOptionComponent)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_8837C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_885DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_886B4((uint64_t)a3);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_8877C((uint64_t)v6, v7);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_88A18();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel));
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_gridView);
  sub_118C8(OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_blurView);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_container));
}

@end