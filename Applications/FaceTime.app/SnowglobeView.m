@interface SnowglobeView
- (NSArray)preferredFocusEnvironments;
- (_TtC8FaceTime13SnowglobeView)initWithCoder:(id)a3;
- (_TtC8FaceTime13SnowglobeView)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
@end

@implementation SnowglobeView

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  id v3 = sub_100098DC4();

  sub_100018A04(&qword_100112990);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (_TtC8FaceTime13SnowglobeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A3018();
}

  ;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10009A3D0();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10009A4C4(v6, (uint64_t)v7);
}

- (_TtC8FaceTime13SnowglobeView)initWithFrame:(CGRect)a3
{
  result = (_TtC8FaceTime13SnowglobeView *)_swift_stdlib_reportUnimplementedInitializer( "FaceTime.SnowglobeView",  22LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___facetimeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___facetimeAudioButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___vibrancyEffectView));

  id v3 = (char *)self + OBJC_IVAR____TtC8FaceTime13SnowglobeView_callType;
  uint64_t v4 = type metadata accessor for CallType(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___verticalButtonConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView_verticalCenteringConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___horizontalCenteringConstraint));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8FaceTime13SnowglobeView_verticalCenteringView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView_contactCollectionView));
  sub_1000A3704((uint64_t)self + OBJC_IVAR____TtC8FaceTime13SnowglobeView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime13SnowglobeView____lazy_storage___snowglobe));
}

@end