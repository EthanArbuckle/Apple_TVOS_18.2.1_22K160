@interface InfiniteScrollFooterView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore24InfiniteScrollFooterView)initWithCoder:(id)a3;
- (_TtC8AppStore24InfiniteScrollFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation InfiniteScrollFooterView

- (_TtC8AppStore24InfiniteScrollFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24InfiniteScrollFooterView *)sub_1001BE1A8( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (_TtC8AppStore24InfiniteScrollFooterView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore24InfiniteScrollFooterView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/InfiniteScrollFooterView.swift",  39LL,  2LL,  31LL,  0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = self;
  id v10 = -[InfiniteScrollFooterView traitCollection](v9, "traitCollection");
  if (qword_1002E0BF0 != -1) {
    swift_once(&qword_1002E0BF0, sub_100110BF8);
  }
  uint64_t v11 = type metadata accessor for StaticDimension(0LL);
  uint64_t v12 = sub_10000A634(v11, (uint64_t)qword_1002F4570);
  static Dimensions.defaultRoundingRule.getter(v12);
  double v13 = StaticDimension.value(compatibleWith:rounded:)(v10, v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  double v14 = v13 * 3.0;
  double v15 = width;
  result.height = v14;
  result.CGFloat width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = self;
  id v8 = -[InfiniteScrollFooterView traitCollection](v7, "traitCollection");
  if (qword_1002E0BF0 != -1) {
    swift_once(&qword_1002E0BF0, sub_100110BF8);
  }
  uint64_t v9 = type metadata accessor for StaticDimension(0LL);
  uint64_t v10 = sub_10000A634(v9, (uint64_t)qword_1002F4570);
  static Dimensions.defaultRoundingRule.getter(v10);
  double v11 = StaticDimension.value(compatibleWith:rounded:)(v8, v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  double v12 = v11 * 3.0;
  double v13 = UIViewNoIntrinsicMetric;
  result.height = v12;
  result.CGFloat width = v13;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v17.receiver;
  -[InfiniteScrollFooterView layoutSubviews](&v17, "layoutSubviews");
  objc_msgSend(v2, "bounds", v17.receiver, v17.super_class);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(void **)&v2[OBJC_IVAR____TtC8AppStore24InfiniteScrollFooterView_activityIndicator];
  objc_msgSend(v11, "sizeThatFits:", v7, v9);
  double v13 = v12;
  double v15 = v14;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.CGFloat width = v8;
  v18.size.height = v10;
  CGFloat v16 = CGRectGetMidX(v18) - v13 * 0.5;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.CGFloat width = v8;
  v19.size.height = v10;
  objc_msgSend(v11, "setFrame:", v16, CGRectGetMidY(v19) - v15 * 0.5, v13, v15);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v3.receiver;
  -[InfiniteScrollFooterView prepareForReuse](&v3, "prepareForReuse");
  objc_msgSend( *(id *)&v2[OBJC_IVAR____TtC8AppStore24InfiniteScrollFooterView_activityIndicator],  "stopAnimating",  v3.receiver,  v3.super_class);
}

- (void)willMoveToWindow:(id)a3
{
}

- (void)willMoveToSuperview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24InfiniteScrollFooterView_activityIndicator));
}

@end