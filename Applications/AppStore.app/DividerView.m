@interface DividerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore11DividerView)initWithCoder:(id)a3;
- (_TtC8AppStore11DividerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DividerView

- (_TtC8AppStore11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore11DividerView *)sub_1001F2720(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore11DividerView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore11DividerView_separatorInset);
  __int128 v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  uint64_t v6 = OBJC_IVAR____TtC8AppStore11DividerView_style;
  uint64_t v7 = qword_1002E1160;
  id v8 = a3;
  if (v7 != -1) {
    swift_once(&qword_1002E1160, sub_1001F2568);
  }
  uint64_t v9 = type metadata accessor for DividerView.Style(0LL);
  uint64_t v10 = sub_10000A634(v9, (uint64_t)qword_1002F5970);
  sub_1000EDDEC(v10, (uint64_t)self + v6);

  result = (_TtC8AppStore11DividerView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/DividerView.swift",  26LL,  2LL,  80LL,  0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v9 = type metadata accessor for DividerView.Style(0LL);
  __chkstk_darwin(v9);
  v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  v12 = (char *)self + OBJC_IVAR____TtC8AppStore11DividerView_style;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore11DividerView_style, v22, 0LL, 0LL);
  sub_1000EDDEC((uint64_t)v12, (uint64_t)v11);
  uint64_t v13 = qword_1002E1158;
  v14 = self;
  v15 = v14;
  if (v13 != -1) {
    v14 = (_TtC8AppStore11DividerView *)swift_once(&qword_1002E1158, sub_1001F2520);
  }
  double v16 = floor(*(double *)&qword_1002F5968);
  static Dimensions.defaultRoundingRule.getter(v14);
  uint64_t v17 = type metadata accessor for StaticDimension(0LL);
  double v18 = AnyDimension.value(in:rounded:)(v15, v8, v17, &protocol witness table for StaticDimension);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000EDE74((uint64_t)v11);

  double v19 = width;
  double v20 = v16 + v18;
  result.height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001F2B28();
}

- (void).cxx_destruct
{
}

@end