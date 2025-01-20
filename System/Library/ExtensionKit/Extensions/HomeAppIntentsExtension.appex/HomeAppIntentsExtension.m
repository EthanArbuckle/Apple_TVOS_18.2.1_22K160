id sub_1000033E4()
{
  id v0;
  id v1;
  v0 = [objc_allocWithZone(HMMutableHomeManagerConfiguration) initWithOptions:1861 cachePolicy:1];
  [v0 setDiscretionary:0];
  [v0 setAdaptive:1];
  v1 = [objc_allocWithZone(HMHomeManager) initWithConfiguration:v0];

  return v1;
}

uint64_t sub_10000346C(uint64_t a1)
{
  unint64_t v2 = sub_100003738();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

uint64_t sub_1000034A4()
{
  return static DataModel.context.setter(4LL);
}

uint64_t sub_1000034EC()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource(0LL);
  sub_100003984(v0, qword_100008380);
  sub_10000396C(v0, (uint64_t)qword_100008380);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000024LL, 0x8000000100003D80LL);
}

uint64_t sub_10000354C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100008070 != -1) {
    swift_once(&qword_100008070, sub_1000034EC);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_10000396C(v2, (uint64_t)qword_100008380);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_1000035D0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000035E8, 0LL, 0LL);
}

uint64_t sub_1000035E8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003624()
{
  uint64_t v0 = qword_100008020;
  swift_bridgeObjectRetain(off_100008028);
  return v0;
}

uint64_t sub_10000365C(uint64_t a1)
{
  unint64_t v2 = sub_100003870();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000036DC()
{
  unint64_t result = qword_100008030;
  if (!qword_100008030)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003C28, &type metadata for HomeAppIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_100008030);
  }

  return result;
}

uint64_t sub_100003724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003830( a1,  a2,  a3,  (uint64_t (*)(void))sub_100003738,  (uint64_t)&opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>);
}

unint64_t sub_100003738()
{
  unint64_t result = qword_100008038;
  if (!qword_100008038)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003C00, &type metadata for HomeAppIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_100008038);
  }

  return result;
}

unint64_t sub_100003780()
{
  unint64_t result = qword_100008040;
  if (!qword_100008040)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003D38, &type metadata for HomeAppIntentsExtensionTestAppIntent);
    atomic_store(result, (unint64_t *)&qword_100008040);
  }

  return result;
}

unint64_t sub_1000037C8()
{
  unint64_t result = qword_100008048;
  if (!qword_100008048)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003D60, &type metadata for HomeAppIntentsExtensionTestAppIntent);
    atomic_store(result, (unint64_t *)&qword_100008048);
  }

  return result;
}

uint64_t sub_10000380C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003E78, 1LL);
}

uint64_t sub_10000381C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100003830( a1,  a2,  a3,  (uint64_t (*)(void))sub_100003870,  (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_100003830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1LL);
}

unint64_t sub_100003870()
{
  unint64_t result = qword_100008050;
  if (!qword_100008050)
  {
    unint64_t result = swift_getWitnessTable(&unk_100003C68, &type metadata for HomeAppIntentsExtensionTestAppIntent);
    atomic_store(result, (unint64_t *)&qword_100008050);
  }

  return result;
}

ValueMetadata *type metadata accessor for HomeAppIntentsExtensionTestAppIntent()
{
  return &type metadata for HomeAppIntentsExtensionTestAppIntent;
}

ValueMetadata *type metadata accessor for HomeAppIntentsExtension()
{
  return &type metadata for HomeAppIntentsExtension;
}

unint64_t sub_1000038DC()
{
  unint64_t result = qword_100008060;
  if (!qword_100008060)
  {
    uint64_t v1 = sub_100003928(&qword_100008068);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_100008060);
  }

  return result;
}

uint64_t sub_100003928(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10000396C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003984(uint64_t a1, uint64_t *a2)
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