@interface TVMLCardView
- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (_TtC7TVMusic12TVMLCardView)initWithCoder:(id)a3;
- (_TtC7TVMusic12TVMLCardView)initWithFrame:(CGRect)a3;
- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation TVMLCardView

- (_TtC7TVMusic12TVMLCardView)initWithFrame:(CGRect)a3
{
  return (_TtC7TVMusic12TVMLCardView *)sub_10014E160(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7TVMusic12TVMLCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015096C();
}

  ;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  id v2 = v3.receiver;
  -[TVMLCardView layoutSubviews](&v3, "layoutSubviews");
  sub_10014E690();
}

- (void)didMoveToWindow
{
  id v2 = self;
  sub_10014E90C();
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_10014EA40(a3);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType(self);
  v8 = (char *)v11.receiver;
  id v9 = a5;
  -[TVMLCardView setHighlighted:animated:withAnimationCoordinator:]( &v11,  "setHighlighted:animated:withAnimationCoordinator:",  v7,  v6,  v9);
  v10 = *(void **)&v8[OBJC_IVAR____TtC7TVMusic12TVMLCardView_overlayView];
  if (v10) {
    objc_msgSend(v10, "setHighlighted:animated:withAnimationCoordinator:", v7, v6, v9, v11.receiver, v11.super_class);
  }
  sub_10013BB9C(v7, v6, v9);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v6 = self;
  sub_10014ECAC(a3, a4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = self;
  sub_10014EEB8(a3, a4, v8);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1002747B8, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    id v8 = sub_100150910;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v10 = self;
  sub_10014F1EC(a3, a4, (uint64_t)v8, v9);
  sub_1000E03F0((uint64_t)v8, v9);
}

- (void)_ancestorWillUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_10014F4C0(a3, a4);
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  if (a3) {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a4;
  id v8 = self;
  sub_10014F64C(v6, (uint64_t)a4);
  char v10 = v9;

  swift_bridgeObjectRelease(v6);
  return v10 & 1;
}

- (void).cxx_destruct
{
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_10014F9F4(width, height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

@end