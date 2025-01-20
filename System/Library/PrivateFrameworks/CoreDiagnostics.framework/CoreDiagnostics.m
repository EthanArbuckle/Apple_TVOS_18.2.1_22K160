id ExcResourceReportPaths()
{
  return +[DiagnosticReportCollectorBridge ExcResourceReportPaths]( &OBJC_CLASS____TtC15CoreDiagnostics31DiagnosticReportCollectorBridge,  "ExcResourceReportPaths");
}

BOOL WriteJetsamMemoryReport(uint64_t a1, uint64_t a2)
{
  return +[CompatibilityBridge WriteJetsamMemoryReportWithVisibilityEndowmentSet:audioAssertionSet:]( &OBJC_CLASS____TtC15CoreDiagnostics19CompatibilityBridge,  "WriteJetsamMemoryReportWithVisibilityEndowmentSet:audioAssertionSet:",  a1,  a2);
}

id DiagnosticPatternMatching.__allocating_init(type:)(int a1)
{
  id v3 = objc_allocWithZone(v1);
  return DiagnosticPatternMatching.init(type:)(a1);
}

id DiagnosticPatternMatching.init(type:)(int a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_DWORD *)&v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_type] = a1;
  if (a1 == 2)
  {
    v4 = v1;
    if ((sub_189146C48() & 1) != 0)
    {
      v21 = 0LL;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
    }

    else
    {
      *((void *)&v20 + 1) = &type metadata for PanicMatcher;
      v21 = &off_18A359590;
    }

    uint64_t v7 = (uint64_t)&v4[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher];
    sub_189142FE4((uint64_t)&v19, (uint64_t)&v4[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher]);
    sub_18914302C(v7, (uint64_t)&v19);
    uint64_t v8 = *((void *)&v20 + 1);
    sub_189142E04((uint64_t)&v19);
    if (v8)
    {
      sub_189143074();
      uint64_t v9 = sub_1891531F0();
      MEMORY[0x1895F8858](v9, v10);
      sub_1891531E4();
      uint64_t v11 = sub_189153388();
      MEMORY[0x1895F8858](v11, v12);
      *(void *)&__int128 v19 = MEMORY[0x18961AFE8];
      sub_1891430B0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C778E40);
      sub_1891430F8();
      sub_189153418();
      uint64_t v13 = sub_189153394();
      MEMORY[0x1895F8858](v13, v14);
      (*(void (**)(char *, void))(v16 + 104))( (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL),  *MEMORY[0x18961B8F8]);
      *(void *)&v4[OBJC_IVAR____SwiftDiagnosticPatternMatching_asyncQueue] = sub_1891533A0();

      v18.receiver = v4;
      v18.super_class = ObjectType;
      return objc_msgSendSuper2(&v18, sel_init);
    }
  }

  else
  {
    v5 = &v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher];
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    *((void *)v5 + 4) = 0LL;
    v6 = v1;
  }

  sub_189142E04((uint64_t)&v1[OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher]);

  swift_deallocPartialClassInstance();
  return 0LL;
}

uint64_t DiagnosticPatternMatching.getMatcherType()()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____SwiftDiagnosticPatternMatching_type);
}

Swift::Bool __swiftcall DiagnosticPatternMatching.isPatternPayloadAvailable()()
{
  if (v4) {
    BOOL v1 = sub_189146FFC();
  }
  else {
    BOOL v1 = 0;
  }
  sub_189142E04((uint64_t)v3);
  return v1;
}

uint64_t DiagnosticPatternMatching.lookForPatternAsync(report:takeAction:callback:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_189143684(a1, a3, a4);
}

uint64_t sub_189142938(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  if (v7[3]) {
    char v5 = sub_189147168(a2);
  }
  else {
    char v5 = 0;
  }
  sub_189142E04((uint64_t)v7);
  return a3(v5 & 1);
}

uint64_t sub_189142A1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id DiagnosticPatternMatching.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DiagnosticPatternMatching.init()()
{
}

id DiagnosticPatternMatching.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_189142BA0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_189142BB4(uint64_t a1, uint64_t a2)
{
  return sub_189142CFC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1896070D0]);
}

uint64_t sub_189142BC0(uint64_t a1, id *a2)
{
  uint64_t result = sub_189153220();
  *a2 = 0LL;
  return result;
}

uint64_t sub_189142C34(uint64_t a1, id *a2)
{
  char v3 = sub_18915322C();
  *a2 = 0LL;
  return v3 & 1;
}

uint64_t sub_189142CB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_189153214();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_189142CF0(uint64_t a1, uint64_t a2)
{
  return sub_189142CFC(a1, a2, MEMORY[0x189617F88]);
}

uint64_t sub_189142CFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_189153238();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_189142D38()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_189142D78()
{
  uint64_t v0 = sub_1891535E0();
  swift_bridgeObjectRelease();
  return v0;
}

_DWORD *sub_189142DE8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_189142DF8(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_189142E04(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778E28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E116C]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_189142E84()
{
  uint64_t v0 = sub_189153238();
  uint64_t v2 = v1;
  if (v0 == sub_189153238() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_189153568();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_189142F0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_189153214();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_189142F50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_189153238();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_189142F78()
{
  return sub_1891534E4();
}

uint64_t sub_189142FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18914302C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_189143074()
{
  unint64_t result = qword_18C778E30;
  if (!qword_18C778E30)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C778E30);
  }

  return result;
}

unint64_t sub_1891430B0()
{
  unint64_t result = qword_18C778E38;
  if (!qword_18C778E38)
  {
    uint64_t v1 = sub_189153388();
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x18961B8C8], v1);
    atomic_store(result, (unint64_t *)&qword_18C778E38);
  }

  return result;
}

unint64_t sub_1891430F8()
{
  unint64_t result = qword_18C778E48;
  if (!qword_18C778E48)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C778E40);
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x189618470], v1);
    atomic_store(result, (unint64_t *)&qword_18C778E48);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E1178](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t _s15CoreDiagnostics25DiagnosticPatternMatchingC07lookForD06report10takeActionSbAA10CriterialsC_SbtF_0( void *a1)
{
  uint64_t v3 = (uint64_t)v1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher;
  sub_18914302C((uint64_t)v1 + OBJC_IVAR____SwiftDiagnosticPatternMatching_patternMatcher, (uint64_t)&v12);
  uint64_t v4 = v13;
  sub_189142E04((uint64_t)&v12);
  if (v4)
  {
    sub_18914302C(v3, (uint64_t)&v12);
    if (v13) {
      char v10 = sub_189147168(a1);
    }
    else {
      char v10 = 0;
    }
    sub_189142E04((uint64_t)&v12);
  }

  else
  {
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_1891531D8();
    __swift_project_value_buffer(v5, (uint64_t)qword_18C77A250);
    v6 = v1;
    uint64_t v7 = (os_log_s *)sub_1891531B4();
    os_log_type_t v8 = sub_18915337C();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      LODWORD(v12) = *(_DWORD *)&v6[OBJC_IVAR____SwiftDiagnosticPatternMatching_type];
      sub_1891533E8();

      _os_log_impl(&dword_189140000, v7, v8, "there is no available matcher with type %u", v9, 8u);
      MEMORY[0x1895E1214](v9, -1LL, -1LL);
    }

    else
    {
    }

    char v10 = 0;
  }

  return v10 & 1;
}

uint64_t sub_189143684(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(dispatch_queue_s **)&v3[OBJC_IVAR____SwiftDiagnosticPatternMatching_asyncQueue];
  os_log_type_t v8 = (void *)swift_allocObject();
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  v8[5] = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_189143988;
  *(void *)(v9 + 24) = v8;
  v15[4] = sub_1891439A4;
  v15[5] = v9;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 1107296256LL;
  v15[2] = sub_189142A1C;
  v15[3] = &block_descriptor;
  char v10 = _Block_copy(v15);
  uint64_t v11 = v3;
  id v12 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_async_and_wait(v7, v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0) {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticPatternMatching()
{
  return objc_opt_self();
}

uint64_t method lookup function for DiagnosticPatternMatching()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DiagnosticPatternMatching.__allocating_init(type:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

void type metadata accessor for pattern_matching_type(uint64_t a1)
{
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void sub_18914382C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_189143870()
{
  return sub_1891438B8(&qword_18C778E90, (uint64_t)&unk_189153D2C);
}

uint64_t sub_189143894()
{
  return sub_1891438B8(&qword_18C778E98, (uint64_t)&unk_189153D00);
}

uint64_t sub_1891438B8(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255LL);
    uint64_t result = MEMORY[0x1895E1184](a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1891438F8()
{
  return sub_1891438B8(&qword_18C778EA0, (uint64_t)&unk_189153D9C);
}

uint64_t sub_18914391C()
{
  return swift_deallocObject();
}

uint64_t sub_189143940(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16LL))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_189143954()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_189143988()
{
  return sub_189142938(*(void *)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_189143994()
{
  return swift_deallocObject();
}

uint64_t sub_1891439A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id Criterials.__allocating_init(id:type:path:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR____SwiftCriterials_incidentID];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  uint64_t v15 = &v13[OBJC_IVAR____SwiftCriterials_logType];
  *(void *)uint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  uint64_t v16 = &v13[OBJC_IVAR____SwiftCriterials_panicReportPath];
  *(void *)uint64_t v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id Criterials.init(id:type:path:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = &v6[OBJC_IVAR____SwiftCriterials_incidentID];
  *(void *)uint64_t v7 = a1;
  *((void *)v7 + 1) = a2;
  os_log_type_t v8 = &v6[OBJC_IVAR____SwiftCriterials_logType];
  *(void *)os_log_type_t v8 = a3;
  *((void *)v8 + 1) = a4;
  uint64_t v9 = &v6[OBJC_IVAR____SwiftCriterials_panicReportPath];
  *(void *)uint64_t v9 = a5;
  *((void *)v9 + 1) = a6;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for Criterials();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for Criterials()
{
  return objc_opt_self();
}

id Criterials.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Criterials.init()()
{
}

id Criterials.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Criterials();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for Criterials()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Criterials.__allocating_init(id:type:path:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_189143CCC()
{
  uint64_t v0 = sub_1891531D8();
  __swift_allocate_value_buffer(v0, qword_18C77A250);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C77A250);
  return sub_1891531C0();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

id sub_189143D88(uint64_t a1)
{
  if (MEMORY[0x189612BA8])
  {
    id v1 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, a1);
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1891531D8();
    __swift_project_value_buffer(v2, (uint64_t)qword_18C77A250);
    uint64_t v3 = (os_log_s *)sub_1891531B4();
    os_log_type_t v4 = sub_18915337C();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_189140000, v3, v4, "found trial clinet", v5, 2u);
      MEMORY[0x1895E1214](v5, -1LL, -1LL);
    }
  }

  else
  {
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_1891531D8();
    __swift_project_value_buffer(v6, (uint64_t)qword_18C77A250);
    uint64_t v7 = (os_log_s *)sub_1891531B4();
    os_log_type_t v8 = sub_18915337C();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_189140000, v7, v8, "Trial is not available on this OS", v9, 2u);
      MEMORY[0x1895E1214](v9, -1LL, -1LL);
    }

    return 0LL;
  }

  return v1;
}

ValueMetadata *type metadata accessor for PanicMatcher()
{
  return &type metadata for PanicMatcher;
}

uint64_t sub_189143F54(char a1)
{
  return *(void *)&aTelemetraction[8 * a1];
}

uint64_t sub_189143F74(char *a1, char *a2)
{
  return sub_189143F80(*a1, *a2);
}

uint64_t sub_189143F80(char a1, char a2)
{
  if (*(void *)&aTelemetraction[8 * a1] == *(void *)&aTelemetraction[8 * a2]
    && *(void *)&aYMode[8 * a1] == *(void *)&aYMode[8 * a2])
  {
    char v3 = 1;
  }

  else
  {
    char v3 = sub_189153568();
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_189144004()
{
  return sub_18914400C();
}

uint64_t sub_18914400C()
{
  return sub_1891535E0();
}

uint64_t sub_189144074()
{
  return sub_18914407C();
}

uint64_t sub_18914407C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1891440BC()
{
  return sub_1891440C4();
}

uint64_t sub_1891440C4()
{
  return sub_1891535E0();
}

uint64_t sub_189144128@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_189148224();
  *a1 = result;
  return result;
}

uint64_t sub_189144154@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_189143F54(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_18914417C()
{
  return sub_189143F54(*v0);
}

uint64_t sub_189144184@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_189148224();
  *a1 = result;
  return result;
}

uint64_t sub_1891441A8()
{
  return 0LL;
}

void sub_1891441B4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1891441C0()
{
  return sub_18915361C();
}

uint64_t sub_1891441E8()
{
  return sub_189153628();
}

uint64_t sub_189144210(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5, v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891484C0();
  sub_189153604();
  LOBYTE(v13[0]) = 0;
  sub_189153544();
  if (!v2)
  {
    char v10 = *(_BYTE *)(v3 + 20);
    LOBYTE(v13[0]) = 1;
    char v15 = v10;
    sub_189153538();
    __int128 v11 = *(_OWORD *)(v3 + 40);
    v13[0] = *(_OWORD *)(v3 + 24);
    v13[1] = v11;
    v13[2] = *(_OWORD *)(v3 + 56);
    uint64_t v14 = *(void *)(v3 + 72);
    char v15 = 2;
    sub_189148548();
    sub_189153550();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

__n128 sub_189144388@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }

  return result;
}

uint64_t sub_1891443D0(void *a1)
{
  return sub_189144210(a1);
}

uint64_t sub_1891443E4(char a1)
{
  return *(void *)&aBugtype_0[8 * a1];
}

BOOL sub_189144404(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_189144418()
{
  return sub_1891535E0();
}

uint64_t sub_18914445C()
{
  return sub_1891535D4();
}

uint64_t sub_189144484()
{
  return sub_1891535E0();
}

uint64_t sub_1891444C4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778FD8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5, v7);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_189148CA4();
  sub_189153604();
  LOBYTE(v12) = 0;
  sub_189153544();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_189153544();
    __int128 v12 = *(_OWORD *)(v3 + 32);
    uint64_t v13 = *(void *)(v3 + 48);
    v11[15] = 2;
    sub_189148D2C();
    sub_189153550();
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_189144620()
{
  return sub_1891443E4(*v0);
}

uint64_t sub_189144628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_189148904(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_18914464C()
{
  return sub_18915361C();
}

uint64_t sub_189144674()
{
  return sub_189153628();
}

double sub_18914469C@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }

  return result;
}

uint64_t sub_1891446E8(void *a1)
{
  return sub_1891444C4(a1);
}

uint64_t sub_1891446FC(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x61724663696E6170LL;
  }
  else {
    return 0xD000000000000011LL;
  }
}

uint64_t sub_189144740(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[0] = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C779020);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6, v8);
  char v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_18914943C();
  sub_189153604();
  char v14 = 0;
  sub_189153544();
  if (!v4)
  {
    v12[1] = v12[0];
    char v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C779010);
    sub_189149480(&qword_18C779028, MEMORY[0x189617FB0], MEMORY[0x189618448]);
    sub_18915352C();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

BOOL sub_1891448A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1891448BC()
{
  return sub_1891446FC(*v0);
}

uint64_t sub_1891448C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_189149160(a1, a2);
  *a3 = result;
  return result;
}

void sub_1891448E8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1891448F4()
{
  return sub_18915361C();
}

uint64_t sub_18914491C()
{
  return sub_189153628();
}

uint64_t sub_189144944@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_18914925C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }

  return result;
}

uint64_t sub_189144970(void *a1)
{
  return sub_189144740(a1, *v1, v1[1], v1[2]);
}

void sub_18914498C()
{
  qword_18C77A270 = MEMORY[0x18961AFE8];
}

uint64_t sub_1891449A0(uint64_t a1, unint64_t a2)
{
  uint64_t v83 = sub_189153484();
  uint64_t v84 = *(void *)(v83 - 8);
  uint64_t v5 = MEMORY[0x1895F8858](v83, v4);
  uint64_t v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = MEMORY[0x1895F8858](v5, v8);
  v79 = (char *)&v70 - v10;
  uint64_t v12 = MEMORY[0x1895F8858](v9, v11);
  v81 = (char *)&v70 - v13;
  uint64_t v15 = MEMORY[0x1895F8858](v12, v14);
  v17 = (char *)&v70 - v16;
  uint64_t v19 = MEMORY[0x1895F8858](v15, v18);
  *(void *)&__int128 v86 = (char *)&v70 - v20;
  uint64_t v22 = MEMORY[0x1895F8858](v19, v21);
  v24 = (char *)&v70 - v23;
  uint64_t v26 = MEMORY[0x1895F8858](v22, v25);
  v28 = (char *)&v70 - v27;
  uint64_t v30 = MEMORY[0x1895F8858](v26, v29);
  v75 = (char *)&v70 - v31;
  uint64_t v33 = MEMORY[0x1895F8858](v30, v32);
  v35 = (char *)&v70 - v34;
  uint64_t v37 = MEMORY[0x1895F8858](v33, v36);
  v72 = (char *)&v70 - v38;
  MEMORY[0x1895F8858](v37, v39);
  v73 = (char *)&v70 - v40;
  uint64_t v85 = sub_189153490();
  uint64_t v82 = *(void *)(v85 - 8);
  MEMORY[0x1895F8858](v85, v41);
  if (qword_18C778E08 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_1891531D8();
  uint64_t v43 = __swift_project_value_buffer(v42, (uint64_t)qword_18C77A250);
  swift_bridgeObjectRetain_n();
  uint64_t v87 = v43;
  v44 = (os_log_s *)sub_1891531B4();
  os_log_type_t v45 = sub_18915337C();
  BOOL v46 = os_log_type_enabled(v44, v45);
  v76 = v35;
  v78 = v24;
  v80 = v7;
  v74 = v28;
  v77 = v17;
  if (v46)
  {
    v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v90 = v48;
    *(_DWORD *)v47 = 136315138;
    swift_bridgeObjectRetain();
    v89[0] = sub_18914D398(a1, a2, &v90);
    sub_1891533E8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_189140000, v44, v45, "read %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E1214](v48, -1LL, -1LL);
    MEMORY[0x1895E1214](v47, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n();
  }

  uint64_t v49 = sub_189153148();
  uint64_t v50 = *(void *)(v49 - 8);
  MEMORY[0x1895F8858](v49, v51);
  v53 = (char *)&v70 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189153118();
  uint64_t v54 = sub_189153154();
  unint64_t v56 = v55;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v49);
  sub_189147D28(v54, v56);
  if (qword_18C778E10 != -1) {
    swift_once();
  }
  sub_18915304C();
  swift_allocObject();
  sub_189153040();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F48);
  sub_189147D6C();
  sub_189153034();
  sub_189147E14(v54, v56);
  swift_release();
  v57 = sub_189146524(v90);
  swift_bridgeObjectRelease();
  qword_18C77A270 = (uint64_t)v57;
  swift_bridgeObjectRelease();
  uint64_t v58 = *(void *)(qword_18C77A270 + 16);
  if (v58)
  {
    uint64_t v71 = v54;
    unint64_t v70 = v56;
    uint64_t v59 = qword_18C77A270 + 32;
    uint64_t v85 = qword_18C77A270;
    swift_bridgeObjectRetain();
    *(void *)&__int128 v60 = 136315138LL;
    __int128 v86 = v60;
    do
    {
      sub_189147E58(v59, (uint64_t)&v90);
      v61 = (os_log_s *)sub_1891531B4();
      os_log_type_t v62 = sub_18915337C();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        uint64_t v88 = v64;
        *(_DWORD *)uint64_t v63 = v86;
        sub_189147E58((uint64_t)&v90, (uint64_t)v89);
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F78);
        uint64_t v65 = sub_189153244();
        *(void *)(v63 + 4) = sub_18914D398(v65, v66, &v88);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
        _os_log_impl(&dword_189140000, v61, v62, "%s", (uint8_t *)v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E1214](v64, -1LL, -1LL);
        MEMORY[0x1895E1214](v63, -1LL, -1LL);
      }

      else
      {

        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v90);
      }

      v59 += 40LL;
      --v58;
    }

    while (v58);
    swift_bridgeObjectRelease();
    uint64_t v67 = v71;
    unint64_t v68 = v70;
  }

  else
  {
    uint64_t v67 = v54;
    unint64_t v68 = v56;
  }

  sub_189147E14(v67, v68);
  return 1LL;
}

void *sub_1891460C0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_189153F00;
  *(void *)(inited + 32) = 0x556E726574746170LL;
  *(void *)(inited + 40) = 0xEB00000000444955LL;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_189153214();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = 0x6E6F69746361LL;
  *(void *)(inited + 64) = 0xE600000000000000LL;
  swift_beginAccess();
  *(void *)(inited + 72) = sub_1891535EC();
  *(void *)(inited + 80) = 0x657079745F677562LL;
  *(void *)(inited + 88) = 0xE800000000000000LL;
  uint64_t result = __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  uint64_t v7 = result[3];
  unint64_t v8 = result[4];
  uint64_t v9 = HIBYTE(v8) & 0xF;
  uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  if ((v8 & 0x2000000000000000LL) != 0) {
    uint64_t v11 = HIBYTE(v8) & 0xF;
  }
  else {
    uint64_t v11 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v11) {
    goto LABEL_35;
  }
  if ((v8 & 0x1000000000000000LL) != 0)
  {
    swift_bridgeObjectRetain();
    sub_18914DA64(v7, v8, 10LL);
    swift_bridgeObjectRelease();
LABEL_35:
    *(void *)(inited + 96) = sub_1891533DC();
    return (void *)sub_18914AAA0(inited);
  }

  if ((v8 & 0x2000000000000000LL) == 0)
  {
    if ((v7 & 0x1000000000000000LL) != 0) {
      uint64_t v12 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v12 = (unsigned __int8 *)sub_18915349C();
    }
    sub_18914DA50(v12, v10, 10LL);
    goto LABEL_35;
  }

  v30[0] = result[3];
  v30[1] = v8 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (v9)
    {
      if (v9 != 1 && (BYTE1(v7) - 48) <= 9u && v9 != 2 && (BYTE2(v7) - 48) <= 9u)
      {
        unint64_t v16 = 10LL * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
        uint64_t v17 = v9 - 3;
        if (v17)
        {
          uint64_t v18 = (unsigned __int8 *)v30 + 3;
          do
          {
            unsigned int v19 = *v18 - 48;
            if (v19 > 9) {
              break;
            }
            if (!is_mul_ok(v16, 0xAuLL)) {
              break;
            }
            BOOL v14 = __CFADD__(10 * v16, v19);
            unint64_t v16 = 10 * v16 + v19;
            if (v14) {
              break;
            }
            ++v18;
            --v17;
          }

          while (v17);
        }
      }

      goto LABEL_35;
    }
  }

  else
  {
    if (v7 != 45)
    {
      if (v9)
      {
        if ((v7 - 48) <= 9u && v9 != 1 && (BYTE1(v7) - 48) <= 9u)
        {
          unint64_t v20 = 10LL * (v7 - 48) + (BYTE1(v7) - 48);
          uint64_t v21 = v9 - 2;
          if (v21)
          {
            uint64_t v22 = (unsigned __int8 *)v30 + 2;
            do
            {
              unsigned int v23 = *v22 - 48;
              if (v23 > 9) {
                break;
              }
              if (!is_mul_ok(v20, 0xAuLL)) {
                break;
              }
              BOOL v14 = __CFADD__(10 * v20, v23);
              unint64_t v20 = 10 * v20 + v23;
              if (v14) {
                break;
              }
              ++v22;
              --v21;
            }

            while (v21);
          }
        }
      }

      goto LABEL_35;
    }

    if (v9)
    {
      if (v9 != 1)
      {
        unsigned __int8 v13 = BYTE1(v7) - 48;
        if ((BYTE1(v7) - 48) <= 9u)
        {
          BOOL v14 = v13 == 0LL;
          unint64_t v15 = -(uint64_t)v13;
          if (v14 && v9 != 2)
          {
            unsigned __int8 v24 = BYTE2(v7) - 48;
            if ((BYTE2(v7) - 48) <= 9u && is_mul_ok(v15, 0xAuLL))
            {
              unint64_t v25 = 10 * v15;
              unint64_t v26 = v25 - v24;
              if (v25 >= v24)
              {
                uint64_t v27 = v9 - 3;
                if (v27)
                {
                  v28 = (unsigned __int8 *)v30 + 3;
                  do
                  {
                    unsigned int v29 = *v28 - 48;
                    if (v29 > 9) {
                      break;
                    }
                    if (!is_mul_ok(v26, 0xAuLL)) {
                      break;
                    }
                    BOOL v14 = 10 * v26 >= v29;
                    unint64_t v26 = 10 * v26 - v29;
                    if (!v14) {
                      break;
                    }
                    ++v28;
                    --v27;
                  }

                  while (v27);
                }
              }
            }
          }
        }
      }

      goto LABEL_35;
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

id sub_1891464B0(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_189147CEC();
    uint64_t v4 = (void *)sub_1891531FC();
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  return v4;
}

__int128 *sub_189146524(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = (__int128 *)MEMORY[0x18961AFE8];
  if (v1)
  {
    os_log_type_t v45 = (__int128 *)MEMORY[0x18961AFE8];
    sub_189152140(0, v1, 0);
    uint64_t v2 = v45;
    uint64_t v4 = (void *)(a1 + 104);
    do
    {
      uint64_t v37 = v2;
      int64_t v38 = v1;
      uint64_t v5 = *(v4 - 9);
      uint64_t v6 = *(v4 - 8);
      int v7 = *((_DWORD *)v4 - 14);
      char v8 = *((_BYTE *)v4 - 52);
      uint64_t v9 = *(v4 - 6);
      uint64_t v10 = *(v4 - 5);
      uint64_t v11 = *(v4 - 3);
      unint64_t v36 = *(v4 - 4);
      uint64_t v12 = *(v4 - 1);
      *(void *)&__int128 v35 = *(v4 - 2);
      uint64_t v13 = *v4;
      uint64_t v43 = &type metadata for PanicPayload;
      v44 = &off_18A359728;
      uint64_t v14 = swift_allocObject();
      v42[0] = v14;
      *(void *)(v14 + 16) = v5;
      *(void *)(v14 + 24) = v6;
      *(_DWORD *)(v14 + 32) = v7;
      *(_BYTE *)(v14 + 36) = v8;
      unint64_t v15 = v36;
      unint64_t v16 = v37;
      *(void *)(v14 + 40) = v9;
      *(void *)(v14 + 48) = v10;
      *(void *)(v14 + 56) = v15;
      *(void *)(v14 + 64) = v11;
      *(void *)(v14 + 72) = v35;
      *(void *)(v14 + 80) = v12;
      *(void *)(v14 + 88) = v13;
      unint64_t v18 = *((void *)v16 + 2);
      unint64_t v17 = *((void *)v16 + 3);
      os_log_type_t v45 = v16;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v36 = v18;
      unsigned int v19 = &type metadata for PanicPayload;
      if (v18 >= v17 >> 1)
      {
        sub_189152140(v17 > 1, v18 + 1, 1);
        unsigned int v19 = v43;
        unint64_t v16 = v45;
      }

      v4 += 10;
      uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, (uint64_t)v19);
      uint64_t v37 = &v33;
      MEMORY[0x1895F8858](v20, v20);
      uint64_t v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v23 + 16))(v22);
      unsigned __int8 v24 = v16;
      uint64_t v25 = *(void *)v22;
      uint64_t v26 = *((void *)v22 + 1);
      int v27 = *((_DWORD *)v22 + 4);
      char v28 = v22[20];
      __int128 v29 = *(_OWORD *)(v22 + 24);
      __int128 v34 = *(_OWORD *)(v22 + 40);
      __int128 v35 = v29;
      __int128 v33 = *(_OWORD *)(v22 + 56);
      uint64_t v30 = *((void *)v22 + 9);
      uint64_t v40 = &type metadata for PanicPayload;
      uint64_t v41 = &off_18A359728;
      uint64_t v31 = swift_allocObject();
      *(void *)&__int128 v39 = v31;
      *(void *)(v31 + 16) = v25;
      *(void *)(v31 + 24) = v26;
      uint64_t v2 = v24;
      *(_DWORD *)(v31 + 32) = v27;
      *(_BYTE *)(v31 + 36) = v28;
      *(_OWORD *)(v31 + 40) = v35;
      *(_OWORD *)(v31 + 56) = v34;
      *(_OWORD *)(v31 + 72) = v33;
      *(void *)(v31 + 88) = v30;
      *((void *)v24 + 2) = v18 + 1;
      sub_189147BE0(&v39, (uint64_t)v24 + 40 * v36 + 32);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      int64_t v1 = v38 - 1;
    }

    while (v38 != 1);
  }

  return v2;
}

id sub_1891467A0()
{
  if (qword_18C778E08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1891531D8();
  __swift_project_value_buffer(v0, (uint64_t)qword_18C77A250);
  int64_t v1 = (os_log_s *)sub_1891531B4();
  os_log_type_t v2 = sub_18915337C();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_189140000, v1, v2, "update panic payloads", v3, 2u);
    MEMORY[0x1895E1214](v3, -1LL, -1LL);
  }

  uint64_t v4 = (void *)qword_18C77A268;
  if (!qword_18C77A268)
  {
    uint64_t v5 = (os_log_s *)sub_1891531B4();
    os_log_type_t v6 = sub_18915337C();
    if (os_log_type_enabled(v5, v6))
    {
      int v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_189140000, v5, v6, "No payloadManager", v7, 2u);
      MEMORY[0x1895E1214](v7, -1LL, -1LL);
    }

    uint64_t v4 = (void *)qword_18C77A268;
    if (!qword_18C77A268) {
      goto LABEL_10;
    }
  }

  id v8 = v4;
  objc_msgSend(v8, sel_refresh);
  uint64_t v9 = (void *)sub_189153214();
  uint64_t v10 = (void *)sub_189153214();
  id v11 = objc_msgSend(v8, sel_levelForFactor_withNamespaceName_, v9, v10);

  objc_msgSend(v8, sel_dispose);
  if (!v11)
  {
LABEL_10:
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x189612BB0]), sel_init);
    uint64_t v13 = (void *)sub_189153214();
    objc_msgSend(v12, sel_setPath_, v13);

    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x189612BB8]), sel_init);
  }

  id result = objc_msgSend(v11, sel_fileValue);
  if (result)
  {
    unint64_t v15 = result;
    unsigned int v16 = objc_msgSend(result, sel_hasPath);

    if (!v16) {
      goto LABEL_17;
    }
    id result = objc_msgSend(v11, sel_fileValue);
    if (result)
    {
      unint64_t v17 = result;
      id v18 = objc_msgSend(result, sel_path);

      if (v18)
      {
        uint64_t v19 = sub_189153238();
        unint64_t v21 = v20;

        swift_bridgeObjectRetain_n();
        uint64_t v22 = (os_log_s *)sub_1891531B4();
        os_log_type_t v23 = sub_18915337C();
        if (os_log_type_enabled(v22, v23))
        {
          unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
          uint64_t v25 = swift_slowAlloc();
          uint64_t v29 = v25;
          *(_DWORD *)unsigned __int8 v24 = 136315138;
          swift_bridgeObjectRetain();
          sub_18914D398(v19, v21, &v29);
          sub_1891533E8();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_189140000, v22, v23, "found Trial payload at %s", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1895E1214](v25, -1LL, -1LL);
          MEMORY[0x1895E1214](v24, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n();
        }

        return (id)v19;
      }

LABEL_17:
      uint64_t v26 = (os_log_s *)sub_1891531B4();
      os_log_type_t v27 = sub_18915337C();
      if (os_log_type_enabled(v26, v27))
      {
        char v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v28 = 0;
        _os_log_impl(&dword_189140000, v26, v27, "No valid assets in trial level for factor panicPayloadV1", v28, 2u);
        MEMORY[0x1895E1214](v28, -1LL, -1LL);
      }

      return 0LL;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

  os_log_type_t v6 = *a1;
  int v7 = v6 >= 3;
  id v8 = v6 - 3;
  if (!v7) {
    id v8 = -1;
  }
  return (v8 + 1);
}

  os_log_type_t v6 = *a1;
  int v7 = v6 >= 2;
  id v8 = v6 - 2;
  if (!v7) {
    id v8 = -1;
  }
  return (v8 + 1);
}

uint64_t sub_189146C48()
{
  if (!MEMORY[0x189612BA8])
  {
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_1891531D8();
    __swift_project_value_buffer(v1, (uint64_t)qword_18C77A250);
    os_log_type_t v2 = (os_log_s *)sub_1891531B4();
    os_log_type_t v3 = sub_18915337C();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_189140000, v2, v3, "Trial is not available on this OS", v4, 2u);
      MEMORY[0x1895E1214](v4, -1LL, -1LL);
    }

    uint64_t v5 = (void *)qword_18C77A268;
    qword_18C77A268 = 0LL;

    return 1LL;
  }

  if (qword_18C77A268) {
    return 0LL;
  }
  id v6 = sub_189143D88(332LL);
  int v7 = (void *)qword_18C77A268;
  qword_18C77A268 = (uint64_t)v6;

  id v8 = sub_1891467A0();
  if (v9)
  {
    uint64_t v10 = (uint64_t)v8;
    unint64_t v11 = v9;
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1891531D8();
    __swift_project_value_buffer(v12, (uint64_t)qword_18C77A250);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = (os_log_s *)sub_1891531B4();
    os_log_type_t v14 = sub_18915337C();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v23 = v16;
      *(_DWORD *)unint64_t v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_18914D398(v10, v11, &v23);
      sub_1891533E8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_189140000, v13, v14, "panic payload %s updated", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E1214](v16, -1LL, -1LL);
      MEMORY[0x1895E1214](v15, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n();
    }

    char v22 = sub_1891449A0(v10, v11);
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0) {
      return 0LL;
    }
    id v18 = (os_log_s *)sub_1891531B4();
    os_log_type_t v19 = sub_18915337C();
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_23;
    }
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    unint64_t v21 = "Failed to parse payload";
  }

  else
  {
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1891531D8();
    __swift_project_value_buffer(v17, (uint64_t)qword_18C77A250);
    id v18 = (os_log_s *)sub_1891531B4();
    os_log_type_t v19 = sub_18915337C();
    if (!os_log_type_enabled(v18, v19)) {
      goto LABEL_23;
    }
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v20 = 0;
    unint64_t v21 = "Failed to find panic payload from Trial";
  }

  _os_log_impl(&dword_189140000, v18, v19, v21, v20, 2u);
  MEMORY[0x1895E1214](v20, -1LL, -1LL);
LABEL_23:

  return 1LL;
}

BOOL sub_189146FFC()
{
  if (qword_18C778E08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1891531D8();
  __swift_project_value_buffer(v0, (uint64_t)qword_18C77A250);
  uint64_t v1 = (os_log_s *)sub_1891531B4();
  os_log_type_t v2 = sub_18915337C();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v3 = 134217984;
    if (qword_18C778E10 != -1) {
      swift_once();
    }
    sub_1891533E8();
    _os_log_impl(&dword_189140000, v1, v2, "payloads count %ld", v3, 0xCu);
    MEMORY[0x1895E1214](v3, -1LL, -1LL);
  }

  if (qword_18C778E10 != -1) {
    swift_once();
  }
  return *(void *)(qword_18C77A270 + 16) != 0LL;
}

uint64_t sub_189147168(void *a1)
{
  uint64_t v3 = sub_1891531D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3, v5);
  int v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F08);
  MEMORY[0x1895F8858](v8, v9);
  uint64_t v71 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F10);
  uint64_t v70 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11, v12);
  uint64_t v82 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!qword_18C77A268) {
    goto LABEL_33;
  }
  if (qword_18C778E10 != -1) {
    swift_once();
  }
  uint64_t v66 = qword_18C77A270;
  uint64_t v14 = *(void *)(qword_18C77A270 + 16);
  if (!v14)
  {
LABEL_33:
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v3, (uint64_t)qword_18C77A250);
    v57 = (os_log_s *)sub_1891531B4();
    os_log_type_t v58 = sub_18915337C();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_189140000, v57, v58, "There is no panic payload available", v59, 2u);
      MEMORY[0x1895E1214](v59, -1LL, -1LL);
    }

    char v60 = 0;
    goto LABEL_38;
  }

  type metadata accessor for PanicCriterials();
  uint64_t v15 = swift_dynamicCastClass();
  if (!v15)
  {
    char v60 = 1;
LABEL_38:
    sub_189147AF0();
    swift_allocError();
    char *v61 = v60;
    swift_willThrow();
    return v62 & 1;
  }

  uint64_t v16 = v15;
  uint64_t v79 = v11;
  unint64_t v68 = v7;
  uint64_t v69 = v4;
  uint64_t v17 = swift_allocObject();
  uint64_t v75 = swift_allocObject();
  id v18 = (_DWORD *)(v75 + 16);
  uint64_t v67 = (uint64_t *)(v16 + OBJC_IVAR____SwiftPanicCriterials_panicReasonString);
  uint64_t v19 = v66 + 32;
  id v65 = a1;
  swift_bridgeObjectRetain();
  v81 = v18;
  swift_beginAccess();
  char v20 = 0;
  int v74 = 0;
  *(void *)&__int128 v21 = 136315138LL;
  __int128 v76 = v21;
  uint64_t v73 = MEMORY[0x18961AFC0] + 8LL;
  unint64_t v72 = 0x80000001891548B0LL;
  uint64_t v77 = v3;
  char v22 = v1;
  uint64_t v80 = v17;
  do
  {
    sub_189147E58(v19, (uint64_t)&v91);
    uint64_t v23 = __swift_project_boxed_opaque_existential_1(&v91, v92);
    uint64_t v25 = v23[5];
    uint64_t v24 = v23[6];
    swift_bridgeObjectRetain();
    if ((v20 & 1) != 0) {
      swift_bridgeObjectRelease();
    }
    *(void *)(v17 + 16) = v25;
    *(void *)(v17 + 24) = v24;
    uint64_t v26 = __swift_project_boxed_opaque_existential_1(&v91, v92);
    int v27 = *((_DWORD *)v26 + 4);
    if (*((_BYTE *)v26 + 20)) {
      int v27 = 0;
    }
    _DWORD *v81 = v27;
    BOOL v90 = 0;
    if (qword_18C778E08 != -1) {
      swift_once();
    }
    uint64_t v28 = __swift_project_value_buffer(v3, (uint64_t)qword_18C77A250);
    sub_189147E58((uint64_t)&v91, (uint64_t)&aBlock);
    uint64_t v29 = (os_log_s *)sub_1891531B4();
    os_log_type_t v30 = sub_18915337C();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      *(void *)&__int128 v89 = v32;
      *(_DWORD *)uint64_t v31 = v76;
      __int128 v33 = __swift_project_boxed_opaque_existential_1(&aBlock, (uint64_t)v86);
      uint64_t v34 = v33[7];
      unint64_t v35 = v33[8];
      swift_bridgeObjectRetain();
      *(void *)(v31 + 4) = sub_18914D398(v34, v35, (uint64_t *)&v89);
      uint64_t v3 = v77;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
      _os_log_impl(&dword_189140000, v29, v30, "create a regex %s", (uint8_t *)v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E1214](v32, -1LL, -1LL);
      MEMORY[0x1895E1214](v31, -1LL, -1LL);
    }

    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
    }

    __swift_project_boxed_opaque_existential_1(&v91, v92);
    swift_bridgeObjectRetain();
    unint64_t v36 = v82;
    sub_1891531A8();
    if (v22)
    {
      uint64_t v37 = (os_log_s *)sub_1891531B4();
      os_log_type_t v38 = sub_18915337C();
      if (os_log_type_enabled(v37, v38))
      {
        __int128 v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)__int128 v39 = 0;
        _os_log_impl(&dword_189140000, v37, v38, "Failed to create regex", v39, 2u);
        MEMORY[0x1895E1214](v39, -1LL, -1LL);
      }

      char v22 = 0LL;
    }

    else
    {
      v78 = 0LL;
      uint64_t v40 = v67[1];
      uint64_t aBlock = *v67;
      uint64_t v84 = v40;
      sub_18915319C();
      sub_189147C1C();
      sub_189147C60();
      uint64_t v41 = (uint64_t)v71;
      sub_189153208();
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F30);
      BOOL v43 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 48LL))(v41, 1LL, v42) != 1;
      sub_189147CAC(v41);
      swift_beginAccess();
      BOOL v90 = v43;
      uint64_t v44 = v69;
      os_log_type_t v45 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v28, v3);
      BOOL v46 = (os_log_s *)sub_1891531B4();
      os_log_type_t v47 = sub_18915337C();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = v44;
        uint64_t v49 = swift_slowAlloc();
        uint64_t v50 = swift_slowAlloc();
        uint64_t aBlock = v50;
        *(_DWORD *)uint64_t v49 = v76;
        if (v90) {
          uint64_t v51 = 7562585LL;
        }
        else {
          uint64_t v51 = 28494LL;
        }
        if (v90) {
          unint64_t v52 = 0xE300000000000000LL;
        }
        else {
          unint64_t v52 = 0xE200000000000000LL;
        }
        *(void *)(v49 + 4) = sub_18914D398(v51, v52, &aBlock);
        uint64_t v3 = v77;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_189140000, v46, v47, "panic string matched: %s", (uint8_t *)v49, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E1214](v50, -1LL, -1LL);
        MEMORY[0x1895E1214](v49, -1LL, -1LL);

        (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v3);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v82, v79);
      }

      else
      {

        (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v3);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v36, v79);
      }

      char v22 = v78;
    }

    uint64_t v17 = v80;
    swift_beginAccess();
    if (v90)
    {
      v53 = (void *)sub_189153214();
      sub_189147E58((uint64_t)&v91, (uint64_t)&v89);
      uint64_t v54 = swift_allocObject();
      uint64_t v55 = v75;
      *(void *)(v54 + 16) = v17;
      *(void *)(v54 + 24) = v55;
      sub_189147BE0(&v89, v54 + 32);
      uint64_t v87 = sub_189147BF8;
      uint64_t v88 = v54;
      uint64_t aBlock = MEMORY[0x1895F87A8];
      uint64_t v84 = 1107296256LL;
      uint64_t v85 = sub_1891464B0;
      __int128 v86 = &block_descriptor_0;
      unint64_t v56 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      AnalyticsSendEventLazy();
      _Block_release(v56);

      int v74 = 1;
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v91);
    v19 += 40LL;
    char v20 = 1;
    --v14;
  }

  while (v14);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_deallocUninitializedObject();
  char v62 = v74;
  return v62 & 1;
}

unint64_t sub_189147AF0()
{
  unint64_t result = qword_18C778F18;
  if (!qword_18C778F18)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189154520, &type metadata for DiagnosticPatternMatchingError);
    atomic_store(result, (unint64_t *)&qword_18C778F18);
  }

  return result;
}

uint64_t sub_189147B34()
{
  return swift_deallocObject();
}

uint64_t sub_189147B58()
{
  return swift_deallocObject();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_189147BAC()
{
  return swift_deallocObject();
}

uint64_t sub_189147BE0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_189147BF8()
{
  return sub_1891460C0(v0[2], v0[3], v0 + 4);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_189147C1C()
{
  unint64_t result = qword_18C778F20;
  if (!qword_18C778F20)
  {
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x189617FC0], MEMORY[0x189617FA8]);
    atomic_store(result, (unint64_t *)&qword_18C778F20);
  }

  return result;
}

unint64_t sub_189147C60()
{
  unint64_t result = qword_18C778F28;
  if (!qword_18C778F28)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C778F10);
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x18961CED0], v1);
    atomic_store(result, (unint64_t *)&qword_18C778F28);
  }

  return result;
}

uint64_t sub_189147CAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_189147CEC()
{
  unint64_t result = qword_18C778F38;
  if (!qword_18C778F38)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C778F38);
  }

  return result;
}

uint64_t sub_189147D28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

unint64_t sub_189147D6C()
{
  unint64_t result = qword_18C778F50;
  if (!qword_18C778F50)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C778F48);
    unint64_t v2 = sub_189147DD0();
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x189618478], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_18C778F50);
  }

  return result;
}

unint64_t sub_189147DD0()
{
  unint64_t result = qword_18C778F58;
  if (!qword_18C778F58)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189153F8C, &type metadata for PanicPayload);
    atomic_store(result, (unint64_t *)&qword_18C778F58);
  }

  return result;
}

uint64_t sub_189147E14(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_189147E58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_189147E9C()
{
  return swift_deallocObject();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PanicPayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PanicPayload()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PanicPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PanicPayload(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v3;
  return result;
}

uint64_t assignWithTake for PanicPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PanicPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PanicPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0LL;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 80) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for PanicPayload()
{
  return &type metadata for PanicPayload;
}

uint64_t sub_189148224()
{
  unint64_t v0 = sub_1891534F0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3LL;
  }
  else {
    return v0;
  }
}

uint64_t sub_18914826C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5, v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1891484C0();
  sub_1891535F8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v24) = 0;
  uint64_t v10 = sub_189153514();
  uint64_t v12 = v11;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_189153508();
  char v31 = 2;
  sub_189148504();
  sub_189153520();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v13 = v25;
  uint64_t v14 = v27;
  uint64_t v22 = v26;
  uint64_t v15 = v29;
  uint64_t v20 = v24;
  uint64_t v21 = v28;
  uint64_t v16 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  char v18 = BYTE4(v23);
  *(_DWORD *)(a2 + 16) = v23;
  *(_BYTE *)(a2 + 20) = v18 & 1;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v13;
  *(void *)(a2 + 40) = v22;
  *(void *)(a2 + 48) = v14;
  *(void *)(a2 + 56) = v21;
  *(void *)(a2 + 64) = v15;
  *(void *)(a2 + 72) = v16;
  return result;
}

unint64_t sub_1891484C0()
{
  unint64_t result = qword_18C778F88;
  if (!qword_18C778F88)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189154108, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778F88);
  }

  return result;
}

unint64_t sub_189148504()
{
  unint64_t result = qword_18C778F90;
  if (!qword_18C778F90)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_1891540E0, &type metadata for Pattern);
    atomic_store(result, (unint64_t *)&qword_18C778F90);
  }

  return result;
}

unint64_t sub_189148548()
{
  unint64_t result = qword_18C778FA0;
  if (!qword_18C778FA0)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_1891540B8, &type metadata for Pattern);
    atomic_store(result, (unint64_t *)&qword_18C778FA0);
  }

  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_1891485A4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1891485B0(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PanicPayload.CodingKeys()
{
  return &type metadata for PanicPayload.CodingKeys;
}

uint64_t destroy for Pattern()
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Pattern(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Pattern(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Pattern(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Pattern(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Pattern(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for Pattern()
{
  return &type metadata for Pattern;
}

unint64_t sub_189148830()
{
  unint64_t result = qword_18C778FA8;
  if (!qword_18C778FA8)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189154090, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FA8);
  }

  return result;
}

unint64_t sub_189148878()
{
  unint64_t result = qword_18C778FB0;
  if (!qword_18C778FB0)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189153FC8, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FB0);
  }

  return result;
}

unint64_t sub_1891488C0()
{
  unint64_t result = qword_18C778FB8;
  if (!qword_18C778FB8)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189153FF0, &type metadata for PanicPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FB8);
  }

  return result;
}

uint64_t sub_189148904(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65707954677562LL && a2 == 0xE700000000000000LL;
  if (v3 || (sub_189153568() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 1684632949 && a2 == 0xE400000000000000LL || (sub_189153568() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x6974696E69666564LL && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else
  {
    char v6 = sub_189153568();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_189148A40@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C778FC0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5, v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_189148CA4();
  sub_1891535F8();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v24) = 0;
  uint64_t v10 = sub_189153514();
  uint64_t v12 = v11;
  uint64_t v23 = v10;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_189153514();
  uint64_t v15 = v14;
  uint64_t v21 = v13;
  char v27 = 2;
  sub_189148CE8();
  swift_bridgeObjectRetain();
  uint64_t v22 = v15;
  sub_189153520();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v17 = v24;
  uint64_t v16 = v25;
  uint64_t v18 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v22;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v12;
  a2[2] = v21;
  a2[3] = v19;
  a2[4] = v17;
  a2[5] = v16;
  a2[6] = v18;
  return result;
}

unint64_t sub_189148CA4()
{
  unint64_t result = qword_18C778FC8;
  if (!qword_18C778FC8)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_18915426C, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FC8);
  }

  return result;
}

unint64_t sub_189148CE8()
{
  unint64_t result = qword_18C778FD0;
  if (!qword_18C778FD0)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189154244, &type metadata for Definition);
    atomic_store(result, (unint64_t *)&qword_18C778FD0);
  }

  return result;
}

unint64_t sub_189148D2C()
{
  unint64_t result = qword_18C778FE0;
  if (!qword_18C778FE0)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_18915421C, &type metadata for Definition);
    atomic_store(result, (unint64_t *)&qword_18C778FE0);
  }

  return result;
}

uint64_t _s15CoreDiagnostics12PanicPayloadV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t _s15CoreDiagnostics12PanicPayloadV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_189148E4C + 4 * byte_189153F15[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_189148E80 + 4 * byte_189153F10[v4]))();
}

uint64_t sub_189148E80(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189148E88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189148E90LL);
  }
  return result;
}

uint64_t sub_189148E9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189148EA4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_189148EA8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189148EB0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Pattern.CodingKeys()
{
  return &type metadata for Pattern.CodingKeys;
}

uint64_t destroy for Definition()
{
  return swift_bridgeObjectRelease();
}

void *_s15CoreDiagnostics10DefinitionVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Definition(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Definition(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Definition(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Definition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for Definition()
{
  return &type metadata for Definition;
}

unint64_t sub_18914908C()
{
  unint64_t result = qword_18C778FE8;
  if (!qword_18C778FE8)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_1891541F4, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FE8);
  }

  return result;
}

unint64_t sub_1891490D4()
{
  unint64_t result = qword_18C778FF0;
  if (!qword_18C778FF0)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189154164, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FF0);
  }

  return result;
}

unint64_t sub_18914911C()
{
  unint64_t result = qword_18C778FF8;
  if (!qword_18C778FF8)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_18915418C, &type metadata for Pattern.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C778FF8);
  }

  return result;
}

uint64_t sub_189149160(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011LL && a2 == 0x8000000189154930LL || (sub_189153568() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 0x61724663696E6170LL && a2 == 0xEB0000000073656DLL)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else
  {
    char v5 = sub_189153568();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_18914925C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C779000);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3, v5);
  BOOL v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_18914943C();
  sub_1891535F8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }

  else
  {
    v10[31] = 0;
    uint64_t v8 = sub_189153514();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C779010);
    v10[15] = 1;
    sub_189149480(&qword_18C779018, MEMORY[0x189617FD8], MEMORY[0x189618478]);
    swift_bridgeObjectRetain();
    sub_1891534FC();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return v8;
}

unint64_t sub_18914943C()
{
  unint64_t result = qword_18C779008;
  if (!qword_18C779008)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_189154374, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C779008);
  }

  return result;
}

uint64_t sub_189149480(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C779010);
    uint64_t v8 = a2;
    uint64_t result = MEMORY[0x1895E1184](a3, v7, &v8);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for Definition.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for Definition.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_1891495BC + 4 * byte_189153F1F[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891495F0 + 4 * byte_189153F1A[v4]))();
}

uint64_t sub_1891495F0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891495F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189149600LL);
  }
  return result;
}

uint64_t sub_18914960C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189149614LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_189149618(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189149620(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_18914962C(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Definition.CodingKeys()
{
  return &type metadata for Definition.CodingKeys;
}

unint64_t sub_18914964C()
{
  unint64_t result = qword_18C779030;
  if (!qword_18C779030)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_18915434C, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C779030);
  }

  return result;
}

unint64_t sub_189149694()
{
  unint64_t result = qword_18C779038;
  if (!qword_18C779038)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_1891542BC, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C779038);
  }

  return result;
}

unint64_t sub_1891496DC()
{
  unint64_t result = qword_18C779040;
  if (!qword_18C779040)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_1891542E4, &type metadata for Definition.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_18C779040);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for DiagnosticPatternMatchingError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_189149778 + 4 * byte_189154445[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1891497AC + 4 * asc_189154440[v4]))();
}

uint64_t sub_1891497AC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891497B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891497BCLL);
  }
  return result;
}

uint64_t sub_1891497C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891497D0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1891497D4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891497DC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticPatternMatchingError()
{
  return &type metadata for DiagnosticPatternMatchingError;
}

unint64_t sub_1891497FC()
{
  if (*v0) {
    return 0xD000000000000025LL;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t sub_18914983C()
{
  return sub_1891530C4();
}

uint64_t sub_189149850()
{
  return sub_1891530D0();
}

uint64_t sub_189149864()
{
  return sub_1891530B8();
}

unint64_t sub_18914987C()
{
  unint64_t result = qword_18C779048;
  if (!qword_18C779048)
  {
    unint64_t result = MEMORY[0x1895E1184](&unk_1891544F8, &type metadata for DiagnosticPatternMatchingError);
    atomic_store(result, (unint64_t *)&qword_18C779048);
  }

  return result;
}

uint64_t WriteJetsamMemoryReport(visibilityEndowmentSet:audioAssertionSet:)(void *a1, void *a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x189607B38]);
  uint64_t v5 = (void *)sub_189153214();
  id v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 4096);

  id v7 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_18C77BA10);
  objc_msgSend(v6, sel_setRemoteObjectInterface_, v7);

  objc_msgSend(v6, sel_resume);
  uint64_t v8 = swift_allocObject();
  *(_BYTE *)(v8 + 16) = 0;
  uint64_t v20 = sub_189149B98;
  uint64_t v21 = 0LL;
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t aBlock = MEMORY[0x1895F87A8];
  uint64_t v17 = 1107296256LL;
  uint64_t v18 = sub_189149D58;
  uint64_t v19 = &block_descriptor_1;
  uint64_t v10 = _Block_copy(&aBlock);
  id v11 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v10);
  _Block_release(v10);
  sub_18915340C();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF120);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (a1) {
      a1 = (void *)sub_189153328();
    }
    if (a2) {
      a2 = (void *)sub_189153328();
    }
    uint64_t v20 = sub_189149DC0;
    uint64_t v21 = v8;
    uint64_t aBlock = v9;
    uint64_t v17 = 1107296256LL;
    uint64_t v18 = sub_189149DFC;
    uint64_t v19 = &block_descriptor_3;
    uint64_t v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_writeJetsamMemoryReportWithVisibilityEndowmentSet_audioAssertionSet_with_, a1, a2, v12);
    _Block_release(v12);
    swift_unknownObjectRelease();
  }

  objc_msgSend(v6, sel_invalidate);

  swift_beginAccess();
  uint64_t v13 = *(unsigned __int8 *)(v8 + 16);
  swift_release();
  return v13;
}

uint64_t sub_189149B88()
{
  return swift_deallocObject();
}

uint64_t sub_189149B98(void *a1)
{
  uint64_t v2 = sub_1891531D8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2, v4);
  id v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1891531CC();
  MEMORY[0x1895E113C](a1);
  MEMORY[0x1895E113C](a1);
  id v7 = (os_log_s *)sub_1891531B4();
  os_log_type_t v8 = sub_189153370();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    v15[0] = v2;
    uint64_t v10 = (uint8_t *)v9;
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    MEMORY[0x1895E113C](a1);
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v15[1] = v12;
    sub_1891533E8();
    *id v11 = v12;

    _os_log_impl(&dword_189140000, v7, v8, "Error connecting to remote object: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF168);
    swift_arrayDestroy();
    MEMORY[0x1895E1214](v11, -1LL, -1LL);
    uint64_t v13 = v10;
    uint64_t v2 = v15[0];
    MEMORY[0x1895E1214](v13, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_189149D58(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_189149DC0(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_189149DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_189149E3C(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001LL;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (sub_189153430()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x18961AFF8];
    if (v2) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF138);
  uint64_t v3 = sub_189153454();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_189153424();
    sub_18914A7B8();
    sub_18914A7F4();
    uint64_t result = sub_18915334C();
    uint64_t v1 = v22;
    uint64_t v20 = v23;
    uint64_t v5 = v24;
    uint64_t v6 = v25;
    unint64_t v7 = v26;
    goto LABEL_11;
  }

LABEL_7:
  uint64_t v8 = -1LL << *(_BYTE *)(v1 + 32);
  uint64_t v20 = v1 + 56;
  uint64_t v5 = ~v8;
  uint64_t v9 = -v8;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v7 = v10 & *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  uint64_t v6 = 0LL;
LABEL_11:
  int64_t v19 = (unint64_t)(v5 + 64) >> 6;
  if (v1 < 0)
  {
    if (sub_18915343C())
    {
      sub_18914A7B8();
      swift_dynamicCast();
      uint64_t v12 = v21;
LABEL_33:
      id v18 = v12;
      sub_1891535B0();

      swift_release_n();
      sub_18914A83C();
      return 0LL;
    }

    goto LABEL_34;
  }

  if (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7)) | (v6 << 6);
LABEL_32:
    uint64_t v12 = *(void **)(*(void *)(v1 + 48) + 8 * v11);
    id v17 = v12;
    goto LABEL_33;
  }

  int64_t v13 = v6 + 1;
  if (!__OFADD__(v6, 1LL))
  {
    if (v13 < v19)
    {
      unint64_t v14 = *(void *)(v20 + 8 * v13);
      uint64_t v15 = v6 + 1;
      if (v14) {
        goto LABEL_31;
      }
      uint64_t v15 = v6 + 2;
      if (v6 + 2 < v19)
      {
        unint64_t v14 = *(void *)(v20 + 8 * v15);
        if (v14) {
          goto LABEL_31;
        }
        uint64_t v15 = v6 + 3;
        if (v6 + 3 < v19)
        {
          unint64_t v14 = *(void *)(v20 + 8 * v15);
          if (v14) {
            goto LABEL_31;
          }
          uint64_t v15 = v6 + 4;
          if (v6 + 4 < v19)
          {
            unint64_t v14 = *(void *)(v20 + 8 * v15);
            if (v14) {
              goto LABEL_31;
            }
            uint64_t v15 = v6 + 5;
            if (v6 + 5 < v19)
            {
              unint64_t v14 = *(void *)(v20 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 6;
                while (v19 != v16)
                {
                  unint64_t v14 = *(void *)(v20 + 8 * v16++);
                  if (v14)
                  {
                    uint64_t v15 = v16 - 1;
                    goto LABEL_31;
                  }
                }

                goto LABEL_34;
              }

  int64_t v13 = a4(v9, v10, a3);
  swift_bridgeObjectRelease();
  return v13;
}

LABEL_31:
              unint64_t v11 = __clz(__rbit64(v14)) + (v15 << 6);
              goto LABEL_32;
            }
          }
        }
      }
    }

LABEL_34:
    swift_release();
    sub_18914A83C();
    return v3;
  }

  __break(1u);
  return result;
}

          unint64_t v7 = 0LL;
          uint64_t v9 = 1;
          goto LABEL_37;
        }

        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }

      unint64_t v7 = (result - 48);
      id v18 = v3 - 1;
      if (v18)
      {
        int64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          uint64_t v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          unint64_t v7 = v21 + v20;
          uint64_t v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }

  sub_1891534A8();
  __break(1u);
LABEL_35:
  uint64_t result = sub_1891534A8();
  __break(1u);
  return result;
}

id CompatibilityBridge.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CompatibilityBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CompatibilityBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15CoreDiagnostics19CompatibilityBridgeC23WriteJetsamMemoryReport22visibilityEndowmentSet014audioAssertionK0SbShySo8NSNumberCGSg_AJtFZ_0( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1891531D8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1895F8858](v4, v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7, v10);
  uint64_t v12 = (char *)&v31 - v11;
  if (!a1 || (int64_t v13 = (void *)sub_189149E3C(a1)) == 0LL)
  {
    sub_1891531CC();
    swift_bridgeObjectRetain_n();
    unint64_t v14 = (os_log_s *)sub_1891531B4();
    os_log_type_t v15 = sub_189153370();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v31 = v4;
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v34 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v32 = v5;
      if (a1)
      {
        sub_18914A7B8();
        sub_18914A7F4();
        uint64_t v18 = sub_189153340();
        unint64_t v20 = v19;
      }

      else
      {
        uint64_t v18 = 0x7263736564206F4ELL;
        unint64_t v20 = 0xEE006E6F69747069LL;
      }

      uint64_t v33 = sub_18914D398(v18, v20, &v34);
      sub_1891533E8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl( &dword_189140000,  v14,  v15,  "Unable to represent visibility endowments as a set as PIDs: %s",  v16,  0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E1214](v17, -1LL, -1LL);
      MEMORY[0x1895E1214](v16, -1LL, -1LL);

      uint64_t v4 = v31;
      uint64_t v5 = v32;
    }

    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    int64_t v13 = 0LL;
    if (!a2) {
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v21 = (void *)sub_189149E3C(a2);
    if (v21) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }

  if (a2) {
    goto LABEL_12;
  }
LABEL_13:
  sub_1891531CC();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = (os_log_s *)sub_1891531B4();
  os_log_type_t v23 = sub_189153370();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v32 = v5;
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v34 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    if (a2)
    {
      sub_18914A7B8();
      sub_18914A7F4();
      uint64_t v26 = sub_189153340();
      unint64_t v28 = v27;
    }

    else
    {
      uint64_t v26 = 0x7263736564206F4ELL;
      unint64_t v28 = 0xEE006E6F69747069LL;
    }

    uint64_t v33 = sub_18914D398(v26, v28, &v34);
    sub_1891533E8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_189140000, v22, v23, "Unable to represent audio assertions as a set as PIDs: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E1214](v25, -1LL, -1LL);
    MEMORY[0x1895E1214](v24, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v4);
  }

  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }

  uint64_t v21 = 0LL;
LABEL_20:
  char v29 = WriteJetsamMemoryReport(visibilityEndowmentSet:audioAssertionSet:)(v13, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v29 & 1;
}

uint64_t type metadata accessor for CompatibilityBridge()
{
  return objc_opt_self();
}

unint64_t sub_18914A7B8()
{
  unint64_t result = qword_18C4FF128;
  if (!qword_18C4FF128)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C4FF128);
  }

  return result;
}

unint64_t sub_18914A7F4()
{
  unint64_t result = qword_18C4FF130;
  if (!qword_18C4FF130)
  {
    unint64_t v1 = sub_18914A7B8();
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x18961BB10], v1);
    atomic_store(result, (unint64_t *)&qword_18C4FF130);
  }

  return result;
}

uint64_t sub_18914A83C()
{
  return swift_release();
}

uint64_t sub_18914A84C(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  if ((a2 & 0x1000000000000000LL) == 0)
  {
    if ((a2 & 0x2000000000000000LL) == 0)
    {
      if ((result & 0x1000000000000000LL) != 0) {
        uint64_t v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v6 = (unsigned __int8 *)sub_18915349C();
      }
      uint64_t v7 = (uint64_t)sub_18914DDDC(v6, v4, 10LL);
      char v9 = v8 & 1;
      goto LABEL_37;
    }

    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        os_log_type_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          uint64_t v7 = v17 + v16;
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }

    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                uint64_t v7 = v13 - v12;
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }

            goto LABEL_36;
          }

LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }

  uint64_t v7 = sub_18914DA70(result, a2, 10LL, (uint64_t (*)(void *, uint64_t, uint64_t))sub_18914DDDC);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0) {
    return 0LL;
  }
  else {
    return v7;
  }
}

  unint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

unint64_t sub_18914AAA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790E0);
  objc_super v2 = (void *)sub_1891534CC();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_189152660(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_18914ABB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790D8);
  objc_super v2 = (void *)sub_1891534CC();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_189152660(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_18914ACD8(uint64_t result, uint64_t a2)
{
  if (result)
  {
    MEMORY[0x1895F8858](result, a2);
    return sub_189153124();
  }

  return result;
}

uint64_t sub_18914AD44(const char *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, void *a6)
{
  uint64_t v10 = sub_189153250();
  ssize_t v11 = getxattr(a1, (const char *)(v10 + 32), a4, a5, 0, 0);
  uint64_t result = swift_release();
  if (v11 >= 1)
  {
    *a6 = MEMORY[0x1895E0A94](a4);
    a6[1] = v13;
    return swift_bridgeObjectRelease();
  }

  return result;
}

void *sub_18914ADDC()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x18961AFE8];
  *(void *)(v0 + 16) = MEMORY[0x18961AFE8];
  objc_super v2 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  unint64_t v3 = sub_18914ABB8(v1);
  swift_bridgeObjectRelease();
  sub_18914B024(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1891531FC();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_1891503B0;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_18914BBEC;
  aBlock[3] = &block_descriptor_2;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_iterateLogsWithOptions_usingBlock_, v4, v5);
  _Block_release(v5);

  swift_arrayDestroy();
  swift_beginAccess();
  if (*(void *)(*(void *)(v0 + 16) + 16LL))
  {
    uint64_t v7 = *(void **)(v0 + 16);
    swift_bridgeObjectRetain_n();
    sub_18914E5BC(&v7);
    swift_release();
    swift_bridgeObjectRelease();
    return v7;
  }

  else
  {
    swift_release();
    return 0LL;
  }

uint64_t sub_18914B024(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790D0);
    uint64_t v2 = sub_1891534CC();
  }

  else
  {
    uint64_t v2 = MEMORY[0x18961AFF0];
  }

  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }

    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }

LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    __int128 v32 = v28;
    __int128 v33 = v29;
    uint64_t v34 = v30;
    sub_1891504C0(&v31, v35);
    __int128 v28 = v32;
    __int128 v29 = v33;
    uint64_t v30 = v34;
    sub_1891504C0(v35, v36);
    sub_1891504C0(v36, &v32);
    uint64_t result = sub_189153448();
    uint64_t v19 = -1LL << *(_BYTE *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1LL << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0LL;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }

      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }

    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v30;
    uint64_t result = (uint64_t)sub_1891504C0(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }

  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_18914A83C();
    return v2;
  }

  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }

    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_1891532A4();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      unint64_t v11 = a3;
      goto LABEL_33;
    }

    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }

  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_18914B3E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1891531D8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4, v6);
  int64_t v8 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1891530AC();
  swift_allocObject();
  uint64_t v9 = sub_1891530A0();
  uint64_t v69 = 0LL;
  uint64_t v70 = 0LL;
  uint64_t v64 = a1;
  uint64_t v65 = 0x657079745F677562LL;
  unint64_t v66 = 0xE800000000000000LL;
  uint64_t v67 = 128LL;
  unint64_t v68 = &v69;
  uint64_t v71 = 0LL;
  uint64_t v72 = v9;
  sub_18914E514(sub_189150410);
  uint64_t result = swift_release();
  uint64_t v11 = v70;
  if (!v70) {
    return result;
  }
  v58[0] = a2;
  char v60 = v8;
  v58[1] = v5;
  v58[2] = v4;
  uint64_t v12 = v69;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C0);
  uint64_t v14 = *(void *)(*(void *)(v13 - 8) + 64LL);
  MEMORY[0x1895F8858](v13, v15);
  int64_t v16 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_189153190();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 56);
  uint64_t v59 = v17;
  v19(v16, 1LL, 1LL);
  uint64_t v61 = a1;
  uint64_t v63 = v58;
  char v62 = v16;
  if (v12 == 3487795 && v11 == 0xE300000000000000LL
    || ((char v20 = sub_189153568(), v12 == 3617331) ? (v21 = v11 == 0xE300000000000000LL) : (v21 = 0),
        !v21 ? (char v22 = 0) : (char v22 = 1),
        (v20 & 1) != 0 || (v22 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }

  char v23 = sub_189153568();
  uint64_t v24 = swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
LABEL_15:
    uint64_t v26 = sub_1891530F4();
    uint64_t v27 = *(void *)(v26 - 8);
    MEMORY[0x1895F8858](v26, v28);
    uint64_t v30 = (char *)v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C779058);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1891545A0;
    __int128 v32 = (void *)*MEMORY[0x189603B80];
    *(void *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *MEMORY[0x189603B80];
    id v33 = v32;
    sub_18914FCC8(inited);
    swift_setDeallocating();
    type metadata accessor for URLResourceKey(0LL);
    swift_arrayDestroy();
    sub_18915310C();
    uint64_t v34 = swift_bridgeObjectRelease();
    MEMORY[0x1895F8858](v34, v35);
    sub_1891530DC();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v26);
    int64_t v16 = v62;
    sub_1891503D0((uint64_t)v62);
    uint64_t v24 = sub_189150478((uint64_t)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL), (uint64_t)v16);
  }

  uint64_t v36 = *(void *)(v18 + 64);
  uint64_t v37 = MEMORY[0x1895F8858](v24, v25);
  unint64_t v38 = (v36 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  MEMORY[0x1895F8858](v37, v39);
  uint64_t v40 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189150430((uint64_t)v16, (uint64_t)v40);
  uint64_t v41 = v59;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v40, 1LL, v59) == 1)
  {
    sub_1891503D0((uint64_t)v16);
    return sub_1891503D0((uint64_t)v40);
  }

  else
  {
    uint64_t v42 = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))((char *)v58 - v38, v40, v41);
    MEMORY[0x1895F8858](v42, v43);
    sub_189153184();
    sub_18915316C();
    double v45 = v44;
    uint64_t v46 = v41;
    os_log_type_t v47 = *(void (**)(char *, uint64_t))(v18 + 8);
    v47((char *)v58 - v38, v46);
    if (v45 <= 86400.0)
    {
      uint64_t v48 = (unint64_t *)(v58[0] + 16LL);
      uint64_t v49 = sub_189153148();
      uint64_t v50 = *(void *)(v49 - 8);
      MEMORY[0x1895F8858](v49, v51);
      v53 = (char *)v58 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v53, v61, v49);
      swift_beginAccess();
      unint64_t v54 = *v48;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v48 = v54;
      char v60 = v58;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v54 = sub_18914CE54(0, *(void *)(v54 + 16) + 1LL, 1, v54);
        *uint64_t v48 = v54;
      }

      unint64_t v57 = *(void *)(v54 + 16);
      unint64_t v56 = *(void *)(v54 + 24);
      if (v57 >= v56 >> 1)
      {
        unint64_t v54 = sub_18914CE54(v56 > 1, v57 + 1, 1, v54);
        *uint64_t v48 = v54;
      }

      *(void *)(v54 + 16) = v57 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v50 + 32))( v54 + ((*(unsigned __int8 *)(v50 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))
      + *(void *)(v50 + 72) * v57,
        v53,
        v49);
      swift_endAccess();
      v47((char *)v58 - v38, v59);
      return sub_1891503D0((uint64_t)v62);
    }

    else
    {
      v47((char *)v58 - v38, v46);
      return sub_1891503D0((uint64_t)v16);
    }
  }

uint64_t sub_18914BBEC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(char *))(a1 + 32);
  uint64_t v2 = sub_189153148();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2, v4);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189153130();
  swift_retain();
  v1(v6);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_18914BC8C(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = a2;
  uint64_t v2 = sub_1891531D8();
  char v60 = *(uint64_t **)(v2 - 8);
  uint64_t v61 = (uint64_t *)v2;
  MEMORY[0x1895F8858](v2, v3);
  uint64_t v63 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_1891530F4();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1895F8858](v5, v8);
  os_log_type_t v58 = (char *)((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = (char *)((char *)&v53 - v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C779058);
  uint64_t inited = swift_initStackObject();
  __int128 v57 = xmmword_1891545A0;
  *(_OWORD *)(inited + 16) = xmmword_1891545A0;
  uint64_t v11 = (void *)*MEMORY[0x189603B80];
  *(void *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *MEMORY[0x189603B80];
  id v56 = v11;
  sub_18914FCC8(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0LL);
  swift_arrayDestroy();
  uint64_t v12 = v62;
  sub_18915310C();
  if (v12)
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = v63;
    sub_1891531CC();
    MEMORY[0x1895E113C](v12);
    MEMORY[0x1895E113C](v12);
    char v20 = (os_log_s *)sub_1891531B4();
    os_log_type_t v21 = sub_189153370();
    if (os_log_type_enabled(v20, v21))
    {
      char v22 = (uint8_t *)swift_slowAlloc();
      char v23 = (void *)swift_slowAlloc();
      *(_DWORD *)char v22 = 138412290;
      MEMORY[0x1895E113C](v12);
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v64 = v24;
      sub_1891533E8();
      *char v23 = v24;
      uint64_t v19 = v63;

      _os_log_impl(&dword_189140000, v20, v21, "Error retrieving file CreationDate: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF168);
      swift_arrayDestroy();
      MEMORY[0x1895E1214](v23, -1LL, -1LL);
      MEMORY[0x1895E1214](v22, -1LL, -1LL);
    }

    else
    {
    }

    ((void (*)(char *, uint64_t *))v60[1])(v19, v61);
  }

  else
  {
    uint64_t v55 = v6;
    char v62 = v9;
    uint64_t v54 = v5;
    uint64_t v13 = swift_bridgeObjectRelease();
    MEMORY[0x1895F8858](v13, v14);
    uint64_t v15 = (char *)((char *)&v53 - v58);
    uint64_t v16 = swift_initStackObject();
    *(_OWORD *)(v16 + 16) = v57;
    uint64_t v17 = v56;
    *(void *)(v16 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v56;
    id v18 = v17;
    sub_18914FCC8(v16);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_18915310C();
    uint64_t v61 = &v53;
    *(void *)&__int128 v57 = 0LL;
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_189153190();
    char v60 = &v53;
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = *(void *)(v28 + 64);
    MEMORY[0x1895F8858](v27, v30);
    unint64_t v31 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    os_log_type_t v58 = (char *)&v53 - v31;
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C0);
    uint64_t v63 = (char *)&v53;
    uint64_t v33 = *(void *)(*(void *)(v32 - 8) + 64LL);
    MEMORY[0x1895F8858](v32, v34);
    unint64_t v35 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v36 = (char *)&v53 - v35;
    uint64_t v37 = v62;
    sub_1891530DC();
    uint64_t v59 = v28;
    unint64_t v38 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
    if (v38((char *)&v53 - v35, 1LL, v27) == 1)
    {
      uint64_t v39 = *(void (**)(char *, uint64_t))(v55 + 8);
      uint64_t v40 = v54;
      v39(v15, v54);
      v39(v37, v40);
      sub_1891503D0((uint64_t)v36);
    }

    else
    {
      id v56 = *(id *)(v59 + 32);
      uint64_t v41 = ((uint64_t (*)(char *, char *, uint64_t))v56)(v58, (char *)&v53 - v35, v27);
      uint64_t v63 = (char *)&v53;
      uint64_t v43 = MEMORY[0x1895F8858](v41, v42);
      double v44 = (char *)&v53 - v31;
      MEMORY[0x1895F8858](v43, v45);
      uint64_t v46 = (char *)&v53 - v35;
      sub_1891530DC();
      int v47 = v38((char *)&v53 - v35, 1LL, v27);
      uint64_t v48 = v54;
      if (v47 != 1)
      {
        ((void (*)(char *, char *, uint64_t))v56)(v44, (char *)&v53 - v35, v27);
        uint64_t v50 = v58;
        char v25 = sub_189153178();
        uint64_t v51 = *(void (**)(char *, uint64_t))(v59 + 8);
        v51(v44, v27);
        v51(v50, v27);
        uint64_t v52 = *(void (**)(char *, uint64_t))(v55 + 8);
        v52(v15, v48);
        v52(v62, v48);
        return v25 & 1;
      }

      (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v27);
      uint64_t v49 = *(void (**)(char *, uint64_t))(v55 + 8);
      v49(v15, v48);
      v49(v62, v48);
      sub_1891503D0((uint64_t)v46);
    }
  }

  char v25 = 0;
  return v25 & 1;
}

Swift::OpaquePointer_optional __swiftcall ExcResourceReportPaths()()
{
  uint64_t v98 = sub_1891531D8();
  uint64_t v97 = *(void *)(v98 - 8);
  uint64_t v1 = MEMORY[0x1895F8858](v98, v0);
  uint64_t v3 = (char *)v92 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v1, v4);
  uint64_t v6 = (char *)v92 - v5;
  uint64_t v7 = sub_18914ADDC();
  if (!v7)
  {
    sub_1891531CC();
    uint64_t v79 = (os_log_s *)sub_1891531B4();
    os_log_type_t v80 = sub_189153364();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v81 = 0;
      _os_log_impl(&dword_189140000, v79, v80, "No ExcResource reports found", v81, 2u);
      MEMORY[0x1895E1214](v81, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v97 + 8))(v6, v98);
    goto LABEL_57;
  }

  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C779050);
  v92[2] = v92;
  MEMORY[0x1895F8858](v9, v10);
  uint64_t v12 = (char *)v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = v8[2];
  v92[3] = v8;
  if (v13)
  {
    uint64_t v14 = sub_189153148();
    uint64_t v96 = 0LL;
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = (char *)v8 + ((*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    uint64_t v100 = *(void *)(v15 + 72);
    v104 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v92[1] = *MEMORY[0x189611C28];
    uint64_t v17 = (void *)MEMORY[0x18961AFE8];
    *((void *)&v18 + 1) = 2LL;
    __int128 v103 = xmmword_1891545A0;
    v92[0] = MEMORY[0x18961AFC8] + 8LL;
    *(void *)&__int128 v18 = 136446466LL;
    __int128 v95 = v18;
    uint64_t v94 = MEMORY[0x18961AFC0] + 8LL;
    v93 = (void *)MEMORY[0x18961AFE8];
    v99 = v3;
    uint64_t v101 = v15;
    v102 = v12;
    while (1)
    {
      v104(v12, v16, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 1LL, v14);
      uint64_t v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1LL, v14);
      if ((_DWORD)v19 == 1) {
        goto LABEL_44;
      }
      v106 = v16;
      uint64_t v107 = v13;
      v108 = v17;
      v105 = v92;
      uint64_t v21 = *(void *)(v15 + 64);
      MEMORY[0x1895F8858](v19, v20);
      unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      v109 = 0LL;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))((char *)v92 - v22, v12, v14);
      uint64_t v23 = sub_1891530F4();
      v110 = v92;
      uint64_t v24 = v14;
      uint64_t v25 = *(void *)(v23 - 8);
      MEMORY[0x1895F8858](v23, v26);
      uint64_t v28 = (char *)v92 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C779058);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v103;
      uint64_t v30 = (void *)*MEMORY[0x189603C18];
      *(void *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *MEMORY[0x189603C18];
      id v31 = v30;
      sub_18914FCC8(inited);
      swift_setDeallocating();
      type metadata accessor for URLResourceKey(0LL);
      uint64_t v32 = (char *)v92 - v22;
      swift_arrayDestroy();
      uint64_t v33 = v109;
      sub_18915310C();
      if (v33) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t v50 = sub_1891530E8();
      char v52 = v51;
      uint64_t v53 = (char *)(*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v28, v23);
      if ((v52 & 1) != 0)
      {
        uint64_t v14 = v24;
        uint64_t v15 = v101;
        (*(void (**)(char *, uint64_t))(v101 + 8))(v32, v14);
LABEL_14:
        uint64_t v17 = v108;
        goto LABEL_15;
      }

      v109 = (char *)v92 - v22;
      uint64_t v55 = v96 + v50;
      uint64_t v17 = v108;
      if (__OFADD__(v96, v50)) {
        goto LABEL_60;
      }
      if (v55 > 10485760)
      {
        uint64_t v14 = v24;
        uint64_t v15 = v101;
        (*(void (**)(char *, uint64_t))(v101 + 8))(v109, v14);
LABEL_15:
        uint64_t v12 = v102;
        uint64_t v57 = v107;
        goto LABEL_16;
      }

      v110 = (void *)sub_189153238();
      uint64_t v59 = v58;
      sub_1891530AC();
      swift_allocObject();
      sub_1891530A0();
      uint64_t v111 = 0LL;
      unint64_t v112 = 0LL;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        if (sub_18915307C())
        {
          uint64_t v53 = (char *)sub_189153094();
          if (__OFSUB__(0LL, v53)) {
            goto LABEL_62;
          }
        }

        swift_allocObject();
        sub_189153070();
        swift_release();
      }

      uint64_t v53 = (char *)sub_18915307C();
      if (!v53) {
        goto LABEL_63;
      }
      char v60 = v53;
      uint64_t v53 = (char *)sub_189153094();
      if (__OFSUB__(0LL, v53)) {
        goto LABEL_61;
      }
      int64_t v61 = v60 - v53;
      uint64_t v62 = sub_189153088();
      MEMORY[0x1895F8858](v62, v63);
      v92[-6] = v110;
      v92[-5] = v59;
      v92[-4] = v61;
      v92[-3] = 128LL;
      v92[-2] = &v111;
      sub_189153124();
      swift_bridgeObjectRelease();
      swift_release();
      if (!v112 || (uint64_t v64 = sub_18914A84C(v111, v112), (v65 & 1) != 0) || v64)
      {
        uint64_t v73 = sub_18915313C();
        uint64_t v75 = v74;
        uint64_t v14 = v24;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v17 = sub_18914D05C(0LL, v17[2] + 1LL, 1, v17);
        }
        uint64_t v15 = v101;
        unint64_t v77 = v17[2];
        unint64_t v76 = v17[3];
        if (v77 >= v76 >> 1) {
          uint64_t v17 = sub_18914D05C((void *)(v76 > 1), v77 + 1, 1, v17);
        }
        v17[2] = v77 + 1;
        v78 = &v17[2 * v77];
        v78[4] = v73;
        v78[5] = v75;
        uint64_t v96 = v55;
        uint64_t v12 = v102;
        uint64_t v57 = v107;
      }

      else
      {
        uint64_t v66 = sub_18915313C();
        uint64_t v68 = v67;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0) {
          uint64_t v69 = v93;
        }
        else {
          uint64_t v69 = sub_18914D168(0LL, v93[2] + 1LL, 1, v93);
        }
        uint64_t v12 = v102;
        uint64_t v57 = v107;
        unint64_t v71 = v69[2];
        unint64_t v70 = v69[3];
        if (v71 >= v70 >> 1) {
          uint64_t v69 = sub_18914D168((void *)(v70 > 1), v71 + 1, 1, v69);
        }
        v69[2] = v71 + 1;
        v93 = v69;
        uint64_t v72 = &v69[3 * v71];
        v72[4] = v66;
        v72[5] = v68;
        v72[6] = v50;
        uint64_t v14 = v24;
        uint64_t v15 = v101;
      }

      (*(void (**)(char *, uint64_t))(v15 + 8))(v109, v14);
LABEL_16:
      uint64_t v16 = &v106[v100];
      uint64_t v13 = v57 - 1;
      if (!v13) {
        goto LABEL_43;
      }
    }

    swift_bridgeObjectRelease();
    uint64_t v34 = v99;
    uint64_t v35 = sub_1891531CC();
    v110 = v92;
    MEMORY[0x1895F8858](v35, v36);
    uint64_t v37 = (char *)v92 - v22;
    v104((char *)v92 - v22, v32, v24);
    MEMORY[0x1895E113C](v33);
    MEMORY[0x1895E113C](v33);
    unint64_t v38 = (os_log_s *)sub_1891531B4();
    uint64_t v39 = (char *)v92 - v22;
    os_log_type_t v40 = sub_189153370();
    uint64_t v14 = v24;
    if (os_log_type_enabled(v38, v40))
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v42 = (void *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v111 = v43;
      *(_DWORD *)uint64_t v41 = v95;
      v109 = v39;
      uint64_t v44 = sub_18915313C();
      *(void *)(v41 + 4) = sub_18914D398(v44, v45, &v111);
      swift_bridgeObjectRelease();
      uint64_t v15 = v101;
      uint64_t v46 = *(void (**)(char *, uint64_t))(v101 + 8);
      v46(v37, v14);
      *(_WORD *)(v41 + 12) = 2112;
      MEMORY[0x1895E113C](v33);
      uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v41 + 14) = v47;
      *uint64_t v42 = v47;

      _os_log_impl(&dword_189140000, v38, v40, "Cannot retrieve file size for %{public}s: %@", (uint8_t *)v41, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C4FF168);
      swift_arrayDestroy();
      MEMORY[0x1895E1214](v42, -1LL, -1LL);
      swift_arrayDestroy();
      MEMORY[0x1895E1214](v43, -1LL, -1LL);
      uint64_t v48 = v41;
      uint64_t v49 = v99;
      MEMORY[0x1895E1214](v48, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v97 + 8))(v49, v98);
      v46(v109, v14);
    }

    else
    {

      uint64_t v15 = v101;
      id v56 = *(void (**)(char *, uint64_t))(v101 + 8);
      v56((char *)v92 - v22, v14);

      (*(void (**)(char *, uint64_t))(v97 + 8))(v34, v98);
      v56(v39, v14);
    }

    goto LABEL_14;
  }

  uint64_t v96 = 0LL;
  uint64_t v17 = (void *)MEMORY[0x18961AFE8];
  v93 = (void *)MEMORY[0x18961AFE8];
LABEL_43:
  uint64_t v82 = sub_189153148();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56LL))(v12, 1LL, 1LL, v82);
LABEL_44:
  swift_bridgeObjectRelease();
  uint64_t v83 = v96;
  if (v96 >= 10485760 || (v53 = (char *)v93, (uint64_t v84 = v93[2]) == 0))
  {
LABEL_55:
    swift_bridgeObjectRelease();
    if (v17[2])
    {
LABEL_58:
      uint64_t v53 = (char *)v17;
      goto LABEL_64;
    }

    swift_bridgeObjectRelease();
LABEL_57:
    uint64_t v17 = 0LL;
    goto LABEL_58;
  }

  uint64_t v85 = v93 + 6;
  while (1)
  {
    uint64_t v87 = v83 + *v85;
    if (__OFADD__(v83, *v85)) {
      break;
    }
    if (v87 <= 10485760)
    {
      uint64_t v89 = *(v85 - 2);
      uint64_t v88 = *(v85 - 1);
      swift_bridgeObjectRetain_n();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v17 = sub_18914D05C(0LL, v17[2] + 1LL, 1, v17);
      }
      unint64_t v91 = v17[2];
      unint64_t v90 = v17[3];
      if (v91 >= v90 >> 1) {
        uint64_t v17 = sub_18914D05C((void *)(v90 > 1), v91 + 1, 1, v17);
      }
      v17[2] = v91 + 1;
      __int128 v86 = &v17[2 * v91];
      v86[4] = v89;
      v86[5] = v88;
      uint64_t v53 = (char *)swift_bridgeObjectRelease();
      uint64_t v83 = v87;
    }

    v85 += 3;
    if (!--v84) {
      goto LABEL_55;
    }
  }

  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  result.value._rawValue = v53;
  result.is_nil = v54;
  return result;
}

id DiagnosticReportCollectorBridge.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DiagnosticReportCollectorBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DiagnosticReportCollectorBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18914CE54(char a1, int64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_29;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFE8];
    goto LABEL_19;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C8);
  uint64_t v10 = *(void *)(sub_189153148() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000LL ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1891534A8();
    __break(1u);
    return result;
  }

  v13[2] = v8;
  _OWORD v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_189153148() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }

    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_18914FF28(0LL, v8, v18, a4);
  }

  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_18914D05C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790B0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v10 = (void *)MEMORY[0x18961AFE8];
      uint64_t v13 = (void *)(MEMORY[0x18961AFE8] + 32LL);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_18915014C(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

void *sub_18914D168(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C779090);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v10 = (void *)MEMORY[0x18961AFE8];
      uint64_t v12 = (void *)(MEMORY[0x18961AFE8] + 32LL);
    }

    sub_189150040(0LL, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

void *sub_18914D28C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C779088);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v10 = (void *)MEMORY[0x18961AFE8];
      uint64_t v13 = (void *)(MEMORY[0x18961AFE8] + 32LL);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_18915023C(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

uint64_t sub_18914D398(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_18914D468(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_189150350((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_189150350((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_18914D468(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1891533F4();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_18914D620(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = sub_18915349C();
  if (!v8)
  {
    sub_1891534A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1891534D8();
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_18914D620(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_18914D6B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18914D904(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18914D904(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18914D6B4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_18914D828(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_189153460();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1891534A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_189153298();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_1891534D8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1891534A8();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_18914D828(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18914D88C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v10 = sub_1891532D4();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }

  else
  {
    uint64_t v5 = MEMORY[0x1895E0ADC](15LL, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000LL;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }

uint64_t sub_18914D904(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

LABEL_30:
  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

    uint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    id v31 = 16 * v22;
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }

    sub_1891535C8();
    sub_189153280();
    uint64_t result = sub_1891535E0();
    size_t v14 = -1LL << *(_BYTE *)(v7 + 32);
    BOOL v15 = result & ~v14;
    uint64_t v16 = v15 >> 6;
    if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v27 = 0;
      uint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }

        uint64_t v29 = v16 == v28;
        if (v16 == v28) {
          uint64_t v16 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }

      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }

    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
    unint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }

  swift_release();
  char v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  unint64_t v38 = 1LL << *(_BYTE *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    uint8_t *v24 = -1LL << v38;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_40:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unsigned __int8 *sub_18914DA50(unsigned __int8 *a1, uint64_t a2, int64_t a3)
{
  return sub_18914DB60(a1, a2, a3);
}

uint64_t sub_18914DA64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18914DA70(a1, a2, a3, (uint64_t (*)(void *, uint64_t, uint64_t))sub_18914DB60);
}

uint64_t sub_18914DA70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t, uint64_t))
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1891532EC();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000LL) == 0)
  {
    if ((v6 & 0x2000000000000000LL) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    int64_t v9 = &v15;
    goto LABEL_7;
  }

  uint64_t v7 = sub_18914E058();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000LL) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000LL) != 0)
  {
    int64_t v9 = (void *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }

  else
  {
    int64_t v9 = (void *)sub_18915349C();
  }

unsigned __int8 *sub_18914DB60(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }

          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }

          if (result)
          {
            unint64_t v9 = 0LL;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0LL;
                  }
                  char v12 = -87;
                }

                else
                {
                  char v12 = -55;
                }
              }

              else
              {
                char v12 = -48;
              }

              if (!is_mul_ok(v9, a3)) {
                return 0LL;
              }
              unint64_t v13 = v9 * a3;
              unsigned __int8 v14 = v11 + v12;
              BOOL v15 = v13 >= v14;
              unint64_t v9 = v13 - v14;
              if (!v15) {
                return 0LL;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }

          return 0LL;
        }

        return 0LL;
      }

      __break(1u);
      goto LABEL_66;
    }

    if (a2)
    {
      unsigned __int8 v25 = a3 + 48;
      unsigned __int8 v26 = a3 + 55;
      unsigned __int8 v27 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v25 = 58;
      }

      else
      {
        unsigned __int8 v27 = 97;
        unsigned __int8 v26 = 65;
      }

      if (result)
      {
        unint64_t v28 = 0LL;
        do
        {
          unsigned int v29 = *result;
          if (v29 < 0x30 || v29 >= v25)
          {
            if (v29 < 0x41 || v29 >= v26)
            {
              if (v29 < 0x61 || v29 >= v27) {
                return 0LL;
              }
              char v30 = -87;
            }

            else
            {
              char v30 = -55;
            }
          }

          else
          {
            char v30 = -48;
          }

          if (!is_mul_ok(v28, a3)) {
            return 0LL;
          }
          unint64_t v31 = v28 * a3;
          unsigned __int8 v32 = v29 + v30;
          BOOL v15 = __CFADD__(v31, v32);
          unint64_t v28 = v31 + v32;
          if (v15) {
            return 0LL;
          }
          ++result;
          --v3;
        }

        while (v3);
        return (unsigned __int8 *)v28;
      }

      return 0LL;
    }

    return 0LL;
  }

  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }

  uint64_t v16 = a2 - 1;
  if (a2 == 1) {
    return 0LL;
  }
  unsigned __int8 v17 = a3 + 48;
  unsigned __int8 v18 = a3 + 55;
  unsigned __int8 v19 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v17 = 58;
  }

  else
  {
    unsigned __int8 v19 = 97;
    unsigned __int8 v18 = 65;
  }

  if (!result) {
    return 0LL;
  }
  unint64_t v9 = 0LL;
  uint64_t v20 = result + 1;
  do
  {
    unsigned int v21 = *v20;
    if (v21 < 0x30 || v21 >= v17)
    {
      if (v21 < 0x41 || v21 >= v18)
      {
        if (v21 < 0x61 || v21 >= v19) {
          return 0LL;
        }
        char v22 = -87;
      }

      else
      {
        char v22 = -55;
      }
    }

    else
    {
      char v22 = -48;
    }

    if (!is_mul_ok(v9, a3)) {
      return 0LL;
    }
    unint64_t v23 = v9 * a3;
    unsigned __int8 v24 = v21 + v22;
    BOOL v15 = __CFADD__(v23, v24);
    unint64_t v9 = v23 + v24;
    if (v15) {
      return 0LL;
    }
    ++v20;
    --v16;
  }

  while (v16);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_18914DDDC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }

          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }

          if (result)
          {
            uint64_t v9 = 0LL;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0LL;
                  }
                  char v12 = -87;
                }

                else
                {
                  char v12 = -55;
                }
              }

              else
              {
                char v12 = -48;
              }

              uint64_t v13 = v9 * a3;
              uint64_t v9 = v13 - (v11 + v12);
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }

          return 0LL;
        }

        return 0LL;
      }

      __break(1u);
      goto LABEL_65;
    }

    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }

      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }

      if (result)
      {
        uint64_t v25 = 0LL;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0LL;
              }
              char v27 = -87;
            }

            else
            {
              char v27 = -55;
            }
          }

          else
          {
            char v27 = -48;
          }

          uint64_t v28 = v25 * a3;
          uint64_t v25 = v28 + (v26 + v27);
          ++result;
          --v3;
        }

        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }

      return 0LL;
    }

    return 0LL;
  }

  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }

  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0LL;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }

  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }

  if (!result) {
    return 0LL;
  }
  uint64_t v9 = 0LL;
  unsigned __int8 v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0LL;
        }
        char v20 = -87;
      }

      else
      {
        char v20 = -55;
      }
    }

    else
    {
      char v20 = -48;
    }

    uint64_t v21 = v9 * a3;
    uint64_t v9 = v21 + (v19 + v20);
    ++v18;
    --v14;
  }

  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_18914E058()
{
  unint64_t v0 = sub_1891532F8();
  uint64_t v4 = sub_18914E0D4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_18914E0D4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000LL) != 0)
  {
    unint64_t v9 = sub_18914E218(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_18914D828(v9, 0LL);
      unint64_t v12 = sub_18914E304((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }

    else
    {
      unsigned int v11 = (void *)MEMORY[0x18961AFE8];
    }

    uint64_t v13 = MEMORY[0x1895E0AA0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }

  else
  {
    if ((a4 & 0x2000000000000000LL) == 0)
    {
      if ((a3 & 0x1000000000000000LL) != 0) {
LABEL_12:
      }
        JUMPOUT(0x1895E0AA0LL);
LABEL_9:
      sub_18915349C();
      goto LABEL_12;
    }

    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1895E0AA0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }

unint64_t sub_18914E218( unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000LL) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4LL << v8;
  if ((result & 0xC) == 4LL << v8)
  {
    uint64_t result = sub_18914D88C(result, a3, a4);
    unint64_t v7 = result;
  }

  if ((a2 & 0xC) == v9)
  {
    uint64_t result = sub_18914D88C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000LL) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }

  else if ((a4 & 0x1000000000000000LL) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }

  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }

  else if (v10 >= a2 >> 16)
  {
    return sub_1891532BC();
  }

  __break(1u);
  return result;
}

unint64_t sub_18914E304( unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0LL;
    goto LABEL_33;
  }

  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0LL;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }

  uint64_t v11 = 0LL;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000LL) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4LL << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_18914D88C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000LL) != 0)
    {
      uint64_t result = sub_1891532C8();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }

    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000LL) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000LL) == 0) {
          uint64_t result = sub_18915349C();
        }
        char v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000LL) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }

    uint64_t result = sub_18914D88C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000LL) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_29;
    }

uint64_t sub_18914E514(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t result = sub_189153160();
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t result = sub_18915307C();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  uint64_t v6 = result;
  uint64_t result = sub_189153094();
  uint64_t v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v8 = v5 - v4;
  uint64_t v9 = sub_189153088();
  if (v9 >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  return a1(v6 + v7, v6 + v7 + v10);
}

uint64_t sub_18914E5BC(void **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = (void *)sub_18914FCB4(v2);
  }
  uint64_t v3 = v2[2];
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(sub_189153148() - 8) + 80LL);
  v6[0] = (uint64_t)v2 + ((v4 + 32) & ~v4);
  v6[1] = v3;
  uint64_t result = sub_18914E63C(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_18914E63C(uint64_t *a1)
{
  unint64_t v2 = v1;
  v151 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_18915355C();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_18914F214(0LL, v3, 1LL, v151);
    }
    return result;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_161;
  }
  uint64_t v6 = result;
  uint64_t v7 = (char *)MEMORY[0x18961AFE8];
  uint64_t v8 = MEMORY[0x18961AFE8];
  if (v3 > 1)
  {
    uint64_t v9 = v5 >> 1;
    sub_189153148();
    uint64_t v8 = sub_18915331C();
    *(void *)(v8 + 16) = v9;
  }

  uint64_t isUniquelyReferenced_nonNull_native = sub_189153148();
  uint64_t v152 = *(void *)(isUniquelyReferenced_nonNull_native - 8);
  uint64_t v11 = *(unsigned __int8 *)(v152 + 80);
  uint64_t v138 = v8;
  unint64_t v148 = v8 + ((v11 + 32) & ~v11);
  uint64_t v149 = isUniquelyReferenced_nonNull_native;
  if (v3 < 1)
  {
    unint64_t v51 = *((void *)v7 + 2);
    goto LABEL_110;
  }

  uint64_t v135 = v6;
  uint64_t v12 = 0LL;
  do
  {
    v137 = v7;
    if (v12 + 1 >= v3)
    {
      uint64_t v24 = v12 + 1;
      uint64_t v37 = (void *)v152;
    }

    else
    {
      v144 = (uint64_t *)v3;
      v150 = &v134;
      uint64_t v13 = *v151;
      uint64_t v15 = *(void *)(v152 + 64);
      uint64_t v14 = *(void *)(v152 + 72);
      uint64_t v140 = v12 + 1;
      MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native, v13 + v14 * (v12 + 1));
      uint64_t v16 = (char *)&v134 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      unint64_t v18 = *(uint64_t (**)(char *))(v17 + 16);
      uint64_t v19 = v149;
      uint64_t v20 = v18(v16);
      v141 = &v134;
      uint64_t v139 = v13;
      uint64_t v145 = v15;
      uint64_t v146 = v14;
      v136 = (char *)v12;
      MEMORY[0x1895F8858](v20, v13 + v14 * v12);
      v147 = (char *)v18;
      v18(v16);
      LODWORD(v143) = sub_18914BC8C((uint64_t)v16, (uint64_t)v16);
      if (v2)
      {
        v133 = *(void (**)(char *, uint64_t))(v152 + 8);
        v133(v16, v19);
        v133(v16, v19);
        swift_bridgeObjectRelease();
        goto LABEL_128;
      }

      uint64_t v21 = (void *)v152;
      uint64_t v22 = *(void (**)(char *, uint64_t))(v152 + 8);
      v22(v16, v19);
      v142 = (uint64_t (*)(char *, uint64_t))v22;
      uint64_t isUniquelyReferenced_nonNull_native = ((uint64_t (*)(char *, uint64_t))v22)(v16, v19);
      uint64_t v12 = (uint64_t)v136;
      uint64_t v24 = (uint64_t)(v136 + 2);
      if ((uint64_t)(v136 + 2) < (uint64_t)v144)
      {
        v150 = 0LL;
        uint64_t v25 = v139;
        uint64_t v26 = v146 * v140;
        uint64_t v140 = v146 * v24;
        v141 = (uint64_t *)v26;
        while (1)
        {
          uint64_t v27 = v24;
          uint64_t v28 = v145;
          MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native, v25 + v140);
          unsigned int v29 = (char *)&v134 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          uint64_t v30 = v149;
          unint64_t v31 = v147;
          uint64_t v32 = ((uint64_t (*)(char *))v147)(v29);
          MEMORY[0x1895F8858](v32, (char *)v141 + v25);
          ((void (*)(char *))v31)(v29);
          uint64_t v33 = v150;
          int v34 = sub_18914BC8C((uint64_t)v29, (uint64_t)v29);
          v150 = v33;
          if (v33) {
            break;
          }
          int v35 = v34;
          uint64_t v36 = v142;
          v142(v29, v30);
          uint64_t isUniquelyReferenced_nonNull_native = v36(v29, v30);
          if (((v143 ^ v35) & 1) != 0)
          {
            unint64_t v2 = v150;
            uint64_t v37 = (void *)v152;
            uint64_t v24 = v27;
            uint64_t v12 = (uint64_t)v136;
            goto LABEL_21;
          }

          uint64_t v24 = v27 + 1;
          v25 += v146;
          if (v144 == (uint64_t *)(v27 + 1))
          {
            uint64_t v3 = (uint64_t)v144;
            uint64_t v24 = (uint64_t)v144;
            unint64_t v2 = v150;
            uint64_t v37 = (void *)v152;
            uint64_t v12 = (uint64_t)v136;
            goto LABEL_22;
          }
        }

        v132 = (void (*)(char *, uint64_t))v142;
        v142((char *)&v134 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL), v30);
        v132(v29, v30);
        swift_bridgeObjectRelease();
LABEL_128:
        *(void *)(v138 + 16) = 0LL;
        return swift_bridgeObjectRelease();
      }

      uint64_t v37 = v21;
LABEL_21:
      uint64_t v3 = (uint64_t)v144;
LABEL_22:
      uint64_t v7 = v137;
      if ((v143 & 1) != 0)
      {
        if (v24 < v12) {
          goto LABEL_156;
        }
        if (v12 < v24)
        {
          v150 = v2;
          uint64_t v38 = 0LL;
          uint64_t v39 = v146 * (v24 - 1);
          uint64_t v40 = v24 * v146;
          uint64_t v41 = v12 * v146;
          v147 = (char *)v24;
          do
          {
            if (v12 != v24 + v38 - 1)
            {
              uint64_t v43 = v139;
              if (!v139) {
                goto LABEL_160;
              }
              v143 = &v134;
              unint64_t v44 = v139 + v41;
              uint64_t v45 = v139 + v39;
              MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native, v23);
              uint64_t v47 = (char *)&v134 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL);
              v142 = *(uint64_t (**)(char *, uint64_t))(v152 + 32);
              ((void (*)(char *, uint64_t, uint64_t))v142)(v47, v43 + v41, v149);
              if (v41 < v39 || v44 >= v43 + v40)
              {
                uint64_t v42 = v149;
                swift_arrayInitWithTakeFrontToBack();
              }

              else
              {
                uint64_t v42 = v149;
                if (v41 != v39) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }

              uint64_t isUniquelyReferenced_nonNull_native = ((uint64_t (*)(uint64_t, char *, uint64_t))v142)( v45,  v47,  v42);
              uint64_t v7 = v137;
              uint64_t v24 = (uint64_t)v147;
            }

            ++v12;
            --v38;
            v39 -= v146;
            v40 -= v146;
            v41 += v146;
          }

          while (v12 < v24 + v38);
          unint64_t v2 = v150;
          uint64_t v37 = (void *)v152;
          uint64_t v12 = (uint64_t)v136;
          uint64_t v3 = (uint64_t)v144;
        }
      }
    }

    if (v24 >= v3) {
      goto LABEL_45;
    }
    if (__OFSUB__(v24, v12)) {
      goto LABEL_153;
    }
    if (v24 - v12 >= v135)
    {
LABEL_45:
      if (v24 < v12) {
        goto LABEL_151;
      }
      goto LABEL_46;
    }

    if (__OFADD__(v12, v135)) {
      goto LABEL_154;
    }
    if (v12 + v135 >= v3) {
      uint64_t v48 = v3;
    }
    else {
      uint64_t v48 = v12 + v135;
    }
    if (v48 < v12)
    {
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      uint64_t result = sub_1891534A8();
      __break(1u);
      return result;
    }

    if (v24 == v48) {
      goto LABEL_45;
    }
    v150 = v2;
    uint64_t v101 = v37[9];
    v143 = (uint64_t *)v37[8];
    v102 = (uint64_t (*)(void))v37[2];
    uint64_t v139 = v101;
    uint64_t v140 = (uint64_t)v102;
    uint64_t v145 = v24 * v101;
    uint64_t v146 = v101 * (v24 - 1);
    v136 = (char *)v12;
    uint64_t v134 = v48;
    do
    {
      uint64_t v103 = 0LL;
      uint64_t v104 = v149;
      v147 = (char *)v24;
      while (1)
      {
        v144 = &v134;
        uint64_t v106 = *v151;
        v141 = (uint64_t *)(v145 + v103);
        v142 = (uint64_t (*)(char *, uint64_t))v12;
        uint64_t v107 = v143;
        MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native, v145 + v103 + v106);
        unint64_t v108 = ((unint64_t)v107 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        v109 = (char *)&v134 - v108;
        v110 = (void (*)(char *))v140;
        uint64_t v111 = ((uint64_t (*)(char *))v140)((char *)&v134 - v108);
        MEMORY[0x1895F8858](v111, v146 + v103 + v106);
        unint64_t v112 = (char *)&v134 - v108;
        v110((char *)&v134 - v108);
        v113 = v150;
        char v114 = sub_18914BC8C((uint64_t)&v134 - v108, (uint64_t)&v134 - v108);
        v150 = v113;
        if (v113)
        {
          v131 = *(void (**)(char *, uint64_t))(v152 + 8);
          v131((char *)&v134 - v108, v104);
          v131((char *)&v134 - v108, v104);
          swift_bridgeObjectRelease();
          goto LABEL_128;
        }

        char v115 = v114;
        v116 = *(void (**)(char *, uint64_t))(v152 + 8);
        v116(v112, v104);
        uint64_t isUniquelyReferenced_nonNull_native = ((uint64_t (*)(char *, uint64_t))v116)(v109, v104);
        if ((v115 & 1) == 0) {
          break;
        }
        uint64_t v118 = *v151;
        if (!*v151) {
          goto LABEL_158;
        }
        uint64_t v119 = v118 + v145 + v103;
        uint64_t v120 = v118 + v146 + v103;
        MEMORY[0x1895F8858](isUniquelyReferenced_nonNull_native, v117);
        v122 = (char *)&v134 - ((v121 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        v123 = *(void (**)(char *, uint64_t, uint64_t))(v152 + 32);
        uint64_t v104 = v149;
        v123(v122, v119, v149);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t isUniquelyReferenced_nonNull_native = ((uint64_t (*)(uint64_t, char *, uint64_t))v123)(v120, v122, v104);
        v103 -= v139;
        uint64_t v12 = (uint64_t)v142 + 1;
        v105 = v147;
      }

      v105 = v147;
LABEL_103:
      uint64_t v24 = (uint64_t)(v105 + 1);
      v146 += v139;
      v145 += v139;
      uint64_t v12 = (uint64_t)v136;
    }

    while (v24 != v134);
    uint64_t v24 = v134;
    unint64_t v2 = v150;
    uint64_t v7 = v137;
LABEL_46:
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_18914FA9C(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
      uint64_t v7 = (char *)isUniquelyReferenced_nonNull_native;
    }

    unint64_t v50 = *((void *)v7 + 2);
    unint64_t v49 = *((void *)v7 + 3);
    unint64_t v51 = v50 + 1;
    v147 = (char *)v24;
    if (v50 >= v49 >> 1)
    {
      uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_18914FA9C((char *)(v49 > 1), v50 + 1, 1, v7);
      uint64_t v7 = (char *)isUniquelyReferenced_nonNull_native;
    }

    *((void *)v7 + 2) = v51;
    char v52 = v7 + 32;
    uint64_t v53 = &v7[16 * v50 + 32];
    Swift::Bool v54 = v147;
    *(void *)uint64_t v53 = v12;
    *((void *)v53 + 1) = v54;
    if (v50)
    {
      while (2)
      {
        unint64_t v55 = v51 - 1;
        if (v51 >= 4)
        {
          char v60 = &v52[16 * v51];
          uint64_t v61 = *((void *)v60 - 8);
          uint64_t v62 = *((void *)v60 - 7);
          BOOL v66 = __OFSUB__(v62, v61);
          uint64_t v63 = v62 - v61;
          if (v66) {
            goto LABEL_136;
          }
          uint64_t v65 = *((void *)v60 - 6);
          uint64_t v64 = *((void *)v60 - 5);
          BOOL v66 = __OFSUB__(v64, v65);
          uint64_t v58 = v64 - v65;
          char v59 = v66;
          if (v66) {
            goto LABEL_137;
          }
          unint64_t v67 = v51 - 2;
          uint64_t v68 = &v52[16 * v51 - 32];
          uint64_t v70 = *(void *)v68;
          uint64_t v69 = *((void *)v68 + 1);
          BOOL v66 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          if (v66) {
            goto LABEL_139;
          }
          BOOL v66 = __OFADD__(v58, v71);
          uint64_t v72 = v58 + v71;
          if (v66) {
            goto LABEL_142;
          }
          if (v72 >= v63)
          {
            unint64_t v90 = &v52[16 * v55];
            uint64_t v92 = *(void *)v90;
            uint64_t v91 = *((void *)v90 + 1);
            BOOL v66 = __OFSUB__(v91, v92);
            uint64_t v93 = v91 - v92;
            if (v66) {
              goto LABEL_150;
            }
            BOOL v83 = v58 < v93;
          }

          else
          {
LABEL_64:
            if ((v59 & 1) != 0) {
              goto LABEL_138;
            }
            unint64_t v67 = v51 - 2;
            uint64_t v73 = &v52[16 * v51 - 32];
            uint64_t v75 = *(void *)v73;
            uint64_t v74 = *((void *)v73 + 1);
            BOOL v76 = __OFSUB__(v74, v75);
            uint64_t v77 = v74 - v75;
            char v78 = v76;
            if (v76) {
              goto LABEL_141;
            }
            uint64_t v79 = &v52[16 * v55];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v66 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v66) {
              goto LABEL_144;
            }
            if (__OFADD__(v77, v82)) {
              goto LABEL_145;
            }
            if (v77 + v82 < v58) {
              goto LABEL_76;
            }
            BOOL v83 = v58 < v82;
          }

          if (v83) {
            unint64_t v55 = v67;
          }
        }

        else
        {
          if (v51 == 3)
          {
            uint64_t v57 = *((void *)v7 + 4);
            uint64_t v56 = *((void *)v7 + 5);
            BOOL v66 = __OFSUB__(v56, v57);
            uint64_t v58 = v56 - v57;
            char v59 = v66;
            goto LABEL_64;
          }

          uint64_t v84 = *((void *)v7 + 4);
          uint64_t v85 = *((void *)v7 + 5);
          BOOL v66 = __OFSUB__(v85, v84);
          uint64_t v77 = v85 - v84;
          char v78 = v66;
LABEL_76:
          if ((v78 & 1) != 0) {
            goto LABEL_140;
          }
          __int128 v86 = &v52[16 * v55];
          uint64_t v88 = *(void *)v86;
          uint64_t v87 = *((void *)v86 + 1);
          BOOL v66 = __OFSUB__(v87, v88);
          uint64_t v89 = v87 - v88;
          if (v66) {
            goto LABEL_143;
          }
          if (v89 < v77) {
            goto LABEL_93;
          }
        }

        unint64_t v94 = v55 - 1;
        if (v55 - 1 >= v51)
        {
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
          goto LABEL_155;
        }

        if (!*v151) {
          goto LABEL_157;
        }
        __int128 v95 = v7;
        uint64_t v96 = &v52[16 * v94];
        uint64_t v97 = *(void *)v96;
        uint64_t v98 = &v52[16 * v55];
        uint64_t v99 = *((void *)v98 + 1);
        sub_18914F4D0( *v151 + *(void *)(v152 + 72) * *(void *)v96,  *v151 + *(void *)(v152 + 72) * *(void *)v98,  *v151 + *(void *)(v152 + 72) * v99,  v148);
        if (v2)
        {
LABEL_127:
          swift_bridgeObjectRelease();
          goto LABEL_128;
        }

        if (v99 < v97) {
          goto LABEL_133;
        }
        if (v55 > *((void *)v95 + 2)) {
          goto LABEL_134;
        }
        *(void *)uint64_t v96 = v97;
        *(void *)&v52[16 * v94 + 8] = v99;
        unint64_t v100 = *((void *)v95 + 2);
        if (v55 >= v100) {
          goto LABEL_135;
        }
        uint64_t v7 = v95;
        unint64_t v51 = v100 - 1;
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)memmove(&v52[16 * v55], v98 + 16, 16 * (v100 - 1 - v55));
        *((void *)v7 + 2) = v100 - 1;
        if (v100 <= 2) {
          goto LABEL_93;
        }
        continue;
      }
    }

    unint64_t v51 = 1LL;
LABEL_93:
    uint64_t v3 = v151[1];
    uint64_t v12 = (uint64_t)v147;
  }

  while ((uint64_t)v147 < v3);
LABEL_110:
  if (v51 >= 2)
  {
    uint64_t v124 = *v151;
    while (1)
    {
      unint64_t v125 = v51 - 2;
      if (v51 < 2) {
        goto LABEL_146;
      }
      if (!v124) {
        goto LABEL_159;
      }
      uint64_t v126 = *(void *)&v7[16 * v125 + 32];
      uint64_t v127 = *(void *)&v7[16 * v51 + 24];
      sub_18914F4D0( v124 + *(void *)(v152 + 72) * v126,  v124 + *(void *)(v152 + 72) * *(void *)&v7[16 * v51 + 16],  v124 + *(void *)(v152 + 72) * v127,  v148);
      if (v2) {
        goto LABEL_127;
      }
      if (v127 < v126) {
        goto LABEL_147;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_18914FCA0((uint64_t)v7);
      }
      if (v125 >= *((void *)v7 + 2)) {
        goto LABEL_148;
      }
      v128 = &v7[16 * v125 + 32];
      *(void *)v128 = v126;
      *((void *)v128 + 1) = v127;
      unint64_t v129 = *((void *)v7 + 2);
      if (v51 > v129) {
        goto LABEL_149;
      }
      memmove(&v7[16 * v51 + 16], &v7[16 * v51 + 32], 16 * (v129 - v51));
      *((void *)v7 + 2) = v129 - 1;
      unint64_t v51 = v129 - 1;
      uint64_t v130 = v138;
      if (v129 <= 2) {
        goto LABEL_124;
      }
    }
  }

  uint64_t v130 = v138;
LABEL_124:
  swift_bridgeObjectRelease();
  *(void *)(v130 + 16) = 0LL;
  return swift_bridgeObjectRelease();
}

uint64_t sub_18914F214(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = v4;
  uint64_t v47 = a4;
  uint64_t v37 = a2;
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = result;
    uint64_t result = sub_189153148();
    uint64_t v8 = result;
    uint64_t v9 = *(void **)(result - 8);
    uint64_t v11 = v9[8];
    uint64_t v10 = v9[9];
    unint64_t v44 = v9;
    uint64_t v45 = v11;
    uint64_t v12 = (void (*)(char *))v9[2];
    uint64_t v38 = v10;
    uint64_t v39 = v12;
    uint64_t v48 = v10 * (v6 - 1);
    uint64_t v13 = v10 * v6;
    uint64_t v36 = v7;
    while (2)
    {
      uint64_t v14 = 0LL;
      uint64_t v40 = v6;
      uint64_t v41 = v13;
      while (1)
      {
        uint64_t v49 = v5;
        uint64_t v46 = &v35;
        uint64_t v16 = *v47;
        uint64_t v42 = v13 + v14;
        uint64_t v43 = v7;
        uint64_t v17 = v45;
        MEMORY[0x1895F8858](result, v13 + v14 + v16);
        unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0LL;
        uint64_t v19 = (char *)&v35 - v18;
        uint64_t v20 = v39;
        uint64_t v21 = ((uint64_t (*)(char *))v39)((char *)&v35 - v18);
        MEMORY[0x1895F8858](v21, v48 + v14 + v16);
        uint64_t v22 = (char *)&v35 - v18;
        v20((char *)&v35 - v18);
        uint64_t v23 = v49;
        char v24 = sub_18914BC8C((uint64_t)&v35 - v18, (uint64_t)&v35 - v18);
        uint64_t v49 = v23;
        if (v23)
        {
          int v34 = (void (*)(char *, uint64_t))v44[1];
          v34((char *)&v35 - v18, v8);
          return ((uint64_t (*)(char *, uint64_t))v34)((char *)&v35 - v18, v8);
        }

        char v25 = v24;
        uint64_t v26 = (void (*)(char *, uint64_t))v44[1];
        v26(v22, v8);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v19, v8);
        if ((v25 & 1) == 0) {
          break;
        }
        uint64_t v28 = *v47;
        uint64_t v13 = v41;
        if (!*v47)
        {
          __break(1u);
          return result;
        }

        uint64_t v46 = &v35;
        uint64_t v29 = v28 + v41 + v14;
        uint64_t v30 = v28 + v48 + v14;
        MEMORY[0x1895F8858](result, v27);
        uint64_t v32 = (char *)&v35 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v33 = (void (*)(char *, uint64_t, uint64_t))v44[4];
        v33(v32, v29, v8);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v33)(v30, v32, v8);
        v14 -= v38;
        uint64_t v7 = v43 + 1;
        uint64_t v15 = v40;
        uint64_t v5 = v49;
        if (v40 == v43 + 1) {
          goto LABEL_10;
        }
      }

      uint64_t v5 = v49;
      uint64_t v15 = v40;
      uint64_t v13 = v41;
LABEL_10:
      uint64_t v6 = v15 + 1;
      v48 += v38;
      v13 += v38;
      uint64_t v7 = v36;
      if (v6 != v37) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_18914F4D0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = sub_189153148();
  BOOL v66 = *(void **)(v8 - 8);
  uint64_t v10 = v66[9];
  if (!v10)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }

  uint64_t v11 = v8;
  if (a2 - a1 == 0x8000000000000000LL && v10 == -1) {
    goto LABEL_66;
  }
  int64_t v12 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000LL && v10 == -1) {
    goto LABEL_67;
  }
  uint64_t v13 = (uint64_t)(a2 - a1) / v10;
  unint64_t v71 = a1;
  unint64_t v70 = a4;
  uint64_t v14 = v12 / v10;
  if (v13 >= v12 / v10)
  {
    if ((v14 & 0x8000000000000000LL) == 0)
    {
      uint64_t v16 = v14 * v10;
      if (a4 < a2 || a2 + v16 <= a4)
      {
        uint64_t v8 = swift_arrayInitWithTakeFrontToBack();
      }

      else if (a4 != a2)
      {
        uint64_t v8 = swift_arrayInitWithTakeBackToFront();
      }

      unint64_t v35 = a4 + v16;
      unint64_t v69 = a4 + v16;
      unint64_t v71 = a2;
      if (v16 >= 1 && a1 < a2)
      {
        uint64_t v37 = -v10;
        uint64_t v38 = (uint64_t (*)(void))v66[8];
        uint64_t v62 = v66[2];
        uint64_t v63 = v38;
        unint64_t v61 = a4;
        unint64_t v59 = a1;
        while (1)
        {
          unint64_t v39 = a3;
          unint64_t v67 = &v59;
          uint64_t v40 = v63;
          MEMORY[0x1895F8858](v8, v35 + v37);
          unint64_t v41 = ((unint64_t)v40 + 15) & 0xFFFFFFFFFFFFFFF0LL;
          uint64_t v42 = (char *)&v59 - v41;
          unint64_t v43 = a2;
          unint64_t v44 = (void (*)(char *, unint64_t, uint64_t))v62;
          uint64_t v45 = ((uint64_t (*)(char *))v62)((char *)&v59 - v41);
          unint64_t v65 = v43;
          unint64_t v46 = v43 + v37;
          MEMORY[0x1895F8858](v45, v47);
          uint64_t v48 = v11;
          uint64_t v49 = (char *)&v59 - v41;
          v44((char *)&v59 - v41, v46, v48);
          uint64_t v50 = v68;
          char v51 = sub_18914BC8C((uint64_t)&v59 - v41, (uint64_t)&v59 - v41);
          uint64_t v68 = v50;
          if (v50) {
            break;
          }
          char v52 = v51;
          unint64_t v64 = v39 + v37;
          uint64_t v53 = (void (*)(char *, uint64_t))v66[1];
          v53(v49, v48);
          uint64_t v8 = ((uint64_t (*)(char *, uint64_t))v53)(v42, v48);
          uint64_t v11 = v48;
          if ((v52 & 1) != 0)
          {
            a3 = v64;
            if (v39 < v65 || v64 >= v65)
            {
              uint64_t v8 = swift_arrayInitWithTakeFrontToBack();
              unint64_t v54 = v61;
            }

            else
            {
              unint64_t v54 = v61;
              if (v39 != v65) {
                uint64_t v8 = swift_arrayInitWithTakeBackToFront();
              }
            }

            v71 += v37;
          }

          else
          {
            unint64_t v55 = v69;
            v69 += v37;
            a3 = v64;
            unint64_t v46 = v65;
            if (v39 < v55 || v64 >= v55)
            {
              uint64_t v8 = swift_arrayInitWithTakeFrontToBack();
              unint64_t v54 = v61;
            }

            else
            {
              unint64_t v54 = v61;
              if (v39 != v55) {
                uint64_t v8 = swift_arrayInitWithTakeBackToFront();
              }
            }
          }

          unint64_t v35 = v69;
          if (v69 > v54)
          {
            a2 = v46;
            if (v46 > v59) {
              continue;
            }
          }

          goto LABEL_64;
        }

        uint64_t v57 = (void (*)(char *, uint64_t))v66[1];
        v57((char *)&v59 - v41, v48);
        v57((char *)&v59 - v41, v48);
      }

LABEL_64:
      sub_18914FB94(&v71, &v70, (uint64_t *)&v69);
      return 1LL;
    }
  }

  else if ((v13 & 0x8000000000000000LL) == 0)
  {
    uint64_t v15 = v13 * v10;
    if (a4 < a1 || a1 + v15 <= a4)
    {
      uint64_t v8 = swift_arrayInitWithTakeFrontToBack();
    }

    else if (a4 != a1)
    {
      uint64_t v8 = swift_arrayInitWithTakeBackToFront();
    }

    unint64_t v65 = a4 + v15;
    unint64_t v69 = a4 + v15;
    if (v15 >= 1 && a2 < a3)
    {
      unint64_t v18 = v66[8];
      uint64_t v63 = (uint64_t (*)(void))v66[2];
      unint64_t v64 = v18;
      unint64_t v60 = a3;
      uint64_t v62 = v10;
      while (1)
      {
        unint64_t v67 = &v59;
        unint64_t v19 = v64;
        MEMORY[0x1895F8858](v8, v9);
        unint64_t v20 = a2;
        uint64_t v21 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        unint64_t v22 = v20;
        unint64_t v23 = a4;
        char v24 = (void (*)(char *, unint64_t, uint64_t))v63;
        uint64_t v25 = v63(v21);
        MEMORY[0x1895F8858](v25, v26);
        v24(v21, v23, v11);
        uint64_t v27 = v68;
        char v28 = sub_18914BC8C((uint64_t)v21, (uint64_t)v21);
        uint64_t v68 = v27;
        if (v27)
        {
          uint64_t v56 = (void (*)(char *, uint64_t))v66[1];
          v56(v21, v11);
          v56(v21, v11);
          goto LABEL_64;
        }

        char v29 = v28;
        uint64_t v30 = (void (*)(char *, uint64_t))v66[1];
        v30(v21, v11);
        uint64_t v8 = ((uint64_t (*)(char *, uint64_t))v30)(v21, v11);
        unint64_t v31 = v71;
        if ((v29 & 1) != 0)
        {
          unint64_t v9 = v22;
          uint64_t v32 = v62;
          v22 += v62;
          if (v71 < v9 || v71 >= v22)
          {
            uint64_t v8 = swift_arrayInitWithTakeFrontToBack();
            unint64_t v33 = v60;
          }

          else
          {
            unint64_t v33 = v60;
            if (v71 == v9) {
              unint64_t v31 = v9;
            }
            else {
              uint64_t v8 = swift_arrayInitWithTakeBackToFront();
            }
          }

          goto LABEL_37;
        }

        unint64_t v9 = v70;
        uint64_t v32 = v62;
        unint64_t v34 = v70 + v62;
        if (v71 < v70 || v71 >= v34)
        {
          uint64_t v8 = swift_arrayInitWithTakeFrontToBack();
          unint64_t v33 = v60;
        }

        else
        {
          unint64_t v33 = v60;
          if (v71 != v70)
          {
            uint64_t v8 = swift_arrayInitWithTakeBackToFront();
            unint64_t v70 = v34;
            goto LABEL_37;
          }
        }

        unint64_t v70 = v34;
LABEL_37:
        unint64_t v71 = v31 + v32;
        a4 = v70;
        if (v70 < v65)
        {
          a2 = v22;
          if (v22 < v33) {
            continue;
          }
        }

        goto LABEL_64;
      }
    }

    goto LABEL_64;
  }

LABEL_68:
  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

char *sub_18914FA9C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 16 * v8);
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_18914FB94(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_189153148();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72LL);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000LL && v7 == -1) {
    goto LABEL_14;
  }
  if (v8 / v7 < 0)
  {
LABEL_15:
    uint64_t result = sub_1891534D8();
    __break(1u);
    return result;
  }

  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7) {
    return swift_arrayInitWithTakeFrontToBack();
  }
  if (v3 != v4) {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_18914FCA0(uint64_t a1)
{
  return sub_18914FA9C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_18914FCB4(void *a1)
{
  return sub_189152318(0, a1[2], 0, a1);
}

uint64_t sub_18914FCC8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790A8);
    uint64_t v3 = sub_189153454();
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_189153238();
      sub_1891535C8();
      id v7 = v6;
      sub_189153280();
      uint64_t v8 = sub_1891535E0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = sub_189153238();
        uint64_t v17 = v16;
        if (v15 == sub_189153238() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }

        char v20 = sub_189153568();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_189153238();
          uint64_t v24 = v23;
          if (v22 == sub_189153238() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_189153568();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0) {
            goto LABEL_4;
          }
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1LL);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }

  return MEMORY[0x18961AFF8];
}

uint64_t sub_18914FEF4(const char *a1)
{
  return sub_189150330(a1);
}

uint64_t type metadata accessor for DiagnosticReportCollectorBridge()
{
  return objc_opt_self();
}

uint64_t sub_18914FF28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    uint64_t v8 = *(void *)(sub_189153148() - 8);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    uint64_t v12 = v10 * v4;
    unint64_t v13 = a3 + v12;
    unint64_t v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }

  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

uint64_t sub_189150040(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C779098);
      swift_arrayInitWithCopy();
      return v6;
    }
  }

  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

uint64_t sub_18915014C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }

  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

uint64_t sub_18915023C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }

  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

uint64_t sub_189150330(const char *a1)
{
  return sub_18914AD44( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void **)(v1 + 32),  *(void *)(v1 + 40),  *(void **)(v1 + 48));
}

uint64_t sub_189150350(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18915038C()
{
  return swift_deallocObject();
}

uint64_t sub_1891503B0(uint64_t a1)
{
  return sub_18914B3E0(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1891503D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_189150410(uint64_t a1, uint64_t a2)
{
  return sub_18914ACD8(a1, a2);
}

uint64_t sub_189150430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_189150478(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1891504C0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void PanicCriterials.__allocating_init(id:type:path:panicString:)()
{
  id v1 = objc_allocWithZone(v0);
  PanicCriterials.init(id:type:path:panicString:)();
}

void PanicCriterials.init(id:type:path:panicString:)()
{
  uint64_t v1 = sub_1891531D8();
  MEMORY[0x1895F8858](v1, v2);
  uint64_t v3 = &v0[OBJC_IVAR____SwiftPanicCriterials_panicStringDelimiter];
  *(void *)uint64_t v3 = 0xD000000000000010LL;
  *((void *)v3 + 1) = 0x8000000189154D90LL;
  sub_1891520FC();
  uint64_t v4 = v0;
  uint64_t v5 = sub_189153358();
  swift_bridgeObjectRelease();
  unint64_t v6 = (void *)sub_189150C00(v5);
  swift_bridgeObjectRelease();
  unint64_t v7 = v6[2];
  if (v7)
  {
    uint64_t v8 = v6[5];
    uint64_t v9 = &v4[OBJC_IVAR____SwiftPanicCriterials_panicReasonString];
    *(void *)uint64_t v9 = v6[4];
    *((void *)v9 + 1) = v8;
    if (v7 > v6[2])
    {
      __break(1u);
      JUMPOUT(0x189150BE0LL);
    }

    uint64_t v10 = (uint64_t)&v6[2 * v7 + 4];
    uint64_t v11 = *(void *)(v10 - 16);
    unint64_t v12 = *(void *)(v10 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  else
  {
    uint64_t v11 = 0LL;
    unint64_t v13 = &v4[OBJC_IVAR____SwiftPanicCriterials_panicReasonString];
    unint64_t v12 = 0xE000000000000000LL;
    *(void *)unint64_t v13 = 0LL;
    *((void *)v13 + 1) = 0xE000000000000000LL;
  }

  swift_bridgeObjectRelease();
  sub_189152DF4(v11, v12);
  swift_bridgeObjectRelease();
  JUMPOUT(0x189150788LL);
}

uint64_t sub_189150C00(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x18961AFE8];
  if (v1)
  {
    uint64_t v16 = MEMORY[0x18961AFE8];
    sub_18915215C(0, v1, 0);
    uint64_t v2 = v16;
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 3);
      uint64_t v6 = *(v4 - 2);
      uint64_t v7 = *(v4 - 1);
      uint64_t v8 = *v4;
      swift_bridgeObjectRetain();
      uint64_t v9 = MEMORY[0x1895E0A88](v5, v6, v7, v8);
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      unint64_t v13 = *(void *)(v16 + 16);
      unint64_t v12 = *(void *)(v16 + 24);
      if (v13 >= v12 >> 1) {
        sub_18915215C(v12 > 1, v13 + 1, 1);
      }
      *(void *)(v16 + 16) = v13 + 1;
      uint64_t v14 = v16 + 16 * v13;
      *(void *)(v14 + __swift_destroy_boxed_opaque_existential_1(v0 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }

    while (v1);
  }

  return v2;
}

void sub_189150D9C(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  unint64_t v3 = a2[1];
  v14[0] = 58LL;
  v14[1] = 0xE100000000000000LL;
  unint64_t v13 = v14;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)sub_1891519A8(0x7FFFFFFFFFFFFFFFLL, 1, sub_189152F4C, (uint64_t)v12, v2, v3);
  if (v4[2])
  {
    uint64_t v5 = v4[4];
    uint64_t v6 = v4[5];
    uint64_t v7 = v4[6];
    uint64_t v8 = v4[7];
    swift_bridgeObjectRetain();
  }

  else
  {
    uint64_t v5 = MEMORY[0x1895E0BF0](0LL, 0xE000000000000000LL);
    uint64_t v6 = v9;
    uint64_t v7 = v10;
    uint64_t v8 = v11;
  }

  MEMORY[0x1895E0A88](v5, v6, v7, v8);
  swift_bridgeObjectRelease();
  JUMPOUT(0x189150EB0LL);
}

uint64_t sub_189150EB0()
{
  if (v4 == 0x73206C656E72654BLL && v3 == 0xEC0000006564696CLL)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v8 = sub_189153568();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      JUMPOUT(0x189150FB4LL);
    }
  }

  *(void *)(v6 - 72) = v2;
  *(void *)(v6 - 136) = v4;
  if (v5)
  {
    if (v5 > *(void *)(v1 + 16))
    {
      __break(1u);
      JUMPOUT(0x18915132CLL);
    }

    uint64_t v9 = (uint64_t *)(v1 + 32 * v5);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    uint64_t v13 = v9[2];
    uint64_t v12 = v9[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }

  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x1895E0BF0](0LL, 0xE000000000000000LL);
    uint64_t v11 = v14;
    uint64_t v13 = v15;
    uint64_t v12 = v16;
  }

  uint64_t v17 = MEMORY[0x1895E0A88](v10, v11, v13, v12);
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  *(void *)(v6 - 96) = v17;
  *(void *)(v6 - 88) = v19;
  uint64_t v20 = sub_189153064();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1895F8858](v20, v22);
  uint64_t v24 = (char *)&v30 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_189153058();
  sub_189152FB8();
  uint64_t v25 = sub_189153400();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v6 - 96) = *v0;
  *unint64_t v0 = 0x8000000000000000LL;
  sub_189152AC8(v25, v27, *(void *)(v6 - 136), v3, isUniquelyReferenced_nonNull_native);
  *unint64_t v0 = *(void *)(v6 - 96);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void PanicCriterials.__allocating_init(id:type:path:)()
{
}

void PanicCriterials.init(id:type:path:)()
{
}

uint64_t sub_1891513F0()
{
  return swift_bridgeObjectRelease();
}

id PanicCriterials.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PanicCriterials();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18915150C( uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x18961AFE8];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15LL;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000LL) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000LL) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7LL;
    if (((a6 >> 60) & ((a5 & 0x800000000000000LL) == 0)) != 0) {
      uint64_t v30 = 11LL;
    }
    sub_189151E44(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }

  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  uint64_t v13 = (void *)MEMORY[0x18961AFE8];
  unint64_t v14 = 15LL;
  unint64_t v15 = 15LL;
  unint64_t v16 = 15LL;
  while (1)
  {
    v50[0] = sub_1891532E0();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }

    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0) {
      break;
    }
    unint64_t v14 = sub_18915328C();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }

  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_18915328C();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }

  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_1891532F8();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v13 = sub_18914D28C(0LL, v13[2] + 1LL, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    uint64_t v13 = sub_18914D28C((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  v13[2] = v27 + 1;
  uint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_18915328C();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }

  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }

  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_1891532F8();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_18914D28C(0LL, v13[2] + 1LL, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      uint64_t v13 = sub_18914D28C((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    v13[2] = v39 + 1;
    uint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }

LABEL_41:
  sub_1891534A8();
  __break(1u);
LABEL_42:
  uint64_t result = sub_1891534A8();
  __break(1u);
  return result;
}

uint64_t sub_1891519A8( uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  v47[3] = a4;
  if (a1 < 0) {
    goto LABEL_35;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x18961AFE8];
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = a5;
  if (!a1 || (unint64_t v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_189151F9C(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }

  uint64_t v35 = a1;
  uint64_t v36 = v10;
  uint64_t v43 = (void *)MEMORY[0x18961AFE8];
  unint64_t v12 = a5;
  unint64_t v13 = a5;
  unint64_t v40 = a5;
  while (1)
  {
    v47[0] = sub_1891533B8();
    v47[1] = v14;
    char v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }

    char v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v12 = sub_1891533AC();
LABEL_9:
    if (v45 == v12 >> 14) {
      goto LABEL_24;
    }
  }

  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v12 = sub_1891533AC();
    *(void *)(v44 + 16) = v12;
    unint64_t v13 = v12;
    unint64_t v40 = v12;
    goto LABEL_9;
  }

  if (v12 >> 14 < v13 >> 14) {
    goto LABEL_34;
  }
  uint64_t v17 = sub_1891533D0();
  uint64_t v39 = v18;
  uint64_t v41 = v17;
  uint64_t v37 = v20;
  uint64_t v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v43 = sub_18914D28C(0LL, v43[2] + 1LL, 1, v43);
  }
  unint64_t v22 = v43[2];
  unint64_t v21 = v43[3];
  if (v22 >= v21 >> 1) {
    uint64_t v43 = sub_18914D28C((void *)(v21 > 1), v22 + 1, 1, v43);
  }
  v43[2] = v22 + 1;
  uint64_t v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(void *)(v36 + 16) = v43;
  uint64_t v24 = sub_1891533AC();
  unint64_t v12 = v24;
  *(void *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    unint64_t v13 = v24;
    unint64_t v40 = v24;
    goto LABEL_9;
  }

  unint64_t v40 = v24;
  unint64_t v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }

  if (v45 >= v40 >> 14)
  {
    uint64_t v25 = sub_1891533D0();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a6 = (unint64_t)sub_18914D28C(0LL, v43[2] + 1LL, 1, v43);
    }
    unint64_t v33 = *(void *)(a6 + 16);
    unint64_t v32 = *(void *)(a6 + 24);
    if (v33 >= v32 >> 1) {
      a6 = (unint64_t)sub_18914D28C((void *)(v32 > 1), v33 + 1, 1, (void *)a6);
    }
    *(void *)(a6 + 16) = v33 + 1;
    uint64_t v34 = (void *)(a6 + 32 * v33);
    v34[4] = v25;
    v34[5] = v27;
    v34[6] = v29;
    v34[7] = v31;
    *(void *)(v36 + 16) = a6;
    goto LABEL_33;
  }

uint64_t sub_189151E44(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_1891532F8();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_18914D28C(0LL, v14[2] + 1LL, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_18914D28C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    void v14[2] = v17 + 1;
    uint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }

  uint64_t result = sub_1891534A8();
  __break(1u);
  return result;
}

uint64_t sub_189151F9C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_1891533D0();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_18914D28C(0LL, v14[2] + 1LL, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_18914D28C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    void v14[2] = v17 + 1;
    uint64_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }

  uint64_t result = sub_1891534A8();
  __break(1u);
  return result;
}

unint64_t sub_1891520FC()
{
  unint64_t result = qword_18C7790F0;
  if (!qword_18C7790F0)
  {
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x189617FE0], MEMORY[0x189617FA8]);
    atomic_store(result, (unint64_t *)&qword_18C7790F0);
  }

  return result;
}

uint64_t sub_189152140(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_189152178(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_18915215C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1891524F8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_189152178(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C779148);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }

  else
  {
    uint64_t v10 = (void *)MEMORY[0x18961AFE8];
  }

  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_28;
  }

  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C778F78);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }

uint64_t sub_189152318(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x18961AFE8];
    goto LABEL_19;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790C8);
  uint64_t v10 = *(void *)(sub_189153148() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v14 - v12 == 0x8000000000000000LL && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  _OWORD v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_189153148() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }

    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }

uint64_t sub_1891524F8(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790B0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

LABEL_32:
  uint64_t result = sub_1891534D8();
  __break(1u);
  return result;
}

unint64_t sub_189152660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1891535E0();
  return sub_1891526C4(a1, a2, v4);
}

unint64_t sub_1891526C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_189153568() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_189153568() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_1891527A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790D8);
  char v42 = a2;
  uint64_t v6 = sub_1891534C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }

    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }

    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }

        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1LL)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }

        int64_t v13 = v26;
      }
    }

uint64_t sub_189152AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_189152660(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_189152C3C();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      unint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }

LABEL_11:
    v20[(v14 >> 6) + 8] |= 1LL << v14;
    unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
    *unint64_t v25 = a3;
    v25[1] = a4;
    int64_t v26 = (void *)(v20[7] + 16 * v14);
    *int64_t v26 = a1;
    v26[1] = a2;
    uint64_t v27 = v20[2];
    BOOL v28 = __OFADD__(v27, 1LL);
    uint64_t v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }

    goto LABEL_14;
  }

  sub_1891527A4(v17, a5 & 1);
  unint64_t v23 = sub_189152660(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    unint64_t v14 = v23;
    uint64_t v20 = (void *)*v6;
    if ((v18 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  uint64_t result = sub_189153574();
  __break(1u);
  return result;
}

void *sub_189152C3C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7790D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1891534B4();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }

  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_189152DF4(uint64_t a1, unint64_t a2)
{
  *(void *)&__int128 v9 = 10LL;
  *((void *)&v9 + 1) = 0xE100000000000000LL;
  v8[2] = &v9;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_18915150C(0x7FFFFFFFFFFFFFFFLL, 1, sub_189152F4C, (uint64_t)v8, a1, a2);
  uint64_t v12 = MEMORY[0x18961AFF0];
  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = *(void *)(v4 + 48);
    uint64_t v6 = *(void *)(v4 + 56);
    __int128 v9 = *(_OWORD *)(v4 + 32);
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    swift_bridgeObjectRetain();
    sub_189150D9C((uint64_t)&v12, (unint64_t *)&v9);
  }

  swift_bridgeObjectRelease();
  return MEMORY[0x18961AFF0];
}

uint64_t type metadata accessor for PanicCriterials()
{
  return objc_opt_self();
}

uint64_t method lookup function for PanicCriterials()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PanicCriterials.__allocating_init(id:type:path:panicString:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_189152F4C(void *a1)
{
  return sub_189152F64(a1) & 1;
}

uint64_t sub_189152F64(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1LL;
  }
  else {
    return sub_189153568() & 1;
  }
}

unint64_t sub_189152FB8()
{
  unint64_t result = qword_18C779140;
  if (!qword_18C779140)
  {
    unint64_t result = MEMORY[0x1895E1184](MEMORY[0x189617FF0], MEMORY[0x189617FA8]);
    atomic_store(result, (unint64_t *)&qword_18C779140);
  }

  return result;
}

uint64_t sub_189152FFC()
{
  return swift_deallocObject();
}

uint64_t sub_189153020()
{
  return swift_deallocObject();
}

uint64_t sub_189153034()
{
  return MEMORY[0x189606008]();
}

uint64_t sub_189153040()
{
  return MEMORY[0x189606020]();
}

uint64_t sub_18915304C()
{
  return MEMORY[0x189606030]();
}

uint64_t sub_189153058()
{
  return MEMORY[0x189606108]();
}

uint64_t sub_189153064()
{
  return MEMORY[0x189606120]();
}

uint64_t sub_189153070()
{
  return MEMORY[0x1896061E8]();
}

uint64_t sub_18915307C()
{
  return MEMORY[0x189606210]();
}

uint64_t sub_189153088()
{
  return MEMORY[0x189606228]();
}

uint64_t sub_189153094()
{
  return MEMORY[0x189606238]();
}

uint64_t sub_1891530A0()
{
  return MEMORY[0x189606250]();
}

uint64_t sub_1891530AC()
{
  return MEMORY[0x189606258]();
}

uint64_t sub_1891530B8()
{
  return MEMORY[0x189606298]();
}

uint64_t sub_1891530C4()
{
  return MEMORY[0x1896062A8]();
}

uint64_t sub_1891530D0()
{
  return MEMORY[0x1896062B8]();
}

uint64_t sub_1891530DC()
{
  return MEMORY[0x189606368]();
}

uint64_t sub_1891530E8()
{
  return MEMORY[0x189606378]();
}

uint64_t sub_1891530F4()
{
  return MEMORY[0x189606388]();
}

uint64_t sub_189153100()
{
  return MEMORY[0x1896069B0]();
}

uint64_t sub_18915310C()
{
  return MEMORY[0x1896069C0]();
}

uint64_t sub_189153118()
{
  return MEMORY[0x1896069D0]();
}

uint64_t sub_189153124()
{
  return MEMORY[0x189606A28]();
}

uint64_t sub_189153130()
{
  return MEMORY[0x189606A40]();
}

uint64_t sub_18915313C()
{
  return MEMORY[0x189606A58]();
}

uint64_t sub_189153148()
{
  return MEMORY[0x189606A98]();
}

uint64_t sub_189153154()
{
  return MEMORY[0x189606B10]();
}

uint64_t sub_189153160()
{
  return MEMORY[0x189606B58]();
}

uint64_t sub_18915316C()
{
  return MEMORY[0x189606DF0]();
}

uint64_t sub_189153178()
{
  return MEMORY[0x189606E08]();
}

uint64_t sub_189153184()
{
  return MEMORY[0x189606E48]();
}

uint64_t sub_189153190()
{
  return MEMORY[0x189606E58]();
}

uint64_t sub_18915319C()
{
  return MEMORY[0x18961CE40]();
}

uint64_t sub_1891531A8()
{
  return MEMORY[0x18961CEB8]();
}

uint64_t sub_1891531B4()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_1891531C0()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_1891531CC()
{
  return MEMORY[0x18961D1E8]();
}

uint64_t sub_1891531D8()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_1891531E4()
{
  return MEMORY[0x18961B6F0]();
}

uint64_t sub_1891531F0()
{
  return MEMORY[0x18961B710]();
}

uint64_t sub_1891531FC()
{
  return MEMORY[0x189607058]();
}

uint64_t sub_189153208()
{
  return MEMORY[0x18961D020]();
}

uint64_t sub_189153214()
{
  return MEMORY[0x1896070D0]();
}

uint64_t sub_189153220()
{
  return MEMORY[0x1896070E0]();
}

uint64_t sub_18915322C()
{
  return MEMORY[0x1896070F0]();
}

uint64_t sub_189153238()
{
  return MEMORY[0x189607108]();
}

uint64_t sub_189153244()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_189153250()
{
  return MEMORY[0x189617CB0]();
}

uint64_t sub_18915325C()
{
  return MEMORY[0x189617CE0]();
}

uint64_t sub_189153268()
{
  return MEMORY[0x189617CF8]();
}

uint64_t sub_189153274()
{
  return MEMORY[0x189617D80]();
}

uint64_t sub_189153280()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_18915328C()
{
  return MEMORY[0x189617E28]();
}

uint64_t sub_189153298()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1891532A4()
{
  return MEMORY[0x189617EB8]();
}

uint64_t sub_1891532B0()
{
  return MEMORY[0x189617ED0]();
}

uint64_t sub_1891532BC()
{
  return MEMORY[0x189617ED8]();
}

uint64_t sub_1891532C8()
{
  return MEMORY[0x189617EE0]();
}

uint64_t sub_1891532D4()
{
  return MEMORY[0x189617F48]();
}

uint64_t sub_1891532E0()
{
  return MEMORY[0x189618040]();
}

uint64_t sub_1891532EC()
{
  return MEMORY[0x189618070]();
}

uint64_t sub_1891532F8()
{
  return MEMORY[0x189618078]();
}

uint64_t sub_189153304()
{
  return MEMORY[0x1896071C8]();
}

uint64_t sub_189153310()
{
  return MEMORY[0x189618318]();
}

uint64_t sub_18915331C()
{
  return MEMORY[0x189618390]();
}

uint64_t sub_189153328()
{
  return MEMORY[0x189607230]();
}

uint64_t sub_189153334()
{
  return MEMORY[0x189607240]();
}

uint64_t sub_189153340()
{
  return MEMORY[0x189618660]();
}

uint64_t sub_18915334C()
{
  return MEMORY[0x1896186A8]();
}

uint64_t sub_189153358()
{
  return MEMORY[0x18961D078]();
}

uint64_t sub_189153364()
{
  return MEMORY[0x18961D220]();
}

uint64_t sub_189153370()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_18915337C()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_189153388()
{
  return MEMORY[0x18961B8A0]();
}

uint64_t sub_189153394()
{
  return MEMORY[0x18961B918]();
}

uint64_t sub_1891533A0()
{
  return MEMORY[0x18961B960]();
}

uint64_t sub_1891533AC()
{
  return MEMORY[0x189618BD0]();
}

uint64_t sub_1891533B8()
{
  return MEMORY[0x189618C90]();
}

uint64_t sub_1891533C4()
{
  return MEMORY[0x189618C98]();
}

uint64_t sub_1891533D0()
{
  return MEMORY[0x189618CA0]();
}

uint64_t sub_1891533DC()
{
  return MEMORY[0x189607310]();
}

uint64_t sub_1891533E8()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_1891533F4()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_189153400()
{
  return MEMORY[0x189607330]();
}

uint64_t sub_18915340C()
{
  return MEMORY[0x189618EE0]();
}

uint64_t sub_189153418()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_189153424()
{
  return MEMORY[0x189619058]();
}

uint64_t sub_189153430()
{
  return MEMORY[0x189619078]();
}

uint64_t sub_18915343C()
{
  return MEMORY[0x189619098]();
}

uint64_t sub_189153448()
{
  return MEMORY[0x1896190C8]();
}

uint64_t sub_189153454()
{
  return MEMORY[0x1896191A0]();
}

uint64_t sub_189153460()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_18915346C()
{
  return MEMORY[0x189619380]();
}

uint64_t sub_189153478()
{
  return MEMORY[0x189619388]();
}

uint64_t sub_189153484()
{
  return MEMORY[0x189619390]();
}

uint64_t sub_189153490()
{
  return MEMORY[0x1896193A0]();
}

uint64_t sub_18915349C()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1891534A8()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_1891534B4()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_1891534C0()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_1891534CC()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1891534D8()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1891534E4()
{
  return MEMORY[0x189619A08]();
}

uint64_t sub_1891534F0()
{
  return MEMORY[0x189619A40]();
}

uint64_t sub_1891534FC()
{
  return MEMORY[0x189619AB0]();
}

uint64_t sub_189153508()
{
  return MEMORY[0x189619AE8]();
}

uint64_t sub_189153514()
{
  return MEMORY[0x189619AF8]();
}

uint64_t sub_189153520()
{
  return MEMORY[0x189619B28]();
}

uint64_t sub_18915352C()
{
  return MEMORY[0x189619BD8]();
}

uint64_t sub_189153538()
{
  return MEMORY[0x189619BE0]();
}

uint64_t sub_189153544()
{
  return MEMORY[0x189619BF0]();
}

uint64_t sub_189153550()
{
  return MEMORY[0x189619C20]();
}

uint64_t sub_18915355C()
{
  return MEMORY[0x189619CA8]();
}

uint64_t sub_189153568()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_189153574()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_189153580()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_18915358C()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_189153598()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1891535A4()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1891535B0()
{
  return MEMORY[0x1896073E0]();
}

uint64_t sub_1891535BC()
{
  return MEMORY[0x18961A670]();
}

uint64_t sub_1891535C8()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1891535D4()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_1891535E0()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_1891535EC()
{
  return MEMORY[0x189607430]();
}

uint64_t sub_1891535F8()
{
  return MEMORY[0x18961A950]();
}

uint64_t sub_189153604()
{
  return MEMORY[0x18961A978]();
}

uint64_t sub_189153610()
{
  return MEMORY[0x18961AF48]();
}

uint64_t sub_18915361C()
{
  return MEMORY[0x18961AF60]();
}

uint64_t sub_189153628()
{
  return MEMORY[0x18961AF68]();
}

uint64_t sub_189153634()
{
  return MEMORY[0x18961AF88]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x18960DAA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB700](path, name, value, size, *(void *)&position, *(void *)&options);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x18961B168]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x18961B188]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x18961B368]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x18961B408]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

uint64_t objc_msgSend_WriteJetsamMemoryReportWithVisibilityEndowmentSet_audioAssertionSet_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_WriteJetsamMemoryReportWithVisibilityEndowmentSet_audioAssertionSet_);
}