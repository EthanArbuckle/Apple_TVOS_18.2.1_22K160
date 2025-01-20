unint64_t sub_100003A14()
{
  unint64_t result;
  result = qword_100010040;
  if (!qword_100010040)
  {
    result = swift_getWitnessTable( &unk_100008930,  &type metadata for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_100010040);
  }

  return result;
}

unint64_t sub_100003A5C()
{
  unint64_t result = qword_100010048;
  if (!qword_100010048)
  {
    unint64_t result = swift_getWitnessTable( &unk_100008990,  &type metadata for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_100010048);
  }

  return result;
}

unint64_t sub_100003AA4()
{
  unint64_t result = qword_100010050[0];
  if (!qword_100010050[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_100008A3C, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, qword_100010050);
  }

  return result;
}

void sub_100003AE8(char a1)
{
  uint64_t v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0LL);
  __chkstk_darwin(v2, v3);
  uint64_t v4 = type metadata accessor for Locale(0LL);
  __chkstk_darwin(v4, v5);
  uint64_t v6 = type metadata accessor for String.LocalizationValue(0LL);
  __chkstk_darwin(v6, v7);
  uint64_t v8 = sub_100006EC4(&qword_100010128);
  __chkstk_darwin(v8, v9);
  uint64_t v10 = sub_100006EC4(&qword_100010130);
  __chkstk_darwin(v10, v11);
  uint64_t v12 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  __chkstk_darwin(v14, v15);
  __asm { BR              X10 }
}

uint64_t sub_100003C90()
{
  uint64_t v10 = ((uint64_t (*)(void))type metadata accessor for DisplayRepresentation.Image)(0LL);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v0, 0LL, 1LL, v10);
  uint64_t v11 = ((uint64_t (*)(unint64_t, unint64_t))String.LocalizationValue.init(stringLiteral:))( 0xD000000000000067LL,  0x800000010000AD40LL);
  ((void (*)(uint64_t))static Locale.current.getter)(v11);
  (*(void (**)(uint64_t, void, void))(*(void *)(v9 - 128) + 104LL))( v4,  enum case for LocalizedStringResource.BundleDescription.main(_:),  *(void *)(v9 - 120));
  ((void (*)(uint64_t, void, void, uint64_t, uint64_t, const char *, uint64_t, uint64_t))LocalizedStringResource.init(_:table:locale:bundle:comment:))( v6,  0LL,  0LL,  v5,  v4,  "Description text for the root Keyboard Settings pane",  52LL,  2LL);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, uint64_t))DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:))( v3,  v1,  v0,  &_swiftEmptyArrayStorage,  v2);
}

uint64_t sub_100005424()
{
  uint64_t v1 = (char *)&v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TypeDisplayRepresentation(0LL);
  sub_100006F1C(v6, qword_100010218);
  sub_100006F04(v6, (uint64_t)qword_100010218);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001BLL, 0x800000010000ADF0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1LL, 1LL, v2);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v5, v1);
}

uint64_t sub_100005538(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100010178 + dword_100010178);
  uint64_t v3 = (void *)swift_task_alloc(unk_10001017C);
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005598;
  return v5(a1);
}

uint64_t sub_100005598(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t v5 = *v2;
  uint64_t v6 = swift_task_dealloc(v4);
  if (!v1) {
    uint64_t v6 = a1;
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_1000055EC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010170 + dword_100010170);
  uint64_t v2 = (void *)swift_task_alloc(unk_100010174);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100006FB8;
  return v4();
}

unint64_t sub_10000564C()
{
  unint64_t result = qword_100010068;
  if (!qword_100010068)
  {
    unint64_t result = swift_getWitnessTable( &unk_1000088A0,  &type metadata for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_100010068);
  }

  return result;
}

uint64_t sub_100005690(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010160 + dword_100010160);
  uint64_t v2 = (void *)swift_task_alloc(unk_100010164);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000056EC;
  return v4();
}

uint64_t sub_1000056EC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 24);
  uint64_t v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_100005750()
{
  unint64_t result = qword_100010078;
  if (!qword_100010078)
  {
    unint64_t result = swift_getWitnessTable( &unk_1000089B8,  &type metadata for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery);
    atomic_store(result, (unint64_t *)&qword_100010078);
  }

  return result;
}

unint64_t sub_100005798()
{
  unint64_t result = qword_100010080;
  if (!qword_100010080)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008BAC, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_100010080);
  }

  return result;
}

unint64_t sub_1000057E0()
{
  unint64_t result = qword_100010088;
  if (!qword_100010088)
  {
    uint64_t v1 = sub_100005844(qword_100010090);
    sub_100005798();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010088);
  }

  return result;
}

uint64_t sub_100005844(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005888(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000564C();
  *uint64_t v5 = v2;
  v5[1] = sub_1000058F4;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000058F4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000593C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010150 + dword_100010150);
  uint64_t v2 = (void *)swift_task_alloc(unk_100010154);
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005998;
  return v4();
}

uint64_t sub_100005998(char a1)
{
  uint64_t v3 = *(_BYTE **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 24));
  *uint64_t v3 = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

unint64_t sub_1000059F4()
{
  unint64_t result = qword_1000100A8;
  if (!qword_1000100A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008A94, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100A8);
  }

  return result;
}

uint64_t sub_100005A38(uint64_t a1)
{
  uint64_t v2 = sub_100006EC4(&qword_100010140);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100006EC4(&qword_100010148);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v9 = sub_100003AA4();
  EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)(57LL, 1LL, a1, v9);
  v10._object = (void *)0x800000010000AE10LL;
  v10._countAndFlagsBits = 0xD000000000000039LL;
  EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(v10);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:),  v2);
  EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)(v5, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11._countAndFlagsBits = 0LL;
  v11._object = (void *)0xE000000000000000LL;
  EntityURLRepresentation.StringInterpolation.appendLiteral(_:)(v11);
  return EntityURLRepresentation.init(stringInterpolation:)(v8, a1, v9);
}

uint64_t sub_100005B88()
{
  uint64_t v0 = qword_100010010;
  swift_bridgeObjectRetain(off_100010018);
  return v0;
}

unint64_t sub_100005BC0()
{
  unint64_t result = qword_1000100B0;
  if (!qword_1000100B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008ABC, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100B0);
  }

  return result;
}

unint64_t sub_100005C08()
{
  unint64_t result = qword_1000100B8;
  if (!qword_1000100B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008AF4, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100B8);
  }

  return result;
}

unint64_t sub_100005C50()
{
  unint64_t result = qword_1000100C0;
  if (!qword_1000100C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008B24, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100C0);
  }

  return result;
}

unint64_t sub_100005C98()
{
  unint64_t result = qword_1000100C8;
  if (!qword_1000100C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008D34, &type metadata for KeyboardSettingsDestination);
    atomic_store(result, (unint64_t *)&qword_1000100C8);
  }

  return result;
}

uint64_t sub_100005CDC(uint64_t a1)
{
  unint64_t v3 = sub_100006F5C();
  uint64_t v4 = URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100006FA0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100005D28()
{
  unint64_t result = qword_1000100D8;
  if (!qword_1000100D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008B5C, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100D8);
  }

  return result;
}

unint64_t sub_100005D70()
{
  unint64_t result = qword_1000100E0;
  if (!qword_1000100E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008B84, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100E0);
  }

  return result;
}

unint64_t sub_100005DB8()
{
  unint64_t result = qword_1000100E8;
  if (!qword_1000100E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008C04, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000100E8);
  }

  return result;
}

unint64_t sub_100005E00()
{
  unint64_t result = qword_1000100F0;
  if (!qword_1000100F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008C84, &type metadata for KeyboardSettingsDestination);
    atomic_store(result, (unint64_t *)&qword_1000100F0);
  }

  return result;
}

void sub_100005E44(_BYTE *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005E50@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010020 != -1) {
    swift_once(&qword_100010020, sub_100005424);
  }
  uint64_t v2 = type metadata accessor for TypeDisplayRepresentation(0LL);
  uint64_t v3 = sub_100006F04(v2, (uint64_t)qword_100010218);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_100005EC0()
{
  return sub_10000645C( &qword_1000100F8,  &qword_100010100,  (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100005EEC(uint64_t a1)
{
  unint64_t v2 = sub_100003AA4();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100005F28()
{
  unint64_t result = qword_100010108;
  if (!qword_100010108)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008C34, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_100010108);
  }

  return result;
}

void sub_100005F6C()
{
}

uint64_t sub_100005F74(uint64_t a1)
{
  unint64_t v2 = sub_100005DB8();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100005FAC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100005FD4 + 4 * byte_10000887E[a1]))( 47LL,  0xE100000000000000LL);
}

uint64_t sub_100005FD4()
{
  return 0x52414F4259454B2FLL;
}

unint64_t sub_100005FF0()
{
  return 0xD000000000000011LL;
}

uint64_t sub_100006210(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = sub_100005FAC(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = sub_100005FAC(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

unint64_t sub_10000629C()
{
  unint64_t result = qword_100010110;
  if (!qword_100010110)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008C5C, &type metadata for KeyboardSettingsDestination);
    atomic_store(result, (unint64_t *)&qword_100010110);
  }

  return result;
}

Swift::Int sub_1000062E0()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = sub_100005FAC(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100006340(uint64_t a1)
{
  uint64_t v3 = sub_100005FAC(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100006380(uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = sub_100005FAC(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_1000063DC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_100006E74(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_100006408@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100005FAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006430()
{
  return sub_10000645C(&qword_100010118, &qword_100010120, (uint64_t)&protocol conformance descriptor for [A]);
}

uint64_t sub_10000645C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_100005844(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

void sub_10000649C(void *a1@<X8>)
{
  *a1 = &off_10000C4C0;
}

uint64_t sub_1000064AC()
{
  return sub_100005FAC(*v0);
}

uint64_t sub_1000064B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100006E74(a1, a2);
  *a3 = result;
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for KeyboardSettingsDestination(_BYTE *result, _BYTE *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100006510(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006518(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KeyboardSettingsDestination()
{
  return &type metadata for KeyboardSettingsDestination;
}

uint64_t _s25KeyboardSettingsExtension27KeyboardSettingsDestinationOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xEA) {
    goto LABEL_17;
  }
  if (a2 + 22 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 22) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 22;
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
      return (*a1 | (v4 << 8)) - 22;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 22;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x17;
  int v8 = v6 - 23;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t _s25KeyboardSettingsExtension27KeyboardSettingsDestinationOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE9) {
    return ((uint64_t (*)(void))((char *)&loc_10000660C + 4 * byte_10000889A[v4]))();
  }
  *a1 = a2 + 22;
  return ((uint64_t (*)(void))((char *)sub_100006640 + 4 * byte_100008895[v4]))();
}

uint64_t sub_100006640(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006648(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100006650LL);
  }
  return result;
}

uint64_t sub_10000665C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100006664LL);
  }
  *(_BYTE *)uint64_t result = a2 + 22;
  return result;
}

uint64_t sub_100006668(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006670(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for KeyboardSettingsDeepLink()
{
  return &type metadata for KeyboardSettingsDeepLink;
}

ValueMetadata *type metadata accessor for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery()
{
  return &type metadata for KeyboardSettingsDeepLink.AvailableKeyboardDestinationQuery;
}

char *sub_10000669C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000066D4(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1000066B8(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000067BC(a1, a2, a3, *v3);
  *int v3 = result;
  return result;
}

char *sub_1000066D4(char *result, int64_t a2, char a3, char *a4)
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

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100006EC4(&qword_100010168);
    Swift::String v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    Swift::String v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, v8);
  }

  swift_release(a4);
  return v11;
}

char *sub_1000067BC(char *result, int64_t a2, char a3, char *a4)
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

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100006EC4(&qword_100010158);
    Swift::String v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    Swift::String v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, v8);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_1000068A4()
{
  return swift_task_switch(sub_1000068B8, 0LL, 0LL);
}

uint64_t sub_1000068B8()
{
  __int16 v1 = sub_1000069C8((uint64_t)&off_10000C4C0);
  int v2 = v1;
  int64_t v3 = v1[2];
  if (v3)
  {
    sub_10000669C(0LL, v3, 0);
    uint64_t v4 = 0LL;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *((_BYTE *)v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_10000669C((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((_BYTE *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }

    while (v3 != v4);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    swift_bridgeObjectRelease(v1);
  }

  return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
}

void *sub_1000069C8(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    __asm { BR              X8 }
  }

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100006BE0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return swift_task_switch(sub_100006BF8, 0LL, 0LL);
}

uint64_t sub_100006BF8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_bridgeObjectRetain(v1);
  int64_t v3 = sub_1000069C8(v2);
  swift_bridgeObjectRelease(v1);
  int64_t v4 = v3[2];
  if (v4)
  {
    sub_10000669C(0LL, v4, 0);
    uint64_t v5 = 0LL;
    uint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v7 = *((_BYTE *)v3 + v5 + 32);
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v6 + v5 >= v8 >> 1) {
        sub_10000669C((char *)(v8 > 1), v6 + v5 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v6 + v5 + 1;
      *((_BYTE *)&_swiftEmptyArrayStorage + v6 + v5++ + 32) = v7;
    }

    while (v4 != v5);
  }

  swift_bridgeObjectRelease(v3);
  return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
}

uint64_t sub_100006D14()
{
  return swift_task_switch(sub_100006D28, 0LL, 0LL);
}

uint64_t sub_100006D28()
{
  uint64_t v1 = sub_1000069C8((uint64_t)&off_10000C4C0);
  if (v1[2]) {
    uint64_t v2 = *((unsigned __int8 *)v1 + 32);
  }
  else {
    uint64_t v2 = 23LL;
  }
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_100006D84()
{
  return swift_task_switch(sub_100006D98, 0LL, 0LL);
}

uint64_t sub_100006D98()
{
  uint64_t v1 = 0LL;
  uint64_t v2 = &_swiftEmptyArrayStorage;
  uint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  do
  {
    char v4 = *((_BYTE *)&off_10000C4C0 + v1 + 32);
    char v7 = v2;
    unint64_t v5 = v2[3];
    if (v3 + v1 >= v5 >> 1)
    {
      sub_10000669C((char *)(v5 > 1), v3 + v1 + 1, 1);
      uint64_t v2 = v7;
    }

    v2[2] = v3 + v1 + 1;
    *((_BYTE *)v2 + v3 + v1++ + 32) = v4;
  }

  while (v1 != 23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006E74(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_10000C4F8, a1, a2, &unk_100010030);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x17) {
    return 23LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_100006EC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100006F04(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006F1C(uint64_t a1, uint64_t *a2)
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

unint64_t sub_100006F5C()
{
  unint64_t result = qword_100010138;
  if (!qword_100010138)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000089D4, &type metadata for KeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_100010138);
  }

  return result;
}

uint64_t sub_100006FA0(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100006FBC(uint64_t a1)
{
  unint64_t v2 = sub_1000070D4();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000704C()
{
  unint64_t result = qword_100010180;
  if (!qword_100010180)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008E28, &type metadata for KeyboardSettingsExtensionExtension);
    atomic_store(result, (unint64_t *)&qword_100010180);
  }

  return result;
}

uint64_t sub_100007094(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_1000070D4();
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>,  1LL);
}

unint64_t sub_1000070D4()
{
  unint64_t result = qword_100010188;
  if (!qword_100010188)
  {
    unint64_t result = swift_getWitnessTable("9=", &type metadata for KeyboardSettingsExtensionExtension);
    atomic_store(result, (unint64_t *)&qword_100010188);
  }

  return result;
}

ValueMetadata *type metadata accessor for KeyboardSettingsExtensionExtension()
{
  return &type metadata for KeyboardSettingsExtensionExtension;
}

uint64_t sub_100007128()
{
  uint64_t v0 = sub_100006EC4(&qword_1000101B8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_100006EC4(&qword_1000101C0);
  __chkstk_darwin(v5, v6);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v9 = sub_100007A88();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)( 5LL,  1LL,  &type metadata for OpenKeyboardSettingsDeepLink,  v9);
  v10._countAndFlagsBits = 0x206E65704FLL;
  v10._object = (void *)0xE500000000000000LL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v10);
  uint64_t KeyPath = swift_getKeyPath(&unk_100008F78);
  unint64_t v12 = sub_100005798();
  uint64_t v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v12);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v5);
  swift_release(v13);
  v14._countAndFlagsBits = 0LL;
  v14._object = (void *)0xE000000000000000LL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for OpenKeyboardSettingsDeepLink, v9);
  uint64_t v15 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)( v4,  &type metadata for OpenKeyboardSettingsDeepLink,  v9);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v16 = sub_100006EC4(&qword_1000101C8);
  uint64_t v17 = swift_allocObject(v16, 40LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_100008EC0;
  *(void *)(v17 + 32) = v15;
  uint64_t v18 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v17);
  return v18;
}

uint64_t sub_1000072FC()
{
  uint64_t v0 = type metadata accessor for _AssistantIntent.Value(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t KeyPath = swift_getKeyPath(&unk_100008F78);
  unint64_t v6 = sub_100005798();
  uint64_t v7 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v6);
  swift_release(KeyPath);
  unint64_t v8 = sub_100007A88();
  _AssistantIntent.Value.init<A>(for:builder:)(v7, sub_10000740C, 0LL, v8);
  uint64_t v9 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v10 = sub_100006EC4(&qword_1000101B0);
  uint64_t v11 = swift_allocObject(v10, 40LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_100008EC0;
  *(void *)(v11 + 32) = v9;
  uint64_t v12 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v11);
  return v12;
}

uint64_t sub_10000740C()
{
  uint64_t v26 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011LL, 0x800000010000AE90LL);
  uint64_t v25 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000013LL, 0x800000010000AEB0LL);
  uint64_t v24 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000019LL, 0x800000010000AED0LL);
  uint64_t v23 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001BLL, 0x800000010000AEF0LL);
  uint64_t v22 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000017LL, 0x800000010000AF10LL);
  uint64_t v21 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011LL, 0x800000010000AF30LL);
  uint64_t v20 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000019LL, 0x800000010000AF50LL);
  uint64_t v19 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001BLL, 0x800000010000AF70LL);
  uint64_t v18 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000015LL, 0x800000010000AF90LL);
  uint64_t v17 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000019LL, 0x800000010000AFB0LL);
  uint64_t v16 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000017LL, 0x800000010000AFD0LL);
  uint64_t v15 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011LL, 0x800000010000AFF0LL);
  uint64_t v14 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000018LL, 0x800000010000B010LL);
  uint64_t v13 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001CLL, 0x800000010000B030LL);
  uint64_t v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000017LL, 0x800000010000B050LL);
  uint64_t v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001FLL, 0x800000010000B070LL);
  uint64_t v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000016LL, 0x800000010000B090LL);
  uint64_t v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000024LL, 0x800000010000B0B0LL);
  uint64_t v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000010LL, 0x800000010000B0E0LL);
  uint64_t v5 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001DLL, 0x800000010000B100LL);
  uint64_t v6 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000014LL, 0x800000010000B120LL);
  uint64_t v7 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000018LL, 0x800000010000B140LL);
  uint64_t v8 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001ALL, 0x800000010000B160LL);
  uint64_t v9 = sub_100006EC4(&qword_1000101A0);
  uint64_t v10 = swift_allocObject(v9, 216LL, 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_100008ED0;
  *(void *)(v10 + 32) = v26;
  *(void *)(v10 + 4sub_10000669C(0LL, 23LL, 0) = v25;
  *(void *)(v10 + 48) = v24;
  *(void *)(v10 + 56) = v23;
  *(void *)(v10 + 64) = v22;
  *(void *)(v10 + 72) = v21;
  *(void *)(v10 + 8sub_10000669C(0LL, 23LL, 0) = v20;
  *(void *)(v10 + 88) = v19;
  *(void *)(v10 + 96) = v18;
  *(void *)(v10 + 104) = v17;
  *(void *)(v10 + 112) = v16;
  *(void *)(v10 + 12sub_10000669C(0LL, 23LL, 0) = v15;
  *(void *)(v10 + 128) = v14;
  *(void *)(v10 + 136) = v13;
  *(void *)(v10 + 144) = v0;
  *(void *)(v10 + 152) = v1;
  *(void *)(v10 + 16sub_10000669C(0LL, 23LL, 0) = v2;
  *(void *)(v10 + 168) = v3;
  *(void *)(v10 + 176) = v4;
  *(void *)(v10 + 184) = v5;
  *(void *)(v10 + 192) = v6;
  *(void *)(v10 + 20sub_10000669C(0LL, 23LL, 0) = v7;
  *(void *)(v10 + 208) = v8;
  uint64_t v11 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_10000779C()
{
  uint64_t v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000010LL, 0x800000010000AE50LL);
  uint64_t v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011LL, 0x800000010000AE70LL);
  uint64_t v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7053206B63656843LL, 0xEE00676E696C6C65LL);
  uint64_t v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6944206E69676542LL, 0xEF6E6F6974617463LL);
  uint64_t v4 = sub_100006EC4(&qword_1000101A0);
  uint64_t v5 = swift_allocObject(v4, 64LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_100008EE0;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 4sub_10000669C(0LL, 23LL, 0) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  uint64_t v6 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10000789C()
{
  uint64_t v0 = type metadata accessor for _AssistantIntent(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_100008148();
  unint64_t v5 = sub_100007A88();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)( &v12,  sub_100007128,  0LL,  sub_1000072FC,  0LL,  &type metadata for OpenKeyboardSettingsDeepLink,  v5);
  uint64_t v6 = static _AssistantIntent.Builder.buildExpression(_:)(v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v7 = sub_100006EC4(&qword_1000101A8);
  uint64_t v8 = swift_allocObject(v7, 40LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_100008EC0;
  *(void *)(v8 + 32) = v6;
  uint64_t v9 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v8);
  return v9;
}

uint64_t sub_100007998()
{
  uint64_t v0 = type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v5 = sub_100007A88();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)( &type metadata for OpenKeyboardSettingsDeepLink,  sub_10000779C,  0LL,  &type metadata for OpenKeyboardSettingsDeepLink,  v5);
  uint64_t v6 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v4);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v7 = sub_100006EC4(&qword_100010198);
  uint64_t v8 = swift_allocObject(v7, 40LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_100008EC0;
  *(void *)(v8 + 32) = v6;
  uint64_t v9 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v8);
  return v9;
}

ValueMetadata *type metadata accessor for KeyboardSettingsAssistantIntents()
{
  return &type metadata for KeyboardSettingsAssistantIntents;
}

unint64_t sub_100007A88()
{
  unint64_t result = qword_100010190;
  if (!qword_100010190)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009098, &type metadata for OpenKeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_100010190);
  }

  return result;
}

void *sub_100007ACC@<X0>(_BYTE *a1@<X8>)
{
  unint64_t result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100007B04(char *a1)
{
  char v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_100007B3C()
{
  unint64_t result = qword_1000101D0;
  if (!qword_1000101D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009070, &type metadata for OpenKeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000101D0);
  }

  return result;
}

uint64_t sub_100007B80()
{
  return v1;
}

uint64_t sub_100007BB0()
{
  uint64_t v0 = type metadata accessor for LocalizedStringResource(0LL);
  sub_100006F1C(v0, qword_100010230);
  sub_100006F04(v0, (uint64_t)qword_100010230);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000016LL, 0x800000010000B180LL);
}

void *sub_100007C10@<X0>(_BYTE *a1@<X8>)
{
  unint64_t result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100007C48(char *a1)
{
  char v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_100007C7C(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100007CC4;
}

void sub_100007CC4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32LL))(*a1, 0LL);
  free(v1);
}

uint64_t sub_100007CF8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100008354();
  unint64_t v5 = sub_100006F5C();
  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100007D5C()
{
  unint64_t result = qword_1000101D8;
  if (!qword_1000101D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009128, &type metadata for OpenKeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000101D8);
  }

  return result;
}

unint64_t sub_100007DA4()
{
  unint64_t result = qword_1000101E0;
  if (!qword_1000101E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009150, &type metadata for OpenKeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_1000101E0);
  }

  return result;
}

unint64_t sub_100007DEC()
{
  unint64_t result = qword_1000101E8;
  if (!qword_1000101E8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_1000101E8);
  }

  return result;
}

uint64_t sub_100007E30(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100007A88();
  return swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>,  1LL);
}

uint64_t sub_100007E70@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010028 != -1) {
    swift_once(&qword_100010028, sub_100007BB0);
  }
  uint64_t v2 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v3 = sub_100006F04(v2, (uint64_t)qword_100010230);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_100007EE0()
{
  return 0LL;
}

uint64_t sub_100007EEC()
{
  return 1LL;
}

uint64_t sub_100007EF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100006EC4(&qword_100010130);
  __chkstk_darwin(v2, v3);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000016LL, 0x800000010000B180LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1LL, 1LL, v6);
  IntentDescription.init(_:categoryName:searchKeywords:)(v10, v5, _swiftEmptyArrayStorage);
  uint64_t v11 = type metadata accessor for IntentDescription(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(a1, 0LL, 1LL, v11);
}

uint64_t sub_10000800C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to URLRepresentableIntent<>.perform()[1]);
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100008354();
  unint64_t v6 = sub_100008398();
  unint64_t v7 = sub_100006F5C();
  *uint64_t v4 = v2;
  v4[1] = sub_100008090;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_100008090()
{
  uint64_t v2 = *(void *)(*v1 + 16);
  uint64_t v3 = *v1;
  uint64_t result = swift_task_dealloc(v2);
  if (v0) {
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  return result;
}

uint64_t sub_1000080EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100008148();
  *a1 = result;
  return result;
}

uint64_t sub_100008110(uint64_t a1)
{
  unint64_t v2 = sub_100007A88();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenKeyboardSettingsDeepLink()
{
  return &type metadata for OpenKeyboardSettingsDeepLink;
}

uint64_t sub_100008148()
{
  uint64_t v0 = type metadata accessor for InputConnectionBehavior(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = &v26[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v5 = sub_100006EC4(&qword_1000101F8);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v9 = &v26[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v7, v10);
  uint64_t v12 = &v26[-v11];
  uint64_t v13 = sub_100006EC4(&qword_100010130);
  __chkstk_darwin(v13, v14);
  uint64_t v16 = &v26[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v17 = type metadata accessor for LocalizedStringResource(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = &v26[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  sub_100006EC4(&qword_100010200);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011LL, 0x800000010000AE90LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1LL, 1LL, v17);
  char v27 = 23;
  uint64_t v22 = type metadata accessor for IntentDialog(0LL);
  uint64_t v23 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56LL);
  v23(v12, 1LL, 1LL, v22);
  v23(v9, 1LL, 1LL, v22);
  (*(void (**)(_BYTE *, void, uint64_t))(v1 + 104))( v4,  enum case for InputConnectionBehavior.default(_:),  v0);
  unint64_t v24 = sub_100003AA4();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)( v21,  v16,  &v27,  v12,  v9,  v4,  v24);
}

unint64_t sub_100008354()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable(&unk_100008FB0, &type metadata for OpenKeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_100010208);
  }

  return result;
}

unint64_t sub_100008398()
{
  unint64_t result = qword_100010210;
  if (!qword_100010210)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009000, &type metadata for OpenKeyboardSettingsDeepLink);
    atomic_store(result, (unint64_t *)&qword_100010210);
  }

  return result;
}