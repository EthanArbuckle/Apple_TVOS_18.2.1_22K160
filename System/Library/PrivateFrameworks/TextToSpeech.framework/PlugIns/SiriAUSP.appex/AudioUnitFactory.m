@interface AudioUnitFactory
- (_TtC8SiriAUSP16AudioUnitFactory)init;
- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4;
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation AudioUnitFactory

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context) = (Class)a3;
  id v3 = a3;
}

- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3->componentType;
  uint64_t v6 = *(void *)&a3->componentManufacturer;
  uint64_t componentFlagsMask = a3->componentFlagsMask;
  type metadata accessor for TTSSiriSynthAudioUnit(0LL);
  v8 = self;
  uint64_t v9 = TTSSiriSynthAudioUnit.__allocating_init(componentDescription:options:)(v5, v6, componentFlagsMask, 0LL);
  uint64_t v10 = OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit;
  v11 = *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit) = (Class)v9;

  v13 = *(Class *)((char *)&v8->super.isa + v10);
  if (v13)
  {
    id v14 = v13;

    return v14;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (_TtC8SiriAUSP16AudioUnitFactory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit) = 0LL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return -[AudioUnitFactory init](&v3, "init");
}

- (void).cxx_destruct
{
}

@end