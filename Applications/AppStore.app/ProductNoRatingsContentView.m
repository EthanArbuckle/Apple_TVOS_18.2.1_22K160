@interface ProductNoRatingsContentView
- (_TtC8AppStore16DynamicTypeLabel)accessibilityStatusLabel;
- (_TtC8AppStore27ProductNoRatingsContentView)initWithCoder:(id)a3;
- (_TtC8AppStore27ProductNoRatingsContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductNoRatingsContentView

- (_TtC8AppStore27ProductNoRatingsContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27ProductNoRatingsContentView *)sub_10016019C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore27ProductNoRatingsContentView)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for FontUseCase(0LL, a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = OBJC_IVAR____TtC8AppStore27ProductNoRatingsContentView_statusLabel;
  type metadata accessor for DynamicTypeLabel(0LL);
  uint64_t v10 = qword_1002E0660;
  id v11 = a3;
  if (v10 != -1) {
    swift_once(&qword_1002E0660, sub_100072B54);
  }
  uint64_t v12 = sub_10000A634(v5, (uint64_t)qword_1002F2E78);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_100011F1C((uint64_t)v8, 0LL, 0LL, 1, 0);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore27ProductNoRatingsContentView_isPressEnabled) = 0;

  result = (_TtC8AppStore27ProductNoRatingsContentView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ProductNoRatingsContentView.swift",  42LL,  2LL,  35LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100160538();
}

- (_TtC8AppStore16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC8AppStore16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore27ProductNoRatingsContentView_statusLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27ProductNoRatingsContentView_statusLabel));
}

@end