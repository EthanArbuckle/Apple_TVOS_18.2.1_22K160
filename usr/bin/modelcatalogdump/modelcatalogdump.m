uint64_t sub_100001B04()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  v0 = sub_10000228C(&qword_100010078);
  __chkstk_darwin(v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v3 = type metadata accessor for CommandConfiguration(0LL);
  sub_1000022CC(v3, qword_100010270);
  sub_100002274(v3, (uint64_t)qword_100010270);
  v4 = type metadata accessor for NameSpecification(0LL);
  sub_10000230C((uint64_t)v2, 1LL, 1LL, v4);
  v6 = 1;
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)( 0LL,  0LL,  0xD00000000000002DLL,  0x800000010000B530LL,  0LL,  0LL,  0LL,  0xE000000000000000LL,  0LL,  0xE000000000000000LL,  v6,  _swiftEmptyArrayStorage,  0LL,  0LL,  v2);
}

uint64_t sub_100001C08()
{
  if (qword_100010028 != -1) {
    swift_once(&qword_100010028, sub_100001B04);
  }
  uint64_t v0 = type metadata accessor for CommandConfiguration(0LL);
  return sub_100002274(v0, (uint64_t)qword_100010270);
}

uint64_t sub_100001C50()
{
  uint64_t v1 = type metadata accessor for Status(0LL);
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 24) = swift_task_alloc((*(void *)(*(void *)(v1 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return sub_100002364();
}

uint64_t sub_100001CA0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = sub_1000021F8();
  static ParsableArguments.parse(_:)(&off_10000C668, v1, v2);
  v3 = (void *)swift_task_alloc(dword_100010084);
  *(void *)(v0 + 32) = v3;
  void *v3 = v0;
  v3[1] = sub_100001D40;
  return sub_100002370();
}

uint64_t sub_100001D40()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = v0;
  swift_task_dealloc(v2);
  return sub_100002364();
}

uint64_t sub_100001D9C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_100002238(v1);
  swift_task_dealloc(v1);
  return sub_100002338(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100001DD4()
{
  return sub_100002338(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100001E08(void *a1)
{
  return sub_100002318(a1);
}

uint64_t sub_100001E2C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10001006C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100001E70;
  return sub_100001C50();
}

uint64_t sub_100001E70()
{
  return sub_100002338(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100001E94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100001C08();
  uint64_t v3 = type metadata accessor for CommandConfiguration(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v2, v3);
}

void sub_100001ED8()
{
}

void sub_100001EF0()
{
}

uint64_t sub_100001F08(void *a1)
{
  return sub_100001E08(a1);
}

uint64_t sub_100001F1C()
{
  v0[2] = type metadata accessor for MainActor(0LL);
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to static AsyncParsableCommand.main() + 1));
  v0[4] = v1;
  sub_1000020EC();
  *uint64_t v1 = v0;
  v1[1] = sub_100001F94;
  return static AsyncParsableCommand.main()();
}

uint64_t sub_100001F94()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 32LL));
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100002004, v2, v3);
}

void sub_100002004()
{
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = swift_task_create(2048LL, 0LL, (char *)&type metadata for () + 8, &unk_100010030, 0LL);
  uint64_t MainExecutor = swift_task_getMainExecutor();
  uint64_t v6 = swift_job_run(v3, MainExecutor, v5);
  int result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_100002080()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10001003C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000020C4;
  return sub_100001F1C();
}

uint64_t sub_1000020C4()
{
  return sub_100002338(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_1000020EC()
{
  unint64_t result = qword_100010040;
  if (!qword_100010040)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000B04C, &type metadata for modelcatalogdump);
    atomic_store(result, (unint64_t *)&qword_100010040);
  }

  return result;
}

ValueMetadata *type metadata accessor for modelcatalogdump()
{
  return &type metadata for modelcatalogdump;
}

unint64_t sub_10000213C()
{
  unint64_t result = qword_100010048;
  if (!qword_100010048)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AFA4, &type metadata for modelcatalogdump);
    atomic_store(result, (unint64_t *)&qword_100010048);
  }

  return result;
}

unint64_t sub_10000217C()
{
  unint64_t result = qword_100010050;
  if (!qword_100010050)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000AFCC, &type metadata for modelcatalogdump);
    atomic_store(result, (unint64_t *)&qword_100010050);
  }

  return result;
}

unint64_t sub_1000021BC()
{
  unint64_t result = qword_100010058;
  if (!qword_100010058)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000B00C, &type metadata for modelcatalogdump);
    atomic_store(result, (unint64_t *)&qword_100010058);
  }

  return result;
}

unint64_t sub_1000021F8()
{
  unint64_t result = qword_100010070;
  if (!qword_100010070)
  {
    uint64_t v1 = type metadata accessor for Status(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10000B150, v1);
    atomic_store(result, (unint64_t *)&qword_100010070);
  }

  return result;
}

uint64_t sub_100002238(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Status(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100002274(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000228C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t *sub_1000022CC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000230C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100002318(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100002338(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100002344()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100002364()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100002370()
{
  v1[40] = v0;
  uint64_t v2 = sub_10000228C(&qword_100010088);
  v1[41] = sub_10000A564(*(void *)(v2 - 8));
  uint64_t v3 = sub_10000228C(&qword_100010090);
  v1[42] = sub_10000A564(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for ResourceStatusOutput(0LL);
  v1[43] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v1[44] = v5;
  v1[45] = sub_10000A564(v5);
  uint64_t v6 = sub_10000228C(&qword_100010098);
  v1[46] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v1[47] = v7;
  v1[48] = sub_10000A564(v7);
  uint64_t v8 = sub_10000228C(&qword_1000100A0);
  v1[49] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v1[50] = v9;
  v1[51] = sub_10000A564(v9);
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags(0LL);
  v1[52] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v1[53] = v11;
  v1[54] = sub_10000A564(v11);
  uint64_t v12 = type metadata accessor for DispatchQoS(0LL);
  v1[55] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v1[56] = v13;
  v1[57] = sub_10000A564(v13);
  uint64_t v14 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  v1[58] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v1[59] = v15;
  v1[60] = sub_10000A564(v15);
  uint64_t v16 = type metadata accessor for AssetLock(0LL);
  v1[61] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v1[62] = v17;
  v1[63] = sub_10000A564(v17);
  uint64_t v18 = sub_10000A7D4();
  v1[64] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v1[65] = v19;
  v1[66] = *(void *)(v19 + 64);
  v1[67] = sub_10000A7BC();
  v1[68] = sub_10000A7BC();
  uint64_t v20 = type metadata accessor for ResourceReadinessStatus(0LL);
  v1[69] = v20;
  v1[70] = *(void *)(v20 - 8);
  v1[71] = sub_10000A7BC();
  v1[72] = sub_10000A7BC();
  sub_10000A7B0();
  return sub_100002364();
}

uint64_t sub_1000024F8()
{
  uint64_t v1 = *(void *)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 568);
  uint64_t v3 = *(void *)(v0 + 560);
  uint64_t v4 = *(void *)(v0 + 552);
  uint64_t v5 = *(void *)(v0 + 544);
  uint64_t v6 = *(void *)(v0 + 320);
  uint64_t v7 = type metadata accessor for CatalogClient(0LL);
  static CatalogClient.generativeExperienceEssentialResourcesStatus()();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))( v2,  enum case for ResourceReadinessStatus.initializing(_:),  v4);
  char v8 = static ResourceReadinessStatus.== infix(_:_:)(v1, v2);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v9(v2, v4);
  v9(v1, v4);
  sub_100004978(v6, v5);
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = *(void *)(v0 + 544);
    uint64_t v11 = sub_10000228C(&qword_1000100C0);
    Flag.wrappedValue.getter(v11);
    char v12 = *(_BYTE *)(v0 + 665);
    sub_100002238(v10);
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = sub_10000228C(&qword_1000100E0);
      uint64_t v14 = sub_10000A5B0(v13);
      *(_OWORD *)(v14 + 16) = xmmword_10000B080;
      *(void *)(v14 + 56) = &type metadata for String;
      *(void *)(v14 + 32) = 0xD00000000000003CLL;
      *(void *)(v14 + 40) = 0x800000010000B570LL;
      sub_10000A550(v14);
      sub_10000A710();
      uint64_t v15 = sub_10000A574();
      uint64_t v50 = *(void *)(v0 + 360);
      uint64_t v52 = *(void *)(v0 + 336);
      uint64_t v54 = *(void *)(v0 + 328);
      swift_task_dealloc(v15);
      sub_10000A65C();
      sub_10000A664();
      sub_10000A6EC();
      sub_10000A674();
      sub_10000A694();
      sub_10000A68C();
      sub_10000A66C();
      sub_10000A684();
      uint64_t v16 = sub_10000A67C();
      uint64_t v24 = sub_10000A720(v16, v17, v18, v19, v20, v21, v22, v23, v46, v48, v50);
      sub_10000A718(v24, v25, v26, v27, v28, v29, v30, v31, v47, v49, v51, v52);
      swift_task_dealloc(v54);
      sub_10000A78C();
      __asm { BR              X0 }
    }
  }

  else
  {
    sub_100002238(*(void *)(v0 + 544));
  }

  sub_1000033C8();
  sub_10000A550((uint64_t)_swiftEmptyArrayStorage);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  *(void *)(v0 + 584) = CatalogClient.init()();
  uint64_t v56 = dispatch thunk of CatalogClient.resources()();
  swift_bridgeObjectRetain(v56);
  sub_1000059CC(&v56, (uint64_t (*)(uint64_t))sub_100009B14, sub_100006B2C);
  uint64_t v33 = *(void *)(v0 + 320);
  sub_10000A710();
  uint64_t v34 = v56;
  uint64_t v35 = swift_task_alloc(32LL);
  *(void *)(v35 + 16) = v33;
  uint64_t v36 = sub_1000041B8((uint64_t)sub_100005A44, v35, v34);
  *(void *)(v0 + 592) = v36;
  sub_10000A664();
  uint64_t v37 = *(void *)(v36 + 16);
  if (v37)
  {
    uint64_t v53 = v36;
    v55 = (__int128 *)(v0 + 64);
    uint64_t v38 = v36 + 32;
    swift_bridgeObjectRetain(v36);
    v39 = _swiftEmptyArrayStorage;
    do
    {
      sub_100005A60(v38, v0 + 264);
      sub_100005A60(v0 + 264, v0 + 144);
      uint64_t v40 = sub_10000228C(&qword_1000100A8);
      uint64_t v41 = sub_10000228C(&qword_1000100B0);
      if ((swift_dynamicCast(v0 + 104, v0 + 144, v40, v41, 6LL) & 1) == 0)
      {
        *(void *)(v0 + 136) = 0LL;
        *(_OWORD *)(v0 + 104) = 0u;
        *(_OWORD *)(v0 + 120) = 0u;
      }

      sub_100002318((void *)(v0 + 264));
      if (*(void *)(v0 + 128))
      {
        sub_100009000((__int128 *)(v0 + 104), (uint64_t)v55);
        sub_100009000(v55, v0 + 184);
        if ((swift_isUniquelyReferenced_nonNull_native(v39) & 1) == 0) {
          v39 = sub_10000A8C0(0LL, v39[2] + 1LL);
        }
        unint64_t v43 = v39[2];
        unint64_t v42 = v39[3];
        if (v43 >= v42 >> 1) {
          v39 = sub_10000A8C0((void *)(v42 > 1), v43 + 1);
        }
        v39[2] = v43 + 1;
        sub_100009000((__int128 *)(v0 + 184), (uint64_t)&v39[5 * v43 + 4]);
      }

      else
      {
        sub_100005F4C(v0 + 104, &qword_1000100B8);
      }

      v38 += 40LL;
      --v37;
    }

    while (v37);
    swift_bridgeObjectRelease(v53);
  }

  else
  {
    v39 = _swiftEmptyArrayStorage;
  }

  *(void *)(v0 + 600) = v39;
  v44 = (void *)swift_task_alloc(async function pointer to static AssetLock.lockResources(_:)[1]);
  *(void *)(v0 + 608) = v44;
  void *v44 = v0;
  v44[1] = sub_10000295C;
  sub_10000A78C();
  return static AssetLock.lockResources(_:)();
}

uint64_t sub_10000295C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 608);
  *(void *)(*v1 + 616) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 592));
    sub_10000A710();
  }

  sub_10000A7B0();
  return swift_task_switch();
}

uint64_t sub_1000029CC()
{
  uint64_t v1 = *(void *)(v0 + 616);
  uint64_t v2 = *(void *)(v0 + 592);
  uint64_t v3 = *(void *)(v0 + 504);
  uint64_t v4 = swift_task_alloc(32LL);
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = sub_1000047E8((void (*)(uint64_t, uint64_t *))sub_100005AA4, v4, v2);
  if (v1)
  {
    uint64_t v6 = *(void *)(v0 + 496);
    swift_release(*(void *)(v0 + 584));
    sub_10000A69C();
    sub_10000A8AC(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_10000A888();
    sub_10000A65C();
    sub_10000A6F4();
    uint64_t v45 = *(void *)(v0 + 360);
    uint64_t v47 = *(void *)(v0 + 336);
    uint64_t v51 = *(void *)(v0 + 328);
    swift_task_dealloc(v7);
    sub_10000A65C();
    sub_10000A664();
    sub_10000A674();
    sub_10000A694();
    sub_10000A68C();
    sub_10000A66C();
    sub_10000A684();
    sub_10000A67C();
    sub_10000A6EC();
    swift_task_dealloc(v45);
    swift_task_dealloc(v47);
    swift_task_dealloc(v51);
    char v8 = *(uint64_t (**)(void))(v0 + 8);
  }

  else
  {
    uint64_t v9 = (uint64_t)v5;
    uint64_t v48 = *(void *)(v0 + 592);
    uint64_t v11 = *(void *)(v0 + 504);
    uint64_t v10 = *(void *)(v0 + 512);
    uint64_t v52 = *(void *)(v0 + 496);
    uint64_t v55 = *(void *)(v0 + 488);
    sub_10000A65C();
    uint64_t v12 = sub_10000228C(&qword_1000100C0);
    *(void *)(v0 + 624) = v12;
    Flag.wrappedValue.getter(v12);
    uint64_t v13 = *(unsigned __int8 *)(v0 + 664);
    *(_DWORD *)(v0 + 656) = *(_DWORD *)(v10 + 20);
    Flag.wrappedValue.getter(v12);
    sub_100003550(v9, v13, *(_BYTE *)(v0 + 661));
    sub_10000A888();
    sub_1000038B4(v48, v11);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v11, v55);
    uint64_t v14 = Flag.wrappedValue.getter(v12);
    uint64_t v15 = *(void *)(v0 + 600);
    uint64_t v16 = *(void *)(v0 + 592);
    if ((*(_BYTE *)(v0 + 660) & 1) != 0)
    {
      uint64_t v17 = *(void *)(v0 + 536);
      uint64_t v38 = *(void *)(v0 + 528);
      uint64_t v37 = *(void *)(v0 + 520);
      uint64_t v19 = *(void *)(v0 + 472);
      uint64_t v18 = *(void *)(v0 + 480);
      uint64_t v20 = *(void *)(v0 + 464);
      uint64_t v39 = *(void *)(v0 + 456);
      uint64_t v49 = *(void *)(v0 + 448);
      uint64_t v21 = *(void *)(v0 + 432);
      uint64_t v53 = *(void *)(v0 + 440);
      uint64_t v44 = *(void *)(v0 + 424);
      uint64_t v46 = *(void *)(v0 + 416);
      uint64_t v36 = *(void *)(v0 + 320);
      uint64_t v22 = (void (__cdecl *)(int))SIG_IGN.getter(v14);
      signal(2, v22);
      sub_100005AC0(0LL, &qword_1000100C8, &OBJC_CLASS___OS_dispatch_source_ptr);
      sub_100005AC0(0LL, &qword_1000100D0, &OBJC_CLASS___OS_dispatch_queue_ptr);
      unsigned int v41 = enum case for DispatchQoS.QoSClass.default(_:);
      unint64_t v42 = *(void (**)(uint64_t))(v19 + 104);
      v42(v18);
      uint64_t v43 = v15;
      uint64_t v23 = (void *)static OS_dispatch_queue.global(qos:)(v18);
      uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8);
      sub_10000A878(v18, v40);
      uint64_t v24 = static OS_dispatch_source.makeSignalSource(signal:queue:)(2LL, v23);
      *(void *)(v0 + 632) = v24;

      uint64_t ObjectType = swift_getObjectType(v24);
      sub_100004978(v36, v17);
      uint64_t v26 = *(unsigned __int8 *)(v37 + 80);
      uint64_t v27 = (v26 + 24) & ~v26;
      uint64_t v28 = swift_allocObject(&unk_10000C740, v27 + v38, v26 | 7);
      *(void *)(v28 + 16) = v16;
      sub_100005BC4(v17, v28 + v27);
      *(void *)(v0 + 48) = sub_100005C08;
      *(void *)(v0 + 56) = v28;
      *(void *)(v0 + 16) = _NSConcreteStackBlock;
      *(void *)(v0 + 24) = 1107296256LL;
      *(void *)(v0 + 32) = sub_100004F8C;
      *(void *)(v0 + 40) = &unk_10000C758;
      uint64_t v29 = _Block_copy((const void *)(v0 + 16));
      uint64_t v30 = swift_bridgeObjectRetain(v16);
      static DispatchQoS.unspecified.getter(v30);
      sub_100004FB8();
      OS_dispatch_source.setEventHandler(qos:flags:handler:)(v39, v21, v29, ObjectType);
      _Block_release(v29);
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v21, v46);
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v39, v53);
      swift_release(*(void *)(v0 + 56));
      OS_dispatch_source.resume()();
      ((void (*)(uint64_t, void, uint64_t))v42)(v18, v41, v20);
      uint64_t v31 = (void *)static OS_dispatch_queue.global(qos:)(v18);
      v40(v18, v20);
      static Catalog.monitorUpdates(for:on:)(v43, v31);
      uint64_t v33 = *(void *)(v0 + 392);
      swift_bridgeObjectRelease(*(void *)(v0 + 600));

      AsyncStream.makeAsyncIterator()(v33);
      *(void *)(v0 + 640) = 0LL;
      uint64_t v34 = (void *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
      *(void *)(v0 + 648) = v34;
      *uint64_t v34 = v0;
      v34[1] = sub_100002F10;
      sub_10000A7B0();
      return AsyncStream.Iterator.next(isolation:)();
    }

    sub_10000A89C();
    sub_10000A85C();
    sub_10000A710();
    uint64_t v32 = sub_10000A574();
    uint64_t v50 = *(void *)(v0 + 360);
    uint64_t v54 = *(void *)(v0 + 336);
    uint64_t v56 = *(void *)(v0 + 328);
    swift_task_dealloc(v32);
    sub_10000A65C();
    sub_10000A664();
    sub_10000A6EC();
    sub_10000A674();
    sub_10000A694();
    sub_10000A68C();
    sub_10000A66C();
    sub_10000A684();
    sub_10000A67C();
    swift_task_dealloc(v50);
    swift_task_dealloc(v54);
    swift_task_dealloc(v56);
    char v8 = *(uint64_t (**)(void))(v0 + 8);
  }

  return v8();
}

uint64_t sub_100002F10()
{
  return sub_100002364();
}

uint64_t sub_100002F4C()
{
  uint64_t v1 = *(void *)(v0 + 304);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 592);
    swift_bridgeObjectRelease(v1);
    int64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      *(void *)(v0 + 312) = &_swiftEmptyArrayStorage;
      sub_100005F0C(0LL, v3, 0);
      uint64_t v4 = *(void *)(v0 + 640);
      uint64_t v5 = 32LL;
      while (1)
      {
        int64_t v102 = v3;
        uint64_t v6 = *(void *)(v0 + 488);
        uint64_t v7 = *(void *)(v0 + 328);
        uint64_t v8 = *(void *)(v0 + 336);
        sub_100005A60(*(void *)(v0 + 592) + v5, v0 + 224);
        uint64_t v9 = *(void *)(v0 + 248);
        uint64_t v10 = *(void *)(v0 + 256);
        sub_100005F28((void *)(v0 + 224), v9);
        uint64_t v11 = type metadata accessor for AssetSubscriptionStatus(0LL);
        sub_10000A850(v8, v12, v13, v11);
        sub_10000230C(v7, 1LL, 1LL, v6);
        CatalogResource.statusOutput(status:progress:assetLock:)(v8, 0LL, 1LL, v7, v9, v10);
        if (v4) {
          break;
        }
        uint64_t v14 = *(void ***)(v0 + 336);
        sub_100005F4C(*(void *)(v0 + 328), &qword_100010088);
        sub_100005F4C((uint64_t)v14, &qword_100010090);
        sub_100002318((void *)(v0 + 224));
        uint64_t v15 = *(void **)(v0 + 312);
        if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
        {
          sub_10000A8CC(0LL, v15[2] + 1LL);
          uint64_t v15 = *v14;
        }

        unint64_t v17 = v15[2];
        unint64_t v16 = v15[3];
        if (v17 >= v16 >> 1)
        {
          sub_10000A8CC(v16 > 1, v17 + 1);
          uint64_t v15 = *v14;
        }

        uint64_t v19 = *(void *)(v0 + 352);
        uint64_t v18 = *(void *)(v0 + 360);
        uint64_t v20 = *(void *)(v0 + 344);
        v15[2] = v17 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))( (unint64_t)v15 + ((*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))
        + *(void *)(v19 + 72) * v17,
          v18,
          v20);
        uint64_t v4 = 0LL;
        *(void *)(v0 + 312) = v15;
        v5 += 40LL;
        int64_t v3 = v102 - 1;
        if (v102 == 1)
        {
          uint64_t v85 = 0LL;
          goto LABEL_14;
        }
      }

      uint64_t v51 = *(void *)(v0 + 632);
      uint64_t v52 = *(void *)(v0 + 584);
      uint64_t v53 = *(void *)(v0 + 400);
      uint64_t v105 = *(void *)(v0 + 408);
      uint64_t v109 = *(void *)(v0 + 592);
      uint64_t v54 = *(void *)(v0 + 384);
      uint64_t v98 = *(void *)(v0 + 392);
      uint64_t v56 = *(void *)(v0 + 368);
      uint64_t v55 = *(void *)(v0 + 376);
      uint64_t v57 = *(void *)(v0 + 336);
      sub_100005F4C(*(void *)(v0 + 328), &qword_100010088);
      sub_100005F4C(v57, &qword_100010090);
      sub_100002318((void *)(v0 + 224));
      swift_release(*(void *)(v0 + 312));
      swift_release(v52);
      swift_unknownObjectRelease(v51);
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v105, v98);
      swift_bridgeObjectRelease(v109);
      uint64_t v58 = sub_10000A62C();
      uint64_t v92 = v60;
      uint64_t v99 = v59;
      uint64_t v106 = *(void *)(v0 + 336);
      uint64_t v110 = *(void *)(v0 + 328);
      swift_task_dealloc(v58);
      sub_10000A65C();
      sub_10000A664();
      sub_10000A674();
      sub_10000A694();
      sub_10000A68C();
      sub_10000A66C();
      sub_10000A684();
      sub_10000A67C();
      uint64_t v61 = swift_task_dealloc(v92);
      uint64_t v69 = sub_10000A7A8(v61, v62, v63, v64, v65, v66, v67, v68, v92, v99);
      uint64_t v77 = sub_10000A720(v69, v70, v71, v72, v73, v74, v75, v76, v93, v100, v106);
      sub_10000A718(v77, v78, v79, v80, v81, v82, v83, v84, v94, v101, v107, v110);
      return sub_10000A610(*(uint64_t (**)(void))(v0 + 8));
    }

    else
    {
      uint64_t v85 = *(void *)(v0 + 640);
      uint64_t v15 = &_swiftEmptyArrayStorage;
LABEL_14:
      uint64_t v86 = *(void *)(v0 + 624);
      Flag.wrappedValue.getter(v86);
      char v87 = *(_BYTE *)(v0 + 662);
      Flag.wrappedValue.getter(v86);
      sub_100003550((uint64_t)v15, v87, *(_BYTE *)(v0 + 663));
      swift_bridgeObjectRelease(v15);
      *(void *)(v0 + 640) = v85;
      v88 = (void *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
      *(void *)(v0 + 648) = v88;
      void *v88 = v0;
      v88[1] = sub_100002F10;
      sub_10000A7B0();
      return AsyncStream.Iterator.next(isolation:)();
    }
  }

  else
  {
    uint64_t v21 = *(void *)(v0 + 632);
    uint64_t v23 = *(void *)(v0 + 400);
    uint64_t v22 = *(void *)(v0 + 408);
    uint64_t v24 = *(void *)(v0 + 376);
    swift_release(*(void *)(v0 + 584));
    swift_unknownObjectRelease(v21);
    sub_10000A69C();
    sub_10000A8AC(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
    sub_10000A878(v22, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    uint64_t v25 = sub_10000A574();
    uint64_t v95 = *(void *)(v0 + 360);
    uint64_t v103 = *(void *)(v0 + 336);
    uint64_t v108 = *(void *)(v0 + 328);
    swift_task_dealloc(v25);
    sub_10000A65C();
    sub_10000A664();
    sub_10000A6EC();
    sub_10000A674();
    sub_10000A694();
    sub_10000A68C();
    sub_10000A66C();
    sub_10000A684();
    uint64_t v26 = sub_10000A67C();
    uint64_t v34 = sub_10000A7A8(v26, v27, v28, v29, v30, v31, v32, v33, v89, v95);
    uint64_t v42 = sub_10000A720(v34, v35, v36, v37, v38, v39, v40, v41, v90, v96, v103);
    sub_10000A718(v42, v43, v44, v45, v46, v47, v48, v49, v91, v97, v104, v108);
    return sub_10000A610(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_100003330()
{
  uint64_t v30 = *(void *)(v0 + 360);
  uint64_t v33 = *(void *)(v0 + 336);
  uint64_t v35 = *(void *)(v0 + 328);
  swift_task_dealloc(v1);
  sub_10000A664();
  sub_10000A6EC();
  sub_10000A674();
  sub_10000A694();
  sub_10000A68C();
  sub_10000A66C();
  sub_10000A684();
  sub_10000A67C();
  uint64_t v2 = sub_10000A65C();
  uint64_t v10 = sub_10000A7A8(v2, v3, v4, v5, v6, v7, v8, v9, v27, v30);
  uint64_t v18 = sub_10000A720(v10, v11, v12, v13, v14, v15, v16, v17, v28, v31, v33);
  sub_10000A718(v18, v19, v20, v21, v22, v23, v24, v25, v29, v32, v34, v35);
  return sub_10000A610(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000033C8()
{
  uint64_t v0 = static ResourceStatusOutput.legend.getter();
  uint64_t v1 = swift_bridgeObjectRetain(v0);
  uint64_t v2 = sub_100005C4C(v1);
  sub_10000A69C();
  uint64_t v19 = v2;
  sub_1000059CC((uint64_t *)&v19, (uint64_t (*)(uint64_t))sub_100009B00, sub_100006474);
  sub_10000A69C();
  uint64_t v3 = (uint64_t)v19;
  uint64_t v4 = v19[2];
  if (v4)
  {
    uint64_t v5 = (void **)(v19 + 7);
    do
    {
      uint64_t v7 = (uint64_t)*(v5 - 3);
      uint64_t v6 = (uint64_t)*(v5 - 2);
      uint64_t v8 = (uint64_t)*(v5 - 1);
      uint64_t v9 = *v5;
      uint64_t v10 = sub_10000228C(&qword_1000100E0);
      uint64_t v11 = sub_10000A5B0(v10);
      *(_OWORD *)(v11 + 16) = xmmword_10000B080;
      uint64_t v19 = (void *)v7;
      uint64_t v20 = v6;
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRetain(v9);
      v12._countAndFlagsBits = 9LL;
      v12._object = (void *)0xE100000000000000LL;
      String.append(_:)(v12);
      v13._countAndFlagsBits = v8;
      v13._object = v9;
      String.append(_:)(v13);
      sub_10000A888();
      uint64_t v14 = (uint64_t)v19;
      uint64_t v15 = v20;
      *(void *)(v11 + 56) = &type metadata for String;
      *(void *)(v11 + 32) = v14;
      *(void *)(v11 + 40) = v15;
      sub_10000A550(v11);
      swift_bridgeObjectRelease(v11);
      v5 += 4;
      --v4;
    }

    while (v4);
  }

  swift_release(v3);
  uint64_t v16 = sub_10000228C(&qword_1000100E0);
  uint64_t v17 = sub_10000A5B0(v16);
  *(_OWORD *)(v17 + 16) = xmmword_10000B080;
  *(void *)(v17 + 56) = &type metadata for String;
  *(void *)(v17 + 32) = 0xD000000000000033LL;
  *(void *)(v17 + 40) = 0x800000010000B640LL;
  sub_10000A550(v17);
  return swift_bridgeObjectRelease(v17);
}

void sub_100003550(uint64_t a1, char a2, char a3)
{
  uint64_t v8 = type metadata accessor for ResourceStatusOutput(0LL);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  sub_10000A5BC();
  __chkstk_darwin();
  sub_10000A814();
  uint64_t v9 = type metadata accessor for Date(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v11 = sub_10000A728();
  uint64_t v12 = type metadata accessor for TimeZone(v11);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  sub_10000A7E4();
  uint64_t v37 = a1;
  if ((a2 & 1) != 0)
  {
    id v14 = [objc_allocWithZone(NSDateFormatter) init];
    [v14 setDateStyle:1];
    static TimeZone.current.getter([v14 setTimeStyle:3]);
    Class isa = TimeZone._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v12);
    [v14 setTimeZone:isa];

    static Date.now.getter();
    Class v16 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v5, v9);
    id v17 = [v14 stringFromDate:v16];

    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v20 = v19;

    uint64_t v21 = sub_10000228C(&qword_1000100E0);
    uint64_t v22 = sub_10000A5B0(v21);
    *(_OWORD *)(v22 + 16) = xmmword_10000B080;
    v23._countAndFlagsBits = v18;
    v23._object = v20;
    String.append(_:)(v23);
    swift_bridgeObjectRelease(v20);
    *(void *)(v22 + 56) = &type metadata for String;
    *(void *)(v22 + 32) = 0x6F20657461647055LL;
    *(void *)(v22 + 40) = 0xEB00000000203A6ELL;
    sub_10000A550(v22);

    uint64_t v24 = v22;
    a1 = v37;
    swift_bridgeObjectRelease(v24);
  }

  uint64_t v25 = *(void *)(a1 + 16);
  if (v25)
  {
    uint64_t v26 = a1 + ((*(unsigned __int8 *)(v41 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
    uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16);
    uint64_t v40 = *(void *)(v41 + 72);
    char v36 = a2;
    if ((a2 & 1) != 0) {
      uint64_t v27 = 9LL;
    }
    else {
      uint64_t v27 = 0LL;
    }
    if ((a2 & 1) != 0) {
      unint64_t v28 = 0xE100000000000000LL;
    }
    else {
      unint64_t v28 = 0xE000000000000000LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v29 = v42;
    do
    {
      v39(v4, v26, v29);
      Swift::String v30 = ResourceStatusOutput.description(withAssetSet:)(a3 & 1);
      uint64_t v31 = sub_10000228C(&qword_1000100E0);
      uint64_t v32 = sub_10000A5B0(v31);
      *(_OWORD *)(v32 + 16) = xmmword_10000B080;
      String.append(_:)(v30);
      swift_bridgeObjectRelease(v30._object);
      *(void *)(v32 + 56) = &type metadata for String;
      *(void *)(v32 + 32) = v27;
      *(void *)(v32 + 40) = v28;
      sub_10000A550(v32);
      uint64_t v33 = v32;
      uint64_t v29 = v42;
      swift_bridgeObjectRelease(v33);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v4, v42);
      v26 += v40;
      --v25;
    }

    while (v25);
    swift_bridgeObjectRelease(v37);
    a2 = v36;
  }

  if ((a2 & 1) != 0)
  {
    uint64_t v34 = sub_10000228C(&qword_1000100E0);
    uint64_t v35 = sub_10000A5B0(v34);
    *(_OWORD *)(v35 + 16) = xmmword_10000B080;
    *(void *)(v35 + 56) = &type metadata for String;
    *(void *)(v35 + 32) = 0LL;
    *(void *)(v35 + 40) = 0xE000000000000000LL;
    sub_10000A550(v35);
    sub_10000A69C();
  }

  sub_10000A6C4();
}

void sub_1000038B4(uint64_t a1, uint64_t a2)
{
  uint64_t v74 = a2;
  uint64_t v3 = 0LL;
  uint64_t v4 = type metadata accessor for Tag(0LL);
  uint64_t v79 = *(void *)(v4 - 8);
  sub_10000A5BC();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000A8D8();
  uint64_t v69 = v5;
  sub_10000A864();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v73 = (char *)&v65 - v6;
  sub_10000A864();
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v65 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v65 - v11;
  __chkstk_darwin(v10);
  uint64_t v76 = (char *)&v65 - v13;
  sub_10000A550((uint64_t)&_swiftEmptyArrayStorage);
  id v14 = *(char **)(a1 + 16);
  uint64_t v68 = a1;
  uint64_t v70 = v14;
  if (v14)
  {
    uint64_t v67 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    uint64_t v15 = 0LL;
    Class v16 = &_swiftEmptySetSingleton;
    uint64_t v80 = v12;
    uint64_t v66 = 0LL;
    do
    {
      sub_100005A60(v67 + 40LL * (void)v15, (uint64_t)&v86);
      uint64_t v17 = v88;
      uint64_t v18 = v89;
      sub_100005F28(&v86, v88);
      uint64_t v19 = dispatch thunk of CatalogResource.tags.getter(v17, v18);
      uint64_t v77 = *(void *)(v19 + 16);
      if (v77)
      {
        uint64_t v72 = v15;
        uint64_t v20 = 0LL;
        unint64_t v21 = (*(unsigned __int8 *)(v79 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
        int64_t v71 = v19;
        *(void *)&__int128 v75 = v19 + v21;
        uint64_t v22 = *(void *)(v79 + 72);
        uint64_t v23 = (uint64_t)v76;
        do
        {
          uint64_t v78 = v20;
          sub_10000A7DC(v23, v75 + v22 * v20);
          sub_10000A7DC((uint64_t)v12, v23);
          uint64_t v24 = v16[5];
          sub_10000A278(&qword_100010118, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
          uint64_t v26 = v25;
          swift_bridgeObjectRetain(v16);
          uint64_t v27 = dispatch thunk of Hashable._rawHashValue(seed:)(v24, v4, v26);
          uint64_t v28 = -1LL << *((_BYTE *)v16 + 32);
          unint64_t v29 = v27 & ~v28;
          if (((*(void *)((char *)v16 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v29) & 1) != 0)
          {
            uint64_t v30 = ~v28;
            while (1)
            {
              sub_10000A7DC((uint64_t)v9, v16[6] + v29 * v22);
              sub_10000A278(&qword_100010120, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
              char v32 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v80, v4, v31);
              sub_10000A880((uint64_t)v9);
              if ((v32 & 1) != 0) {
                break;
              }
              unint64_t v29 = (v29 + 1) & v30;
            }

            sub_10000A85C();
            uint64_t v12 = v80;
          }

          else
          {
LABEL_9:
            sub_10000A85C();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v16);
            uint64_t v12 = v80;
            sub_10000A7DC((uint64_t)v9, (uint64_t)v80);
            v83[0] = v16;
            sub_100008508((uint64_t)v9, v29, isUniquelyReferenced_nonNull_native);
            Class v16 = (void *)v83[0];
            swift_bridgeObjectRelease(0x8000000000000000LL);
          }

          uint64_t v23 = (uint64_t)v76;
          uint64_t v20 = v78 + 1;
          sub_10000A880((uint64_t)v12);
          sub_10000A880(v23);
        }

        while (v20 != v77);
        swift_bridgeObjectRelease(v71);
        uint64_t v3 = v66;
        uint64_t v15 = v72;
      }

      else
      {
        swift_bridgeObjectRelease(v19);
      }

      ++v15;
      sub_10000A8B8();
    }

    while (v15 != v70);
    uint64_t v34 = v68;
    swift_bridgeObjectRelease(v68);
  }

  else
  {
    Class v16 = &_swiftEmptySetSingleton;
    uint64_t v34 = a1;
  }

  uint64_t v35 = v69;
  uint64_t v36 = 0LL;
  uint64_t v37 = v16[7];
  uint64_t v70 = (char *)(v16 + 7);
  uint64_t v38 = 1LL << *((_BYTE *)v16 + 32);
  uint64_t v39 = -1LL;
  if (v38 < 64) {
    uint64_t v39 = ~(-1LL << v38);
  }
  unint64_t v40 = v39 & v37;
  int64_t v71 = (unint64_t)(v38 + 63) >> 6;
  __int128 v75 = xmmword_10000B080;
  uint64_t v72 = (char *)0x800000010000B620LL;
  if (!v40) {
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v78 = (v40 - 1) & v40;
  uint64_t v80 = (char *)v36;
  for (unint64_t i = __clz(__rbit64(v40)) | (v36 << 6); ; unint64_t i = __clz(__rbit64(v44)) + (v43 << 6))
  {
    uint64_t v47 = v79;
    uint64_t v48 = v73;
    (*(void (**)(char *, unint64_t, uint64_t))(v79 + 16))(v73, v16[6] + *(void *)(v79 + 72) * i, v4);
    uint64_t v49 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v35, v48, v4);
    __chkstk_darwin(v49);
    *(&v65 - 2) = v35;
    swift_bridgeObjectRetain(v34);
    uint64_t v50 = sub_1000041B8((uint64_t)sub_10000870C, (uint64_t)(&v65 - 4), v34);
    uint64_t v51 = *(void *)(v50 + 16);
    uint64_t v77 = v51;
    if (v51)
    {
      uint64_t v52 = v50 + 32;
      uint64_t v76 = (char *)v50;
      swift_bridgeObjectRetain(v50);
      uint64_t v53 = 0LL;
      while (1)
      {
        sub_100005A60(v52, (uint64_t)v83);
        uint64_t v54 = sub_10000228C(&qword_1000100A8);
        uint64_t v55 = sub_10000228C(&qword_1000100B0);
        if (swift_dynamicCast(v81, v83, v54, v55, 6LL))
        {
          sub_100009000(v81, (uint64_t)&v86);
          uint64_t v56 = v88;
          uint64_t v57 = v89;
          sub_100005F28(&v86, v88);
          uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 0LL,  v57,  v56,  &protocol requirements base descriptor for AssetBackedResource,  &associated type descriptor for AssetBackedResource.CatalogAssetType);
          uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness( v57,  v56,  AssociatedTypeWitness,  &protocol requirements base descriptor for AssetBackedResource,  &associated conformance descriptor for AssetBackedResource.AssetBackedResource.CatalogAssetType: CatalogAssetProtocol);
          sub_100008728(v83);
          dispatch thunk of AssetBackedResource.fetchLockedAsset(with:)(v74, v56, v57);
          if (v3)
          {
            sub_100008764(v83);
            swift_errorRelease(v3);
            sub_10000A8B8();
            uint64_t v58 = 0LL;
            uint64_t v3 = 0LL;
          }

          else
          {
            sub_100002318(v83);
            sub_10000A8B8();
            uint64_t v58 = 1LL;
          }
        }

        else
        {
          uint64_t v82 = 0LL;
          memset(v81, 0, sizeof(v81));
          sub_100005F4C((uint64_t)v81, &qword_1000100B8);
          uint64_t v58 = 0LL;
        }

        BOOL v42 = __OFADD__(v53, v58);
        v53 += v58;
        if (v42) {
          break;
        }
        v52 += 40LL;
        if (!--v51)
        {
          swift_bridgeObjectRelease_n(v76, 2LL);
          uint64_t v34 = v68;
          uint64_t v35 = v69;
          goto LABEL_46;
        }
      }

      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }

    swift_bridgeObjectRelease(v50);
    uint64_t v53 = 0LL;
LABEL_46:
    uint64_t v59 = sub_10000228C(&qword_1000100E0);
    uint64_t v60 = sub_10000A5B0(v59);
    *(_OWORD *)(v60 + 16) = v75;
    uint64_t v86 = 0LL;
    unint64_t v87 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(39LL);
    _print_unlocked<A, B>(_:_:)( v35,  &v86,  v4,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v61._countAndFlagsBits = 0x2073616820LL;
    v61._object = (void *)0xE500000000000000LL;
    String.append(_:)(v61);
    v83[0] = v53;
    v90._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    sub_10000A890(v90);
    swift_bridgeObjectRelease(0LL);
    v62._countAndFlagsBits = 0xD00000000000001CLL;
    v62._object = v72;
    String.append(_:)(v62);
    v83[0] = v77;
    v91._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    sub_10000A890(v91);
    swift_bridgeObjectRelease(0LL);
    uint64_t v63 = v86;
    unint64_t v64 = v87;
    *(void *)(v60 + 56) = &type metadata for String;
    *(void *)(v60 + 32) = v63;
    *(void *)(v60 + 40) = v64;
    sub_10000A550(v60);
    sub_10000A69C();
    sub_10000A878(v35, *(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
    uint64_t v36 = (uint64_t)v80;
    unint64_t v40 = v78;
    if (v78) {
      goto LABEL_20;
    }
LABEL_21:
    BOOL v42 = __OFADD__(v36, 1LL);
    uint64_t v43 = v36 + 1;
    if (v42) {
      goto LABEL_54;
    }
    if (v43 >= v71) {
      goto LABEL_52;
    }
    unint64_t v44 = *(void *)&v70[8 * v43];
    if (!v44) {
      break;
    }
LABEL_34:
    uint64_t v78 = (v44 - 1) & v44;
    uint64_t v80 = (char *)v43;
  }

  sub_10000A77C();
  if (v45 == v42) {
    goto LABEL_52;
  }
  sub_10000A76C();
  if (v44) {
    goto LABEL_33;
  }
  sub_10000A77C();
  if (v45 == v42) {
    goto LABEL_52;
  }
  sub_10000A76C();
  if (v44) {
    goto LABEL_33;
  }
  sub_10000A77C();
  if (v45 == v42)
  {
LABEL_52:
    swift_release(v16);
    sub_10000A6C4();
    return;
  }

  sub_10000A76C();
  if (v44)
  {
LABEL_33:
    uint64_t v43 = v46;
    goto LABEL_34;
  }

  while (1)
  {
    uint64_t v43 = v46 + 1;
    if (__OFADD__(v46, 1LL)) {
      break;
    }
    if (v43 >= v71) {
      goto LABEL_52;
    }
    unint64_t v44 = *(void *)&v70[8 * v43];
    ++v46;
    if (v44) {
      goto LABEL_34;
    }
  }

LABEL_55:
  __break(1u);
}

uint64_t sub_1000040D0(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  sub_100005F28(a1, v3);
  uint64_t v5 = dispatch thunk of CatalogResource.tags.getter(v3, v4);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = type metadata accessor for Tag(0LL);
    uint64_t v8 = *(void *)(v7 - 8);
    unint64_t v9 = v5 + ((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    sub_10000A278(&qword_100010120, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
    uint64_t v12 = v11;
    while ((dispatch thunk of static Equatable.== infix(_:_:)(v9, a2, v7, v12) & 1) == 0)
    {
      v9 += v10;
      if (!--v6) {
        goto LABEL_5;
      }
    }

    swift_bridgeObjectRelease(v5);
    return 1LL;
  }

  else
  {
LABEL_5:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

uint64_t sub_1000041B8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(unint64_t **)(a3 + 16);
  if (v6)
  {
    uint64_t v7 = (uint64_t (*)(__int128 *))result;
    uint64_t v5 = 0LL;
    uint64_t v8 = a3 + 32;
    unint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v13 = *(unint64_t **)(a3 + 16);
    id v14 = (uint64_t (*)(__int128 *))result;
    while ((unint64_t)v5 < *(void *)(a3 + 16))
    {
      sub_100005A60(v8, (uint64_t)v16);
      char v10 = v7(v16);
      if (v3)
      {
        sub_100002318(v16);
        swift_release(v9);
        swift_bridgeObjectRelease(a3);
        return (uint64_t)v5;
      }

      if ((v10 & 1) != 0)
      {
        sub_100009000(v16, (uint64_t)v15);
        if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
          sub_100005EF0(0LL, v9[2] + 1, 1);
        }
        unint64_t v9 = v17;
        unint64_t v12 = v17[2];
        unint64_t v11 = v17[3];
        if (v12 >= v11 >> 1)
        {
          sub_100005EF0((void *)(v11 > 1), v12 + 1, 1);
          unint64_t v9 = v17;
        }

        v9[2] = v12 + 1;
        uint64_t result = sub_100009000(v15, (uint64_t)&v9[5 * v12 + 4]);
        uint64_t v6 = v13;
        uint64_t v7 = v14;
      }

      else
      {
        uint64_t result = sub_100002318(v16);
      }

      uint64_t v5 = (unint64_t *)((char *)v5 + 1);
      v8 += 40LL;
      if (v6 == v5)
      {
        uint64_t v5 = v17;
        goto LABEL_15;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_15:
    swift_bridgeObjectRelease(a3);
    return (uint64_t)v5;
  }

  return result;
}

uint64_t sub_10000433C(uint64_t a1)
{
  uint64_t v11 = v10 - v9;
  ArgumentHelp.init(stringLiteral:)(0xD000000000000019LL, 0x800000010000B730LL);
  uint64_t v12 = type metadata accessor for ArgumentHelp(0LL);
  sub_10000230C(v11, 0LL, 1LL, v12);
  uint64_t v13 = type metadata accessor for CompletionKind(0LL);
  uint64_t v16 = sub_10000A850(v3, v14, v15, v13);
  uint64_t v17 = static NameSpecification.long.getter(v16);
  static ArrayParsingStrategy.singleValue.getter(v17);
  return Option.init<A>(wrappedValue:name:parsing:help:completion:)( a1,  v2,  v1,  v11,  v3,  &type metadata for String,  &protocol witness table for String);
}

BOOL sub_10000447C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Tag(0LL);
  uint64_t v38 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Status(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000228C(&qword_1000100D8);
  Option.wrappedValue.getter(v39);
  uint64_t v11 = *(void *)(v39[0] + 16LL);
  swift_bridgeObjectRelease(v39[0]);
  sub_100004978(a2, (uint64_t)v10);
  sub_100005A60(a1, (uint64_t)v39);
  if (v11)
  {
    Option.wrappedValue.getter(&v42);
    uint64_t v35 = sub_100004738((uint64_t)v42);
    uint64_t v12 = v40;
    uint64_t v13 = v41;
    sub_100005F28(v39, v40);
    uint64_t v14 = dispatch thunk of CatalogResource.tags.getter(v12, v13);
    uint64_t v15 = v14;
    int64_t v16 = *(void *)(v14 + 16);
    if (v16)
    {
      uint64_t v33 = v10;
      uint64_t v34 = v2;
      BOOL v42 = _swiftEmptyArrayStorage;
      sub_100005F88(0LL, v16, 0);
      unint64_t v17 = (*(unsigned __int8 *)(v38 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
      uint64_t v32 = v15;
      unint64_t v18 = v15 + v17;
      uint64_t v19 = *(void *)(v38 + 72);
      uint64_t v36 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v38 + 16);
      uint64_t v37 = v19;
      do
      {
        uint64_t v20 = v36(v7, v18, v5);
        uint64_t v21 = Tag.rawValue.getter(v20);
        uint64_t v23 = v22;
        (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v5);
        uint64_t v24 = v42;
        if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
        {
          sub_100005F88(0LL, v24[2] + 1LL, 1);
          uint64_t v24 = v42;
        }

        unint64_t v26 = v24[2];
        unint64_t v25 = v24[3];
        if (v26 >= v25 >> 1)
        {
          sub_100005F88((char *)(v25 > 1), v26 + 1, 1);
          uint64_t v24 = v42;
        }

        v24[2] = v26 + 1;
        uint64_t v27 = &v24[2 * v26];
        v27[4] = v21;
        v27[5] = v23;
        v18 += v37;
        --v16;
      }

      while (v16);
      swift_bridgeObjectRelease(v32);
      uint64_t v10 = v33;
    }

    else
    {
      swift_bridgeObjectRelease(v14);
      uint64_t v24 = _swiftEmptyArrayStorage;
    }

    Swift::Int v29 = sub_1000092C0((uint64_t)v24, v35);
    swift_bridgeObjectRelease(v24);
    uint64_t v30 = *(void *)(v29 + 16);
    swift_release(v29);
    BOOL v28 = v30 != 0;
  }

  else
  {
    BOOL v28 = 1LL;
  }

  sub_100002238((uint64_t)v10);
  sub_100002318(v39);
  return v28;
}

uint64_t sub_100004738(uint64_t a1)
{
  uint64_t v2 = Set.init(minimumCapacity:)(*(void *)(a1 + 16), &type metadata for String, &protocol witness table for String);
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_100007D40(v9, v5, v6);
      swift_bridgeObjectRelease(v9[1]);
      v4 += 2;
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease(a1);
    return v10;
  }

  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease(a1);
  }

  return v7;
}

unint64_t *sub_1000047E8(void (*a1)(uint64_t, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v16 = a1;
  uint64_t v17 = a2;
  uint64_t v15 = type metadata accessor for ResourceStatusOutput(0LL);
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v9)
  {
    uint64_t v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100005F0C(0LL, v9, 0);
    uint64_t v10 = v19;
    for (uint64_t i = a3 + 32; ; i += 40LL)
    {
      v16(i, &v18);
      if (v4) {
        break;
      }
      uint64_t v4 = 0LL;
      uint64_t v19 = v10;
      unint64_t v13 = v10[2];
      unint64_t v12 = v10[3];
      if (v13 >= v12 >> 1)
      {
        sub_100005F0C(v12 > 1, v13 + 1, 1);
        uint64_t v10 = v19;
      }

      v10[2] = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))( (unint64_t)v10 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
      + *(void *)(v6 + 72) * v13,
        v8,
        v15);
      if (!--v9) {
        return v10;
      }
    }

    swift_release(v10);
  }

  return v10;
}

uint64_t type metadata accessor for Status(uint64_t a1)
{
  uint64_t result = qword_1000101B8;
  if (!qword_1000101B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Status);
  }
  return result;
}

uint64_t sub_100004978(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Status(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_1000049BC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = a3;
  uint64_t v6 = sub_10000228C(&qword_100010088);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_10000228C(&qword_100010090);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_100005F28(a1, v12);
  uint64_t v14 = type metadata accessor for AssetSubscriptionStatus(0LL);
  sub_10000230C((uint64_t)v11, 1LL, 1LL, v14);
  uint64_t v15 = type metadata accessor for AssetLock(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL))(v8, a2, v15);
  sub_10000230C((uint64_t)v8, 0LL, 1LL, v15);
  CatalogResource.statusOutput(status:progress:assetLock:)(v11, 0LL, 1LL, v8, v12, v13);
  sub_100005F4C((uint64_t)v8, &qword_100010088);
  sub_100005F4C((uint64_t)v11, &qword_100010090);
  if (v3) {
    *uint64_t v17 = v3;
  }
}

uint64_t sub_100004B44(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v3 = sub_10000228C(&qword_100010088);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_10000228C(&qword_100010090);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = type metadata accessor for ResourceStatusOutput(0LL);
  uint64_t v9 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  Swift::Int v29 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = sub_10000228C(&qword_1000100E0);
  uint64_t v11 = swift_allocObject(v27, 64LL, 7LL);
  __int128 v26 = xmmword_10000B080;
  *(_OWORD *)(v11 + 16) = xmmword_10000B080;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 32) = 0xD00000000000003CLL;
  *(void *)(v11 + 40) = 0x800000010000B5B0LL;
  print(_:separator:terminator:)(v11, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
  swift_bridgeObjectRelease(v11);
  int64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = &_swiftEmptyArrayStorage;
  if (v12)
  {
    uint64_t v34 = &_swiftEmptyArrayStorage;
    sub_100005F0C(0LL, v12, 0);
    uint64_t v14 = a1 + 32;
    do
    {
      sub_100005A60(v14, (uint64_t)&v31);
      uint64_t v15 = v32;
      uint64_t v16 = v33;
      sub_100005F28(&v31, v32);
      uint64_t v17 = type metadata accessor for AssetSubscriptionStatus(0LL);
      sub_10000230C((uint64_t)v8, 1LL, 1LL, v17);
      uint64_t v18 = type metadata accessor for AssetLock(0LL);
      sub_10000230C((uint64_t)v5, 1LL, 1LL, v18);
      CatalogResource.statusOutput(status:progress:assetLock:)(v8, 0LL, 1LL, v5, v15, v16);
      sub_100005F4C((uint64_t)v5, &qword_100010088);
      sub_100005F4C((uint64_t)v8, &qword_100010090);
      sub_100002318(&v31);
      uint64_t v13 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0)
      {
        sub_100005F0C(0LL, v13[2] + 1LL, 1);
        uint64_t v13 = v34;
      }

      unint64_t v20 = v13[2];
      unint64_t v19 = v13[3];
      if (v20 >= v19 >> 1)
      {
        sub_100005F0C(v19 > 1, v20 + 1, 1);
        uint64_t v13 = v34;
      }

      v13[2] = v20 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))( (unint64_t)v13 + ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
      + *(void *)(v9 + 72) * v20,
        v29,
        v30);
      uint64_t v34 = v13;
      v14 += 40LL;
      --v12;
    }

    while (v12);
  }

  uint64_t v21 = sub_10000228C(&qword_1000100C0);
  Flag.wrappedValue.getter(v21);
  char v22 = v31;
  type metadata accessor for Status(0LL);
  Flag.wrappedValue.getter(v21);
  sub_100003550((uint64_t)v13, v22, v31);
  swift_bridgeObjectRelease(v13);
  uint64_t v23 = type metadata accessor for Status(0LL);
  sub_10000A278((unint64_t *)&qword_100010070, type metadata accessor for Status);
  uint64_t result = static ParsableArguments.exit(withError:)(0LL, v23, v24);
  __break(1u);
  return result;
}

uint64_t sub_100004F8C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100004FB8()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v6 = &_swiftEmptyArrayStorage;
  sub_10000A278(&qword_1000100F8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v2 = v1;
  uint64_t v3 = sub_10000228C(&qword_100010100);
  sub_10000A2E8(&qword_100010108, &qword_100010100);
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v6, v3, v4, v0, v2);
}

BOOL sub_10000506C(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000507C(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_1000050A0(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x726F74696E6F6DLL && a2 == 0xE700000000000000LL)
  {
    unint64_t v5 = 0xE700000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x726F74696E6F6DLL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x65736F62726576LL && a2 == 0xE700000000000000LL)
  {
    unint64_t v8 = 0xE700000000000000LL;
    goto LABEL_16;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65736F62726576LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1LL;
  }

  if (a1 == 1936154996 && a2 == 0xE400000000000000LL)
  {
    unint64_t v10 = 0xE400000000000000LL;
    goto LABEL_24;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1936154996LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v10);
    return 2LL;
  }

  if (a1 == 1953063287 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease(0xE400000000000000LL);
    return 3LL;
  }

  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(1953063287LL, 0xE400000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v12 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_100005234()
{
  return 4LL;
}

Swift::Int sub_10000523C(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

uint64_t sub_100005280()
{
  return 0LL;
}

uint64_t sub_10000528C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000052C0 + 4 * byte_10000B0A0[a1]))( 0x726F74696E6F6DLL,  0xE700000000000000LL);
}

uint64_t sub_1000052C0()
{
  return 0x65736F62726576LL;
}

uint64_t sub_1000052D4()
{
  return 1936154996LL;
}

uint64_t sub_1000052E4()
{
  return 1953063287LL;
}

BOOL sub_1000052F4(char *a1, char *a2)
{
  return sub_10000506C(*a1, *a2);
}

Swift::Int sub_100005300()
{
  return sub_10000523C(*v0);
}

void sub_100005308(uint64_t a1)
{
}

Swift::Int sub_100005310(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100005350()
{
  return sub_10000A6A4();
}

uint64_t sub_100005470@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v49 = sub_10000228C(&qword_1000100D8);
  uint64_t v45 = *(void *)(v49 - 8);
  sub_10000A5BC();
  __chkstk_darwin(v4);
  sub_10000A6DC();
  uint64_t v48 = v6 - v5;
  uint64_t v54 = sub_10000228C(&qword_1000100C0);
  uint64_t v52 = *(void *)(v54 - 8);
  sub_10000A5BC();
  __chkstk_darwin(v7);
  sub_10000A8D8();
  uint64_t v46 = v8;
  sub_10000A864();
  __chkstk_darwin(v9);
  uint64_t v51 = (char *)&v44 - v10;
  sub_10000A864();
  __chkstk_darwin(v11);
  uint64_t v53 = (char *)&v44 - v12;
  uint64_t v56 = sub_10000228C(&qword_100010238);
  uint64_t v50 = *(void *)(v56 - 8);
  sub_10000A5BC();
  __chkstk_darwin(v13);
  sub_10000A6DC();
  uint64_t v16 = v15 - v14;
  type metadata accessor for NameSpecification(0LL);
  sub_10000A5A0();
  __chkstk_darwin(v17);
  sub_10000A7E4();
  sub_10000228C(&qword_100010228);
  sub_10000A5A0();
  __chkstk_darwin(v18);
  uint64_t v19 = sub_10000A728();
  unint64_t v20 = (int *)type metadata accessor for Status(v19);
  sub_10000A5A0();
  __chkstk_darwin(v21);
  sub_10000A7FC();
  sub_10000A754(0xD00000000000002ALL, (uint64_t)"Continue to monitor changes to the catalog");
  type metadata accessor for ArgumentHelp(0LL);
  sub_10000A5EC();
  sub_10000A6B4();
  uint64_t v22 = v2 + v20[5];
  ArgumentHelp.init(stringLiteral:)(0xD000000000000025LL, 0x800000010000B6B0LL);
  sub_10000A5EC();
  sub_10000A6B4();
  uint64_t v23 = v2 + v20[6];
  sub_10000433C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v24 = v2 + v20[7];
  sub_10000A754(0xD000000000000045LL, (uint64_t)"If you wish the tool to block on system initialization being complete");
  sub_10000A5EC();
  sub_10000A6B4();
  uint64_t v25 = a1[3];
  uint64_t v26 = a1[4];
  sub_100005F28(a1, v25);
  unint64_t v27 = sub_10000A2AC();
  uint64_t v55 = v16;
  uint64_t v28 = v57;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for Status.CodingKeys,  &type metadata for Status.CodingKeys,  v27,  v25,  v26);
  if (!v28)
  {
    uint64_t v44 = v24;
    uint64_t v29 = v22;
    uint64_t v57 = v23;
    uint64_t v30 = v51;
    uint64_t v31 = v52;
    uint64_t v32 = v50;
    char v61 = 0;
    sub_10000A2E8(&qword_100010248, &qword_1000100C0);
    uint64_t v34 = v33;
    sub_10000A764();
    uint64_t v35 = *(void (**)(uint64_t, char *, uint64_t))(v31 + 40);
    v35(v2, v53, v54);
    char v60 = 1;
    sub_10000A764();
    uint64_t v53 = v34;
    v35(v29, v30, v54);
    char v59 = 2;
    sub_10000A2E8(&qword_100010250, &qword_1000100D8);
    uint64_t v36 = v48;
    uint64_t v37 = v49;
    sub_10000A764();
    uint64_t v39 = (void (*)(uint64_t, uint64_t, uint64_t))v35;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 40))(v57, v36, v37);
    char v58 = 3;
    uint64_t v40 = v46;
    uint64_t v41 = v55;
    uint64_t v42 = v56;
    sub_10000A764();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v41, v42);
    uint64_t v43 = v47;
    v39(v44, v40, v54);
    sub_100004978(v2, v43);
  }

  sub_100002318(a1);
  return sub_100002238(v2);
}

uint64_t sub_100005874()
{
  return sub_10000528C(*v0);
}

uint64_t sub_10000587C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000050A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000058A0()
{
  return sub_100005280();
}

uint64_t sub_1000058BC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_100005234();
  *a1 = result;
  return result;
}

uint64_t sub_1000058E0(uint64_t a1)
{
  unint64_t v2 = sub_10000A2AC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005908(uint64_t a1)
{
  unint64_t v2 = sub_10000A2AC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100005930()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100010084);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005974;
  return sub_100002370();
}

uint64_t sub_100005974()
{
  return v0[1]();
}

uint64_t sub_1000059B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100005470(a1, a2);
}

uint64_t sub_1000059CC(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

BOOL sub_100005A44(uint64_t a1)
{
  return sub_10000447C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100005A60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100005AA4(void *a1, void *a2)
{
}

uint64_t sub_100005AC0(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_100005AF8()
{
  uint64_t v1 = (int *)sub_10000A7D4();
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease(*(void *)(v0 + 16));
  uint64_t v7 = v0 + v4;
  sub_10000228C(&qword_1000100C0);
  sub_10000A870(v7);
  sub_10000A870(v7 + v1[5]);
  uint64_t v8 = v7 + v1[6];
  uint64_t v9 = sub_10000228C(&qword_1000100D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  sub_10000A870(v7 + v1[7]);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100005BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Status(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005C08()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(sub_10000A7D4() - 8) + 80LL);
  return sub_100004B44(*(void *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_100005C34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005C44(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void *sub_100005C4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_10000228C(&qword_100010150);
  uint64_t v4 = (void *)swift_allocObject(v3, 32 * v1 + 32, 7LL);
  size_t v5 = j__malloc_size(v4);
  v4[2] = v1;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 32);
  uint64_t v6 = sub_1000098E4((uint64_t)&v9, v4 + 4, v1, a1);
  uint64_t v7 = v9;
  swift_bridgeObjectRetain(a1);
  sub_100009B28(v7);
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }

  return v4;
}

void *sub_100005D2C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000228C(&qword_1000100E8);
    uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &a4[5 * v8 + 4] <= v11 + 4) {
      memmove(v11 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v14 = sub_10000228C(&qword_1000100B0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v14);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_100005E50(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1
    || (uint64_t result = type metadata accessor for ResourceStatusOutput(0LL),
        a1 + *(void *)(*(void *)(result - 8) + 72LL) * a2 <= a3))
  {
    uint64_t v7 = type metadata accessor for ResourceStatusOutput(0LL);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }

  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }

  return result;
}

void *sub_100005EF0(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000060C0(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

size_t sub_100005F0C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1000061E4(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

void *sub_100005F28(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

void sub_100005F4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000228C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_10000A8A4();
}

char *sub_100005F88(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100006378(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

void *sub_100005FA4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000228C(&qword_100010150);
    uint64_t v11 = (void *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 32);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &a4[4 * v8 + 4] <= v11 + 4) {
      memmove(v11 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v14 = sub_10000228C(&qword_100010158);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v14);
  }

  swift_release(a4);
  return v11;
}

void *sub_1000060C0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000228C(&qword_100010130);
    uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }

  else
  {
    uint64_t v11 = &_swiftEmptyArrayStorage;
  }

  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &a4[5 * v8 + 4] <= v11 + 4) {
      memmove(v11 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v14 = sub_10000228C(&qword_1000100A8);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v14);
  }

  swift_release(a4);
  return v11;
}

size_t sub_1000061E4(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_10000228C(&qword_1000100F0);
  uint64_t v11 = *(void *)(type metadata accessor for ResourceStatusOutput(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }

  if (result - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_24;
  }
  __int128 v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  uint64_t v17 = type metadata accessor for ResourceStatusOutput(0LL);
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL);
  uint64_t v19 = (v18 + 32) & ~v18;
  if ((v5 & 1) != 0)
  {
    sub_100005E50(a4 + v19, v8, (unint64_t)v15 + v19);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy((char *)v15 + v19, a4 + v19, v8, v17);
  }

  swift_release(a4);
  return (size_t)v15;
}

uint64_t sub_100006334(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

char *sub_100006378(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000228C(&qword_100010140);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[16 * v8] <= v13) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v13, v14, v8, &type metadata for String);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_100006474(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_100007434(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_148;
  }

  if (v3 < -1) {
    goto LABEL_147;
  }
  uint64_t v110 = result;
  uint64_t v107 = a1;
  if (v3 <= 1)
  {
    unint64_t v6 = _swiftEmptyArrayStorage;
    v113 = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v49 = _swiftEmptyArrayStorage[2];
      uint64_t v9 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_114;
    }

    uint64_t v109 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v5 = sub_10000228C(&qword_100010158);
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)(v3 / 2, v5);
    *(void *)(result + 16) = v3 / 2;
    uint64_t v109 = (void *)result;
    v113 = (char *)(result + 32);
  }

  Swift::Int v7 = 0LL;
  uint64_t v8 = *a1;
  uint64_t v108 = *a1 + 8;
  uint64_t v106 = *a1 + 24;
  uint64_t v9 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v111 = v3;
  uint64_t v112 = *a1;
  while (1)
  {
    Swift::Int v10 = v7++;
    if (v7 >= v3) {
      goto LABEL_39;
    }
    uint64_t v11 = (uint64_t *)(v8 + 32 * v7);
    uint64_t result = *v11;
    uint64_t v12 = v11[1];
    uint64_t v13 = (void *)(v8 + 32 * v10);
    uint64_t v14 = v13[1];
    if (result == *v13 && v12 == v14)
    {
      Swift::Int v17 = v10 + 2;
      if (v10 + 2 >= v3) {
        goto LABEL_38;
      }
      int v16 = 0;
    }

    else
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v12, *v13, v14, 1LL);
      int v16 = result;
      Swift::Int v17 = v10 + 2;
      if (v10 + 2 >= v3) {
        goto LABEL_30;
      }
    }

    uint64_t v18 = (uint64_t *)(v108 + 32 * v17);
    do
    {
      uint64_t result = *(v18 - 1);
      uint64_t v19 = *v18;
      unint64_t v20 = (void *)(v8 + 32 * v7);
      uint64_t v21 = v20[1];
      if (result == *v20 && v19 == v21)
      {
        if ((v16 & 1) != 0) {
          goto LABEL_31;
        }
      }

      else
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v19, *v20, v21, 1LL);
      }

      v18 += 4;
      Swift::Int v23 = v17 + 1;
      Swift::Int v7 = v17;
      Swift::Int v17 = v23;
    }

    while (v23 < v3);
    Swift::Int v17 = v23;
LABEL_30:
    Swift::Int v7 = v17;
    if ((v16 & 1) != 0)
    {
LABEL_31:
      if (v17 < v10) {
        goto LABEL_151;
      }
      if (v10 < v17)
      {
        uint64_t v24 = 32 * v17;
        uint64_t v25 = 32 * v10;
        Swift::Int v26 = v17;
        Swift::Int v27 = v10;
        do
        {
          if (v27 != --v26)
          {
            if (!v8) {
              goto LABEL_154;
            }
            uint64_t v28 = (_OWORD *)(v8 + v25);
            uint64_t v29 = v8 + v24;
            __int128 v30 = *(_OWORD *)(v8 + v25);
            uint64_t v31 = *(void *)(v8 + v25 + 16);
            uint64_t v32 = *(void *)(v8 + v25 + 24);
            __int128 v33 = *(_OWORD *)(v8 + v24 - 16);
            *uint64_t v28 = *(_OWORD *)(v8 + v24 - 32);
            v28[1] = v33;
            *(_OWORD *)(v29 - 32) = v30;
            *(void *)(v29 - 16) = v31;
            *(void *)(v29 - 8) = v32;
          }

          ++v27;
          v24 -= 32LL;
          v25 += 32LL;
        }

        while (v27 < v26);
      }

LABEL_38:
      Swift::Int v7 = v17;
    }

LABEL_39:
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10)) {
        goto LABEL_146;
      }
      if (v7 - v10 < v110)
      {
        if (__OFADD__(v10, v110)) {
          goto LABEL_149;
        }
        if (v10 + v110 >= v3) {
          Swift::Int v34 = v3;
        }
        else {
          Swift::Int v34 = v10 + v110;
        }
        if (v34 < v10) {
          goto LABEL_150;
        }
        if (v7 != v34)
        {
          uint64_t v35 = (void *)(v106 + 32 * v7);
          do
          {
            uint64_t v36 = (uint64_t *)(v8 + 32 * v7);
            uint64_t result = *v36;
            uint64_t v37 = v36[1];
            Swift::Int v38 = v10;
            uint64_t v39 = v35;
            do
            {
              uint64_t v40 = *(v39 - 7);
              uint64_t v41 = *(v39 - 6);
              uint64_t v42 = (__int128 *)(v39 - 7);
              if (result == v40 && v37 == v41) {
                break;
              }
              uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v37, v40, v41, 1LL);
              if ((result & 1) == 0) {
                break;
              }
              if (!v8) {
                goto LABEL_152;
              }
              __int128 v45 = *v42;
              __int128 v44 = *(_OWORD *)(v39 - 5);
              *(v39 - 4) = *v39;
              v39 -= 4;
              uint64_t result = v39[1];
              uint64_t v37 = v39[2];
              uint64_t v46 = v39[3];
              v42[2] = v45;
              v42[3] = v44;
              *(v39 - 3) = result;
              *(v39 - 2) = v37;
              *(v39 - 1) = v46;
              ++v38;
            }

            while (v7 != v38);
            ++v7;
            v35 += 4;
          }

          while (v7 != v34);
          Swift::Int v7 = v34;
        }
      }
    }

    if (v7 < v10)
    {
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
LABEL_155:
      __break(1u);
      return result;
    }

    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v9);
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_100007C38(0LL, *((void *)v9 + 2) + 1LL, 1, v9);
      uint64_t v9 = (char *)result;
    }

    unint64_t v48 = *((void *)v9 + 2);
    unint64_t v47 = *((void *)v9 + 3);
    unint64_t v49 = v48 + 1;
    if (v48 >= v47 >> 1)
    {
      uint64_t result = (uint64_t)sub_100007C38((char *)(v47 > 1), v48 + 1, 1, v9);
      uint64_t v9 = (char *)result;
    }

    *((void *)v9 + 2) = v49;
    uint64_t v50 = v9 + 32;
    uint64_t v51 = (Swift::Int *)&v9[16 * v48 + 32];
    *uint64_t v51 = v10;
    v51[1] = v7;
    if (v48) {
      break;
    }
    unint64_t v49 = 1LL;
    uint64_t v8 = v112;
LABEL_108:
    Swift::Int v3 = v111;
    if (v7 >= v111)
    {
      unint64_t v6 = v109;
LABEL_114:
      uint64_t result = (uint64_t)v9;
      uint64_t v109 = v6;
      if (v49 < 2)
      {
LABEL_125:
        swift_bridgeObjectRelease(result);
        v109[2] = 0LL;
        return swift_bridgeObjectRelease(v109);
      }

      uint64_t v100 = *v107;
      while (1)
      {
        unint64_t v101 = v49 - 2;
        if (v49 < 2) {
          goto LABEL_142;
        }
        if (!v100) {
          goto LABEL_155;
        }
        uint64_t v99 = result;
        uint64_t v102 = *(void *)(result + 32 + 16 * v101);
        uint64_t v103 = *(void *)(result + 32 + 16 * (v49 - 1) + 8);
        uint64_t result = sub_1000076B8( (char *)(v100 + 32 * v102),  (char *)(v100 + 32LL * *(void *)(result + 32 + 16 * (v49 - 1))),  v100 + 32 * v103,  v113);
        if (v1) {
          goto LABEL_111;
        }
        if (v103 < v102) {
          goto LABEL_143;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native(v99);
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_100007D2C(v99);
          uint64_t v99 = result;
        }

        if (v101 >= *(void *)(v99 + 16)) {
          goto LABEL_144;
        }
        uint64_t v104 = (void *)(v99 + 32 + 16 * v101);
        *uint64_t v104 = v102;
        v104[1] = v103;
        unint64_t v105 = *(void *)(v99 + 16);
        if (v49 > v105) {
          goto LABEL_145;
        }
        memmove((void *)(v99 + 32 + 16 * (v49 - 1)), (const void *)(v99 + 32 + 16 * v49), 16 * (v105 - v49));
        uint64_t result = v99;
        *(void *)(v99 + 16) = v105 - 1;
        unint64_t v49 = v105 - 1;
        if (v105 <= 2) {
          goto LABEL_125;
        }
      }
    }
  }

  uint64_t v8 = v112;
  while (1)
  {
    unint64_t v52 = v49 - 1;
    if (v49 >= 4)
    {
      uint64_t v57 = &v50[16 * v49];
      uint64_t v58 = *((void *)v57 - 8);
      uint64_t v59 = *((void *)v57 - 7);
      BOOL v63 = __OFSUB__(v59, v58);
      uint64_t v60 = v59 - v58;
      if (v63) {
        goto LABEL_130;
      }
      uint64_t v62 = *((void *)v57 - 6);
      uint64_t v61 = *((void *)v57 - 5);
      BOOL v63 = __OFSUB__(v61, v62);
      uint64_t v55 = v61 - v62;
      char v56 = v63;
      if (v63) {
        goto LABEL_131;
      }
      unint64_t v64 = v49 - 2;
      uint64_t v65 = &v50[16 * v49 - 32];
      uint64_t v67 = *(void *)v65;
      uint64_t v66 = *((void *)v65 + 1);
      BOOL v63 = __OFSUB__(v66, v67);
      uint64_t v68 = v66 - v67;
      if (v63) {
        goto LABEL_132;
      }
      BOOL v63 = __OFADD__(v55, v68);
      uint64_t v69 = v55 + v68;
      if (v63) {
        goto LABEL_134;
      }
      if (v69 >= v60)
      {
        unint64_t v87 = &v50[16 * v52];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v63 = __OFSUB__(v88, v89);
        uint64_t v90 = v88 - v89;
        if (v63) {
          goto LABEL_140;
        }
        BOOL v80 = v55 < v90;
        goto LABEL_97;
      }
    }

    else
    {
      if (v49 != 3)
      {
        uint64_t v81 = *((void *)v9 + 4);
        uint64_t v82 = *((void *)v9 + 5);
        BOOL v63 = __OFSUB__(v82, v81);
        uint64_t v74 = v82 - v81;
        char v75 = v63;
        goto LABEL_91;
      }

      uint64_t v54 = *((void *)v9 + 4);
      uint64_t v53 = *((void *)v9 + 5);
      BOOL v63 = __OFSUB__(v53, v54);
      uint64_t v55 = v53 - v54;
      char v56 = v63;
    }

    if ((v56 & 1) != 0) {
      goto LABEL_133;
    }
    unint64_t v64 = v49 - 2;
    uint64_t v70 = &v50[16 * v49 - 32];
    uint64_t v72 = *(void *)v70;
    uint64_t v71 = *((void *)v70 + 1);
    BOOL v73 = __OFSUB__(v71, v72);
    uint64_t v74 = v71 - v72;
    char v75 = v73;
    if (v73) {
      goto LABEL_135;
    }
    uint64_t v76 = &v50[16 * v52];
    uint64_t v78 = *(void *)v76;
    uint64_t v77 = *((void *)v76 + 1);
    BOOL v63 = __OFSUB__(v77, v78);
    uint64_t v79 = v77 - v78;
    if (v63) {
      goto LABEL_137;
    }
    if (__OFADD__(v74, v79)) {
      goto LABEL_139;
    }
    if (v74 + v79 >= v55)
    {
      BOOL v80 = v55 < v79;
LABEL_97:
      if (v80) {
        unint64_t v52 = v64;
      }
      goto LABEL_99;
    }

LABEL_91:
    if ((v75 & 1) != 0) {
      goto LABEL_136;
    }
    uint64_t v83 = &v50[16 * v52];
    uint64_t v85 = *(void *)v83;
    uint64_t v84 = *((void *)v83 + 1);
    BOOL v63 = __OFSUB__(v84, v85);
    uint64_t v86 = v84 - v85;
    if (v63) {
      goto LABEL_138;
    }
    if (v86 < v74) {
      goto LABEL_108;
    }
LABEL_99:
    unint64_t v91 = v52 - 1;
    if (v52 - 1 >= v49)
    {
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
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
      goto LABEL_141;
    }

    if (!v8) {
      goto LABEL_153;
    }
    uint64_t v92 = (unint64_t *)v9;
    uint64_t v93 = v8;
    uint64_t v94 = &v50[16 * v91];
    uint64_t v95 = *(void *)v94;
    uint64_t v96 = &v50[16 * v52];
    uint64_t v97 = *((void *)v96 + 1);
    uint64_t result = sub_1000076B8( (char *)(v93 + 32LL * *(void *)v94),  (char *)(v93 + 32LL * *(void *)v96),  v93 + 32 * v97,  v113);
    if (v1) {
      break;
    }
    if (v97 < v95) {
      goto LABEL_127;
    }
    if (v52 > v92[2]) {
      goto LABEL_128;
    }
    *(void *)uint64_t v94 = v95;
    *(void *)&v50[16 * v91 + 8] = v97;
    unint64_t v98 = v92[2];
    if (v52 >= v98) {
      goto LABEL_129;
    }
    uint64_t v9 = (char *)v92;
    unint64_t v49 = v98 - 1;
    uint64_t result = (uint64_t)memmove(&v50[16 * v52], v96 + 16, 16 * (v98 - 1 - v52));
    v92[2] = v98 - 1;
    BOOL v80 = v98 > 2;
    uint64_t v8 = v112;
    if (!v80) {
      goto LABEL_108;
    }
  }

  uint64_t v99 = (uint64_t)v92;
LABEL_111:
  swift_bridgeObjectRelease(v99);
  v109[2] = 0LL;
  return swift_bridgeObjectRelease(v109);
}

uint64_t sub_100006B2C(uint64_t *a1)
{
  uint64_t v2 = v1;
  v142 = a1;
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_150;
    }
    if (v3) {
      return sub_10000750C(0LL, v3, 1LL, v142);
    }
    return result;
  }

  if (v3 < -1) {
    goto LABEL_149;
  }
  uint64_t v125 = result;
  if (v3 > 1)
  {
    uint64_t v5 = sub_10000228C(&qword_1000100A8);
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)(v3 / 2, v5);
    *(void *)(result + 16) = v3 / 2;
    v124 = (void *)result;
    v132 = (char *)(result + 32);
LABEL_10:
    Swift::Int v7 = 0LL;
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      Swift::Int v9 = v7++;
      Swift::Int v131 = v9;
      if (v7 < v3)
      {
        Swift::Int v10 = v9;
        uint64_t v11 = v2;
        uint64_t v12 = *v142;
        sub_100005A60(*v142 + 40 * v7, (uint64_t)&v139);
        uint64_t v126 = v12;
        sub_100005A60(v12 + 40 * v10, (uint64_t)v136);
        uint64_t v13 = v140;
        uint64_t v14 = v141;
        sub_100005F28(&v139, v140);
        uint64_t v15 = dispatch thunk of CatalogResource.id.getter(v13, v14);
        uint64_t v17 = v16;
        uint64_t v18 = v137;
        uint64_t v19 = v138;
        sub_100005F28(v136, v137);
        uint64_t v20 = dispatch thunk of CatalogResource.id.getter(v18, v19);
        if (v15 == v20 && v17 == v21)
        {
          char v133 = 0;
          uint64_t v23 = v17;
        }

        else
        {
          uint64_t v23 = v21;
          char v133 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v20, v21, 1LL);
        }

        swift_bridgeObjectRelease(v17);
        swift_bridgeObjectRelease(v23);
        sub_100002318(v136);
        uint64_t result = sub_100002318(&v139);
        Swift::Int v7 = v131 + 2;
        uint64_t v2 = v11;
        if (v131 + 2 >= v3)
        {
          Swift::Int v9 = v131;
        }

        else
        {
          uint64_t v24 = v126 + 40 * v131 + 40;
          Swift::Int v128 = v3;
          while (1)
          {
            uint64_t v25 = v2;
            sub_100005A60(v24 + 40, (uint64_t)&v139);
            sub_100005A60(v24, (uint64_t)v136);
            uint64_t v26 = v140;
            uint64_t v27 = v141;
            sub_100005F28(&v139, v140);
            uint64_t v28 = dispatch thunk of CatalogResource.id.getter(v26, v27);
            uint64_t v30 = v29;
            uint64_t v32 = v137;
            uint64_t v31 = v138;
            sub_100005F28(v136, v137);
            uint64_t v33 = dispatch thunk of CatalogResource.id.getter(v32, v31);
            if (v28 == v33 && v30 == v34)
            {
              char v37 = 0;
              uint64_t v36 = v30;
            }

            else
            {
              uint64_t v36 = v34;
              char v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, v33, v34, 1LL);
            }

            swift_bridgeObjectRelease(v30);
            swift_bridgeObjectRelease(v36);
            sub_100002318(v136);
            uint64_t result = sub_100002318(&v139);
            char v38 = v133 ^ v37;
            uint64_t v2 = v25;
            Swift::Int v3 = v128;
            if ((v38 & 1) != 0) {
              break;
            }
            ++v7;
            v24 += 40LL;
            if (v7 >= v128)
            {
              Swift::Int v7 = v128;
              break;
            }
          }

          Swift::Int v9 = v131;
        }

        if ((v133 & 1) != 0)
        {
          if (v7 < v9) {
            goto LABEL_151;
          }
          if (v9 < v7)
          {
            Swift::Int v129 = v3;
            uint64_t v39 = v2;
            uint64_t v40 = v8;
            uint64_t v41 = 40 * v7 - 40;
            Swift::Int v42 = v9;
            uint64_t v43 = 40 * v9;
            Swift::Int v44 = v7;
            do
            {
              if (v42 != --v44)
              {
                if (!v126) {
                  goto LABEL_156;
                }
                uint64_t v45 = v126 + v43;
                sub_100009000((__int128 *)(v126 + v43), (uint64_t)&v139);
                uint64_t v46 = *(void *)(v126 + v41 + 32);
                __int128 v47 = *(_OWORD *)(v126 + v41 + 16);
                *(_OWORD *)uint64_t v45 = *(_OWORD *)(v126 + v41);
                *(_OWORD *)(v45 + 16) = v47;
                *(void *)(v45 + 32) = v46;
                uint64_t result = sub_100009000(&v139, v126 + v41);
              }

              ++v42;
              v41 -= 40LL;
              v43 += 40LL;
            }

            while (v42 < v44);
            uint64_t v8 = v40;
            uint64_t v2 = v39;
            Swift::Int v3 = v129;
            Swift::Int v9 = v131;
          }
        }
      }

      if (v7 < v3)
      {
        if (__OFSUB__(v7, v9)) {
          goto LABEL_148;
        }
        if (v7 - v9 < v125)
        {
          if (__OFADD__(v9, v125)) {
            goto LABEL_152;
          }
          if (v9 + v125 >= v3) {
            Swift::Int v48 = v3;
          }
          else {
            Swift::Int v48 = v9 + v125;
          }
          if (v48 < v9)
          {
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
            return result;
          }

          if (v7 != v48)
          {
            v127 = v8;
            Swift::Int v130 = v48;
            uint64_t v134 = v2;
            uint64_t v49 = 40 * v7 - 40;
            do
            {
              uint64_t v50 = v49;
              while (1)
              {
                uint64_t v51 = *v142 + v50;
                sub_100005A60(v51 + 40, (uint64_t)&v139);
                sub_100005A60(v51, (uint64_t)v136);
                uint64_t v52 = v140;
                uint64_t v53 = v141;
                sub_100005F28(&v139, v140);
                uint64_t v54 = dispatch thunk of CatalogResource.id.getter(v52, v53);
                uint64_t v56 = v55;
                uint64_t v57 = v137;
                uint64_t v58 = v138;
                sub_100005F28(v136, v137);
                uint64_t v59 = dispatch thunk of CatalogResource.id.getter(v57, v58);
                if (v54 == v59 && v56 == v60) {
                  break;
                }
                uint64_t v62 = v60;
                char v63 = _stringCompareWithSmolCheck(_:_:expecting:)(v54, v56, v59, v60, 1LL);
                swift_bridgeObjectRelease(v56);
                swift_bridgeObjectRelease(v62);
                sub_100002318(v136);
                uint64_t result = sub_100002318(&v139);
                if ((v63 & 1) == 0) {
                  goto LABEL_60;
                }
                uint64_t v64 = *v142;
                if (!*v142) {
                  goto LABEL_154;
                }
                uint64_t v65 = v64 + v50;
                sub_100009000((__int128 *)(v64 + v50 + 40), (uint64_t)&v139);
                __int128 v66 = *(_OWORD *)(v65 + 16);
                *(_OWORD *)(v65 + 40) = *(_OWORD *)v65;
                *(_OWORD *)(v65 + 56) = v66;
                *(void *)(v65 + 72) = *(void *)(v65 + 32);
                uint64_t result = sub_100009000(&v139, v65);
                v50 -= 40LL;
                if (v7 == ++v9) {
                  goto LABEL_60;
                }
              }

              swift_bridgeObjectRelease_n(v56, 2LL);
              sub_100002318(v136);
              uint64_t result = sub_100002318(&v139);
LABEL_60:
              ++v7;
              v49 += 40LL;
              Swift::Int v9 = v131;
            }

            while (v7 != v130);
            Swift::Int v7 = v130;
            uint64_t v2 = v134;
            uint64_t v8 = v127;
          }
        }
      }

      if (v7 < v9) {
        goto LABEL_143;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v8);
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100007C38(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        uint64_t v8 = (char *)result;
      }

      unint64_t v68 = *((void *)v8 + 2);
      unint64_t v67 = *((void *)v8 + 3);
      unint64_t v69 = v68 + 1;
      uint64_t v135 = v2;
      if (v68 >= v67 >> 1)
      {
        uint64_t result = (uint64_t)sub_100007C38((char *)(v67 > 1), v68 + 1, 1, v8);
        uint64_t v8 = (char *)result;
      }

      *((void *)v8 + 2) = v69;
      uint64_t v70 = v8 + 32;
      uint64_t v71 = &v8[16 * v68 + 32];
      *(void *)uint64_t v71 = v9;
      *((void *)v71 + 1) = v7;
      if (v68)
      {
        while (1)
        {
          unint64_t v72 = v69 - 1;
          if (v69 >= 4)
          {
            uint64_t v77 = &v70[2 * v69];
            uint64_t v78 = *(v77 - 8);
            uint64_t v79 = *(v77 - 7);
            BOOL v83 = __OFSUB__(v79, v78);
            uint64_t v80 = v79 - v78;
            if (v83) {
              goto LABEL_132;
            }
            uint64_t v82 = *(v77 - 6);
            uint64_t v81 = *(v77 - 5);
            BOOL v83 = __OFSUB__(v81, v82);
            uint64_t v75 = v81 - v82;
            char v76 = v83;
            if (v83) {
              goto LABEL_133;
            }
            unint64_t v84 = v69 - 2;
            uint64_t v85 = &v70[2 * v69 - 4];
            uint64_t v87 = *v85;
            uint64_t v86 = v85[1];
            BOOL v83 = __OFSUB__(v86, v87);
            uint64_t v88 = v86 - v87;
            if (v83) {
              goto LABEL_134;
            }
            BOOL v83 = __OFADD__(v75, v88);
            uint64_t v89 = v75 + v88;
            if (v83) {
              goto LABEL_136;
            }
            if (v89 >= v80)
            {
              uint64_t v107 = &v70[2 * v72];
              uint64_t v109 = *v107;
              uint64_t v108 = v107[1];
              BOOL v83 = __OFSUB__(v108, v109);
              uint64_t v110 = v108 - v109;
              if (v83) {
                goto LABEL_142;
              }
              BOOL v100 = v75 < v110;
              goto LABEL_99;
            }
          }

          else
          {
            if (v69 != 3)
            {
              uint64_t v101 = *((void *)v8 + 4);
              uint64_t v102 = *((void *)v8 + 5);
              BOOL v83 = __OFSUB__(v102, v101);
              uint64_t v94 = v102 - v101;
              char v95 = v83;
              goto LABEL_93;
            }

            uint64_t v74 = *((void *)v8 + 4);
            uint64_t v73 = *((void *)v8 + 5);
            BOOL v83 = __OFSUB__(v73, v74);
            uint64_t v75 = v73 - v74;
            char v76 = v83;
          }

          if ((v76 & 1) != 0) {
            goto LABEL_135;
          }
          unint64_t v84 = v69 - 2;
          uint64_t v90 = &v70[2 * v69 - 4];
          uint64_t v92 = *v90;
          uint64_t v91 = v90[1];
          BOOL v93 = __OFSUB__(v91, v92);
          uint64_t v94 = v91 - v92;
          char v95 = v93;
          if (v93) {
            goto LABEL_137;
          }
          uint64_t v96 = &v70[2 * v72];
          uint64_t v98 = *v96;
          uint64_t v97 = v96[1];
          BOOL v83 = __OFSUB__(v97, v98);
          uint64_t v99 = v97 - v98;
          if (v83) {
            goto LABEL_139;
          }
          if (__OFADD__(v94, v99)) {
            goto LABEL_141;
          }
          if (v94 + v99 >= v75)
          {
            BOOL v100 = v75 < v99;
LABEL_99:
            if (v100) {
              unint64_t v72 = v84;
            }
            goto LABEL_101;
          }

LABEL_93:
          if ((v95 & 1) != 0) {
            goto LABEL_138;
          }
          uint64_t v103 = &v70[2 * v72];
          uint64_t v105 = *v103;
          uint64_t v104 = v103[1];
          BOOL v83 = __OFSUB__(v104, v105);
          uint64_t v106 = v104 - v105;
          if (v83) {
            goto LABEL_140;
          }
          if (v106 < v94) {
            goto LABEL_110;
          }
LABEL_101:
          unint64_t v111 = v72 - 1;
          if (v72 - 1 >= v69)
          {
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
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
            goto LABEL_153;
          }

          if (!*v142) {
            goto LABEL_155;
          }
          uint64_t v112 = (uint64_t)v8;
          v113 = &v70[2 * v111];
          uint64_t v114 = *v113;
          v115 = &v70[2 * v72];
          uint64_t v116 = v115[1];
          uint64_t result = sub_100007898( (char *)(*v142 + 40 * *v113),  (char *)(*v142 + 40LL * *v115),  (char *)(*v142 + 40 * v116),  v132);
          if (v135)
          {
LABEL_125:
            swift_bridgeObjectRelease(v112);
            v124[2] = 0LL;
            return swift_bridgeObjectRelease(v124);
          }

          if (v116 < v114) {
            goto LABEL_129;
          }
          if (v72 > *(void *)(v112 + 16)) {
            goto LABEL_130;
          }
          uint64_t *v113 = v114;
          v70[2 * v111 + 1] = v116;
          unint64_t v117 = *(void *)(v112 + 16);
          if (v72 >= v117) {
            goto LABEL_131;
          }
          uint64_t v8 = (char *)v112;
          unint64_t v69 = v117 - 1;
          uint64_t result = (uint64_t)memmove(&v70[2 * v72], v115 + 2, 16 * (v117 - 1 - v72));
          *(void *)(v112 + 16) = v117 - 1;
          if (v117 <= 2) {
            goto LABEL_110;
          }
        }
      }

      unint64_t v69 = 1LL;
LABEL_110:
      Swift::Int v3 = v142[1];
      uint64_t v2 = v135;
      if (v7 >= v3)
      {
        unint64_t v6 = v124;
        goto LABEL_113;
      }
    }
  }

  unint64_t v6 = _swiftEmptyArrayStorage;
  v132 = (char *)&_swiftEmptyArrayStorage[4];
  if (v3 == 1)
  {
    v124 = _swiftEmptyArrayStorage;
    goto LABEL_10;
  }

  unint64_t v69 = _swiftEmptyArrayStorage[2];
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
LABEL_113:
  uint64_t v112 = (uint64_t)v8;
  v124 = v6;
  if (v69 >= 2)
  {
    uint64_t v118 = *v142;
    do
    {
      unint64_t v119 = v69 - 2;
      if (v69 < 2) {
        goto LABEL_144;
      }
      if (!v118) {
        goto LABEL_157;
      }
      uint64_t v120 = *(void *)(v112 + 32 + 16 * v119);
      uint64_t v121 = *(void *)(v112 + 32 + 16 * (v69 - 1) + 8);
      uint64_t result = sub_100007898( (char *)(v118 + 40 * v120),  (char *)(v118 + 40LL * *(void *)(v112 + 32 + 16 * (v69 - 1))),  (char *)(v118 + 40 * v121),  v132);
      if (v2) {
        goto LABEL_125;
      }
      if (v121 < v120) {
        goto LABEL_145;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v112);
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100007D2C(v112);
        uint64_t v112 = result;
      }

      if (v119 >= *(void *)(v112 + 16)) {
        goto LABEL_146;
      }
      v122 = (void *)(v112 + 32 + 16 * v119);
      void *v122 = v120;
      v122[1] = v121;
      unint64_t v123 = *(void *)(v112 + 16);
      if (v69 > v123) {
        goto LABEL_147;
      }
      uint64_t result = (uint64_t)memmove( (void *)(v112 + 32 + 16 * (v69 - 1)),  (const void *)(v112 + 32 + 16 * v69),  16 * (v123 - v69));
      *(void *)(v112 + 16) = v123 - 1;
      unint64_t v69 = v123 - 1;
      uint64_t v2 = 0LL;
    }

    while (v123 > 2);
  }

  swift_bridgeObjectRelease(v112);
  v124[2] = 0LL;
  return swift_bridgeObjectRelease(v124);
}

uint64_t sub_100007434(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 + 24;
    while (2)
    {
      Swift::Int v9 = (uint64_t *)(v7 + 32 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (void *)v8;
      do
      {
        uint64_t v13 = *(v12 - 7);
        uint64_t v14 = *(v12 - 6);
        uint64_t v15 = (__int128 *)(v12 - 7);
        if (result == v13 && v10 == v14) {
          break;
        }
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, v13, v14, 1LL);
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }

        __int128 v18 = *v15;
        __int128 v17 = *(_OWORD *)(v12 - 5);
        *(v12 - 4) = *v12;
        v12 -= 4;
        uint64_t result = v12[1];
        uint64_t v10 = v12[2];
        uint64_t v19 = v12[3];
        __int128 v15[2] = v18;
        v15[3] = v17;
        *(v12 - 3) = result;
        *(v12 - 2) = v10;
        *(v12 - 1) = v19;
        ++v11;
      }

      while (v4 != v11);
      ++v4;
      v8 += 32LL;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_10000750C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v25 = result;
  if (a3 != a2)
  {
    uint64_t v5 = a3;
    uint64_t v6 = 40 * a3 - 40;
    while (2)
    {
      uint64_t v7 = v25;
      uint64_t v32 = v6;
      while (1)
      {
        uint64_t v8 = *a4 + v6;
        sub_100005A60(v8 + 40, (uint64_t)&v29);
        sub_100005A60(v8, (uint64_t)v26);
        uint64_t v9 = v30;
        uint64_t v10 = v31;
        sub_100005F28(&v29, v30);
        uint64_t v11 = dispatch thunk of CatalogResource.id.getter(v9, v10);
        uint64_t v13 = v12;
        uint64_t v15 = v27;
        uint64_t v14 = v28;
        sub_100005F28(v26, v27);
        uint64_t v16 = dispatch thunk of CatalogResource.id.getter(v15, v14);
        if (v11 == v16 && v13 == v17) {
          break;
        }
        uint64_t v19 = v17;
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v16, v17, 1LL);
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease(v19);
        sub_100002318(v26);
        uint64_t result = sub_100002318(&v29);
        if ((v20 & 1) != 0)
        {
          uint64_t v21 = *a4;
          if (!*a4)
          {
            __break(1u);
            return result;
          }

          uint64_t v22 = v21 + v6;
          sub_100009000((__int128 *)(v21 + v6 + 40), (uint64_t)&v29);
          __int128 v23 = *(_OWORD *)(v22 + 16);
          *(_OWORD *)(v22 + 40) = *(_OWORD *)v22;
          *(_OWORD *)(v22 + 56) = v23;
          *(void *)(v22 + 72) = *(void *)(v22 + 32);
          uint64_t result = sub_100009000(&v29, v22);
          v6 -= 40LL;
          if (v5 != ++v7) {
            continue;
          }
        }

        goto LABEL_13;
      }

      swift_bridgeObjectRelease_n(v13, 2LL);
      sub_100002318(v26);
      uint64_t result = sub_100002318(&v29);
LABEL_13:
      ++v5;
      uint64_t v6 = v32 + 40;
      if (v5 != a2) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_1000076B8(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = (__src - __dst) / 32;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = (uint64_t)(a3 - (void)__src) / 32;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[32 * v11] <= a4) {
      memmove(a4, __src, 32 * v11);
    }
    uint64_t v13 = &v4[32 * v11];
    if (v7 >= v6 || v10 < 32) {
      goto LABEL_53;
    }
    uint64_t v21 = (char *)(a3 - 32);
    while (1)
    {
      uint64_t v22 = v21 + 32;
      uint64_t v23 = *((void *)v13 - 4);
      uint64_t v24 = *((void *)v13 - 3);
      uint64_t v25 = v13 - 32;
      uint64_t v26 = *((void *)v6 - 4);
      uint64_t v27 = *((void *)v6 - 3);
      BOOL v28 = v23 == v26 && v24 == v27;
      if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v26, v27, 1LL) & 1) == 0)
      {
        BOOL v30 = v22 != v13 || v21 >= v13;
        v13 -= 32;
        if (!v30) {
          goto LABEL_49;
        }
      }

      else
      {
        BOOL v29 = v22 != v6 || v21 >= v6;
        uint64_t v25 = v6 - 32;
        v6 -= 32;
        if (!v29) {
          goto LABEL_49;
        }
      }

      __int128 v31 = *((_OWORD *)v25 + 1);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v25;
      *((_OWORD *)v21 + 1) = v31;
LABEL_49:
      v21 -= 32;
      if (v6 <= v7 || v13 <= v4) {
        goto LABEL_53;
      }
    }
  }

  if (a4 != __dst || &__dst[32 * v9] <= a4) {
    memmove(a4, __dst, 32 * v9);
  }
  uint64_t v13 = &v4[32 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      uint64_t v14 = *((void *)v6 + 1);
      uint64_t v15 = *((void *)v4 + 1);
      BOOL v16 = *(void *)v6 == *(void *)v4 && v14 == v15;
      if (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v14, *(void *)v4, v15, 1LL) & 1) != 0) {
        break;
      }
      uint64_t v17 = v4;
      BOOL v16 = v7 == v4;
      v4 += 32;
      if (!v16) {
        goto LABEL_18;
      }
LABEL_19:
      v7 += 32;
    }

    uint64_t v17 = v6;
    BOOL v16 = v7 == v6;
    v6 += 32;
    if (v16) {
      goto LABEL_19;
    }
LABEL_18:
    __int128 v18 = *((_OWORD *)v17 + 1);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
    *((_OWORD *)v7 + 1) = v18;
    goto LABEL_19;
  }

LABEL_24:
  uint64_t v6 = v7;
LABEL_53:
  uint64_t v33 = (v13 - v4) / 32;
  if (v6 != v4 || v6 >= &v4[32 * v33]) {
    memmove(v6, v4, 32 * v33);
  }
  return 1LL;
}

uint64_t sub_100007898(char *__dst, char *__src, char *a3, char *a4)
{
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = __src - __dst;
  int64_t v8 = (__src - __dst) / 40;
  __int128 v66 = a3;
  uint64_t v9 = a3 - __src;
  uint64_t v10 = (a3 - __src) / 40;
  if (v8 >= v10)
  {
    BOOL v33 = a4 == __src && &__src[40 * v10] > a4;
    uint64_t v13 = a4;
    if (!v33) {
      memmove(a4, __src, 40 * v10);
    }
    uint64_t v12 = &a4[40 * v10];
    if (v6 >= v5 || v9 < 40) {
      goto LABEL_61;
    }
    uint64_t v34 = v66 - 40;
    uint64_t v58 = a4;
    while (1)
    {
      uint64_t v59 = v12;
      uint64_t v35 = v12 - 40;
      sub_100005A60((uint64_t)(v12 - 40), (uint64_t)v63);
      __int128 v66 = v5;
      uint64_t v36 = v5 - 40;
      sub_100005A60((uint64_t)(v5 - 40), (uint64_t)v60);
      uint64_t v37 = v64;
      uint64_t v38 = v65;
      sub_100005F28(v63, v64);
      uint64_t v39 = dispatch thunk of CatalogResource.id.getter(v37, v38);
      uint64_t v41 = v40;
      uint64_t v42 = v61;
      uint64_t v43 = v62;
      sub_100005F28(v60, v61);
      uint64_t v44 = dispatch thunk of CatalogResource.id.getter(v42, v43);
      if (v39 == v44 && v41 == v45)
      {
        char v48 = 0;
        uint64_t v47 = v41;
      }

      else
      {
        uint64_t v47 = v45;
        char v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v41, v44, v45, 1LL);
      }

      uint64_t v13 = v58;
      uint64_t v49 = v34 + 40;
      swift_bridgeObjectRelease(v41);
      swift_bridgeObjectRelease(v47);
      sub_100002318(v60);
      sub_100002318(v63);
      if ((v48 & 1) != 0)
      {
        BOOL v50 = v49 != v66 || v34 >= v66;
        uint64_t v5 = v36;
        uint64_t v12 = v59;
        if (!v50) {
          goto LABEL_57;
        }
      }

      else
      {
        BOOL v51 = v49 != v59 || v34 >= v59;
        uint64_t v36 = v35;
        uint64_t v12 = v35;
        uint64_t v5 = v66;
        if (!v51) {
          goto LABEL_57;
        }
      }

      __int128 v52 = *(_OWORD *)v36;
      __int128 v53 = *((_OWORD *)v36 + 1);
      *((void *)v34 + 4) = *((void *)v36 + 4);
      *(_OWORD *)uint64_t v34 = v52;
      *((_OWORD *)v34 + 1) = v53;
LABEL_57:
      v34 -= 40;
      if (v12 <= v58 || v5 <= v6) {
        goto LABEL_61;
      }
    }
  }

  if (a4 != __dst || &__dst[40 * v8] <= a4) {
    memmove(a4, __dst, 40 * v8);
  }
  uint64_t v12 = &a4[40 * v8];
  uint64_t v13 = a4;
  if (v5 < v66 && v7 >= 40)
  {
    while (1)
    {
      uint64_t v14 = v12;
      uint64_t v15 = v5;
      sub_100005A60((uint64_t)v5, (uint64_t)v63);
      sub_100005A60((uint64_t)v13, (uint64_t)v60);
      uint64_t v16 = v64;
      uint64_t v17 = v65;
      sub_100005F28(v63, v64);
      uint64_t v18 = dispatch thunk of CatalogResource.id.getter(v16, v17);
      uint64_t v20 = v19;
      uint64_t v22 = v61;
      uint64_t v21 = v62;
      sub_100005F28(v60, v61);
      uint64_t v23 = dispatch thunk of CatalogResource.id.getter(v22, v21);
      BOOL v25 = v18 == v23 && v20 == v24;
      if (v25) {
        break;
      }
      uint64_t v26 = v24;
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v23, v24, 1LL);
      swift_bridgeObjectRelease(v20);
      swift_bridgeObjectRelease(v26);
      sub_100002318(v60);
      sub_100002318(v63);
      if ((v27 & 1) == 0) {
        goto LABEL_18;
      }
      BOOL v28 = v15;
      uint64_t v5 = v15 + 40;
      BOOL v29 = v6 != v15 || v6 >= v5;
LABEL_22:
      uint64_t v12 = v14;
      if (v29)
      {
        __int128 v30 = *(_OWORD *)v28;
        __int128 v31 = *((_OWORD *)v28 + 1);
        *((void *)v6 + 4) = *((void *)v28 + 4);
        *(_OWORD *)uint64_t v6 = v30;
        *((_OWORD *)v6 + 1) = v31;
      }

      v6 += 40;
      if (v13 >= v14 || v5 >= v66) {
        goto LABEL_30;
      }
    }

    swift_bridgeObjectRelease_n(v20, 2LL);
    sub_100002318(v60);
    sub_100002318(v63);
LABEL_18:
    BOOL v25 = v6 == v13;
    BOOL v28 = v13;
    v13 += 40;
    BOOL v29 = !v25 || v6 >= v13;
    uint64_t v5 = v15;
    goto LABEL_22;
  }

LABEL_30:
  uint64_t v5 = v6;
LABEL_61:
  uint64_t v55 = (v12 - v13) / 40;
  if (v5 != v13 || v5 >= &v13[40 * v55]) {
    memmove(v5, v13, 40 * v55);
  }
  return 1LL;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

char *sub_100007C38(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_10000228C(&qword_100010148);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[16 * v8] <= v13) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100007D2C(uint64_t a1)
{
  return sub_100007C38(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100007D40(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v24, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    size_t v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0LL;
    }

    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v19 = (void *)(v11 + 16 * v10);
      uint64_t v20 = v19[1];
      BOOL v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0LL) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  void *v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_100008798(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_100007EEC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Tag(0LL);
  uint64_t v41 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v2;
  if (*(void *)(*v2 + 24) > a1) {
    a1 = *(void *)(*v2 + 24);
  }
  sub_10000228C(&qword_100010128);
  uint64_t v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 1LL);
  uint64_t v9 = v8;
  if (*(void *)(v7 + 16))
  {
    uint64_t v10 = 1LL << *(_BYTE *)(v7 + 32);
    uint64_t v11 = *(void *)(v7 + 56);
    uint64_t v40 = (void *)(v7 + 56);
    if (v10 < 64) {
      uint64_t v12 = ~(-1LL << v10);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v13 = v12 & v11;
    uint64_t v38 = v2;
    int64_t v39 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = v8 + 56;
    uint64_t result = swift_retain(v7);
    int64_t v16 = 0LL;
    if (!v13) {
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v17 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v16 << 6))
    {
      uint64_t v23 = v7;
      uint64_t v24 = *(void *)(v41 + 72);
      unint64_t v25 = *(void *)(v7 + 48) + v24 * i;
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 32);
      v26(v6, v25, v4);
      uint64_t v27 = *(void *)(v9 + 40);
      sub_10000A278(&qword_100010118, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
      uint64_t v29 = -1LL << *(_BYTE *)(v9 + 32);
      unint64_t v30 = result & ~v29;
      unint64_t v31 = v30 >> 6;
      if (((-1LL << v30) & ~*(void *)(v14 + 8 * (v30 >> 6))) == 0)
      {
        char v33 = 0;
        unint64_t v34 = (unint64_t)(63 - v29) >> 6;
        while (++v31 != v34 || (v33 & 1) == 0)
        {
          BOOL v35 = v31 == v34;
          if (v31 == v34) {
            unint64_t v31 = 0LL;
          }
          v33 |= v35;
          uint64_t v36 = *(void *)(v14 + 8 * v31);
          if (v36 != -1)
          {
            unint64_t v32 = __clz(__rbit64(~v36)) + (v31 << 6);
            goto LABEL_30;
          }
        }

        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }

      unint64_t v32 = __clz(__rbit64((-1LL << v30) & ~*(void *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_30:
      *(void *)(v14 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v32;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)( *(void *)(v9 + 48) + v32 * v24,  v6,  v4);
      ++*(void *)(v9 + 16);
      uint64_t v7 = v23;
      if (v13) {
        goto LABEL_8;
      }
LABEL_9:
      int64_t v19 = v16 + 1;
      if (__OFADD__(v16, 1LL)) {
        goto LABEL_40;
      }
      if (v19 >= v39) {
        break;
      }
      uint64_t v20 = v40;
      unint64_t v21 = v40[v19];
      ++v16;
      if (!v21)
      {
        int64_t v16 = v19 + 1;
        if (v19 + 1 >= v39) {
          goto LABEL_32;
        }
        unint64_t v21 = v40[v16];
        if (!v21)
        {
          int64_t v22 = v19 + 2;
          if (v22 >= v39)
          {
LABEL_32:
            swift_release(v7);
            uint64_t v2 = v38;
            goto LABEL_34;
          }

          unint64_t v21 = v40[v22];
          if (!v21)
          {
            while (1)
            {
              int64_t v16 = v22 + 1;
              if (__OFADD__(v22, 1LL)) {
                goto LABEL_41;
              }
              if (v16 >= v39) {
                goto LABEL_32;
              }
              unint64_t v21 = v40[v16];
              ++v22;
              if (v21) {
                goto LABEL_20;
              }
            }
          }

          int64_t v16 = v22;
        }
      }

LABEL_20:
      unint64_t v13 = (v21 - 1) & v21;
    }

    swift_release(v7);
    uint64_t v2 = v38;
    uint64_t v20 = v40;
LABEL_34:
    uint64_t v37 = 1LL << *(_BYTE *)(v7 + 32);
    if (v37 > 63) {
      sub_100008930(0LL, (unint64_t)(v37 + 63) >> 6, v20);
    }
    else {
      *uint64_t v20 = -1LL << v37;
    }
    *(void *)(v7 + 16) = 0LL;
  }

  uint64_t result = swift_release(v7);
  *uint64_t v2 = v9;
  return result;
}

    uint64_t v14 = (v21 - 1) & v21;
  }

  int64_t v22 = v20 + 2;
  if (v22 >= v37)
  {
LABEL_32:
    uint64_t result = swift_release_n(v8, 2LL);
    uint64_t v2 = v35;
    goto LABEL_34;
  }

  unint64_t v21 = *(void *)(v36 + 8 * v22);
  if (v21)
  {
    unint64_t v17 = v22;
    goto LABEL_20;
  }

  while (1)
  {
    unint64_t v17 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v17 >= v37) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v36 + 8 * v17);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }

Swift::Int sub_100008230(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000228C(&qword_100010138);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    unint64_t v32 = v2;
    char v33 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v13 = 0LL;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      int64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v20, v21);
      Swift::Int result = Hasher._finalize()();
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0LL;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
      unint64_t v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
      *unint64_t v30 = v20;
      v30[1] = v21;
      ++*(void *)(v6 + 16);
      if (v9) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1LL)) {
        goto LABEL_41;
      }
      if (v16 >= v10) {
        goto LABEL_35;
      }
      unint64_t v17 = v33[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v10) {
          goto LABEL_35;
        }
        unint64_t v17 = v33[v13];
        if (!v17)
        {
          int64_t v13 = v16 + 2;
          if (v16 + 2 >= v10) {
            goto LABEL_35;
          }
          unint64_t v17 = v33[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 3;
            if (v18 >= v10)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v32;
              uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
              if (v31 > 63) {
                sub_100008930(0LL, (unint64_t)(v31 + 63) >> 6, v33);
              }
              else {
                *char v33 = -1LL << v31;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v17 = v33[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1LL)) {
                  goto LABEL_42;
                }
                if (v13 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v17 = v33[v13];
                ++v18;
                if (v17) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v13 = v18;
          }
        }
      }

LABEL_23:
      unint64_t v9 = (v17 - 1) & v17;
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    unint64_t v17 = (v22 - 1) & v22;
  }

  unint64_t v23 = v21 + 2;
  if (v23 >= v18)
  {
LABEL_26:
    Swift::Int result = (void *)swift_release(v6);
    uint64_t v1 = v26;
    goto LABEL_28;
  }

  uint64_t v22 = *(void *)(v10 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v13 >= v18) {
      goto LABEL_26;
    }
    uint64_t v22 = *(void *)(v10 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }

    int64_t v10 = (v17 - 1) & v17;
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v32)
  {
LABEL_35:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_37;
  }

  unint64_t v17 = *(void *)(v8 + 8 * v18);
  if (v17)
  {
    int64_t v13 = v18;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v13 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v13);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }

    unint64_t v9 = (v15 - 1) & v15;
    int64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    int64_t v18 = *v17;
    int64_t v19 = v17[1];
    Hasher.init(_seed:)(v32, v8[5]);
    swift_bridgeObjectRetain(v19);
    String.hash(into:)(v32, v18, v19);
    Swift::Int result = Hasher._finalize()();
    uint64_t v20 = -1LL << *((_BYTE *)v8 + 32);
    uint64_t v21 = result & ~v20;
    uint64_t v22 = v21 >> 6;
    if (((-1LL << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      unint64_t v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        char v26 = v22 == v25;
        if (v22 == v25) {
          uint64_t v22 = 0LL;
        }
        v24 |= v26;
        unint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v23 = __clz(__rbit64((-1LL << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v23;
    BOOL v28 = (void *)(v8[6] + 16 * v23);
    *BOOL v28 = v18;
    v28[1] = v19;
    ++v8[2];
    if (__OFSUB__(v5--, 1LL)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }

  int64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_35;
  }
  uint64_t v15 = a1[v16];
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_35;
    }
    uint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }

uint64_t sub_100008508(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v30 = a1;
  uint64_t v6 = type metadata accessor for Tag(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  uint64_t v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100007EEC(v12);
  }

  else
  {
    if (v11 > v10)
    {
      sub_10000894C();
      goto LABEL_12;
    }

    sub_100008D10(v12);
  }

  uint64_t v13 = *v3;
  uint64_t v14 = *(void *)(*v3 + 40);
  sub_10000A278(&qword_100010118, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
  uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  uint64_t v17 = -1LL << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v18 = ~v17;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(void *)(v13 + 48) + v19 * a2, v6);
      sub_10000A278(&qword_100010120, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v18;
    }

    while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

LABEL_12:
  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(*v29 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v24 + 48) + *(void *)(v7 + 72) * a2,  v23,  v6);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1LL);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

uint64_t sub_10000870C(void *a1)
{
  return sub_1000040D0(a1, *(void *)(v1 + 16)) & 1;
}

void *sub_100008728(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

void *sub_100008764(void *result)
{
  uint64_t v1 = *(void *)(result[3] - 8LL);
  if ((*(_DWORD *)(v1 + 80) & 0x20000) != 0) {
    return (void *)swift_slowDealloc( *result,  *(void *)(v1 + 64)
  }
                     + ((*(_DWORD *)(v1 + 80) + 16LL) & ~(unint64_t)*(_DWORD *)(v1 + 80)),
                       *(_DWORD *)(v1 + 80) | 7LL);
  return result;
}

uint64_t sub_100008798(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100008230(v11);
  }

  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_100008B60();
      goto LABEL_22;
    }

    sub_100009018(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  uint64_t result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    uint64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(void *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v20 = (void *)(v15 + 16 * a3);
        uint64_t v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

LABEL_22:
  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  *uint64_t v24 = v8;
  v24[1] = a2;
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

      swift_bridgeObjectRelease(v8);
      continue;
    }

    uint64_t result = swift_bridgeObjectRelease(v8);
LABEL_10:
    uint64_t v20 = a1[v13];
    a1[v13] = v14 | v20;
    if ((v14 & v20) == 0 && __OFADD__(v31++, 1LL))
    {
      __break(1u);
      return result;
    }
  }

  swift_bridgeObjectRelease(a3);
  uint64_t v5 = a2;
  uint64_t v28 = v31;
LABEL_27:
  swift_retain(a4);
  return sub_100009658(a1, v5, v28, a4);
}

uint64_t sub_100008930(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }

  return result;
}

void *sub_10000894C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Tag(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000228C(&qword_100010128);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)(*v0);
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release(v6);
LABEL_28:
    *uint64_t v1 = v8;
    return result;
  }

  BOOL v26 = v1;
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1LL << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  int64_t v13 = 0LL;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v14 = 1LL << *(_BYTE *)(v6 + 32);
  uint64_t v15 = *(void *)(v6 + 56);
  uint64_t v16 = -1LL;
  if (v14 < 64) {
    uint64_t v16 = ~(-1LL << v14);
  }
  unint64_t v17 = v16 & v15;
  int64_t v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v19 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    unint64_t v24 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v24, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v8 + 48) + v24,  v5,  v2);
    if (v17) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v21 >= v18) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v18) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v10 + 8 * v13);
      if (!v22) {
        break;
      }
    }

void *sub_100008B60()
{
  uint64_t v1 = v0;
  sub_10000228C(&qword_100010138);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    unint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *unint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain(v21);
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

uint64_t sub_100008D10(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Tag(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *v2;
  if (*(void *)(*v2 + 24) > a1) {
    a1 = *(void *)(*v2 + 24);
  }
  sub_10000228C(&qword_100010128);
  uint64_t v9 = static _SetStorage.resize(original:capacity:move:)(v8, a1, 0LL);
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16))
  {
    uint64_t result = swift_release(v8);
LABEL_34:
    *uint64_t v2 = v10;
    return result;
  }

  uint64_t v11 = 1LL << *(_BYTE *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 56);
  BOOL v35 = v2;
  uint64_t v36 = v8 + 56;
  if (v11 < 64) {
    uint64_t v13 = ~(-1LL << v11);
  }
  else {
    uint64_t v13 = -1LL;
  }
  unint64_t v14 = v13 & v12;
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v15 = v9 + 56;
  uint64_t result = swift_retain(v8);
  int64_t v17 = 0LL;
  if (!v14) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v18 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (unint64_t i = v18 | (v17 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v17 << 6))
  {
    uint64_t v23 = *(void *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(void *)(v8 + 48) + v23 * i, v4);
    uint64_t v24 = *(void *)(v10 + 40);
    sub_10000A278(&qword_100010118, (uint64_t (*)(uint64_t))&type metadata accessor for Tag);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v24, v4, v25);
    uint64_t v26 = -1LL << *(_BYTE *)(v10 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1LL << v27) & ~*(void *)(v15 + 8 * (v27 >> 6))) == 0)
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        BOOL v32 = v28 == v31;
        if (v28 == v31) {
          unint64_t v28 = 0LL;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v15 + 8 * v28);
        if (v33 != -1)
        {
          unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_30;
        }
      }

      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }

    unint64_t v29 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v15 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_30:
    *(void *)(v15 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v29;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))( *(void *)(v10 + 48) + v29 * v23,  v7,  v4);
    ++*(void *)(v10 + 16);
    if (v14) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      goto LABEL_36;
    }
    if (v20 >= v37) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v36 + 8 * v20);
    ++v17;
    if (!v21)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v37) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v36 + 8 * v17);
      if (!v21) {
        break;
      }
    }

LABEL_37:
  __break(1u);
  return result;
}

      uint64_t v10 = v13;
LABEL_38:
      unint64_t v7 = v26;
      goto LABEL_39;
    }

uint64_t sub_100009000(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

Swift::Int sub_100009018(uint64_t a1)
{
  __int128 v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000228C(&qword_100010138);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    *__int128 v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  unint64_t v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    int64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v21);
    String.hash(into:)(v33, v20, v21);
    Swift::Int result = Hasher._finalize()();
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    char v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
    *char v30 = v20;
    v30[1] = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      goto LABEL_39;
    }
    if (v16 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v32) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v13);
      if (!v17)
      {
        int64_t v13 = v16 + 2;
        if (v16 + 2 >= v32) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v13);
        if (!v17) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

Swift::Int sub_1000092C0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(_BYTE *)(a2 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (1LL << v4) + 63;
  uint64_t v7 = v6 >> 6;
  uint64_t v8 = 8 * (v6 >> 6);
  if (v5 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v6 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v9 = (unint64_t *)((char *)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL));
    sub_100008930(0LL, v7, v9);
    Swift::Int v10 = sub_10000944C(v9, v7, v3, a2);
    swift_release(a2);
  }

  else
  {
    uint64_t v11 = (unint64_t *)swift_slowAlloc(v8, -1LL);
    sub_100008930(0LL, v7, v11);
    Swift::Int v10 = sub_10000944C(v11, v7, v3, a2);
    swift_release(a2);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  return v10;
}

Swift::Int sub_10000944C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  uint64_t v34 = *(void *)(a3 + 16);
  if (!v34)
  {
    uint64_t v28 = 0LL;
    goto LABEL_27;
  }

  uint64_t v36 = a4 + 56;
  uint64_t v33 = a3 + 32;
  swift_bridgeObjectRetain(a3);
  uint64_t v31 = 0LL;
  for (uint64_t i = 0LL; i != v34; ++i)
  {
    uint64_t v7 = (uint64_t *)(v33 + 16 * i);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    Hasher.init(_seed:)(v35, *(void *)(a4 + 40));
    swift_bridgeObjectRetain(v8);
    String.hash(into:)(v35, v9, v8);
    Swift::Int v10 = Hasher._finalize()();
    uint64_t v11 = -1LL << *(_BYTE *)(a4 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = 1LL << v12;
    if (((1LL << v12) & *(void *)(v36 + 8 * (v12 >> 6))) == 0) {
      goto LABEL_22;
    }
    uint64_t v15 = *(void *)(a4 + 48);
    int64_t v16 = (void *)(v15 + 16 * v12);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v9 && v17 == v8;
    if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v9, v8, 0LL) & 1) == 0)
    {
      uint64_t v22 = ~v11;
      for (unint64_t j = v12 + 1; ; unint64_t j = v24 + 1)
      {
        unint64_t v24 = j & v22;
        unint64_t v25 = (void *)(v15 + 16 * v24);
        uint64_t v26 = v25[1];
        BOOL v27 = *v25 == v9 && v26 == v8;
        if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v25, v26, v9, v8, 0LL) & 1) != 0)
        {
          Swift::Int result = swift_bridgeObjectRelease(v8);
          unint64_t v13 = v24 >> 6;
          uint64_t v14 = 1LL << v24;
          goto LABEL_10;
        }
      }

Swift::Int sub_100009658(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_35:
    swift_release(v4);
    return (Swift::Int)v8;
  }

  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10000228C(&qword_100010138);
  Swift::Int result = static _SetStorage.allocate(capacity:)(v5);
  uint64_t v8 = (void *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0LL;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0LL;
  Swift::Int v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }

    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1LL)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_35;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_35;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }

uint64_t sub_1000098E4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_39;
  }

  if (a3 < 0) {
    goto LABEL_41;
  }
  Swift::Int v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v26 = -1LL << *(_BYTE *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (uint64_t *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    unint64_t v23 = (uint64_t *)(*(void *)(a4 + 56) + 16 * v16);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    *Swift::Int v11 = v22;
    v11[1] = v21;
    v11[2] = v24;
    v11[3] = v25;
    if (v13 == v10)
    {
      ((void (*)(void))swift_bridgeObjectRetain)();
      swift_bridgeObjectRetain(v25);
      goto LABEL_38;
    }

    v11 += 4;
    swift_bridgeObjectRetain(v21);
    Swift::Int result = swift_bridgeObjectRetain(v25);
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2LL;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0LL;
        int64_t v12 = v17;
      }

      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }

        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }

          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0LL;
            goto LABEL_37;
          }

          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1LL)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0LL;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }

              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }

          goto LABEL_17;
        }

        unint64_t v9 = 0LL;
        int64_t v12 = v17 + 2;
      }

LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_100009B00(void *a1)
{
  return sub_100005FA4(0LL, a1[2], 0, a1);
}

void *sub_100009B14(void *a1)
{
  return sub_1000060C0(0LL, a1[2], 0, a1);
}

uint64_t sub_100009B28(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t *sub_100009B30(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v13);
  }

  else
  {
    uint64_t v7 = sub_10000228C(&qword_1000100C0);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    Swift::Int v11 = (char *)a2 + v9;
    uint64_t v12 = sub_10000228C(&qword_1000100D8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
  }

  return a1;
}

uint64_t sub_100009C1C(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_10000228C(&qword_1000100C0);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL);
  v8(a1, v4);
  v8(a1 + a2[5], v4);
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_10000228C(&qword_1000100D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(a1 + a2[7], v4);
}

uint64_t sub_100009CC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000228C(&qword_1000100C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10000228C(&qword_1000100D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_100009D84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000228C(&qword_1000100C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10000228C(&qword_1000100D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_100009E44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000228C(&qword_1000100C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10000228C(&qword_1000100D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_100009F04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10000228C(&qword_1000100C0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_10000228C(&qword_1000100D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t sub_100009FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009FD0);
}

uint64_t sub_100009FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000228C(&qword_1000100C0);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = a1;
  }

  else
  {
    uint64_t v7 = sub_10000228C(&qword_1000100D8);
    uint64_t v8 = a1 + *(int *)(a3 + 24);
  }

  return sub_10000A040(v8, a2, v7);
}

uint64_t sub_10000A040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_10000A04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A058);
}

uint64_t sub_10000A058(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_10000228C(&qword_1000100C0);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v9 = sub_10000228C(&qword_1000100D8);
    uint64_t v10 = a1 + *(int *)(a4 + 24);
  }

  return sub_10000230C(v10, a2, a2, v9);
}

void sub_10000A0D0(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    v7[0] = v4;
    v7[1] = v4;
    sub_10000A19C(319LL);
    if (v6 <= 0x3F)
    {
      v7[2] = *(void *)(v5 - 8) + 64LL;
      v7[3] = v4;
      swift_initStructMetadata(a1, 256LL, 4LL, v7, a1 + 16);
    }
  }

void sub_10000A154()
{
  if (!qword_1000101C8)
  {
    unint64_t v0 = type metadata accessor for Flag(0LL, &type metadata for Bool);
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000101C8);
    }
  }

void sub_10000A19C(uint64_t a1)
{
  if (!qword_1000101D0)
  {
    uint64_t v2 = sub_100006334((uint64_t *)&unk_1000101D8);
    unint64_t v3 = type metadata accessor for Option(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000101D0);
    }
  }

void sub_10000A1F4()
{
}

void sub_10000A220()
{
}

void sub_10000A24C()
{
}

void sub_10000A278(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_10000A844(v3), a1);
  }

  sub_10000A8A4();
}

unint64_t sub_10000A2AC()
{
  unint64_t result = qword_100010240;
  if (!qword_100010240)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000B254, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010240);
  }

  return result;
}

void sub_10000A2E8(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_100006334(a2);
    atomic_store(sub_10000A844(v3), a1);
  }

  sub_10000A8A4();
}

_BYTE *initializeBufferWithCopyOfBuffer for Status.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Status.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Status.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_10000A400 + 4 * byte_10000B0A9[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000A434 + 4 * byte_10000B0A4[v4]))();
}

uint64_t sub_10000A434(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A43C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000A444LL);
  }
  return result;
}

uint64_t sub_10000A450(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000A458LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10000A45C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A464(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A470(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A478(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Status.CodingKeys()
{
  return &type metadata for Status.CodingKeys;
}

unint64_t sub_10000A494()
{
  unint64_t result = qword_100010258;
  if (!qword_100010258)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000B22C, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010258);
  }

  return result;
}

unint64_t sub_10000A4D4()
{
  unint64_t result = qword_100010260;
  if (!qword_100010260)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000B19C, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010260);
  }

  return result;
}

unint64_t sub_10000A514()
{
  unint64_t result = qword_100010268;
  if (!qword_100010268)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000B1C4, &type metadata for Status.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010268);
  }

  return result;
}

uint64_t sub_10000A550(uint64_t a1)
{
  return print(_:separator:terminator:)(a1, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
}

uint64_t sub_10000A564@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_10000A574()
{
  return *(void *)(v0 + 576);
}

  ;
}

uint64_t sub_10000A5B0(uint64_t a1)
{
  return swift_allocObject(a1, 64LL, 7LL);
}

  ;
}

uint64_t sub_10000A5C8()
{
  uint64_t v2 = sub_10000230C(v0, 0LL, 1LL, v1);
  return static NameSpecification.long.getter(v2);
}

uint64_t sub_10000A5EC()
{
  uint64_t v2 = sub_10000230C(v1, 0LL, 1LL, v0);
  return static NameSpecification.long.getter(v2);
}

uint64_t sub_10000A610(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000A62C()
{
  return *(void *)(v0 + 576);
}

uint64_t sub_10000A65C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A664()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A66C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A674()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A67C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A684()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A68C()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A694()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10000A69C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000A6A4()
{
  return Flag<A>.init(wrappedValue:name:help:)(0LL, v0, v1);
}

uint64_t sub_10000A6B4()
{
  return Flag<A>.init(wrappedValue:name:help:)(0LL, v0, v1);
}

  ;
}

  ;
}

uint64_t sub_10000A6EC()
{
  return swift_task_dealloc(v0);
}

  ;
}

uint64_t sub_10000A710()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000A718( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return swift_task_dealloc(a12);
}

uint64_t sub_10000A720( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return swift_task_dealloc(a11);
}

uint64_t sub_10000A728()
{
  return 0LL;
}

uint64_t sub_10000A744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ArgumentHelp.init(stringLiteral:)(a1, (a2 - 32) | 0x8000000000000000LL);
}

uint64_t sub_10000A754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ArgumentHelp.init(stringLiteral:)(a1, (a2 - 32) | 0x8000000000000000LL);
}

uint64_t sub_10000A764()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000A7A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_task_dealloc(a10);
}

  ;
}

uint64_t sub_10000A7BC()
{
  return swift_task_alloc(v0);
}

uint64_t sub_10000A7C4(uint64_t a1)
{
  *(void *)(v2 - 8) = *v1;
  return swift_task_dealloc(a1);
}

uint64_t sub_10000A7D4()
{
  return type metadata accessor for Status(0LL);
}

uint64_t sub_10000A7DC(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10000A844(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_10000A850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000230C(a1, 1LL, 1LL, a4);
}

uint64_t sub_10000A85C()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_10000A870(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_10000A878@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_10000A880(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_10000A888()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_10000A890(Swift::String a1)
{
}

uint64_t sub_10000A89C()
{
  return swift_release(*(void *)(v0 + 584));
}

  ;
}

uint64_t sub_10000A8AC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_10000A8B8()
{
  return sub_100002318((void *)(v0 - 128));
}

void *sub_10000A8C0(void *a1, int64_t a2)
{
  return sub_100005D2C(a1, a2, 1, v2);
}

size_t sub_10000A8CC(size_t a1, int64_t a2)
{
  return sub_100005F0C(a1, a2, 1);
}

  ;
}