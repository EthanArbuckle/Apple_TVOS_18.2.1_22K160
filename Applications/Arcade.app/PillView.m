@interface PillView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade8PillView)initWithCoder:(id)a3;
- (_TtC6Arcade8PillView)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
@end

@implementation PillView

- (_TtC6Arcade8PillView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade8PillView *)sub_10012853C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade8PillView)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for FontUseCase(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = OBJC_IVAR____TtC6Arcade8PillView_titleLabel;
  type metadata accessor for DynamicTypeLabel(0LL);
  uint64_t v10 = qword_1002DC850;
  id v11 = a3;
  if (v10 != -1) {
    swift_once(&qword_1002DC850, sub_100071D3C);
  }
  uint64_t v12 = sub_1000061F4(v5, (uint64_t)qword_1002EF540);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_1000137B8((uint64_t)v8, 1LL, 0LL, 1, 0);

  result = (_TtC6Arcade8PillView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/PillView.swift",  21LL,  2LL,  53LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001288F8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3 = qword_1002DCC80;
  v4 = self;
  if (v3 != -1) {
    swift_once(&qword_1002DCC80, sub_100128D34);
  }
  double v5 = *((double *)&xmmword_1002E7078 + 1);
  double v6 = *(double *)&xmmword_1002E7078;
  double v8 = *(double *)&qword_1002E7088;
  double v7 = unk_1002E7090;
  -[PillView bounds](v4, "bounds");
  objc_msgSend( *(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC6Arcade8PillView_titleLabel),  "sizeThatFits:",  sub_100128D7C(v9, v10, v11, v12, v6, v5, v8, v7));
  double v14 = v13;
  if (qword_1002DCC70 != -1) {
    swift_once(&qword_1002DCC70, sub_100128D10);
  }
  double v15 = v7 + v5 + v14;
  uint64_t v16 = qword_1002E7068;

  double v17 = v15;
  double v18 = *(double *)&v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_100128B70(v6, (uint64_t)v7);
}

- (void).cxx_destruct
{
}

@end