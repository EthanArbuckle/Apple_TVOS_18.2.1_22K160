uint64_t variable initialization expression of Diagnostics.logger()
{
  return Logger.init(subsystem:category:)( 0xD000000000000036LL,  0x800000010000A7C0LL,  0x6C6172656E6547LL,  0xE700000000000000LL);
}

void type metadata accessor for BPSCompletionState()
{
  if (!qword_1000101F0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_10000C698);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000101F0);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ElementHierarchyAttachment(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ElementHierarchyAttachment(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for ElementHierarchyAttachment(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for ElementHierarchyAttachment(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ElementHierarchyAttachment(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementHierarchyAttachment(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ElementHierarchyAttachment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ElementHierarchyAttachment()
{
  return &type metadata for ElementHierarchyAttachment;
}

_BYTE *initializeBufferWithCopyOfBuffer for UIAttachmentError(_BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UIAttachmentError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for UIAttachmentError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_100003CD0 + 4 * byte_10000AD95[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100003D04 + 4 * byte_10000AD90[v4]))();
}

uint64_t sub_100003D04(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003D0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100003D14LL);
  }
  return result;
}

uint64_t sub_100003D20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100003D28LL);
  }
  *(_BYTE *)__n128 result = a2 + 4;
  return result;
}

uint64_t sub_100003D2C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003D34(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003D40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100003D4C(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UIAttachmentError()
{
  return &type metadata for UIAttachmentError;
}

unint64_t sub_100003D68()
{
  unint64_t result = qword_1000101F8;
  if (!qword_1000101F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AE14, &type metadata for UIAttachmentError);
    atomic_store(result, (unint64_t *)&qword_1000101F8);
  }

  return result;
}

BOOL sub_100003DA4(char a1, char a2)
{
  return a1 == a2;
}

void sub_100003DB4(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_100003DD8(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_100003E1C(char *a1, char *a2)
{
  return sub_100003DA4(*a1, *a2);
}

Swift::Int sub_100003E28()
{
  return sub_100003DD8(*v0);
}

void sub_100003E30(uint64_t a1)
{
}

Swift::Int sub_100003E38(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100003E8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ContextRetrieval(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = ContextRetrieval.init()();
  ContextRetrieval.dumpUIContextFromCache()();
  swift_release(v3);
  uint64_t v4 = type metadata accessor for UIContextCacheRepresentation(0LL);
  return sub_10000444C(a1, 0LL, 1LL, v4);
}

uint64_t sub_100003F14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v5);
  sub_100004468();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for JSONEncoder.OutputFormatting(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_100004468();
  uint64_t v13 = v12 - v11;
  uint64_t v14 = sub_1000041D4(&qword_100010200);
  __chkstk_darwin(v14);
  sub_100004468();
  uint64_t v17 = v16 - v15;
  swift_bridgeObjectRetain(a2);
  sub_100003E8C(v17);
  swift_bridgeObjectRelease(a2);
  uint64_t v18 = type metadata accessor for UIContextCacheRepresentation(0LL);
  uint64_t v36 = v8;
  if (sub_100004214(v17, 1LL, v18) == 1)
  {
    sub_100004220(v17);
    uint64_t v19 = 0LL;
  }

  else
  {
    uint64_t v19 = UIContextCacheRepresentation.elements.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8LL))(v17, v18);
  }

  uint64_t v20 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  uint64_t v21 = JSONEncoder.init()();
  uint64_t v22 = sub_1000041D4(&qword_100010208);
  uint64_t v23 = swift_allocObject( v22,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + 2LL * *(void *)(v10 + 72),
          *(unsigned __int8 *)(v10 + 80) | 7LL);
  *(_OWORD *)(v23 + 16) = xmmword_10000AE80;
  uint64_t v24 = static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  static JSONEncoder.OutputFormatting.sortedKeys.getter(v24);
  uint64_t v37 = v23;
  uint64_t v25 = sub_1000043C8( &qword_100010210,  (uint64_t (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting,  (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
  uint64_t v26 = sub_1000041D4(&qword_100010218);
  unint64_t v27 = sub_100004260();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v37, v26, v27, v9, v25);
  dispatch thunk of JSONEncoder.outputFormatting.setter(v13);
  uint64_t v37 = v19;
  uint64_t v28 = sub_1000041D4(&qword_100010228);
  unint64_t v29 = sub_1000042E8();
  uint64_t v30 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v37, v28, v29);
  if (v2)
  {
    swift_release(v21);
    swift_bridgeObjectRelease(v19);
  }

  else
  {
    uint64_t v32 = v30;
    unint64_t v33 = v31;
    uint64_t v34 = swift_bridgeObjectRelease(v19);
    static String.Encoding.utf8.getter(v34);
    uint64_t v3 = String.init(data:encoding:)(v32, v33, v36);
    sub_100004408(v32, v33);
    swift_release(v21);
  }

  return v3;
}

uint64_t sub_1000041D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100004214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100004220(uint64_t a1)
{
  uint64_t v2 = sub_1000041D4(&qword_100010200);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100004260()
{
  unint64_t result = qword_100010220;
  if (!qword_100010220)
  {
    uint64_t v1 = sub_1000042A4(&qword_100010218);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010220);
  }

  return result;
}

uint64_t sub_1000042A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1000042E8()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    uint64_t v1 = sub_1000042A4(&qword_100010228);
    sub_10000434C();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100010230);
  }

  return result;
}

unint64_t sub_10000434C()
{
  unint64_t result = qword_100010238;
  if (!qword_100010238)
  {
    uint64_t v1 = sub_1000042A4(&qword_100010240);
    sub_1000043C8( &qword_100010248,  (uint64_t (*)(uint64_t))&type metadata accessor for UIContextElement,  (uint64_t)&protocol conformance descriptor for UIContextElement);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010238);
  }

  return result;
}

uint64_t sub_1000043C8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100004408(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000444C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

ValueMetadata *type metadata accessor for UIElementsAttachment()
{
  return &type metadata for UIElementsAttachment;
}

  ;
}

uint64_t sub_100004478(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_1000044B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_1000044E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000452C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100004570(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000045B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000045F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004604);
}

uint64_t sub_100004604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007000();
  return sub_100004214(a1, a2, v4);
}

uint64_t sub_100004634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004640);
}

uint64_t sub_100004640(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007000();
  return sub_10000444C(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TranscriptAttachment(uint64_t a1)
{
  uint64_t result = qword_1000102A8;
  if (!qword_1000102A8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TranscriptAttachment);
  }
  return result;
}

uint64_t sub_1000046AC(uint64_t a1)
{
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_100004714(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  sub_100004468();
  uint64_t v8 = v7 - v6;
  static String.Encoding.utf8.getter();
  uint64_t v9 = String.data(using:allowLossyConversion:)(v8, 0LL, a1, a2);
  unint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  if (v11 >> 60 == 15)
  {
    unint64_t v12 = sub_10000480C();
    sub_100006F64((uint64_t)&type metadata for TranscriptAttachment.TranscriptAttachmentError, v12);
    *uint64_t v13 = 3;
    return swift_willThrow();
  }

  else
  {
    sub_100006104(v9, v11);
    return sub_100006244(v9, v11);
  }

unint64_t sub_10000480C()
{
  unint64_t result = qword_1000102E0;
  if (!qword_1000102E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AFB4, &type metadata for TranscriptAttachment.TranscriptAttachmentError);
    atomic_store(result, (unint64_t *)&qword_1000102E0);
  }

  return result;
}

void sub_100004848()
{
  uint64_t v125 = v3 - v2;
  uint64_t v4 = type metadata accessor for TranscriptAttachment(0LL);
  uint64_t v126 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v126 + 64);
  __chkstk_darwin(v4);
  uint64_t v127 = (uint64_t)&v112 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v130 = type metadata accessor for String.Encoding(0LL);
  uint64_t v6 = *(void *)(v130 - 8);
  __chkstk_darwin(v130);
  uint64_t v7 = sub_100006F10();
  uint64_t v132 = type metadata accessor for Logger(v7);
  unint64_t v129 = *(void *)(v132 - 8);
  sub_100006FC4();
  __chkstk_darwin(v8);
  sub_100006F9C();
  unint64_t v11 = (char *)(v9 - v10);
  __chkstk_darwin(v12);
  v134 = (char *)&v112 - v13;
  uint64_t v14 = type metadata accessor for URL(0LL);
  v128 = *(uint64_t (**)(char *, uint64_t))(v14 - 8);
  sub_100006FC4();
  __chkstk_darwin(v15);
  sub_100006F9C();
  uint64_t v18 = v16 - v17;
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v112 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v133 = (uint64_t)&v112 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v112 - v25;
  id v27 = sub_100005124();
  uint64_t v28 = v135;
  sub_10000527C((uint64_t)v26);
  uint64_t v135 = v28;
  if (v28)
  {

    return;
  }

  v120 = v22;
  uint64_t v121 = v0;
  uint64_t v122 = v6;
  uint64_t v118 = v5;
  uint64_t v116 = v18;
  v117 = v11;
  id v123 = v27;
  unint64_t v29 = v129;
  uint64_t v30 = v132;
  v115 = *(void (**)(char *, _DWORD *, uint64_t))(v129 + 16);
  v115(v134, v131, v132);
  unint64_t v31 = v128;
  uint64_t v32 = (uint64_t (*)(void, void, void))*((void *)v128 + 2);
  v124 = v26;
  v119 = v32;
  uint64_t v33 = v32(v133, v26, v14);
  uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
  uint64_t v35 = v14;
  os_log_type_t v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v36))
  {
    uint64_t v37 = (_DWORD *)sub_100006FF0(12LL);
    uint64_t v114 = sub_100006FF0(32LL);
    v136 = (void **)v114;
    v113 = v37;
    *uint64_t v37 = 136315138;
    v38 = v37 + 3;
    v112 = v37 + 1;
    uint64_t v39 = sub_1000043C8( (unint64_t *)&qword_1000102F8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v40 = v133;
    uint64_t v41 = v133;
    uint64_t v42 = dispatch thunk of CustomStringConvertible.description.getter(v35, v39);
    uint64_t v44 = sub_100007058(v42, v43);
    uint64_t v45 = sub_100007044(v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v45, v46, v112, v38);
    swift_bridgeObjectRelease(v41);
    v47 = (char *)*((void *)v31 + 1);
    sub_100006F94(v40);
    uint64_t v48 = (uint64_t)v113;
    sub_100007024((void *)&_mh_execute_header, v34, v36, "TranscriptAttachment: file path: %s");
    uint64_t v49 = v114;
    swift_arrayDestroy(v114, 1LL, (char *)&type metadata for Any + 8);
    sub_100006F2C(v49);
    sub_100006F2C(v48);

    v50 = *(uint64_t (**)(char *, uint64_t))(v29 + 8);
    uint64_t v51 = v50(v134, v132);
  }

  else
  {
    v47 = (char *)*((void *)v31 + 1);
    sub_100006F94(v133);

    v50 = *(uint64_t (**)(char *, uint64_t))(v29 + 8);
    uint64_t v51 = v50(v134, v30);
  }

  uint64_t v52 = v121;
  uint64_t v53 = (uint64_t)v120;
  static String.Encoding.utf8.getter(v51);
  uint64_t v54 = String.data(using:allowLossyConversion:)(v52, 0LL, 91LL, 0xE100000000000000LL);
  uint64_t v55 = v52;
  uint64_t v56 = v54;
  unint64_t v58 = v57;
  (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v55, v130);
  uint64_t v59 = (uint64_t)v124;
  if (v58 >> 60 == 15)
  {
    unint64_t v60 = sub_10000480C();
    uint64_t v61 = sub_100006F64((uint64_t)&type metadata for TranscriptAttachment.TranscriptAttachmentError, v60);
    _BYTE *v62 = 4;
    uint64_t v135 = v61;
    swift_willThrow();
    sub_100006FE8();
    sub_100006F94(v59);
    return;
  }

  uint64_t v63 = v135;
  Data.write(to:options:)(v124, 0LL, v56, v58);
  uint64_t v135 = v63;
  if (v63)
  {
    sub_100006F94(v59);
    sub_100006244(v56, v58);
    sub_100006FE8();
    return;
  }

  uint64_t v133 = v56;
  v134 = v47;
  sub_100006AA0();
  sub_100006F44();
  sub_100008990(v53, 1);
  if (!v64)
  {
    unint64_t v85 = sub_10000480C();
    uint64_t v86 = sub_100006F64((uint64_t)&type metadata for TranscriptAttachment.TranscriptAttachmentError, v85);
    _BYTE *v87 = 1;
    uint64_t v135 = v86;
    swift_willThrow();
    sub_100006244(v133, v58);
    sub_100006FE8();
    uint64_t v83 = v59;
    uint64_t v84 = v35;
    goto LABEL_14;
  }

  v65 = v64;
  unint64_t v129 = v58;
  uint64_t v130 = v35;
  v128 = v50;
  [v64 open];
  uint64_t v66 = swift_allocObject(&unk_10000C908, 17LL, 7LL);
  *(_BYTE *)(v66 + 16) = 1;
  uint64_t v67 = (uint64_t)v131;
  uint64_t v68 = v127;
  sub_100006AEC((uint64_t)v131, v127);
  uint64_t v69 = *(unsigned __int8 *)(v126 + 80);
  uint64_t v70 = (v69 + 16) & ~v69;
  uint64_t v71 = v118;
  uint64_t v72 = v69 | 7;
  uint64_t v73 = swift_allocObject(&unk_10000C930, v70 + v118, v69 | 7);
  sub_100006B80(v68, v73 + v70);
  v138 = sub_100006BC4;
  uint64_t v139 = v73;
  v136 = _NSConcreteStackBlock;
  uint64_t v137 = 1107296256LL;
  v74 = sub_100007018((uint64_t)sub_100005950);
  swift_release(v139);
  sub_100006AEC(v67, v68);
  uint64_t v75 = (v69 + 32) & ~v69;
  uint64_t v76 = swift_allocObject(&unk_10000C980, v75 + v71, v72);
  *(void *)(v76 + 16) = v66;
  *(void *)(v76 + 24) = v65;
  sub_100006B80(v68, v76 + v75);
  v138 = sub_100006C74;
  uint64_t v139 = v76;
  v136 = _NSConcreteStackBlock;
  uint64_t v137 = 1107296256LL;
  v77 = sub_100007018((uint64_t)sub_100005950);
  uint64_t v78 = v139;
  swift_retain(v66);
  id v79 = v65;
  swift_release(v78);
  id v80 = v123;
  id v81 = [v123 sinkWithCompletion:v74 receiveInput:v77];
  _Block_release(v77);
  _Block_release(v74);

  uint64_t v82 = v135;
  sub_100004714(93LL, 0xE100000000000000LL);
  uint64_t v135 = v82;
  if (v82)
  {
    swift_release(v66);
    [v79 close];
    sub_100006244(v133, v129);

    uint64_t v83 = (uint64_t)v124;
    uint64_t v84 = v130;
LABEL_14:
    ((void (*)(uint64_t, uint64_t))v134)(v83, v84);
    return;
  }

  uint64_t v127 = v66;
  v88 = v117;
  uint64_t v89 = v132;
  v115(v117, v131, v132);
  uint64_t v90 = v116;
  uint64_t v91 = v130;
  uint64_t v92 = sub_100006F44();
  v93 = (os_log_s *)Logger.logObject.getter(v92);
  os_log_type_t v94 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v93, v94))
  {
    v95 = (_DWORD *)sub_100006FF0(12LL);
    uint64_t v96 = v91;
    uint64_t v97 = sub_100006FF0(32LL);
    v136 = (void **)v97;
    _DWORD *v95 = 136315138;
    v131 = v95 + 1;
    uint64_t v98 = sub_1000043C8( (unint64_t *)&qword_1000102F8,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v99 = dispatch thunk of CustomStringConvertible.description.getter(v96, v98);
    uint64_t v101 = sub_100007058(v99, v100);
    uint64_t v102 = sub_100007044(v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v102, v103, v131, v95 + 3);
    swift_bridgeObjectRelease(v90);
    v104 = (void (*)(char *, uint64_t))v134;
    ((void (*)(uint64_t, uint64_t))v134)(v90, v96);
    sub_100007024((void *)&_mh_execute_header, v93, v94, "TranscriptAttachment: finished writing to: %s");
    swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v105 = v97;
    uint64_t v91 = v96;
    sub_100006F2C(v105);
    sub_100006F2C((uint64_t)v95);

    v106 = v117;
    uint64_t v107 = v132;
  }

  else
  {
    v104 = (void (*)(char *, uint64_t))v134;
    ((void (*)(uint64_t, uint64_t))v134)(v90, v91);

    v106 = v88;
    uint64_t v107 = v89;
  }

  v128(v106, v107);
  v109 = v124;
  uint64_t v108 = v125;
  sub_100006F44();
  sub_10000444C(v108, 0LL, 1LL, v91);
  id v110 = objc_allocWithZone(&OBJC_CLASS___DEAttachmentItem);
  sub_100009398(v108);
  if (v111)
  {
    swift_release(v127);
    [v79 close];
    sub_100006244(v133, v129);

    sub_100006FE8();
    v104(v109, v91);
  }

  else
  {
    __break(1u);
  }

id sub_100005124()
{
  uint64_t v1 = type metadata accessor for Date(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  sub_100006FAC();
  id v3 = [objc_allocWithZone(BMPublisherOptions) init];
  Date.init(timeIntervalSinceNow:)(-172800.0);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  [v3 setStartDate:isa];

  id v5 = (id)BiomeLibrary();
  id v6 = [v5 Sage];
  swift_unknownObjectRelease(v5);
  id v7 = [v6 Transcript];
  swift_unknownObjectRelease(v6);
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 publisherWithUseCase:v8 options:v3];

  return v9;
}

uint64_t sub_10000527C@<X0>(uint64_t a1@<X8>)
{
  v31[1] = a1;
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  sub_100006FC4();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = sub_100006F10();
  uint64_t v4 = type metadata accessor for URL(v3);
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_100006F9C();
  uint64_t v8 = v6 - v7;
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v11 = (char *)v31 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v31 - v12;
  uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v15 = [v14 defaultManager];
  id v16 = [v15 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v16);
  URL.appendingPathComponent(_:)(0xD00000000000001BLL, 0x800000010000AED0LL);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t v34 = v4;
  uint64_t v18 = v17(v11, v4);
  uint64_t v19 = UUID.init()(v18);
  uint64_t v20 = UUID.uuidString.getter(v19);
  uint64_t v22 = v21;
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v1, v33);
  URL.appendingPathComponent(_:)(v20, v22);
  swift_bridgeObjectRelease(v22);
  id v23 = [v14 defaultManager];
  URL._bridgeToObjectiveC()(v24);
  uint64_t v26 = v25;
  id v35 = 0LL;
  LOBYTE(v22) = [v23 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:0 error:&v35];

  id v27 = v35;
  if ((v22 & 1) != 0)
  {
    id v28 = v35;
    URL.appendingPathComponent(_:isDirectory:)(0xD000000000000020LL, 0x800000010000A830LL, 0LL);
  }

  else
  {
    id v30 = v35;
    _convertNSErrorToError(_:)(v27);

    swift_willThrow();
  }

  sub_100006FD0(v8);
  return sub_100006FD0((uint64_t)v13);
}

uint64_t sub_100005524(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v11 = (char *)&v38 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v38 - v12;
  id v14 = [a1 state];
  if (v14 == (id)1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, a2, v4);
    id v20 = a1;
    uint64_t v21 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v39 = swift_slowAlloc(32LL, -1LL);
      uint64_t v41 = v39;
      *(_DWORD *)id v23 = 136315138;
      id v40 = [v20 error];
      uint64_t v24 = sub_1000041D4(&qword_100010330);
      uint64_t v25 = String.init<A>(describing:)(&v40, v24);
      unint64_t v27 = v26;
      id v40 = (id)sub_1000095AC(v25, v26, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v23 + 4, v23 + 12);

      swift_bridgeObjectRelease(v27);
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "TranscriptAttachment: failed to fully publish events: %s",  v23,  0xCu);
      uint64_t v28 = v39;
      swift_arrayDestroy(v39, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1LL, -1LL);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    else
    {
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  }

  else if (v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
    id v29 = a1;
    id v30 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v33 = swift_slowAlloc(32LL, -1LL);
      uint64_t v41 = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v39 = (uint64_t)(v32 + 4);
      id v40 = [v29 state];
      type metadata accessor for BPSCompletionState();
      uint64_t v35 = String.init<A>(describing:)(&v40, v34);
      unint64_t v37 = v36;
      id v40 = (id)sub_1000095AC(v35, v36, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v39, v32 + 12);

      swift_bridgeObjectRelease(v37);
      _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "TranscriptAttachment: unknown completion state: %s",  v32,  0xCu);
      swift_arrayDestroy(v33, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1LL, -1LL);
      swift_slowDealloc(v32, -1LL, -1LL);
    }

    else
    {
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }

  else
  {
    uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, a2, v4);
    id v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "TranscriptAttachment: finished publishing events successfully",  v18,  2u);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }

uint64_t sub_100005954(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v11 = (_BYTE *)(a2 + 16);
  swift_beginAccess(a2 + 16, v43, 0LL, 0LL);
  if ((*(_BYTE *)(a2 + 16) & 1) == 0) {
    sub_100004714(44LL, 0xE100000000000000LL);
  }
  uint64_t v37 = v8;
  swift_beginAccess(v11, v42, 1LL, 0LL);
  *unint64_t v11 = 0;
  id v12 = [a1 jsonDictionary];
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v38 = v13;
  id v14 = sub_100005D98();
  id v27 = v14;
  if (v14)
  {
    strcpy((char *)v39, "eventPayload");
    BYTE5(v39[1]) = 0;
    HIWORD(v39[1]) = -5120;
    AnyHashable.init<A>(_:)(&v40, v39, &type metadata for String, &protocol witness table for String);
    v39[3] = sub_1000041D4(&qword_100010308);
    v39[0] = v27;
    sub_100006098((uint64_t)v39, (uint64_t)&v40);
    uint64_t v13 = v38;
  }

  uint64_t v28 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  id v40 = 0LL;
  id v30 = [v28 dataWithJSONObject:isa options:3 error:&v40];

  id v31 = v40;
  if (v30)
  {
    uint64_t v32 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v30);
    unint64_t v34 = v33;

    sub_100006104(v32, v34);
    return sub_100004408(v32, v34);
  }

  else
  {
    uint64_t v35 = v31;
    uint64_t v36 = _convertNSErrorToError(_:)(v31);

    swift_willThrow();
    uint64_t v15 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v10, a4, v7);
    swift_errorRetain(v36);
    uint64_t v16 = swift_errorRetain(v36);
    os_log_type_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v37 = swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v19 = 138412290;
      swift_errorRetain(v36);
      id v20 = v10;
      uint64_t v21 = v7;
      uint64_t v22 = v15;
      id v23 = (void *)_swift_stdlib_bridgeErrorToNSError(v36);
      id v40 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v19 + 4, v19 + 12);
      uint64_t v24 = v37;
      *(void *)uint64_t v37 = v23;
      uint64_t v15 = v22;
      uint64_t v7 = v21;
      uint64_t v10 = v20;
      swift_errorRelease(v36);
      swift_errorRelease(v36);
      _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "TranscriptAttachment: error during event processing: %@",  v19,  0xCu);
      uint64_t v25 = sub_1000041D4(&qword_100010300);
      swift_arrayDestroy(v24, 1LL, v25);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);

      swift_errorRelease(v36);
    }

    else
    {
      swift_errorRelease(v36);
      swift_errorRelease(v36);
      swift_errorRelease(v36);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v7);
  }

id sub_100005D98()
{
  uint64_t v3 = type metadata accessor for JSONEncodingOptions(0LL);
  __chkstk_darwin(v3);
  uint64_t v4 = sub_100006F10();
  type metadata accessor for BinaryDecodingOptions(v4);
  sub_100006FC4();
  __chkstk_darwin(v5);
  sub_100006FAC();
  uint64_t v6 = type metadata accessor for TranscriptProtoEvent(0LL);
  __chkstk_darwin(v6);
  sub_100004468();
  id result = [v0 eventBody];
  if (result)
  {
    uint64_t v8 = sub_100006D90(result);
    if (v9 >> 60 == 15)
    {
      return 0LL;
    }

    else
    {
      uint64_t v28 = 0LL;
      memset(v27, 0, sizeof(v27));
      uint64_t v10 = v8;
      unint64_t v11 = v9;
      uint64_t v12 = sub_100006954(v8, v9);
      BinaryDecodingOptions.init()(v12);
      uint64_t v13 = sub_1000043C8( &qword_100010320,  (uint64_t (*)(uint64_t))&type metadata accessor for TranscriptProtoEvent,  (uint64_t)&protocol conformance descriptor for TranscriptProtoEvent);
      Message.init(serializedData:extensions:partial:options:)(v10, v11, v27, 0LL, v0, v6, v13);
      if (v1)
      {
        return (id)sub_100006244(v10, v11);
      }

      else
      {
        unint64_t v25 = v11;
        TranscriptProtoEvent.prepareForLogging()();
        JSONEncodingOptions.init()();
        Message.jsonUTF8Data(options:)(v2, v6, v13);
        sub_100006FD8();
        uint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        id v26 = 0LL;
        id v18 = [v16 JSONObjectWithData:isa options:0 error:&v26];

        id v19 = v26;
        if (v18)
        {
          _bridgeAnyObjectToAny(_:)(v27, v18);
          sub_100007064();
          swift_unknownObjectRelease(v18);
          sub_100006244(v10, v25);
          uint64_t v20 = sub_100007030();
          v21(v20);
          uint64_t v22 = sub_1000041D4(&qword_100010328);
          swift_dynamicCast(&v26, v27, (char *)&type metadata for Any + 8, v22, 7LL);
          return v26;
        }

        else
        {
          id v23 = v19;
          _convertNSErrorToError(_:)(v19);

          swift_willThrow();
          sub_100007064();
          sub_100006244(v10, v25);
          uint64_t v24 = sub_100007030();
          return (id)v15(v24, v14);
        }
      }
    }
  }

  return result;
}

uint64_t sub_100006098(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_100006D24((_OWORD *)a1, v4);
    sub_1000065A0(v4, a2);
    return sub_100006CF0(a2);
  }

  else
  {
    sub_100006CB0(a1);
    sub_100006484(a2, v4);
    sub_100006CF0(a2);
    return sub_100006CB0((uint64_t)v4);
  }

void sub_100006104(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_100006144()
{
  return sub_100006F84(v0, v2 & 0xFFFFFFFFFFFFLL, BYTE6(v2), v1);
}

uint64_t sub_100006244(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100004408(a1, a2);
  }
  return a1;
}

void sub_100006258(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_1000062A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  if (a1) {
    __asm { BR              X11 }
  }

  unint64_t v7 = sub_10000480C();
  uint64_t v8 = swift_allocError(&type metadata for TranscriptAttachment.TranscriptAttachmentError, v7, 0LL, 0LL);
  *unint64_t v9 = 0;
  uint64_t result = swift_willThrow();
  *a6 = v8;
  return result;
}

uint64_t sub_1000063E0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  if (a1)
  {
    sub_1000062A8(a1, a2 - a1, (uint64_t)a3, a4, a5, &v11);
  }

  else
  {
    unint64_t v8 = sub_10000480C();
    swift_allocError(&type metadata for TranscriptAttachment.TranscriptAttachmentError, v8, 0LL, 0LL);
    *unint64_t v9 = 0;
    swift_willThrow();
  }

  return sub_100004408(a4, a5);
}

double sub_100006484@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_10000660C(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    uint64_t v14 = *v3;
    uint64_t v10 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    Swift::Int v11 = *(void *)(v10 + 24);
    sub_1000041D4(&qword_100010318);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v11);
    sub_100006CF0(*(void *)(v14 + 48) + 40 * v7);
    sub_100006D24((_OWORD *)(*(void *)(v14 + 56) + 32 * v7), a2);
    _NativeDictionary._delete(at:)( v7,  v14,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
    uint64_t v12 = *v3;
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease(v12);
  }

  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }

  return result;
}

uint64_t sub_1000065A0(_OWORD *a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v8 = *v2;
  *uint64_t v2 = 0x8000000000000000LL;
  sub_10000663C(a1, a2, isUniquelyReferenced_nonNull_native);
  uint64_t v6 = *v2;
  *uint64_t v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

unint64_t sub_10000660C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_1000067D8(a1, v4);
}

_OWORD *sub_10000663C(_OWORD *a1, uint64_t a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_10000660C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v14 = v9;
  char v15 = v10;
  sub_1000041D4(&qword_100010318);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_10000660C(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
    __break(1u);
    return result;
  }

  unint64_t v14 = v16;
LABEL_5:
  id v18 = *v4;
  if ((v15 & 1) != 0)
  {
    id v19 = (void *)(v18[7] + 32 * v14);
    sub_100006D70(v19);
    return sub_100006D24(a1, v19);
  }

  else
  {
    sub_100006D34(a2, (uint64_t)v21);
    return sub_100006760(v14, (uint64_t)v21, a1, v18);
  }

_OWORD *sub_100006760(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  double result = sub_100006D24(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_1000067D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100006D34(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100006CF0((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

uint64_t sub_10000689C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v12 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v12 += a1 - result;
  }

  BOOL v13 = __OFSUB__(a2, a1);
  uint64_t v14 = a2 - a1;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v15 = __DataStorage._length.getter();
  if (v15 >= v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = v12 + v16;
  if (v12) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 0LL;
  }
  return sub_1000063E0(v12, v18, a4, a5, a6);
}

uint64_t sub_100006954(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100006998(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6)
{
  uint64_t v11 = a1;
  __int16 v12 = a2;
  char v13 = BYTE2(a2);
  char v14 = BYTE3(a2);
  char v15 = BYTE4(a2);
  char v16 = BYTE5(a2);
  sub_1000062A8((uint64_t)&v11, a3, (uint64_t)a4, a5, a6, &v10);

  return sub_100004408(a5, a6);
}

unint64_t sub_100006AA0()
{
  unint64_t result = qword_1000102F0;
  if (!qword_1000102F0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSOutputStream);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000102F0);
  }

  return result;
}

uint64_t sub_100006ADC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100006AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranscriptAttachment(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006B30()
{
  uint64_t v1 = *(void *)(sub_100006FF8() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 16) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  uint64_t v5 = sub_100007000();
  sub_100006F70(v5);
  return sub_100006F38(v0, v3, v4);
}

uint64_t sub_100006B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TranscriptAttachment(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006BC4(void *a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_100006FF8() - 8) + 80LL);
  return sub_100005524(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_100006BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006C0C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100006C14()
{
  uint64_t v1 = *(void *)(sub_100006FF8() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  swift_release(*(void *)(v0 + 16));

  uint64_t v5 = sub_100007000();
  sub_100006F70(v5);
  return sub_100006F38(v0, v3, v4);
}

uint64_t sub_100006C74(void *a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_100006FF8() - 8) + 80LL);
  return sub_100005954(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_100006CB0(uint64_t a1)
{
  uint64_t v2 = sub_1000041D4(&qword_100010310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100006CF0(uint64_t a1)
{
  return a1;
}

_OWORD *sub_100006D24(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006D34(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100006D70(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006D90(void *a1)
{
  id v2 = [a1 eventPayload];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t storeEnumTagSinglePayload for TranscriptAttachment.TranscriptAttachmentError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_100006E48 + 4 * byte_10000AEE5[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100006E7C + 4 * byte_10000AEE0[v4]))();
}

uint64_t sub_100006E7C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006E84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006E8CLL);
  }
  return result;
}

uint64_t sub_100006E98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006EA0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_100006EA4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006EAC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TranscriptAttachment.TranscriptAttachmentError()
{
  return &type metadata for TranscriptAttachment.TranscriptAttachmentError;
}

unint64_t sub_100006ECC()
{
  unint64_t result = qword_100010338;
  if (!qword_100010338)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AF8C, &type metadata for TranscriptAttachment.TranscriptAttachmentError);
    atomic_store(result, (unint64_t *)&qword_100010338);
  }

  return result;
}

uint64_t sub_100006F10()
{
  return 0LL;
}

uint64_t sub_100006F2C(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_100006F38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

uint64_t sub_100006F44()
{
  return (*(uint64_t (**)(void))(v0 - 280))();
}

uint64_t sub_100006F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000689C(a1, a2, a3, v4, v3, v5);
}

uint64_t sub_100006F64(uint64_t a1, uint64_t a2)
{
  return swift_allocError(a1, a2, 0LL, 0LL);
}

uint64_t sub_100006F70(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_100006F84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_100006998(a1, a2, a3, a4, v4, v5);
}

uint64_t sub_100006F94(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100006FD0(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100006FD8()
{
  return (*(uint64_t (**)(uint64_t, void))(v0 + 8))(v1, *(void *)(v2 - 168));
}

void sub_100006FE8()
{
}

uint64_t sub_100006FF0(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

uint64_t sub_100006FF8()
{
  return type metadata accessor for TranscriptAttachment(0LL);
}

uint64_t sub_100007000()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_100007008()
{
  return sub_100006954(v0, v1);
}

void *sub_100007018@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 112) = v1;
  return _Block_copy((const void *)(v2 - 136));
}

void sub_100007024(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_100007030()
{
  return v0;
}

uint64_t sub_100007044(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t sub_100007058(uint64_t a1, unint64_t a2)
{
  return sub_1000095AC(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t sub_100007064()
{
  return sub_100004408(v1, v0);
}

void sub_100007070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000041D4(&qword_1000102E8);
  __chkstk_darwin(v4);
  uint64_t v125 = (char *)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_1000041D4(&qword_100010200);
  __chkstk_darwin(v6);
  uint64_t v126 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v130 = type metadata accessor for Logger(0LL);
  uint64_t v8 = *(void *)(v130 - 8);
  uint64_t v9 = __chkstk_darwin(v130);
  uint64_t v11 = (char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  char v14 = (char *)&v114 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v114 - v16;
  __chkstk_darwin(v15);
  unint64_t v129 = (void (*)(char *, uint64_t))((char *)&v114 - v18);
  uint64_t v133 = type metadata accessor for URL(0LL);
  uint64_t v127 = *(void **)(v133 - 8);
  uint64_t v19 = __chkstk_darwin(v133);
  uint64_t v21 = (char *)&v114 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v114 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  v128 = (char *)&v114 - v26;
  __chkstk_darwin(v25);
  uint64_t v132 = (char *)&v114 - v27;
  uint64_t v28 = v131;
  sub_1000086E4(a1, a2, (uint64_t)&v114 - v27);
  if (!v28)
  {
    uint64_t v121 = v24;
    uint64_t v122 = v8;
    uint64_t v118 = v17;
    uint64_t v119 = a1;
    uint64_t v123 = a2;
    v124 = v11;
    v115 = v21;
    v117 = v14;
    v131 = 0LL;
    unint64_t v120 = (unint64_t)"Swift/UnsafeBufferPointer.swift";
    Logger.init(subsystem:category:)( 0xD00000000000003DLL,  0x800000010000AC80LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
    id v29 = v127;
    id v30 = (uint64_t (*)(char *, char *, uint64_t))v127[2];
    uint64_t v31 = v30(v128, v132, v133);
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc(22LL, -1LL);
      uint64_t v116 = v30;
      uint64_t v35 = v34;
      uint64_t v114 = swift_slowAlloc(64LL, -1LL);
      uint64_t v136 = v114;
      *(_DWORD *)uint64_t v35 = 136315394;
      v134 = &type metadata for ElementHierarchyAttachment;
      uint64_t v36 = sub_1000041D4(&qword_100010398);
      uint64_t v37 = String.init<A>(describing:)(&v134, v36);
      unint64_t v39 = v38;
      v134 = (ValueMetadata *)sub_1000095AC(v37, v38, &v136);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v35 + 4, v35 + 12);
      swift_bridgeObjectRelease(v39);
      *(_WORD *)(v35 + 12) = 2080;
      unint64_t v40 = sub_100009E3C();
      uint64_t v41 = v128;
      uint64_t v42 = dispatch thunk of CustomStringConvertible.description.getter(v133, v40);
      unint64_t v44 = v43;
      v134 = (ValueMetadata *)sub_1000095AC(v42, v43, &v136);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v35 + 14, v35 + 22);
      swift_bridgeObjectRelease(v44);
      uint64_t v45 = (void (*)(char *, uint64_t))v29[1];
      v45(v41, v133);
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s: file path: %s", (uint8_t *)v35, 0x16u);
      uint64_t v46 = v114;
      swift_arrayDestroy(v114, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1LL, -1LL);
      uint64_t v47 = v35;
      id v30 = v116;
      swift_slowDealloc(v47, -1LL, -1LL);
    }

    else
    {
      uint64_t v45 = (void (*)(char *, uint64_t))v29[1];
      v45(v128, v133);
    }

    uint64_t v48 = *(void (**)(char *, uint64_t))(v122 + 8);
    v48((char *)v129, v130);
    uint64_t v49 = v123;
    v50 = v124;
    sub_100009ED4(0LL, (unint64_t *)&qword_1000102F0, &OBJC_CLASS___NSOutputStream_ptr);
    uint64_t v51 = (uint64_t)v121;
    v30(v121, v132, v133);
    sub_100008990(v51, 1);
    uint64_t v53 = v119;
    if (v52)
    {
      uint64_t v54 = v52;
      [v52 open];
      swift_bridgeObjectRetain(v49);
      uint64_t v55 = (uint64_t)v126;
      sub_100003E88(v53, v49);
      swift_bridgeObjectRelease(v49);
      uint64_t v56 = type metadata accessor for UIContextCacheRepresentation(0LL);
      int v57 = sub_100004214(v55, 1LL, v56);
      unint64_t v129 = v45;
      if (v57 == 1)
      {
        sub_100009E7C(v55, &qword_100010200);
        uint64_t v58 = 0LL;
        uint64_t v59 = 0xE000000000000000LL;
      }

      else
      {
        uint64_t v70 = UIContextCacheRepresentation.hierarchy.getter();
        uint64_t v72 = v71;
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v56 - 8) + 8LL))(v55, v56);
        if (v72) {
          uint64_t v58 = v70;
        }
        else {
          uint64_t v58 = 0LL;
        }
        if (v72) {
          uint64_t v59 = v72;
        }
        else {
          uint64_t v59 = 0xE000000000000000LL;
        }
      }

      uint64_t v73 = v131;
      sub_100004714(v58, v59);
      if (v73)
      {
        swift_bridgeObjectRelease(v59);
        Logger.init(subsystem:category:)( 0xD00000000000003DLL,  v120 | 0x8000000000000000LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
        swift_errorRetain(v73);
        uint64_t v74 = swift_errorRetain(v73);
        uint64_t v75 = (os_log_s *)Logger.logObject.getter(v74);
        os_log_type_t v76 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v75, v76))
        {
          uint64_t v77 = swift_slowAlloc(22LL, -1LL);
          uint64_t v78 = swift_slowAlloc(64LL, -1LL);
          uint64_t v136 = v78;
          *(_DWORD *)uint64_t v77 = 136315394;
          uint64_t v127 = v54;
          v134 = &type metadata for ElementHierarchyAttachment;
          uint64_t v79 = sub_1000041D4(&qword_100010398);
          uint64_t v80 = String.init<A>(describing:)(&v134, v79);
          v128 = (char *)v48;
          unint64_t v82 = v81;
          v134 = (ValueMetadata *)sub_1000095AC(v80, v81, &v136);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v77 + 4, v77 + 12);
          swift_bridgeObjectRelease(v82);
          *(_WORD *)(v77 + 12) = 2080;
          v134 = v73;
          swift_errorRetain(v73);
          uint64_t v83 = sub_1000041D4(&qword_100010390);
          uint64_t v84 = String.init<A>(describing:)(&v134, v83);
          unint64_t v86 = v85;
          v134 = (ValueMetadata *)sub_1000095AC(v84, v85, &v136);
          uint64_t v54 = v127;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v77 + 14, v77 + 22);
          swift_bridgeObjectRelease(v86);
          swift_errorRelease(v73);
          swift_errorRelease(v73);
          _os_log_impl( (void *)&_mh_execute_header,  v75,  v76,  "%s: failed to fully publish events: %s",  (uint8_t *)v77,  0x16u);
          swift_arrayDestroy(v78, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v78, -1LL, -1LL);
          swift_slowDealloc(v77, -1LL, -1LL);

          uint64_t v87 = ((uint64_t (*)(char *, uint64_t))v128)(v50, v130);
        }

        else
        {
          swift_errorRelease(v73);
          swift_errorRelease(v73);

          uint64_t v87 = ((uint64_t (*)(char *, uint64_t))v48)(v50, v130);
        }

        swift_willThrow(v87);
        [v54 close];

        v129(v132, v133);
      }

      else
      {
        v131 = 0LL;
        swift_bridgeObjectRelease(v59);
        v88 = v117;
        Logger.init(subsystem:category:)( 0xD00000000000003DLL,  v120 | 0x8000000000000000LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
        uint64_t v89 = v115;
        uint64_t v90 = v30(v115, v132, v133);
        uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
        os_log_type_t v92 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v91, v92))
        {
          uint64_t v93 = swift_slowAlloc(22LL, -1LL);
          uint64_t v94 = swift_slowAlloc(64LL, -1LL);
          uint64_t v127 = v54;
          uint64_t v95 = v94;
          uint64_t v136 = v94;
          *(_DWORD *)uint64_t v93 = 136315394;
          v134 = &type metadata for ElementHierarchyAttachment;
          uint64_t v96 = sub_1000041D4(&qword_100010398);
          uint64_t v116 = v30;
          uint64_t v97 = String.init<A>(describing:)(&v134, v96);
          v128 = (char *)v48;
          unint64_t v99 = v98;
          v134 = (ValueMetadata *)sub_1000095AC(v97, v98, &v136);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v93 + 4, v93 + 12);
          swift_bridgeObjectRelease(v99);
          *(_WORD *)(v93 + 12) = 2080;
          unint64_t v100 = sub_100009E3C();
          uint64_t v101 = v133;
          uint64_t v102 = dispatch thunk of CustomStringConvertible.description.getter(v133, v100);
          unint64_t v104 = v103;
          v134 = (ValueMetadata *)sub_1000095AC(v102, v103, &v136);
          id v30 = v116;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v93 + 14, v93 + 22);
          swift_bridgeObjectRelease(v104);
          uint64_t v105 = v129;
          v129(v89, v101);
          _os_log_impl((void *)&_mh_execute_header, v91, v92, "%s: finished writing to: %s", (uint8_t *)v93, 0x16u);
          swift_arrayDestroy(v95, 2LL, (char *)&type metadata for Any + 8);
          uint64_t v106 = v95;
          uint64_t v54 = v127;
          uint64_t v107 = v105;
          swift_slowDealloc(v106, -1LL, -1LL);
          swift_slowDealloc(v93, -1LL, -1LL);

          ((void (*)(char *, uint64_t))v128)(v117, v130);
        }

        else
        {
          uint64_t v107 = v129;
          v129(v89, v133);

          v48(v88, v130);
        }

        uint64_t v110 = (uint64_t)v125;
        uint64_t v111 = v133;
        v30(v125, v132, v133);
        sub_10000444C(v110, 0LL, 1LL, v111);
        id v112 = objc_allocWithZone(&OBJC_CLASS___DEAttachmentItem);
        sub_100009398(v110);
        if (v113)
        {
          [v54 close];

          v107(v132, v133);
        }

        else
        {
          __break(1u);
        }
      }
    }

    else
    {
      unint64_t v60 = v118;
      uint64_t v61 = Logger.init(subsystem:category:)( 0xD00000000000003DLL,  v120 | 0x8000000000000000LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
      v62 = (os_log_s *)Logger.logObject.getter(v61);
      os_log_type_t v63 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v62, v63))
      {
        v128 = (char *)v48;
        v64 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v65 = swift_slowAlloc(32LL, -1LL);
        uint64_t v136 = v65;
        unint64_t v129 = v45;
        *(_DWORD *)v64 = 136315138;
        v134 = &type metadata for ElementHierarchyAttachment;
        uint64_t v66 = sub_1000041D4(&qword_100010398);
        uint64_t v67 = String.init<A>(describing:)(&v134, v66);
        unint64_t v69 = v68;
        v134 = (ValueMetadata *)sub_1000095AC(v67, v68, &v136);
        uint64_t v45 = v129;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v134, &v135, v64 + 4, v64 + 12);
        swift_bridgeObjectRelease(v69);
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "%s: failed to open stream", v64, 0xCu);
        swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v65, -1LL, -1LL);
        swift_slowDealloc(v64, -1LL, -1LL);

        ((void (*)(char *, uint64_t))v128)(v60, v130);
      }

      else
      {

        v48(v60, v130);
      }

      unint64_t v108 = sub_100009E00();
      swift_allocError(&type metadata for UIAttachmentError, v108, 0LL, 0LL);
      _BYTE *v109 = 1;
      ((void (*)(void))swift_willThrow)();
      v45(v132, v133);
    }
  }

void sub_100007BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000041D4(&qword_1000102E8);
  __chkstk_darwin(v4);
  uint64_t v119 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v123 = type metadata accessor for Logger(0LL);
  uint64_t v6 = *(void *)(v123 - 8);
  uint64_t v7 = __chkstk_darwin(v123);
  uint64_t v9 = (char *)&v107 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v107 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v107 - v14;
  __chkstk_darwin(v13);
  uint64_t v122 = (char *)&v107 - v16;
  uint64_t v126 = type metadata accessor for URL(0LL);
  uint64_t v121 = *(void (**)(char *, uint64_t))(v126 - 8);
  uint64_t v17 = __chkstk_darwin(v126);
  uint64_t v19 = (char *)&v107 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v107 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  unint64_t v120 = (char *)&v107 - v24;
  __chkstk_darwin(v23);
  uint64_t v125 = (char *)&v107 - v25;
  uint64_t v26 = v124;
  sub_1000086E4(a1, a2, (uint64_t)&v107 - v25);
  if (v26) {
    return;
  }
  uint64_t v114 = v22;
  uint64_t v115 = v6;
  id v112 = 0LL;
  uint64_t v113 = a1;
  uint64_t v117 = a2;
  uint64_t v118 = v9;
  uint64_t v27 = v123;
  uint64_t v111 = v15;
  unint64_t v108 = v19;
  v109 = v12;
  unint64_t v116 = (unint64_t)"Swift/UnsafeBufferPointer.swift";
  Logger.init(subsystem:category:)( 0xD00000000000003DLL,  0x800000010000AC80LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
  id v29 = v120;
  uint64_t v28 = v121;
  id v30 = (uint64_t (*)(char *, char *, uint64_t))*((void *)v121 + 2);
  uint64_t v31 = v30(v120, v125, v126);
  uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc(22LL, -1LL);
    uint64_t v110 = v30;
    uint64_t v35 = v34;
    uint64_t v36 = swift_slowAlloc(64LL, -1LL);
    unint64_t v129 = (char *)v36;
    *(_DWORD *)uint64_t v35 = 136315394;
    uint64_t v127 = &type metadata for UIElementsAttachment;
    uint64_t v37 = sub_1000041D4(&qword_100010388);
    uint64_t v38 = String.init<A>(describing:)(&v127, v37);
    unint64_t v39 = v32;
    unint64_t v41 = v40;
    uint64_t v127 = (ValueMetadata *)sub_1000095AC(v38, v40, (uint64_t *)&v129);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v35 + 4, v35 + 12);
    swift_bridgeObjectRelease(v41);
    *(_WORD *)(v35 + 12) = 2080;
    unint64_t v42 = sub_100009E3C();
    uint64_t v43 = dispatch thunk of CustomStringConvertible.description.getter(v126, v42);
    unint64_t v45 = v44;
    uint64_t v127 = (ValueMetadata *)sub_1000095AC(v43, v44, (uint64_t *)&v129);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v35 + 14, v35 + 22);
    swift_bridgeObjectRelease(v45);
    v124 = (void (*)(void, void))*((void *)v28 + 1);
    v124(v29, v126);
    _os_log_impl((void *)&_mh_execute_header, v39, v33, "%s: file path: %s", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy(v36, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1LL, -1LL);
    uint64_t v46 = v35;
    id v30 = v110;
    uint64_t v47 = v123;
    swift_slowDealloc(v46, -1LL, -1LL);

    uint64_t v48 = *(void (**)(char *, uint64_t))(v115 + 8);
    v48(v122, v47);
  }

  else
  {
    v124 = (void (*)(void, void))*((void *)v28 + 1);
    v124(v29, v126);

    uint64_t v48 = *(void (**)(char *, uint64_t))(v115 + 8);
    uint64_t v47 = v27;
    v48(v122, v27);
  }

  uint64_t v49 = v117;
  v50 = v118;
  sub_100009ED4(0LL, (unint64_t *)&qword_1000102F0, &OBJC_CLASS___NSOutputStream_ptr);
  uint64_t v51 = (uint64_t)v114;
  v30(v114, v125, v126);
  sub_100008990(v51, 1);
  uint64_t v53 = v113;
  if (!v52)
  {
    uint64_t v73 = v111;
    uint64_t v74 = Logger.init(subsystem:category:)( 0xD00000000000003DLL,  v116 | 0x8000000000000000LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
    uint64_t v75 = (os_log_s *)Logger.logObject.getter(v74);
    os_log_type_t v76 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v78 = swift_slowAlloc(32LL, -1LL);
      unint64_t v129 = (char *)v78;
      *(_DWORD *)uint64_t v77 = 136315138;
      uint64_t v127 = &type metadata for UIElementsAttachment;
      uint64_t v79 = sub_1000041D4(&qword_100010388);
      uint64_t v80 = String.init<A>(describing:)(&v127, v79);
      unint64_t v82 = v81;
      uint64_t v127 = (ValueMetadata *)sub_1000095AC(v80, v81, (uint64_t *)&v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v77 + 4, v77 + 12);
      swift_bridgeObjectRelease(v82);
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "%s: failed to open stream", v77, 0xCu);
      swift_arrayDestroy(v78, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1LL, -1LL);
      swift_slowDealloc(v77, -1LL, -1LL);

      v48(v73, v123);
    }

    else
    {

      v48(v73, v47);
    }

    unint64_t v83 = sub_100009E00();
    uint64_t v84 = swift_allocError(&type metadata for UIAttachmentError, v83, 0LL, 0LL);
    *unint64_t v85 = 1;
    swift_willThrow(v84);
    goto LABEL_19;
  }

  uint64_t v54 = v52;
  [v52 open];
  uint64_t v55 = v112;
  uint64_t v56 = sub_100003F14(v53, v49);
  if (v55)
  {
    Logger.init(subsystem:category:)( 0xD00000000000003DLL,  v116 | 0x8000000000000000LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
    swift_errorRetain(v55);
    uint64_t v59 = swift_errorRetain(v55);
    unint64_t v60 = (os_log_s *)Logger.logObject.getter(v59);
    os_log_type_t v61 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = swift_slowAlloc(22LL, -1LL);
      uint64_t v63 = swift_slowAlloc(64LL, -1LL);
      unint64_t v129 = (char *)v63;
      *(_DWORD *)uint64_t v62 = 136315394;
      uint64_t v122 = v54;
      uint64_t v127 = &type metadata for UIElementsAttachment;
      uint64_t v64 = sub_1000041D4(&qword_100010388);
      uint64_t v65 = String.init<A>(describing:)(&v127, v64);
      uint64_t v121 = v48;
      unint64_t v67 = v66;
      uint64_t v127 = (ValueMetadata *)sub_1000095AC(v65, v66, (uint64_t *)&v129);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v62 + 4, v62 + 12);
      swift_bridgeObjectRelease(v67);
      *(_WORD *)(v62 + 12) = 2080;
      uint64_t v127 = v55;
      swift_errorRetain(v55);
      uint64_t v68 = sub_1000041D4(&qword_100010390);
      uint64_t v69 = String.init<A>(describing:)(&v127, v68);
      unint64_t v71 = v70;
      uint64_t v127 = (ValueMetadata *)sub_1000095AC(v69, v70, (uint64_t *)&v129);
      uint64_t v54 = v122;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v62 + 14, v62 + 22);
      swift_bridgeObjectRelease(v71);
      swift_errorRelease(v55);
      swift_errorRelease(v55);
      _os_log_impl( (void *)&_mh_execute_header,  v60,  v61,  "%s: failed to fully publish events: %s",  (uint8_t *)v62,  0x16u);
      swift_arrayDestroy(v63, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v63, -1LL, -1LL);
      swift_slowDealloc(v62, -1LL, -1LL);

      uint64_t v72 = ((uint64_t (*)(char *, uint64_t))v121)(v50, v123);
    }

    else
    {
      swift_errorRelease(v55);
      swift_errorRelease(v55);

      uint64_t v72 = ((uint64_t (*)(char *, uint64_t))v48)(v50, v47);
    }

    swift_willThrow(v72);
    [v54 close];

LABEL_19:
    v124(v125, v126);
    return;
  }

  if (v57)
  {
    uint64_t v58 = v57;
  }

  else
  {
    uint64_t v56 = 0LL;
    uint64_t v58 = 0xE000000000000000LL;
  }

  sub_100004714(v56, v58);
  id v112 = 0LL;
  swift_bridgeObjectRelease(v58);
  unint64_t v86 = v109;
  Logger.init(subsystem:category:)( 0xD00000000000003DLL,  v116 | 0x8000000000000000LL,  0x6863617474414955LL,  0xEC000000746E656DLL);
  uint64_t v87 = v108;
  uint64_t v110 = v30;
  uint64_t v88 = v30(v108, v125, v126);
  uint64_t v89 = (os_log_s *)Logger.logObject.getter(v88);
  os_log_type_t v90 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v89, v90))
  {
    uint64_t v91 = swift_slowAlloc(22LL, -1LL);
    unint64_t v120 = (char *)swift_slowAlloc(64LL, -1LL);
    uint64_t v121 = v48;
    unint64_t v129 = v120;
    *(_DWORD *)uint64_t v91 = 136315394;
    uint64_t v127 = &type metadata for UIElementsAttachment;
    uint64_t v92 = sub_1000041D4(&qword_100010388);
    uint64_t v93 = String.init<A>(describing:)(&v127, v92);
    uint64_t v94 = v87;
    uint64_t v95 = v126;
    uint64_t v122 = v54;
    unint64_t v97 = v96;
    uint64_t v127 = (ValueMetadata *)sub_1000095AC(v93, v96, (uint64_t *)&v129);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v91 + 4, v91 + 12);
    swift_bridgeObjectRelease(v97);
    *(_WORD *)(v91 + 12) = 2080;
    unint64_t v98 = sub_100009E3C();
    uint64_t v99 = dispatch thunk of CustomStringConvertible.description.getter(v95, v98);
    unint64_t v101 = v100;
    uint64_t v127 = (ValueMetadata *)sub_1000095AC(v99, v100, (uint64_t *)&v129);
    uint64_t v54 = v122;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v91 + 14, v91 + 22);
    swift_bridgeObjectRelease(v101);
    v124(v94, v95);
    _os_log_impl((void *)&_mh_execute_header, v89, v90, "%s: finished writing to: %s", (uint8_t *)v91, 0x16u);
    uint64_t v102 = v120;
    swift_arrayDestroy(v120, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v102, -1LL, -1LL);
    swift_slowDealloc(v91, -1LL, -1LL);

    v121(v86, v123);
  }

  else
  {
    v124(v87, v126);

    v48(v86, v123);
  }

  uint64_t v103 = (uint64_t)v119;
  uint64_t v104 = v126;
  v110(v119, v125, v126);
  sub_10000444C(v103, 0LL, 1LL, v104);
  id v105 = objc_allocWithZone(&OBJC_CLASS___DEAttachmentItem);
  sub_100009398(v103);
  if (v106)
  {
    [v54 close];

    v124(v125, v126);
  }

  else
  {
    __break(1u);
  }

uint64_t sub_1000086E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a2;
  v31[1] = a3;
  uint64_t v32 = a1;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)v31 - v10;
  __chkstk_darwin(v9);
  uint64_t v12 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v13 = [v12 defaultManager];
  id v14 = [v13 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v14);
  sub_10000A0C0();
  URL.appendingPathComponent(_:)(0xD000000000000022LL, v15);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v36 = v6;
  uint64_t v17 = v16(v11, v6);
  uint64_t v18 = UUID.init()(v17);
  uint64_t v19 = UUID.uuidString.getter(v18);
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v35);
  URL.appendingPathComponent(_:)(v19, v21);
  swift_bridgeObjectRelease(v21);
  id v22 = [v12 defaultManager];
  URL._bridgeToObjectiveC()(v23);
  uint64_t v25 = v24;
  id v37 = 0LL;
  LOBYTE(v21) = [v22 createDirectoryAtURL:v24 withIntermediateDirectories:1 attributes:0 error:&v37];

  id v26 = v37;
  if ((v21 & 1) != 0)
  {
    id v27 = v37;
    uint64_t v28 = v33;
    swift_bridgeObjectRetain(v33);
    URL.appendingPathComponent(_:isDirectory:)(v32, v28, 0LL);
    swift_bridgeObjectRelease(v28);
  }

  else
  {
    id v30 = v37;
    _convertNSErrorToError(_:)(v26);

    swift_willThrow();
  }

  sub_10000A06C();
  return sub_10000A0B4();
}

void sub_100008990(uint64_t a1, char a2)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  URL._bridgeToObjectiveC()(v6);
  uint64_t v8 = v7;
  [v5 initWithURL:v7 append:a2 & 1];

  uint64_t v9 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(a1, v9);
  sub_10000A09C();
}

Swift::OpaquePointer_optional __swiftcall Diagnostics.attachments(forParameters:)( Swift::OpaquePointer_optional forParameters)
{
  rawValue = forParameters.value._rawValue;
  uint64_t v3 = type metadata accessor for TranscriptAttachment(0LL);
  __chkstk_darwin(v3);
  id v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = v1 + OBJC_IVAR____TtC27IntelligenceFlowDiagnostics11Diagnostics_logger;
  swift_bridgeObjectRetain_n(rawValue, 2LL);
  uint64_t v7 = (os_log_s *)sub_10000A054();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v52 = v5;
    uint64_t v53 = v6;
    uint64_t v9 = (uint8_t *)sub_100006FF0(12LL);
    uint64_t v10 = (void *)sub_100006FF0(32LL);
    v55[0] = (uint64_t)v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    if (rawValue)
    {
      uint64_t v12 = (uint64_t)v10;
      uint64_t v13 = swift_bridgeObjectRetain(rawValue);
      uint64_t v14 = Dictionary.description.getter( v13,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
      unint64_t v16 = v15;
      swift_bridgeObjectRelease(rawValue);
      *(void *)&__int128 v56 = sub_1000095AC(v14, v16, v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, (char *)&v56 + 8, v9 + 4, v9 + 12);
      sub_10000A0A8();
      swift_bridgeObjectRelease(v16);
      _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "IntelligenceFlowDiagnostics: gathering attachments with parameters: %s",  v9,  0xCu);
      swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
      sub_100006F2C(v12);
      sub_100006F2C((uint64_t)v9);

      unint64_t v58 = (unint64_t)&_swiftEmptyArrayStorage;
      id v5 = v52;
      goto LABEL_5;
    }

    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  sub_10000A0A8();

  unint64_t v58 = (unint64_t)&_swiftEmptyArrayStorage;
  if (!rawValue) {
    goto LABEL_24;
  }
LABEL_5:
  v54[0] = 0xD00000000000002DLL;
  v54[1] = 0x800000010000A860LL;
  AnyHashable.init<A>(_:)(v55, v54, &type metadata for String, &protocol witness table for String);
  sub_100008FD8((uint64_t)v55, (uint64_t)rawValue, &v56);
  sub_100006CF0((uint64_t)v55);
  if (!v57)
  {
    sub_100009E7C((uint64_t)&v56, &qword_100010310);
LABEL_10:
    uint64_t v19 = (void *)sub_10000A054();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (sub_10000A05C(v20))
    {
      uint64_t v21 = (_WORD *)sub_100006FF0(2LL);
      *uint64_t v21 = 0;
      sub_10000A040((void *)&_mh_execute_header, v22, v23, "IntelligenceFlowDiagnostics: user did not give consent.");
      sub_100006F2C((uint64_t)v21);
    }

    uint64_t v24 = &_swiftEmptyArrayStorage;
    goto LABEL_13;
  }

  if (!swift_dynamicCast(v54, &v56, (char *)&type metadata for Any + 8, &type metadata for Bool, 6LL)
    || (v54[0] & 1) == 0)
  {
    goto LABEL_10;
  }

  sub_10000A0C0();
  Logger.init(subsystem:category:)(v17, v18, 0xD000000000000014LL, 0x800000010000A890LL);
  sub_100004848();
  uint64_t v27 = v26;
  uint64_t v28 = sub_100009570((uint64_t)v5);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v28);
  unint64_t v30 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v29 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v30 >= v29 >> 1) {
    sub_10000A014(v30 + 1, v29);
  }
  uint64_t v31 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v30, v27);
  specialized Array._endMutation()(v31);
  sub_10000A0C0();
  sub_100007070(v32, v33);
  uint64_t v35 = v34;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v34);
  unint64_t v37 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v36 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v37 >= v36 >> 1) {
    sub_10000A014(v37 + 1, v36);
  }
  uint64_t v38 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v37, v35);
  specialized Array._endMutation()(v38);
  sub_10000A0C0();
  sub_100007BF4(v39, v40);
  uint64_t v42 = v41;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v41);
  unint64_t v44 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v43 = *(void *)((v58 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v44 >= v43 >> 1) {
    sub_10000A014(v44 + 1, v43);
  }
  uint64_t v45 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v44, v42);
  specialized Array._endMutation()(v45);
  uint64_t v46 = (void *)sub_10000A054();
  os_log_type_t v47 = static os_log_type_t.default.getter();
  if (sub_10000A05C(v47))
  {
    uint64_t v48 = (_WORD *)sub_100006FF0(2LL);
    *uint64_t v48 = 0;
    sub_10000A040((void *)&_mh_execute_header, v49, v50, "IntelligenceFlowDiagnostics: done");
    sub_100006F2C((uint64_t)v48);
  }

  uint64_t v24 = (void *)v58;
LABEL_13:
  uint64_t v25 = sub_100009028((uint64_t)v24);
  swift_bridgeObjectRelease(v24);
  uint64_t v10 = v25;
LABEL_25:
  result.value._rawValue = v10;
  result.is_nil = v11;
  return result;
}

double sub_100008FD8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10000660C(a1), (v6 & 1) != 0))
  {
    sub_100009DC0(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

char *sub_100009028(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v13 = &_swiftEmptyArrayStorage;
  double result = sub_100009EB8(0LL, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * i + 32);
      }
      id v11 = v6;
      uint64_t v7 = sub_100009ED4(0LL, &qword_1000103A0, &OBJC_CLASS___DEAttachmentItem_ptr);
      swift_dynamicCast(v12, &v11, v7, (char *)&type metadata for Any + 8, 7LL);
      uint64_t v3 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0)
      {
        sub_100009EB8(0LL, v3[2] + 1LL, 1);
        uint64_t v3 = v13;
      }

      unint64_t v9 = v3[2];
      unint64_t v8 = v3[3];
      if (v9 >= v8 >> 1)
      {
        sub_100009EB8((char *)(v8 > 1), v9 + 1, 1);
        uint64_t v3 = v13;
      }

      v3[2] = v9 + 1;
      sub_100006D24(v12, &v3[4 * v9 + 4]);
    }

    return (char *)v3;
  }

  __break(1u);
  return result;
}

id Diagnostics.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id Diagnostics.init()()
{
  ObjectType = (objc_class *)swift_getObjectType(v0);
  Logger.init(subsystem:category:)(0xD000000000000036LL, 0x800000010000A7C0LL, 0x6C6172656E6547LL, 0xE700000000000000LL);
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "init");
}

id Diagnostics.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100009398(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = type metadata accessor for URL(0LL);
  id v6 = 0LL;
  if (sub_100004214(a1, 1LL, v4) != 1)
  {
    URL._bridgeToObjectiveC()(v5);
    id v6 = v7;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  }

  [v2 initWithPathURL:v6];

  sub_10000A09C();
}

char *sub_10000941C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }

  return __src;
}

uint64_t sub_1000094A0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3, a1);
    }
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

uint64_t sub_100009570(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranscriptAttachment(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000095AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  id v6 = sub_10000967C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009DC0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100009DC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100006D70(v12);
  return v7;
}

void *sub_10000967C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000097D0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      uint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    uint64_t result = sub_100009894(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }

  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_1000097D0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_100009894(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100009928(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100009AFC(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100009AFC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100009928(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    Swift::Int v4 = String.UTF8View._foreignCount()();
    if (v4) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }

  if ((a2 & 0x2000000000000000LL) != 0) {
    Swift::Int v4 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v5 = sub_100009A98(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  id v6 = v5;
  uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_100009A98(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_1000041D4(&qword_100010378);
  unint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100009AFC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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

  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_1000041D4(&qword_100010378);
    id v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    id v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100009C94(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_100009BD0(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100009BD0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_100009C94(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000LL) != 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }

  return __src;
}

uint64_t sub_100009D14()
{
  return type metadata accessor for Diagnostics(0LL);
}

uint64_t type metadata accessor for Diagnostics(uint64_t a1)
{
  uint64_t result = qword_100010368;
  if (!qword_100010368) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Diagnostics);
  }
  return result;
}

uint64_t sub_100009D54(uint64_t a1)
{
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 1LL, &v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100009DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100009E00()
{
  unint64_t result = qword_100010380;
  if (!qword_100010380)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AE3C, &type metadata for UIAttachmentError);
    atomic_store(result, (unint64_t *)&qword_100010380);
  }

  return result;
}

unint64_t sub_100009E3C()
{
  unint64_t result = qword_1000102F8;
  if (!qword_1000102F8)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_1000102F8);
  }

  return result;
}

uint64_t sub_100009E7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000041D4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

char *sub_100009EB8(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100009F0C(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

uint64_t sub_100009ED4(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

char *sub_100009F0C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
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
  if (v9)
  {
    uint64_t v10 = sub_1000041D4(&qword_1000103A8);
    id v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 32);
  }

  else
  {
    id v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_10000941C(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000094A0((unint64_t)v14, v8, (unint64_t)v13);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_100009FEC()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100009FF4(uint64_t a1)
{
  *(void *)(v3 - 160) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 160, v3 - 152, v2, v1);
}

uint64_t sub_10000A014@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a2 > 1, a1, 1LL);
}

uint64_t sub_10000A024()
{
  return swift_errorRetain(v0);
}

void sub_10000A02C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

void sub_10000A040(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_10000A054()
{
  return Logger.logObject.getter();
}

BOOL sub_10000A05C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000A06C()
{
  return v1(v0, *(void *)(v2 - 104));
}

uint64_t sub_10000A07C(uint64_t a1)
{
  return swift_arrayDestroy(v1, 1LL, a1);
}

BOOL sub_10000A08C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

  ;
}

uint64_t sub_10000A0A8()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

uint64_t sub_10000A0B4()
{
  return v2(v1, v0);
}

  ;
}