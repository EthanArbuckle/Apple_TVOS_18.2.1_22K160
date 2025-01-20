@interface ExpandableTextView
- (BOOL)hasContent;
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade18ExpandableTextView)initWithCoder:(id)a3;
- (_TtC6Arcade18ExpandableTextView)initWithFrame:(CGRect)a3;
- (_TtC6Arcade19DynamicTypeTextView)accessibilityTextLabel;
- (void)layoutSubviews;
- (void)moreFrom:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ExpandableTextView

- (_TtC6Arcade18ExpandableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade18ExpandableTextView *)sub_1000162E4( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  (uint64_t)self,  (uint64_t)a2);
}

- (_TtC6Arcade18ExpandableTextView)initWithCoder:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18ExpandableTextView_hasMoreButton) = 1;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18ExpandableTextView_automaticallyAdjustTextColors) = 1;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC6Arcade18ExpandableTextView_alwaysShowsMoreButtonWhenCollapsed) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18ExpandableTextView_collapsedNumberOfLines) = (Class)3;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18ExpandableTextView_isCollapsed) = 1;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18ExpandableTextView_moreTapHandler);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade18ExpandableTextView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ExpandableTextView.swift",  31LL,  2LL,  58LL,  0);
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExpandableTextView();
  -[ExpandableTextView frame](&v6, "frame");
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ExpandableTextView();
  id v7 = v8.receiver;
  -[ExpandableTextView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_100017048();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_100016824();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  CGFloat width = a3.width;
  objc_msgSend( *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade18ExpandableTextView_textLabel),  "measurementsWithFitting:in:",  a4,  a3.width,  a3.height);
  double v8 = width;
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ExpandableTextView();
  id v4 = v8.receiver;
  id v5 = a3;
  -[ExpandableTextView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  sub_100017048();
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    sub_100017430();
  }
}

- (void)moreFrom:(id)a3
{
  double v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC6Arcade18ExpandableTextView_moreTapHandler);
  if (v3)
  {
    uint64_t v5 = *(void *)&self->textLabel[OBJC_IVAR____TtC6Arcade18ExpandableTextView_moreTapHandler];
    id v6 = a3;
    objc_super v8 = self;
    uint64_t v7 = sub_100017A40((uint64_t)v3, v5);
    v3(v7);
    sub_10000D3D8((uint64_t)v3, v5);
  }

- (_TtC6Arcade19DynamicTypeTextView)accessibilityTextLabel
{
  return (_TtC6Arcade19DynamicTypeTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                     + OBJC_IVAR____TtC6Arcade18ExpandableTextView_textLabel));
}

- (void).cxx_destruct
{
}

- (BOOL)hasContent
{
  double v2 = self;
  unsigned __int8 v3 = sub_10001764C();

  return v3 & 1;
}

@end