void sub_100004E0C(uint64_t a1)
{
  unint64_t v2;
  v2 = sub_100006200();
  AppIntentsExtension.configuration.getter(a1, v2);
  sub_100006D84();
}

void sub_100004E44()
{
}

uint64_t sub_100004E64()
{
  return sub_100005B70();
}

uint64_t sub_100004E84(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100006D60();
  v2[4] = sub_100006D50();
  sub_100006CE8();
  return sub_100006C00();
}

id sub_100004ED8()
{
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (result)
  {
    v2 = result;
    uint64_t v3 = *(void *)(type metadata accessor for URL(0LL) - 8);
    uint64_t v4 = sub_100006C60(*(void *)(v3 + 64));
    sub_100006DA4();
    URL._bridgeToObjectiveC()(v5);
    v7 = v6;
    sub_100006D7C(v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_100006D34();
    uint64_t v8 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    sub_100006778((uint64_t)v7, v8, v2);

    static IntentResult.result<>()();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_100004FD0()
{
  uint64_t v1 = sub_100006C0C();
  uint64_t v2 = type metadata accessor for URL(v1);
  sub_100006C4C(v2);
  sub_100006604(&qword_10000C0C0);
  sub_100006BC8();
  __chkstk_darwin();
  uint64_t v3 = sub_100006C6C();
  sub_100006D00(v3);
  sub_100006D58();
  sub_100006CB8();
  __chkstk_darwin();
  (*(void (**)(char *, void))(v5 + 104))( (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  enum case for InputConnectionBehavior.default(_:));
  uint64_t v6 = sub_100006D90();
  IntentParameter<>.init(title:description:default:requestValueDialog:inputConnectionBehavior:)(v6);
  sub_100006D24();
}

uint64_t sub_1000050E0@<X0>(uint64_t a1@<X8>)
{
  return sub_100006004(&qword_10000C130, (uint64_t)&unk_10000C760, a1);
}

uint64_t sub_1000050FC()
{
  return static AppIntent.openAppWhenRun.getter() & 1;
}

uint64_t sub_100005114()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100005128()
{
  return static AppIntent.isDiscoverable.getter() & 1;
}

uint64_t sub_100005140()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100005154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000529C(&qword_10000C138, (uint64_t)&unk_10000C778);
  return sub_100006C44(v2, a1);
}

uint64_t sub_10000518C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10000C124);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_100006CA4(v1);
  return sub_100004E84(v2, v3);
}

void sub_1000051D8(void *a1@<X8>)
{
  *a1 = v2;
  sub_100006D14();
}

void sub_1000051F8()
{
  unint64_t v0 = sub_1000062F0();
  sub_100006CF4(v0);
  sub_100006D14();
}

void sub_100005218()
{
}

uint64_t sub_10000523C(void *a1, uint64_t a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for LocalizedStringResource(0LL);
  return sub_100006CD4(v3, a2);
}

uint64_t sub_100005278()
{
  return sub_100005B70();
}

uint64_t sub_10000529C(void *a1, uint64_t a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  uint64_t v3 = sub_100006604(&qword_10000C0D8);
  return sub_100006CD4(v3, a2);
}

uint64_t sub_1000052EC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = sub_100006D60();
  v2[5] = sub_100006D50();
  v2[6] = sub_100006CE8();
  v2[7] = v3;
  return sub_100006C00();
}

id sub_100005344()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  *(void *)(v0 + 72) = v2;
  uint64_t v3 = sub_100006C60(*(void *)(v2 + 64));
  *(void *)(v0 + 80) = v3;
  uint64_t v4 = type metadata accessor for IntentFile(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = sub_100006C60(*(void *)(v5 + 64));
  sub_100006DA4();
  uint64_t v7 = sub_100006604(&qword_10000C100);
  uint64_t v8 = sub_100006C60(*(void *)(*(void *)(v7 - 8) + 64LL));
  IntentFile.fileURL.getter();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v4);
  if (sub_1000066F0(v8, 1LL, v1) == 1)
  {
    sub_100006D48();
    sub_1000066FC(v8);
    sub_100006D34();
    swift_task_dealloc(v6);
    swift_task_dealloc(v3);
    unint64_t v9 = sub_10000673C();
    sub_100006CDC((uint64_t)&unk_100008578, v9);
    void *v10 = 0LL;
    sub_100006D68();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v3, v8, v1);
  sub_100006D34();
  swift_task_dealloc(v6);
  if (!URL.startAccessingSecurityScopedResource()())
  {
    sub_100006D48();
    unint64_t v20 = sub_10000673C();
    sub_100006CDC((uint64_t)&unk_100008578, v20);
    void *v21 = 1LL;
    sub_100006D68();
LABEL_9:
    sub_100006D7C(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    swift_task_dealloc(v3);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }

  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  if (result)
  {
    v13 = result;
    URL._bridgeToObjectiveC()(v12);
    v15 = v14;
    uint64_t v16 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    id v17 = sub_1000067F8((uint64_t)v15, 0LL, v16, v13);
    *(void *)(v0 + 88) = v17;

    if (v17)
    {
      *(void *)(v0 + 96) = static MainActor.shared.getter();
      uint64_t v18 = swift_task_alloc(32LL);
      *(void *)(v0 + 104) = v18;
      *(void *)(v18 + 16) = v17;
      v19 = (void *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
      *(void *)(v0 + 112) = v19;
      void *v19 = v0;
      v19[1] = sub_100005638;
      return (id)withCheckedContinuation<A>(isolation:function:_:)();
    }

    sub_100006D48();
    unint64_t v22 = sub_10000673C();
    sub_100006CDC((uint64_t)&unk_100008578, v22);
    void *v23 = 2LL;
    sub_100006D68();
    URL.stopAccessingSecurityScopedResource()();
    goto LABEL_9;
  }

  __break(1u);
  return result;
}

uint64_t sub_100005638()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 104);
  uint64_t v3 = *(void *)(*v0 + 96);
  swift_task_dealloc(*(void *)(*v0 + 112));
  swift_release(v3);
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000056A0, *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_1000056A0()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void **)(v0 + 88);
  uint64_t v3 = swift_release(*(void *)(v0 + 40));
  static IntentResult.result<>()(v3);

  URL.stopAccessingSecurityScopedResource()();
  uint64_t v4 = sub_100006D70();
  v5(v4);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100005714(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100006604(&qword_10000C110);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))( (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v4);
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  uint64_t v9 = swift_allocObject(&unk_1000084B8, v8 + v6, v7 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))( v9 + v8,  (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v4);
  aBlock[4] = sub_1000068F8;
  uint64_t v13 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100005854;
  aBlock[3] = &unk_1000084D0;
  v10 = _Block_copy(aBlock);
  swift_release(v13);
  [a2 setCompletionBlock:v10];
  _Block_release(v10);
  return [a2 start];
}

uint64_t sub_100005854(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100005880()
{
  uint64_t v3 = sub_100006C98();
  sub_100006BC8();
  __chkstk_darwin();
  sub_100006C28();
  LocalizedStringResource.init(stringLiteral:)(1701603654LL);
  sub_100006604(&qword_10000C0B8);
  sub_100006BC8();
  __chkstk_darwin();
  sub_100006BD8(v4, v15);
  sub_100006604(&qword_10000C0E8);
  sub_100006BC8();
  __chkstk_darwin();
  uint64_t v5 = sub_100006C0C();
  uint64_t v6 = type metadata accessor for IntentFile(v5);
  sub_100006C4C(v6);
  sub_100006604(&qword_10000C0C0);
  sub_100006BC8();
  __chkstk_darwin();
  uint64_t v7 = sub_100006C6C();
  sub_100006D00(v7);
  uint64_t v8 = sub_100006604(&qword_10000C0F0);
  uint64_t v9 = type metadata accessor for UTType(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_100007170;
  static UTType.item.getter();
  sub_100006D58();
  sub_100006CB8();
  __chkstk_darwin();
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void))(v13 + 104))(v12, enum case for InputConnectionBehavior.default(_:));
  return IntentParameter<>.init(title:description:default:supportedContentTypes:requestValueDialog:inputConnectionBehavior:)( v0,  v1,  v3,  v10,  v2,  v12);
}

uint64_t sub_100005A08@<X0>(uint64_t a1@<X8>)
{
  return sub_100006004(&qword_10000C140, (uint64_t)&unk_10000C790, a1);
}

uint64_t sub_100005A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000529C(&qword_10000C148, (uint64_t)&unk_10000C7A8);
  return sub_100006C44(v2, a1);
}

uint64_t sub_100005A5C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10000C0FC);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_100006CA4(v1);
  return sub_1000052EC(v2, v3);
}

void sub_100005AA8(uint64_t *a1@<X8>)
{
  *a1 = sub_100005880();
  sub_100006D14();
}

void sub_100005AC8()
{
  unint64_t v0 = sub_1000063E0();
  sub_100006CF4(v0);
  sub_100006D14();
}

void sub_100005AE8()
{
}

void sub_100005B0C()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource(0LL);
  sub_100006D3C(v0);
  sub_100006DAC();
  uint64_t v1 = sub_100006D70();
  LocalizedStringResource.init(stringLiteral:)(v1);
  sub_100006D84();
}

uint64_t sub_100005B4C()
{
  return sub_100005B70();
}

uint64_t sub_100005B70()
{
  uint64_t v0 = sub_100006604(&qword_10000C0D8);
  sub_100006D3C(v0);
  uint64_t v1 = sub_100006DAC();
  uint64_t v2 = sub_100006D70();
  IntentDescription.init(stringLiteral:)(v2);
  uint64_t v3 = type metadata accessor for IntentDescription(0LL);
  return sub_100006644(v1, 0LL, 1LL, v3);
}

uint64_t sub_100005BD8(uint64_t a1, uint64_t a2)
{
  v2[15] = a1;
  v2[16] = a2;
  sub_100006D60();
  v2[17] = sub_100006D50();
  v2[18] = sub_100006CE8();
  v2[19] = v3;
  return sub_100006C00();
}

id sub_100005C2C()
{
  id result = [(id)objc_opt_self(LSApplicationWorkspace) defaultWorkspace];
  v0[20] = result;
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = v0 + 2;
    uint64_t v4 = *(void *)(type metadata accessor for IntentApplication(0LL) - 8);
    uint64_t v5 = sub_100006C60(*(void *)(v4 + 64));
    uint64_t v6 = sub_100006DA4();
    IntentApplication.bundleIdentifier.getter(v6);
    uint64_t v8 = v7;
    sub_100006D7C(v5, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    NSString v9 = String._bridgeToObjectiveC()();
    v0[21] = v9;
    swift_bridgeObjectRelease(v8);
    sub_100006D34();
    v0[7] = v0 + 23;
    v0[2] = v0;
    v0[3] = sub_100005D6C;
    uint64_t v10 = swift_continuation_init(v0 + 2, 1LL);
    v0[10] = _NSConcreteStackBlock;
    uint64_t v11 = v0 + 10;
    v11[1] = 0x40000000LL;
    v11[2] = sub_100005E54;
    v11[3] = &unk_100008490;
    v11[4] = v10;
    [v2 openApplicationWithBundleIdentifier:v9 usingConfiguration:0 completionHandler:v11];
    return (id)swift_continuation_await(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100005D6C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  if (v2) {
    uint64_t v3 = sub_100005E10;
  }
  else {
    uint64_t v3 = sub_100005DC8;
  }
  return swift_task_switch(v3, *(void *)(v1 + 144), *(void *)(v1 + 152));
}

uint64_t sub_100005DC8()
{
  uint64_t v2 = *(void **)(v0 + 160);
  uint64_t v1 = *(void **)(v0 + 168);
  swift_release(*(void *)(v0 + 136));

  static IntentResult.result<>()(v3);
  return sub_100006C88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100005E10()
{
  uint64_t v1 = *(void **)(v0 + 168);
  uint64_t v2 = *(void **)(v0 + 160);
  uint64_t v3 = swift_release(*(void *)(v0 + 136));
  swift_willThrow(v3);

  return sub_100006C88(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100005E54(uint64_t a1, char a2, void *a3)
{
  if (a3) {
    return sub_100005E90(*(void *)(a1 + 32), (uint64_t)a3);
  }
  else {
    return sub_100005EE0(*(void *)(a1 + 32), a2);
  }
}

uint64_t sub_100005E90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006604(&qword_10000C0D0);
  uint64_t v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0LL, 0LL);
  void *v6 = a2;
  return swift_continuation_throwingResumeWithError(a1, v5);
}

uint64_t sub_100005EE0(uint64_t a1, char a2)
{
  **(_BYTE **)(*(void *)(a1 + 64) + 40LL) = a2;
  return swift_continuation_throwingResume();
}

void sub_100005EF0()
{
  uint64_t v1 = sub_100006C0C();
  uint64_t v2 = type metadata accessor for IntentDialog(v1);
  sub_100006C4C(v2);
  sub_100006D58();
  sub_100006CB8();
  __chkstk_darwin();
  (*(void (**)(char *, void))(v4 + 104))( (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL),  enum case for InputConnectionBehavior.default(_:));
  uint64_t v5 = sub_100006D90();
  IntentParameter<>.init(title:description:requestValueDialog:inputConnectionBehavior:)(v5);
  sub_100006D24();
}

uint64_t sub_100005FE8@<X0>(uint64_t a1@<X8>)
{
  return sub_100006004(&qword_10000C150, (uint64_t)&unk_10000C7C0, a1);
}

uint64_t sub_100006004@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5 = sub_100006C98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a3, v3, v5);
}

uint64_t sub_100006048@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10000529C(qword_10000C158, (uint64_t)&unk_10000C7D8);
  return sub_100006C44(v2, a1);
}

uint64_t sub_100006080()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10000C0CC);
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_100006CA4(v1);
  return sub_100005BD8(v2, v3);
}

uint64_t sub_1000060CC()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_100006114(void *a1@<X8>)
{
  *a1 = v2;
  sub_100006D14();
}

void sub_100006134()
{
  unint64_t v0 = sub_10000650C();
  sub_100006CF4(v0);
  sub_100006D14();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000061AC()
{
  unint64_t result = qword_10000C030;
  if (!qword_10000C030)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000071A8, &unk_100008480);
    atomic_store(result, (unint64_t *)&qword_10000C030);
  }

  return result;
}

uint64_t sub_1000061EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000064D0( a1,  a2,  a3,  (uint64_t (*)(void))sub_100006200,  (uint64_t)&opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>);
}

unint64_t sub_100006200()
{
  unint64_t result = qword_10000C038;
  if (!qword_10000C038)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007180, &unk_100008480);
    atomic_store(result, (unint64_t *)&qword_10000C038);
  }

  return result;
}

unint64_t sub_100006240()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007278, &unk_100008458);
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }

  return result;
}

unint64_t sub_100006280()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000072A0, &unk_100008458);
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }

  return result;
}

uint64_t sub_1000062BC(uint64_t a1)
{
  return *(void *)(sub_100006D1C(a1, (uint64_t)&unk_100007940) + 8);
}

uint64_t sub_1000062DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000064D0( a1,  a2,  a3,  (uint64_t (*)(void))sub_1000062F0,  (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_1000062F0()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000071E8, &unk_100008458);
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }

  return result;
}

unint64_t sub_100006330()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable(&unk_10000734C, &unk_100008430);
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }

  return result;
}

unint64_t sub_100006370()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007374, &unk_100008430);
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }

  return result;
}

uint64_t sub_1000063AC(uint64_t a1)
{
  return *(void *)(sub_100006D1C(a1, (uint64_t)&unk_100007918) + 8);
}

uint64_t sub_1000063CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000064D0( a1,  a2,  a3,  (uint64_t (*)(void))sub_1000063E0,  (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

unint64_t sub_1000063E0()
{
  unint64_t result = qword_10000C070;
  if (!qword_10000C070)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000072BC, &unk_100008430);
    atomic_store(result, (unint64_t *)&qword_10000C070);
  }

  return result;
}

unint64_t sub_100006420()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007420, &unk_100008408);
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }

  return result;
}

unint64_t sub_100006460()
{
  unint64_t result = qword_10000C088;
  if (!qword_10000C088)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007448, &unk_100008408);
    atomic_store(result, (unint64_t *)&qword_10000C088);
  }

  return result;
}

uint64_t sub_10000649C(uint64_t a1)
{
  return *(void *)(sub_100006D1C(a1, (uint64_t)&unk_1000078F0) + 8);
}

uint64_t sub_1000064BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000064D0( a1,  a2,  a3,  (uint64_t (*)(void))sub_10000650C,  (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_1000064D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  v7[0] = a2;
  v7[1] = a4();
  return sub_100006D1C((uint64_t)v7, a5);
}

unint64_t sub_10000650C()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable(&unk_100007390, &unk_100008408);
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }

  return result;
}

void type metadata accessor for OpenApplication()
{
}

void type metadata accessor for OpenFile()
{
}

void type metadata accessor for OpenURL()
{
}

void type metadata accessor for IntelligenceFlowAppIntentsExtensionExtension()
{
}

unint64_t sub_10000657C()
{
  unint64_t result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    uint64_t v1 = sub_1000065C0(&qword_10000C0A8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }

  return result;
}

uint64_t sub_1000065C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006604(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100006650(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006604(&qword_10000C0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006698(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000066B0(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000066F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_1000066FC(uint64_t a1)
{
  uint64_t v2 = sub_100006604(&qword_10000C100);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_10000673C()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000074F4, &unk_100008578);
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }

  return result;
}

id sub_100006778(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a2);
  id v7 = [a3 openSensitiveURL:a1 withOptions:isa];

  return v7;
}

id sub_1000067F8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  id v9 = [a4 operationToOpenResource:a1 usingApplication:a2 userInfo:isa];

  return v9;
}

id sub_100006890(uint64_t a1)
{
  return sub_100005714(a1, *(void **)(v1 + 16));
}

uint64_t sub_100006898()
{
  uint64_t v1 = sub_100006604(&qword_10000C110);
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v1 - 8) + 8LL))( v0 + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL)),  v1);
  uint64_t v2 = sub_100006D70();
  return swift_deallocObject(v2);
}

void sub_1000068F8()
{
  uint64_t v0 = sub_100006604(&qword_10000C110);
  CheckedContinuation.resume(returning:)(v0, v0);
  sub_100006D14();
}

uint64_t sub_100006934(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006944(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void *sub_10000694C(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = v3;
  return a1;
}

void sub_100006984(void **a1)
{
  uint64_t v1 = *a1;
}

void **sub_10000699C(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      id v6 = v4;
      return a1;
    }

LABEL_7:
    *a1 = v4;
    return a1;
  }

  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    id v4 = *a2;
    goto LABEL_7;
  }

  *a1 = v4;
  id v5 = v4;

  return a1;
}

void *sub_100006A1C(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **sub_100006A28(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }

  *a1 = (void *)v4;

  return a1;
}

uint64_t sub_100006A88(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100006AE4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0LL;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 2;
    }
  }

  return result;
}

uint64_t sub_100006B34(uint64_t *a1)
{
  uint64_t v1 = *a1;
  return (v1 + 1);
}

void *sub_100006B4C(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }

  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }

  *unint64_t result = v2;
  return result;
}

void type metadata accessor for OpenFile.Error()
{
}

void type metadata accessor for CFError()
{
  if (!qword_10000C128)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_100008598);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C128);
    }
  }
}

  ;
}

uint64_t sub_100006BD8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_100006644((uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL), 1LL, 1LL, v2);
}

uint64_t sub_100006C00()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100006C0C()
{
  return 0LL;
}

  ;
}

uint64_t sub_100006C44(uint64_t a1, uint64_t a2)
{
  return sub_100006650(a1, a2);
}

uint64_t sub_100006C4C(uint64_t a1)
{
  return sub_100006644(v1, 1LL, 1LL, a1);
}

uint64_t sub_100006C60@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_100006C6C()
{
  return type metadata accessor for IntentDialog(0LL);
}

uint64_t sub_100006C88(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100006C98()
{
  return type metadata accessor for LocalizedStringResource(0LL);
}

uint64_t sub_100006CA4(void *a1)
{
  *a1 = v3;
  a1[1] = v1;
  return v2;
}

  ;
}

  ;
}

uint64_t sub_100006CD4(uint64_t a1, uint64_t a2)
{
  return sub_100006698(a1, a2);
}

uint64_t sub_100006CDC(uint64_t a1, uint64_t a2)
{
  return swift_allocError(a1, a2, 0LL, 0LL);
}

uint64_t sub_100006CE8()
{
  return dispatch thunk of Actor.unownedExecutor.getter(v0);
}

uint64_t sub_100006CF4(uint64_t a1)
{
  return static AppIntent.persistentIdentifier.getter(v1, a1);
}

uint64_t sub_100006D00(uint64_t a1)
{
  return sub_100006644(v1, 1LL, 1LL, a1);
}

  ;
}

uint64_t sub_100006D1C(uint64_t a1, uint64_t a2)
{
  return swift_getOpaqueTypeConformance2(a1, a2, 1LL);
}

  ;
}

uint64_t sub_100006D34()
{
  return swift_task_dealloc(v0);
}

uint64_t *sub_100006D3C(uint64_t a1)
{
  return sub_1000066B0(a1, v1);
}

uint64_t sub_100006D48()
{
  return swift_release(*(void *)(v0 + 40));
}

uint64_t sub_100006D50()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100006D58()
{
  return type metadata accessor for InputConnectionBehavior(0LL);
}

uint64_t sub_100006D60()
{
  return type metadata accessor for MainActor(0LL);
}

uint64_t sub_100006D68()
{
  return swift_willThrow();
}

uint64_t sub_100006D70()
{
  return v0;
}

uint64_t sub_100006D7C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

  ;
}

uint64_t sub_100006D90()
{
  return v0;
}

uint64_t sub_100006DA4()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006DAC()
{
  return sub_100006698(v1, v0);
}