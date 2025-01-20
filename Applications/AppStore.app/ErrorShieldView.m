@interface ErrorShieldView
- (_TtC8AppStore15ErrorShieldView)initWithCoder:(id)a3;
- (_TtC8AppStore15ErrorShieldView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ErrorShieldView

- (_TtC8AppStore15ErrorShieldView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15ErrorShieldView *)sub_100140858(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15ErrorShieldView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore15ErrorShieldView_retryHandler);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore15ErrorShieldView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/ErrorShieldView.swift",  30LL,  2LL,  98LL,  0);
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  id v4 = v6.receiver;
  id v5 = a3;
  -[ErrorShieldView willMoveToWindow:](&v6, "willMoveToWindow:", v5);
  if (v5)
  {
    ErrorPresenter.update()();
  }
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_100140F30();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v3.receiver;
  -[ErrorShieldView layoutSubviews](&v3, "layoutSubviews");
  objc_msgSend(v2, "bounds", v3.receiver, v3.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8AppStore15ErrorShieldView_errorView], "setFrame:");
}

- (void).cxx_destruct
{
}

@end