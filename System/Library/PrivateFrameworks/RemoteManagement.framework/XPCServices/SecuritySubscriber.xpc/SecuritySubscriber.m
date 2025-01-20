int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  v3 = (void *)objc_opt_self(&OBJC_CLASS___RMConfigurationSubscriberClient);
  v4 = sub_100001640(&qword_100014BC0);
  v5 = swift_allocObject(v4, 40LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_10000D120;
  *(void *)(v5 + 32) = type metadata accessor for SecurityApplicator();
  sub_100001640(&qword_100014D40);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  v7 = type metadata accessor for SecurityStatus();
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:swift_getObjCClassFromMetadata(v7)];

  return 0;
}

uint64_t sub_100001640(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_100001680@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100001690(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for RMStoreScope()
{
  if (!qword_100014BB8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100010718);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100014BB8);
    }
  }
}

void sub_1000016F4()
{
  qword_100015300 = 0x7079547465737341LL;
  qword_100015308 = 0xE900000000000065LL;
}

void sub_10000171C()
{
  HIWORD(qword_100015318) = -4864;
}

void sub_10000174C()
{
  qword_100015320 = 0x76654C7473757254LL;
  qword_100015328 = 0xEA00000000006C65LL;
}

unint64_t sub_100001774()
{
  uint64_t v1 = sub_100001640(&qword_100014DB0);
  uint64_t inited = swift_initStackObject(v1, &v10);
  *(_OWORD *)(inited + 16) = xmmword_10000D1B0;
  if (qword_100014B90 != -1) {
    swift_once(&qword_100014B90, sub_1000016F4);
  }
  uint64_t v3 = qword_100015308;
  *(void *)(inited + 32) = qword_100015300;
  *(void *)(inited + 40) = v3;
  __int128 v12 = *v0;
  __int128 v4 = v12;
  *(void *)(inited + 72) = &type metadata for String;
  *(_OWORD *)(inited + 48) = v4;
  swift_bridgeObjectRetain(v3);
  sub_100008600((uint64_t)&v12);
  if (qword_100014B98 != -1) {
    swift_once(&qword_100014B98, sub_10000171C);
  }
  uint64_t v5 = qword_100015318;
  *(void *)(inited + 80) = qword_100015310;
  *(void *)(inited + 88) = v5;
  __int128 v11 = v0[1];
  __int128 v6 = v11;
  *(void *)(inited + 120) = &type metadata for Data;
  *(_OWORD *)(inited + 96) = v6;
  swift_bridgeObjectRetain(v5);
  sub_100008628((uint64_t)&v11);
  if (qword_100014BA0 != -1) {
    swift_once(&qword_100014BA0, sub_10000174C);
  }
  uint64_t v7 = qword_100015328;
  *(void *)(inited + 128) = qword_100015320;
  *(void *)(inited + 136) = v7;
  uint64_t v8 = *((unsigned __int8 *)v0 + 32);
  *(void *)(inited + 168) = &type metadata for Int;
  *(void *)(inited + 144) = v8;
  swift_bridgeObjectRetain(v7);
  return sub_100008B80(inited);
}

uint64_t sub_1000018D8()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100008484(v0, qword_100015330);
  sub_100008358(v0, (uint64_t)qword_100015330);
  uint64_t v5 = type metadata accessor for SecurityAdapter();
  uint64_t v1 = sub_100001640(&qword_100014D78);
  uint64_t v2 = String.init<A>(describing:)(&v5, v1);
  return Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010000E4A0LL, v2, v3);
}

void sub_10000196C(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, unint64_t *a4@<X8>)
{
  if (a3)
  {
    if (a3 == 1)
    {
      swift_errorRetain(a1);
      _StringGuts.grow(_:)(27LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      unint64_t v7 = sub_100008900();
      v8._countAndFlagsBits = RMAdapterError.underlyingErrorDescription(_:)( a1,  &type metadata for SecurityAdapter.AdapterError,  v7);
      object = v8._object;
      String.append(_:)(v8);
      swift_bridgeObjectRelease(object);
      sub_100008688(a1, (uint64_t)a2, 1);
      unint64_t v10 = 0xD000000000000019LL;
      unint64_t v11 = 0x800000010000E600LL;
      unint64_t v12 = 0xD00000000000001ELL;
      v13 = "Security.AssetResolutionFailed";
    }

    else
    {
      unint64_t v12 = 0xD000000000000015LL;
      unint64_t v10 = 0xD000000000000017LL;
      unint64_t v11 = 0x800000010000E640LL;
      v13 = "Security.AssetMissing";
    }

    unint64_t v15 = (unint64_t)(v13 - 32) | 0x8000000000000000LL;
  }

  else
  {
    _StringGuts.grow(_:)(18LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v14._countAndFlagsBits = a1;
    v14._object = a2;
    String.append(_:)(v14);
    unint64_t v12 = 0LL;
    unint64_t v15 = 0LL;
    unint64_t v10 = 0xD000000000000010LL;
    unint64_t v11 = 0x800000010000E660LL;
  }

  *a4 = v12;
  a4[1] = v15;
  a4[2] = v10;
  a4[3] = v11;
  a4[4] = 0LL;
}

__n128 sub_100001AE4@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v6;
  __n128 result = (__n128)v5[1];
  *(_OWORD *)a1 = v5[0];
  *(__n128 *)(a1 + 16) = result;
  *(void *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_100001B30(uint64_t a1)
{
  unint64_t v2 = sub_100008900();
  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100001B58(uint64_t a1)
{
  unint64_t v2 = sub_100008900();
  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_100001B8C(uint64_t a1)
{
  unint64_t v2 = sub_100008874();
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100001BB4(uint64_t a1)
{
  unint64_t v2 = sub_100008874();
  return Error<>._code.getter(a1, v2);
}

uint64_t SecurityAdapter.configurationClasses()()
{
  uint64_t v0 = sub_100001640(&qword_100014BC0);
  uint64_t v1 = swift_allocObject(v0, 48LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_10000D1C0;
  *(void *)(v1 + 32) = sub_1000085C8(0LL, &qword_100014BC8, &OBJC_CLASS___RMModelSecurityCertificateDeclaration_ptr);
  *(void *)(v1 + 40) = sub_1000085C8(0LL, &qword_100014BD0, &OBJC_CLASS___RMModelSecurityIdentityDeclaration_ptr);
  return v1;
}

uint64_t SecurityAdapter.allDeclarationKeys(for:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100014BE0 + dword_100014BE0);
  uint64_t v3 = (void *)swift_task_alloc(unk_100014BE4);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100001D60;
  return v5(a1);
}

uint64_t sub_100001D60(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

void *sub_100001DB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  __n128 result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    uint64_t v4 = sub_100004038(a1);
    int v6 = v5;
    uint64_t v7 = a1 + 64;
    __n128 result = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
    id v21 = result;
    uint64_t v8 = 0LL;
    while ((v4 & 0x8000000000000000LL) == 0 && v4 < 1LL << *(_BYTE *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v22 = v8;
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 16 * v4 + 8);
      swift_bridgeObjectRetain(v11);
      NSString v12 = String._bridgeToObjectiveC()();
      id v13 = [v21 newDeclarationKey:v12];
      swift_bridgeObjectRelease(v11);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v14 = *((void *)&_swiftEmptyArrayStorage + 2);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      uint64_t v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v13);
      __n128 result = (void *)specialized ContiguousArray._endMutation()(v15);
      int64_t v9 = 1LL << *(_BYTE *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v16 = *(void *)(v7 + 8 * v10);
      if ((v16 & (1LL << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v17 = v16 & (-2LL << (v4 & 0x3F));
      if (v17)
      {
        int64_t v9 = __clz(__rbit64(v17)) | v4 & 0xFFFFFFFFFFFFFFC0LL;
      }

      else
      {
        unint64_t v18 = v10 + 1;
        unint64_t v19 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v19)
        {
          unint64_t v20 = *(void *)(v7 + 8 * v18);
          if (v20)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v20)) + (v18 << 6);
          }

          else
          {
            while (v19 - 2 != v10)
            {
              unint64_t v20 = *(void *)(a1 + 80 + 8 * v10++);
              if (v20)
              {
                unint64_t v18 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }

      uint64_t v8 = v22 + 1;
      uint64_t v4 = v9;
      if (v22 + 1 == v2) {
        return &_swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }

  return result;
}

uint64_t sub_100002108(uint64_t a1, void *aBlock)
{
  *(void *)(v2 + 16) = _Block_copy(aBlock);
  int v6 = (uint64_t (*)(uint64_t))((char *)&dword_100014BE0 + dword_100014BE0);
  uint64_t v4 = (void *)swift_task_alloc(unk_100014BE4);
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100002174;
  return v6(a1);
}

uint64_t sub_100002174(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 24);
  uint64_t v7 = *v2;
  swift_task_dealloc(v6);
  if (v3)
  {
    uint64_t v8 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    unint64_t v10 = (void *)v8;
  }

  else
  {
    sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    sub_100008300();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v8 = 0LL;
    unint64_t v10 = isa;
  }

  uint64_t v11 = *(void (***)(void, void, void))(v5 + 16);
  ((void (**)(void, Class, uint64_t))v11)[2](v11, isa, v8);

  _Block_release(v11);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t SecurityAdapter.applyConfiguration(_:replace:scope:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100014BF0 + dword_100014BF0);
  uint64_t v7 = (void *)swift_task_alloc(unk_100014BF4);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100008954;
  return v9(a1, a2, a3);
}

uint64_t sub_1000022CC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100001640(&qword_100014D70);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    id v11 = a2;
    uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a2);
    uint64_t v14 = v13;

    uint64_t v15 = *(uint64_t **)(*(void *)(v3 + 64) + 40LL);
    *uint64_t v15 = v12;
    v15[1] = v14;
    return swift_continuation_throwingResume(v3);
  }

uint64_t sub_1000024B4(void *a1, void *a2, uint64_t a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  _OWORD v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  uint64_t v10 = unk_100014BF4;
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100014BF0 + dword_100014BF0);
  id v11 = a1;
  id v12 = a2;
  id v13 = a5;
  uint64_t v14 = (void *)swift_task_alloc(v10);
  v5[6] = v14;
  *uint64_t v14 = v5;
  v14[1] = sub_100002560;
  return v16((uint64_t)v11, (uint64_t)a2, a3);
}

uint64_t sub_100002560(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 48);
  id v8 = *(void **)(*v2 + 24);
  uint64_t v7 = *(void **)(*v2 + 32);
  int64_t v9 = *(void **)(*v2 + 16);
  uint64_t v10 = *v2;
  swift_task_dealloc(v6);

  if (v3)
  {
    uint64_t v11 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    id v13 = (void *)v11;
  }

  else
  {
    sub_1000085C8(0LL, &qword_100014D08, &OBJC_CLASS___RMModelStatusReason_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v11 = 0LL;
    id v13 = isa;
  }

  uint64_t v14 = *(void (***)(void, void, void))(v5 + 40);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t SecurityAdapter.remove(_:scope:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100014C00 + dword_100014C00);
  uint64_t v5 = (void *)swift_task_alloc(unk_100014C04);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000026BC;
  return v7(a1, a2);
}

uint64_t sub_1000026BC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100002838(void *a1, uint64_t a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v8 = unk_100014C04;
  id v13 = (uint64_t (*)(id, uint64_t))((char *)&dword_100014C00 + dword_100014C00);
  id v9 = a1;
  id v10 = a4;
  uint64_t v11 = (void *)swift_task_alloc(v8);
  v4[5] = v11;
  *uint64_t v11 = v4;
  v11[1] = sub_1000028D0;
  return v13(v9, a2);
}

uint64_t sub_1000028D0()
{
  uint64_t v2 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v3 = *(void **)(*v1 + 24);
  uint64_t v5 = *v1;
  swift_task_dealloc(v2);

  uint64_t v6 = *(void *)(v5 + 32);
  if (v0)
  {
    uint64_t v7 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }

  else
  {
    (*(void (**)(void, void))(v6 + 16))(*(void *)(v5 + 32), 0LL);
  }

  _Block_release(*(const void **)(v5 + 32));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

id SecurityAdapter.declarationKey(forConfiguration:)(uint64_t a1)
{
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 newDeclarationKeyWithSubscriberIdentifier:v3 reference:a1];

  return v4;
}

uint64_t sub_100002A80(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    return swift_continuation_throwingResume(*(void *)(a1 + 32));
  }
  uint64_t v4 = sub_100001640(&qword_100014D70);
  uint64_t v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0LL, 0LL);
  *uint64_t v6 = a2;
  id v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

uint64_t SecurityAdapter.configurationUI(forConfiguration:scope:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100014C10 + dword_100014C10);
  NSString v3 = (void *)swift_task_alloc(unk_100014C14);
  *(void *)(v1 + 16) = v3;
  *NSString v3 = v1;
  v3[1] = sub_100002B54;
  return v5(a1);
}

uint64_t sub_100002B54(char a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(*v3 + 16);
  uint64_t v7 = *v3;
  swift_task_dealloc(v6);
  if (v2)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = a1 & 1;
    uint64_t v8 = a2;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
}

uint64_t sub_100002CF4(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v7 = unk_100014C14;
  id v12 = (uint64_t (*)(uint64_t))((char *)&dword_100014C10 + dword_100014C10);
  id v8 = a1;
  id v9 = a4;
  id v10 = (void *)swift_task_alloc(v7);
  v4[5] = v10;
  *id v10 = v4;
  v10[1] = sub_100002D80;
  return v12((uint64_t)v8);
}

uint64_t sub_100002D80(char a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v8 = *(void *)(*v3 + 32);
  uint64_t v7 = *(void *)(*v3 + 40);
  id v10 = *(void **)(*v3 + 16);
  id v9 = *(void **)(*v3 + 24);
  uint64_t v11 = *v3;
  swift_task_dealloc(v7);

  id v12 = *(const void **)(v11 + 32);
  if (v4)
  {
    id v13 = (void *)_convertErrorToNSError(_:)(v4);
    swift_errorRelease(v4);
    (*(void (**)(const void *, void, void, void *))(v8 + 16))(v12, 0LL, 0LL, v13);

    _Block_release(v12);
  }

  else
  {
    (*(void (**)(const void *, void, void *, void))(v8 + 16))(v12, a1 & 1, a2, 0LL);
    _Block_release(v12);
  }

  return (*(uint64_t (**)(void))(v11 + 8))();
}

id SecurityAdapter.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id SecurityAdapter.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAdapter();
  return objc_msgSendSuper2(&v2, "init");
}

id SecurityAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100002F1C(Swift::Int *a1, void *a2)
{
  NSString v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v2);
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      uint64_t v32 = v9;
      uint64_t v10 = sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v33;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v24 = sub_1000031B8(v7, result + 1);
    Swift::Int v33 = v24;
    unint64_t v25 = *(void *)(v24 + 16);
    if (*(void *)(v24 + 24) <= v25)
    {
      uint64_t v30 = v25 + 1;
      id v31 = v8;
      sub_1000033AC(v30);
      uint64_t v26 = v33;
    }

    else
    {
      uint64_t v26 = v24;
      id v27 = v8;
    }

    sub_100003648((uint64_t)v8, v26);
    uint64_t v29 = *v3;
    *NSString v3 = v26;
  }

  else
  {
    Swift::Int v13 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v14 = NSObject._rawHashValue(seed:)(v13);
    uint64_t v15 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v16 = v14 & ~v15;
    if (((*(void *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
    {
      sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
      char v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        uint64_t v22 = *(void **)(*(void *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        id v23 = v22;
        return 0LL;
      }

      uint64_t v19 = ~v15;
      while (1)
      {
        unint64_t v16 = (v16 + 1) & v19;
        if (((*(void *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
          break;
        }
        id v20 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
        char v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v33 = *v3;
    *NSString v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_1000036C8((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    *NSString v3 = v33;
  }

  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_1000031B8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100001640(&qword_100014DB8);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_1000033AC(v16 + 1);
          uint64_t v4 = v23;
        }

        uint64_t v9 = v22;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v11 = v4 + 56;
        uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v13 = result & ~v12;
        unint64_t v14 = v13 >> 6;
        if (((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          unint64_t v15 = __clz(__rbit64((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v17 = 0;
          unint64_t v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v19 = v14 == v18;
            if (v14 == v18) {
              unint64_t v14 = 0LL;
            }
            v17 |= v19;
            uint64_t v20 = *(void *)(v11 + 8 * v14);
          }

          while (v20 == -1);
          unint64_t v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }

        *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
        *(void *)(*(void *)(v4 + 48) + 8 * v15) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()();
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v4;
}

Swift::Int sub_1000033AC(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100001640(&qword_100014DB8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v30 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v8 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1LL << v7);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v3 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }

      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_36;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_36;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                objc_super v2 = v30;
                uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
                if (v29 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v29;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v14 >= v11) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v14 = v20;
            }
          }
        }

LABEL_26:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(v3 + 48) + 8 * v17);
      Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }

        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *objc_super v2 = v6;
  return result;
}

    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    uint64_t v21 = *(void *)(v6 + 40);
    uint64_t v22 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    Swift::Int result = NSObject._rawHashValue(seed:)(v21);
    unint64_t v23 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v24 = result & ~v23;
    char v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      unint64_t v26 = 0;
      BOOL v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        uint64_t v28 = v25 == v27;
        if (v25 == v27) {
          char v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }

      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    Swift::Int result = swift_release_n(v3, 2LL);
    objc_super v2 = v30;
    goto LABEL_38;
  }

  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

unint64_t sub_100003648(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1000036C8(uint64_t a1, unint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1000033AC(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_10000384C();
      goto LABEL_14;
    }

    sub_1000039F4(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    id v14 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
    char v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }

    else
    {
      uint64_t v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
        char v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

LABEL_14:
  uint64_t v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * a2) = a1;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1LL);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v22;
  }
}

id sub_10000384C()
{
  uint64_t v1 = v0;
  sub_100001640(&qword_100014DB8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    id v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

LABEL_30:
  __break(1u);
  return result;
}

  id result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

Swift::Int sub_1000039F4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100001640(&qword_100014DB8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v30 = v2;
  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100003C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  unint64_t v7 = sub_100009D98(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0) {
    return 0LL;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  uint64_t v14 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000A740();
    uint64_t v10 = v14;
  }

  swift_bridgeObjectRelease(*(void *)(*(void *)(v10 + 48) + 16 * v7 + 8));
  uint64_t v11 = *(void *)(*(void *)(v10 + 56) + 8 * v7);
  sub_100003D38(v7, v10);
  uint64_t v12 = *v3;
  *uint64_t v3 = v10;
  swift_bridgeObjectRelease(v12);
  return v11;
}

unint64_t sub_100003D38(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    Swift::Int result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        Hasher.init(_seed:)(v26, *(void *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        Swift::Int v12 = Hasher._finalize()();
        Swift::Int result = swift_bridgeObjectRelease(v11);
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }

        else if (v13 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *unint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          int64_t v18 = (void *)(v17 + 8 * v3);
          unint64_t v19 = (void *)(v17 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
          {
            *int64_t v18 = *v19;
            int64_t v3 = v6;
          }
        }

LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    int64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1LL << v3) - 1;
  }

  else
  {
    int64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1LL << result) - 1;
  }

  *int64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1LL);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_100003F0C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100009D98(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      int64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = v18[7];
        uint64_t result = swift_bridgeObjectRelease(*(void *)(v19 + 8 * v12));
        *(void *)(v19 + 8 * v12) = a1;
        return result;
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10000A740();
      goto LABEL_7;
    }

    sub_10000A080(v15, a4 & 1);
    unint64_t v21 = sub_100009D98(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_10000A690(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100004038(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4LL;
  }
  unint64_t v8 = v7 - 4;
  uint64_t v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

__n128 sub_1000040E8@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  if (qword_100014B90 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_3;
    }
LABEL_9:
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    goto LABEL_10;
  }

  swift_once(&qword_100014B90, sub_1000016F4);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = qword_100015308;
  uint64_t v5 = qword_100015300;
  swift_bridgeObjectRetain(qword_100015308);
  unint64_t v6 = sub_100009D98(v5, v4);
  if ((v7 & 1) == 0)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    swift_bridgeObjectRelease(v4);
    goto LABEL_10;
  }

  sub_10000858C(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v23);
  swift_bridgeObjectRelease(v4);
  if (!*((void *)&v24 + 1))
  {
LABEL_10:
    sub_10000850C((uint64_t)&v23);
    goto LABEL_11;
  }

  if (swift_dynamicCast(&v22, &v23, (char *)&type metadata for Any + 8, &type metadata for String, 6LL))
  {
    unint64_t v9 = *((void *)&v22 + 1);
    unint64_t v8 = v22;
    goto LABEL_12;
  }

LABEL_11:
  unint64_t v8 = 0LL;
  unint64_t v9 = 0xE000000000000000LL;
LABEL_12:
  if (qword_100014B98 == -1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_14;
    }
LABEL_21:
    __int128 v23 = 0u;
    __int128 v24 = 0u;
LABEL_22:
    sub_10000850C((uint64_t)&v23);
    goto LABEL_23;
  }

  swift_once(&qword_100014B98, sub_10000171C);
  if (!*(void *)(a1 + 16)) {
    goto LABEL_21;
  }
LABEL_14:
  uint64_t v10 = qword_100015318;
  uint64_t v11 = qword_100015310;
  swift_bridgeObjectRetain(qword_100015318);
  unint64_t v12 = sub_100009D98(v11, v10);
  if ((v13 & 1) != 0)
  {
    sub_10000858C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)&v23);
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
  }

  swift_bridgeObjectRelease(v10);
  if (!*((void *)&v24 + 1)) {
    goto LABEL_22;
  }
  if (swift_dynamicCast(&v22, &v23, (char *)&type metadata for Any + 8, &type metadata for Data, 6LL))
  {
    __int128 v14 = v22;
    goto LABEL_24;
  }

  char v26 = *(void **)(v0 + 144);
  unint64_t v27 = objc_opt_self(*v20);
  BOOL v28 =  objc_msgSend( (id)swift_dynamicCastObjCClassUnconditional(v15, v27, 0, 0, 0),  "payloadCredentialAssetReference");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v30 = v29;

  id v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v30);
  uint64_t v32 = [v26 assetWithIdentifier:v31];
  *(void *)(v0 + 248) = v32;

  if (!v32)
  {
    v45 = (os_log_s *)Logger.logObject.getter(v33);
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, (os_log_type_t)v46))
    {
      v47 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v46, "Invalid asset for configurationUI", v47, 2u);
      swift_slowDealloc(v47, -1LL, -1LL);
    }

    v48 = sub_100008370();
    v49 = swift_allocError(&type metadata for SecurityAdapter.AdapterError, v48, 0LL, 0LL);
    *(void *)v50 = 0xD000000000000021LL;
    v51 = 0x800000010000E300LL;
LABEL_18:
    *(void *)(v50 + 8) = v51;
    *(_BYTE *)(v50 + 16) = 0;
    swift_willThrow(v49);
    v52 = *(void *)(v0 + 216);
    v53 = *(void *)(v0 + 224);
    v54 = *(void *)(v0 + 192);
    v55 = *(void *)(v0 + 168);

    swift_task_dealloc(v53);
    swift_task_dealloc(v52);
    swift_task_dealloc(v54);
    swift_task_dealloc(v55);
    return (*(uint64_t (**)(void))(v0 + 8))(0LL);
  }

  v34 = (void *)v0;
  v35 = v0 + 120;
  v36 = v32;
  v37 = [v36 declarationType];
  v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
  v40 = v39;

  v41 = [(id)objc_opt_self(RMModelAssetCredentialACMEDeclaration) registeredIdentifier];
  v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
  v44 = v43;

  if (v42 != v38 || v44 != v40)
  {
    v57 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, v38, v40, 0LL);
    swift_bridgeObjectRelease(v44);
    if ((v57 & 1) != 0)
    {
      swift_bridgeObjectRelease(v40);
      goto LABEL_21;
    }

    v77 =  [(id)objc_opt_self(RMModelAssetCredentialCertificateDeclaration) registeredIdentifier];
    v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77);
    v80 = v79;

    if (v78 == v38 && v80 == v40)
    {
      swift_bridgeObjectRelease_n(v40, 2LL);
    }

    else
    {
      v81 = _stringCompareWithSmolCheck(_:_:expecting:)(v78, v80, v38, v40, 0LL);
      swift_bridgeObjectRelease(v80);
      if ((v81 & 1) == 0)
      {
        v83 =  [(id)objc_opt_self(RMModelAssetCredentialIdentityDeclaration) registeredIdentifier];
        v84 = static String._unconditionallyBridgeFromObjectiveC(_:)(v83);
        v86 = v85;

        if (v84 == v38 && v86 == v40)
        {
          swift_bridgeObjectRelease_n(v40, 2LL);
        }

        else
        {
          v87 = _stringCompareWithSmolCheck(_:_:expecting:)(v84, v86, v38, v40, 0LL);
          swift_bridgeObjectRelease(v86);
          if ((v87 & 1) == 0)
          {
            v100 =  [(id)objc_opt_self(RMModelAssetCredentialSCEPDeclaration) registeredIdentifier];
            v101 = static String._unconditionallyBridgeFromObjectiveC(_:)(v100);
            v103 = v102;

            if (v101 != v38 || v103 != v40)
            {
              v104 = _stringCompareWithSmolCheck(_:_:expecting:)(v101, v103, v38, v40, 0LL);
              swift_bridgeObjectRelease(v40);
              swift_bridgeObjectRelease(v103);
              v60 = 0xD00000000000001CLL;
              if ((v104 & 1) != 0) {
                v60 = 0xD000000000000019LL;
              }
              v59 = 0x800000010000E410LL;
              if ((v104 & 1) == 0) {
                v59 = 0x800000010000E330LL;
              }
              goto LABEL_42;
            }

            swift_bridgeObjectRelease_n(v40, 2LL);
            v58 = "UI.Value.Description-SCEP";
            goto LABEL_22;
          }

          swift_bridgeObjectRelease(v40);
        }

        v60 = 0xD00000000000001DLL;
        v82 = "UI.Value.Description-Identity";
LABEL_41:
        v59 = (unint64_t)(v82 - 32) | 0x8000000000000000LL;
        goto LABEL_42;
      }

      swift_bridgeObjectRelease(v40);
    }

    v60 = 0xD000000000000020LL;
    v82 = "UI.Value.Description-Certificate";
    goto LABEL_41;
  }

  swift_bridgeObjectRelease_n(v40, 2LL);
LABEL_21:
  v58 = "UI.Value.Description-ACME";
LABEL_22:
  v59 = (unint64_t)(v58 - 32) | 0x8000000000000000LL;
  v60 = 0xD000000000000019LL;
LABEL_42:
  v34[32] = v60;
  v34[33] = v59;
  v88 = (void *)v34[18];
  v89 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
  v90 = String._bridgeToObjectiveC()();
  v91 = [v88 store];
  v92 = [v89 newDeclarationKeyWithSubscriberIdentifier:v90 store:v91 declaration:v36];
  v34[34] = v92;

  v93 = [v88 store];
  v34[35] = v93;
  v94 = [v92 key];
  if (!v94)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    v96 = v95;
    v94 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v96);
  }

  v97 = v34 + 2;
  v34[36] = v94;
  v34[7] = v35;
  v34[2] = v34;
  v34[3] = sub_1000074A8;
  v98 = swift_continuation_init(v34 + 2, 1LL);
  v34[10] = _NSConcreteStackBlock;
  v99 = v34 + 10;
  v99[1] = 0x40000000LL;
  v99[2] = sub_1000022CC;
  v99[3] = &unk_100010928;
  v99[4] = v98;
  [v93 certificatePersistentRefForAssetKey:v94 completionHandler:v99];
  return swift_continuation_await(v97);
}

LABEL_23:
  __int128 v14 = xmmword_10000D1D0;
LABEL_24:
  __n128 v21 = (__n128)v14;
  if (qword_100014BA0 != -1)
  {
    swift_once(&qword_100014BA0, sub_10000174C);
    if (*(void *)(a1 + 16)) {
      goto LABEL_26;
    }
LABEL_31:
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    goto LABEL_32;
  }

  if (!*(void *)(a1 + 16)) {
    goto LABEL_31;
  }
LABEL_26:
  uint64_t v15 = qword_100015328;
  uint64_t v16 = qword_100015320;
  swift_bridgeObjectRetain(qword_100015328);
  unint64_t v17 = sub_100009D98(v16, v15);
  if ((v18 & 1) != 0)
  {
    sub_10000858C(*(void *)(a1 + 56) + 32 * v17, (uint64_t)&v23);
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
  }

  swift_bridgeObjectRelease(v15);
LABEL_32:
  swift_bridgeObjectRelease(a1);
  if (!*((void *)&v24 + 1))
  {
    sub_10000850C((uint64_t)&v23);
    goto LABEL_38;
  }

  if ((swift_dynamicCast(&v22, &v23, (char *)&type metadata for Any + 8, &type metadata for Int, 6LL) & 1) == 0)
  {
LABEL_38:
    char v19 = 0;
    goto LABEL_39;
  }

  if ((void)v22 == 2LL) {
    char v19 = 2;
  }
  else {
    char v19 = (void)v22 == 1LL;
  }
LABEL_39:
  a2->n128_u64[0] = v8;
  a2->n128_u64[1] = v9;
  __n128 result = v21;
  a2[1] = v21;
  a2[2].n128_u8[0] = v19;
  return result;
}

uint64_t sub_1000043C8(uint64_t a1)
{
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v4 = sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
  unint64_t v5 = sub_100008300();
  uint64_t result = Set.init(minimumCapacity:)(v3, v4, v5);
  uint64_t v15 = result;
  if (v2)
  {
    if (a1 < 0) {
      uint64_t v8 = a1;
    }
    else {
      uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    uint64_t result = swift_bridgeObjectRelease(a1);
    if (!v7) {
      return v15;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v7) {
      return v15;
    }
  }

  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_100002F1C((Swift::Int *)&v14, v10);
      }
    }

    else
    {
      uint64_t v11 = (void **)(a1 + 32);
      do
      {
        unint64_t v12 = *v11++;
        sub_100002F1C((Swift::Int *)&v14, v12);

        --v7;
      }

      while (v7);
    }

    return v15;
  }

  __break(1u);
  return result;
}

uint64_t sub_100004520(uint64_t a1)
{
  *(void *)(v1 + 96) = a1;
  return swift_task_switch(sub_100004538, 0LL, 0LL);
}

uint64_t sub_100004538()
{
  uint64_t v1 = *(void *)(v0 + 96);
  id v2 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  if (v1) {
    unint64_t v3 = 0x800000010000E4C0LL;
  }
  else {
    unint64_t v3 = 0x800000010000E560LL;
  }
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  id v5 = [v2 objectForKey:v4];

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)(v5);
    swift_unknownObjectRelease(v5);
  }

  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }

  sub_1000084C4(v0 + 48, v0 + 16);
  if (*(void *)(v0 + 40))
  {
    unint64_t v6 = (uint64_t *)(v0 + 80);
    uint64_t v7 = sub_100001640(&qword_100014D98);
    if ((swift_dynamicCast(v0 + 80, v0 + 16, (char *)&type metadata for Any + 8, v7, 6LL) & 1) != 0)
    {
      uint64_t v8 = *v6;
      unint64_t v9 = sub_100001DB4(*v6);
      swift_bridgeObjectRelease(v8);
      uint64_t v10 = (void *)sub_1000043C8((uint64_t)v9);
      swift_bridgeObjectRelease(v9);
      return (*(uint64_t (**)(void *))(v0 + 8))(v10);
    }
  }

  else
  {
    sub_10000850C(v0 + 16);
  }

  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000LL) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    sub_10000AAD8((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v10 = v12;
  }

  else
  {
    uint64_t v10 = &_swiftEmptySetSingleton;
  }

  return (*(uint64_t (**)(void *))(v0 + 8))(v10);
}

uint64_t sub_100004704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  return swift_task_switch(sub_100004720, 0LL, 0LL);
}

uint64_t sub_100004720()
{
  uint64_t v1 = *(void *)(v0 + 120);
  int v2 = *(unsigned __int8 *)(v1 + 32);
  if (!*(_BYTE *)(v1 + 32)) {
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  uint64_t v3 = v0 + 16;
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 136);
  unint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreKeychainController);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 144) = isa;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_100004820;
  uint64_t v8 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  unint64_t v9 = (void *)(v0 + 80);
  v9[1] = 0x40000000LL;
  v9[2] = sub_100002A80;
  v9[3] = &unk_100010940;
  v9[4] = v8;
  [v6 removeTrustForCertificateRef:isa configurationKey:v5 fullTrust:v2 == 2 scope:v4 completionHandler:v9];
  return swift_continuation_await(v3);
}

uint64_t sub_100004820()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 152LL) = v1;
  if (v1) {
    int v2 = sub_100008950;
  }
  else {
    int v2 = sub_100008948;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100004880(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 152) = a1;
  *(void *)(v2 + 160) = a2;
  return swift_task_switch(sub_100004898, 0LL, 0LL);
}

uint64_t sub_100004898()
{
  if (qword_100014BA8 != -1) {
    swift_once(&qword_100014BA8, sub_1000018D8);
  }
  uint64_t v2 = (void **)(v0 + 152);
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 168) = sub_100008358(v3, (uint64_t)qword_100015330);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 152);
  uint64_t v48 = v0 + 56;
  if (v6)
  {
    v46 = (uint64_t *)(v0 + 144);
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v47 = v0;
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v50 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    id v10 = [v7 key];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = (void **)(v0 + 152);
    unint64_t v14 = v13;

    uint64_t *v46 = sub_100009758(v11, v14, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v46, v12, v8 + 4, v8 + 12);

    unint64_t v15 = v14;
    uint64_t v2 = v12;
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Removing configuration with key: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v0 = v47;
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v16 = *(void *)(v0 + 160);
  unint64_t v17 = (void *)objc_opt_self(&OBJC_CLASS___NSUserDefaults);
  *(void *)(v0 + 176) = v17;
  id v18 = [v17 standardUserDefaults];
  if (v16) {
    unint64_t v19 = 0x800000010000E4C0LL;
  }
  else {
    unint64_t v19 = 0x800000010000E560LL;
  }
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  id v21 = [v18 objectForKey:v20];

  if (v21)
  {
    _bridgeAnyObjectToAny(_:)(v21);
    swift_unknownObjectRelease(v21);
  }

  else
  {
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
  }

  sub_1000084C4(v0 + 88, v48);
  if (!*(void *)(v0 + 80))
  {
    uint64_t v23 = sub_10000850C(v48);
LABEL_19:
    v35 = (os_log_s *)Logger.logObject.getter(v23);
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Invalid user defaults", v37, 2u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    unint64_t v38 = sub_100008370();
    swift_allocError(&type metadata for SecurityAdapter.AdapterError, v38, 0LL, 0LL);
    unint64_t v40 = 0x800000010000E4E0LL;
    *(void *)uint64_t v39 = 0xD000000000000015LL;
    goto LABEL_22;
  }

  uint64_t v22 = sub_100001640(&qword_100014D98);
  uint64_t v23 = swift_dynamicCast(v0 + 136, v48, (char *)&type metadata for Any + 8, v22, 6LL);
  if ((v23 & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v24 = *(void *)(v0 + 136);
  *(void *)(v0 + 184) = v24;
  if (!v24) {
    goto LABEL_19;
  }
  uint64_t v25 = *v2;
  *(void *)(v0 + 120) = v24;
  swift_bridgeObjectRetain(v24);
  id v26 = [v25 key];
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v29 = v28;

  if (*(void *)(v24 + 16))
  {
    unint64_t v30 = sub_100009D98(v27, v29);
    if ((v31 & 1) != 0)
    {
      uint64_t v32 = *(void *)(*(void *)(v24 + 56) + 8 * v30);
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease(v24);
      sub_1000040E8(v32, (__n128 *)(v0 + 16));
      v49 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100014D88 + dword_100014D88);
      Swift::Int v33 = (void *)swift_task_alloc(unk_100014D8C);
      *(void *)(v0 + 192) = v33;
      *Swift::Int v33 = v0;
      v33[1] = sub_100004E2C;
      return v49(v0 + 16, *(void *)(v0 + 152), *(void *)(v0 + 160));
    }
  }

  swift_bridgeObjectRelease(v29);
  uint64_t v41 = swift_bridgeObjectRelease(v24);
  v42 = (os_log_s *)Logger.logObject.getter(v41);
  os_log_type_t v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v44 = 0;
    swift_bridgeObjectRelease(*(void *)(v0 + 120));
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Invalid remove: no persistent ref to remove", v44, 2u);
    swift_slowDealloc(v44, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v24);
  }

  unint64_t v45 = sub_100008370();
  swift_allocError(&type metadata for SecurityAdapter.AdapterError, v45, 0LL, 0LL);
  unint64_t v40 = 0x800000010000E500LL;
  *(void *)uint64_t v39 = 0xD00000000000002BLL;
LABEL_22:
  *(void *)(v39 + 8) = v40;
  *(_BYTE *)(v39 + 16) = 0;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004E2C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 192);
  *(void *)(*v1 + 200) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 184));
    uint64_t v4 = sub_10000523C;
  }

  else
  {
    uint64_t v4 = sub_100004E98;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100004E98()
{
  uint64_t v1 = (void *)(v0 + 16);
  uint64_t v2 = &SecurityAdapter;
  id v3 = [*(id *)(v0 + 152) key];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  uint64_t v7 = sub_100003C6C(v4, v6);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  if (v7)
  {
    if (*(void *)(v0 + 160)) {
      unint64_t v8 = 0x800000010000E4C0LL;
    }
    else {
      unint64_t v8 = 0x800000010000E560LL;
    }
    id v9 = [*(id *)(v0 + 176) standardUserDefaults];
    uint64_t v10 = *(void *)(v0 + 120);
    sub_100001640(&qword_100014D90);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v10);
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    [v9 setObject:isa forKey:v12];

    sub_10000854C((void *)(v0 + 16));
    unint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  }

  else
  {
    unint64_t v14 = (os_log_s *)Logger.logObject.getter(*(id *)(v0 + 152));
    os_log_type_t v15 = static os_log_type_t.error.getter();
    BOOL v16 = os_log_type_enabled(v14, v15);
    unint64_t v17 = *(void **)(v0 + 152);
    if (v16)
    {
      id v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v37 = swift_slowAlloc(32LL, -1LL);
      uint64_t v19 = v37;
      *(_DWORD *)id v18 = 136446210;
      id v20 = [v17 key];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v23 = v22;

      uint64_t v2 = &SecurityAdapter;
      *(void *)(v0 + 128) = sub_100009758(v21, v23, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease(v23);
      uint64_t v24 = *(void *)(v0 + 120);

      swift_bridgeObjectRelease(v24);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Invalid remove: no configuration key: %{public}s", v18, 0xCu);
      swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v25 = v19;
      uint64_t v1 = (void *)(v0 + 16);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease(*(void *)(v0 + 120));
    }

    id v26 = *(void **)(v0 + 152);
    uint64_t v37 = 0LL;
    unint64_t v38 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(40LL);
    swift_bridgeObjectRelease(v38);
    uint64_t v37 = 0xD000000000000026LL;
    unint64_t v38 = 0x800000010000E530LL;
    id v27 = [v26 (SEL)v2[264].count];
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v30 = v29;

    v31._countAndFlagsBits = v28;
    v31._object = v30;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(v30);
    uint64_t v32 = v37;
    unint64_t v33 = v38;
    unint64_t v34 = sub_100008370();
    swift_allocError(&type metadata for SecurityAdapter.AdapterError, v34, 0LL, 0LL);
    *(void *)uint64_t v35 = v32;
    *(void *)(v35 + 8) = v33;
    *(_BYTE *)(v35 + 16) = 0;
    swift_willThrow();
    sub_10000854C(v1);
    unint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  }

  return v13();
}

uint64_t sub_10000523C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005270(void *a1, id a2)
{
  id v3 = [a2 declarationType];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  id v7 =  [(id)objc_opt_self(RMModelAssetCredentialCertificateDeclaration) registeredIdentifier];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n(v6, 2LL);
  }

  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v8, v10, 0LL);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
    uint64_t result = 0LL;
    if ((v12 & 1) == 0) {
      return result;
    }
  }

  if ([a1 type] == (id)1) {
    return 2LL;
  }
  if ([a1 type]) {
    return 1LL;
  }
  return 2LL;
}

uint64_t sub_100005388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[16] = a2;
  v3[17] = a3;
  v3[15] = a1;
  return swift_task_switch(sub_1000053A4, 0LL, 0LL);
}

uint64_t sub_1000053A4()
{
  uint64_t v1 = *(void *)(v0 + 120);
  int v2 = *(unsigned __int8 *)(v1 + 32);
  if (!*(_BYTE *)(v1 + 32)) {
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  uint64_t v3 = v0 + 16;
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreKeychainController);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)(v0 + 144) = isa;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_1000054A4;
  uint64_t v8 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  uint64_t v9 = (void *)(v0 + 80);
  v9[1] = 0x40000000LL;
  v9[2] = sub_100002A80;
  v9[3] = &unk_100010970;
  v9[4] = v8;
  [v6 setTrustForCertificateRef:isa configurationKey:v5 fullTrust:v2 == 2 scope:v4 completionHandler:v9];
  return swift_continuation_await(v3);
}

uint64_t sub_1000054A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 152LL) = v1;
  if (v1) {
    int v2 = sub_100005538;
  }
  else {
    int v2 = sub_100005504;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100005504()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005538()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[33] = a2;
  v3[34] = a3;
  v3[32] = a1;
  return swift_task_switch(sub_100005594, 0LL, 0LL);
}

void sub_100005594()
{
  uint64_t v1 = *(void **)(v0 + 264);
  if (v1)
  {
    uint64_t v2 = unk_100014C04;
    v58 = (void (*)(uint64_t, uint64_t))((char *)&dword_100014C00 + dword_100014C00);
    id v3 = v1;
    uint64_t v4 = (void *)swift_task_alloc(v2);
    *(void *)(v0 + 280) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_100005BD8;
    v58((uint64_t)v3, *(void *)(v0 + 272));
    return;
  }

  uint64_t v5 = *(void *)(v0 + 256);
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 newDeclarationKeyWithSubscriberIdentifier:v7 reference:v5];
  *(void *)(v0 + 288) = v8;

  if (qword_100014BA8 != -1) {
    swift_once(&qword_100014BA8, sub_1000018D8);
  }
  uint64_t v9 = (id *)(v0 + 256);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 296) = sub_100008358(v10, (uint64_t)qword_100015330);
  id v11 = v8;
  char v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v57 = swift_slowAlloc(32LL, -1LL);
    uint64_t v59 = v57;
    *(_DWORD *)unint64_t v14 = 136446210;
    id v15 = [v11 key];
    BOOL v16 = v11;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    unint64_t v19 = v18;

    uint64_t v9 = (id *)(v0 + 256);
    uint64_t v20 = v17;
    id v11 = v16;
    *(void *)(v0 + 248) = sub_100009758(v20, v19, &v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 248, v0 + 256, v14 + 4, v14 + 12);

    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Applying configuration with key: %{public}s", v14, 0xCu);
    swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {
  }

  id v21 = [*v9 declaration];
  id v22 = [v21 declarationType];

  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v25 = v24;

  id v26 = [(id)objc_opt_self(RMModelSecurityIdentityDeclaration) registeredIdentifier];
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
  uint64_t v29 = v28;

  if (v23 == v27 && v25 == v29)
  {
    swift_bridgeObjectRelease_n(v25, 2LL);
LABEL_12:
    Swift::String v31 = "com.apple.managed.identities";
    goto LABEL_14;
  }

  char v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v27, v29, 0LL);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v29);
  if ((v30 & 1) != 0) {
    goto LABEL_12;
  }
  Swift::String v31 = "com.apple.managed.certificates";
LABEL_14:
  unint64_t v32 = (unint64_t)(v31 - 32) | 0x8000000000000000LL;
  id v33 = [*v9 assets];
  if (!v33)
  {
    uint64_t v36 = v32;
LABEL_29:
    uint64_t v50 = swift_bridgeObjectRelease(v36);
    v51 = (os_log_s *)Logger.logObject.getter(v50);
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Missing asset reference", v53, 2u);
      swift_slowDealloc(v53, -1LL, -1LL);
    }

    unint64_t v54 = sub_100008370();
    uint64_t v55 = swift_allocError(&type metadata for SecurityAdapter.AdapterError, v54, 0LL, 0LL);
    *(void *)uint64_t v56 = 0LL;
    *(void *)(v56 + 8) = 0LL;
    *(_BYTE *)(v56 + 16) = 2;
    swift_willThrow(v55);

    (*(void (**)(void))(v0 + 8))();
    return;
  }

  unint64_t v34 = v33;
  uint64_t v35 = sub_1000085C8(0LL, &qword_100014DA0, &OBJC_CLASS___RMModelDeclarationBase_ptr);
  uint64_t v36 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);

  if ((unint64_t)v36 >> 62)
  {
    if (v36 < 0) {
      uint64_t v48 = v36;
    }
    else {
      uint64_t v48 = v36 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v36);
    uint64_t v49 = _CocoaArrayWrapper.endIndex.getter(v48);
    swift_bridgeObjectRelease(v36);
    if (v49) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }

  if (!*(void *)((v36 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_28:
    swift_bridgeObjectRelease(v32);
    goto LABEL_29;
  }

LABEL_17:
  if ((v36 & 0xC000000000000001LL) != 0)
  {
    id v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v36);
  }

  else
  {
    if (!*(void *)((v36 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
      return;
    }

    id v37 = *(id *)(v36 + 32);
  }

  unint64_t v38 = v37;
  *(void *)(v0 + 304) = v37;
  swift_bridgeObjectRelease(v36);
  NSString v39 = [v38 declarationIdentifier];
  if (!v39)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v41 = v40;
    NSString v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
  }

  uint64_t v42 = v0 + 16;
  *(void *)(v0 + 312) = v39;
  uint64_t v43 = *(void *)(v0 + 256);
  v44 = (void *)objc_opt_self(&OBJC_CLASS___RMAssetResolverController);
  NSString v45 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 320) = v45;
  swift_bridgeObjectRelease(v32);
  *(void *)(v0 + 56) = v0 + 224;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_100006220;
  uint64_t v46 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  uint64_t v47 = (void *)(v0 + 80);
  v47[1] = 0x40000000LL;
  v47[2] = sub_1000022CC;
  v47[3] = &unk_100010958;
  v47[4] = v46;
  [v44 resolveKeychainAsset:v43 assetIdentifier:v39 accessGroup:v45 completionHandler:v47];
  swift_continuation_await(v42);
}

      swift_unknownObjectRelease(v12);
      uint64_t v1 = v43;
      uint64_t v5 = v45;
      if (v9 == v45) {
        return;
      }
    }
  }

  id v26 = 0LL;
  uint64_t v42 = v1 + 32;
  v44 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v26 != v44)
  {
    uint64_t v27 = v4[5];
    uint64_t v28 = *(id *)(v42 + 8 * v26);
    uint64_t v29 = NSObject._rawHashValue(seed:)(v27);
    char v30 = -1LL << *((_BYTE *)v4 + 32);
    Swift::String v31 = v29 & ~v30;
    unint64_t v32 = v31 >> 6;
    id v33 = *(void *)&v8[8 * (v31 >> 6)];
    unint64_t v34 = 1LL << v31;
    if (((1LL << v31) & v33) != 0)
    {
      sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      uint64_t v35 = *(id *)(v4[6] + 8 * v31);
      uint64_t v36 = static NSObject.== infix(_:_:)();

      if ((v36 & 1) != 0)
      {
LABEL_30:

        goto LABEL_31;
      }

      id v37 = ~v30;
      while (1)
      {
        Swift::String v31 = (v31 + 1) & v37;
        unint64_t v32 = v31 >> 6;
        id v33 = *(void *)&v8[8 * (v31 >> 6)];
        unint64_t v34 = 1LL << v31;
        if ((v33 & (1LL << v31)) == 0) {
          break;
        }
        unint64_t v38 = *(id *)(v4[6] + 8 * v31);
        NSString v39 = static NSObject.== infix(_:_:)();

        if ((v39 & 1) != 0) {
          goto LABEL_30;
        }
      }
    }

    *(void *)&v8[8 * v32] = v34 | v33;
    *(void *)(v4[6] + 8 * v31) = v28;
    uint64_t v40 = v4[2];
    id v11 = __OFADD__(v40, 1LL);
    uint64_t v41 = v40 + 1;
    if (v11) {
      goto LABEL_44;
    }
    v4[2] = v41;
LABEL_31:
    if (++v26 == v45) {
      return;
    }
  }

uint64_t sub_100005BD8()
{
  if (v0)
  {
    swift_errorRelease(v0);
    uint64_t v2 = sub_100008944;
  }

  else
  {
    uint64_t v2 = sub_100005C44;
  }

  return swift_task_switch(v2, 0LL, 0LL);
}

void sub_100005C44()
{
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 newDeclarationKeyWithSubscriberIdentifier:v3 reference:v1];
  *(void *)(v0 + 288) = v4;

  if (qword_100014BA8 != -1) {
    swift_once(&qword_100014BA8, sub_1000018D8);
  }
  uint64_t v5 = (id *)(v0 + 256);
  uint64_t v6 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 296) = sub_100008358(v6, (uint64_t)qword_100015330);
  id v7 = v4;
  id v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v53 = swift_slowAlloc(32LL, -1LL);
    uint64_t v54 = v53;
    *(_DWORD *)uint64_t v10 = 136446210;
    id v11 = [v7 key];
    char v12 = v7;
    uint64_t v13 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
    unint64_t v15 = v14;

    uint64_t v5 = (id *)(v0 + 256);
    uint64_t v16 = v13;
    id v7 = v12;
    *(void *)(v0 + 248) = sub_100009758(v16, v15, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 248, v0 + 256, v10 + 4, v10 + 12);

    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Applying configuration with key: %{public}s", v10, 0xCu);
    swift_arrayDestroy(v53, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v53, -1LL, -1LL);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  else
  {
  }

  id v17 = [*v5 declaration];
  id v18 = [v17 declarationType];

  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
  uint64_t v21 = v20;

  id v22 = [(id)objc_opt_self(RMModelSecurityIdentityDeclaration) registeredIdentifier];
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v25 = v24;

  if (v19 == v23 && v21 == v25)
  {
    swift_bridgeObjectRelease_n(v21, 2LL);
LABEL_10:
    uint64_t v27 = "com.apple.managed.identities";
    goto LABEL_12;
  }

  char v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v21, v23, v25, 0LL);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v25);
  if ((v26 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v27 = "com.apple.managed.certificates";
LABEL_12:
  unint64_t v28 = (unint64_t)(v27 - 32) | 0x8000000000000000LL;
  id v29 = [*v5 assets];
  if (!v29)
  {
    uint64_t v32 = v28;
LABEL_27:
    uint64_t v46 = swift_bridgeObjectRelease(v32);
    uint64_t v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Missing asset reference", v49, 2u);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    unint64_t v50 = sub_100008370();
    uint64_t v51 = swift_allocError(&type metadata for SecurityAdapter.AdapterError, v50, 0LL, 0LL);
    *(void *)uint64_t v52 = 0LL;
    *(void *)(v52 + 8) = 0LL;
    *(_BYTE *)(v52 + 16) = 2;
    swift_willThrow(v51);

    (*(void (**)(void))(v0 + 8))();
    return;
  }

  char v30 = v29;
  uint64_t v31 = sub_1000085C8(0LL, &qword_100014DA0, &OBJC_CLASS___RMModelDeclarationBase_ptr);
  uint64_t v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v30, v31);

  if ((unint64_t)v32 >> 62)
  {
    if (v32 < 0) {
      uint64_t v44 = v32;
    }
    else {
      uint64_t v44 = v32 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v32);
    uint64_t v45 = _CocoaArrayWrapper.endIndex.getter(v44);
    swift_bridgeObjectRelease(v32);
    if (v45) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }

  if (!*(void *)((v32 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_26:
    swift_bridgeObjectRelease(v28);
    goto LABEL_27;
  }

LABEL_15:
  if ((v32 & 0xC000000000000001LL) != 0)
  {
    id v33 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v32);
  }

  else
  {
    if (!*(void *)((v32 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
      return;
    }

    id v33 = *(id *)(v32 + 32);
  }

  unint64_t v34 = v33;
  *(void *)(v0 + 304) = v33;
  swift_bridgeObjectRelease(v32);
  NSString v35 = [v34 declarationIdentifier];
  if (!v35)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v37 = v36;
    NSString v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v37);
  }

  uint64_t v38 = v0 + 16;
  *(void *)(v0 + 312) = v35;
  uint64_t v39 = *(void *)(v0 + 256);
  uint64_t v40 = (void *)objc_opt_self(&OBJC_CLASS___RMAssetResolverController);
  NSString v41 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 320) = v41;
  swift_bridgeObjectRelease(v28);
  *(void *)(v0 + 56) = v0 + 224;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_100006220;
  uint64_t v42 = swift_continuation_init(v0 + 16, 1LL);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  uint64_t v43 = (void *)(v0 + 80);
  v43[1] = 0x40000000LL;
  v43[2] = sub_1000022CC;
  v43[3] = &unk_100010958;
  v43[4] = v42;
  [v40 resolveKeychainAsset:v39 assetIdentifier:v35 accessGroup:v41 completionHandler:v43];
  swift_continuation_await(v38);
}

uint64_t sub_100006220()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 328LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000068C0;
  }
  else {
    uint64_t v2 = sub_100006280;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100006280()
{
  uint64_t v2 = *(void **)(v0 + 312);
  uint64_t v1 = *(void **)(v0 + 320);
  NSString v3 = *(void **)(v0 + 304);
  id v4 = *(void **)(v0 + 256);
  uint64_t v6 = *(void *)(v0 + 224);
  unint64_t v5 = *(void *)(v0 + 232);
  *(void *)(v0 + 336) = v6;
  *(void *)(v0 + 344) = v5;
  sub_1000083B4(v6, v5);

  id v7 = [v3 declarationType];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  *(void *)(v0 + 352) = v10;
  id v11 = [v4 store];
  id v12 = [v4 declaration];
  LOBYTE(v3) = sub_100005270(v11, v3);

  *(void *)(v0 + 120) = v8;
  *(void *)(v0 + 128) = v10;
  *(void *)(v0 + 136) = v6;
  *(void *)(v0 + 144) = v5;
  *(_BYTE *)(v0 + 152) = (_BYTE)v3;
  unint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100014DA8 + dword_100014DA8);
  uint64_t v13 = (void *)swift_task_alloc(unk_100014DAC);
  *(void *)(v0 + 360) = v13;
  void *v13 = v0;
  v13[1] = sub_1000063B8;
  return v15(v0 + 120, *(void *)(v0 + 288), *(void *)(v0 + 272));
}

uint64_t sub_1000063B8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 360LL);
  *(void *)(*(void *)v1 + 368LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    NSString v3 = sub_100006848;
  }
  else {
    NSString v3 = sub_10000641C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000641C()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___NSUserDefaults);
  id v3 = [v2 standardUserDefaults];
  if (v1) {
    unint64_t v4 = 0x800000010000E4C0LL;
  }
  else {
    unint64_t v4 = 0x800000010000E560LL;
  }
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  id v6 = [v3 objectForKey:v5];

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(v6);
  }

  else
  {
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 176) = 0u;
  }

  id v7 = (unint64_t *)(v0 + 240);
  sub_1000084C4(v0 + 160, v0 + 192);
  id v38 = v2;
  if (!*(void *)(v0 + 216))
  {
    sub_10000850C(v0 + 192);
    goto LABEL_12;
  }

  uint64_t v8 = sub_100001640(&qword_100014D98);
  if ((swift_dynamicCast(v0 + 240, v0 + 192, (char *)&type metadata for Any + 8, v8, 6LL) & 1) == 0)
  {
LABEL_12:
    *id v7 = 0LL;
    goto LABEL_13;
  }

  unint64_t v9 = *v7;
  if (*v7)
  {
LABEL_14:
    uint64_t v13 = *(void *)(v0 + 336);
    unint64_t v35 = *(void *)(v0 + 344);
    uint64_t v36 = *(void *)(v0 + 352);
    uint64_t v37 = *(void **)(v0 + 304);
    unint64_t v14 = *(void **)(v0 + 288);
    swift_bridgeObjectRetain(v9);
    id v15 = [v14 key];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    unint64_t v19 = sub_100001774();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
    sub_100003F0C(v19, v16, v18, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    id v21 = [v38 standardUserDefaults];
    sub_100001640(&qword_100014D90);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9);
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    [v21 setObject:isa forKey:v23];

    sub_1000083F8(v13, v35);
    swift_bridgeObjectRelease(v36);

    sub_1000083F8(v13, v35);
    swift_bridgeObjectRelease(*(void *)(v0 + 240));
    return (*(uint64_t (**)(void *))(v0 + 8))(_swiftEmptyArrayStorage);
  }

LABEL_13:
  unint64_t v10 = sub_100008CA8((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v11 = *v7;
  *id v7 = v10;
  uint64_t v12 = swift_bridgeObjectRelease(v11);
  unint64_t v9 = *v7;
  if (*v7) {
    goto LABEL_14;
  }
  uint64_t v25 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Invalid user defaults", v27, 2u);
    swift_slowDealloc(v27, -1LL, -1LL);
  }

  unint64_t v29 = *(void *)(v0 + 344);
  uint64_t v28 = *(void *)(v0 + 352);
  uint64_t v30 = *(void *)(v0 + 336);
  uint64_t v31 = *(void **)(v0 + 304);
  uint64_t v32 = *(void **)(v0 + 288);

  unint64_t v33 = sub_100008370();
  swift_allocError(&type metadata for SecurityAdapter.AdapterError, v33, 0LL, 0LL);
  *(void *)uint64_t v34 = 0xD000000000000015LL;
  *(void *)(v34 + 8) = 0x800000010000E4E0LL;
  *(_BYTE *)(v34 + 16) = 0;
  swift_willThrow();
  sub_1000083F8(v30, v29);
  swift_bridgeObjectRelease(v28);

  sub_1000083F8(v30, v29);
  swift_bridgeObjectRelease(*(void *)(v0 + 240));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

    uint64_t result = sub_1000099E0(a5, a6);
    *a1 = v13;
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

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

uint64_t sub_100006848()
{
  unint64_t v1 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 336);
  unint64_t v4 = *(void **)(v0 + 304);
  NSString v5 = *(void **)(v0 + 288);
  sub_1000083F8(v3, v1);

  swift_bridgeObjectRelease(v2);
  sub_1000083F8(v3, v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000068C0()
{
  unint64_t v1 = *(void **)(v0 + 320);
  uint64_t v2 = *(void **)(v0 + 312);
  ((void (*)(void))swift_willThrow)();

  unint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Failed asset resolution", v6, 2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v0 + 328);
  uint64_t v8 = *(void **)(v0 + 304);
  unint64_t v9 = *(void **)(v0 + 288);

  unint64_t v10 = sub_100008370();
  swift_allocError(&type metadata for SecurityAdapter.AdapterError, v10, 0LL, 0LL);
  *(void *)uint64_t v11 = v7;
  *(void *)(v11 + 8) = 0LL;
  *(_BYTE *)(v11 + 16) = 1;
  uint64_t v12 = swift_errorRetain(v7);
  swift_willThrow(v12);

  swift_errorRelease(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000069D8(uint64_t a1)
{
  v1[18] = a1;
  uint64_t v2 = type metadata accessor for Date.FormatStyle.TimeStyle(0LL);
  v1[19] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[20] = v3;
  v1[21] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Date.FormatStyle.DateStyle(0LL);
  v1[22] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[23] = v5;
  v1[24] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Date(0LL);
  v1[25] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v1[26] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[27] = swift_task_alloc(v8);
  v1[28] = swift_task_alloc(v8);
  return swift_task_switch(sub_100006A98, 0LL, 0LL);
}

uint64_t sub_100006A98()
{
  if (qword_100014BA8 != -1) {
    swift_once(&qword_100014BA8, sub_1000018D8);
  }
  unint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 232) = sub_100008358(v2, (uint64_t)qword_100015330);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void **)(v0 + 144);
  uint64_t v7 = &SecurityAdapter;
  if (v5)
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v105 = swift_slowAlloc(32LL, -1LL);
    uint64_t v106 = v105;
    *(_DWORD *)unint64_t v8 = 136446210;
    id v9 = [v6 declaration];
    id v10 = [v9 declarationIdentifier];

    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    unint64_t v13 = v12;

    *(void *)(v0 + 136) = sub_100009758(v11, v13, &v106);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v8 + 4, v8 + 12);

    unint64_t v14 = v13;
    uint64_t v7 = &SecurityAdapter;
    swift_bridgeObjectRelease(v14);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Get configuration UI for: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v105, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v105, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  id v15 = [*(id *)(v0 + 144) (SEL)v7[257].count];
  *(void *)(v0 + 240) = v15;
  id v16 = [v15 declarationType];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v19 = v18;

  uint64_t v20 = &OBJC_CLASS___RMModelSecurityIdentityDeclaration_ptr;
  id v21 = [(id)objc_opt_self(RMModelSecurityIdentityDeclaration) registeredIdentifier];
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  uint64_t v24 = v23;

  if (v22 == v17 && v24 == v19) {
    goto LABEL_8;
  }
  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v24, v17, v19, 0LL);
  swift_bridgeObjectRelease(v24);
  if ((v25 & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v20 = &OBJC_CLASS___RMModelSecurityCertificateDeclaration_ptr;
  id v61 = [(id)objc_opt_self(RMModelSecurityCertificateDeclaration) registeredIdentifier];
  uint64_t v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
  uint64_t v64 = v63;

  if (v62 == v17 && v64 == v19)
  {
LABEL_8:
    swift_bridgeObjectRelease(v19);
LABEL_10:
    swift_bridgeObjectRelease(v19);
    goto LABEL_11;
  }

  char v65 = _stringCompareWithSmolCheck(_:_:expecting:)(v62, v64, v17, v19, 0LL);
  swift_bridgeObjectRelease(v19);
  uint64_t v66 = swift_bridgeObjectRelease(v64);
  if ((v65 & 1) == 0)
  {
    v67 = (os_log_s *)Logger.logObject.getter(v66);
    os_log_type_t v68 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v69 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "Invalid configuration for configuration UI", v69, 2u);
      swift_slowDealloc(v69, -1LL, -1LL);
    }

    uint64_t v106 = 0LL;
    unint64_t v107 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(30LL);
    swift_bridgeObjectRelease(v107);
    uint64_t v106 = 0xD00000000000001CLL;
    unint64_t v107 = 0x800000010000E2E0LL;
    id v70 = [v15 declarationType];
    uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)(v70);
    v73 = v72;

    v74._countAndFlagsBits = v71;
    v74._object = v73;
    String.append(_:)(v74);
    swift_bridgeObjectRelease(v73);
    uint64_t v75 = v106;
    unint64_t v51 = v107;
    unint64_t v76 = sub_100008370();
    uint64_t v49 = swift_allocError(&type metadata for SecurityAdapter.AdapterError, v76, 0LL, 0LL);
    *(void *)uint64_t v50 = v75;
    goto LABEL_18;
  }

uint64_t sub_1000074A8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 296LL) = v1;
  if (v1) {
    uint64_t v2 = sub_100007DA8;
  }
  else {
    uint64_t v2 = sub_100007508;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100007508()
{
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 120);
  unint64_t v4 = *(void *)(v0 + 128);

  sub_1000083B4(v3, v4);
  id v5 = [v2 store];
  id v6 = [v5 scope];

  BOOL v7 = v6 == (id)1;
  id v8 = [v2 store];
  id v9 = [v8 personaIdentifier];

  if (v9)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v12 = v11;
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v12 = 0LL;
  }

  type metadata accessor for ManagedKeychainPublic(0LL);
  unint64_t v13 = (void *)dispatch thunk of static ManagedKeychainPublic.copyCertificate(persistentRef:scope:persona:)( v3,  v4,  v7,  v10,  v12);
  swift_bridgeObjectRelease(v12);
  unint64_t v14 = v13;
  CFStringRef v15 = SecCertificateCopySubjectSummary(v14);
  if (v15)
  {
    id v16 = (__CFString *)v15;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    unint64_t v19 = v18;
  }

  else
  {
    uint64_t v17 = 0LL;
    unint64_t v19 = 0xE000000000000000LL;
  }

  uint64_t result = SecCertificateCopyIssuerSummary(v14);
  if (result)
  {
    id v21 = (void *)result;
    unint64_t v22 = 0xEE00736572697078LL;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    uint64_t v97 = v24;
    uint64_t v98 = v23;

    v99 = v14;
    unint64_t v100 = v4;
    uint64_t v101 = v3;
    uint64_t v103 = v17;
    unint64_t v102 = v19;
    if (SecCertificateNotValidAfter(v14) == 0.0)
    {
      unint64_t v83 = 0xE000000000000000LL;
      uint64_t v84 = 0LL;
    }

    else
    {
      uint64_t v26 = *(void *)(v0 + 216);
      uint64_t v25 = *(void *)(v0 + 224);
      uint64_t v28 = *(void *)(v0 + 200);
      uint64_t v27 = *(void *)(v0 + 208);
      unint64_t v29 = 0xEE00736572697078LL;
      uint64_t v30 = *(void *)(v0 + 192);
      uint64_t v95 = *(void *)(v0 + 184);
      uint64_t v31 = *(void *)(v0 + 168);
      uint64_t v104 = *(void *)(v0 + 176);
      uint64_t v32 = *(void *)(v0 + 160);
      uint64_t v93 = *(void *)(v0 + 152);
      uint64_t v33 = Date.init(timeIntervalSinceReferenceDate:)();
      static Date.now.getter(v33);
      unint64_t v34 = sub_10000843C();
      char v35 = dispatch thunk of static Comparable.< infix(_:_:)(v26, v25, v28, v34);
      id v36 = *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8);
      uint64_t v37 = v36(v26, v28);
      if ((v35 & 1) == 0) {
        unint64_t v29 = 0xEE00646572697078LL;
      }
      uint64_t v38 = static Date.FormatStyle.DateStyle.abbreviated.getter(v37);
      static Date.FormatStyle.TimeStyle.shortened.getter(v38);
      uint64_t v39 = Date.formatted(date:time:)(v30, v31);
      unint64_t v83 = v40;
      uint64_t v84 = v39;
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v93);
      uint64_t v41 = v30;
      unint64_t v22 = v29;
      (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v41, v104);
      v36(v25, v28);
    }

    unint64_t v94 = v22;
    NSString v96 = String._bridgeToObjectiveC()();
    uint64_t v42 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreLocalizable);
    NSString v43 = String._bridgeToObjectiveC()();
    NSString v44 = [v42 string:v43];

    if (!v44)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
      uint64_t v46 = v45;
      NSString v44 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v46);
    }

    uint64_t v47 = *(void *)(v0 + 264);
    uint64_t v85 = v44;
    uint64_t v86 = *(void **)(v0 + 248);
    char v87 = *(void **)(v0 + 240);
    uint64_t v88 = *(void *)(v0 + 224);
    v89 = *(void **)(v0 + 272);
    uint64_t v90 = *(void *)(v0 + 216);
    uint64_t v91 = *(void *)(v0 + 192);
    uint64_t v92 = *(void *)(v0 + 168);
    uint64_t v48 = sub_100001640(&qword_100014D58);
    uint64_t v49 = swift_allocObject(v48, 64LL, 7LL);
    *(_OWORD *)(v49 + 16) = xmmword_10000D1E0;
    uint64_t v50 = sub_100001640(&qword_100014D60);
    uint64_t v51 = swift_allocObject(v50, 64LL, 7LL);
    *(_OWORD *)(v51 + 16) = xmmword_10000D1C0;
    NSString v52 = String._bridgeToObjectiveC()();
    id v53 = [v42 string:v52];

    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
    uint64_t v56 = v55;

    *(void *)(v51 + 32) = v54;
    *(void *)(v51 + 40) = v56;
    NSString v57 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v47);
    id v58 = [v42 string:v57];

    uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    uint64_t v61 = v60;

    *(void *)(v51 + 48) = v59;
    *(void *)(v51 + 56) = v61;
    *(void *)(v49 + 32) = v51;
    uint64_t v62 = swift_allocObject(v50, 64LL, 7LL);
    *(_OWORD *)(v62 + 16) = xmmword_10000D1C0;
    NSString v63 = String._bridgeToObjectiveC()();
    id v64 = [v42 string:v63];

    uint64_t v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
    uint64_t v67 = v66;

    *(void *)(v62 + 32) = v65;
    *(void *)(v62 + 40) = v67;
    *(void *)(v62 + 48) = v103;
    *(void *)(v62 + 56) = v102;
    *(void *)(v49 + 40) = v62;
    uint64_t v68 = swift_allocObject(v50, 64LL, 7LL);
    *(_OWORD *)(v68 + 16) = xmmword_10000D1C0;
    NSString v69 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v94);
    id v70 = [v42 string:v69];

    uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)(v70);
    uint64_t v73 = v72;

    *(void *)(v68 + 32) = v71;
    *(void *)(v68 + 40) = v73;
    *(void *)(v68 + 48) = v84;
    *(void *)(v68 + 56) = v83;
    *(void *)(v49 + 48) = v68;
    uint64_t v74 = swift_allocObject(v50, 64LL, 7LL);
    *(_OWORD *)(v74 + 16) = xmmword_10000D1C0;
    uint64_t v75 = (void *)objc_opt_self(&OBJC_CLASS___RMConfigurationUIDetails);
    NSString v76 = String._bridgeToObjectiveC()();
    id v77 = [v42 string:v76];

    uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77);
    uint64_t v80 = v79;

    *(void *)(v74 + 32) = v78;
    *(void *)(v74 + 40) = v80;
    *(void *)(v74 + 48) = v98;
    *(void *)(v74 + 56) = v97;
    *(void *)(v49 + 56) = v74;
    sub_100001640(&qword_100014D68);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v49);
    id v82 = [v75 configurationUIWithTitle:v96 description:v85 details:isa];

    sub_1000083F8(v101, v100);
    sub_1000083F8(v101, v100);

    swift_task_dealloc(v88);
    swift_task_dealloc(v90);
    swift_task_dealloc(v91);
    swift_task_dealloc(v92);
    return (*(uint64_t (**)(uint64_t, id))(v0 + 8))(1LL, v82);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100007DA8(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 288);
  uint64_t v2 = *(void *)(v1 + 296);
  unint64_t v4 = *(void **)(v1 + 280);
  uint64_t v5 = *(void *)(v1 + 264);
  swift_willThrow(a1);
  swift_errorRelease(v2);
  swift_bridgeObjectRelease(v5);

  BOOL v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Invalid persistent ref for configurationUI", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  uint64_t v10 = *(void **)(v1 + 272);
  uint64_t v11 = *(void **)(v1 + 248);

  unint64_t v12 = sub_100008370();
  uint64_t v13 = swift_allocError(&type metadata for SecurityAdapter.AdapterError, v12, 0LL, 0LL);
  *(void *)uint64_t v14 = 0xD000000000000013LL;
  *(void *)(v14 + 8) = 0x800000010000E390LL;
  *(_BYTE *)(v14 + 16) = 0;
  swift_willThrow(v13);

  uint64_t v16 = *(void *)(v1 + 216);
  uint64_t v15 = *(void *)(v1 + 224);
  uint64_t v17 = *(void *)(v1 + 192);
  uint64_t v18 = *(void *)(v1 + 168);

  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(v1 + 8))(0LL);
}

uint64_t type metadata accessor for SecurityAdapter()
{
  return objc_opt_self(&OBJC_CLASS____TtC18SecuritySubscriber15SecurityAdapter);
}

uint64_t sub_100007F3C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  unint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_100014CAC);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000026BC;
  return ((uint64_t (*)(void *, int, void *, void *))((char *)&dword_100014CA8 + dword_100014CA8))( v2,  v3,  v5,  v4);
}

uint64_t sub_100007FB8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100014FD4);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000894C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100014FD0 + dword_100014FD0))(v2, v3, v4);
}

uint64_t sub_100008034(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  BOOL v7 = (void *)swift_task_alloc(dword_100014FE4);
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_10000894C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100014FE0 + dword_100014FE0))( a1,  v4,  v5,  v6);
}

uint64_t sub_1000080BC()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000080F0()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_100014CCC);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000894C;
  return ((uint64_t (*)(void *, uint64_t, void *, void *))((char *)&dword_100014CC8 + dword_100014CC8))( v2,  v3,  v5,  v4);
}

uint64_t sub_100008170()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000081AC()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  BOOL v7 = (void *)swift_task_alloc(dword_100014CEC);
  *(void *)(v1 + 16) = v7;
  *BOOL v7 = v1;
  v7[1] = sub_10000894C;
  return ((uint64_t (*)(void *, void *, uint64_t, void *, void *))((char *)&dword_100014CE8 + dword_100014CE8))( v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_100008234()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100008260()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_100014D14);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000894C;
  return ((uint64_t (*)(uint64_t, void *))((char *)&dword_100014D10 + dword_100014D10))(v2, v3);
}

uint64_t sub_1000082D4()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_100008300()
{
  unint64_t result = qword_100014D38;
  if (!qword_100014D38)
  {
    uint64_t v1 = sub_1000085C8(255LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100014D38);
  }

  return result;
}

uint64_t sub_100008358(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100008370()
{
  unint64_t result = qword_100014D48;
  if (!qword_100014D48)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000D2F0, &type metadata for SecurityAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100014D48);
  }

  return result;
}

uint64_t sub_1000083B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000083F8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10000843C()
{
  unint64_t result = qword_100014D50;
  if (!qword_100014D50)
  {
    uint64_t v1 = type metadata accessor for Date(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Date, v1);
    atomic_store(result, (unint64_t *)&qword_100014D50);
  }

  return result;
}

uint64_t *sub_100008484(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_1000084C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001640(&qword_100014D80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000850C(uint64_t a1)
{
  uint64_t v2 = sub_100001640(&qword_100014D80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void *sub_10000854C(void *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  swift_bridgeObjectRelease(a1[1]);
  sub_1000083F8(v2, v3);
  return a1;
}

uint64_t sub_10000858C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000085C8(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100008600(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008628(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008658(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_errorRetain();
  }
  if (!a3) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for SecurityAdapter.AdapterError(uint64_t a1)
{
  return sub_100008688(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_100008688(uint64_t result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return swift_errorRelease(result);
  }
  if (!a3) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t _s18SecuritySubscriber15SecurityAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_100008658(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SecurityAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_100008658(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100008688(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for SecurityAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SecurityAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100008688(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecurityAdapter.AdapterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SecurityAdapter.AdapterError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100008828(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100008844(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0LL;
    LOBYTE(a2) = 2;
  }

  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecurityAdapter.AdapterError()
{
  return &type metadata for SecurityAdapter.AdapterError;
}

unint64_t sub_100008874()
{
  unint64_t result = qword_100014DC0;
  if (!qword_100014DC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000D278, &type metadata for SecurityAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100014DC0);
  }

  return result;
}

unint64_t sub_1000088BC()
{
  unint64_t result = qword_100014DC8;
  if (!qword_100014DC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000D230, &type metadata for SecurityAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100014DC8);
  }

  return result;
}

unint64_t sub_100008900()
{
  unint64_t result = qword_100014DD0;
  if (!qword_100014DD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000D2B8, &type metadata for SecurityAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100014DD0);
  }

  return result;
}

id sub_100008A3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityApplicator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecurityApplicator()
{
  return objc_opt_self(&OBJC_CLASS____TtC18SecuritySubscriber18SecurityApplicator);
}

Swift::Int sub_100008A8C()
{
  uint64_t v0 = sub_100001640(&qword_100014D60);
  uint64_t inited = swift_initStackObject(v0, &v12);
  *(_OWORD *)(inited + 16) = xmmword_10000D1C0;
  id v2 = [(id)objc_opt_self(RMModelSecurityCertificateDeclaration) registeredIdentifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  uint64_t v5 = v4;

  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v5;
  id v6 = [(id)objc_opt_self(RMModelSecurityIdentityDeclaration) registeredIdentifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v9 = v8;

  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v9;
  Swift::Int v10 = sub_10000AE34(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 2LL, &type metadata for String);
  return v10;
}

unint64_t sub_100008B80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100001640(&qword_100015020);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000C7A8(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_100009D98(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10000C760(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100008CA8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100001640((uint64_t *)&unk_100015070);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v6 - 2);
    uint64_t v8 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    unint64_t result = sub_100009D98(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100008DC0()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100008484(v0, qword_100015348);
  sub_100008358(v0, (uint64_t)qword_100015348);
  uint64_t v5 = type metadata accessor for SecurityStatus();
  uint64_t v1 = sub_100001640((uint64_t *)&unk_100015058);
  uint64_t v2 = String.init<A>(describing:)(&v5, v1);
  return Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010000E4A0LL, v2, v3);
}

uint64_t sub_100009044(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, &type metadata for String);
  v4[5] = v8;
  uint64_t v9 = unk_100015004;
  BOOL v14 = (uint64_t (*)(uint64_t, id))((char *)&dword_100015000 + dword_100015000);
  id v10 = a2;
  id v11 = a4;
  uint64_t v12 = (void *)swift_task_alloc(v9);
  v4[6] = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_1000090F4;
  return v14(v8, v10);
}

uint64_t sub_1000090F4(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void *)(*v2 + 40);
  uint64_t v6 = *(void *)(*v2 + 48);
  uint64_t v9 = *(void **)(*v2 + 16);
  uint64_t v8 = *(void **)(*v2 + 24);
  uint64_t v10 = *v2;
  swift_task_dealloc(v6);

  swift_bridgeObjectRelease(v7);
  if (v3)
  {
    uint64_t v11 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    uint64_t v13 = (void *)v11;
  }

  else
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v11 = 0LL;
    uint64_t v13 = isa;
  }

  BOOL v14 = *(void (***)(void, void, void))(v5 + 32);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_1000091E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100001640(&qword_100014D70);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    uint64_t v11 = sub_1000085C8(0LL, (unint64_t *)&unk_100015038, &OBJC_CLASS___RMCertificateStatusItem_ptr);
    **(void **)(*(void *)(v3 + 64) + 40LL) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a2,  &type metadata for String,  v11,  &protocol witness table for String);
    return swift_continuation_throwingResume(v3);
  }

id sub_1000092D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityStatus();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SecurityStatus()
{
  return objc_opt_self(&OBJC_CLASS____TtC18SecuritySubscriber14SecurityStatus);
}

uint64_t sub_10000932C()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100009368()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_100014FC4);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000026BC;
  return ((uint64_t (*)(uint64_t, void *, void *, void *))((char *)&dword_100014FC0 + dword_100014FC0))( v2,  v3,  v5,  v4);
}

uint64_t sub_1000093E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000894C;
  return v6();
}

uint64_t sub_100009438(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000894C;
  return v7();
}

uint64_t sub_100009490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_1000095D4(a1);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v16 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100010B48, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    __int128 v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    __int128 v18 = 0LL;
  }

  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100014FF8, v17);
}

uint64_t sub_1000095D4(uint64_t a1)
{
  uint64_t v2 = sub_100001640(&qword_100014CA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100009614(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100009678;
  return v6(a1);
}

uint64_t sub_100009678()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000096C4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000096E8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100014FF4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000026BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100014FF0 + dword_100014FF0))(a1, v4);
}

uint64_t sub_100009758(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100009828(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000858C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000858C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000C770(v12);
  return v7;
}

uint64_t sub_100009828(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

uint64_t sub_1000099E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009A74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009C4C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100009C4C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009A74(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_100009BE8(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return _swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100009BE8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_100001640(&qword_100015048);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  _OWORD v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100009C4C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100001640(&qword_100015048);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

unint64_t sub_100009D98(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100009DFC(a1, a2, v5);
}

unint64_t sub_100009DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_100009EDC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009EF8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100009EF8(char a1, int64_t a2, char a3, void *a4)
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
        goto LABEL_32;
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
    uint64_t v10 = sub_100001640((uint64_t *)&unk_100015028);
    uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v14 = (unint64_t)(v11 + 4);
  unint64_t v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8) {
      memmove(v11 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    uint64_t v18 = sub_100001640(&qword_100014D90);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

Swift::Int sub_10000A080(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100001640((uint64_t *)&unk_100015070);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v35) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v35) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }

    Hasher.init(_seed:)(v38, *(void *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v34;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

  Swift::Int result = sub_100009EDC(0, v59 & ~(v59 >> 63), 0);
  if ((v59 & 0x8000000000000000LL) == 0)
  {
    for (uint64_t i = 0LL; i != v59; ++i)
    {
      if ((v7 & 0xC000000000000001LL) != 0) {
        uint64_t v62 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v7);
      }
      else {
        uint64_t v62 = *(id *)(v7 + 8 * i + 32);
      }
      NSString v63 = v62;
      id v64 = [v62 serializeWithType:1];
      uint64_t v65 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v64,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);

      uint64_t v67 = _swiftEmptyArrayStorage[2];
      uint64_t v66 = _swiftEmptyArrayStorage[3];
      if (v67 >= v66 >> 1) {
        sub_100009EDC(v66 > 1, v67 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v67 + 1;
      _swiftEmptyArrayStorage[v67 + 4] = v65;
    }

    goto LABEL_48;
  }

  __break(1u);
  return result;
}

uint64_t sub_10000A394(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100001640(&qword_100015020);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v34 = v3;
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain(v5);
    int64_t v14 = 0LL;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }

      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v19 >= v35) {
          goto LABEL_37;
        }
        unint64_t v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v35) {
            goto LABEL_37;
          }
          unint64_t v20 = v36[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              uint64_t v3 = v34;
              if ((a2 & 1) != 0)
              {
                uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v36 = -1LL << v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1LL)) {
                  goto LABEL_44;
                }
                if (v14 >= v35) {
                  goto LABEL_37;
                }
                unint64_t v20 = v36[v14];
                ++v21;
                if (v20) {
                  goto LABEL_24;
                }
              }
            }

            int64_t v14 = v21;
          }
        }

LABEL_24:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }

      int64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v18);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      int64_t v25 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_10000C760(v25, v38);
      }

      else
      {
        sub_10000858C((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }

      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0LL;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }

        while (v32 == -1);
        unint64_t v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      unint64_t v16 = (void *)(*(void *)(v8 + 48) + 16 * v15);
      *unint64_t v16 = v24;
      v16[1] = v23;
      uint64_t result = (uint64_t)sub_10000C760(v38, (_OWORD *)(*(void *)(v8 + 56) + 32 * v15));
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

unint64_t sub_10000A690(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

_OWORD *sub_10000A6D8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000C760(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_10000A740()
{
  uint64_t v1 = v0;
  sub_100001640((uint64_t *)&unk_100015070);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
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

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    uint64_t result = (void *)swift_bridgeObjectRetain(v20);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_10000858C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_10000C760(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000A8F4()
{
  uint64_t v1 = v0;
  sub_100001640(&qword_100015020);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release(v2);
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }

  int64_t v25 = v1;
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

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

void sub_10000AAD8(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100001640(&qword_100014DB8);
      uint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v7 = v1;
      }
      else {
        uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      swift_bridgeObjectRelease(v1);
      if (!v5) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  uint64_t v8 = (char *)(v4 + 7);
  uint64_t v45 = v5;
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v9 = 0LL;
    uint64_t v43 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
        BOOL v11 = __OFADD__(v9++, 1LL);
        if (v11)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v12 = v10;
        Swift::Int v13 = NSObject._rawHashValue(seed:)(v4[5]);
        uint64_t v14 = -1LL << *((_BYTE *)v4 + 32);
        unint64_t v15 = v13 & ~v14;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
        uint64_t v18 = 1LL << v15;
        if (((1LL << v15) & v17) != 0) {
          break;
        }
LABEL_26:
        *(void *)&v8[8 * v16] = v18 | v17;
        *(void *)(v4[6] + 8 * v15) = v12;
        uint64_t v24 = v4[2];
        BOOL v11 = __OFADD__(v24, 1LL);
        uint64_t v25 = v24 + 1;
        if (v11) {
          goto LABEL_43;
        }
        v4[2] = v25;
        if (v9 == v5) {
          return;
        }
      }

      sub_1000085C8(0LL, &qword_100014D30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      id v19 = *(id *)(v4[6] + 8 * v15);
      char v20 = static NSObject.== infix(_:_:)();

      if ((v20 & 1) == 0)
      {
        uint64_t v21 = ~v14;
        while (1)
        {
          unint64_t v15 = (v15 + 1) & v21;
          unint64_t v16 = v15 >> 6;
          uint64_t v17 = *(void *)&v8[8 * (v15 >> 6)];
          uint64_t v18 = 1LL << v15;
          if ((v17 & (1LL << v15)) == 0) {
            break;
          }
          id v22 = *(id *)(v4[6] + 8 * v15);
          char v23 = static NSObject.== infix(_:_:)();

          if ((v23 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v1 = v43;
        uint64_t v5 = v45;
        goto LABEL_26;
      }

LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

Swift::Int sub_10000AE34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100001640(&qword_100015068);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v27 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v27 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v28, *(void *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        unint64_t v16 = (void *)(v15 + 16 * v11);
        uint64_t v17 = v16[1];
        BOOL v18 = *v16 == v8 && v17 == v7;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0LL), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v19 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v19;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          char v20 = (void *)(v15 + 16 * v11);
          uint64_t v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0LL);
            if ((result & 1) == 0) {
              continue;
            }
          }

          goto LABEL_3;
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      char v23 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *char v23 = v8;
      v23[1] = v7;
      uint64_t v24 = *(void *)(v3 + 16);
      BOOL v25 = __OFADD__(v24, 1LL);
      uint64_t v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (Swift::Int)&_swiftEmptySetSingleton;
}

id sub_10000AFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static String.Encoding.utf8.getter(v6);
  uint64_t v9 = String.data(using:allowLossyConversion:)(v8, 0LL, a1, a2);
  unint64_t v11 = v10;
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (v11 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_6;
  }

  v13.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000C794(v9, v11);
  id result = -[objc_class DMCSHA256Hash](v13.super.isa, "DMCSHA256Hash");
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v14 = result;
  id result = [result DMCHexString];
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);

    return (id)v16;
  }

LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_10000B104(uint64_t a1)
{
  *(void *)(v1 + 128) = a1;
  return swift_task_switch(sub_10000B11C, 0LL, 0LL);
}

uint64_t sub_10000B11C()
{
  uint64_t v1 = v0 + 2;
  unint64_t v2 = (void *)v0[16];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10000B1B0;
  uint64_t v3 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v4 = v0 + 10;
  v4[1] = 0x40000000LL;
  v4[2] = sub_1000091E4;
  v4[3] = &unk_100010B60;
  v4[4] = v3;
  [v2 certificateStatusWithCompletionHandler:v4];
  return swift_continuation_await(v1);
}

uint64_t sub_10000B1B0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 136LL) = v1;
  if (v1) {
    unint64_t v2 = sub_10000B9E0;
  }
  else {
    unint64_t v2 = sub_10000B210;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000B210()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void **)(v0 + 128);
  BOOL v3 = [v1 scope] == (id)1;
  id v4 = [v1 personaIdentifier];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v78 = 0LL;
    uint64_t v7 = 0LL;
  }

  int64_t v8 = 0LL;
  uint64_t v9 = -1LL;
  uint64_t v72 = v2 + 64;
  uint64_t v10 = -1LL << *(_BYTE *)(v2 + 32);
  if (-v10 < 64) {
    uint64_t v9 = ~(-1LL << -(char)v10);
  }
  unint64_t v11 = v9 & *(void *)(v2 + 64);
  int64_t v73 = (unint64_t)(63 - v10) >> 6;
  uint64_t v79 = v7;
  BOOL v70 = v3;
  uint64_t v71 = v2;
  while (1)
  {
    if (v11)
    {
      unint64_t v12 = __clz(__rbit64(v11));
      uint64_t v13 = (v11 - 1) & v11;
      int64_t v80 = v8;
      unint64_t v14 = v12 | (v8 << 6);
      goto LABEL_23;
    }

    int64_t v15 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
      __break(1u);
      goto LABEL_43;
    }

    if (v15 >= v73) {
      goto LABEL_31;
    }
    unint64_t v16 = *(void *)(v72 + 8 * v15);
    int64_t v17 = v8 + 1;
    if (!v16)
    {
      int64_t v17 = v8 + 2;
      if (v8 + 2 >= v73) {
        goto LABEL_31;
      }
      unint64_t v16 = *(void *)(v72 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v8 + 3;
        if (v8 + 3 >= v73) {
          goto LABEL_31;
        }
        unint64_t v16 = *(void *)(v72 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }

LABEL_22:
    uint64_t v13 = (v16 - 1) & v16;
    int64_t v80 = v17;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_23:
    uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 16 * v14 + 8);
    char v20 = *(void **)(*(void *)(v2 + 56) + 8 * v14);
    uint64_t v21 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreDeclarationKey);
    swift_bridgeObjectRetain(v19);
    uint64_t v7 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    id v23 = [v21 newDeclarationKey:v22];

    type metadata accessor for ManagedKeychainPublic(0LL);
    id v24 = [(id)v7 persistentRef];
    uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v24);
    unint64_t v27 = v26;

    id v28 = (void *)dispatch thunk of static ManagedKeychainPublic.copyCertificate(persistentRef:scope:persona:)( v25,  v27,  v3,  v78,  v79);
    sub_1000083F8(v25, v27);
    Swift::Int v29 = v28;
    id v77 = v23;
    id v30 = [v23 keyWithoutServerToken];
    uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
    uint64_t v33 = v32;

    sub_10000AFD4(v31, v33);
    uint64_t v35 = v34;
    swift_bridgeObjectRelease(v33);
    CFStringRef v36 = SecCertificateCopySubjectSummary(v29);
    unint64_t v75 = v13;
    if (v36)
    {
      uint64_t v37 = (__CFString *)v36;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
      unint64_t v39 = v38;
    }

    else
    {
      unint64_t v39 = 0xE000000000000000LL;
    }

    [(id)v7 isIdentity];
    CFDataRef v40 = SecCertificateCopyData(v29);
    uint64_t v74 = v29;

    uint64_t v41 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v40);
    unint64_t v43 = v42;

    uint64_t v44 = (void *)objc_opt_self(&OBJC_CLASS___RMModelStatusSecurityCertificateList);
    NSString v45 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v35);
    NSString v46 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v39);
    Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
    uint64_t v76 = v41;
    Class v48 = Data._bridgeToObjectiveC()().super.isa;
    id v49 = [v44 buildRequiredOnlyWithIdentifier:v45 subjectSummary:v46 isIdentity:isa data:v48];

    uint64_t v50 = v77;
    NSString v51 = [v77 declarationIdentifier];
    if (!v51)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
      uint64_t v53 = v52;
      NSString v51 = String._bridgeToObjectiveC()();
      uint64_t v54 = v53;
      uint64_t v50 = v77;
      swift_bridgeObjectRelease(v54);
    }

    [v49 setStatusDeclarationIdentifier:v51];

    id v55 = v49;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v57 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    unint64_t v56 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
    uint64_t v2 = v71;
    unint64_t v11 = v75;
    if (v57 >= v56 >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v56 > 1, v57 + 1, 1LL);
    }
    uint64_t v58 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v57, v55);
    specialized Array._endMutation()(v58);

    sub_1000083F8(v76, v43);
    BOOL v3 = v70;
    int64_t v8 = v80;
  }

  uint64_t v18 = v8 + 4;
  if (v8 + 4 < v73)
  {
    unint64_t v16 = *(void *)(v72 + 8 * v18);
    if (!v16)
    {
      while (1)
      {
        int64_t v17 = v18 + 1;
        if (__OFADD__(v18, 1LL)) {
          break;
        }
        if (v17 >= v73) {
          goto LABEL_31;
        }
        unint64_t v16 = *(void *)(v72 + 8 * v17);
        ++v18;
        if (v16) {
          goto LABEL_22;
        }
      }

LABEL_43:
      __break(1u);
LABEL_44:
      if (v7 < 0) {
        uint64_t v68 = v7;
      }
      else {
        uint64_t v68 = v7 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v7);
      uint64_t v59 = _CocoaArrayWrapper.endIndex.getter(v68);
      if (!v59) {
        goto LABEL_48;
      }
      goto LABEL_33;
    }

    int64_t v17 = v8 + 4;
    goto LABEL_22;
  }

LABEL_31:
  swift_release(v2);
  swift_bridgeObjectRelease(v79);
  uint64_t v7 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v59 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  if (!v59)
  {
LABEL_48:
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v7);
    return (*(uint64_t (**)(void *))(v69 + 8))(_swiftEmptyArrayStorage);
  }

uint64_t sub_10000B9E0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BA1C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 200) = a1;
  *(void *)(v2 + 208) = a2;
  return swift_task_switch(sub_10000BA34, 0LL, 0LL);
}

uint64_t sub_10000BA34()
{
  if (qword_100014BB0 != -1) {
    swift_once(&qword_100014BB0, sub_100008DC0);
  }
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  *(void *)(v0 + 216) = sub_100008358(v2, (uint64_t)qword_100015348);
  uint64_t v3 = swift_bridgeObjectRetain_n(v1, 2LL);
  id v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void *)(v0 + 200);
  uint64_t v35 = (void *)(v0 + 200);
  if (v6)
  {
    int64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v9 = swift_slowAlloc(32LL, -1LL);
    uint64_t v36 = v9;
    *(_DWORD *)int64_t v8 = 136446210;
    uint64_t v10 = ((uint64_t (*)(uint64_t))swift_bridgeObjectRetain)(v7);
    uint64_t v11 = Array.description.getter(v10, &type metadata for String);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease(v7);
    *(void *)(v0 + 192) = sub_100009758(v11, v13, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v35, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(v7, 2LL);
    swift_bridgeObjectRelease(v13);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Querying status for key paths:%{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v7, 2LL);
  }

  uint64_t v14 = *(void *)(v0 + 200);
  unint64_t v15 = sub_100008B80((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v16 = *(void *)(v14 + 16);
  *(void *)(v0 + 224) = v16;
  if (v16)
  {
    uint64_t v17 = *(void *)(v0 + 200);
    *(void *)(v0 + 232) = RMModelStatusItemSecurityCertificateList;
    swift_bridgeObjectRetain(v17);
    uint64_t v18 = 0LL;
    do
    {
      *(void *)(v0 + 240) = v15;
      *(void *)(v0 + 248) = v18;
      uint64_t v19 = *(void *)(v0 + 232);
      uint64_t v20 = *(void *)(v0 + 200) + 16 * v18;
      uint64_t v21 = *(void *)(v20 + 32);
      *(void *)(v0 + 256) = v21;
      unint64_t v22 = *(void *)(v20 + 40);
      *(void *)(v0 + 264) = v22;
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
      BOOL v25 = v21 == v23 && v22 == v24;
      if (v25
        || (uint64_t v26 = v24,
            char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v22, v23, v24, 0LL),
            swift_bridgeObjectRetain(v22),
            swift_bridgeObjectRelease(v26),
            (v27 & 1) != 0))
      {
        uint64_t v33 = (void *)swift_task_alloc(dword_10001500C);
        *(void *)(v0 + 272) = v33;
        *uint64_t v33 = v0;
        v33[1] = sub_10000BE44;
        v33[16] = *(void *)(v0 + 208);
        return swift_task_switch(sub_10000B11C, 0LL, 0LL);
      }

      swift_bridgeObjectRetain(v22);
      Swift::Int v29 = (os_log_s *)Logger.logObject.getter(v28);
      os_log_type_t v30 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc(12LL, -1LL);
        uint64_t v32 = swift_slowAlloc(32LL, -1LL);
        uint64_t v36 = v32;
        *(_DWORD *)uint64_t v31 = 136315138;
        swift_bridgeObjectRetain(v22);
        *(void *)(v31 + 4) = sub_100009758(v21, v22, &v36);
        swift_bridgeObjectRelease_n(v22, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Ignoring unknown status key path:%s", (uint8_t *)v31, 0xCu);
        swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v32, -1LL, -1LL);
        swift_slowDealloc(v31, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v22, 2LL);
      }

      uint64_t v18 = *(void *)(v0 + 248) + 1LL;
    }

    while (v18 != *(void *)(v0 + 224));
    swift_bridgeObjectRelease(*v35);
  }

  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v15);
}

uint64_t sub_10000BE44(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 272);
  *(void *)(*v2 + 280) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    BOOL v6 = sub_10000C250;
  }

  else
  {
    *(void *)(v4 + 288) = a1;
    BOOL v6 = sub_10000BEB8;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_10000BEB8()
{
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v5 = sub_100001640(&qword_100015018);
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 40) = v5;
  sub_10000C760((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 80));
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
  *(void *)(v0 + 184) = v4;
  unint64_t v8 = sub_100009D98(v3, v2);
  uint64_t v9 = *(void *)(v4 + 16);
  BOOL v10 = (v7 & 1) == 0;
  uint64_t result = v9 + v10;
  if (__OFADD__(v9, v10))
  {
    __break(1u);
  }

  else
  {
    char v12 = v7;
    if (*(void *)(*(void *)(v0 + 240) + 24LL) >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_10000A8F4();
      }
    }

    else
    {
      uint64_t v14 = *(void *)(v0 + 256);
      uint64_t v13 = *(void *)(v0 + 264);
      sub_10000A394(result, isUniquelyReferenced_nonNull_native);
      unint64_t v15 = sub_100009D98(v14, v13);
      if ((v12 & 1) != (v16 & 1)) {
        return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      }
      unint64_t v8 = v15;
    }

    uint64_t v17 = *(void **)(v0 + 184);
    if ((v12 & 1) != 0)
    {
      uint64_t v18 = (void *)(v17[7] + 32 * v8);
      sub_10000C770(v18);
      sub_10000C760((_OWORD *)(v0 + 80), v18);
    }

    else
    {
      uint64_t v19 = *(void *)(v0 + 264);
      sub_10000A6D8(v8, *(void *)(v0 + 256), v19, (_OWORD *)(v0 + 80), v17);
      swift_bridgeObjectRetain(v19);
    }

    swift_bridgeObjectRelease(*(void *)(v0 + 264));
    swift_bridgeObjectRelease(0x8000000000000000LL);
    uint64_t v20 = *(void *)(v0 + 248) + 1LL;
    if (v20 == *(void *)(v0 + 224))
    {
LABEL_12:
      swift_bridgeObjectRelease(*(void *)(v0 + 200));
      return (*(uint64_t (**)(void *))(v0 + 8))(v17);
    }

    else
    {
      while (1)
      {
        *(void *)(v0 + 240) = v17;
        *(void *)(v0 + 248) = v20;
        uint64_t v23 = *(void *)(v0 + 232);
        uint64_t v24 = *(void *)(v0 + 200) + 16 * v20;
        uint64_t v25 = *(void *)(v24 + 32);
        *(void *)(v0 + 256) = v25;
        unint64_t v26 = *(void *)(v24 + 40);
        *(void *)(v0 + 264) = v26;
        uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
        if (v25 == v27 && v26 == v28) {
          break;
        }
        uint64_t v30 = v28;
        char v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, v27, v28, 0LL);
        swift_bridgeObjectRetain(v26);
        swift_bridgeObjectRelease(v30);
        if ((v31 & 1) != 0) {
          break;
        }
        uint64_t v32 = swift_bridgeObjectRetain(v26);
        uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
        os_log_type_t v34 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v33, v34))
        {
          uint64_t v21 = swift_slowAlloc(12LL, -1LL);
          uint64_t v22 = swift_slowAlloc(32LL, -1LL);
          uint64_t v36 = v22;
          *(_DWORD *)uint64_t v21 = 136315138;
          swift_bridgeObjectRetain(v26);
          *(void *)(v21 + 4) = sub_100009758(v25, v26, &v36);
          swift_bridgeObjectRelease_n(v26, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v33,  v34,  "Ignoring unknown status key path:%s",  (uint8_t *)v21,  0xCu);
          swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v22, -1LL, -1LL);
          swift_slowDealloc(v21, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v26, 2LL);
        }

        uint64_t v20 = *(void *)(v0 + 248) + 1LL;
        if (v20 == *(void *)(v0 + 224)) {
          goto LABEL_12;
        }
      }

      uint64_t v35 = (void *)swift_task_alloc(dword_10001500C);
      *(void *)(v0 + 272) = v35;
      void *v35 = v0;
      v35[1] = sub_10000BE44;
      v35[16] = *(void *)(v0 + 208);
      return swift_task_switch(sub_10000B11C, 0LL, 0LL);
    }
  }

  return result;
}

uint64_t sub_10000C250()
{
  uint64_t v1 = *(void *)(v0 + 280);
  swift_errorRetain(v1);
  uint64_t v2 = swift_errorRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.error.getter();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void *)(v0 + 280);
  if (v5)
  {
    uint64_t v7 = swift_slowAlloc(12LL, -1LL);
    unint64_t v8 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v7 = 138543362;
    swift_errorRetain(v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError(v6);
    *(void *)(v7 + 4) = v9;
    *unint64_t v8 = v9;
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl( (void *)&_mh_execute_header,  v3,  v4,  "Could not query certificate asset keys:%{public}@",  (uint8_t *)v7,  0xCu);
    uint64_t v10 = sub_100001640(&qword_100015010);
    swift_arrayDestroy(v8, 1LL, v10);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(*(void *)(v0 + 280));
    swift_errorRelease(v6);
  }

  uint64_t v11 = *(void *)(v0 + 280);
  uint64_t v13 = *(void *)(v0 + 256);
  uint64_t v12 = *(void *)(v0 + 264);
  uint64_t v14 = *(void *)(v0 + 240);

  swift_getErrorValue(v11, v0 + 176, v0 + 144);
  uint64_t v15 = *(void *)(v0 + 144);
  uint64_t v16 = *(void *)(v0 + 152);
  *(void *)(v0 + 72) = v16;
  uint64_t v17 = sub_10000C724((void *)(v0 + 48));
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL))(v17, v15, v16);
  sub_10000C760((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 112));
  uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
  *(void *)(v0 + 168) = v14;
  unint64_t v20 = sub_100009D98(v13, v12);
  uint64_t v21 = *(void *)(v14 + 16);
  BOOL v22 = (v19 & 1) == 0;
  uint64_t result = v21 + v22;
  if (__OFADD__(v21, v22))
  {
    __break(1u);
  }

  else
  {
    char v24 = v19;
    if (*(void *)(*(void *)(v0 + 240) + 24LL) >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_10000A8F4();
      }
    }

    else
    {
      uint64_t v26 = *(void *)(v0 + 256);
      uint64_t v25 = *(void *)(v0 + 264);
      sub_10000A394(result, isUniquelyReferenced_nonNull_native);
      unint64_t v27 = sub_100009D98(v26, v25);
      if ((v24 & 1) != (v28 & 1)) {
        return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      }
      unint64_t v20 = v27;
    }

    uint64_t v29 = *(void *)(v0 + 168);
    if ((v24 & 1) != 0)
    {
      uint64_t v30 = (void *)(*(void *)(v29 + 56) + 32 * v20);
      sub_10000C770(v30);
      sub_10000C760((_OWORD *)(v0 + 112), v30);
    }

    else
    {
      uint64_t v31 = *(void *)(v0 + 264);
      sub_10000A6D8(v20, *(void *)(v0 + 256), v31, (_OWORD *)(v0 + 112), *(void **)(v0 + 168));
      swift_bridgeObjectRetain(v31);
    }

    uint64_t v32 = *(void *)(v0 + 280);
    swift_bridgeObjectRelease(*(void *)(v0 + 264));
    swift_bridgeObjectRelease(0x8000000000000000LL);
    swift_errorRelease(v32);
    uint64_t v33 = *(void *)(v0 + 248) + 1LL;
    if (v33 == *(void *)(v0 + 224))
    {
LABEL_15:
      swift_bridgeObjectRelease(*(void *)(v0 + 200));
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v29);
    }

    else
    {
      while (1)
      {
        *(void *)(v0 + 240) = v29;
        *(void *)(v0 + 248) = v33;
        uint64_t v36 = *(void *)(v0 + 232);
        uint64_t v37 = *(void *)(v0 + 200) + 16 * v33;
        uint64_t v38 = *(void *)(v37 + 32);
        *(void *)(v0 + 256) = v38;
        unint64_t v39 = *(void *)(v37 + 40);
        *(void *)(v0 + 264) = v39;
        uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
        if (v38 == v40 && v39 == v41) {
          break;
        }
        uint64_t v43 = v41;
        char v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v39, v40, v41, 0LL);
        swift_bridgeObjectRetain(v39);
        swift_bridgeObjectRelease(v43);
        if ((v44 & 1) != 0) {
          break;
        }
        uint64_t v45 = swift_bridgeObjectRetain(v39);
        NSString v46 = (os_log_s *)Logger.logObject.getter(v45);
        os_log_type_t v47 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v34 = swift_slowAlloc(12LL, -1LL);
          uint64_t v35 = swift_slowAlloc(32LL, -1LL);
          uint64_t v49 = v35;
          *(_DWORD *)uint64_t v34 = 136315138;
          swift_bridgeObjectRetain(v39);
          *(void *)(v34 + 4) = sub_100009758(v38, v39, &v49);
          swift_bridgeObjectRelease_n(v39, 3LL);
          _os_log_impl( (void *)&_mh_execute_header,  v46,  v47,  "Ignoring unknown status key path:%s",  (uint8_t *)v34,  0xCu);
          swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v35, -1LL, -1LL);
          swift_slowDealloc(v34, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(v39, 2LL);
        }

        uint64_t v33 = *(void *)(v0 + 248) + 1LL;
        if (v33 == *(void *)(v0 + 224)) {
          goto LABEL_15;
        }
      }

      Class v48 = (void *)swift_task_alloc(dword_10001500C);
      *(void *)(v0 + 272) = v48;
      *Class v48 = v0;
      v48[1] = sub_10000BE44;
      v48[16] = *(void *)(v0 + 208);
      return swift_task_switch(sub_10000B11C, 0LL, 0LL);
    }
  }

  return result;
}

void *sub_10000C724(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

_OWORD *sub_10000C760(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000C770(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000C794(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000083F8(result, a2);
  }
  return result;
}

uint64_t sub_10000C7A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100001640(&qword_100015050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}