@interface ProductNoRatingsContentView
- (_TtC6Arcade16DynamicTypeLabel)accessibilityStatusLabel;
- (_TtC6Arcade27ProductNoRatingsContentView)initWithCoder:(id)a3;
- (_TtC6Arcade27ProductNoRatingsContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductNoRatingsContentView

- (_TtC6Arcade27ProductNoRatingsContentView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade27ProductNoRatingsContentView *)sub_1000E6100( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC6Arcade27ProductNoRatingsContentView)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for FontUseCase(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = OBJC_IVAR____TtC6Arcade27ProductNoRatingsContentView_statusLabel;
  type metadata accessor for DynamicTypeLabel(0LL);
  uint64_t v10 = qword_1002DC640;
  id v11 = a3;
  if (v10 != -1) {
    swift_once(&qword_1002DC640, sub_10007159C);
  }
  uint64_t v12 = sub_1000061F4(v5, (uint64_t)qword_1002EEF10);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_1000137B8((uint64_t)v8, 0LL, 0LL, 1, 0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade27ProductNoRatingsContentView_isPressEnabled) = 0;

  result = (_TtC6Arcade27ProductNoRatingsContentView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/ProductNoRatingsContentView.swift",  40LL,  2LL,  35LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000E649C();
}

- (_TtC6Arcade16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC6Arcade16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR____TtC6Arcade27ProductNoRatingsContentView_statusLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade27ProductNoRatingsContentView_statusLabel));
}

@end