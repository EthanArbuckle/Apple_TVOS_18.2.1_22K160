@interface RequestHandlingStatusView
- (_TtC6SiriTV25RequestHandlingStatusView)initWithCoder:(id)a3;
- (_TtC6SiriTV25RequestHandlingStatusView)initWithFrame:(CGRect)a3;
@end

@implementation RequestHandlingStatusView

- (_TtC6SiriTV25RequestHandlingStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC6SiriTV25RequestHandlingStatusView *)sub_8F2A8();
}

- (_TtC6SiriTV25RequestHandlingStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_8F678();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_asrStatus));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6SiriTV25RequestHandlingStatusView_executionInputSystem));
}

@end