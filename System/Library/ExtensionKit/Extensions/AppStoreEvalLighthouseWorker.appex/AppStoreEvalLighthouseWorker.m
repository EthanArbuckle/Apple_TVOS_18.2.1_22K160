uint64_t sub_100001E80(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x65636E4F6E7572LL;
  }
  else {
    return 0x7453657069636572LL;
  }
}

BOOL sub_100001EC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100001ED8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100001F1C()
{
}

Swift::Int sub_100001F44(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100001F84()
{
  return sub_100001E80(*v0);
}

uint64_t sub_100001F8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100002F40(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100001FB0()
{
  return 0LL;
}

void sub_100001FBC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100001FC8(uint64_t a1)
{
  unint64_t v2 = sub_1000032CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100001FF0(uint64_t a1)
{
  unint64_t v2 = sub_1000032CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100002018(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v17 = a4;
  uint64_t v8 = sub_1000027A4((uint64_t *)&unk_1000080F0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_1000032A8(a1, v12);
  unint64_t v14 = sub_1000032CC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys,  &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys,  v14,  v12,  v13);
  char v19 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, a3, &v19, v8);
  if (!v4)
  {
    char v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v17 & 1, &v18, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_100002140@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100003038(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6 & 1;
  }

  return result;
}

uint64_t sub_100002170(void *a1)
{
  return sub_100002018(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_10000218C()
{
  return swift_task_switch(sub_1000021A0, 0LL, 0LL);
}

uint64_t sub_1000021A0()
{
  uint64_t v1 = MLHostResult.init(status:policy:)(0LL, 2LL);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_1000021E4()
{
  return swift_task_switch(sub_1000021F8, 0LL, 0LL);
}

uint64_t sub_1000021F8()
{
  uint64_t v1 = MLHostResult.init(status:policy:)(2LL, 1LL);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10000223C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_1000022D8;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000022D8()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100002320(uint64_t a1)
{
  uint64_t v2 = sub_100002D24(&qword_1000080C0, (uint64_t)"\r\v");
  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100002368()
{
  v3[0] = 0LL;
  v3[1] = 0xE000000000000000LL;
  char v4 = 0;
  unint64_t v0 = sub_100002AA4();
  unint64_t v1 = sub_100002AE8();
  return MLHostParameters.init(taskParameters:)(v3, &type metadata for AppStoreEvalLighthouseWorkerConfig, v0, v1);
}

unint64_t sub_1000023C0(unint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for Mirror(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v25 = &type metadata for AppStoreEvalLighthouseWorkerConfig;
  unint64_t v22 = a1;
  unint64_t v23 = a2;
  char v24 = a3;
  swift_bridgeObjectRetain(a2);
  uint64_t v10 = Mirror.init(reflecting:)(&v22);
  uint64_t v11 = Mirror.children.getter(v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v12 = sub_100002514(v11);
  swift_release(v11);
  unint64_t v22 = 0xD000000000000023LL;
  unint64_t v23 = 0x8000000100003C90LL;
  v21 = v12;
  uint64_t v13 = sub_1000027A4(&qword_1000080C8);
  unint64_t v14 = sub_100002D64();
  uint64_t v15 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v13, v14);
  int v17 = v16;
  swift_bridgeObjectRelease(v12);
  v18._countAndFlagsBits = v15;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v17);
  v19._countAndFlagsBits = 41LL;
  v19._object = (void *)0xE100000000000000LL;
  String.append(_:)(v19);
  return v22;
}

char *sub_100002514(uint64_t a1)
{
  uint64_t v2 = swift_retain();
  uint64_t v3 = dispatch thunk of _AnySequenceBox._makeIterator()(v2);
  uint64_t v4 = swift_release(a1);
  dispatch thunk of _AnyIteratorBoxBase.next()(v20, v4);
  if (*((void *)&v21 + 1))
  {
    uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      Swift::String v18 = (Swift::String)v20[0];
      v19[0] = v20[1];
      v19[1] = v21;
      uint64_t v7 = *((void *)&v20[0] + 1);
      if (*((void *)&v20[0] + 1))
      {
        uint64_t countAndFlagsBits = v18._countAndFlagsBits;
        uint64_t v16 = 0LL;
        unint64_t v17 = 0xE000000000000000LL;
        String.append(_:)(*(Swift::String *)(&v7 - 1));
        v9._uint64_t countAndFlagsBits = 8250LL;
        v9._object = (void *)0xE200000000000000LL;
        String.append(_:)(v9);
        _print_unlocked<A, B>(_:_:)( v19,  &v16,  (char *)&type metadata for Any + 8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        uint64_t v10 = v16;
        unint64_t v11 = v17;
        sub_100002DF4((uint64_t)&v18);
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_100002E34(0LL, *((void *)v5 + 2) + 1LL, 1, v5);
          uint64_t v5 = (char *)isUniquelyReferenced_nonNull_native;
        }

        unint64_t v13 = *((void *)v5 + 2);
        unint64_t v12 = *((void *)v5 + 3);
        if (v13 >= v12 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_100002E34((char *)(v12 > 1), v13 + 1, 1, v5);
          uint64_t v5 = (char *)isUniquelyReferenced_nonNull_native;
        }

        *((void *)v5 + 2) = v13 + 1;
        unint64_t v14 = &v5[16 * v13];
        *((void *)v14 + 4) = v10;
        *((void *)v14 + 5) = v11;
      }

      else
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_100002DF4((uint64_t)&v18);
      }

      dispatch thunk of _AnyIteratorBoxBase.next()(v20, isUniquelyReferenced_nonNull_native);
    }

    while (*((void *)&v21 + 1));
  }

  else
  {
    uint64_t v5 = (char *)&_swiftEmptyArrayStorage;
  }

  swift_release(v3);
  return v5;
}

unint64_t sub_1000026B0()
{
  return sub_1000023C0(*(void *)v0, *(void *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for AppStoreEvalLighthouseWorker(0LL);
  uint64_t v4 = sub_100002D24(&qword_100008000, (uint64_t)&unk_10000395C);
  static AppExtension.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for AppStoreEvalLighthouseWorker(uint64_t a1)
{
  uint64_t result = qword_100008100;
  if (!qword_100008100) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppStoreEvalLighthouseWorker);
  }
  return result;
}

uint64_t sub_100002764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_1000027A4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_1000027E4(uint64_t a1)
{
  uint64_t v2 = sub_1000027A4(&qword_100008008);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_10000281C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100002864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000028AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000028F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000293C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100002948);
}

uint64_t sub_100002948(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t sub_100002988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100002994);
}

uint64_t sub_100002994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000027A4(&qword_100008008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

void sub_1000029D8(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
  }
}

void sub_100002A40(uint64_t a1)
{
  if (!qword_100008068)
  {
    unint64_t v2 = sub_100002AA4();
    unint64_t v3 = sub_100002AE8();
    unint64_t v4 = type metadata accessor for MLHostParameters(a1, &type metadata for AppStoreEvalLighthouseWorkerConfig, v2, v3);
    if (!v5) {
      atomic_store(v4, (unint64_t *)&qword_100008068);
    }
  }

unint64_t sub_100002AA4()
{
  unint64_t result = qword_100008070;
  if (!qword_100008070)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000390C, &type metadata for AppStoreEvalLighthouseWorkerConfig);
    atomic_store(result, (unint64_t *)&qword_100008070);
  }

  return result;
}

unint64_t sub_100002AE8()
{
  unint64_t result = qword_100008078;
  if (!qword_100008078)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000038E4, &type metadata for AppStoreEvalLighthouseWorkerConfig);
    atomic_store(result, (unint64_t *)&qword_100008078);
  }

  return result;
}

uint64_t destroy for AppStoreEvalLighthouseWorkerConfig(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

uint64_t _s28AppStoreEvalLighthouseWorker34AppStoreEvalLighthouseWorkerConfigVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppStoreEvalLighthouseWorkerConfig(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v4);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for AppStoreEvalLighthouseWorkerConfig(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppStoreEvalLighthouseWorkerConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 17) = 1;
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

    *(_BYTE *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AppStoreEvalLighthouseWorkerConfig()
{
  return &type metadata for AppStoreEvalLighthouseWorkerConfig;
}

uint64_t sub_100002CAC()
{
  return sub_100002D24(&qword_100008000, (uint64_t)&unk_10000395C);
}

uint64_t sub_100002CD0(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100002D24(&qword_1000080C0, (uint64_t)"\r\v");
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

uint64_t sub_100002D24(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for AppStoreEvalLighthouseWorker(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100002D64()
{
  unint64_t result = qword_1000080D0;
  if (!qword_1000080D0)
  {
    uint64_t v1 = sub_100002DB0(&qword_1000080C8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000080D0);
  }

  return result;
}

uint64_t sub_100002DB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100002DF4(uint64_t a1)
{
  uint64_t v2 = sub_1000027A4(&qword_1000080D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

char *sub_100002E34(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_1000027A4(&qword_1000080E0);
      unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      unint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_1000031B4(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100002F40(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7453657069636572LL && a2 == 0xEC000000676E6972LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7453657069636572LL, 0xEC000000676E6972LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x65636E4F6E7572LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x65636E4F6E7572LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_100003038(void *a1)
{
  uint64_t v3 = sub_1000027A4(&qword_1000080E8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_1000032A8(a1, v7);
  unint64_t v9 = sub_1000032CC();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys,  &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_100003310(a1);
    swift_bridgeObjectRelease(0xE000000000000000LL);
  }

  else
  {
    char v13 = 0;
    uint64_t v8 = KeyedDecodingContainer.decode(_:forKey:)(&v13, v3);
    char v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100003310(a1);
  }

  return v8;
}

uint64_t sub_1000031B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void *sub_1000032A8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_1000032CC()
{
  unint64_t result = qword_100008390[0];
  if (!qword_100008390[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100003A60, &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys);
    atomic_store(result, qword_100008390);
  }

  return result;
}

uint64_t sub_100003310(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for AppStoreEvalLighthouseWorkerConfig.CodingKeys( _BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig.CodingKeys( unsigned __int8 *a1, unsigned int a2)
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

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AppStoreEvalLighthouseWorkerConfig.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000341C + 4 * byte_100003855[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100003450 + 4 * byte_100003850[v4]))();
}

uint64_t sub_100003450(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003458(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100003460LL);
  }
  return result;
}

uint64_t sub_10000346C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100003474LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100003478(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003480(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000348C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100003498(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreEvalLighthouseWorkerConfig.CodingKeys()
{
  return &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys;
}

unint64_t sub_1000034B8()
{
  unint64_t result = qword_1000084A0[0];
  if (!qword_1000084A0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100003A38, &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys);
    atomic_store(result, qword_1000084A0);
  }

  return result;
}

unint64_t sub_100003500()
{
  unint64_t result = qword_1000085B0;
  if (!qword_1000085B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000039A8, &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000085B0);
  }

  return result;
}

unint64_t sub_100003548()
{
  unint64_t result = qword_1000085B8[0];
  if (!qword_1000085B8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_1000039D0, &type metadata for AppStoreEvalLighthouseWorkerConfig.CodingKeys);
    atomic_store(result, qword_1000085B8);
  }

  return result;
}