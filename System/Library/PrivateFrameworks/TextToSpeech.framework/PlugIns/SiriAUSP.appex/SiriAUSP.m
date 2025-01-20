uint64_t variable initialization expression of AudioUnitFactory.context()
{
  return 0LL;
}

Swift::Void __swiftcall AudioUnitFactory.beginRequest(with:)(NSExtensionContext with)
{
  id v3 = *(id *)(v1 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context);
  *(NSExtensionContext *)(v1 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context) = with;
  v2 = with.super.isa;
}

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)( AudioComponentDescription with)
{
  uint64_t v3 = v1;
  uint64_t v4 = *(void *)&with.componentFlagsMask;
  uint64_t v5 = *(void *)&with.componentManufacturer;
  uint64_t v6 = *(void *)&with.componentType;
  type metadata accessor for TTSSiriSynthAudioUnit(0LL);
  result.super.isa = (Class)TTSSiriSynthAudioUnit.__allocating_init(componentDescription:options:)(v6, v5, v4, 0LL);
  if (!v2)
  {
    uint64_t v8 = OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit;
    v9 = *(void **)(v3 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit);
    *(AUAudioUnit *)(v3 + OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit) = result;

    v10 = *(void **)(v3 + v8);
    if (v10) {
      return (AUAudioUnit)v10;
    }
    else {
      __break(1u);
    }
  }

  return result;
}

id AudioUnitFactory.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_audioUnit] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC8SiriAUSP16AudioUnitFactory_context] = 0LL;
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

uint64_t type metadata accessor for AudioUnitFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC8SiriAUSP16AudioUnitFactory);
}