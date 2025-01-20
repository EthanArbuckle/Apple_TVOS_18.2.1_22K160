int main(int argc, const char **argv, const char **envp)
{
  id v3;
  qword_10000C960 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [(id)objc_opt_self(NSXPCListener) serviceListener];
  qword_10000C968 = (uint64_t)v3;
  [v3 setDelegate:qword_10000C960];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC13IngestService15ServiceDelegate);
}

id sub_100004118()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100004278(void *a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;

  v3[4] = v8;
  v3[5] = v10;
  return swift_task_switch(sub_1000042F0, 0LL, 0LL);
}

uint64_t sub_1000042F0()
{
  *(void *)(v0 + 48) = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC13IngestService13IngestService_storage);
  uint64_t v1 = type metadata accessor for PersistentStorage(0LL);
  unint64_t v2 = sub_100005394();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, v2);
  return swift_task_switch(sub_10000435C, v3, v4);
}

uint64_t sub_10000435C()
{
  uint64_t v1 = dispatch thunk of PersistentStorage.create(_:)(*(void *)(v0 + 32), *(void *)(v0 + 40));
  *(void *)(v0 + 56) = 0LL;
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 24);

  sub_100005BA8(v4, v3);
  (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, v2, 0LL);
  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000440C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  unint64_t v2 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 24);

  sub_100005BA8(v3, v2);
  uint64_t v5 = (void *)_convertErrorToNSError(_:)(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t))(v4 + 16))(v4);

  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004488(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for StagingEntry(0LL);
  v2[4] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[5] = v4;
  unint64_t v5 = (*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[6] = swift_task_alloc(v5);
  v2[7] = swift_task_alloc(v5);
  unint64_t v6 = (*(void *)(*(void *)(sub_100005420(&qword_10000C820) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[8] = swift_task_alloc(v6);
  v2[9] = swift_task_alloc(v6);
  return swift_task_switch(sub_10000452C, 0LL, 0LL);
}

uint64_t sub_10000452C()
{
  *(void *)(v0 + 80) = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC13IngestService13IngestService_storage);
  uint64_t v1 = type metadata accessor for PersistentStorage(0LL);
  unint64_t v2 = sub_100005394();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, v2);
  return swift_task_switch(sub_100004598, v3, v4);
}

uint64_t sub_100004598()
{
  *(void *)(v0 + 88) = 0LL;
  return swift_task_switch(sub_1000045F8, 0LL, 0LL);
}

uint64_t sub_1000045F8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  sub_10000549C(*(void *)(v0 + 72), v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1LL, v2) == 1)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v5 = *(void *)(v0 + 56);
    uint64_t v7 = *(void *)(v0 + 40);
    uint64_t v6 = *(void *)(v0 + 48);
    uint64_t v8 = *(void *)(v0 + 32);
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v5, *(void *)(v0 + 64), v8);
    type metadata accessor for DEStagingEntry(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8);
    uint64_t v4 = DEStagingEntry.__allocating_init(_:)(v6);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v8);
  }

  uint64_t v10 = *(void *)(v0 + 64);
  uint64_t v9 = *(void *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 56);
  sub_10000586C(v9, &qword_10000C820);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_100004700()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  swift_task_dealloc(*(void *)(v0 + 72));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004884(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v6 = dword_10000C804;
  a3;
  uint64_t v7 = (void *)swift_task_alloc(v6);
  v3[4] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_1000048F8;
  return sub_100004488(a1);
}

uint64_t sub_1000048F8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*v2 + 32);
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc(v5);

  uint64_t v8 = *(void (***)(void, void, void))(v7 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    ((void (**)(void, void, void *))v8)[2](v8, 0LL, v9);

    _Block_release(v8);
  }

  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0LL);
    _Block_release(v8);
  }

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_1000049B4()
{
  v1[5] = v0;
  uint64_t v2 = type metadata accessor for InternalLogger(0LL);
  v1[6] = v2;
  v1[7] = swift_task_alloc((*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for IngestionExtensionHost(0LL);
  v1[8] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[9] = v4;
  v1[10] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100004A38, 0LL, 0LL);
}

uint64_t sub_100004A38()
{
  if (qword_10000C6D0 != -1) {
    swift_once(&qword_10000C6D0, sub_100005F2C);
  }
  uint64_t v1 = v0[5];
  v0[11] = sub_10000537C(v0[6], (uint64_t)qword_10000C970);
  uint64_t v2 = sub_100005BF0( 0LL,  0xE000000000000000LL,  0xD000000000000050LL,  0x80000001000072E0LL,  0x2928747365676E69LL,  0xE800000000000000LL);
  IngestionExtensionHost.init()(v2);
  v0[12] = *(void *)(v1 + OBJC_IVAR____TtC13IngestService13IngestService_storage);
  uint64_t v3 = type metadata accessor for PersistentStorage(0LL);
  unint64_t v4 = sub_100005394();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, v4);
  return swift_task_switch(sub_100004B2C, v5, v6);
}

uint64_t sub_100004B2C()
{
  *(void *)(v0 + 104) = 0LL;
  uint64_t v1 = (void *)swift_task_alloc(async function pointer to IngestionExtensionHost.ingest()[1]);
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100004BB8;
  return IngestionExtensionHost.ingest()();
}

uint64_t sub_100004BB8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 112LL);
  *(void *)(*(void *)v1 + 120LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100004E1C;
  }
  else {
    uint64_t v3 = sub_100004C1C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100004C1C()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 56);
  sub_100005C08( 0x676E69796C706572LL,  0xE800000000000000LL,  0xD000000000000050LL,  0x80000001000072E0LL,  0x2928747365676E69LL,  0xE800000000000000LL);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004CC8()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 56);
  sub_1000053DC(*(void *)(v0 + 88), v5);
  _StringGuts.grow(_:)(56LL);
  *(void *)(v0 + 16) = 0LL;
  *(void *)(v0 + 24) = 0xE000000000000000LL;
  v6._object = (void *)0x8000000100007340LL;
  v6._countAndFlagsBits = 0xD000000000000036LL;
  String.append(_:)(v6);
  *(void *)(v0 + 32) = v1;
  uint64_t v7 = sub_100005420(&qword_10000C818);
  _print_unlocked<A, B>(_:_:)( v0 + 32,  v0 + 16,  v7,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  unint64_t v8 = *(void *)(v0 + 24);
  sub_100005BFC( *(void *)(v0 + 16),  v8,  0xD000000000000050LL,  0x80000001000072E0LL,  0x2928747365676E69LL,  0xE800000000000000LL);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = sub_100005460(v5);
  swift_willThrow(v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004E1C()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 56);
  sub_1000053DC(*(void *)(v0 + 88), v5);
  _StringGuts.grow(_:)(56LL);
  *(void *)(v0 + 16) = 0LL;
  *(void *)(v0 + 24) = 0xE000000000000000LL;
  v6._object = (void *)0x8000000100007340LL;
  v6._countAndFlagsBits = 0xD000000000000036LL;
  String.append(_:)(v6);
  *(void *)(v0 + 32) = v1;
  uint64_t v7 = sub_100005420(&qword_10000C818);
  _print_unlocked<A, B>(_:_:)( v0 + 32,  v0 + 16,  v7,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  unint64_t v8 = *(void *)(v0 + 24);
  sub_100005BFC( *(void *)(v0 + 16),  v8,  0xD000000000000050LL,  0x80000001000072E0LL,  0x2928747365676E69LL,  0xE800000000000000LL);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = sub_100005460(v5);
  swift_willThrow(v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000508C(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_10000C80C;
  a2;
  uint64_t v5 = (void *)swift_task_alloc(v4);
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000050EC;
  return sub_1000049B4();
}

uint64_t sub_1000050EC()
{
  uint64_t v2 = *(void *)(*v1 + 32);
  uint64_t v3 = *(void **)(*v1 + 16);
  uint64_t v4 = *v1;
  swift_task_dealloc(v2);

  uint64_t v5 = *(void *)(v4 + 24);
  if (v0)
  {
    Swift::String v6 = (void *)_convertErrorToNSError(_:)(v0);
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

id sub_10000531C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IngestService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IngestService()
{
  return objc_opt_self(&OBJC_CLASS____TtC13IngestService13IngestService);
}

uint64_t sub_10000537C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100005394()
{
  unint64_t result = qword_10000C810;
  if (!qword_10000C810)
  {
    uint64_t v1 = type metadata accessor for PersistentStorage(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for PersistentStorage, v1);
    atomic_store(result, (unint64_t *)&qword_10000C810);
  }

  return result;
}

uint64_t sub_1000053DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005420(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005460(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000549C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005420(&qword_10000C820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000054E4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100005510()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_10000C83C);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_100005BEC;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_10000C838 + dword_10000C838))(v2, v3);
}

uint64_t sub_100005574(uint64_t a1, uint64_t a2, int *a3)
{
  Swift::String v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005BEC;
  return v6();
}

uint64_t sub_1000055CC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C84C);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005BEC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10000C848 + dword_10000C848))(v2, v3, v4);
}

uint64_t sub_100005644(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100005BEC;
  return v7();
}

uint64_t sub_10000569C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  Swift::String v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_10000C85C);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005BEC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10000C858 + dword_10000C858))( a1,  v4,  v5,  v6);
}

uint64_t sub_100005720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10000586C(a1, &qword_10000C830);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_100008488, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10000C870, v16);
}

uint64_t sub_10000586C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005420(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_1000058A8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000590C;
  return v6(a1);
}

uint64_t sub_10000590C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005958(uint64_t a1, uint64_t a2)
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_10000597C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C86C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000059EC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000C868 + dword_10000C868))(a1, v4);
}

uint64_t sub_1000059EC()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005A34()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100005A60()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C87C);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005BEC;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_10000C878 + dword_10000C878))(v2, v3, v4);
}

uint64_t sub_100005AD4()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100005B08()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10000C89C);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000059EC;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_10000C898 + dword_10000C898))(v2, v3, v4);
}

uint64_t sub_100005B7C()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100005BA8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result, a2);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL, a2);
}

uint64_t sub_100005BF0( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_100005C14(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_100005BFC( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_100005C14(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_100005C08( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_100005C14(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))&static os_log_type_t.debug.getter);
}

uint64_t sub_100005C14( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v38 = a5;
  uint64_t v39 = a1;
  uint64_t v36 = a3;
  uint64_t v37 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v37 - 8);
  __chkstk_darwin();
  uint64_t v14 = &v32[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin();
  v18 = &v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16))(v18, v7, v15);
  swift_bridgeObjectRetain_n(a4, 2LL);
  swift_bridgeObjectRetain_n(a6, 2LL);
  unint64_t v40 = a2;
  uint64_t v19 = swift_bridgeObjectRetain_n(a2, 2LL);
  v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = a7();
  int v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    uint64_t v35 = v16;
    uint64_t v24 = v23;
    uint64_t v34 = swift_slowAlloc(96LL, -1LL);
    uint64_t v42 = v34;
    *(_DWORD *)uint64_t v24 = 136315650;
    uint64_t v25 = URL.init(fileURLWithPath:)(v36, a4);
    int v33 = v22;
    uint64_t v26 = URL.lastPathComponent.getter(v25);
    uint64_t v36 = v15;
    unint64_t v28 = v27;
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v37);
    uint64_t v41 = sub_100006074(v26, v28, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease_n(a4, 2LL);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain(a6);
    uint64_t v41 = sub_100006074(v38, a6, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 14, v24 + 22);
    swift_bridgeObjectRelease_n(a6, 3LL);
    *(_WORD *)(v24 + 22) = 2080;
    unint64_t v29 = v40;
    swift_bridgeObjectRetain(v40);
    uint64_t v41 = sub_100006074(v39, v29, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v24 + 24, v24 + 32);
    swift_bridgeObjectRelease_n(v29, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v33, "[%s: %s] %s", (uint8_t *)v24, 0x20u);
    uint64_t v30 = v34;
    swift_arrayDestroy(v34, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_slowDealloc(v24, -1LL, -1LL);

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v35 + 8))(v18, v36);
  }

  else
  {

    swift_bridgeObjectRelease_n(v40, 2LL);
    swift_bridgeObjectRelease_n(a6, 2LL);
    swift_bridgeObjectRelease_n(a4, 2LL);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t sub_100005F2C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for InternalLogger(0LL);
  sub_100006714(v4, qword_10000C970);
  uint64_t v5 = sub_10000537C(v4, (uint64_t)qword_10000C970);
  if (qword_10000C6D8 != -1) {
    swift_once(&qword_10000C6D8, sub_10000600C);
  }
  Logger.init(_:)((id)qword_10000C8B8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
}

uint64_t sub_10000600C()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD000000000000017LL,  0x80000001000075F0LL,  0x6553747365676E49LL,  0xED00006563697672LL);
  qword_10000C8B8 = result;
  return result;
}

uint64_t sub_100006074(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006144(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000066D4((uint64_t)v12, *a3);
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
      sub_1000066D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000066B4(v12);
  return v7;
}

uint64_t sub_100006144(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000062FC(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_1000062FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006390(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006568(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006568(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006390(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_100006504(v4, 0LL);
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

void *sub_100006504(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100005420(&qword_10000C8C0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006568(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005420(&qword_10000C8C0);
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

uint64_t sub_1000066B4(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = *(void *)(v1 - 8);
  if ((*(_BYTE *)(v2 + 82) & 2) != 0) {
    return swift_release(*a1, v1);
  }
  else {
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_1000066D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006714(uint64_t a1, uint64_t *a2)
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

uint64_t type metadata accessor for InternalLogger(uint64_t a1)
{
  uint64_t result = qword_10000C928;
  if (!qword_10000C928) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InternalLogger);
  }
  return result;
}

unint64_t sub_100006790()
{
  unint64_t result = qword_10000C8C8;
  if (!qword_10000C8C8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C8C8);
  }

  return result;
}

uint64_t sub_1000067CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_100006808(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_10000683C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006880(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000068C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006908(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t sub_10000694C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006958);
}

uint64_t sub_100006958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t sub_100006994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000069A0);
}

uint64_t sub_1000069A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t sub_1000069E0(uint64_t a1)
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