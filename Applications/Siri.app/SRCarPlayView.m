@interface SRCarPlayView
- (_TtC4Siri13SRCarPlayView)initWithCoder:(id)a3;
- (_TtC4Siri13SRCarPlayView)initWithFrame:(CGRect)a3;
- (void)didTapToDismissWithSender:(id)a3;
@end

@implementation SRCarPlayView

- (_TtC4Siri13SRCarPlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100066B10((uint64_t)v3, v4, v5);
}

  ;
}

- (void)didTapToDismissWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000665C8(v4);
}

- (_TtC4Siri13SRCarPlayView)initWithFrame:(CGRect)a3
{
  result = (_TtC4Siri13SRCarPlayView *)_swift_stdlib_reportUnimplementedInitializer( "Siri.SRCarPlayView",  18LL,  "init(frame:)",  12LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView));
}

@end