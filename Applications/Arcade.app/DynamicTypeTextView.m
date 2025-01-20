@interface DynamicTypeTextView
- (UIFont)font;
- (_NSRange)selectedRange;
- (_TtC6Arcade19DynamicTypeTextView)initWithCoder:(id)a3;
- (_TtC6Arcade19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)setFont:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeTextView

- (_TtC6Arcade19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  return (_TtC6Arcade19DynamicTypeTextView *)sub_1000F2C90(a4, v10, x, y, width, height);
}

- (_TtC6Arcade19DynamicTypeTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade19DynamicTypeTextView_fontUseCaseContentSizeCategory) = 0LL;
  v5 = (char *)self + OBJC_IVAR____TtC6Arcade19DynamicTypeTextView_fontUseCase;
  uint64_t v6 = type metadata accessor for FontUseCase(0LL, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  id v7 = a3;

  result = (_TtC6Arcade19DynamicTypeTextView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/DynamicTypeTextView.swift",  32LL,  2LL,  64LL,  0);
  __break(1u);
  return result;
}

- (_NSRange)selectedRange
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicTypeTextView(0LL);
  id v2 = -[DynamicTypeTextView selectedRange](&v4, "selectedRange");
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  uint64_t v6 = self;
  if (-[DynamicTypeTextView isSelectable](v6, "isSelectable"))
  {
    id v3 = -[DynamicTypeTextView selectedRange](v6, "selectedRange");
    uint64_t v5 = v4;
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for DynamicTypeTextView(0LL);
    -[DynamicTypeTextView setSelectedRange:](&v7, "setSelectedRange:", v3, v5);
  }

  else
  {
  }

- (UIFont)font
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextView(0LL);
  return -[DynamicTypeTextView font](&v3, "font");
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1000F3964((uint64_t)a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1000F35C0((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade19DynamicTypeTextView_fontUseCaseContentSizeCategory));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade19DynamicTypeTextView_fontUseCase, &qword_1002DE930);
}

@end