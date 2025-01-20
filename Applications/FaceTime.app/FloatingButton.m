@interface FloatingButton
- (BOOL)isHighlighted;
- (_TtC8FaceTime14FloatingButton)initWithCoder:(id)a3;
- (_TtC8FaceTime14FloatingButton)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation FloatingButton

- (_TtC8FaceTime14FloatingButton)initWithFrame:(CGRect)a3
{
  return (_TtC8FaceTime14FloatingButton *)sub_100044A14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8FaceTime14FloatingButton)initWithCoder:(id)a3
{
  return (_TtC8FaceTime14FloatingButton *)sub_100044C04(a3);
}

- (BOOL)isHighlighted
{
  return sub_100044DCC( self,  (uint64_t)a2,  (uint64_t (*)(void))type metadata accessor for FloatingButton,  (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FloatingButton((uint64_t)self, (uint64_t)a2);
  v4 = (char *)v5.receiver;
  -[FloatingButton setHighlighted:](&v5, "setHighlighted:", v3);
  objc_msgSend( *(id *)&v4[OBJC_IVAR____TtC8FaceTime14FloatingButton_floatingView],  "setControlState:withAnimationCoordinator:",  objc_msgSend(v4, "isHighlighted", v5.receiver, v5.super_class),  0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  FloatingButton.didUpdateFocus(in:with:)((UIFocusUpdateContext)v6, (UIFocusAnimationCoordinator)v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton_defaultBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton_highlightedBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton_buttonFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton_highlightForegroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton_defaultForegroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8FaceTime14FloatingButton____lazy_storage___highlightView));
}

@end