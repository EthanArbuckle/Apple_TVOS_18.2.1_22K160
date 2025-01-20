int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  v3 = (void *)objc_opt_self(&OBJC_CLASS___RMConfigurationSubscriberClient);
  v4 = sub_100003610(&qword_1000109C0);
  v5 = swift_allocObject(v4, 40LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_100009D90;
  *(void *)(v5 + 32) = type metadata accessor for LegacyProfilesApplicator();
  sub_100003610(&qword_100010B80);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  [v3 runConfigurationSubscriberClientWithApplicators:isa publisherClass:0];

  return 0;
}

uint64_t sub_100003610(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t variable initialization expression of LegacyProfilesAdapter.installedProfileIdentifierByDeclarationKey()
{
  return 0LL;
}

void type metadata accessor for RMStoreScope()
{
  if (!qword_1000109A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_10000C550);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000109A8);
    }
  }
}

uint64_t sub_1000036AC()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_100008FA4(v0, qword_100010D40);
  sub_100003E98(v0, (uint64_t)qword_100010D40);
  uint64_t v5 = type metadata accessor for LegacyProfilesAdapter();
  uint64_t v1 = sub_100003610(&qword_100010BB8);
  uint64_t v2 = String.init<A>(describing:)(&v5, v1);
  return Logger.init(subsystem:category:)(0xD00000000000001BLL, 0x800000010000AF80LL, v2, v3);
}

void sub_100003740(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }

void sub_100003780()
{
  v3._countAndFlagsBits = v2;
  v3._object = v1;
  String.append(_:)(v3);
  *uint64_t v0 = 0LL;
  v0[1] = 0LL;
  v0[2] = 0xD000000000000010LL;
  v0[3] = 0x800000010000B090LL;
  v0[4] = 0LL;
}

__n128 sub_1000039A4@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = v5;
  *(_OWORD *)a1 = v4;
  *(__n128 *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_1000039F0(uint64_t a1)
{
  unint64_t v2 = sub_1000092A0();
  return RMAdapterError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100003A18(uint64_t a1)
{
  unint64_t v2 = sub_1000092A0();
  return RMAdapterError.errorDescription.getter(a1, v2);
}

uint64_t sub_100003A4C(uint64_t a1)
{
  unint64_t v2 = sub_100009214();
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003A74(uint64_t a1)
{
  unint64_t v2 = sub_100009214();
  return Error<>._code.getter(a1, v2);
}

id LegacyProfilesAdapter.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id LegacyProfilesAdapter.init()()
{
  uint64_t v1 = (objc_class *)type metadata accessor for LegacyProfilesAdapter();
  unint64_t v2 = (char *)objc_allocWithZone(v1);
  uint64_t v3 = OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController;
  *(void *)&v2[OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController] = 0LL;
  uint64_t v4 = OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey;
  *(void *)&v2[OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey] = 0LL;
  __n128 v5 = *(void **)&v2[v3];
  *(void *)&v2[v3] = 0LL;
  uint64_t v6 = v2;

  uint64_t v7 = *(void *)&v2[v4];
  *(void *)&v2[v4] = 0LL;

  swift_bridgeObjectRelease(v7);
  v12.receiver = v6;
  v12.super_class = v1;
  id v8 = objc_msgSendSuper2(&v12, "init");
  uint64_t ObjectType = swift_getObjectType(v0, v9);
  swift_deallocPartialClassInstance(v0, ObjectType, 24LL, 7LL);
  return v8;
}

uint64_t type metadata accessor for LegacyProfilesAdapter()
{
  return objc_opt_self(&OBJC_CLASS____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter);
}

uint64_t LegacyProfilesAdapter.configurationClasses()()
{
  uint64_t v0 = sub_100003610(&qword_1000109C0);
  uint64_t v1 = swift_allocObject(v0, 40LL, 7LL);
  *(_OWORD *)(v1 + 16) = xmmword_100009D90;
  *(void *)(v1 + 32) = sub_100008C6C(0LL, &qword_1000109C8, &OBJC_CLASS___RMModelLegacyProfileDeclaration_ptr);
  return v1;
}

uint64_t LegacyProfilesAdapter.beginProcessingConfigurations(for:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return swift_task_switch(sub_100003CB8, 0LL, 0LL);
}

uint64_t sub_100003CB8()
{
  if (qword_1000109A0 != -1) {
    swift_once(&qword_1000109A0, sub_1000036AC);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  sub_100003E98(v1, (uint64_t)qword_100010D40);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    uint64_t v12 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 16) = sub_1000053C4(0xD000000000000023LL, 0x800000010000AA30LL, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy(v5, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v6 = *(void *)(v0 + 32);
  uint64_t v7 = OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController;
  if (!*(void *)(v6 + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController))
  {
    id v8 = [(id)objc_opt_self(RMStoreProfilesController) newProfileControllerWithPrefix:LegacyProfileIdentifierPrefix scope:*(void *)(v0 + 24)];
    uint64_t v9 = *(void **)(v6 + v7);
    *(void *)(v6 + v7) = v8;

    uint64_t v6 = *(void *)(v0 + 32);
  }

  uint64_t v10 = *(void *)(v6
                  + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey);
  *(void *)(v6
            + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey) = 0LL;
  swift_bridgeObjectRelease(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003E98(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100003FDC(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v6 = dword_1000109D4;
  id v7 = a3;
  id v8 = (void *)swift_task_alloc(v6);
  v3[4] = v8;
  *id v8 = v3;
  v8[1] = sub_1000092EC;
  v8[3] = a1;
  v8[4] = v7;
  return swift_task_switch(sub_100003CB8, 0LL, 0LL);
}

uint64_t LegacyProfilesAdapter.endProcessingConfigurations(_:scope:)()
{
  os_log_type_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000109E0 + dword_1000109E0);
  uint64_t v1 = (void *)swift_task_alloc(unk_1000109E4);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000040BC;
  return v3();
}

uint64_t sub_1000040BC()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100004238(int a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a4;
  v4[3] = _Block_copy(aBlock);
  uint64_t v6 = unk_1000109E4;
  uint64_t v9 = (uint64_t (*)(void))((char *)&dword_1000109E0 + dword_1000109E0);
  a4;
  id v7 = (void *)swift_task_alloc(v6);
  v4[4] = v7;
  *id v7 = v4;
  v7[1] = sub_1000042B4;
  return v9();
}

uint64_t sub_1000042B4()
{
  uint64_t v2 = *(void *)(*v1 + 32);
  os_log_type_t v3 = *(void **)(*v1 + 16);
  uint64_t v4 = *v1;
  swift_task_dealloc(v2);

  uint64_t v5 = *(void *)(v4 + 24);
  if (v0)
  {
    uint64_t v6 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }

  else
  {
    (*(void (**)(void, void))(v5 + 16))(*(void *)(v4 + 24), 0LL);
  }

  _Block_release(*(const void **)(v4 + 24));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t LegacyProfilesAdapter.allDeclarationKeys(for:)()
{
  os_log_type_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000109F0 + dword_1000109F0);
  uint64_t v1 = (void *)swift_task_alloc(unk_1000109F4);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000043AC;
  return v3();
}

uint64_t sub_1000043AC(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

void sub_100004400(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
  unint64_t v4 = sub_100008CA4();
  int64_t v5 = 0LL;
  v16[1] = (id)Set.init(minimumCapacity:)(v2, v3, v4);
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }

    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v13 >= v10) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14)
        {
          int64_t v5 = v13 + 3;
          if (v13 + 3 >= v10) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v5);
          if (!v14) {
            break;
          }
        }
      }
    }

LABEL_22:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    sub_100005A04((Swift::Int *)v16, *(id *)(*(void *)(a1 + 48) + 8 * v12));
  }

  int64_t v15 = v13 + 4;
  if (v15 >= v10)
  {
LABEL_23:
    swift_release(a1);
    return;
  }

  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_22;
    }
  }

LABEL_25:
  __break(1u);
}

uint64_t sub_1000046C8(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = unk_1000109F4;
  uint64_t v8 = (uint64_t (*)(void))((char *)&dword_1000109F0 + dword_1000109F0);
  a3;
  uint64_t v6 = (void *)swift_task_alloc(v5);
  v3[4] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100004744;
  return v8();
}

uint64_t sub_100004744(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 32);
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc(v6);

  if (v3)
  {
    uint64_t v9 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    unint64_t v11 = (void *)v9;
  }

  else
  {
    sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    sub_100008CA4();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v9 = 0LL;
    unint64_t v11 = isa;
  }

  unint64_t v12 = *(void (***)(void, void, void))(v5 + 24);
  ((void (**)(void, Class, uint64_t))v12)[2](v12, isa, v9);

  _Block_release(v12);
  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t LegacyProfilesAdapter.applyConfiguration(_:replace:scope:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100010A00 + dword_100010A00);
  uint64_t v5 = (void *)swift_task_alloc(unk_100010A04);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000092E8;
  return v7(a1, a2);
}

uint64_t sub_10000489C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100003610(&qword_100010B98);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
    unint64_t v11 = *(uint64_t **)(*(void *)(v3 + 64) + 40LL);
    *unint64_t v11 = v10;
    v11[1] = v12;
    return swift_continuation_throwingResume(v3);
  }

uint64_t sub_100004A6C(void *a1, void *a2, int a3, void *aBlock, void *a5)
{
  v5[3] = a2;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  uint64_t v9 = unk_100010A04;
  unint64_t v14 = (uint64_t (*)(id, void *))((char *)&dword_100010A00 + dword_100010A00);
  id v10 = a1;
  id v11 = a2;
  a5;
  uint64_t v12 = (void *)swift_task_alloc(v9);
  v5[6] = v12;
  *uint64_t v12 = v5;
  v12[1] = sub_100004B10;
  return v14(v10, a2);
}

uint64_t sub_100004B10(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 48);
  id v8 = *(void **)(*v2 + 24);
  uint64_t v7 = *(void **)(*v2 + 32);
  uint64_t v9 = *(void **)(*v2 + 16);
  uint64_t v10 = *v2;
  swift_task_dealloc(v6);

  if (v3)
  {
    uint64_t v11 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    Class isa = 0LL;
    int64_t v13 = (void *)v11;
  }

  else
  {
    sub_100008C6C(0LL, &qword_100010B08, &OBJC_CLASS___RMModelStatusReason_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    uint64_t v11 = 0LL;
    int64_t v13 = isa;
  }

  unint64_t v14 = *(void (***)(void, void, void))(v5 + 40);
  ((void (**)(void, Class, uint64_t))v14)[2](v14, isa, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t LegacyProfilesAdapter.remove(_:scope:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100010A10 + dword_100010A10);
  uint64_t v3 = (void *)swift_task_alloc(unk_100010A14);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_1000092E4;
  return v5(a1);
}

uint64_t sub_100004C64(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    return swift_continuation_throwingResume(*(void *)(a1 + 32));
  }
  uint64_t v4 = sub_100003610(&qword_100010B98);
  uint64_t v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0LL, 0LL);
  *uint64_t v6 = a2;
  id v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

uint64_t sub_100004E0C(void *a1, int a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  uint64_t v7 = unk_100010A14;
  uint64_t v11 = (uint64_t (*)(uint64_t))((char *)&dword_100010A10 + dword_100010A10);
  id v8 = a1;
  a4;
  uint64_t v9 = (void *)swift_task_alloc(v7);
  v4[5] = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_100004E9C;
  return v11((uint64_t)v8);
}

uint64_t sub_100004E9C()
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

id LegacyProfilesAdapter.declarationKey(forConfiguration:)(id result)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController);
  if (v2)
  {
    uint64_t v3 = result;
    id v4 = v2;
    id v5 = [v3 store];
    id v6 = [v3 declaration];
    id v7 = [v4 declarationKeyForStore:v5 declaration:v6];

    return v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

id LegacyProfilesAdapter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LegacyProfilesAdapter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005120(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_1000092E4;
  return v6();
}

uint64_t sub_100005174(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  id v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_1000092E4;
  return v7();
}

uint64_t sub_1000051C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100008F08(a1, &qword_100010AA0);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      uint64_t v11 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10, v13);
      uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      uint64_t v16 = v15;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v17 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v17 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10) {
      goto LABEL_3;
    }
  }

  uint64_t v14 = 0LL;
  uint64_t v16 = 0LL;
LABEL_6:
  uint64_t v18 = swift_allocObject(&unk_10000C5E8, 32LL, 7LL);
  *(void *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0LL;
    v21[1] = 0LL;
    v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }

  else
  {
    v19 = 0LL;
  }

  return swift_task_create(v9, v19, (char *)&type metadata for () + 8, &unk_100010AE0, v18);
}

uint64_t sub_100005314(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100005378;
  return v6(a1);
}

uint64_t sub_100005378()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000053C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005494(v13, 0LL, 0LL, 1, a1, a2);
  uint64_t v8 = v13[0];
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100008F64((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v11 = *a3;
    if (*a3)
    {
      sub_100008F64((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100008F44(v13);
  return v8;
}

uint64_t sub_100005494(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

LABEL_13:
    uint64_t result = sub_10000564C(a5, a6);
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

uint64_t sub_10000564C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000056E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000058B8(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000058B8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000056E0(uint64_t a1, unint64_t a2)
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
      id v5 = sub_100005854(v4, 0LL);
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
        return &_swiftEmptyArrayStorage;
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
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100005854(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100003610(&qword_100010BB0);
  id v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000058B8(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100003610(&qword_100010BB0);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
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

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_100005A04(Swift::Int *a1, void *a2)
{
  unint64_t v3 = v2;
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
      uint64_t v10 = sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
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

    Swift::Int v24 = sub_100005CA0(v7, result + 1);
    Swift::Int v33 = v24;
    unint64_t v25 = *(void *)(v24 + 16);
    if (*(void *)(v24 + 24) <= v25)
    {
      uint64_t v30 = v25 + 1;
      id v31 = v8;
      sub_100005E94(v30);
      uint64_t v26 = v33;
    }

    else
    {
      uint64_t v26 = v24;
      id v27 = v8;
    }

    sub_100006130((uint64_t)v8, v26);
    uint64_t v29 = *v3;
    *unint64_t v3 = v26;
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
      sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v16);
      char v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v22 = *(void **)(*(void *)(*v3 + 48) + 8 * v16);
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
    *unint64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_1000061B0((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    uint64_t v29 = *v3;
    *unint64_t v3 = v33;
  }

  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_100005CA0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100003610(&qword_100010BA8);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_100005E94(v16 + 1);
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

Swift::Int sub_100005E94(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100003610(&qword_100010BA8);
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
                uint64_t v2 = v30;
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
  *uint64_t v2 = v6;
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
    uint64_t v2 = v30;
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

unint64_t sub_100006130(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_1000061B0(uint64_t a1, unint64_t a2, char a3)
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
    sub_100005E94(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_100006334();
      goto LABEL_14;
    }

    sub_1000064DC(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
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

id sub_100006334()
{
  uint64_t v1 = v0;
  sub_100003610(&qword_100010BA8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
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

Swift::Int sub_1000064DC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100003610(&qword_100010BA8);
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

unint64_t sub_100006754(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100006784(a1, v4);
}

unint64_t sub_100006784(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

uint64_t sub_10000689C()
{
  *(void *)(v1 + 24) = v0;
  return swift_task_switch(sub_1000068B4, 0LL, 0LL);
}

uint64_t sub_1000068B4()
{
  if (qword_1000109A0 != -1) {
    swift_once(&qword_1000109A0, sub_1000036AC);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  sub_100003E98(v1, (uint64_t)qword_100010D40);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    uint64_t v9 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 16) = sub_1000053C4(0xD000000000000025LL, 0x800000010000AD10LL, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy(v5, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void *)(v6
                 + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey);
  *(void *)(v6
            + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey) = 0LL;
  swift_bridgeObjectRelease(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006A48()
{
  *(void *)(v1 + 24) = v0;
  return swift_task_switch(sub_100006A60, 0LL, 0LL);
}

uint64_t sub_100006A60()
{
  if (qword_1000109A0 != -1) {
    swift_once(&qword_1000109A0, sub_1000036AC);
  }
  uint64_t v1 = (uint64_t *)(v0 + 16);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100003E98(v2, (uint64_t)qword_100010D40);
  os_log_type_t v3 = (os_log_s *)((uint64_t (*)(void))Logger.logObject.getter)();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v0 + 16) = sub_1000053C4(0xD000000000000018LL, 0x800000010000ACE0LL, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(v0 + 24);
  uint64_t v8 = *(void **)(v7 + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController);
  if (v8)
  {
    id v9 = [v8 installedProfileIdentifierByDeclarationKey];
    uint64_t v10 = sub_100008C6C(0LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    unint64_t v11 = sub_100008CA4();
    uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v9, v10, &type metadata for String, v11);

    uint64_t v7 = *(void *)(v0 + 24);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v13 = OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey;
  uint64_t v14 = *(void *)(v7
                  + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey);
  *(void *)(v7
            + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey) = v12;
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = *(void *)(v7 + v13);
  if (v15)
  {
    swift_bridgeObjectRetain_n(*(void *)(v7 + v13), 2LL);
    sub_100004400(v15);
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v17 = (uint64_t)&_swiftEmptySetSingleton;
  }

  uint64_t v18 = swift_bridgeObjectRetain(v17);
  unint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = v22;
    *(_DWORD *)uint64_t v21 = 136315394;
    *uint64_t v1 = sub_1000053C4(0xD000000000000018LL, 0x800000010000ACE0LL, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v21 + 4, v21 + 12);
    *(_WORD *)(v21 + 12) = 2048;
    if ((v17 & 0xC000000000000001LL) != 0)
    {
      if (v17 < 0) {
        uint64_t v23 = v17;
      }
      else {
        uint64_t v23 = v17 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v24 = __CocoaSet.count.getter(v23);
    }

    else
    {
      uint64_t v24 = *(void *)(v17 + 16);
    }

    *uint64_t v1 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s result: %ld", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v17);
  }

  swift_bridgeObjectRelease(v15);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t sub_100006DF8(uint64_t a1)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = v1;
  return swift_task_switch(sub_100006E10, 0LL, 0LL);
}

uint64_t sub_100006E10()
{
  if (qword_1000109A0 != -1) {
    swift_once(&qword_1000109A0, sub_1000036AC);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100003E98(v1, (uint64_t)qword_100010D40);
  *(void *)(v0 + 136) = v2;
  os_log_type_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v29 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v0 + 80) = sub_1000053C4(0xD000000000000010LL, 0x800000010000AC30LL, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v7 = *(void *)(*(void *)(v0 + 128)
                 + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_installedProfileIdentifierByDeclarationKey);
  if (!v7 || !*(void *)(v7 + 16)) {
    goto LABEL_11;
  }
  uint64_t v8 = *(void **)(v0 + 120);
  swift_bridgeObjectRetain(v7);
  unint64_t v9 = sub_100006754((uint64_t)v8);
  if ((v10 & 1) == 0)
  {
    uint64_t v18 = *(void **)(v0 + 120);
    swift_bridgeObjectRelease(v7);

LABEL_11:
    unint64_t v19 = (os_log_s *)Logger.logObject.getter(*(id *)(v0 + 120));
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = *(void **)(v0 + 120);
    if (v21)
    {
      uint64_t v23 = swift_slowAlloc(22LL, -1LL);
      uint64_t v28 = swift_slowAlloc(64LL, -1LL);
      uint64_t v29 = v28;
      *(_DWORD *)uint64_t v23 = 136315394;
      *(void *)(v0 + 80) = sub_1000053C4(0xD000000000000010LL, 0x800000010000AC30LL, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v23 + 4, v23 + 12);
      *(_WORD *)(v23 + 12) = 2080;
      id v24 = [v22 key];
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
      unint64_t v27 = v26;

      *(void *)(v0 + 80) = sub_1000053C4(v25, v27, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v23 + 14, v23 + 22);

      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s: no profile to remove: %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy(v28, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1LL, -1LL);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    else
    {
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v12 = *(void **)(v0 + 120);
  uint64_t v11 = *(void *)(v0 + 128);
  uint64_t v13 = *(void *)(*(void *)(v7 + 56) + 16 * v9 + 8);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v7);

  uint64_t v14 = *(void **)(v11 + OBJC_IVAR____TtC24LegacyProfilesSubscriber21LegacyProfilesAdapter_profilesController);
  *(void *)(v0 + 144) = v14;
  if (v14)
  {
    id v15 = v14;
    NSString v16 = String._bridgeToObjectiveC()();
    *(void *)(v0 + 152) = v16;
    swift_bridgeObjectRelease(v13);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_100007260;
    *(void *)(v0 + 112) = swift_continuation_init(v0 + 16, 1LL);
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000LL;
    *(void *)(v0 + 96) = sub_100004C64;
    *(void *)(v0 + 104) = &unk_10000C7E0;
    [v15 uninstallProfileWithIdentifier:v16 store:0 completionHandler:v0 + 80];
    return swift_continuation_await(v0 + 16);
  }

  swift_bridgeObjectRelease(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007260()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 160LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000072F8;
  }
  else {
    uint64_t v2 = sub_1000072C0;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_1000072C0()
{
  uint64_t v1 = *(void **)(v0 + 144);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000072F8()
{
  uint64_t v2 = *(void **)(v0 + 152);
  uint64_t v1 = *(void *)(v0 + 160);
  os_log_type_t v3 = *(void **)(v0 + 144);
  swift_willThrow();

  swift_errorRetain(v1);
  uint64_t v4 = swift_errorRetain(v1);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 160);
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    unint64_t v9 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v17 = swift_slowAlloc(32LL, -1LL);
    uint64_t v18 = v17;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 80) = sub_1000053C4(0xD000000000000010LL, 0x800000010000AC30LL, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v8 + 4, v8 + 12);
    *(_WORD *)(v8 + 12) = 2112;
    swift_errorRetain(v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(void *)(v0 + 80) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v8 + 14, v8 + 22);
    *unint64_t v9 = v10;
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: failed to uninstall profile: %@", (uint8_t *)v8, 0x16u);
    uint64_t v11 = sub_100003610(&qword_100010B90);
    swift_arrayDestroy(v9, 1LL, v11);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_arrayDestroy(v17, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 160);
    swift_errorRelease(v12);
    swift_errorRelease(v12);
  }

  uint64_t v13 = *(void *)(v0 + 160);
  unint64_t v14 = sub_100008E7C();
  swift_allocError(&type metadata for LegacyProfilesAdapter.AdapterError, v14, 0LL, 0LL);
  *(void *)uint64_t v15 = v13;
  *(void *)(v15 + 8) = 0LL;
  *(_BYTE *)(v15 + 16) = 3;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007538(uint64_t a1, uint64_t a2)
{
  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  uint64_t v4 = type metadata accessor for URL(0LL);
  v3[33] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[34] = v5;
  v3[35] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v6 = (*(void *)(*(void *)(sub_100003610(&qword_100010BA0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[36] = swift_task_alloc(v6);
  v3[37] = swift_task_alloc(v6);
  return swift_task_switch(sub_1000075D0, 0LL, 0LL);
}

uint64_t sub_1000075D0()
{
  uint64_t v119 = v0 + 232;
  if (qword_1000109A0 != -1) {
    swift_once(&qword_1000109A0, sub_1000036AC);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_100003E98(v1, (uint64_t)qword_100010D40);
  *(void *)(v0 + 304) = v2;
  os_log_type_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v122 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v0 + 232) = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, &v122);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v119, v0 + 240, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  uint64_t v7 = &LegacyProfilesAdapter;
  id v8 = [*(id *)(v0 + 240) declaration];
  *(void *)(v0 + 312) = v8;
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___RMModelLegacyProfileDeclaration);
  uint64_t v10 = swift_dynamicCastObjCClass(v8, v9);
  if (!v10)
  {
    uint64_t v32 = *(void **)(v0 + 240);

    Swift::Int v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.debug.getter();
    BOOL v35 = os_log_type_enabled(v33, v34);
    v36 = *(void **)(v0 + 240);
    v37 = &LegacyProfilesAdapter;
    if (v35)
    {
      uint64_t v38 = swift_slowAlloc(22LL, -1LL);
      uint64_t v39 = swift_slowAlloc(64LL, -1LL);
      uint64_t v122 = v39;
      *(_DWORD *)uint64_t v38 = 136315394;
      *(void *)(v0 + 176) = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 176, v0 + 184, v38 + 4, v38 + 12);
      *(_WORD *)(v38 + 12) = 2080;
      id v40 = [v36 declaration];
      id v41 = [v40 declarationType];

      uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      unint64_t v44 = v43;

      *(void *)(v0 + 168) = sub_1000053C4(v42, v44, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v38 + 14, v38 + 22);

      unint64_t v45 = v44;
      uint64_t v7 = &LegacyProfilesAdapter;
      swift_bridgeObjectRelease(v45);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s: invalid declaration type: %s", (uint8_t *)v38, 0x16u);
      swift_arrayDestroy(v39, 2LL, (char *)&type metadata for Any + 8);
      uint64_t v46 = v39;
      v37 = &LegacyProfilesAdapter;
      swift_slowDealloc(v46, -1LL, -1LL);
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    else
    {
    }

    v61 = *(void **)(v0 + 240);
    uint64_t v122 = 0LL;
    unint64_t v123 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(28LL);
    swift_bridgeObjectRelease(v123);
    uint64_t v122 = 0xD00000000000001ALL;
    unint64_t v123 = 0x800000010000AC70LL;
    id v62 = [v61 (SEL)v7[235].count];
    id v63 = [v62 (SEL)v37[240].count];

    uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
    v66 = v65;

    v67._countAndFlagsBits = v64;
    v67._object = v66;
    String.append(_:)(v67);
    swift_bridgeObjectRelease(v66);
    uint64_t v68 = v122;
    unint64_t v69 = v123;
    unint64_t v70 = sub_100008E7C();
    swift_allocError(&type metadata for LegacyProfilesAdapter.AdapterError, v70, 0LL, 0LL);
    *(void *)uint64_t v71 = v68;
    *(void *)(v71 + 8) = v69;
    *(_BYTE *)(v71 + 16) = 0;
    swift_willThrow();
    goto LABEL_26;
  }

  uint64_t v11 = (void *)v10;
  v116 = (uint64_t *)(v0 + 144);
  v115 = (uint64_t *)(v0 + 160);
  uint64_t v13 = *(void *)(v0 + 288);
  uint64_t v12 = *(void *)(v0 + 296);
  uint64_t v15 = *(void *)(v0 + 264);
  uint64_t v14 = *(void *)(v0 + 272);
  id v16 = v8;
  id v118 = v11;
  id v17 = [v11 payloadProfileURL];
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  uint64_t v20 = v19;

  URL.init(string:)(v18, v20);
  swift_bridgeObjectRelease(v20);
  sub_100008EC0(v12, v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v13, 1LL, v15) == 1)
  {
    sub_100008F08(*(void *)(v0 + 288), &qword_100010BA0);
    id v21 = v16;
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v114 = v0 + 136;
      uint64_t v24 = swift_slowAlloc(22LL, -1LL);
      uint64_t v120 = swift_slowAlloc(64LL, -1LL);
      uint64_t v122 = v120;
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t *v115 = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v115, v0 + 168, v24 + 4, v24 + 12);
      *(_WORD *)(v24 + 12) = 2082;
      uint64_t v25 = v118;
      id v26 = [v118 payloadProfileURL];
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      unint64_t v29 = v28;

      uint64_t v30 = v27;
      id v31 = &LegacyProfilesAdapter;
      *(void *)(v0 + 136) = sub_1000053C4(v30, v29, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v116, v24 + 14, v24 + 22);

      swift_bridgeObjectRelease(v29);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s: invalid URL: %{public}s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy(v120, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v120, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    else
    {

      uint64_t v25 = v118;
      id v31 = &LegacyProfilesAdapter;
    }

    uint64_t v72 = *(void *)(v0 + 296);
    id v73 = objc_msgSend(v25, (SEL)v31[241].count, v114);
    uint64_t v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v73);
    uint64_t v76 = v75;

    unint64_t v77 = sub_100008E7C();
    swift_allocError(&type metadata for LegacyProfilesAdapter.AdapterError, v77, 0LL, 0LL);
    *(void *)uint64_t v78 = v74;
    *(void *)(v78 + 8) = v76;
    *(_BYTE *)(v78 + 16) = 1;
    swift_willThrow();

    uint64_t v79 = v72;
LABEL_25:
    sub_100008F08(v79, &qword_100010BA0);
LABEL_26:
    uint64_t v106 = *(void *)(v0 + 288);
    uint64_t v107 = *(void *)(v0 + 280);
    swift_task_dealloc(*(void *)(v0 + 296));
    swift_task_dealloc(v106);
    swift_task_dealloc(v107);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  (*(void (**)(void, void, void))(*(void *)(v0 + 272) + 32LL))( *(void *)(v0 + 280),  *(void *)(v0 + 288),  *(void *)(v0 + 264));
  v47 = (void *)objc_opt_self(&OBJC_CLASS___RMStoreUtility);
  URL._bridgeToObjectiveC()(v48);
  v50 = v49;
  unsigned int v51 = [v47 isValidURL:v49];

  id v52 = v16;
  v53 = (os_log_s *)Logger.logObject.getter(v52);
  os_log_type_t v54 = static os_log_type_t.debug.getter();
  BOOL v55 = os_log_type_enabled(v53, v54);
  if (!v51)
  {
    if (v55)
    {
      uint64_t v80 = swift_slowAlloc(22LL, -1LL);
      uint64_t v121 = swift_slowAlloc(64LL, -1LL);
      uint64_t v122 = v121;
      *(_DWORD *)uint64_t v80 = 136315394;
      uint64_t *v116 = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v116, v0 + 152, v80 + 4, v80 + 12);
      *(_WORD *)(v80 + 12) = 2082;
      v81 = v118;
      id v82 = [v118 payloadProfileURL];
      uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v82);
      unint64_t v85 = v84;

      *(void *)(v0 + 152) = sub_1000053C4(v83, v85, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v115, v80 + 14, v80 + 22);

      swift_bridgeObjectRelease(v85);
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s: invalid URL scheme: %{public}s", (uint8_t *)v80, 0x16u);
      swift_arrayDestroy(v121, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v121, -1LL, -1LL);
      swift_slowDealloc(v80, -1LL, -1LL);
    }

    else
    {

      v81 = v118;
    }

    uint64_t v96 = *(void *)(v0 + 296);
    uint64_t v98 = *(void *)(v0 + 272);
    uint64_t v97 = *(void *)(v0 + 280);
    uint64_t v99 = *(void *)(v0 + 264);
    id v100 = [v81 payloadProfileURL];
    uint64_t v101 = static String._unconditionallyBridgeFromObjectiveC(_:)(v100);
    uint64_t v103 = v102;

    unint64_t v104 = sub_100008E7C();
    swift_allocError(&type metadata for LegacyProfilesAdapter.AdapterError, v104, 0LL, 0LL);
    *(void *)uint64_t v105 = v101;
    *(void *)(v105 + 8) = v103;
    *(_BYTE *)(v105 + 16) = 1;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
    uint64_t v79 = v96;
    goto LABEL_25;
  }

  if (v55)
  {
    uint64_t v56 = swift_slowAlloc(22LL, -1LL);
    uint64_t v117 = swift_slowAlloc(64LL, -1LL);
    uint64_t v122 = v117;
    *(_DWORD *)uint64_t v56 = 136315394;
    *(void *)(v0 + 216) = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, &v122);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v56 + 4, v56 + 12);
    *(_WORD *)(v56 + 12) = 2082;
    id v57 = [v118 declarationIdentifier];
    uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
    unint64_t v60 = v59;

    *(void *)(v0 + 224) = sub_1000053C4(v58, v60, &v122);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v119, v56 + 14, v56 + 22);

    swift_bridgeObjectRelease(v60);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s: installing profile: %{public}s", (uint8_t *)v56, 0x16u);
    swift_arrayDestroy(v117, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v117, -1LL, -1LL);
    swift_slowDealloc(v56, -1LL, -1LL);
  }

  else
  {
  }

  *(void *)(v0 + 320) = v86;
  if (v86)
  {
    uint64_t v87 = v0 + 16;
    uint64_t v88 = *(void *)(v0 + 240);
    id v89 = v86;
    URL._bridgeToObjectiveC()(v90);
    uint64_t v92 = v91;
    *(void *)(v0 + 328) = v91;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_100008218;
    uint64_t v93 = swift_continuation_init(v0 + 16, 1LL);
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    v94 = (void *)(v0 + 80);
    v94[1] = 0x40000000LL;
    v94[2] = sub_10000489C;
    v94[3] = &unk_10000C7F8;
    v94[4] = v93;
    [v89 downloadAndInstallProfileConfiguration:v88 fromURL:v92 completionHandler:v94];
    return swift_continuation_await(v87);
  }

  else
  {
    v108 = *(void **)(v0 + 312);
    uint64_t v109 = *(void *)(v0 + 288);
    uint64_t v110 = *(void *)(v0 + 296);
    uint64_t v112 = *(void *)(v0 + 272);
    uint64_t v111 = *(void *)(v0 + 280);
    uint64_t v113 = *(void *)(v0 + 264);

    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
    sub_100008F08(v110, &qword_100010BA0);
    swift_task_dealloc(v110);
    swift_task_dealloc(v109);
    swift_task_dealloc(v111);
    return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
  }

uint64_t sub_100008218()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 336LL) = v1;
  if (v1) {
    uint64_t v2 = sub_100008320;
  }
  else {
    uint64_t v2 = sub_100008278;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100008278()
{
  uint64_t v1 = *(void **)(v0 + 320);
  uint64_t v2 = *(void **)(v0 + 328);
  swift_bridgeObjectRelease(*(void *)(v0 + 128));

  os_log_type_t v3 = *(void **)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v8 = *(void *)(v0 + 264);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_100008F08(v5, &qword_100010BA0);
  swift_task_dealloc(v5);
  swift_task_dealloc(v4);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
}

uint64_t sub_100008320()
{
  uint64_t v2 = *(void **)(v0 + 328);
  uint64_t v1 = *(void *)(v0 + 336);
  os_log_type_t v3 = *(void **)(v0 + 320);
  swift_willThrow();

  swift_errorRetain(v1);
  uint64_t v4 = swift_errorRetain(v1);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void *)(v0 + 336);
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    uint64_t v9 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v35 = swift_slowAlloc(32LL, -1LL);
    v37[0] = v35;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 200) = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v8 + 4, v8 + 12);
    *(_WORD *)(v8 + 12) = 2112;
    swift_errorRetain(v7);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(void *)(v0 + 208) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v8 + 14, v8 + 22);
    *uint64_t v9 = v10;
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "%s: failed to download and install profile: %@",  (uint8_t *)v8,  0x16u);
    uint64_t v11 = sub_100003610(&qword_100010B90);
    swift_arrayDestroy(v9, 1LL, v11);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 336);
    swift_errorRelease(v12);
    swift_errorRelease(v12);
  }

  uint64_t v13 = *(void **)(v0 + 248);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc(22LL, -1LL);
      uint64_t v18 = swift_slowAlloc(64LL, -1LL);
      v37[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315394;
      *(void *)(v0 + 184) = sub_1000053C4(0xD000000000000024LL, 0x800000010000AC90LL, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v17 + 4, v17 + 12);
      *(_WORD *)(v17 + 12) = 2082;
      id v19 = [v14 key];
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
      unint64_t v22 = v21;

      *(void *)(v0 + 192) = sub_1000053C4(v20, v22, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v17 + 14, v17 + 22);

      swift_bridgeObjectRelease(v22);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "%s: removing replaced profile: %{public}s",  (uint8_t *)v17,  0x16u);
      swift_arrayDestroy(v18, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    else
    {
    }

    v36 = (uint64_t (*)(uint64_t))((char *)&dword_100010A10 + dword_100010A10);
    os_log_type_t v34 = (void *)swift_task_alloc(unk_100010A14);
    *(void *)(v0 + 344) = v34;
    *os_log_type_t v34 = v0;
    v34[1] = sub_1000087A8;
    return v36((uint64_t)v14);
  }

  else
  {
    uint64_t v23 = *(void *)(v0 + 336);
    uint64_t v24 = *(void **)(v0 + 312);
    uint64_t v25 = *(void *)(v0 + 296);
    uint64_t v27 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 280);
    uint64_t v28 = *(void *)(v0 + 264);
    unint64_t v29 = sub_100008E7C();
    swift_allocError(&type metadata for LegacyProfilesAdapter.AdapterError, v29, 0LL, 0LL);
    *(void *)uint64_t v30 = v23;
    *(void *)(v30 + 8) = 0LL;
    *(_BYTE *)(v30 + 16) = 2;
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    sub_100008F08(v25, &qword_100010BA0);
    uint64_t v31 = *(void *)(v0 + 288);
    uint64_t v32 = *(void *)(v0 + 280);
    swift_task_dealloc(*(void *)(v0 + 296));
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_1000087A8()
{
  if (v0)
  {
    swift_errorRelease(v0);
    uint64_t v2 = sub_1000092F0;
  }

  else
  {
    uint64_t v2 = sub_100008814;
  }

  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_100008814()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void **)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v6 = *(void *)(v0 + 264);
  unint64_t v7 = sub_100008E7C();
  swift_allocError(&type metadata for LegacyProfilesAdapter.AdapterError, v7, 0LL, 0LL);
  *(void *)uint64_t v8 = v1;
  *(void *)(v8 + 8) = 0LL;
  *(_BYTE *)(v8 + 16) = 2;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_100008F08(v3, &qword_100010BA0);
  uint64_t v9 = *(void *)(v0 + 288);
  uint64_t v10 = *(void *)(v0 + 280);
  swift_task_dealloc(*(void *)(v0 + 296));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000088EC()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100008920()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_100010AAC);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000092E4;
  return ((uint64_t (*)(void *, int, void *, void *))((char *)&dword_100010AA8 + dword_100010AA8))( v2,  v3,  v5,  v4);
}

uint64_t sub_10000899C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100010ABC);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000092E4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100010AB8 + dword_100010AB8))(v2, v3, v4);
}

uint64_t sub_100008A18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc(dword_100010ACC);
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_1000092E4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100010AC8 + dword_100010AC8))( a1,  v4,  v5,  v6);
}

uint64_t sub_100008A9C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100008AC0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_100010ADC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000040BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100010AD8 + dword_100010AD8))(a1, v4);
}

uint64_t sub_100008B30()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_100008B6C()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)v0[5];
  uint64_t v6 = (void *)v0[6];
  unint64_t v7 = (void *)swift_task_alloc(dword_100010AEC);
  *(void *)(v1 + 16) = v7;
  *unint64_t v7 = v1;
  v7[1] = sub_1000092E4;
  return ((uint64_t (*)(void *, void *, int, void *, void *))((char *)&dword_100010AE8 + dword_100010AE8))( v2,  v3,  v4,  v5,  v6);
}

uint64_t sub_100008BF8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100010B14);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000040BC;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_100010B10 + dword_100010B10))(v2, v3, v4);
}

uint64_t sub_100008C6C(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_100008CA4()
{
  unint64_t result = qword_100010B38;
  if (!qword_100010B38)
  {
    uint64_t v1 = sub_100008C6C(255LL, &qword_100010B30, &OBJC_CLASS___RMStoreDeclarationKey_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100010B38);
  }

  return result;
}

uint64_t sub_100008CFC()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100008D28()
{
  int v2 = *(unsigned __int8 *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void **)(v0 + 32);
  uint64_t v5 = *(void **)(v0 + 40);
  uint64_t v6 = (void *)swift_task_alloc(dword_100010B44);
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1000092E4;
  return ((uint64_t (*)(int, int, void *, void *))((char *)&dword_100010B40 + dword_100010B40))( v2,  v3,  v4,  v5);
}

uint64_t sub_100008DB0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100008DDC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_100010B64);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000092E4;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100010B60 + dword_100010B60))(v2, v3, v4);
}

uint64_t sub_100008E50()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_100008E7C()
{
  unint64_t result = qword_100010B88;
  if (!qword_100010B88)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009ED4, &type metadata for LegacyProfilesAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100010B88);
  }

  return result;
}

uint64_t sub_100008EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003610(&qword_100010BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008F08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003610(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_100008F44(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008F64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100008FA4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100008FE8(uint64_t a1, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
      uint64_t result = swift_bridgeObjectRetain(a2);
      break;
    case 2:
    case 3:
      uint64_t result = swift_errorRetain();
      break;
    default:
      return result;
  }

  return result;
}

uint64_t destroy for LegacyProfilesAdapter.AdapterError(uint64_t a1)
{
  return sub_100009030(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_100009030(uint64_t result, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
      uint64_t result = swift_bridgeObjectRelease(a2);
      break;
    case 2:
    case 3:
      uint64_t result = swift_errorRelease(result);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t _s24LegacyProfilesSubscriber21LegacyProfilesAdapterC12AdapterErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_100008FE8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LegacyProfilesAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_100008FE8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100009030(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for LegacyProfilesAdapter.AdapterError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LegacyProfilesAdapter.AdapterError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100009030(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyProfilesAdapter.AdapterError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyProfilesAdapter.AdapterError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1000091E8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1000091F4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LegacyProfilesAdapter.AdapterError()
{
  return &type metadata for LegacyProfilesAdapter.AdapterError;
}

unint64_t sub_100009214()
{
  unint64_t result = qword_100010BC0;
  if (!qword_100010BC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009E5C, &type metadata for LegacyProfilesAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100010BC0);
  }

  return result;
}

unint64_t sub_10000925C()
{
  unint64_t result = qword_100010BC8;
  if (!qword_100010BC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009E14, &type metadata for LegacyProfilesAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100010BC8);
  }

  return result;
}

unint64_t sub_1000092A0()
{
  unint64_t result = qword_100010BD0;
  if (!qword_100010BD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009E9C, &type metadata for LegacyProfilesAdapter.AdapterError);
    atomic_store(result, (unint64_t *)&qword_100010BD0);
  }

  return result;
}

id sub_10000949C(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for LegacyProfilesApplicator()
{
  return objc_opt_self(&OBJC_CLASS____TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator);
}

void *sub_1000094F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100003610((uint64_t *)&unk_100010D30);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v26 = a1 + 32;
    while (1)
    {
      char v6 = (uint64_t *)(v26 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v27, *(void *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v27, v8, v7);
      Swift::Int v9 = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = v9 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        os_log_type_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          id v19 = (void *)(v15 + 16 * v11);
          BOOL v20 = *v19 == v8 && v19[1] == v7;
          if (v20 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_3;
          }
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *unint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1LL);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return (void *)static CustomNSError.errorDomain.getter();
      }

      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return (void *)v3;
      }
    }
  }

  return &_swiftEmptySetSingleton;
}