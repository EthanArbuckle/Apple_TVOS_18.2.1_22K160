@interface SRCarPlaySnippetPlatterView
- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithCoder:(id)a3;
- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithFrame:(CGRect)a3;
@end

@implementation SRCarPlaySnippetPlatterView

- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView) = 0LL;
  uint64_t v5 = OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView;
  id v6 = objc_allocWithZone(&OBJC_CLASS___UIVisualEffectView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithEffect:0];

  result = (_TtC4Siri27SRCarPlaySnippetPlatterView *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010008B670LL,  "Siri/SRCarPlaySnippetPlatterView.swift",  38LL,  2LL,  41LL,  0);
  __break(1u);
  return result;
}

- (_TtC4Siri27SRCarPlaySnippetPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC4Siri27SRCarPlaySnippetPlatterView *)sub_10006451C( a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView));
}

@end