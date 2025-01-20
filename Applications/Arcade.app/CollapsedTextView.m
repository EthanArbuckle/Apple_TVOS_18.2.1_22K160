@interface CollapsedTextView
- (BOOL)canBecomeFocused;
- (BOOL)hasContent;
- (CGRect)frame;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC6Arcade17CollapsedTextView)initWithFrame:(CGRect)a3;
- (_TtC6Arcade19DynamicTypeTextView)accessibilityTextView;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CollapsedTextView

- (_TtC6Arcade17CollapsedTextView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade17CollapsedTextView *)sub_10000DA94( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height,  (uint64_t)self,  (uint64_t)a2);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollapsedTextView();
  -[CollapsedTextView frame](&v6, "frame");
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
  v8.super_class = (Class)type metadata accessor for CollapsedTextView();
  id v7 = v8.receiver;
  -[CollapsedTextView setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_10000EB68();
}

- (BOOL)canBecomeFocused
{
  double v2 = self;
  char v3 = sub_10000E078();

  return v3 & 1;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_10000E11C();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  objc_super v8 = self;
  double v9 = sub_10000E8B8((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CollapsedTextView();
  id v4 = v8.receiver;
  id v5 = a3;
  -[BaseCollectionViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 layoutDirection];

  if (!v5 || v7 != [v5 layoutDirection]) {
    sub_10000F8F4();
  }
}

- (_TtC6Arcade19DynamicTypeTextView)accessibilityTextView
{
  return (_TtC6Arcade19DynamicTypeTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC6Arcade17CollapsedTextView_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade17CollapsedTextView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade17CollapsedTextView_moreButton));
  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC6Arcade17CollapsedTextView_primaryActionHandler),  *(void *)&self->super.state[OBJC_IVAR____TtC6Arcade17CollapsedTextView_primaryActionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade17CollapsedTextView_languageAwareString));
}

- (BOOL)hasContent
{
  double v2 = self;
  unsigned __int8 v3 = sub_10000FBC4();

  return v3 & 1;
}

@end