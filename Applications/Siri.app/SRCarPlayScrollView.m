@interface SRCarPlayScrollView
- (NSArray)preferredFocusEnvironments;
- (_TtC4Siri19SRCarPlayScrollView)initWithCoder:(id)a3;
- (_TtC4Siri19SRCarPlayScrollView)initWithFrame:(CGRect)a3;
@end

@implementation SRCarPlayScrollView

- (_TtC4Siri19SRCarPlayScrollView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100060950();
}

  ;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_100060640();
  uint64_t v4 = v3;

  sub_10004A8E8(&qword_1000D97F0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (_TtC4Siri19SRCarPlayScrollView)initWithFrame:(CGRect)a3
{
  result = (_TtC4Siri19SRCarPlayScrollView *)_swift_stdlib_reportUnimplementedInitializer( "Siri.SRCarPlayScrollView",  24LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint));
}

@end