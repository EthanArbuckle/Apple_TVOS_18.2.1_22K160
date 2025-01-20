@interface SeparatorView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade13SeparatorView)initWithCoder:(id)a3;
- (_TtC6Arcade13SeparatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorView

- (_TtC6Arcade13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade13SeparatorView *)sub_100012D60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade13SeparatorView)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for Separator.Position(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = OBJC_IVAR____TtC6Arcade13SeparatorView_lineColor;
  sub_100010F30();
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)static UIColor.defaultLine.getter(a3);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Separator.Position.bottom(_:), v5);
  v12[3] = type metadata accessor for ZeroDimension(0LL);
  v12[4] = &protocol witness table for ZeroDimension;
  sub_100009D54(v12);
  static ZeroDimension.zero.getter();
  Separator.init(position:leadingInset:trailingInset:verticalOutset:)(v8, v12, 0.0, 0.0);

  result = (_TtC6Arcade13SeparatorView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/SeparatorView.swift",  26LL,  2LL,  54LL,  0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = type metadata accessor for Separator(0LL, a2, (__n128)a3, *(__n128 *)&a3.height);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC6Arcade13SeparatorView_separator;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade13SeparatorView_separator, v15, 0LL, 0LL);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = self;
  double v11 = Separator.height(in:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  double v12 = width;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = type metadata accessor for Separator(0LL, a2);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC6Arcade13SeparatorView_separator;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC6Arcade13SeparatorView_separator, v13, 0LL, 0LL);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  double v9 = Separator.height(in:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  double v10 = UIViewNoIntrinsicMetric;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100013284();
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6Arcade13SeparatorView_separator;
  uint64_t v5 = type metadata accessor for Separator(0LL, v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v3, v5);
}

@end