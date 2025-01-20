@interface DividerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade11DividerView)initWithCoder:(id)a3;
- (_TtC6Arcade11DividerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DividerView

- (_TtC6Arcade11DividerView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade11DividerView *)sub_1001EBAFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade11DividerView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC6Arcade11DividerView_separatorInset);
  __int128 v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  uint64_t v6 = OBJC_IVAR____TtC6Arcade11DividerView_style;
  uint64_t v7 = qword_1002DD150;
  id v8 = a3;
  if (v7 != -1) {
    swift_once(&qword_1002DD150, sub_1001EB944);
  }
  uint64_t v9 = type metadata accessor for DividerView.Style(0LL);
  uint64_t v10 = sub_1000061F4(v9, (uint64_t)qword_1002F18B0);
  sub_1000E8470(v10, (uint64_t)self + v6);

  result = (_TtC6Arcade11DividerView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/DividerView.swift",  24LL,  2LL,  80LL,  0);
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
  v12 = (char *)self + OBJC_IVAR____TtC6Arcade11DividerView_style;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade11DividerView_style, v22, 0LL, 0LL);
  sub_1000E8470((uint64_t)v12, (uint64_t)v11);
  uint64_t v13 = qword_1002DD148;
  v14 = self;
  v15 = v14;
  if (v13 != -1) {
    v14 = (_TtC6Arcade11DividerView *)swift_once(&qword_1002DD148, sub_1001EB8FC);
  }
  double v16 = floor(*(double *)&qword_1002F18A8);
  static Dimensions.defaultRoundingRule.getter(v14);
  uint64_t v17 = type metadata accessor for StaticDimension(0LL);
  double v18 = AnyDimension.value(in:rounded:)(v15, v8, v17, &protocol witness table for StaticDimension);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000E84F8((uint64_t)v11);

  double v19 = width;
  double v20 = v16 + v18;
  result.height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001EBF04();
}

- (void).cxx_destruct
{
}

@end