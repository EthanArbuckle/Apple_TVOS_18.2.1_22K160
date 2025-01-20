@interface TVMLMonogramRow.LockupView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtCC7TVMusic15TVMLMonogramRow10LockupView)initWithCoder:(id)a3;
- (_TtCC7TVMusic15TVMLMonogramRow10LockupView)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)longPressRecognized:(id)a3;
- (void)selectRecognized:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation TVMLMonogramRow.LockupView

- (_TtCC7TVMusic15TVMLMonogramRow10LockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015D690();
}

  ;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v9 = a5;
  v10 = self;
  sub_100158D0C(a3, a4, (uint64_t)a5);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100158EF4(a3, a4);
}

- (void)selectRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)3) {
    [*(id *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtCC7TVMusic15TVMLMonogramRow10LockupView_element) dispatchEventOfType:2 canBubble:1 cancellable:0 extraInfo:0 completion:0];
  }
}

- (void)longPressRecognized:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100159124(v4);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100159294((uint64_t)v6, v7);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (_TtCC7TVMusic15TVMLMonogramRow10LockupView)initWithFrame:(CGRect)a3
{
  result = (_TtCC7TVMusic15TVMLMonogramRow10LockupView *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.LockupView",  18LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7TVMusic15TVMLMonogramRow10LockupView_monogramView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7TVMusic15TVMLMonogramRow10LockupView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7TVMusic15TVMLMonogramRow10LockupView_element));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCC7TVMusic15TVMLMonogramRow10LockupView_imagePublisher));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7TVMusic15TVMLMonogramRow10LockupView_footerView));
}

@end