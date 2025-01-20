@interface AccountSignInView
- (BOOL)canBecomeFocused;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore17AccountSignInView)initWithCoder:(id)a3;
- (_TtC8AppStore17AccountSignInView)initWithFrame:(CGRect)a3;
- (void)didSelectSignIn:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AccountSignInView

- (_TtC8AppStore17AccountSignInView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17AccountSignInView *)sub_1000A67D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17AccountSignInView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17AccountSignInView_didSelectHandler);
  void *v4 = 0LL;
  v4[1] = 0LL;
  id v5 = a3;

  result = (_TtC8AppStore17AccountSignInView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x8000000100247230LL,  "AppStore/AccountSignInView.swift",  32LL,  2LL,  54LL,  0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000A6E28();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  double v9 = sub_1000A7110((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease(a4);

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  id v4 = v8.receiver;
  id v5 = a3;
  -[AccountSignInView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 userInterfaceStyle];

  if (!v5 || v7 != [v5 userInterfaceStyle]) {
    sub_1000A6C68();
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)didSelectSignIn:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore17AccountSignInView_didSelectHandler);
  if (v3)
  {
    uint64_t v5 = *(void *)&self->didSelectHandler[OBJC_IVAR____TtC8AppStore17AccountSignInView_didSelectHandler];
    id v6 = a3;
    objc_super v8 = self;
    uint64_t v7 = sub_100015CA0((uint64_t)v3, v5);
    v3(v7);
    sub_10000A450((uint64_t)v3, v5);
  }

- (void).cxx_destruct
{
}

@end