@interface DynamicTypeLabel
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIFont)font;
- (_TtC6Arcade16DynamicTypeLabel)initWithCoder:(id)a3;
- (_TtC6Arcade16DynamicTypeLabel)initWithFrame:(CGRect)a3;
- (int64_t)lineSpacing;
- (int64_t)textAlignment;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setLineSpacing:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeLabel

- (_TtC6Arcade16DynamicTypeLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_fontUseCaseContentSizeCategory) = 0LL;
  v8 = (char *)self + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_fontUseCase;
  uint64_t v9 = type metadata accessor for FontUseCase(0LL, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56LL))(v8, 1LL, 1LL, v9);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_wantsFastBaselineMeasurement) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_isPlainText) = 1;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_directionalTextAlignment) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  v10 = -[DynamicTypeLabel initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  -[DynamicTypeLabel setTextAlignment:](v10, "setTextAlignment:", 0LL);
  return v10;
}

- (_TtC6Arcade16DynamicTypeLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_fontUseCaseContentSizeCategory) = 0LL;
  v5 = (char *)self + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_fontUseCase;
  uint64_t v6 = type metadata accessor for FontUseCase(0LL, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(v5, 1LL, 1LL, v6);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_wantsFastBaselineMeasurement) = 0;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_isPlainText) = 1;
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_directionalTextAlignment) = 0;
  id v7 = a3;

  result = (_TtC6Arcade16DynamicTypeLabel *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/DynamicTypeLabel.swift",  29LL,  2LL,  58LL,  0);
  __break(1u);
  return result;
}

- (UIFont)font
{
  return (UIFont *)sub_1000142B8(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100014D8C(a3);
}

- (NSString)text
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  id v2 = v9.receiver;
  v3 = -[DynamicTypeLabel text](&v9, "text");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    uint64_t v6 = v5;

    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }

  else
  {

    return (NSString *)0LL;
  }

- (void)setText:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
    uint64_t v6 = self;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    v8 = self;
    NSString v7 = 0LL;
  }

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  -[DynamicTypeLabel setText:](&v9, "setText:", v7);

  sub_100014420(1);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_1000142B8(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

- (void)setAttributedText:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  id v4 = a3;
  id v5 = v6.receiver;
  -[DynamicTypeLabel setAttributedText:](&v6, "setAttributedText:", v4);
  sub_100014420(0);
}

- (int64_t)textAlignment
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  return -[DynamicTypeLabel textAlignment](&v3, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_directionalTextAlignment) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  -[DynamicTypeLabel setTextAlignment:](&v4, "setTextAlignment:", a3);
}

- (int64_t)lineSpacing
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel(0LL);
  return -[DynamicTypeLabel lineSpacing](&v3, "lineSpacing");
}

- (void)setLineSpacing:(int64_t)a3
{
  objc_super v4 = self;
  sub_1000145E0(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1000147A4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_fontUseCaseContentSizeCategory));
  sub_100006060((uint64_t)self + OBJC_IVAR____TtC6Arcade16DynamicTypeLabel_fontUseCase, &qword_1002DE930);
}

@end