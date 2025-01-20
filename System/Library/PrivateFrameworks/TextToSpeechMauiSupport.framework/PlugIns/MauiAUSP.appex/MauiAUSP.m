uint64_t variable initialization expression of AudioUnitFactory.observation()
{
  return 0LL;
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)( AudioComponentDescription with)
{
  v2 = (objc_class *)sub_10000371C( *(unint64_t *)&with.componentType,  *(unint64_t *)&with.componentManufacturer,  with.componentFlagsMask);
  v3.super.isa = v2;
  if (!v1) {
    v4 = v2;
  }
  return v3;
}

id AudioUnitFactory.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_observation] = 0LL;
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

uint64_t sub_10000371C(unint64_t a1, unint64_t a2, int a3)
{
  int v5 = a2;
  int v6 = a1;
  unint64_t v7 = HIDWORD(a1);
  unint64_t v8 = HIDWORD(a2);
  uint64_t v9 = type metadata accessor for MauiAUSPAudioUnit(0LL);
  v23 = 0LL;
  HIDWORD(v18) = v6;
  int v19 = v7;
  int v20 = v5;
  int v21 = v8;
  int v22 = a3;
  id v10 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithComponentDescription:(char *)&v18 + 4 error:&v23];
  v11 = v23;
  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v12 = OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit;
  v13 = *(void **)(v3 + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit);
  *(void *)(v3 + OBJC_IVAR____TtC8MauiAUSP16AudioUnitFactory_auAudioUnit) = v10;
  id v14 = v11;

  uint64_t v15 = *(void *)(v3 + v12);
  if (!v15 || (uint64_t result = swift_dynamicCastClass(v15, v9)) == 0)
  {
    LODWORD(v18) = 0;
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000019LL,  0x8000000100003C50LL,  "MauiAUSP/AudioUnitFactory.swift",  31LL,  2LL,  26LL,  v18);
    __break(1u);
LABEL_5:
    id v17 = v11;
    _convertNSErrorToError(_:)(v11);

    return swift_willThrow();
  }

  return result;
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC8MauiAUSP16AudioUnitFactory);
}