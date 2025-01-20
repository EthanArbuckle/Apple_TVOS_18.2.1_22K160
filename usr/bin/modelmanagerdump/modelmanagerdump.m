uint64_t sub_100002C04()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  sub_100002FA4(&qword_100008040);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v2 = type metadata accessor for CommandConfiguration(0LL);
  sub_100003240(v2, qword_100008088);
  sub_100003228(v2, (uint64_t)qword_100008088);
  v3 = type metadata accessor for NameSpecification(0LL);
  sub_100003280((uint64_t)v1, 1LL, 1LL, v3);
  v5 = 1;
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)( 0LL,  0LL,  0xD000000000000019LL,  0x8000000100003D00LL,  0LL,  0LL,  0LL,  0xE000000000000000LL,  0LL,  0xE000000000000000LL,  v5,  &_swiftEmptyArrayStorage,  0LL,  0LL,  v1);
}

uint64_t sub_100002D08()
{
  if (qword_100008000 != -1) {
    swift_once(&qword_100008000, sub_100002C04);
  }
  uint64_t v0 = type metadata accessor for CommandConfiguration(0LL);
  return sub_100003228(v0, (uint64_t)qword_100008088);
}

uint64_t sub_100002D50()
{
  uint64_t v1 = type metadata accessor for String.Encoding(0LL);
  v0[2] = sub_1000032B8(*(void *)(v1 - 8));
  uint64_t v2 = type metadata accessor for StateDump(0LL);
  v0[3] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v0[4] = v3;
  uint64_t v4 = sub_1000032B8(v3);
  v0[5] = v4;
  v5 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to static StateDump.dump() + 1));
  v0[6] = v5;
  void *v5 = v0;
  v5[1] = sub_100002DD4;
  return static StateDump.dump()(v4);
}

uint64_t sub_100002DD4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48LL);
  *(void *)(*(void *)v1 + 56LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100002F6C;
  }
  else {
    uint64_t v3 = sub_100002E38;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100002E38()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = sub_100002FA4(&qword_100008018);
  uint64_t v6 = swift_allocObject(v5, 64LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_100003AB0;
  uint64_t v7 = StateDump.dataValue.getter();
  if (v8 >> 60 == 15) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = v7;
  }
  if (v8 >> 60 == 15) {
    unint64_t v10 = 0xC000000000000000LL;
  }
  else {
    unint64_t v10 = v8;
  }
  static String.Encoding.utf8.getter(v7);
  uint64_t v11 = String.init(data:encoding:)(v9, v10, v3);
  unint64_t v13 = v12;
  sub_100002FE4(v9, v10);
  *(void *)(v6 + 56) = &type metadata for String;
  unint64_t v14 = 0xD000000000000013LL;
  if (v13) {
    unint64_t v14 = v11;
  }
  unint64_t v15 = 0x8000000100003CE0LL;
  if (v13) {
    unint64_t v15 = v13;
  }
  *(void *)(v6 + 32) = v14;
  *(void *)(v6 + 40) = v15;
  print(_:separator:terminator:)(v6, 32LL, 0xE100000000000000LL, 10LL, 0xE100000000000000LL);
  swift_bridgeObjectRelease(v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002F6C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc(*(void *)(v0 + 40));
  swift_task_dealloc(v1);
  return sub_1000032AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002FA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100002FE4(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for DumpState()
{
  return &type metadata for DumpState;
}

uint64_t sub_100003038(void *a1)
{
  return sub_10000328C(a1);
}

uint64_t sub_10000305C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008014);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000030A0;
  return sub_100002D50();
}

uint64_t sub_1000030A0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return sub_1000032AC(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_1000030E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100002D08();
  uint64_t v3 = type metadata accessor for CommandConfiguration(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v2, v3);
}

void sub_100003124()
{
}

void sub_10000313C()
{
}

uint64_t sub_100003154(void *a1)
{
  return sub_100003038(a1);
}

unint64_t sub_10000316C()
{
  unint64_t result = qword_100008020;
  if (!qword_100008020)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003B74, &type metadata for DumpState);
    atomic_store(result, (unint64_t *)&qword_100008020);
  }

  return result;
}

unint64_t sub_1000031AC()
{
  unint64_t result = qword_100008028;
  if (!qword_100008028)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003B04, &type metadata for DumpState);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }

  return result;
}

unint64_t sub_1000031EC()
{
  unint64_t result = qword_100008038;
  if (!qword_100008038)
  {
    unint64_t result = swift_getWitnessTable("%\a", &type metadata for DumpState);
    atomic_store(result, (unint64_t *)&qword_100008038);
  }

  return result;
}

uint64_t sub_100003228(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003240(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_10000328C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000032AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000032B8@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_1000032C8()
{
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for CommandConfiguration(0LL);
  sub_100003240(v2, qword_1000080A0);
  sub_100003228(v2, (uint64_t)qword_1000080A0);
  uint64_t v3 = type metadata accessor for NameSpecification(0LL);
  sub_100003280((uint64_t)v1, 1LL, 1LL, v3);
  char v5 = 1;
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)( 0LL,  0LL,  0xD00000000000002DLL,  0x8000000100003D20LL,  0LL,  0LL,  0LL,  0xE000000000000000LL,  0LL,  0xE000000000000000LL,  v5,  &_swiftEmptyArrayStorage,  0LL,  0LL,  v1);
}

uint64_t sub_1000033CC()
{
  if (qword_100008008 != -1) {
    swift_once(&qword_100008008, sub_1000032C8);
  }
  uint64_t v0 = type metadata accessor for CommandConfiguration(0LL);
  return sub_100003228(v0, (uint64_t)qword_1000080A0);
}

uint64_t sub_100003414()
{
  return swift_task_switch(sub_100003428, 0LL, 0LL);
}

uint64_t sub_100003428()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008014);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000034B8;
  return sub_100002D50();
}

uint64_t sub_1000034B8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16LL);
  *(void *)(*(void *)v1 + 24LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100003528;
  }
  else {
    uint64_t v3 = sub_10000351C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000351C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003528()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003534()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008084);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003578;
  return sub_100003414();
}

uint64_t sub_100003578()
{
  return sub_1000032AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000359C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000033CC();
  uint64_t v3 = type metadata accessor for CommandConfiguration(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v2, v3);
}

uint64_t sub_1000035DC()
{
  v0[2] = type metadata accessor for MainActor(0LL);
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc(*((unsigned int *)&async function pointer to static AsyncParsableCommand.main() + 1));
  v0[4] = v1;
  sub_1000037AC();
  *uint64_t v1 = v0;
  v1[1] = sub_100003654;
  return static AsyncParsableCommand.main()();
}

uint64_t sub_100003654()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 32LL));
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000036C4, v2, v3);
}

void sub_1000036C4()
{
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = swift_task_create(2048LL, 0LL, (char *)&type metadata for () + 8, &unk_100008048, 0LL);
  uint64_t MainExecutor = swift_task_getMainExecutor();
  uint64_t v6 = swift_job_run(v3, MainExecutor, v5);
  int result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_100003740()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_100008054);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003784;
  return sub_1000035DC();
}

uint64_t sub_100003784()
{
  return sub_1000032AC(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_1000037AC()
{
  unint64_t result = qword_100008058;
  if (!qword_100008058)
  {
    unint64_t result = swift_getWitnessTable(asc_100003C7C, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008058);
  }

  return result;
}

ValueMetadata *type metadata accessor for modelmanagerdump()
{
  return &type metadata for modelmanagerdump;
}

unint64_t sub_1000037FC()
{
  unint64_t result = qword_100008060;
  if (!qword_100008060)
  {
    unint64_t result = swift_getWitnessTable(byte_100003BD4, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008060);
  }

  return result;
}

unint64_t sub_10000383C()
{
  unint64_t result = qword_100008068;
  if (!qword_100008068)
  {
    unint64_t result = swift_getWitnessTable(byte_100003BFC, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008068);
  }

  return result;
}

unint64_t sub_10000387C()
{
  unint64_t result = qword_100008070;
  if (!qword_100008070)
  {
    unint64_t result = swift_getWitnessTable(byte_100003C3C, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008070);
  }

  return result;
}

uint64_t sub_1000038B8()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}