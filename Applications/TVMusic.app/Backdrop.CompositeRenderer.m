@interface Backdrop.CompositeRenderer
- (_TtCV7TVMusic8Backdrop17CompositeRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation Backdrop.CompositeRenderer

- (_TtCV7TVMusic8Backdrop17CompositeRenderer)init
{
  result = (_TtCV7TVMusic8Backdrop17CompositeRenderer *)_swift_stdlib_reportUnimplementedInitializer( "TVMusic.CompositeRenderer",  25LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7TVMusic8Backdrop17CompositeRenderer_context);
  uint64_t v4 = *(void *)&self->visualizerIntensity[OBJC_IVAR____TtCV7TVMusic8Backdrop17CompositeRenderer_context];
  uint64_t v5 = *(void *)&self->crossfadeDuration[OBJC_IVAR____TtCV7TVMusic8Backdrop17CompositeRenderer_context + 3];

  swift_unknownObjectRelease(v5);
  swift_unknownObjectRelease(v4);
  swift_unknownObjectRelease(v3);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV7TVMusic8Backdrop17CompositeRenderer_spectrumAnalysis));
  v6 = (char *)self + OBJC_IVAR____TtCV7TVMusic8Backdrop17CompositeRenderer_renderers;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV7TVMusic8Backdrop17CompositeRenderer_renderers);
  swift_release(*((void *)v6 + 1));
  swift_release(v7);
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = self;
  sub_10010A958(width, height);
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10010854C(v4);
}

@end