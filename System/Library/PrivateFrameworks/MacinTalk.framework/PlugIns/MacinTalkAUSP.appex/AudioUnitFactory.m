@interface AudioUnitFactory
- (_TtC13MacinTalkAUSP16AudioUnitFactory)init;
- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4;
@end

@implementation AudioUnitFactory

- (id)createAudioUnitWithComponentDescription:(AudioComponentDescription *)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3->componentType;
  uint64_t v6 = *(void *)&a3->componentManufacturer;
  UInt32 componentFlagsMask = a3->componentFlagsMask;
  uint64_t v8 = type metadata accessor for MTMacinTalkAUSPAudioUnit(0LL);
  objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v8));
  v9 = self;
  v10 = (objc_class *)sub_10000380C(v5, v6, componentFlagsMask);
  uint64_t v11 = OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit;
  v12 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit);
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit) = v10;

  v14 = *(Class *)((char *)&v9->super.isa + v11);
  if (v14)
  {
    id v15 = v14;

    return v15;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (_TtC13MacinTalkAUSP16AudioUnitFactory)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return -[AudioUnitFactory init](&v3, "init");
}

- (void).cxx_destruct
{
}

@end