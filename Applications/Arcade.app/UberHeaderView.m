@interface UberHeaderView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6Arcade14UberHeaderView)initWithCoder:(id)a3;
- (_TtC6Arcade14UberHeaderView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UberHeaderView

- (_TtC6Arcade14UberHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC6Arcade14UberHeaderView *)sub_1001D43E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6Arcade14UberHeaderView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade14UberHeaderView_imageParallaxY) = 0LL;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade14UberHeaderView_navigationItem) = 0LL;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade14UberHeaderView_sizeChangeObserver);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC6Arcade14UberHeaderView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100243980LL,  "Arcade/UberHeaderView.swift",  27LL,  2LL,  71LL,  0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_1001D4964();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6Arcade14UberHeaderView_legibilityGradientView));

  sub_10000D3D8( *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Arcade14UberHeaderView_sizeChangeObserver),  *(void *)&self->imageContainerView[OBJC_IVAR____TtC6Arcade14UberHeaderView_sizeChangeObserver]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v21, 0, sizeof(v21));
    id v19 = a5;
    v20 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v18 = 0LL;
    goto LABEL_8;
  }

  uint64_t v10 = 0LL;
  v12 = 0LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain(a4);
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0LL);
  uint64_t v16 = v15;
  unint64_t v17 = sub_1001D5874();
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  v16,  (char *)&type metadata for Any + 8,  v17);

LABEL_8:
  sub_1001D4C44(v10, v12, (uint64_t)v21, v18, a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_100029100((uint64_t)v21);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001D5134(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001D5258();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1001D41AC(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_1001D5668();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType(self);
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[UberHeaderView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9
    || (objc_msgSend(v7, "bounds", v13.receiver, v13.super_class), v14.x = x, v14.double y = y, !CGRectContainsPoint(v15, v14)))
  {

    goto LABEL_6;
  }

  uint64_t v10 = objc_opt_self(&OBJC_CLASS___UIControl);
  uint64_t v11 = swift_dynamicCastObjCClass(v9, v10);

  if (!v11)
  {
    id v7 = v9;
    id v9 = 0LL;
LABEL_6:
  }

  return v9;
}

@end