uint64_t variable initialization expression of AudioUnitFactory.audioUnit()
{
  return 0LL;
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)( AudioComponentDescription with)
{
  UInt32 componentFlagsMask = with.componentFlagsMask;
  OSType componentManufacturer = with.componentManufacturer;
  OSType componentType = with.componentType;
  OSType componentSubType = with.componentSubType;
  UInt32 componentFlags = with.componentFlags;
  uint64_t v7 = type metadata accessor for MTMacinTalkAUSPAudioUnit(0LL);
  id v17 = 0LL;
  v16[0] = componentType;
  v16[1] = componentSubType;
  v16[2] = componentManufacturer;
  v16[3] = componentFlags;
  v16[4] = componentFlagsMask;
  id v8 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7)) initWithComponentDescription:v16 error:&v17];
  id v9 = v17;
  if (v8)
  {
    uint64_t v10 = OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit;
    v11 = *(void **)(v1 + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit);
    *(void *)(v1 + OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit) = v8;
    id v12 = v9;

    v14 = *(void **)(v1 + v10);
    if (v14) {
      return (AUAudioUnit)v14;
    }
    else {
      __break(1u);
    }
  }

  else
  {
    id v15 = v17;
    _convertNSErrorToError(_:)(v9);

    return (AUAudioUnit)swift_willThrow();
  }

  return result;
}

id AudioUnitFactory.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC13MacinTalkAUSP16AudioUnitFactory_audioUnit] = 0LL;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id AudioUnitFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_10000380C(uint64_t a1, uint64_t a2, int a3)
{
  id v11 = 0LL;
  v9[0] = a1;
  v9[1] = a2;
  int v10 = a3;
  id v4 = [v3 initWithComponentDescription:v9 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = v11;
  }

  else
  {
    id v7 = v11;
    _convertNSErrorToError(_:)(v5);

    swift_willThrow();
  }

  return v4;
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC13MacinTalkAUSP16AudioUnitFactory);
}