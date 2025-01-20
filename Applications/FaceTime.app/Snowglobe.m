@interface Snowglobe
- (_TtC8FaceTime9Snowglobe)init;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation Snowglobe

- (_TtC8FaceTime9Snowglobe)init
{
  result = (_TtC8FaceTime9Snowglobe *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.Snowglobe",  18LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime9Snowglobe_renderer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8FaceTime9Snowglobe_parent);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime9Snowglobe_pageFocusGuides));
  sub_10001C608((uint64_t)self + OBJC_IVAR____TtC8FaceTime9Snowglobe_nBubbleID, &qword_100115D08);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  v8 = self;
  sub_1000A32EC((uint64_t)a5);
}

@end