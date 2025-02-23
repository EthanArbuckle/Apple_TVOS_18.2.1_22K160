@interface ProgressBarView
- (CGRect)frame;
- (_TtC8AppStore15ProgressBarView)init;
- (_TtC8AppStore15ProgressBarView)initWithCoder:(id)a3;
- (_TtC8AppStore15ProgressBarView)initWithFrame:(CGRect)a3;
- (double)accessibilityPercentage;
- (void)drawRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProgressBarView

- (_TtC8AppStore15ProgressBarView)init
{
  return (_TtC8AppStore15ProgressBarView *)sub_10000E108();
}

- (_TtC8AppStore15ProgressBarView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore15ProgressBarView_percentage) = 0LL;
  uint64_t v4 = OBJC_IVAR____TtC8AppStore15ProgressBarView_fillColor;
  uint64_t v5 = qword_1002E0318;
  id v6 = a3;
  if (v5 != -1) {
    swift_once(&qword_1002E0318, sub_10000E00C);
  }
  v7 = (void *)qword_1002F2440;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)qword_1002F2440;
  uint64_t v8 = OBJC_IVAR____TtC8AppStore15ProgressBarView_trackColor;
  uint64_t v9 = qword_1002E0320;
  id v10 = v7;
  if (v9 != -1) {
    swift_once(&qword_1002E0320, sub_10000E020);
  }
  v11 = (void *)qword_1002F2448;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)qword_1002F2448;
  id v12 = v11;

  result = (_TtC8AppStore15ProgressBarView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ProgressBarView.swift",  30LL,  2LL,  39LL,  0);
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProgressBarView();
  -[ProgressBarView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = (objc_class *)type metadata accessor for ProgressBarView();
  v19.receiver = self;
  v19.super_class = v8;
  uint64_t v9 = self;
  -[ProgressBarView frame](&v19, "frame");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18.receiver = v9;
  v18.super_class = v8;
  -[ProgressBarView setFrame:](&v18, "setFrame:", x, y, width, height);
  -[ProgressBarView frame](v9, "frame");
  v22.origin.double x = v11;
  v22.origin.double y = v13;
  v22.size.double width = v15;
  v22.size.double height = v17;
  if (!CGRectEqualToRect(v20, v22))
  {
    -[ProgressBarView bounds](v9, "bounds");
    -[ProgressBarView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:", CGRectGetHeight(v21) * 0.5);
    -[ProgressBarView setNeedsDisplay](v9, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_10000E4C8(x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_10000E834(a3);
}

- (double)accessibilityPercentage
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore15ProgressBarView_percentage);
}

- (_TtC8AppStore15ProgressBarView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8AppStore15ProgressBarView *)_swift_stdlib_reportUnimplementedInitializer( "AppStore.ProgressBarView",  24LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end