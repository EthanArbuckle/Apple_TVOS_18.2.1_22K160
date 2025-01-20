@interface SegmentedControlComponent
- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)segmentedControlAction;
@end

@implementation SegmentedControlComponent

- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent *)sub_2E0B4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2E1BC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2E3B8();
}

- (void)segmentedControlAction
{
  v2 = self;
  sub_2E4D0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC19CoreDynamicUIPlugin25SegmentedControlComponent_items));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC19CoreDynamicUIPlugin25SegmentedControlComponent_objectGraph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19CoreDynamicUIPlugin25SegmentedControlComponent_underlyingSegmentedControl));
}

@end