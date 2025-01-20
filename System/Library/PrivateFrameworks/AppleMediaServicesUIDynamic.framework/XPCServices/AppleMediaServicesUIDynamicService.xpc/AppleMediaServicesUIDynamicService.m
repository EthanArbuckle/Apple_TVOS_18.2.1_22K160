uint64_t deviceIsRunningInternalBuild()
{
  return os_variant_has_internal_content("com.apple.AppleMediaServicesUIDynamic");
}

uint64_t deviceIsRunningSeedBuild()
{
  return 0LL;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for ServiceStartupTask();
  uint64_t v4 = swift_allocObject(v3, 16LL, 7LL);
  sub_1000390D4();
  swift_release(v4);
  return 0;
}

id variable initialization expression of AccountsWrapper.accessLock()
{
  return [objc_allocWithZone(NSLock) init];
}

uint64_t sub_100005040()
{
  return sub_1000053C8(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005060(uint64_t a1)
{
  return sub_1000051A4(a1, *v1);
}

Swift::Int sub_100005068(uint64_t a1)
{
  return sub_100009C9C(a1, *v1);
}

uint64_t sub_100005070()
{
  return sub_1000053C8(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100005098@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  NSString result = sub_100005394(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000050BC(uint64_t *a1, uint64_t *a2)
{
  return sub_100009D08(*a1, *a2);
}

uint64_t sub_1000050C8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10000510C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005138(uint64_t a1)
{
  uint64_t v2 = sub_100005240((unint64_t *)&qword_100050240, (uint64_t)&unk_10003B988);
  uint64_t v3 = sub_100005240(&qword_100050248, (uint64_t)&unk_10003B8DC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000051A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_1000051F8()
{
  return sub_100005240(&qword_100050228, (uint64_t)&unk_10003B8A0);
}

uint64_t sub_10000521C()
{
  return sub_100005240(&qword_100050230, (uint64_t)&unk_10003B874);
}

uint64_t sub_100005240(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100005280()
{
  return sub_100005240(&qword_100050238, (uint64_t)&unk_10003B910);
}

uint64_t sub_1000052A4(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_100005318(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

NSString sub_100005394(uint64_t a1)
{
  uint64_t v2 = v1;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

uint64_t sub_1000053C8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = a2(v3);
  swift_bridgeObjectRelease(v5);
  return v6;
}

void type metadata accessor for AMSMediaTaskType(uint64_t a1)
{
}

void sub_100005414(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t _s34AppleMediaServicesUIDynamicService20DynamicAccountsStoreC8_account33_1170E4F383B7D8D94FF5572A95601FACLLSo9ACAccountCSgvpfi_0()
{
  return 0LL;
}

id sub_100005464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  NSString v8 = a7;
  if (!a5)
  {
    NSString v10 = 0LL;
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  NSString v10 = String._bridgeToObjectiveC()();
  if (v8) {
LABEL_3:
  }
    NSString v8 = String._bridgeToObjectiveC()();
LABEL_4:
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = objc_msgSend(v7, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v10, a3, v8, v11);

  return v12;
}

uint64_t sub_10000552C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100005870();
  uint64_t v7 = v6;

  if (!v7) {
    return 0LL;
  }
  NSString v8 = (void *)sub_100005860();
  char v9 = JSValue.BOOL.getter();

  if (v9 == 2)
  {
    sub_100005868();
    return 0LL;
  }

  char v11 = v9 & 1;
  BOOL v12 = v5 == 0x73656E755469LL && v7 == 0xE600000000000000LL;
  if (v12 || (sub_100005850(0x73656E755469LL, 0xE600000000000000LL) & 1) != 0) {
    goto LABEL_17;
  }
  BOOL v13 = v5 == 0x64756F6C4369LL && v7 == 0xE600000000000000LL;
  if (v13 || (sub_100005850(0x64756F6C4369LL, 0xE600000000000000LL) & 1) != 0)
  {
    char v11 = 2;
LABEL_17:
    sub_100005868();
    goto LABEL_18;
  }

  if (v5 == 1936548969 && v7 == 0xE400000000000000LL)
  {
    char v11 = 3;
    goto LABEL_17;
  }

  char v28 = sub_100005850(1936548969LL, 0xE400000000000000LL);
  sub_100005868();
  if ((v28 & 1) == 0) {
    return 0LL;
  }
  char v11 = 3;
LABEL_18:
  id v14 = [objc_allocWithZone(NSNumberFormatter) init];
  v15 = (void *)sub_100005860();
  sub_100005870();
  v17 = v16;

  char v18 = v11;
  if (v17)
  {
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    id v20 = [v14 numberFromString:v19];
  }

  else
  {
    id v20 = 0LL;
  }

  sub_100005860();
  sub_100005870();
  uint64_t v22 = v21;

  sub_100005860();
  sub_100005870();
  uint64_t v24 = v23;

  uint64_t v25 = sub_10000580C(v18);
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(a3 + 16))(v25);

  sub_100005868();
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v24);
  return v26;
}

id sub_1000057EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  return sub_100005464(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_10000580C(char a1)
{
  uint64_t v1 = &ACAccountTypeIdentifierIDMS;
  uint64_t v2 = &ACAccountTypeIdentifieriTunesStoreSandbox;
  if ((a1 & 1) == 0) {
    uint64_t v2 = &ACAccountTypeIdentifieriTunesStore;
  }
  if (a1 != 3) {
    uint64_t v1 = v2;
  }
  if (a1 == 2) {
    uint64_t v3 = &ACAccountTypeIdentifierAppleAccount;
  }
  else {
    uint64_t v3 = v1;
  }
  return static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
}

uint64_t sub_100005850(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0LL);
}

uint64_t sub_100005860()
{
  return JSValue.subscript.getter();
}

uint64_t sub_100005868()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100005870()
{
  return JSValue.string.getter();
}

uint64_t sub_100005878()
{
  return sub_100005BFC(v0, (SEL *)&selRef_username);
}

id sub_100005898()
{
  return objc_msgSend(v0, "ams_isiTunesAccount");
}

id sub_1000058B8()
{
  return objc_msgSend(v0, "ams_isiCloudAccount");
}

id sub_1000058D8()
{
  return objc_msgSend(v0, "ams_isIDMSAccount");
}

uint64_t sub_1000058F8()
{
  return sub_100005BFC(v0, (SEL *)&selRef_ams_altDSID);
}

uint64_t sub_100005918()
{
  return sub_100005BFC(v0, (SEL *)&selRef_ams_creditsString);
}

id sub_100005938()
{
  return objc_msgSend(v0, "ams_DSID");
}

uint64_t sub_10000595C()
{
  return sub_100005BFC(v0, (SEL *)&selRef_ams_firstName);
}

uint64_t sub_10000597C()
{
  return sub_100005BFC(v0, (SEL *)&selRef_ams_lastName);
}

uint64_t sub_10000599C()
{
  return sub_100005BFC(v0, (SEL *)&selRef_ams_storefront);
}

id sub_1000059BC()
{
  return objc_msgSend(v0, "ams_isLocalAccount");
}

id sub_1000059DC()
{
  return objc_msgSend(v0, "ams_isSandboxAccount");
}

uint64_t sub_1000059FC()
{
  return sub_100005C58(v0);
}

unint64_t sub_100005A04()
{
  return (unint64_t)sub_100005898() & 1;
}

unint64_t sub_100005A28()
{
  return (unint64_t)sub_1000058B8() & 1;
}

unint64_t sub_100005A4C()
{
  return (unint64_t)sub_1000058D8() & 1;
}

unint64_t sub_100005A70()
{
  return (unint64_t)sub_100005A94() & 1;
}

id sub_100005A94()
{
  return [v0 isActive];
}

uint64_t sub_100005AB4()
{
  return sub_1000058F8();
}

uint64_t sub_100005AD4()
{
  return sub_100005918();
}

id sub_100005AF4()
{
  return sub_100005938();
}

uint64_t sub_100005B14()
{
  return sub_10000595C();
}

uint64_t sub_100005B34()
{
  return sub_10000597C();
}

uint64_t sub_100005B54()
{
  return sub_10000599C();
}

uint64_t sub_100005B74()
{
  return sub_100005878();
}

uint64_t sub_100005B94()
{
  return sub_1000059FC();
}

unint64_t sub_100005BB4()
{
  return (unint64_t)sub_1000059BC() & 1;
}

unint64_t sub_100005BD8()
{
  return (unint64_t)sub_1000059DC() & 1;
}

uint64_t sub_100005BFC(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

uint64_t sub_100005C58(void *a1)
{
  id v1 = objc_msgSend(a1, "ams_privacyAcknowledgement");
  if (!v1) {
    return 0LL;
  }
  id v2 = v1;
  unint64_t v3 = sub_100005CC4();
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for String,  v3,  &protocol witness table for String);

  return v4;
}

unint64_t sub_100005CC4()
{
  unint64_t result = qword_100050258;
  if (!qword_100050258)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100050258);
  }

  return result;
}

void *sub_100005D00(void *a1)
{
  id v2 = (void *)JSValue.subscript.getter(0x6449656C646E7562LL, 0xE900000000000073LL);
  uint64_t v3 = sub_1000065D4(v2);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_100005DBC(v3);
    swift_bridgeObjectRelease(v4);
  }

  uint64_t v5 = (void *)JSValue.subscript.getter(0x73644965726F7473LL, 0xE800000000000000LL);
  uint64_t v6 = sub_1000065D4(v5);
  if (v6)
  {
    uint64_t v7 = v6;
    NSString v8 = sub_100005F00(v6);
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    NSString v8 = 0LL;
  }

  return v8;
}

void *sub_100005DBC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  id v14 = &_swiftEmptyArrayStorage;
  sub_100006194(0LL, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_100006638(i, (uint64_t)v13);
      if (!swift_dynamicCast( &v11,  v13,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL)) {
        break;
      }
      uint64_t v5 = v11;
      uint64_t v6 = v12;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100006194(0LL, v3[2] + 1LL, 1);
        uint64_t v3 = v14;
      }

      unint64_t v8 = v3[2];
      unint64_t v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_100006194((char *)(v7 > 1), v8 + 1, 1);
        uint64_t v3 = v14;
      }

      v3[2] = v8 + 1;
      char v9 = (char *)&v3[2 * v8];
      *((void *)v9 + 4) = v5;
      *((void *)v9 + 5) = v6;
      if (!--v2) {
        return v3;
      }
    }

    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    swift_release(v3);
    swift_bridgeObjectRelease(v12);
    return 0LL;
  }

  return v3;
}

void *sub_100005F00(uint64_t a1)
{
  uint64_t v11 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  specialized ContiguousArray.reserveCapacity(_:)(v2);
  if (!v2) {
    return v11;
  }
  for (uint64_t i = a1 + 32; ; i += 32LL)
  {
    sub_100006638(i, (uint64_t)v10);
    unint64_t v4 = sub_100005CC4();
    id v5 = v9;
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v6 = v11[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
    uint64_t v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v5);
    specialized ContiguousArray._endMutation()(v7);
    if (!--v2) {
      return v11;
    }
  }

  id v9 = 0LL;
  swift_release(v11);

  return 0LL;
}

void *sub_100005FF8(uint64_t a1)
{
  return sub_100006020(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_1000061CC, &qword_100050270);
}

void *sub_10000600C(uint64_t a1)
{
  return sub_100006020(a1, (void (*)(BOOL, uint64_t, uint64_t))sub_1000061F8, &qword_100050280);
}

void *sub_100006020(uint64_t a1, void (*a2)(BOOL, uint64_t, uint64_t), uint64_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  v16 = &_swiftEmptyArrayStorage;
  a2(0, v6, 0LL);
  uint64_t v7 = &_swiftEmptyArrayStorage;
  if (v6)
  {
    for (uint64_t i = a1 + 32; ; i += 32LL)
    {
      sub_100006638(i, (uint64_t)v15);
      uint64_t v9 = sub_100006674(a3);
      uint64_t v10 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0)
      {
        a2(0, v7[2] + 1LL, 1LL);
        uint64_t v7 = v16;
      }

      unint64_t v12 = v7[2];
      unint64_t v11 = v7[3];
      if (v12 >= v11 >> 1)
      {
        a2(v11 > 1, v12 + 1, 1LL);
        uint64_t v7 = v16;
      }

      v7[2] = v12 + 1;
      v7[v12 + 4] = v10;
      if (!--v6) {
        return v7;
      }
    }

    uint64_t v14 = 0LL;
    swift_release(v7);
    swift_bridgeObjectRelease(v14);
    return 0LL;
  }

  return v7;
}

void *sub_10000616C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t result = sub_100005D00(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }

  return result;
}

char *sub_100006194(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100006224(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1000061B0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100006320(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_1000061CC(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000642C(a1, a2, a3, *v3, &qword_100050278, &qword_100050270);
  *uint64_t v3 = result;
  return result;
}

void *sub_1000061F8(void *a1, int64_t a2, char a3)
{
  unint64_t result = sub_10000642C(a1, a2, a3, *v3, &qword_100050288, &qword_100050280);
  *uint64_t v3 = result;
  return result;
}

char *sub_100006224(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006674(&qword_100050260);
    unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  BOOL v13 = v11 + 32;
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

char *sub_100006320(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100006674(&qword_100050268);
    unint64_t v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }

  else
  {
    unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  BOOL v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[24 * v8] <= v13) {
      memmove(v13, v14, 24 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy(v13, v14, v8, &type metadata for EngagementMessagePlacementInfo);
  }

  swift_release(a4);
  return v11;
}

void *sub_10000642C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v10 = a2;
  }

  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    uint64_t v13 = sub_100006674(a5);
    uint64_t v14 = (void *)swift_allocObject(v13, 8 * v12 + 32, 7LL);
    size_t v15 = j__malloc_size(v14);
    v14[2] = v11;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 8);
  }

  else
  {
    uint64_t v14 = &_swiftEmptyArrayStorage;
  }

  if ((v8 & 1) != 0)
  {
    if (v14 != a4 || &a4[v11 + 4] <= v14 + 4) {
      memmove(v14 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0LL;
  }

  else
  {
    uint64_t v17 = sub_100006674(a6);
    swift_arrayInitWithCopy(v14 + 4, a4 + 4, v11, v17);
  }

  swift_release(a4);
  return v14;
}

uint64_t sub_10000654C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1
    || (uint64_t result = type metadata accessor for JSSourceInfo(0LL),
        a1 + *(void *)(*(void *)(result - 8) + 72LL) * a2 <= a3))
  {
    type metadata accessor for JSSourceInfo(0LL);
    uint64_t v8 = sub_100006870();
    return swift_arrayInitWithTakeFrontToBack(v8);
  }

  else if (a3 != a1)
  {
    uint64_t v7 = sub_100006870();
    return swift_arrayInitWithTakeBackToFront(v7);
  }

  return result;
}

uint64_t sub_1000065D4(void *a1)
{
  id v2 = [a1 toArray];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, (char *)&type metadata for Any + 8);

  return v3;
}

uint64_t sub_100006638(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006674(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t destroy for AppQueryRequest(void *a1)
{
  return swift_bridgeObjectRelease(a1[1]);
}

void *_s34AppleMediaServicesUIDynamicService15AppQueryRequestVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for AppQueryRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
  uint64_t v6 = a1[1];
  uint64_t v7 = a2[1];
  a1[1] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  return a1;
}

__n128 initializeWithTake for AppQueryRequest(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AppQueryRequest(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppQueryRequest(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }

    else
    {
      uint64_t v3 = *a1;
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppQueryRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for AppQueryRequest()
{
  return &type metadata for AppQueryRequest;
}

uint64_t sub_100006870()
{
  return v0;
}

id sub_100006884(void *a1, uint64_t a2)
{
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    sub_100007498(0LL, (unint64_t *)&unk_1000509F0, &OBJC_CLASS___ASDApp_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    uint64_t v7 = swift_allocObject(&unk_1000494C8, 24LL, 7LL);
    *(void *)(v7 + 16) = a2;
    size_t v15 = sub_100006AEC;
    uint64_t v16 = v7;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256LL;
    v13[2] = sub_100006F24;
    uint64_t v14 = &unk_1000494E0;
    uint64_t v8 = _Block_copy(v13);
    uint64_t v9 = v16;
    swift_bridgeObjectRetain(a2);
    swift_release(v9);
    id v10 = -[objc_class ams_mapWithTransformIgnoresNil:](isa, "ams_mapWithTransformIgnoresNil:", v8);
    _Block_release(v8);

    uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, (char *)&type metadata for Any + 8);
    sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
    uint64_t v14 = (void *)sub_100006674(&qword_100050298);
    v13[0] = v11;
    id v12 = a1;
    id result = sub_10002299C(v13, a1);
    if (result)
    {
      JSValue.subscript.setter(result, 1936748641LL, 0xE400000000000000LL);
      return v5;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

void sub_100006A2C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100007498(0LL, (unint64_t *)&unk_1000509F0, &OBJC_CLASS___ASDApp_ptr);
  swift_dynamicCast(&v6, v7, (char *)&type metadata for Any + 8, v3, 7LL);
  uint64_t v4 = v6;
  uint64_t v5 = sub_100006AF4(v6);
  a2[3] = sub_100006674(&qword_100050270);

  *a2 = v5;
}

uint64_t sub_100006AC8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100006AEC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

uint64_t sub_100006AF4(void *a1)
{
  uint64_t v2 = sub_100006674(&qword_1000502A0);
  uint64_t v4 = __chkstk_darwin(v2, v3);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4, v7);
  uint64_t v9 = (char *)v38 - v8;
  uint64_t v10 = sub_100006674(&qword_1000502A8);
  uint64_t inited = swift_initStackObject(v10, v41);
  *(_OWORD *)(inited + 16) = xmmword_10003BAE0;
  *(void *)(inited + 32) = 0x6449656C646E7562LL;
  *(void *)(inited + 40) = 0xE800000000000000LL;
  id v12 = [a1 bundleID];
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  uint64_t v15 = v14;

  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v13;
  *(void *)(inited + 56) = v15;
  uint64_t v42 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t v16 = sub_100005BFC(a1, (SEL *)&selRef_bundleShortVersion);
  if (v17)
  {
    *((void *)&v40 + 1) = &type metadata for String;
    *(void *)&__int128 v39 = v16;
    *((void *)&v39 + 1) = v17;
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
  }

  sub_100007084((uint64_t)&v39, 0xD000000000000012LL, 0x800000010003D900LL);
  uint64_t v18 = sub_100005BFC(a1, (SEL *)&selRef_bundleVersion);
  if (v19)
  {
    *((void *)&v40 + 1) = &type metadata for String;
    *(void *)&__int128 v39 = v18;
    *((void *)&v39 + 1) = v19;
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
  }

  sub_100007084((uint64_t)&v39, 0x6556656C646E7562LL, 0xED00006E6F697372LL);
  id v20 = [a1 installError];
  if (v20)
  {
    uint64_t v21 = v20;
    swift_getErrorValue(v20);
    uint64_t v22 = Error.localizedDescription.getter(v38[1], v38[2]);
    uint64_t v24 = v23;
    *((void *)&v40 + 1) = &type metadata for String;

    *(void *)&__int128 v39 = v22;
    *((void *)&v39 + 1) = v24;
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
  }

  sub_100007084((uint64_t)&v39, 0x456C6C6174736E69LL, 0xEC000000726F7272LL);
  id v25 = [a1 installID];
  if (v25)
  {
    uint64_t v26 = v25;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v27 = type metadata accessor for UUID(0LL);
    uint64_t v28 = (uint64_t)v6;
    uint64_t v29 = 0LL;
  }

  else
  {
    uint64_t v27 = type metadata accessor for UUID(0LL);
    uint64_t v28 = (uint64_t)v6;
    uint64_t v29 = 1LL;
  }

  sub_100007438(v28, v29, 1LL, v27);
  sub_100007444((uint64_t)v6, (uint64_t)v9);
  type metadata accessor for UUID(0LL);
  uint64_t v30 = sub_10000748C((uint64_t)v9, 1LL, v27);
  if ((_DWORD)v30 == 1)
  {
    sub_1000074D0((uint64_t)v9, &qword_1000502A0);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
  }

  else
  {
    uint64_t v31 = UUID.uuidString.getter(v30);
    *((void *)&v40 + 1) = &type metadata for String;
    *(void *)&__int128 v39 = v31;
    *((void *)&v39 + 1) = v32;
    (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8LL))(v9, v27);
  }

  sub_100007084((uint64_t)&v39, 0x496C6C6174736E69LL, 0xE900000000000044LL);
  unsigned __int8 v33 = [a1 isInstalled];
  *((void *)&v40 + 1) = &type metadata for Bool;
  LOBYTE(v39) = v33;
  sub_100007084((uint64_t)&v39, 0x6C6174736E497369LL, 0xEB0000000064656CLL);
  id v34 = [a1 storeItemID];
  *((void *)&v40 + 1) = &type metadata for Int64;
  *(void *)&__int128 v39 = v34;
  sub_100007084((uint64_t)&v39, 0x65744965726F7473LL, 0xEB0000000044496DLL);
  id v35 = [a1 storeFront];
  if (v35)
  {
    id v36 = v35;
    *((void *)&v40 + 1) = sub_100007498(0LL, (unint64_t *)&qword_100050258, &OBJC_CLASS___NSNumber_ptr);
    *(void *)&__int128 v39 = v36;
  }

  else
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
  }

  sub_100007084((uint64_t)&v39, 0x6F724665726F7473LL, 0xEA0000000000746ELL);
  return v42;
}

id sub_100006F24(uint64_t a1, uint64_t a2)
{
  void (*v4)(void *__return_ptr, void *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void v12[3];
  uint64_t v13;
  void v14[4];
  uint64_t v4 = *(void (**)(void *__return_ptr, void *))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v14[3] = swift_getObjectType(a2);
  v14[0] = a2;
  swift_retain(v3);
  swift_unknownObjectRetain(a2);
  v4(v12, v14);
  swift_release(v3);
  uint64_t v5 = v13;
  if (v13)
  {
    uint64_t v6 = sub_100007060(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    __chkstk_darwin(v6, v6);
    uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v9, v5);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v12);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v14);
  return v10;
}

uint64_t sub_100007028(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007038(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_100007060(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100007084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000750C((_OWORD *)a1, v6);
    sub_100007238(v6, a2, a3);
    return swift_bridgeObjectRelease(a3);
  }

  else
  {
    sub_1000074D0(a1, (uint64_t *)&unk_1000509C0);
    sub_100007114(a2, a3, v6);
    swift_bridgeObjectRelease(a3);
    return sub_1000074D0((uint64_t)v6, (uint64_t *)&unk_1000509C0);
  }

double sub_100007114@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  unint64_t v9 = sub_1000098A8(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v16 = *v4;
    uint64_t v12 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    Swift::Int v13 = *(void *)(v12 + 24);
    sub_100006674(&qword_1000502B0);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    swift_bridgeObjectRelease(*(void *)(*(void *)(v16 + 48) + 16 * v9 + 8));
    sub_10000750C((_OWORD *)(*(void *)(v16 + 56) + 32 * v9), a3);
    _NativeDictionary._delete(at:)( v9,  v16,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    uint64_t v14 = *v4;
    *uint64_t v4 = v16;
    swift_bridgeObjectRelease(v14);
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

uint64_t sub_100007238(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_1000072B4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *v3;
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

_OWORD *sub_1000072B4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000098A8(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_100006674(&qword_1000502B0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000098A8(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v16 = v18;
LABEL_5:
  id v20 = *v5;
  if ((v17 & 1) != 0)
  {
    uint64_t v21 = (void *)(v20[7] + 32 * v16);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v21);
    return sub_10000750C(a1, v21);
  }

  else
  {
    sub_1000073D0(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain(a3);
  }

_OWORD *sub_1000073D0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_10000750C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_100007438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_100007444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_1000502A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000748C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_100007498(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_1000074D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006674(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

_OWORD *sub_10000750C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000751C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  v23[0] = a1;
  uint64_t v11 = type metadata accessor for Optional(0LL, a4);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = __chkstk_darwin(v11, v13);
  unint64_t v16 = (char *)v23 - v15;
  uint64_t v17 = *(void *)(a4 - 8);
  __chkstk_darwin(v14, v18);
  id v20 = (char *)v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, a2, v11);
  if (sub_10000748C((uint64_t)v16, 1LL, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    a6[3] = a3;
    a6[4] = a5;
    uint64_t v21 = sub_100007678(a6);
    return (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(a3 - 8) + 16LL))(v21, v23[1], a3);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v20, v16, a4);
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v23[0], v20, a3, a4, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, a4);
  }

void *sub_100007678(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

id sub_1000076B4()
{
  if (*v0)
  {
    id v1 = *v0;
    id result = [v1 accountStore];
    if (result)
    {
      id v3 = result;
      uint64_t v4 = type metadata accessor for Unstable.Accounts(0LL);
      swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
      uint64_t v5 = Unstable.Accounts.init(_:)(v3);

      return (id)v5;
    }

    else
    {
      __break(1u);
    }
  }

  else
  {
    uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___ACAccountStore);
    id v7 =  objc_msgSend( v6,  "ams_sharedAccountStoreForClient:",  *(id *)((char *)v0 + *(int *)(type metadata accessor for BaseBootstrap(0) + 24)));
    uint64_t v8 = type metadata accessor for Unstable.Accounts(0LL);
    swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
    return (id)Unstable.Accounts.init(_:)(v7);
  }

  return result;
}

uint64_t sub_10000778C()
{
  id v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for BaseBootstrap(0LL);
  uint64_t v3 = *(void *)(*((void *)v2 - 1) + 64LL);
  uint64_t v49 = *((void *)v2 - 1);
  uint64_t v50 = v3;
  __chkstk_darwin(v2, v4);
  uint64_t v48 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for BaseObjectGraph(0LL);
  static BaseObjectGraph.build(withName:)(v67, 1702060354LL, 0xE400000000000000LL);
  uint64_t v6 = v67[3];
  uint64_t v7 = v67[4];
  uint64_t v8 = sub_1000086FC(v67);
  sub_1000086F4((uint64_t)v8, (unint64_t *)&qword_1000503B0, &OBJC_CLASS___ACAccount_ptr);
  v61[0] = *v1;
  BOOL v9 = (void *)v61[0];
  sub_10000751C(v10, (uint64_t)v61, v6, v10, v7, v64);
  uint64_t v11 = v65;
  uint64_t v12 = v66;
  sub_100007060(v64, v65);
  uint64_t v13 = type metadata accessor for Unstable.Accounts(0LL);
  id v14 = sub_1000076B4();
  v60[0] = v14;
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v13, v60, v11, v13, v12);
  swift_release(v14);
  uint64_t v15 = v62;
  uint64_t v16 = v63;
  sub_100007060(v61, v62);
  uint64_t v17 = type metadata accessor for DynamicAccountsStore();
  id v18 = sub_1000076B4();
  sub_1000086E8(v17);
  id v19 = v9;
  DynamicAccountsStore.init(accountStore:account:)((uint64_t)v18, (uint64_t)v9);
  uint64_t v21 = v20;
  v59[0] = v20;
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v17, v59, v15, v17, v16);
  swift_release(v21);
  sub_100007060(v60, v60[3]);
  uint64_t v22 = type metadata accessor for Bag(0LL);
  sub_1000086C4(v22, (uint64_t)v1 + v2[5]);
  uint64_t v23 = sub_100007060(v59, v59[3]);
  sub_1000086F4((uint64_t)v23, &qword_1000503B8, &OBJC_CLASS___AMSProcessInfo_ptr);
  v57[0] = *(void *)((char *)v1 + v2[6]);
  uint64_t v24 = (void *)v57[0];
  sub_1000086C4(v25, (uint64_t)v57);
  uint64_t v26 = v58[3];
  uint64_t v27 = v58[4];
  sub_1000086FC(v58);
  uint64_t v28 = (void *)((char *)v1 + v2[7]);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  v54[0] = v30;
  v54[1] = v29;
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)( &type metadata for MediaClient,  v54,  v26,  &type metadata for MediaClient,  v27);
  uint64_t v31 = v57[3];
  uint64_t v32 = v57[4];
  sub_1000086FC(v57);
  AsyncObjectGraphBuilder.withDependenciesSatisfied.getter(v31, v32);
  uint64_t v33 = v55;
  uint64_t v34 = v56;
  id v35 = sub_100007060(v54, v55);
  sub_1000086F4((uint64_t)v35, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
  uint64_t v37 = v36;
  uint64_t v38 = v48;
  sub_100007FF4((uint64_t)v1, v48);
  uint64_t v39 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v40 = (v39 + 24) & ~v39;
  uint64_t v41 = swift_allocObject(&unk_100049518, v40 + v50, v39 | 7);
  *(void *)(v41 + 16) = v24;
  sub_1000080E8(v38, v41 + v40);
  id v42 = v24;
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v51, v37, sub_10000812C, v41, v33, v37, v34);
  swift_release(v41);
  uint64_t v43 = v52;
  uint64_t v44 = v53;
  sub_100007060(v51, v52);
  uint64_t v45 = dispatch thunk of AsyncObjectGraphBuilder.makeObjectGraph()(v43, v44);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v51);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v54);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v57);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v58);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v59);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v60);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v61);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v64);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v67);
  return v45;
}

uint64_t sub_100007B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  uint64_t v6 = type metadata accessor for JetEngineBootstrap.URLProtocolHandler(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (uint64_t *)((char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = type metadata accessor for Bag(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100007FC0(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
  uint64_t v16 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v11, a1, v11, v16);
  uint64_t v17 = (void *)(a3 + *(int *)(type metadata accessor for BaseBootstrap(0LL) + 28));
  uint64_t v18 = v17[1];
  *uint64_t v10 = *v17;
  v10[1] = v18;
  v10[2] = 0LL;
  v10[3] = 0LL;
  (*(void (**)(void *, void, uint64_t))(v7 + 104))( v10,  enum case for JetEngineBootstrap.URLProtocolHandler.media(_:),  v6);
  swift_bridgeObjectRetain(v18);
  uint64_t v19 = static AMSURLSession.forJetEngineStorefront(with:for:usingProtocol:)(v15, v21, v10);
  (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  *uint64_t v22 = v19;
  return result;
}

void *AccountsWrapper.account.getter()
{
  id v1 = *(void **)(v0 + 16);
  [v1 lock];
  uint64_t v2 = *(void **)(v0 + 24);
  id v3 = v2;
  [v1 unlock];
  return v2;
}

void AccountsWrapper.account.setter(void *a1)
{
  id v3 = *(void **)(v1 + 16);
  [v3 lock];
  uint64_t v4 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = a1;
  id v5 = a1;

  [v3 unlock];
}

void AccountsWrapper.account.modify(void **a1)
{
  a1[1] = v1;
  *a1 = AccountsWrapper.account.getter();
  sub_10000870C();
}

void sub_100007DA0(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if ((a2 & 1) != 0)
  {
    id v3 = v2;
    AccountsWrapper.account.setter(v2);
  }

  else
  {
    AccountsWrapper.account.setter(*a1);
  }

uint64_t DynamicAccountsStore.accountStore.getter()
{
  return swift_retain(*(void *)(v0 + 32));
}

uint64_t DynamicAccountsStore.accountStore.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)(v1 + 32) = a1;
  return swift_release(v3);
}

void AccountsWrapper.accountStore.modify(uint64_t a1)
{
}

void AccountsWrapper.__allocating_init(accountStore:account:)(uint64_t a1, uint64_t a2)
{
}

void DynamicAccountsStore.init(accountStore:account:)(uint64_t a1, uint64_t a2)
{
  v2[2] = [objc_allocWithZone(NSLock) init];
  v2[3] = a2;
  v2[4] = a1;
  sub_100008714();
}

uint64_t DynamicAccountsStore.deinit()
{
  swift_release(*(void *)(v0 + 32));
  return v0;
}

uint64_t DynamicAccountsStore.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for AccountsWrapper()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService15AccountsWrapper);
}

uint64_t type metadata accessor for BaseBootstrap(uint64_t a1)
{
  uint64_t result = qword_100050420;
  if (!qword_100050420) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BaseBootstrap);
  }
  return result;
}

void sub_100007FC0(uint64_t a1, unint64_t *a2, void *a3)
{
  if (!*a2)
  {
    uint64_t v4 = objc_opt_self(*a3);
    atomic_store(swift_getObjCClassMetadata(v4), a2);
  }

  sub_10000870C();
}

uint64_t sub_100007FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BaseBootstrap(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008038()
{
  uint64_t v1 = (int *)type metadata accessor for BaseBootstrap(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  uint64_t v7 = v0 + v4;
  uint64_t v8 = v0 + v4 + v1[5];
  uint64_t v9 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);

  swift_bridgeObjectRelease(*(void *)(v7 + v1[7] + 8));
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000080E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BaseBootstrap(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000812C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for BaseBootstrap(0LL) - 8) + 80LL);
  return sub_100007B40(a1, *(void *)(v2 + 16), v2 + ((v5 + 24) & ~v5), a2);
}

void **sub_100008188(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16LL) & ~(unint64_t)v3];
    swift_retain(v4);
  }

  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Bag(0LL);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = *(void **)((char *)a2 + v14);
    *(void **)((char *)v7 + v14) = v16;
    uint64_t v17 = (void **)((char *)v7 + v15);
    uint64_t v18 = (void **)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    id v20 = v16;
    swift_bridgeObjectRetain(v19);
  }

  return v7;
}

uint64_t sub_100008254(id *a1, int *a2)
{
  uint64_t v4 = (char *)a1 + a2[5];
  uint64_t v5 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);

  return swift_bridgeObjectRelease(*(id *)((char *)a1 + a2[7] + 8));
}

void **sub_1000082C0(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Bag(0LL);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void **)((char *)a2 + v13);
  *(void **)((char *)a1 + v13) = v15;
  uint64_t v16 = (void **)((char *)a1 + v14);
  uint64_t v17 = (void **)((char *)a2 + v14);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  id v19 = v15;
  swift_bridgeObjectRetain(v18);
  return a1;
}

void **sub_100008364(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24LL))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(void **)((char *)a1 + v13) = v14;
  id v16 = v14;

  uint64_t v17 = a3[7];
  uint64_t v18 = (void **)((char *)a1 + v17);
  id v19 = (void **)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  uint64_t v20 = v19[1];
  uint64_t v21 = v18[1];
  v18[1] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  return a1;
}

void *sub_100008420(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

void **sub_1000084A0(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = *(void **)((char *)a1 + v11);
  *(void **)((char *)a1 + v11) = *(void **)((char *)a2 + v11);

  uint64_t v13 = a3[7];
  uint64_t v14 = (void **)((char *)a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v18 = v14[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  return a1;
}

uint64_t sub_100008544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008550);
}

uint64_t sub_100008550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000086D8();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3) {
    return sub_10000748C(v4 + *(int *)(a3 + 20), v3, v6);
  }
  unint64_t v8 = *(void *)(v4 + *(int *)(a3 + 24));
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t sub_1000085C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000085CC);
}

uint64_t sub_1000085CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000086D8();
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return sub_100007438(v5 + *(int *)(a4 + 20), v4, v4, result);
  }
  *(void *)(v5 + *(int *)(a4 + 24)) = (v4 - 1);
  return result;
}

uint64_t sub_100008638(uint64_t a1)
{
  v4[0] = "\b";
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = &unk_10003BB98;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000086C4(uint64_t a1, uint64_t a2)
{
  return AsyncObjectGraphBuilder.satisfying<A>(_:with:)(a1, a2, v2, a1, v3);
}

uint64_t sub_1000086D8()
{
  return type metadata accessor for Bag(0LL);
}

uint64_t sub_1000086E8(uint64_t a1)
{
  return swift_allocObject(a1, 40LL, 7LL);
}

void sub_1000086F4(uint64_t a1, unint64_t *a2, void *a3)
{
}

void *sub_1000086FC(void *a1)
{
  return sub_100007060(a1, v1);
}

uint64_t sub_100008704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

  ;
}

  ;
}

void DynamicAccountsStore.__allocating_init(accountStore:account:)(uint64_t a1, uint64_t a2)
{
}

void *DynamicAccountsStore.account.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  [v1 lock];
  uint64_t v2 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v3 = type metadata accessor for LogMessage(0LL);
  uint64_t v4 = swift_allocObject( v2,  ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL))
       + 4LL * *(void *)(*(void *)(v3 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_10003BBC0;
  uint64_t v5 = type metadata accessor for DynamicAccountsStore();
  uint64_t v6 = sub_100008DCC(v5);
  id v7 = (id)AMSLogKey(v6);
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

    sub_100008DDC();
    sub_100008D80();
    uint64_t v10 = *((void *)&v24 + 1);
    uint64_t v11 = sub_100007060(&v23, *((uint64_t *)&v24 + 1));
    sub_100008D9C((uint64_t)v11, v10);
    swift_getMetatypeMetadata();
    sub_100008D8C();
    sub_100008D94();
    sub_100008DBC();
    uint64_t v22 = v9;
    sub_100008D8C();
    sub_100008D94();
    uint64_t v12 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    uint64_t v13 = *((void *)&v24 + 1);
    uint64_t v14 = sub_100007060(&v23, *((uint64_t *)&v24 + 1));
    uint64_t v15 = sub_100008D9C((uint64_t)v14, v13);
    swift_getMetatypeMetadata();
    uint64_t v22 = v15;
    sub_100008D8C();
    sub_100008D94();
    uint64_t v12 = 58LL;
  }

  unint64_t v16 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v12);
  LogMessage.init(stringInterpolation:)(v0);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v23);
  sub_100008DA4();
  sub_100008DB4();
  LogMessage.init(stringLiteral:)(0xD000000000000011LL, 0x800000010003D970LL);
  uint64_t v17 = *(void **)(v0 + 24);
  if (v17)
  {
    *((void *)&v24 + 1) = sub_100008D44();
    *(void *)&__int128 v23 = v17;
  }

  else
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
  }

  type metadata accessor for Log();
  id v18 = v17;
  static LogMessage.safe(_:)(&v23);
  sub_100008DB4();
  sub_10002C2E0(v4);
  swift_bridgeObjectRelease(v4);
  id v19 = *(void **)(v0 + 24);
  id v20 = v19;
  objc_msgSend(v1, "unlock", v22);
  return v19;
}

void DynamicAccountsStore.account.setter(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin();
  sub_100008DFC();
  uint64_t v4 = *(void **)(v1 + 16);
  [v4 lock];
  uint64_t v5 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v6 = type metadata accessor for LogMessage(0LL);
  uint64_t v7 = swift_allocObject( v5,  ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL))
       + 4LL * *(void *)(*(void *)(v6 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_10003BBC0;
  uint64_t v8 = type metadata accessor for DynamicAccountsStore();
  uint64_t v9 = sub_100008DCC(v8);
  id v10 = (id)AMSLogKey(v9);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);

    sub_100008DDC();
    sub_100008D80();
    uint64_t v13 = *((void *)&v25 + 1);
    uint64_t v14 = sub_100007060(&v24, *((uint64_t *)&v25 + 1));
    sub_100008D9C((uint64_t)v14, v13);
    swift_getMetatypeMetadata();
    sub_100008D8C();
    sub_100008D94();
    sub_100008DBC();
    uint64_t v23 = v12;
    sub_100008D8C();
    sub_100008D94();
    uint64_t v15 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    uint64_t v16 = *((void *)&v25 + 1);
    uint64_t v17 = sub_100007060(&v24, *((uint64_t *)&v25 + 1));
    uint64_t v18 = sub_100008D9C((uint64_t)v17, v16);
    swift_getMetatypeMetadata();
    uint64_t v23 = v18;
    sub_100008D8C();
    sub_100008D94();
    uint64_t v15 = 58LL;
  }

  unint64_t v19 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v15);
  LogMessage.init(stringInterpolation:)(v1);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v24);
  sub_100008DA4();
  sub_100008DB4();
  LogMessage.init(stringLiteral:)(0xD000000000000010LL, 0x800000010003D990LL);
  if (a1)
  {
    *((void *)&v25 + 1) = sub_100008D44();
    *(void *)&__int128 v24 = a1;
  }

  else
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
  }

  type metadata accessor for Log();
  id v20 = a1;
  static LogMessage.safe(_:)(&v24);
  sub_100008DB4();
  sub_10002C2E0(v7);
  swift_bridgeObjectRelease(v7);
  uint64_t v21 = *(void **)(v1 + 24);
  *(void *)(v2 + 24) = a1;
  id v22 = v20;

  objc_msgSend(v4, "unlock", v23);
}

void (*DynamicAccountsStore.account.modify(void **a1))(void **a1, char a2)
{
  a1[1] = v1;
  *a1 = DynamicAccountsStore.account.getter();
  return sub_100008C58;
}

void sub_100008C58(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if ((a2 & 1) != 0)
  {
    id v3 = v2;
    DynamicAccountsStore.account.setter(v2);
  }

  else
  {
    DynamicAccountsStore.account.setter(*a1);
  }

void *DynamicAccountsStore.accountStore.modify(uint64_t a1)
{
  return &j__swift_endAccess;
}

uint64_t type metadata accessor for DynamicAccountsStore()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService20DynamicAccountsStore);
}

uint64_t sub_100008D04(uint64_t a1)
{
  uint64_t v2 = sub_100006674((uint64_t *)&unk_1000509C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100008D44()
{
  unint64_t result = qword_1000503B0;
  if (!qword_1000503B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___ACAccount);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000503B0);
  }

  return result;
}

void sub_100008D80()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_100008D8C()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 144);
}

uint64_t sub_100008D94()
{
  return sub_100008D04(v0 - 144);
}

uint64_t sub_100008D9C(uint64_t a1, uint64_t a2)
{
  return swift_getDynamicType(a1, a2, 1LL);
}

uint64_t sub_100008DA4()
{
  *(void *)(v2 - 88) = v0;
  *(void *)(v2 - 112) = v1;
  return static LogMessage.safe(_:)(v2 - 112);
}

uint64_t sub_100008DB4()
{
  return sub_100008D04(v0 - 112);
}

void sub_100008DBC()
{
  v0._countAndFlagsBits = 5972026LL;
  v0._object = (void *)0xE300000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_100008DCC(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return swift_retain(v1);
}

uint64_t sub_100008DDC()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
}

uint64_t sub_100008DEC()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
}

  ;
}

id sub_100008E14(uint64_t a1, void *a2)
{
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  id v4 = result;
  uint64_t v5 = sub_100008FDC(a2);
  if (v5)
  {
    if (*(void *)(v5 + 16))
    {
      sub_1000090C0(v5, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
      sub_100006674(&qword_100050558);
      id v6 = sub_1000090B4();
      id result = sub_1000090A4((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, v34);
      if (!result)
      {
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }

      sub_1000090C8();
    }

    else
    {
      swift_bridgeObjectRelease(v5);
    }
  }

  uint64_t v14 = sub_10000903C(a2);
  if (!v14)
  {
LABEL_12:
    id v23 = [a2 request];
    if (!v23) {
      return v4;
    }
    __int128 v24 = v23;
    uint64_t v25 = sub_1000090C0((uint64_t)v23, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
    sub_1000090C0(v25, &qword_1000520E0, &OBJC_CLASS___AMSEngagementRequest_ptr);
    sub_1000090B4();
    id v26 = v24;
    id result = sub_1000090A4((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33, v34);
    if (result)
    {
      sub_1000090C8();

      return v4;
    }

    goto LABEL_17;
  }

  if (!*(void *)(v14 + 16))
  {
    swift_bridgeObjectRelease(v14);
    goto LABEL_12;
  }

  sub_1000090C0(v14, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  sub_100006674(&qword_100050280);
  id v15 = sub_1000090B4();
  id result = sub_1000090A4((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22, v34);
  if (result)
  {
    sub_1000090C8();
    goto LABEL_12;
  }

LABEL_19:
  __break(1u);
  return result;
}

        uint64_t v12 = (v17 - 1) & v17;
        id v15 = __clz(__rbit64(v17)) + (v18 << 6);
        uint64_t v48 = v18;
      }

      uint64_t v20 = *(void *)(*(void *)(v47 + 48) + 8 * v15);
      uint64_t v21 = (uint64_t *)(*(void *)(v47 + 56) + 16 * v15);
      uint64_t v22 = *v21;
      id v23 = v21[1];
      __int128 v24 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
      swift_bridgeObjectRetain(v23);
      uint64_t v25 = [v24 defaultManager];
      id v26 = String._bridgeToObjectiveC()();
      uint64_t v27 = [v25 fileExistsAtPath:v26];

      if (v27) {
        break;
      }
      sub_100007438((uint64_t)v5, 1LL, 1LL, v6);
LABEL_27:
      swift_bridgeObjectRelease(v23);
      id result = sub_10000B8C8((uint64_t)v5);
    }

    URL.init(fileURLWithPath:)(v22, v23);
    sub_100007438((uint64_t)v5, 0LL, 1LL, v6);
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
    uint64_t v29 = v42;
    v28(v42, v5, v6);
    v28(v43, v29, v6);
    uint64_t v30 = v53;
    uint64_t v31 = v53[2];
    if (v53[3] <= v31)
    {
      sub_10000B59C(v31 + 1, 1LL);
      uint64_t v30 = v53;
    }

    id result = static Hasher._hash(seed:_:)(v30[5], v20);
    uint64_t v32 = v30 + 8;
    uint64_t v33 = -1LL << *((_BYTE *)v30 + 32);
    uint64_t v34 = result & ~v33;
    id v35 = v34 >> 6;
    if (((-1LL << v34) & ~v30[(v34 >> 6) + 8]) == 0) {
      break;
    }
    uint64_t v36 = __clz(__rbit64((-1LL << v34) & ~v30[(v34 >> 6) + 8])) | v34 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_35:
    *(void *)((char *)v32 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v36;
    *(void *)(v30[6] + 8 * v36) = v20;
    v28((char *)(v30[7] + *(void *)(v44 + 72) * v36), v43, v6);
    ++v30[2];
  }

  uint64_t v37 = 0;
  uint64_t v38 = (unint64_t)(63 - v33) >> 6;
  while (++v35 != v38 || (v37 & 1) == 0)
  {
    uint64_t v39 = v35 == v38;
    if (v35 == v38) {
      id v35 = 0LL;
    }
    v37 |= v39;
    uint64_t v40 = v32[v35];
    if (v40 != -1)
    {
      uint64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
      goto LABEL_35;
    }
  }

  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_100008FDC(void *a1)
{
  id v1 = [a1 actions];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100006674(&qword_100050280);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

uint64_t sub_10000903C(void *a1)
{
  id v1 = [a1 data];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  return v3;
}

id sub_1000090A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_10002299C(&a9, v9);
}

id sub_1000090B4()
{
  return v0;
}

uint64_t sub_1000090C0(uint64_t a1, unint64_t *a2, void *a3)
{
  return sub_100007498(0LL, a2, a3);
}

uint64_t sub_1000090C8()
{
  return JSValue.subscript.setter();
}

uint64_t sub_1000090D0(void *a1)
{
  uint64_t v2 = (void *)sub_100009264();
  uint64_t v3 = sub_1000091A0(v2);
  if (v3)
  {
    uint64_t v4 = v3;
  }

  else
  {
    uint64_t v4 = sub_100009264();
    uint64_t v5 = type metadata accessor for JSError(0LL);
    unint64_t v6 = sub_100009214();
    swift_allocError(v5, v6, 0LL, 0LL);
    uint64_t v7 = JSError.init(badValue:expected:)(v4, 0x616E6F6974636964LL, 0xEA00000000007972LL);
    swift_willThrow(v7);
  }

  return v4;
}

uint64_t sub_100009178@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000090D0(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1000091A0(void *a1)
{
  id v2 = [a1 toDictionary];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v2,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  return v3;
}

unint64_t sub_100009214()
{
  unint64_t result = qword_1000509B0;
  if (!qword_1000509B0)
  {
    uint64_t v1 = type metadata accessor for JSError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for JSError, v1);
    atomic_store(result, (unint64_t *)&qword_1000509B0);
  }

  return result;
}

ValueMetadata *type metadata accessor for EngagementEvent()
{
  return &type metadata for EngagementEvent;
}

uint64_t sub_100009264()
{
  return JSValue.subscript.getter(0x656D656761676E65LL, 0xEE0061746144746ELL);
}

void sub_100009288(void *a1)
{
  id v2 = (void *)sub_10000A1AC();
  uint64_t v3 = sub_1000065D4(v2);
  if (!v3 || (uint64_t v4 = sub_100005FF8(v3), sub_10000A208(), !v4))
  {
    uint64_t v38 = sub_10000A1AC();
    sub_10000A1D4();
    unint64_t v39 = sub_10000A1CC();
    sub_10000A174(v39);
    uint64_t v40 = v38;
    uint64_t v41 = 0x7961727261LL;
    unint64_t v42 = 0xE500000000000000LL;
LABEL_17:
    uint64_t v43 = JSError.init(badValue:expected:)(v40, v41, v42);
    swift_willThrow(v43);

    return;
  }

  uint64_t v5 = (void *)sub_10000A188();
  JSValue.string.getter();
  uint64_t v7 = v6;

  if (!v7)
  {
    sub_10000A1DC();
    uint64_t v44 = sub_10000A188();
    sub_10000A1D4();
    unint64_t v45 = sub_10000A1CC();
    sub_10000A174(v45);
    uint64_t v40 = v44;
    uint64_t v41 = 0x676E69727473LL;
    unint64_t v42 = 0xE600000000000000LL;
    goto LABEL_17;
  }

  int64_t v8 = v4[2];
  if (v8)
  {
    v58 = a1;
    v61 = (unint64_t *)&_swiftEmptyArrayStorage;
    uint64_t v57 = v7;
    swift_bridgeObjectRetain(v7);
    sub_1000061B0(0LL, v8, 0);
    uint64_t v9 = 0LL;
    uint64_t v10 = (unint64_t *)&_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v11 = v4[v9 + 4];
      uint64_t v12 = *(void *)(v11 + 16);
      sub_10000A210();
      if (!v12
        || (unint64_t v13 = sub_1000098A8(0x6E656D6563616C70LL, 0xE900000000000074LL), (v14 & 1) == 0)
        || (sub_10000A1E4(v13, v14, v15, v16, v17, v18, v19, v20, v51, v53, v55),
            !swift_dynamicCast( v59,  v60,  (char *)&type metadata for Any + 8,  &type metadata for String,  6LL)))
      {
        sub_10000A1D4();
        unint64_t v46 = sub_10000A1CC();
        sub_10000A174(v46);
        sub_10000A218();
        unint64_t v48 = 0xD00000000000001DLL;
        goto LABEL_22;
      }

      unint64_t v21 = v59[1];
      if (!*(void *)(v11 + 16)) {
        break;
      }
      unint64_t v22 = v59[0];
      unint64_t v23 = sub_1000098A8(0x747865746E6F63LL, 0xE700000000000000LL);
      if ((v24 & 1) == 0) {
        break;
      }
      sub_10000A1E4(v23, v24, v25, v26, v27, v28, v29, v30, v52, v54, v56);
      uint64_t v31 = sub_100006674(&qword_100050270);
      uint64_t v32 = v4;
      unint64_t v33 = v59[0];
      sub_10000A208();
      v61 = v10;
      unint64_t v35 = v10[2];
      unint64_t v34 = v10[3];
      uint64_t v36 = v10;
      if (v35 >= v34 >> 1)
      {
        sub_1000061B0((char *)(v34 > 1), v35 + 1, 1);
        uint64_t v36 = v61;
      }

      ++v9;
      v36[2] = v35 + 1;
      uint64_t v37 = &v36[3 * v35];
      v37[4] = v33;
      v37[5] = v22;
      v37[6] = v21;
      uint64_t v4 = v32;
      uint64_t v10 = v36;
      if (v8 == v9)
      {
        swift_bridgeObjectRelease(v57);
        sub_10000A1DC();

        return;
      }
    }

    swift_bridgeObjectRelease(v21);
    sub_10000A1D4();
    unint64_t v49 = sub_10000A1CC();
    sub_10000A174(v49);
    sub_10000A218();
LABEL_22:
    uint64_t v50 = JSError.init(message:line:column:sourceURL:constructorName:)(v48, v47, 0LL, 1LL, 0LL, 1LL, 0LL, 0LL);
    swift_willThrow(v50);
    sub_10000A1DC();

    swift_bridgeObjectRelease_n(v57, 2LL);
    swift_release(v10);
    sub_10000A208();
  }

  else
  {
    sub_10000A1DC();
  }

id sub_1000095E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(a3);
    specialized ContiguousArray.reserveCapacity(_:)(v5);
    uint64_t v7 = (uint64_t *)(a3 + 48);
    do
    {
      uint64_t v9 = *(v7 - 2);
      uint64_t v8 = *(v7 - 1);
      uint64_t v10 = *v7;
      v7 += 3;
      swift_bridgeObjectRetain_n(v10, 2LL);
      uint64_t v11 = swift_bridgeObjectRetain(v9);
      sub_10002DEF8(v11);
      uint64_t v13 = v12;
      id v14 = objc_allocWithZone(&OBJC_CLASS___AMSEngagementPlacementInfo);
      id v15 = sub_10000975C(v8, v10, v13);
      swift_bridgeObjectRelease(v10);
      uint64_t v16 = swift_bridgeObjectRelease(v9);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v16);
      uint64_t v17 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
      uint64_t v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v15);
      specialized ContiguousArray._endMutation()(v18);
      --v5;
    }

    while (v5);
    swift_bridgeObjectRelease(a3);
  }

  objc_allocWithZone(&OBJC_CLASS___AMSEngagementMessageEvent);
  swift_bridgeObjectRetain(a2);
  return sub_1000097F8(a1, a2, (uint64_t)_swiftEmptyArrayStorage);
}

void sub_100009730(void *a1@<X0>, void *a2@<X8>)
{
  if (!v2)
  {
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v6;
  }

id sub_10000975C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (a3)
  {
    v7.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a3);
  }

  else
  {
    v7.super.Class isa = 0LL;
  }

  id v8 = [v3 initWithPlacement:v6 context:v7.super.isa];

  return v8;
}

id sub_1000097F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  sub_100009DFC();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  id v8 = [v3 initWithServiceType:v6 placementInfo:isa];

  return v8;
}

unint64_t sub_100009878(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_100009984(a1, v4);
}

unint64_t sub_1000098A8(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = sub_10000A200();
  return sub_100009A48(a1, a2, v5);
}

unint64_t sub_100009908(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = sub_10000A200();
  swift_bridgeObjectRelease(v6);
  return sub_100009B28(a1, v7);
}

unint64_t sub_100009984(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100009D8C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100009DC8((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_100009A48(uint64_t a1, uint64_t a2, uint64_t a3)
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
        id v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_100009B28(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

Swift::Int sub_100009C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = sub_10000A200();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100009D08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
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

uint64_t sub_100009D8C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100009DC8(uint64_t a1)
{
  return a1;
}

unint64_t sub_100009DFC()
{
  unint64_t result = qword_100050560;
  if (!qword_100050560)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___AMSEngagementPlacementInfo);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100050560);
  }

  return result;
}

uint64_t destroy for EngagementMessagePlacementInfo(void *a1)
{
  return swift_bridgeObjectRelease(a1[2]);
}

uint64_t *_s34AppleMediaServicesUIDynamicService30EngagementMessagePlacementInfoVwCP_0( uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  sub_10000A1F4(v3, (uint64_t)a2);
  sub_10000A210();
  return a1;
}

uint64_t *assignWithCopy for EngagementMessagePlacementInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for EngagementMessagePlacementInfo(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for EngagementMessagePlacementInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = a2[2];
  uint64_t v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementMessagePlacementInfo(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EngagementMessagePlacementInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for EngagementMessagePlacementInfo()
{
  return &type metadata for EngagementMessagePlacementInfo;
}

uint64_t destroy for EngagementMessageEvent(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

void *_s34AppleMediaServicesUIDynamicService22EngagementMessageEventVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_10000A1F4(v3, (uint64_t)a2);
  sub_10000A210();
  return a1;
}

void *assignWithCopy for EngagementMessageEvent(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

void *assignWithTake for EngagementMessageEvent(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(a1[1]);
  uint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EngagementMessageEvent(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for EngagementMessageEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for EngagementMessageEvent()
{
  return &type metadata for EngagementMessageEvent;
}

uint64_t sub_10000A174(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

uint64_t sub_10000A188()
{
  return JSValue.subscript.getter(0x5465636976726573LL, 0xEB00000000657079LL);
}

uint64_t sub_10000A1AC()
{
  return JSValue.subscript.getter(0x6E656D6563616C70LL, 0xEA00000000007374LL);
}

unint64_t sub_10000A1CC()
{
  return sub_100009214();
}

uint64_t sub_10000A1D4()
{
  return type metadata accessor for JSError(0LL);
}

uint64_t sub_10000A1DC()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000A1E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  return sub_100006638(*(void *)(v11 + 56) + 32 * a1, (uint64_t)va);
}

uint64_t sub_10000A1F4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = *(void *)(a2 + 16);
  return swift_bridgeObjectRetain(a1);
}

Swift::Int sub_10000A200()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A208()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000A210()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

void *sub_10000A22C(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (v4)
  {
    while (1)
    {
      __n128 result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v4);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = 0LL;
      while (v4 != v6)
      {
        if ((a1 & 0xC000000000000001LL) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
        }
        else {
          id v7 = *(id *)(a1 + 8 * v6 + 32);
        }
        ++v6;
        id v8 = v7;
        id v9 = sub_10000A384(a2, v8);

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
        uint64_t v11 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v11);
        uint64_t v12 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
        specialized ContiguousArray._endMutation()(v12);
        if (v4 == v6) {
          goto LABEL_16;
        }
      }

      __break(1u);
LABEL_12:
      if (a1 < 0) {
        uint64_t v13 = a1;
      }
      else {
        uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v13);
      swift_bridgeObjectRelease(a1);
      if (!v4) {
        goto LABEL_16;
      }
    }

    __break(1u);
  }

  else
  {
LABEL_16:

    return _swiftEmptyArrayStorage;
  }

  return result;
}

id sub_10000A384(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  id v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }

  id v9 = result;
  uint64_t v10 = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  id v11 = [a2 serviceType];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v14 = v13;

  uint64_t v40 = (ValueMetadata *)&type metadata for String;
  v39[0] = v12;
  v39[1] = v14;
  v37[0] = a1;
  v37[1] = v10;
  id result = sub_10002299C(v39, a1);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  sub_10000A9A0();
  id v15 = [a2 dictionaryRepresentation];
  uint64_t v16 = sub_100006674(&qword_100050570);
  uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v15,  &type metadata for String,  v16,  &protocol witness table for String);

  uint64_t v18 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v19 = type metadata accessor for LogMessage(0LL);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v19 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v20 + 16) = xmmword_10003BCD0;
  uint64_t v40 = &type metadata for EngagementMessageAction;
  v39[0] = a2;
  id v21 = (id)AMSLogKey(a2);
  if (v21)
  {
    char v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v25 = v24;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_10000A990();
    sub_10000A948();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10000A96C(MetatypeMetadata);
    sub_100008D94();
    v27._countAndFlagsBits = 5972026LL;
    v27._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    void v38[3] = &type metadata for String;
    v38[0] = v23;
    v38[1] = v25;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v38);
    sub_100008D94();
    uint64_t v28 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_10000A990();
    sub_10000A948();
    uint64_t v29 = swift_getMetatypeMetadata();
    sub_10000A96C(v29);
    sub_100008D94();
    uint64_t v28 = 58LL;
  }

  unint64_t v30 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
  LogMessage.init(stringInterpolation:)(v7);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v39);
  LogMessage.init(stringLiteral:)(0xD000000000000018LL, 0x800000010003DA80LL);
  uint64_t v40 = (ValueMetadata *)sub_100006674(&qword_100050578);
  v39[0] = v17;
  swift_bridgeObjectRetain(v17);
  static LogMessage.safe(_:)(v39);
  sub_100008D04((uint64_t)v39);
  sub_10002C300(v20);
  swift_bridgeObjectRelease(v20);
  sub_10002756C(0xD000000000000011LL, 0x800000010003DA10LL, v17);
  if (!v31) {
    goto LABEL_9;
  }
  uint64_t v32 = v31;
  uint64_t ObjectType = swift_getObjectType(v31);
  sub_10000A9A8(ObjectType);
  swift_unknownObjectRetain(v32);
  id result = sub_10000A980();
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  sub_10000A9A0();
  swift_unknownObjectRelease(v32);
LABEL_9:
  sub_10002756C(0x6E656D6563616C70LL, 0xEA00000000007374LL, v17);
  uint64_t v35 = v34;
  swift_bridgeObjectRelease(v17);
  if (!v35) {
    return v9;
  }
  uint64_t v36 = swift_getObjectType(v35);
  sub_10000A9A8(v36);
  swift_unknownObjectRetain(v35);
  id result = sub_10000A980();
  if (result)
  {
    sub_10000A9A0();
    swift_unknownObjectRelease(v35);
    return v9;
  }

LABEL_16:
  __break(1u);
  return result;
}

    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (v4 < 0) {
    uint64_t v5 = *v1;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v4);
  uint64_t v6 = a1;
  id v7 = __CocoaSet.contains(_:)();

  if ((v7 & 1) == 0) {
    goto LABEL_16;
  }
  id v8 = sub_100021734(v5, (uint64_t)v6);
  id v9 = v4;
LABEL_15:
  swift_bridgeObjectRelease(v9);
  return v8;
}

uint64_t sub_10000A794()
{
  return CustomJSValueConvertible.jsRepresentation(in:)();
}

JSValue sub_10000A7A8(JSContext a1)
{
  return CustomJSValueConvertible._jsValue(in:)(a1);
}

id sub_10000A7BC(void *a1)
{
  return sub_10000A384(a1, *v1);
}

id sub_10000A7C4(void *a1, void *a2)
{
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_10000A8CC(a2);
    if (!v6) {
      return v5;
    }
    uint64_t v7 = v6;
    id v8 = a1;
    id v9 = sub_10000A22C(v7, v8);
    swift_bridgeObjectRelease(v7);
    sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
    v11[3] = sub_100006674(&qword_100050568);
    v11[0] = v9;
    id v10 = v8;
    id result = sub_10002299C(v11, a1);
    if (result)
    {
      JSValue.subscript.setter(result, 0x736E6F69746361LL, 0xE700000000000000LL);
      return v5;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10000A8CC(void *a1)
{
  id v1 = [a1 messageActions];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100007498(0LL, &qword_100050580, &OBJC_CLASS___AMSEngagementMessageEventServiceResponse_ptr);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

ValueMetadata *type metadata accessor for EngagementMessageAction()
{
  return &type metadata for EngagementMessageAction;
}

uint64_t sub_10000A948()
{
  uint64_t v1 = *(void *)(v0 - 88);
  uint64_t v2 = sub_100007060((void *)(v0 - 112), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_10000A96C(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 144);
}

id sub_10000A980()
{
  return sub_10002299C((void *)(v1 - 112), v0);
}

void sub_10000A990()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_10000A9A0()
{
  return JSValue.subscript.setter();
}

id sub_10000A9A8(uint64_t a1)
{
  *(void *)(v3 - 88) = a1;
  *(void *)(v3 - 112) = v1;
  return v2;
}

uint64_t sub_10000A9B4()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  sub_100008DFC();
  sub_10000B09C(v4, qword_100050588);
  uint64_t v5 = sub_10000B084(v1, (uint64_t)qword_100050588);
  id v6 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v7 = [v6 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v7);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v5, v0, v1);
}

uint64_t sub_10000AA8C()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000B09C(v3, qword_1000505A0);
  sub_10000B084(v0, (uint64_t)qword_1000505A0);
  id v6 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v7 = [v6 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v7);
  URL.appendingPathComponent(_:)(0x656C646E7562LL, 0xE600000000000000LL);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v5, v0);
}

id sub_10000AB88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for URL(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  sub_100008DFC();
  sub_10000AE14();
  sub_10000AF28();
  id v6 = [(id)objc_opt_self(NSFileManager) defaultManager];
  URL._bridgeToObjectiveC()(v7);
  uint64_t v9 = v8;
  v21[0] = 0LL;
  unsigned int v10 = [v6 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:v21];

  id v19 = v21[0];
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a1, v1, v3);
    sub_100007438(a1, 0LL, 1LL, v3);
    return v19;
  }

  else
  {
    id v12 = v21[0];
    uint64_t v13 = _convertNSErrorToError(_:)(v19);

    swift_willThrow(v14);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    type metadata accessor for Log();
    uint64_t v15 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))
          + 2LL * *(void *)(v16 + 72),
            *(unsigned __int8 *)(v16 + 80) | 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_10003BD40;
    LogMessage.init(stringLiteral:)(0xD00000000000003ALL, 0x800000010003DAA0LL);
    swift_getErrorValue(v13);
    v21[3] = v20;
    uint64_t v18 = sub_100007678(v21);
    (*(void (**)(void *))(*((void *)v20 - 1) + 16LL))(v18);
    static LogMessage.safe(_:)(v21);
    sub_100008D04((uint64_t)v21);
    sub_10002C320(v17);
    swift_errorRelease(v13);
    swift_bridgeObjectRelease(v17);
    return (id)sub_100007438(a1, 1LL, 1LL, v3);
  }

id sub_10000AE14()
{
  id v0 = [(id)objc_opt_self(NSFileManager) defaultManager];
  if (qword_100050178 != -1) {
    swift_once(&qword_100050178, sub_10000AA8C);
  }
  uint64_t v1 = type metadata accessor for URL(0LL);
  sub_10000B084(v1, (uint64_t)qword_1000505A0);
  URL._bridgeToObjectiveC()(v2);
  uint64_t v4 = v3;
  id v10 = 0LL;
  unsigned int v5 = [v0 removeItemAtURL:v3 error:&v10];

  id result = v10;
  if (!v5)
  {
    id v7 = result;
    uint64_t v8 = _convertNSErrorToError(_:)(result);

    swift_willThrow(v9);
    return (id)swift_errorRelease(v8);
  }

  return result;
}

uint64_t sub_10000AF28()
{
  uint64_t v0 = type metadata accessor for URL(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = UUID.init()(v8);
  uint64_t v12 = UUID.uuidString.getter(v11);
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  if (qword_100050178 != -1) {
    swift_once(&qword_100050178, sub_10000AA8C);
  }
  sub_10000B084(v0, (uint64_t)qword_1000505A0);
  URL.appendingPathComponent(_:)(v12, v14);
  swift_bridgeObjectRelease(v14);
  URL.appendingPathExtension(_:)(0x656C646E7562LL, 0xE600000000000000LL);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t sub_10000B084(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000B09C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000B0DC()
{
  uint64_t v0 = Dictionary.init(dictionaryLiteral:)( &off_100049250,  &type metadata for Int,  &type metadata for String,  &protocol witness table for Int);
  uint64_t v1 = sub_10000B144(v0);
  swift_bridgeObjectRelease(v0);
  return v1;
}

uint64_t sub_10000B144(uint64_t a1)
{
  uint64_t v2 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6, v7);
  uint64_t v43 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8, v10);
  unint64_t v42 = (char *)&v41 - v11;
  uint64_t v53 = &_swiftEmptyDictionarySingleton;
  sub_10002059C(v49, a1);
  uint64_t v47 = v49[0];
  int64_t v48 = v51;
  unint64_t v12 = v52;
  uint64_t v41 = v50;
  uint64_t v45 = v49[1];
  int64_t v46 = (unint64_t)(v50 + 64) >> 6;
  for (uint64_t result = swift_bridgeObjectRetain(a1); ; uint64_t result = swift_bridgeObjectRelease(v23))
  {
    while (1)
    {
      if (v12)
      {
        unint64_t v14 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v15 = v14 | (v48 << 6);
      }

      else
      {
        int64_t v16 = v48 + 1;
        if (__OFADD__(v48, 1LL)) {
          goto LABEL_38;
        }
        if (v16 >= v46) {
          goto LABEL_36;
        }
        unint64_t v17 = *(void *)(v45 + 8 * v16);
        int64_t v18 = v48 + 1;
        if (!v17)
        {
          int64_t v18 = v48 + 2;
          if (v48 + 2 >= v46) {
            goto LABEL_36;
          }
          unint64_t v17 = *(void *)(v45 + 8 * v18);
          if (!v17)
          {
            int64_t v18 = v48 + 3;
            if (v48 + 3 >= v46) {
              goto LABEL_36;
            }
            unint64_t v17 = *(void *)(v45 + 8 * v18);
            if (!v17)
            {
              int64_t v18 = v48 + 4;
              if (v48 + 4 >= v46) {
                goto LABEL_36;
              }
              unint64_t v17 = *(void *)(v45 + 8 * v18);
              if (!v17)
              {
                int64_t v18 = v48 + 5;
                if (v48 + 5 >= v46) {
                  goto LABEL_36;
                }
                unint64_t v17 = *(void *)(v45 + 8 * v18);
                if (!v17)
                {
                  int64_t v19 = v48 + 6;
                  while (v19 < v46)
                  {
                    unint64_t v17 = *(void *)(v45 + 8 * v19++);
                    if (v17)
                    {
                      int64_t v18 = v19 - 1;
                      goto LABEL_19;
                    }
                  }

LABEL_36:
                  sub_10000B908(v47);
                  return (uint64_t)v53;
                }
              }
            }
          }
        }

uint64_t sub_10000B59C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *v3;
  if (*(void *)(*v3 + 24) > a1) {
    a1 = *(void *)(*v3 + 24);
  }
  sub_100006674(&qword_1000505C0);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)(v11, a1, a2);
  uint64_t v13 = result;
  if (*(void *)(v11 + 16))
  {
    unint64_t v38 = v3;
    int64_t v14 = 0LL;
    uint64_t v15 = *(void *)(v11 + 64);
    uint64_t v41 = (void *)(v11 + 64);
    uint64_t v16 = 1LL << *(_BYTE *)(v11 + 32);
    if (v16 < 64) {
      uint64_t v17 = ~(-1LL << v16);
    }
    else {
      uint64_t v17 = -1LL;
    }
    unint64_t v18 = v17 & v15;
    int64_t v40 = (unint64_t)(v16 + 63) >> 6;
    uint64_t v19 = result + 64;
    int v39 = a2;
    uint64_t v20 = 16LL;
    if ((a2 & 1) != 0) {
      uint64_t v20 = 32LL;
    }
    uint64_t v42 = v20;
    if (!v18) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v21 = __clz(__rbit64(v18));
    v18 &= v18 - 1;
    for (unint64_t i = v21 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v14 << 6))
    {
      uint64_t v26 = *(void *)(*(void *)(v11 + 48) + 8 * i);
      uint64_t v27 = *(void *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + v42))(v10, *(void *)(v11 + 56) + v27 * i, v6);
      uint64_t result = static Hasher._hash(seed:_:)(*(void *)(v13 + 40), v26);
      uint64_t v28 = -1LL << *(_BYTE *)(v13 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1LL << v29) & ~*(void *)(v19 + 8 * (v29 >> 6))) == 0)
      {
        char v32 = 0;
        unint64_t v33 = (unint64_t)(63 - v28) >> 6;
        while (++v30 != v33 || (v32 & 1) == 0)
        {
          BOOL v34 = v30 == v33;
          if (v30 == v33) {
            unint64_t v30 = 0LL;
          }
          v32 |= v34;
          uint64_t v35 = *(void *)(v19 + 8 * v30);
          if (v35 != -1)
          {
            unint64_t v31 = __clz(__rbit64(~v35)) + (v30 << 6);
            goto LABEL_32;
          }
        }

        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        return result;
      }

      unint64_t v31 = __clz(__rbit64((-1LL << v29) & ~*(void *)(v19 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_32:
      *(void *)(v19 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v31;
      *(void *)(*(void *)(v13 + 48) + 8 * v31) = v26;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))( *(void *)(v13 + 56) + v27 * v31,  v10,  v6);
      ++*(void *)(v13 + 16);
      if (v18) {
        goto LABEL_10;
      }
LABEL_11:
      int64_t v23 = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        goto LABEL_43;
      }
      if (v23 >= v40) {
        goto LABEL_34;
      }
      unint64_t v24 = v41[v23];
      ++v14;
      if (!v24)
      {
        int64_t v14 = v23 + 1;
        if (v23 + 1 >= v40) {
          goto LABEL_34;
        }
        unint64_t v24 = v41[v14];
        if (!v24)
        {
          int64_t v25 = v23 + 2;
          if (v25 >= v40)
          {
LABEL_34:
            if ((v39 & 1) == 0)
            {
              uint64_t result = swift_release(v11);
              uint64_t v3 = v38;
              goto LABEL_41;
            }

            uint64_t v36 = 1LL << *(_BYTE *)(v11 + 32);
            if (v36 >= 64) {
              sub_100020580(0LL, (unint64_t)(v36 + 63) >> 6, v41);
            }
            else {
              *uint64_t v41 = -1LL << v36;
            }
            uint64_t v3 = v38;
            *(void *)(v11 + 16) = 0LL;
            break;
          }

          unint64_t v24 = v41[v25];
          if (!v24)
          {
            while (1)
            {
              int64_t v14 = v25 + 1;
              if (__OFADD__(v25, 1LL)) {
                goto LABEL_44;
              }
              if (v14 >= v40) {
                goto LABEL_34;
              }
              unint64_t v24 = v41[v14];
              ++v25;
              if (v24) {
                goto LABEL_22;
              }
            }
          }

          int64_t v14 = v25;
        }
      }

LABEL_22:
      unint64_t v18 = (v24 - 1) & v24;
    }
  }

  uint64_t result = swift_release(v11);
LABEL_41:
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_10000B8C8(uint64_t a1)
{
  uint64_t v2 = sub_100006674(&qword_1000505B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000B908(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

BOOL sub_10000B910(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000B920(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_10000B944(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_10000B988(char *a1, char *a2)
{
  return sub_10000B910(*a1, *a2);
}

Swift::Int sub_10000B994()
{
  return sub_10000B944(*v0);
}

void sub_10000B99C(uint64_t a1)
{
}

Swift::Int sub_10000B9A4(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000B9F4()
{
  return [(id)objc_opt_self(AMSDefaults) devMode] ^ 1;
}

uint64_t sub_10000BA20(void *a1, void *a2, void *a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = v4;
  v204 = a4;
  id v181 = a3;
  id v180 = a2;
  id v207 = a1;
  uint64_t v6 = sub_100006674(&qword_100050688);
  uint64_t v199 = *(void *)(v6 - 8);
  uint64_t v200 = v6;
  __chkstk_darwin(v6, v7);
  sub_10000D574();
  uint64_t v198 = v8;
  uint64_t v9 = type metadata accessor for JetpackBundle.Resource(0LL);
  sub_10000D5BC(v9, (uint64_t)&v217);
  sub_10000D588(v10);
  __chkstk_darwin(v11, v12);
  sub_10000D574();
  sub_10000D598(v13);
  uint64_t v197 = sub_100006674(&qword_100050690);
  sub_10000D588(*(void *)(v197 - 8));
  __chkstk_darwin(v14, v15);
  sub_10000D574();
  sub_10000D598(v16);
  uint64_t v17 = sub_100006674(&qword_100050698);
  sub_10000D5BC(v17, (uint64_t)&v216);
  sub_10000D588(v18);
  __chkstk_darwin(v19, v20);
  sub_10000D574();
  sub_10000D598(v21);
  uint64_t v22 = sub_100006674(&qword_1000506A0);
  sub_10000D5BC(v22, (uint64_t)&v215);
  sub_10000D588(v23);
  __chkstk_darwin(v24, v25);
  sub_10000D574();
  sub_10000D598(v26);
  uint64_t v27 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  sub_10000D5BC(v27, (uint64_t)&v213);
  sub_10000D588(v28);
  __chkstk_darwin(v29, v30);
  sub_10000D574();
  sub_10000D598(v31);
  uint64_t v202 = sub_100006674(&qword_1000506A8);
  sub_10000D588(*(void *)(v202 - 8));
  __chkstk_darwin(v32, v33);
  sub_10000D574();
  sub_10000D598(v34);
  uint64_t v35 = sub_100006674(&qword_1000506B0);
  sub_10000D5BC(v35, (uint64_t)&v209);
  sub_10000D588(v36);
  __chkstk_darwin(v37, v38);
  sub_10000D574();
  sub_10000D598(v39);
  uint64_t v40 = sub_100006674(&qword_1000505B8);
  uint64_t v42 = __chkstk_darwin(v40, v41);
  uint64_t v44 = (char *)&v173 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v42, v45);
  uint64_t v47 = (char *)&v173 - v46;
  uint64_t v48 = type metadata accessor for URL(0LL);
  uint64_t v206 = *(void *)(v48 - 8);
  uint64_t v50 = __chkstk_darwin(v48, v49);
  uint64_t v203 = (uint64_t)&v173 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = __chkstk_darwin(v50, v52);
  v208 = (char *)&v173 - v54;
  uint64_t v188 = v55;
  __chkstk_darwin(v53, v56);
  v205 = (char *)&v173 - v57;
  uint64_t v58 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v58, v59);
  v61 = (char *)&v173 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v63 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v64 = swift_allocObject( v62,  ((*(unsigned __int8 *)(v63 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))
        + 3LL * *(void *)(v63 + 72),
          *(unsigned __int8 *)(v63 + 80) | 7LL);
  *(_OWORD *)(v64 + 16) = xmmword_10003BCD0;
  uint64_t v210 = type metadata accessor for JetpackLoader();
  v209 = v5;
  uint64_t v201 = (uint64_t)v5;
  uint64_t v65 = swift_retain(v5);
  id v66 = (id)AMSLogKey(v65);
  if (v66)
  {
    v67 = v66;
    uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
    uint64_t v70 = v69;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    uint64_t v71 = v210;
    v72 = sub_100007060(&v209, v210);
    uint64_t DynamicType = swift_getDynamicType(v72, v71, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    uint64_t v212 = DynamicType;
    sub_10000D5D4();
    sub_10000D5DC();
    v74._countAndFlagsBits = 5972026LL;
    v74._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v74);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v212 = v68;
    uint64_t v213 = v70;
    sub_10000D5D4();
    sub_10000D5DC();
    uint64_t v75 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    uint64_t v76 = v210;
    v77 = sub_100007060(&v209, v210);
    uint64_t v78 = swift_getDynamicType(v77, v76, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v78);
    uint64_t v212 = v78;
    sub_10000D5D4();
    sub_10000D358((uint64_t)&v212, (uint64_t *)&unk_1000509C0);
    uint64_t v75 = 58LL;
  }

  unint64_t v79 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v75);
  LogMessage.init(stringInterpolation:)(v61);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v209);
  LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x800000010003DB20LL);
  uint64_t v210 = v48;
  sub_10000D298(&v209);
  uint64_t v80 = v206;
  sub_10000D5B4(v81, (uint64_t)v207);
  static LogMessage.safe(_:)(&v209);
  sub_10000D358((uint64_t)&v209, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v64);
  swift_bridgeObjectRelease(v64);
  uint64_t v82 = sub_100007498(0LL, &qword_1000506B8, &OBJC_CLASS___JSVirtualMachine_ptr);
  uint64_t v83 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v82, v204, v82, v83);
  v84 = v209;
  v85 = v205;
  if (qword_100050170 != -1) {
    swift_once(&qword_100050170, sub_10000A9B4);
  }
  uint64_t v86 = sub_10000B084(v48, (uint64_t)qword_100050588);
  sub_10000D5B4((uint64_t)v47, v86);
  sub_100007438((uint64_t)v47, 0LL, 1LL, v48);
  int v87 = sub_10000748C((uint64_t)v47, 1LL, v48);
  v88 = v208;
  if (v87 == 1)
  {
    sub_10000D358((uint64_t)v47, &qword_1000505B8);
    sub_100006674(&qword_1000506C0);
    unint64_t v89 = sub_10000CFE0();
    uint64_t v90 = sub_10000D5C8((uint64_t)&type metadata for JetpackLoader.LoadError, v89);
    _BYTE *v91 = 0;
    uint64_t v92 = Promise.__allocating_init(error:)(v90);
  }

  else
  {
    v93 = *(void (**)(char *, char *, uint64_t))(v80 + 32);
    v93(v85, v47, v48);
    sub_10000AB88((uint64_t)v44);
    if (sub_10000748C((uint64_t)v44, 1LL, v48) == 1)
    {
      sub_10000D358((uint64_t)v44, &qword_1000505B8);
      sub_100006674(&qword_1000506C0);
      unint64_t v94 = sub_10000CFE0();
      uint64_t v95 = sub_10000D5C8((uint64_t)&type metadata for JetpackLoader.LoadError, v94);
      _BYTE *v96 = 1;
      uint64_t v92 = Promise.__allocating_init(error:)(v95);

      (*(void (**)(char *, uint64_t))(v80 + 8))(v85, v48);
    }

    else
    {
      v93(v88, v44, v48);
      uint64_t v97 = (uint64_t)v180;
      v174 = v84;
      uint64_t v98 = (uint64_t)v181;
      id v99 = sub_10002726C((uint64_t)v180, (uint64_t)v181);
      id v100 = sub_1000271E0(v97, v98);
      uint64_t v101 = v175;
      uint64_t v102 = (uint64_t)v207;
      static Pipeline.start<A>(with:)(v207, v48);
      v173 = (void (*)(uint64_t, uint64_t, uint64_t))v93;
      uint64_t v103 = v184;
      id v181 = v99;
      id v180 = v100;
      static PipelinePhase<>.fetchJetpack(artifactStoreURL:urlSession:urlEncoder:)(v85, v99, v100, v48);
      sub_10000D218( &qword_1000506D0,  &qword_1000506B0,  (uint64_t)&protocol conformance descriptor for PipelineEntryTask<A>);
      uint64_t v104 = v177;
      uint64_t v106 = PipelineTask.andThen<A>(_:)(v103, v177, v48, v105);
      v204 = *(void (**)(uint64_t, uint64_t))(v178 + 8);
      v204(v103, v202);
      (*(void (**)(uint64_t, uint64_t))(v176 + 8))(v101, v104);
      uint64_t v212 = v106;
      uint64_t v107 = v203;
      sub_10000D5B4(v203, v102);
      unint64_t v108 = sub_10000D060();
      AnyHashable.init<A>(_:)(v107, v48, v108);
      uint64_t v109 = sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
      uint64_t v110 = v182;
      uint64_t v111 = v179;
      uint64_t v112 = v183;
      (*(void (**)(uint64_t, void, uint64_t))(v182 + 104))( v179,  enum case for DispatchQoS.QoSClass.default(_:),  v183);
      uint64_t v178 = v109;
      v113 = (void *)static OS_dispatch_queue.global(qos:)(v111);
      (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v111, v112);
      static PipelinePhase<>.rateLimitOnFailure(on:withID:using:)(v113, &v209, sub_10000C900, 0LL, v48);

      sub_100009DC8((uint64_t)&v209);
      uint64_t v114 = sub_10000D5A4();
      sub_10000D218( &qword_1000506F0,  &qword_1000506E8,  (uint64_t)&protocol conformance descriptor for MapPipelineTask<A, B>);
      v115 = v85;
      uint64_t v117 = v116;
      uint64_t v118 = PipelineTask.andThen<A>(_:)(v103, v114, v48, v116);
      v204(v103, v202);
      swift_release(v212);
      v209 = (void *)v118;
      uint64_t v119 = sub_10000B0DC();
      LOBYTE(v103) = sub_10000B9F4();
      uint64_t v120 = type metadata accessor for JetpackBundle(0LL);
      uint64_t v121 = v185;
      static PipelinePhase<>.unpackJetpack(keyURLs:bundleOutputURL:artifactStoreURL:verifySignature:)( v119,  v208,  v115,  v103 & 1,  v120);
      swift_bridgeObjectRelease(v119);
      uint64_t v122 = PipelineTask.andThen<A>(_:)(v121, v114, v120, v117);
      (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v121, v187);
      sub_10000D5AC();
      v209 = (void *)v122;
      uint64_t v123 = v189;
      static PipelinePhase.cacheValueIfSuccessful()(v120, v120);
      uint64_t v124 = sub_100006674(&qword_1000506F8);
      sub_10000D218( &qword_100050700,  &qword_1000506F8,  (uint64_t)&protocol conformance descriptor for MapPipelineTask<A, B>);
      uint64_t v126 = PipelineTask.andThen<A>(_:)(v123, v124, v120, v125);
      v204 = (void (*)(uint64_t, uint64_t))v126;
      (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v123, v191);
      sub_10000D5AC();
      v209 = (void *)v126;
      uint64_t v127 = v193;
      uint64_t v128 = v192;
      uint64_t v129 = v196;
      (*(void (**)(uint64_t, void, uint64_t))(v193 + 104))( v192,  enum case for JetpackBundle.Resource.source(_:),  v196);
      uint64_t v130 = v195;
      static PipelinePhase<>.urlForResource(_:)(v128, v48);
      (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v128, v129);
      uint64_t v131 = sub_10000D5A4();
      sub_10000D218( &qword_100050710,  &qword_100050708,  (uint64_t)&protocol conformance descriptor for MapPipelineTask<A, B>);
      uint64_t v202 = v131;
      uint64_t v193 = v132;
      uint64_t v133 = PipelineTask.andThen<A>(_:)(v130, v131, v48, v132);
      v134 = *(void (**)(uint64_t, uint64_t))(v194 + 8);
      uint64_t v135 = v197;
      v134(v130, v197);
      v209 = (void *)v133;
      uint64_t v136 = v203;
      sub_10000D5B4(v203, (uint64_t)v207);
      uint64_t v137 = *(unsigned __int8 *)(v80 + 80);
      uint64_t v138 = (v137 + 16) & ~v137;
      unint64_t v139 = (v188 + v138 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v140 = swift_allocObject(&unk_1000496F0, v139 + 8, v137 | 7);
      v173(v140 + v138, v136, v48);
      v141 = v174;
      *(void *)(v140 + v139) = v174;
      id v207 = v141;
      uint64_t v142 = sub_10000D5A4();
      uint64_t v143 = sub_100006674(&qword_100050720);
      sub_10000D218( &qword_100050728,  &qword_100050718,  (uint64_t)&protocol conformance descriptor for MapPipelineTask<A, B>);
      uint64_t v145 = v144;
      uint64_t v203 = PipelineTask.mapTaskOutput<A>(_:)(sub_10000D114, v140, v142, v143, v144);
      sub_10000D5F4();
      sub_10000D5AC();
      v209 = v204;
      if (qword_100050180 != -1) {
        swift_once(&qword_100050180, sub_10000D180);
      }
      uint64_t v146 = sub_10000B084(v129, (uint64_t)qword_1000505C8);
      static PipelinePhase<>.urlForResource(_:)(v146, v48);
      uint64_t v147 = PipelineTask.andThen<A>(_:)(v130, v202, v48, v193);
      v134(v130, v135);
      v209 = (void *)v147;
      uint64_t v148 = PipelineTask.mapTaskOutput<A>(_:)(sub_10000CA98, 0LL, v142, &type metadata for Data, v145);
      swift_release(v147);
      v209 = (void *)v148;
      uint64_t v149 = sub_10000D5A4();
      uint64_t v150 = sub_100006674(&qword_100050270);
      sub_10000D5FC(&qword_100050738);
      uint64_t v152 = PipelineTask.mapTaskOutput<A>(_:)(sub_10000CAFC, 0LL, v149, v150, v151);
      sub_10000D5F4();
      v209 = (void *)v152;
      uint64_t v153 = v198;
      static PipelinePhase.cacheValueIfSuccessful()(v150, v150);
      uint64_t v154 = sub_10000D5A4();
      sub_10000D5FC(&qword_100050748);
      uint64_t v156 = PipelineTask.andThen<A>(_:)(v153, v154, v150, v155);
      sub_10000D5E8(v199);
      uint64_t v157 = sub_10000D5AC();
      uint64_t v158 = v203;
      uint64_t v159 = dispatch thunk of MapPipelineTask.run()(v157);
      dispatch thunk of MapPipelineTask.run()(v159);
      uint64_t v160 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      v161 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v162 = swift_allocObject(&unk_100049718, 24LL, 7LL);
      *(void *)(v162 + 16) = v160;
      id v163 = v161;
      swift_bridgeObjectRetain(v160);
      uint64_t v164 = sub_10000F2EC((uint64_t)sub_10000D210, v162, v163);
      swift_bridgeObjectRelease(v160);
      sub_10000D5F4();

      swift_release(v162);
      uint64_t v165 = sub_10000D5A4();
      sub_10000D218(&qword_100050758, &qword_100050750, (uint64_t)&protocol conformance descriptor for Promise<A>);
      uint64_t v167 = Promise.join<A>(with:)(v164, v165, v166);
      uint64_t v168 = swift_allocObject(&unk_100049740, 32LL, 7LL);
      uint64_t v169 = v201;
      *(void *)(v168 + 16) = sub_10000D254;
      *(void *)(v168 + 24) = v169;
      uint64_t v210 = type metadata accessor for SyncTaskScheduler(0LL);
      v211 = &protocol witness table for SyncTaskScheduler;
      sub_10000D298(&v209);
      uint64_t v170 = swift_retain(v169);
      SyncTaskScheduler.init()(v170);
      uint64_t v92 = Promise.map<A>(on:_:)(&v209, sub_10000D280, v168, &type metadata for JSSourcePackage);

      swift_release(v204);
      swift_release(v158);
      swift_release(v156);
      swift_release(v159);
      swift_release(v164);
      swift_release(v167);
      swift_release(v168);
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v209);
      v171 = *(void (**)(char *, uint64_t))(v206 + 8);
      v171(v208, v48);
      v171(v205, v48);
    }
  }

  return v92;
}

uint64_t sub_10000C900()
{
  return static JitterPipelineBackoff.forJavaScriptLoading.getter();
}

void *sub_10000C930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  uint64_t v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14, v17);
  uint64_t v19 = (char *)v25 - v18;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v21((char *)v25 - v18, a1, v12);
  v21(v16, a2, v12);
  sub_100007438((uint64_t)v11, 1LL, 1LL, v12);
  a4[3] = type metadata accessor for JSBytecodeSource(0LL);
  a4[4] = &protocol witness table for JSBytecodeSource;
  sub_10000D298(a4);
  id v22 = a3;
  uint64_t v23 = v25[1];
  uint64_t result = (void *)JSBytecodeSource.init(fileURL:sourceURL:cacheURL:virtualMachine:)(v19, v16, v11, v22);
  if (v23) {
    return sub_10000D388(a4);
  }
  return result;
}

uint64_t sub_10000CA98(uint64_t a1)
{
  uint64_t result = Data.init(contentsOf:options:)(a1, 1LL);
  uint64_t v4 = result;
  if (!v1)
  {
    uint64_t v5 = v3;
    sub_100006674(&qword_100050768);
    v6[0] = v4;
    v6[1] = v5;
    return Promise.__allocating_init(value:)(v6);
  }

  return result;
}

uint64_t sub_10000CAFC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100006674(&qword_100050760);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for JSONObject(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = *a1;
  unint64_t v14 = a1[1];
  sub_10000D314(v15, v14);
  uint64_t result = JSONObject.init(deserializing:)(v15, v14);
  if (!v2)
  {
    JSONObject.dictionary.getter(result);
    uint64_t v17 = type metadata accessor for JSONDictionary(0LL);
    if (sub_10000748C((uint64_t)v8, 1LL, v17) == 1)
    {
      sub_10000D358((uint64_t)v8, &qword_100050760);
    }

    else
    {
      uint64_t v18 = JSONDictionary.bridgedPrimitiveValues<A, B>()( &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8LL))(v8, v17);
      if (v18)
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
        *a2 = v18;
        return result;
      }
    }

    unint64_t v19 = sub_10000CFE0();
    uint64_t v20 = swift_allocError(&type metadata for JetpackLoader.LoadError, v19, 0LL, 0LL);
    *uint64_t v21 = 2;
    swift_willThrow(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }

  return result;
}

uint64_t sub_10000CCB8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_10003BCD0;
  uint64_t v37 = type metadata accessor for JetpackLoader();
  v36[0] = a3;
  uint64_t v15 = swift_retain(a3);
  id v16 = (id)AMSLogKey(v15);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v20 = v19;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v21._countAndFlagsBits = 0LL;
    v21._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t v22 = v37;
    uint64_t v23 = sub_100007060(v36, v37);
    uint64_t DynamicType = swift_getDynamicType(v23, v22, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v34[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_10000D358((uint64_t)v34, (uint64_t *)&unk_1000509C0);
    v25._countAndFlagsBits = 5972026LL;
    v25._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    uint64_t MetatypeMetadata = &type metadata for String;
    v34[0] = v18;
    v34[1] = v20;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_10000D358((uint64_t)v34, (uint64_t *)&unk_1000509C0);
    uint64_t v26 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v27._countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v37;
    uint64_t v29 = sub_100007060(v36, v37);
    uint64_t v30 = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v30);
    v34[0] = v30;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_10000D358((uint64_t)v34, (uint64_t *)&unk_1000509C0);
    uint64_t v26 = 58LL;
  }

  unint64_t v31 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
  LogMessage.init(stringInterpolation:)(v11);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v36);
  LogMessage.init(stringLiteral:)(0xD000000000000020LL, 0x800000010003DB40LL);
  uint64_t v32 = a1[3];
  sub_100007060(a1, v32);
  uint64_t v37 = v32;
  sub_10000D298(v36);
  (*(void (**)(void))(*(void *)(v32 - 8) + 16LL))();
  static LogMessage.safe(_:)(v36);
  sub_10000D358((uint64_t)v36, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v14);
  swift_bridgeObjectRelease(v14);
  sub_10000D2D0((uint64_t)a1, a4);
  *(void *)(a4 + 40) = a2;
  return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000CF90()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for JetpackLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService13JetpackLoader);
}

uint64_t sub_10000CFC0(void *a1, void *a2, void *a3, void (*a4)(uint64_t, uint64_t))
{
  return sub_10000BA20(a1, a2, a3, a4);
}

unint64_t sub_10000CFE0()
{
  unint64_t result = qword_1000506C8;
  if (!qword_1000506C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BE18, &type metadata for JetpackLoader.LoadError);
    atomic_store(result, (unint64_t *)&qword_1000506C8);
  }

  return result;
}

uint64_t sub_10000D01C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_10000D060()
{
  unint64_t result = qword_1000506D8;
  if (!qword_1000506D8)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_1000506D8);
  }

  return result;
}

uint64_t sub_10000D0A0()
{
  uint64_t v1 = type metadata accessor for URL(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void *sub_10000D114@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for URL(0LL) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_10000C930(a1, v2 + v6, *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8LL)), a2);
}

uint64_t sub_10000D180()
{
  uint64_t v0 = type metadata accessor for JetpackBundle.Resource(0LL);
  sub_10000B09C(v0, qword_1000505C8);
  uint64_t v1 = (_OWORD *)sub_10000B084(v0, (uint64_t)qword_1000505C8);
  _OWORD *v1 = xmmword_10003BD50;
  v1[1] = xmmword_10003BD60;
  return (*(uint64_t (**)(void))(*(void *)(v0 - 8) + 104LL))();
}

uint64_t sub_10000D1EC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000D210@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000F298(a1, (uint64_t *)(v2 + 16), a2);
}

void sub_10000D218(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = sub_10000D01C(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_10000870C();
}

uint64_t sub_10000D254@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000CCB8(a1, a2, v3, a3);
}

uint64_t sub_10000D25C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000D280(uint64_t a1)
{
  return sub_10000DC48(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

void sub_10000D298(void *a1)
{
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0) {
    *a1 = swift_allocBox();
  }
  sub_10000870C();
}

uint64_t sub_10000D2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D314(uint64_t result, unint64_t a2)
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

void sub_10000D358(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_100006674(a2);
  sub_10000D5E8(*(void *)(v2 - 8));
  sub_10000870C();
}

void *sub_10000D388(void *result)
{
  uint64_t v1 = *(void *)(result[3] - 8LL);
  if ((*(_DWORD *)(v1 + 80) & 0x20000) != 0) {
    return (void *)swift_slowDealloc( *result,  *(void *)(v1 + 64)
  }
                     + ((*(_DWORD *)(v1 + 80) + 16LL) & ~(unint64_t)*(_DWORD *)(v1 + 80)),
                       *(_DWORD *)(v1 + 80) | 7LL);
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for JetpackLoader.LoadError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for JetpackLoader.LoadError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for JetpackLoader.LoadError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_10000D4A0 + 4 * byte_10003BD75[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000D4D4 + 4 * byte_10003BD70[v4]))();
}

uint64_t sub_10000D4D4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D4DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000D4E4LL);
  }
  return result;
}

uint64_t sub_10000D4F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000D4F8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_10000D4FC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D504(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D510(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000D51C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for JetpackLoader.LoadError()
{
  return &type metadata for JetpackLoader.LoadError;
}

unint64_t sub_10000D538()
{
  unint64_t result = qword_100050770;
  if (!qword_100050770)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BDF0, &type metadata for JetpackLoader.LoadError);
    atomic_store(result, (unint64_t *)&qword_100050770);
  }

  return result;
}

  ;
}

void sub_10000D588(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

void sub_10000D598(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t sub_10000D5A4()
{
  return sub_100006674(v0);
}

uint64_t sub_10000D5AC()
{
  return swift_release(*(void *)(v0 - 160));
}

uint64_t sub_10000D5B4(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_10000D5BC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = result;
  return result;
}

uint64_t sub_10000D5C8(uint64_t a1, uint64_t a2)
{
  return swift_allocError(a1, a2, 0LL, 0LL);
}

uint64_t sub_10000D5D4()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 120);
}

void sub_10000D5DC()
{
}

uint64_t sub_10000D5E8@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_10000D5F4()
{
  return swift_release(v0);
}

void sub_10000D5FC(unint64_t *a1)
{
}

ValueMetadata *type metadata accessor for JetpackMetadata()
{
  return &type metadata for JetpackMetadata;
}

uint64_t sub_10000D618()
{
  return 1LL;
}

void sub_10000D620()
{
}

uint64_t sub_10000D644(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F6973726576LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6973726576LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

Swift::Int sub_10000D6C8()
{
  return Hasher._finalize()();
}

uint64_t sub_10000D708()
{
  return 0LL;
}

uint64_t sub_10000D714()
{
  return 0x6E6F6973726576LL;
}

Swift::Int sub_10000D738(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10000D778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000D644(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000D7A0()
{
  return sub_10000D708();
}

uint64_t sub_10000D7B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_10000D618();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000D7E0(uint64_t a1)
{
  unint64_t v2 = sub_10000DA54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D808(uint64_t a1)
{
  unint64_t v2 = sub_10000DA54();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D830(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_100050788);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100007060(a1, v9);
  unint64_t v11 = sub_10000DA54();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for JetpackMetadata.CodingKeys,  &type metadata for JetpackMetadata.CodingKeys,  v11,  v9,  v10);
  KeyedEncodingContainer.encode(_:forKey:)(a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

void *sub_10000D910(void *a1)
{
  uint64_t v3 = sub_100006674(&qword_100050778);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = sub_100007060(a1, v8);
  unint64_t v11 = sub_10000DA54();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for JetpackMetadata.CodingKeys,  &type metadata for JetpackMetadata.CodingKeys,  v11,  v8,  v9);
  if (!v1)
  {
    uint64_t v10 = (void *)KeyedDecodingContainer.decode(_:forKey:)(v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
  return v10;
}

void *sub_10000DA14@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10000D910(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000DA3C(void *a1)
{
  return sub_10000D830(a1, *v1);
}

unint64_t sub_10000DA54()
{
  unint64_t result = qword_100050780;
  if (!qword_100050780)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BF98, &type metadata for JetpackMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050780);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for JetpackMetadata.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for JetpackMetadata.CodingKeys(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10000DB24 + 4 * byte_10003BE60[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10000DB44 + 4 * byte_10003BE65[v4]))();
  }
}

_BYTE *sub_10000DB24(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10000DB44(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000DB4C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000DB54(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10000DB5C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10000DB64(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_10000DB70()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for JetpackMetadata.CodingKeys()
{
  return &type metadata for JetpackMetadata.CodingKeys;
}

unint64_t sub_10000DB8C()
{
  unint64_t result = qword_100050790;
  if (!qword_100050790)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BF70, &type metadata for JetpackMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050790);
  }

  return result;
}

unint64_t sub_10000DBCC()
{
  unint64_t result = qword_100050798;
  if (!qword_100050798)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BEE0, &type metadata for JetpackMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050798);
  }

  return result;
}

unint64_t sub_10000DC0C()
{
  unint64_t result = qword_1000507A0;
  if (!qword_1000507A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BF08, &type metadata for JetpackMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000507A0);
  }

  return result;
}

uint64_t sub_10000DC48(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  return a2(a1, *(void *)(a1 + 40));
}

uint64_t sub_10000DC78(uint64_t a1, void (*a2)(char *, char *, uint64_t), void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  id v199 = a3;
  uint64_t v198 = a2;
  uint64_t v219 = a1;
  uint64_t v7 = sub_100006674(&qword_100050688);
  uint64_t v214 = *(void *)(v7 - 8);
  uint64_t v215 = v7;
  __chkstk_darwin(v7, v8);
  sub_10000D574();
  uint64_t v213 = v9;
  uint64_t v10 = type metadata accessor for JetPackPath(0LL);
  uint64_t v211 = *(void *)(v10 - 8);
  uint64_t v212 = v10;
  __chkstk_darwin(v10, v11);
  sub_10000F6B8();
  sub_10000D598(v12);
  uint64_t v207 = v13;
  __chkstk_darwin(v14, v15);
  sub_10000D598((uint64_t)&v189 - v16);
  uint64_t v17 = sub_100006674(&qword_100050868);
  sub_10000D5BC(v17, (uint64_t)&v232);
  sub_10000D588(v18);
  __chkstk_darwin(v19, v20);
  sub_10000D574();
  sub_10000D598(v21);
  uint64_t v22 = sub_100006674(&qword_100050870);
  sub_10000D5BC(v22, (uint64_t)&v231);
  sub_10000D588(v23);
  __chkstk_darwin(v24, v25);
  sub_10000D574();
  sub_10000D598(v26);
  uint64_t v27 = sub_100006674(&qword_100050878);
  sub_10000D5BC(v27, (uint64_t)&v230);
  sub_10000D588(v28);
  __chkstk_darwin(v29, v30);
  sub_10000D574();
  sub_10000D598(v31);
  uint64_t v32 = sub_100006674(&qword_100050880);
  sub_10000D5BC(v32, (uint64_t)v228);
  sub_10000D588(v33);
  __chkstk_darwin(v34, v35);
  sub_10000D574();
  sub_10000D598(v36);
  uint64_t v37 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  sub_10000D5BC(v37, (uint64_t)v224);
  sub_10000D588(v38);
  __chkstk_darwin(v39, v40);
  sub_10000D574();
  sub_10000D598(v41);
  uint64_t v218 = sub_100006674(&qword_1000506A8);
  sub_10000D588(*(void *)(v218 - 8));
  __chkstk_darwin(v42, v43);
  sub_10000D574();
  sub_10000D598(v44);
  uint64_t v45 = sub_100006674(&qword_1000506B0);
  sub_10000D5BC(v45, (uint64_t)&v219);
  sub_10000D588(v46);
  __chkstk_darwin(v47, v48);
  sub_10000D574();
  sub_10000D598(v49);
  uint64_t v50 = sub_100006674(&qword_1000505B8);
  uint64_t v52 = __chkstk_darwin(v50, v51);
  uint64_t v217 = (char *)&v189 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v52, v54);
  uint64_t v56 = (char *)&v189 - v55;
  uint64_t v57 = sub_10000F6B0();
  uint64_t v222 = *(void *)(v57 - 8);
  __chkstk_darwin(v57, v58);
  sub_10000F6B8();
  sub_10000D598(v59);
  uint64_t v62 = __chkstk_darwin(v60, v61);
  v220 = (char *)&v189 - v63;
  uint64_t v190 = v64;
  __chkstk_darwin(v62, v65);
  v221 = (char *)&v189 - v66;
  uint64_t v67 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v67, v68);
  uint64_t v70 = (char *)&v189 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v71 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v72 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v73 = swift_allocObject( v71,  ((*(unsigned __int8 *)(v72 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80))
        + 3LL * *(void *)(v72 + 72),
          *(unsigned __int8 *)(v72 + 80) | 7LL);
  *(_OWORD *)(v73 + 16) = xmmword_10003BCD0;
  uint64_t v225 = type metadata accessor for JetpackV2Loader();
  v223 = v5;
  uint64_t v216 = (uint64_t)v5;
  uint64_t v74 = swift_retain(v5);
  id v75 = (id)AMSLogKey(v74);
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(v75);
    uint64_t v79 = v78;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    sub_10000F628();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10000F664(MetatypeMetadata);
    sub_10000F6D8();
    v81._countAndFlagsBits = 5972026LL;
    v81._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v81);
    v229 = &type metadata for String;
    v227[0] = v77;
    v227[1] = v79;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v227);
    sub_10000F6D8();
    uint64_t v82 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    sub_10000F628();
    uint64_t v83 = swift_getMetatypeMetadata();
    sub_10000F664(v83);
    sub_10000D358((uint64_t)v227, (uint64_t *)&unk_1000509C0);
    uint64_t v82 = 58LL;
  }

  unint64_t v84 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v82);
  LogMessage.init(stringInterpolation:)(v70);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v223);
  LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x800000010003DB20LL);
  uint64_t v225 = v57;
  sub_10000D298(&v223);
  uint64_t v85 = v222;
  sub_10000F684(v86, v219);
  static LogMessage.safe(_:)(&v223);
  sub_10000D358((uint64_t)&v223, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v73);
  uint64_t v87 = swift_bridgeObjectRelease(v73);
  uint64_t v88 = sub_1000090C0(v87, &qword_1000506B8, &OBJC_CLASS___JSVirtualMachine_ptr);
  uint64_t v89 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v88, a4, v88, v89);
  uint64_t v90 = v223;
  if (qword_100050170 != -1) {
    swift_once(&qword_100050170, sub_10000A9B4);
  }
  uint64_t v91 = sub_10000B084(v57, (uint64_t)qword_100050588);
  sub_10000F684((uint64_t)v56, v91);
  sub_100007438((uint64_t)v56, 0LL, 1LL, v57);
  int v92 = sub_10000748C((uint64_t)v56, 1LL, v57);
  uint64_t v94 = (uint64_t)v220;
  v93 = v221;
  if (v92 == 1)
  {
    sub_10000D358((uint64_t)v56, &qword_1000505B8);
    sub_100006674(&qword_1000506C0);
    unint64_t v95 = sub_10000F038();
    uint64_t v96 = sub_10000D5C8((uint64_t)&type metadata for JetpackV2Loader.LoadError, v95);
    *uint64_t v97 = 0;
    uint64_t v98 = Promise.__allocating_init(error:)(v96);
  }

  else
  {
    id v99 = *(void (**)(char *, char *, uint64_t))(v85 + 32);
    v99(v221, v56, v57);
    uint64_t v100 = (uint64_t)v217;
    sub_10000AB88((uint64_t)v217);
    if (sub_10000748C(v100, 1LL, v57) == 1)
    {
      sub_10000D358(v100, &qword_1000505B8);
      sub_100006674(&qword_1000506C0);
      unint64_t v101 = sub_10000F038();
      uint64_t v102 = sub_10000D5C8((uint64_t)&type metadata for JetpackV2Loader.LoadError, v101);
      *uint64_t v103 = 1;
      uint64_t v98 = Promise.__allocating_init(error:)(v102);

      (*(void (**)(char *, uint64_t))(v85 + 8))(v93, v57);
    }

    else
    {
      v99((char *)v94, (char *)v100, v57);
      uint64_t v189 = v90;
      uint64_t v104 = v198;
      uint64_t v105 = (uint64_t)v199;
      uint64_t v106 = (char *)sub_10002726C((uint64_t)v198, (uint64_t)v199);
      id v107 = sub_1000271E0((uint64_t)v104, v105);
      uint64_t v198 = v99;
      unint64_t v108 = v107;
      uint64_t v109 = v191;
      uint64_t v110 = v219;
      static Pipeline.start<A>(with:)(v219, v57);
      uint64_t v111 = v200;
      uint64_t v217 = v106;
      id v199 = v108;
      static PipelinePhase<>.fetchJetpack(artifactStoreURL:urlSession:urlEncoder:)(v93, v106, v108, v57);
      sub_10000D218( &qword_1000506D0,  &qword_1000506B0,  (uint64_t)&protocol conformance descriptor for PipelineEntryTask<A>);
      uint64_t v112 = v192;
      uint64_t v114 = PipelineTask.andThen<A>(_:)(v111, v192, v57, v113);
      sub_10000F64C();
      uint64_t v193 = v115;
      v115(v111, v218);
      sub_10000F64C();
      v116(v109, v112);
      v227[0] = v114;
      uint64_t v117 = v196;
      sub_10000F684(v196, v110);
      unint64_t v118 = sub_10000D060();
      uint64_t v119 = AnyHashable.init<A>(_:)(v117, v57, v118);
      uint64_t v120 = sub_1000090C0(v119, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
      uint64_t v121 = v195;
      uint64_t v122 = v194;
      uint64_t v123 = v197;
      (*(void (**)(uint64_t, void, uint64_t))(v195 + 104))( v194,  enum case for DispatchQoS.QoSClass.default(_:),  v197);
      uint64_t v219 = v120;
      uint64_t v124 = (void *)static OS_dispatch_queue.global(qos:)(v122);
      (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v122, v123);
      static PipelinePhase<>.rateLimitOnFailure(on:withID:using:)(v124, &v223, sub_10000C900, 0LL, v57);

      sub_100009DC8((uint64_t)&v223);
      uint64_t v125 = sub_10000D5A4();
      sub_10000F658(&qword_1000506F0);
      uint64_t v127 = v126;
      uint64_t v128 = PipelineTask.andThen<A>(_:)(v111, v125, v57, v126);
      v193(v111, v218);
      swift_release(v227[0]);
      v223 = (void *)v128;
      LOBYTE(v128) = sub_10000B9F4();
      sub_10000F684(v117, v94);
      uint64_t v129 = *(unsigned __int8 *)(v222 + 80);
      uint64_t v130 = (v129 + 16) & ~v129;
      uint64_t v131 = v130 + v190;
      uint64_t v132 = swift_allocObject(&unk_1000499D8, v130 + v190 + 1, v129 | 7);
      v198((char *)(v132 + v130), (char *)v117, v57);
      *(_BYTE *)(v132 + v131) = v128 & 1;
      uint64_t v133 = type metadata accessor for DiskJetPackResourceBundle(0LL);
      uint64_t v134 = v201;
      PipelinePhase.init(mapOutput:)(sub_10000F108, v132, v57, v133);
      uint64_t v135 = PipelineTask.andThen<A>(_:)(v134, v125, v133, v127);
      sub_10000F64C();
      sub_10000F67C(v134, v136);
      sub_10000D5AC();
      v223 = (void *)v135;
      uint64_t v137 = v203;
      static PipelinePhase.cacheValueIfSuccessful()(v133, v133);
      uint64_t v138 = sub_10000D5A4();
      sub_10000F658(&qword_100050898);
      uint64_t v140 = PipelineTask.andThen<A>(_:)(v137, v138, v133, v139);
      sub_10000F64C();
      sub_10000F67C(v137, v141);
      sub_10000D5AC();
      v223 = (void *)v140;
      uint64_t v142 = sub_10000F674((uint64_t)&unk_100049A00, 24LL);
      uint64_t v143 = v189;
      *(void *)(v142 + 16) = v189;
      id v205 = v143;
      uint64_t v144 = sub_100006674(&qword_100050720);
      uint64_t v145 = v206;
      PipelinePhase.init(mapOutput:)(sub_10000F160, v142, v133, v144);
      uint64_t v146 = sub_10000D5A4();
      sub_10000F658(&qword_1000508A8);
      uint64_t v203 = v146;
      uint64_t v202 = v147;
      uint64_t v204 = PipelineTask.andThen<A>(_:)(v145, v146, v144, v147);
      sub_10000F64C();
      sub_10000F67C(v145, v148);
      uint64_t v218 = v140;
      v223 = (void *)v140;
      if (qword_100050188 != -1) {
        swift_once(&qword_100050188, sub_10000F074);
      }
      uint64_t v149 = v212;
      uint64_t v150 = sub_10000B084(v212, (uint64_t)qword_1000507A8);
      uint64_t v151 = v211;
      uint64_t v152 = *(void (**)(uint64_t, uint64_t, uint64_t))(v211 + 16);
      uint64_t v153 = v209;
      v152(v209, v150, v149);
      unint64_t v154 = sub_10000F038();
      uint64_t v155 = sub_10000D5C8((uint64_t)&type metadata for JetpackV2Loader.LoadError, v154);
      *uint64_t v156 = 3;
      uint64_t v157 = v208;
      v152(v208, v153, v149);
      uint64_t v158 = *(unsigned __int8 *)(v151 + 80);
      uint64_t v159 = (v158 + 16) & ~v158;
      unint64_t v160 = (v207 + v159 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v161 = swift_allocObject(&unk_100049A28, v160 + 8, v158 | 7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v151 + 32))(v161 + v159, v157, v149);
      *(void *)(v161 + v160) = v155;
      swift_errorRetain(v155);
      uint64_t v162 = v210;
      PipelinePhase.init(mapOutput:)(sub_10000F1C0, v161, v133, &type metadata for Data);
      (*(void (**)(uint64_t, uint64_t))(v151 + 8))(v153, v149);
      swift_errorRelease(v155);
      uint64_t v163 = PipelineTask.andThen<A>(_:)(v162, v203, &type metadata for Data, v202);
      sub_10000F64C();
      sub_10000F67C(v162, v164);
      v223 = (void *)v163;
      uint64_t v165 = sub_10000D5A4();
      uint64_t v166 = sub_100006674(&qword_100050270);
      sub_10000F6CC(&qword_1000508B8);
      uint64_t v168 = PipelineTask.mapTaskOutput<A>(_:)(sub_10000EB64, 0LL, v165, v166, v167);
      sub_10000D5F4();
      v223 = (void *)v168;
      uint64_t v169 = v213;
      static PipelinePhase.cacheValueIfSuccessful()(v166, v166);
      uint64_t v170 = sub_10000D5A4();
      sub_10000F6CC(&qword_100050748);
      uint64_t v172 = PipelineTask.andThen<A>(_:)(v169, v170, v166, v171);
      sub_10000D5E8(v214);
      uint64_t v173 = sub_10000D5AC();
      uint64_t v174 = v204;
      uint64_t v175 = dispatch thunk of MapPipelineTask.run()(v173);
      dispatch thunk of MapPipelineTask.run()(v175);
      uint64_t v176 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      uint64_t v177 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v178 = sub_10000F674((uint64_t)&unk_100049A50, 24LL);
      *(void *)(v178 + 16) = v176;
      id v179 = v177;
      swift_bridgeObjectRetain(v176);
      uint64_t v180 = sub_10000F2EC((uint64_t)sub_10000D210, v178, v179);
      swift_bridgeObjectRelease(v176);
      sub_10000D5F4();

      swift_release(v178);
      uint64_t v181 = sub_10000D5A4();
      sub_10000D218(&qword_100050758, &qword_100050750, (uint64_t)&protocol conformance descriptor for Promise<A>);
      uint64_t v183 = Promise.join<A>(with:)(v180, v181, v182);
      uint64_t v184 = sub_10000F674((uint64_t)&unk_100049A78, 32LL);
      uint64_t v185 = v216;
      *(void *)(v184 + 16) = sub_10000F3CC;
      *(void *)(v184 + 24) = v185;
      uint64_t v225 = type metadata accessor for SyncTaskScheduler(0LL);
      v226 = &protocol witness table for SyncTaskScheduler;
      sub_10000D298(&v223);
      uint64_t v186 = swift_retain(v185);
      SyncTaskScheduler.init()(v186);
      uint64_t v98 = Promise.map<A>(on:_:)(&v223, sub_10000F3F8, v184, &type metadata for JSSourcePackage);

      swift_release(v218);
      swift_release(v174);
      swift_release(v172);
      swift_release(v175);
      swift_release(v180);
      swift_release(v183);
      swift_release(v184);
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v223);
      uint64_t v187 = *(void (**)(char *, uint64_t))(v222 + 8);
      v187(v220, v57);
      v187(v221, v57);
    }
  }

  return v98;
}

uint64_t sub_10000EB64@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100006674(&qword_100050760);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for JSONObject(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = *a1;
  unint64_t v14 = a1[1];
  sub_10000D314(v15, v14);
  uint64_t result = JSONObject.init(deserializing:)(v15, v14);
  if (!v2)
  {
    JSONObject.dictionary.getter(result);
    uint64_t v17 = type metadata accessor for JSONDictionary(0LL);
    if (sub_10000748C((uint64_t)v8, 1LL, v17) == 1)
    {
      sub_10000D358((uint64_t)v8, &qword_100050760);
    }

    else
    {
      uint64_t v18 = JSONDictionary.bridgedPrimitiveValues<A, B>()( &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
      (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8LL))(v8, v17);
      if (v18)
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
        *a2 = v18;
        return result;
      }
    }

    unint64_t v19 = sub_10000F038();
    uint64_t v20 = swift_allocError(&type metadata for JetpackV2Loader.LoadError, v19, 0LL, 0LL);
    *uint64_t v21 = 2;
    swift_willThrow(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }

  return result;
}

uint64_t sub_10000ED20@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_10003BCD0;
  uint64_t v37 = type metadata accessor for JetpackV2Loader();
  v36[0] = a3;
  uint64_t v15 = swift_retain(a3);
  id v16 = (id)AMSLogKey(v15);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v20 = v19;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v21._countAndFlagsBits = 0LL;
    v21._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t v22 = v37;
    uint64_t v23 = sub_100007060(v36, v37);
    uint64_t DynamicType = swift_getDynamicType(v23, v22, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v34[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_10000D358((uint64_t)v34, (uint64_t *)&unk_1000509C0);
    v25._countAndFlagsBits = 5972026LL;
    v25._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    uint64_t MetatypeMetadata = &type metadata for String;
    v34[0] = v18;
    v34[1] = v20;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_10000D358((uint64_t)v34, (uint64_t *)&unk_1000509C0);
    uint64_t v26 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v27._countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v37;
    uint64_t v29 = sub_100007060(v36, v37);
    uint64_t v30 = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v34[0] = v30;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_10000D358((uint64_t)v34, (uint64_t *)&unk_1000509C0);
    uint64_t v26 = 58LL;
  }

  unint64_t v31 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
  LogMessage.init(stringInterpolation:)(v11);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v36);
  LogMessage.init(stringLiteral:)(0xD000000000000020LL, 0x800000010003DB40LL);
  uint64_t v32 = a1[3];
  sub_100007060(a1, v32);
  uint64_t v37 = v32;
  sub_10000D298(v36);
  (*(void (**)(void))(*(void *)(v32 - 8) + 16LL))();
  static LogMessage.safe(_:)(v36);
  sub_10000D358((uint64_t)v36, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v14);
  swift_bridgeObjectRelease(v14);
  sub_10000D2D0((uint64_t)a1, a4);
  *(void *)(a4 + 40) = a2;
  return swift_bridgeObjectRetain(a2);
}

uint64_t type metadata accessor for JetpackV2Loader()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService15JetpackV2Loader);
}

uint64_t sub_10000F018(uint64_t a1, void (*a2)(char *, char *, uint64_t), void *a3, uint64_t a4)
{
  return sub_10000DC78(a1, a2, a3, a4);
}

unint64_t sub_10000F038()
{
  unint64_t result = qword_100050888;
  if (!qword_100050888)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C098, &type metadata for JetpackV2Loader.LoadError);
    atomic_store(result, (unint64_t *)&qword_100050888);
  }

  return result;
}

uint64_t sub_10000F074()
{
  uint64_t v0 = type metadata accessor for JetPackPath(0LL);
  sub_10000B09C(v0, qword_1000507A8);
  sub_10000B084(v0, (uint64_t)qword_1000507A8);
  return JetPackPath.init(_:)(0xD000000000000012LL, 0x800000010003DBB0LL);
}

uint64_t sub_10000F0D4()
{
  uint64_t v3 = v2 + 1;
  sub_10000F6A4(v4);
  return sub_10000F61C(v1, v3, v0);
}

uint64_t sub_10000F108(uint64_t a1)
{
  return sub_10002F82C(a1, v1 + v4, *(_BYTE *)(v1 + v4 + v3));
}

uint64_t sub_10000F13C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000F160(uint64_t a1)
{
  return sub_10002FABC(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000F178()
{
  unint64_t v3 = (v2 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_10000F6A4(v4);
  swift_errorRelease(*(void *)(v1 + v3));
  return sub_10000F61C(v1, v3 + 8, v0);
}

uint64_t sub_10000F1C0@<X0>(uint64_t *a1@<X8>)
{
  return sub_10002FA5C(v1 + v4, *(void *)(v1 + ((v3 + v4 + 7) & 0xFFFFFFFFFFFFF8LL)), a1);
}

uint64_t sub_10000F21C(uint64_t a1)
{
  uint64_t v2 = a1;
  return Promise.resolve(_:)(&v2);
}

uint64_t sub_10000F24C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  return swift_bridgeObjectRelease(v4);
}

uint64_t MetricsContext.overlay.getter(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000F298@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = MetricsContext.overlay.getter(a1, *a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000F2C0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000F2E4(uint64_t *a1)
{
  return sub_10000F21C(*a1);
}

uint64_t sub_10000F2EC(uint64_t a1, uint64_t a2, void *a3)
{
  v9[3] = sub_1000090C0(a1, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v9[4] = &protocol witness table for OS_dispatch_queue;
  v9[0] = a3;
  uint64_t v6 = Promise.__allocating_init()(a3);
  uint64_t v7 = (void *)sub_10000F674((uint64_t)&unk_100049AA0, 40LL);
  v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  swift_retain_n(v6, 2LL);
  swift_retain(a2);
  Promise.then(perform:orCatchError:on:)(sub_10000F424, v6, sub_10000F458, v7, v9);
  sub_10000D5F4();
  swift_release(v7);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v9);
  return v6;
}

uint64_t sub_10000F3CC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000ED20(a1, a2, v3, a3);
}

uint64_t sub_10000F3D4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000F3F8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(a1 + 40));
}

uint64_t sub_10000F424(uint64_t *a1)
{
  return sub_10000F2E4(a1);
}

uint64_t sub_10000F42C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000F458(uint64_t a1)
{
  return sub_10000F24C(a1, *(void *)(v1 + 16), *(void (**)(uint64_t *__return_ptr))(v1 + 24));
}

uint64_t getEnumTagSinglePayload for JetpackV2Loader.LoadError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for JetpackV2Loader.LoadError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000F538 + 4 * byte_10003BFF5[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000F56C + 4 * byte_10003BFF0[v4]))();
}

uint64_t sub_10000F56C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F574(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000F57CLL);
  }
  return result;
}

uint64_t sub_10000F588(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000F590LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10000F594(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F59C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JetpackV2Loader.LoadError()
{
  return &type metadata for JetpackV2Loader.LoadError;
}

unint64_t sub_10000F5BC()
{
  unint64_t result = qword_1000508C0;
  if (!qword_1000508C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C070, &type metadata for JetpackV2Loader.LoadError);
    atomic_store(result, (unint64_t *)&qword_1000508C0);
  }

  return result;
}

  ;
}

uint64_t sub_10000F61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

uint64_t sub_10000F628()
{
  uint64_t v1 = *(void *)(v0 - 136);
  int v2 = sub_100007060((void *)(v0 - 160), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

  ;
}

void sub_10000F658(unint64_t *a1)
{
}

uint64_t sub_10000F664(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 120) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 120);
}

uint64_t sub_10000F674(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_10000F67C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void)@<X8>)
{
  return a2(a1, *(void *)(v2 - 256));
}

uint64_t sub_10000F684(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

  ;
}

uint64_t sub_10000F6A4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v2 + v1);
}

uint64_t sub_10000F6B0()
{
  return type metadata accessor for URL(0LL);
}

  ;
}

void sub_10000F6CC(unint64_t *a1)
{
}

void sub_10000F6D8()
{
}

uint64_t sub_10000F6E4()
{
  uint64_t v1 = (uint64_t (**)(uint64_t, uint64_t))v0[4];
  sub_100007060(v0, v0[3]);
  if ((sub_10000FEBC(v1[1]) & 1) != 0) {
    return 0x73656E755469LL;
  }
  sub_10000FEE0();
  if ((sub_10000FEBC(v1[2]) & 1) != 0) {
    return 0x64756F6C4369LL;
  }
  sub_10000FEE0();
  if ((sub_10000FEBC(v1[3]) & 1) != 0) {
    return 1936548969LL;
  }
  else {
    return 0x6E776F6E6B6E75LL;
  }
}

id sub_10000F794(void *a1)
{
  uint64_t v4 = v1;
  unsigned int v6 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  id result = [v6 valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_29;
  }

  id v8 = result;
  sub_10000FE7C();
  id result = objc_msgSend(v6, "valueWithBool:inContext:", v3[4](v2, v3) & 1, a1);
  if (!result)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  sub_1000090C8();
  sub_10000FE7C();
  sub_10000FEAC(v3[5]);
  if (v9)
  {
    sub_10000FE9C();
    id v10 = sub_10000FE8C();
    id result = sub_10000FE6C((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17, v85);
    if (!result)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }

    sub_1000090C8();
  }

  sub_10000FE7C();
  sub_10000FEAC(v3[6]);
  if (v18)
  {
    sub_10000FE9C();
    id v19 = sub_10000FE8C();
    id result = sub_10000FE6C((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26, v85);
    if (!result)
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }

    sub_1000090C8();
  }

  sub_10000FE7C();
  Swift::String v27 = (void *)v3[7](v2, v3);
  if (v27)
  {
    uint64_t v28 = v27;
    id v29 = [v27 stringValue];

    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
    int v3 = v31;

    sub_10000FB50();
    uint64_t v87 = &type metadata for String;
    uint64_t v85 = v30;
    uint64_t v86 = v3;
    id v32 = a1;
    id result = sub_10002299C(&v85, a1);
    if (!result)
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }

    sub_1000090C8();
  }

  sub_10000FE7C();
  sub_10000FEAC(v3[8]);
  if (v33)
  {
    sub_10000FE9C();
    id v34 = sub_10000FE8C();
    id result = sub_10000FE6C((uint64_t)v34, v35, v36, v37, v38, v39, v40, v41, v85);
    if (!result)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }

    sub_1000090C8();
  }

  sub_10000FE7C();
  sub_10000FEAC(v3[9]);
  if (v42)
  {
    sub_10000FE9C();
    id v43 = sub_10000FE8C();
    id result = sub_10000FE6C((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50, v85);
    if (!result)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }

    sub_1000090C8();
  }

  sub_10000FE7C();
  sub_10000FEAC(v3[10]);
  if (v51)
  {
    sub_10000FE9C();
    id v52 = sub_10000FE8C();
    id result = sub_10000FE6C((uint64_t)v52, v53, v54, v55, v56, v57, v58, v59, v85);
    if (!result)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    sub_1000090C8();
  }

  unint64_t v60 = sub_10000FB50();
  uint64_t v61 = sub_10000F6E4();
  uint64_t v87 = &type metadata for String;
  uint64_t v85 = v61;
  uint64_t v86 = v62;
  id v63 = a1;
  id result = sub_10000FE6C((uint64_t)v63, v64, v65, v66, v67, v68, v69, v70, v85);
  if (!result) {
    goto LABEL_30;
  }
  sub_1000090C8();
  uint64_t v71 = v4[3];
  uint64_t v72 = v4[4];
  sub_100007060(v4, v71);
  uint64_t v73 = (*(uint64_t (**)(uint64_t, uint64_t))(v72 + 88))(v71, v72);
  if (!v74) {
    goto LABEL_25;
  }
  uint64_t v87 = &type metadata for String;
  uint64_t v85 = v73;
  uint64_t v86 = v74;
  id v75 = v63;
  id result = sub_10000FE6C((uint64_t)v75, v76, v77, v78, v79, v80, v81, v82, v85);
  if (result)
  {
    sub_1000090C8();
LABEL_25:
    sub_10000FEF0();
    char v83 = sub_10000FF00(*(uint64_t (**)(uint64_t, uint64_t))(v60 + 104));
    id result = sub_10000FECC(v83);
    if (result)
    {
      sub_1000090C8();
      sub_10000FEF0();
      char v84 = sub_10000FF00(*(uint64_t (**)(uint64_t, uint64_t))(v60 + 112));
      id result = sub_10000FECC(v84);
      if (result)
      {
        sub_1000090C8();
        return v8;
      }

      goto LABEL_32;
    }

LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_10000FB50()
{
  unint64_t result = qword_100050290;
  if (!qword_100050290)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___JSValue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100050290);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for JSAccount(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t initializeWithCopy for JSAccount(uint64_t a1, uint64_t a2)
{
  __int128 v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

void *assignWithCopy for JSAccount(void *a1, void *a2)
{
  return a1;
}

void *sub_10000FC1C(void *result, void *a2)
{
  if (result != a2)
  {
    __int128 v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        unint64_t result = (void *)swift_release(v11);
        *__int128 v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *__int128 v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *__int128 v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

__n128 initializeWithTake for JSAccount(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for JSAccount(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSAccount(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for JSAccount(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JSAccount()
{
  return &type metadata for JSAccount;
}

id sub_10000FE6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_10002299C(&a9, v9);
}

void *sub_10000FE7C()
{
  return sub_100007060(v0, v0[3]);
}

id sub_10000FE8C()
{
  return v0;
}

unint64_t sub_10000FE9C()
{
  return sub_10000FB50();
}

uint64_t sub_10000FEAC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_10000FEBC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

id sub_10000FECC(char a1)
{
  return objc_msgSend(v1, *(SEL *)(v3 + 3088), a1 & 1, v2);
}

void *sub_10000FEE0()
{
  return sub_100007060(v0, v0[3]);
}

void *sub_10000FEF0()
{
  return sub_100007060(v0, v0[3]);
}

uint64_t sub_10000FF00@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

id sub_10000FF10(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_dynamicAccountsStore] = a1;
  *(void *)&v2[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_clientInfo] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for JSAccountObject();
  return objc_msgSendSuper2(&v4, "init");
}

void sub_10000FF88()
{
  uint64_t v0 = DynamicAccountsStore.account.getter();
  sub_1000117FC((uint64_t)v0);
  sub_1000117E8();
  sub_10000870C();
}

void sub_10000FFE8()
{
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___ACAccountStore);
  id v2 =  [*(id *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_clientInfo) accountMediaType];
  id v3 = objc_msgSend(v1, "ams_sharedAccountStoreForMediaType:", v2);
  sub_1000117E0();
  id v4 = objc_msgSend(v1, "ams_localiTunesAccount");
  sub_1000117E8();
  sub_1000113AC((uint64_t)v2);
  sub_1000117E0();
  sub_10000870C();
}

void sub_1000100AC()
{
}

void sub_1000100E8()
{
}

void sub_10001010C()
{
}

void sub_100010148()
{
}

void sub_100010184()
{
}

void sub_100010190(uint64_t a1)
{
  id v2 = objc_msgSend((id)objc_opt_self(ACAccountStore), "ams_sharedAccountStore");
  id v3 = sub_1000117F0(v2);
  sub_1000117E0();
  sub_1000113AC(a1);
  sub_1000117E8();
  sub_10000870C();
}

void sub_100010218()
{
}

void sub_10001023C()
{
}

void sub_100010248()
{
  id v0 = objc_msgSend((id)objc_opt_self(ACAccountStore), "ams_sharedAccountStore");
  id v1 = sub_1000117F0(v0);
  sub_1000117E0();
  sub_10000870C();
}

uint64_t sub_100010294(uint64_t a1, uint64_t a2)
{
  void v6[2] = a1;
  v6[3] = a2;
  uint64_t v7 = v2;
  JSContext.propagateErrorsToExceptions(_:)(sub_1000115D4, v6);
  sub_1000117E0();
  return v2;
}

void *sub_10001030C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v33 = a1;
  uint64_t v7 = type metadata accessor for JSPromise(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (void *)type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v13 = static RunLoopWorkerThread.current.getter();
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v29 = v7;
    uint64_t v30 = a4;
    uint64_t v28 = v8;
    sub_10001010C();
    uint64_t v12 = v15;
    sub_10001023C();
    uint64_t v17 = v16;
    id v18 = objc_msgSend((id)objc_opt_self(ACAccountStore), "ams_sharedAccountStore");
    __src[3] = sub_100007498(0LL, &qword_100050908, &OBJC_CLASS___ACAccountStore_ptr);
    __src[4] = &off_100049398;
    __src[0] = v18;
    sub_100010594(a3, v12, v17, __src, (uint64_t)v32);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(__src);
    if (v4)
    {
      swift_release(v14);
    }

    else
    {

      sub_1000115F0((uint64_t)v32, (uint64_t)__src);
      uint64_t v22 = (void *)swift_allocObject(&unk_100049C60, 104LL, 7LL);
      memcpy(v22 + 2, __src, 0x42uLL);
      uint64_t v23 = v30;
      v22[11] = v30;
      v22[12] = v14;
      id v24 = v33;
      id v25 = v23;
      swift_retain(v14);
      uint64_t v26 = JSPromise.init(in:executor:)(v24, sub_100011668, v22);
      uint64_t v12 = (void *)JSPromise.value.getter(v26);
      swift_release(v14);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
      sub_100011684(v32);
    }
  }

  else
  {
    uint64_t v19 = type metadata accessor for JSError(0LL);
    unint64_t v20 = sub_100009214();
    swift_allocError(v19, v20, 0LL, 0LL);
    uint64_t v21 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v21);
  }

  return v12;
}

void sub_100010594(void *a1@<X1>, void *a2@<X2>, void *a3@<X3>, void *a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  uint64_t v13 = __chkstk_darwin(v11, v12);
  uint64_t v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = JSValue.string.getter(v13);
  uint64_t v103 = v17;
  if (!v17)
  {
    uint64_t v37 = type metadata accessor for JSError(0LL);
    unint64_t v38 = sub_100009214();
    swift_allocError(v37, v38, 0LL, 0LL);
    unint64_t v39 = 0xD00000000000001BLL;
    unint64_t v40 = 0x800000010003DD80LL;
    uint64_t v41 = v16;
    goto LABEL_5;
  }

  id v95 = a1;
  uint64_t v86 = a2;
  uint64_t v85 = a3;
  uint64_t v18 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v19 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v20 = *(void *)(v19 + 72);
  uint64_t v21 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = (v21 + 32) & ~v21;
  uint64_t v96 = v20;
  uint64_t v88 = v22 + 3 * v20;
  uint64_t v89 = v18;
  uint64_t v87 = v21 | 7;
  uint64_t v23 = swift_allocObject(v18, v88, v21 | 7);
  __int128 v94 = xmmword_10003BCD0;
  *(_OWORD *)(v23 + 16) = xmmword_10003BCD0;
  v93 = (void *)sub_100006674(&qword_100050918);
  uint64_t v98 = v93;
  v97[0] = &type metadata for AccountObjectHelper;
  id v24 = (id)AMSLogKey(v93);
  uint64_t v91 = a5;
  uint64_t v92 = v5;
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    uint64_t v90 = v22;
    uint64_t v27 = v26;
    uint64_t v28 = v16;
    uint64_t v30 = v29;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v31._countAndFlagsBits = 0LL;
    v31._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v31);
    id v32 = v98;
    id v33 = sub_100007060(v97, (uint64_t)v98);
    uint64_t DynamicType = swift_getDynamicType(v33, v32, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v100 = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v100);
    sub_100008D04((uint64_t)&v100);
    v35._countAndFlagsBits = 5972026LL;
    v35._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v35);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v100 = v27;
    uint64_t v101 = v30;
    uint64_t v16 = v28;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v100);
    sub_100008D04((uint64_t)&v100);
    uint64_t v36 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v43._countAndFlagsBits = 0LL;
    v43._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v43);
    uint64_t v44 = v98;
    uint64_t v45 = sub_100007060(v97, (uint64_t)v98);
    uint64_t v46 = swift_getDynamicType(v45, v44, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v100 = v46;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v100);
    sub_100008D04((uint64_t)&v100);
    uint64_t v36 = 58LL;
  }

  uint64_t v47 = v96;
  unint64_t v48 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v36);
  LogMessage.init(stringInterpolation:)(v15);
  uint64_t v49 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v97);
  LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010003DDA0LL);
  uint64_t v98 = &type metadata for String;
  v97[0] = v16;
  v97[1] = v103;
  swift_bridgeObjectRetain(v103);
  static LogMessage.safe(_:)(v97);
  sub_100008D04((uint64_t)v97);
  uint64_t v90 = v49;
  sub_10002C300(v23);
  swift_bridgeObjectRelease(v23);
  uint64_t v50 = a4[3];
  uint64_t v51 = a4[4];
  sub_100007060(a4, v50);
  uint64_t v52 = (*(uint64_t (**)(id, uint64_t, uint64_t))(v51 + 8))(v95, v50, v51);
  uint64_t v53 = (void *)v52;
  if (!v52)
  {
    uint64_t v55 = v86;
    if (v86 || (uint64_t v55 = v85) != 0LL)
    {
      id v54 = v55;
      goto LABEL_12;
    }

    swift_bridgeObjectRelease(v103);
    uint64_t v82 = type metadata accessor for JSError(0LL);
    unint64_t v83 = sub_100009214();
    swift_allocError(v82, v83, 0LL, 0LL);
    unint64_t v39 = 0xD000000000000010LL;
    unint64_t v40 = 0x800000010003DDC0LL;
    uint64_t v41 = 0LL;
LABEL_5:
    uint64_t v42 = JSError.init(message:line:column:sourceURL:constructorName:)(v39, v40, 0LL, 1LL, 0LL, 1LL, v41, 0LL);
    swift_willThrow(v42);
    return;
  }

  id v54 = (id)v52;
LABEL_12:
  uint64_t v56 = v89;
  uint64_t v89 = 2 * v47;
  uint64_t v57 = swift_allocObject(v56, v88, v87);
  *(_OWORD *)(v57 + 16) = v94;
  uint64_t v98 = v93;
  v97[0] = &type metadata for AccountObjectHelper;
  id v58 = v53;
  id v59 = (id)AMSLogKey(v58);
  id v95 = v58;
  if (v59)
  {
    unint64_t v60 = v59;
    uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
    uint64_t v62 = v16;
    uint64_t v64 = v63;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v65._countAndFlagsBits = 0LL;
    v65._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v65);
    uint64_t v66 = v98;
    uint64_t v67 = sub_100007060(v97, (uint64_t)v98);
    uint64_t v68 = swift_getDynamicType(v67, v66, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v100 = v68;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v100);
    sub_100008D04((uint64_t)&v100);
    v69._countAndFlagsBits = 5972026LL;
    v69._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v69);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v100 = v61;
    uint64_t v101 = v64;
    uint64_t v16 = v62;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v100);
    sub_100008D04((uint64_t)&v100);
    uint64_t v70 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v71._countAndFlagsBits = 0LL;
    v71._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v71);
    uint64_t v72 = v98;
    uint64_t v73 = sub_100007060(v97, (uint64_t)v98);
    uint64_t v74 = swift_getDynamicType(v73, v72, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    uint64_t v100 = v74;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v100);
    sub_100008D04((uint64_t)&v100);
    uint64_t v70 = 58LL;
  }

  uint64_t v75 = v91;
  unint64_t v76 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v70);
  LogMessage.init(stringInterpolation:)(v15);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v97);
  LogMessage.init(stringLiteral:)(0x6363612068746977LL, 0xED00003A746E756FLL);
  uint64_t v77 = (void *)sub_100007498(0LL, (unint64_t *)&qword_1000503B0, &OBJC_CLASS___ACAccount_ptr);
  uint64_t v98 = v77;
  v97[0] = v54;
  id v78 = v54;
  static LogMessage.sensitive(_:)(v97);
  sub_100008D04((uint64_t)v97);
  sub_10002C300(v57);
  swift_bridgeObjectRelease(v57);
  uint64_t v79 = (void *)objc_opt_self(&OBJC_CLASS___AMSAcknowledgePrivacyTask);
  uint64_t v80 = v103;
  NSString v81 = String._bridgeToObjectiveC()();
  LOBYTE(v79) = [v79 acknowledgementNeededForPrivacyIdentifier:v81 account:v78];

  uint64_t v98 = v77;
  id v99 = &off_1000493B0;
  v97[0] = v78;
  sub_100011994(v97, v16, v80, (char)v79, v75);
}

uint64_t sub_100010C64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v24 = a6;
  uint64_t v10 = type metadata accessor for JSCallable(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10, v13);
  uint64_t v14 = (char *)&v25[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100006674(&qword_100050910);
  sub_1000115F0(a4, (uint64_t)v25);
  uint64_t v15 = Promise.__allocating_init(value:)(v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a2, v10);
  uint64_t v16 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v17 = (v16 + 24) & ~v16;
  unint64_t v18 = (v12 + v17 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v19 = swift_allocObject(&unk_100049C88, v18 + 8, v16 | 7);
  *(void *)(v19 + 16) = a5;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v19 + v17, v14, v10);
  *(void *)(v19 + v18) = a1;
  v25[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v25[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v20 = v24;
  v25[0] = v24;
  id v21 = a5;
  id v22 = a1;
  swift_retain(v20);
  Promise.then(perform:orCatchError:on:)(sub_100011748, v19, nullsub_1, 0LL, v25);
  swift_release(v15);
  swift_release(v19);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v25);
}

void sub_100010DE4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = a4;
  uint64_t v7 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v12 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v39 = v14 | 7;
  uint64_t v40 = ((v14 + 32) & ~v14) + 3 * v13;
  uint64_t v15 = swift_allocObject(v11, v40, v14 | 7);
  __int128 v38 = xmmword_10003BCD0;
  *(_OWORD *)(v15 + 16) = xmmword_10003BCD0;
  uint64_t v37 = (ValueMetadata *)type metadata accessor for JSAccountObject();
  uint64_t v47 = v37;
  v46[0] = a2;
  id v36 = a2;
  id v16 = (id)AMSLogKey(v36);
  uint64_t v43 = a3;
  uint64_t v41 = v11;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v20 = v19;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v21._countAndFlagsBits = 0LL;
    v21._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    id v22 = v47;
    uint64_t v23 = sub_100007060(v46, (uint64_t)v47);
    uint64_t DynamicType = swift_getDynamicType(v23, v22, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v44[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v44);
    sub_100008D04((uint64_t)v44);
    v25._countAndFlagsBits = 5972026LL;
    v25._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    uint64_t MetatypeMetadata = &type metadata for String;
    v44[0] = v18;
    v44[1] = v20;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v44);
    sub_100008D04((uint64_t)v44);
    uint64_t v26 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v27._countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v47;
    uint64_t v29 = sub_100007060(v46, (uint64_t)v47);
    uint64_t v30 = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v44[0] = v30;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v44);
    sub_100008D04((uint64_t)v44);
    uint64_t v26 = 58LL;
  }

  unint64_t v31 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
  LogMessage.init(stringInterpolation:)(v10);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v46);
  LogMessage.init(stringLiteral:)(0xD00000000000002ELL, 0x800000010003DD10LL);
  uint64_t v47 = &type metadata for JSAccountPrivacyAcknowledgementState;
  v46[0] = swift_allocObject(&unk_100049CB0, 82LL, 7LL);
  sub_1000115F0(a1, v46[0] + 16LL);
  static LogMessage.safe(_:)(v46);
  sub_100008D04((uint64_t)v46);
  sub_10002C300(v15);
  swift_bridgeObjectRelease(v15);
  uint64_t v32 = sub_100006674(&qword_1000509E0);
  uint64_t v33 = swift_allocObject(v32, 64LL, 7LL);
  *(_OWORD *)(v33 + 16) = xmmword_10003BAE0;
  id v34 = sub_100011804(v42);
  *(void *)(v33 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v33 + 32) = v34;
  Swift::String v35 = (void *)JSCallable.call(_:)(v33);
  swift_bridgeObjectRelease(v33);
}

uint64_t sub_1000113AC(uint64_t a1)
{
  v3[2] = a1;
  JSContext.propagateErrorsToExceptions(_:)(sub_100011588, v3);
  sub_1000117E0();
  return a1;
}

id sub_100011410(void *a1, void *a2)
{
  if (a2)
  {
    v7[3] = sub_100007498(0LL, (unint64_t *)&qword_1000503B0, &OBJC_CLASS___ACAccount_ptr);
    v7[4] = &off_1000493B0;
    v7[0] = a2;
    id v4 = a2;
    id v5 = sub_10000F794(a1);
    sub_1000115A0(v7);
    return v5;
  }

  id result = [(id)objc_opt_self(JSValue) valueWithUndefinedInContext:a1];
  id v5 = result;
  if (result) {
    return v5;
  }
  __break(1u);
  return result;
}

void sub_1000114C8()
{
}

id sub_100011500()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAccountObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSAccountObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService15JSAccountObject);
}

id sub_100011588(void *a1)
{
  return sub_100011410(a1, *(void **)(v1 + 16));
}

void *sub_1000115A0(void *a1)
{
  return a1;
}

void *sub_1000115D4(void *a1)
{
  return sub_10001030C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1000115F0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001162C()
{
  swift_release(*(void *)(v0 + 96));
  return swift_deallocObject(v0, 104LL, 7LL);
}

uint64_t sub_100011668(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100010C64(a1, a2, a3, v3 + 16, *(void **)(v3 + 88), *(void *)(v3 + 96));
}

void *sub_100011684(void *a1)
{
  return a1;
}

uint64_t sub_1000116B8()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100011748(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSCallable(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_100010DE4( a1,  *(void **)(v1 + 16),  v1 + v4,  *(void **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_10001179C()
{
  return swift_deallocObject(v0, 82LL, 7LL);
}

ValueMetadata *type metadata accessor for AccountObjectHelper()
{
  return &type metadata for AccountObjectHelper;
}

void sub_1000117E0()
{
}

void sub_1000117E8()
{
}

id sub_1000117F0(void *a1)
{
  return [a1 *v1];
}

uint64_t sub_1000117FC(uint64_t a1)
{
  return sub_1000113AC(a1);
}

id sub_100011804(void *a1)
{
  uint64_t v3 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  id result = [v3 valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }

  id v5 = result;
  sub_10000F794(a1);
  sub_1000090C8();
  sub_10000FB50();
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 48);
  uint64_t v11 = &type metadata for String;
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  swift_bridgeObjectRetain(v6);
  id v8 = a1;
  id result = sub_10002299C(&v9, a1);
  if (!result)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  sub_1000090C8();
  if ((*(_BYTE *)(v1 + 64) & 1) != 0) {
    goto LABEL_6;
  }
  id result = objc_msgSend(v3, "valueWithDouble:inContext:", v8, (double)*(uint64_t *)(v1 + 56), v9, v10);
  if (result)
  {
    sub_1000090C8();
LABEL_6:
    id result = objc_msgSend(v3, "valueWithBool:inContext:", *(unsigned __int8 *)(v1 + 65), v8, v9, v10);
    if (result)
    {
      sub_1000090C8();
      return v5;
    }

    goto LABEL_10;
  }

LABEL_11:
  __break(1u);
  return result;
}

  if (v1 < 0) {
    uint64_t v7 = v1;
  }
  else {
    uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v1);
  id v5 = _CocoaArrayWrapper.endIndex.getter(v7);
  swift_bridgeObjectRelease(v1);
  if (!v5) {
    goto LABEL_31;
  }
LABEL_15:
  id v8 = 0LL;
  uint64_t v9 = (char *)(v4 + 7);
  uint64_t v29 = v1;
  uint64_t v30 = v1 & 0xC000000000000001LL;
  uint64_t v26 = v1 + 32;
  Swift::String v27 = v1 & 0xFFFFFFFFFFFFFF8LL;
  uint64_t v28 = v5;
  while (1)
  {
    if (v30)
    {
      uint64_t v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v1);
    }

    else
    {
      if (v8 >= *(void *)(v27 + 16)) {
        goto LABEL_34;
      }
      uint64_t v10 = *(id *)(v26 + 8 * v8);
    }

    uint64_t v11 = v10;
    uint64_t v12 = __OFADD__(v8++, 1LL);
    if (v12) {
      break;
    }
    uint64_t v13 = NSObject._rawHashValue(seed:)(v4[5]);
    uint64_t v14 = -1LL << *((_BYTE *)v4 + 32);
    uint64_t v15 = v13 & ~v14;
    id v16 = v15 >> 6;
    uint64_t v17 = *(void *)&v9[8 * (v15 >> 6)];
    uint64_t v18 = 1LL << v15;
    if (((1LL << v15) & v17) != 0)
    {
      sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
      uint64_t v19 = *(id *)(v4[6] + 8 * v15);
      uint64_t v20 = static NSObject.== infix(_:_:)(v19, v11);

      if ((v20 & 1) != 0)
      {
LABEL_26:

        id v5 = v28;
        uint64_t v1 = v29;
        goto LABEL_30;
      }

      Swift::String v21 = ~v14;
      while (1)
      {
        uint64_t v15 = (v15 + 1) & v21;
        id v16 = v15 >> 6;
        uint64_t v17 = *(void *)&v9[8 * (v15 >> 6)];
        uint64_t v18 = 1LL << v15;
        if ((v17 & (1LL << v15)) == 0) {
          break;
        }
        id v22 = *(id *)(v4[6] + 8 * v15);
        uint64_t v23 = static NSObject.== infix(_:_:)(v22, v11);

        if ((v23 & 1) != 0) {
          goto LABEL_26;
        }
      }

      id v5 = v28;
      uint64_t v1 = v29;
    }

    *(void *)&v9[8 * v16] = v18 | v17;
    *(void *)(v4[6] + 8 * v15) = v11;
    uint64_t v24 = v4[2];
    uint64_t v12 = __OFADD__(v24, 1LL);
    Swift::String v25 = v24 + 1;
    if (v12) {
      goto LABEL_33;
    }
    v4[2] = v25;
LABEL_30:
    if (v8 == v5) {
      goto LABEL_31;
    }
  }

  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
}

  __break(1u);
  return result;
}

  uint64_t v45 = 0;
LABEL_12:
  sub_100038DF0((uint64_t)v9);
  sub_100038DF0((uint64_t)v13);
  return v45 & 1;
}

uint64_t sub_100011994@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_100007060(a1, v10);
  id v12 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 96))(v10, v11);
  if (!v12) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain(a3);
  sub_1000275A8(a2, a3, (uint64_t)v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(v12);
  if (!v14)
  {
    id v12 = 0LL;
LABEL_5:
    char v15 = 1;
    goto LABEL_6;
  }

  id v12 = [v14 integerValue];

  char v15 = 0;
LABEL_6:
  sub_10000D2D0((uint64_t)a1, a5);
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = v12;
  *(_BYTE *)(a5 + 64) = v15;
  *(_BYTE *)(a5 + 65) = a4 & 1;
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
}

uint64_t destroy for JSAccountPrivacyAcknowledgementState(void *a1)
{
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t initializeWithCopy for JSAccountPrivacyAcknowledgementState(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for JSAccountPrivacyAcknowledgementState(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 48);
  uint64_t v5 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(void *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

void *initializeWithTake for JSAccountPrivacyAcknowledgementState(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x42uLL);
}

uint64_t assignWithTake for JSAccountPrivacyAcknowledgementState(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSAccountPrivacyAcknowledgementState(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 66))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for JSAccountPrivacyAcknowledgementState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 66) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 66) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JSAccountPrivacyAcknowledgementState()
{
  return &type metadata for JSAccountPrivacyAcknowledgementState;
}

uint64_t sub_100011C70(uint64_t a1)
{
  uint64_t v1 = (void *)static JSContext.requiredCurrent.getter();
  uint64_t v2 = JSContext.propagateErrorsToExceptions(_:)(sub_100011CC4, 0LL);

  return v2;
}

uint64_t sub_100011CC4()
{
  uint64_t v0 = static RunLoopWorkerThread.current.getter();
  uint64_t v1 = type metadata accessor for JSError(0LL);
  unint64_t v2 = sub_100009214();
  swift_allocError(v1, v2, 0LL, 0LL);
  if (v0)
  {
    uint64_t v3 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000014LL,  0x800000010003E120LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v3);
    return swift_release(v0);
  }

  else
  {
    uint64_t v5 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    return swift_willThrow(v5);
  }

uint64_t sub_100011E00(uint64_t a1)
{
  return sub_1000126C4(a1, (uint64_t)sub_1000139A8);
}

uint64_t sub_100011E0C(void *a1, void *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for JSPromise(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v16 = static RunLoopWorkerThread.current.getter();
  if (v16)
  {
    uint64_t v17 = v16;
    id v62 = a1;
    uint64_t v63 = v10;
    uint64_t v59 = v7;
    uint64_t v60 = v6;
    uint64_t v18 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v19 = type metadata accessor for LogMessage(0LL);
    uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v19 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v20 + 16) = xmmword_10003BCD0;
    uint64_t Object = type metadata accessor for JSAppQueryObject();
    v66[0] = a2;
    id v21 = a2;
    id v22 = (id)AMSLogKey(v21);
    id v61 = v21;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      uint64_t v26 = v25;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v27._countAndFlagsBits = 0LL;
      v27._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v27);
      uint64_t v28 = Object;
      uint64_t v29 = sub_100007060(v66, Object);
      uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v64[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v64);
      sub_100008D04((uint64_t)v64);
      v31._countAndFlagsBits = 5972026LL;
      v31._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v31);
      uint64_t MetatypeMetadata = &type metadata for String;
      v64[0] = v24;
      v64[1] = v26;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v64);
      sub_100008D04((uint64_t)v64);
      uint64_t v32 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v36._countAndFlagsBits = 0LL;
      v36._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v36);
      uint64_t v37 = Object;
      __int128 v38 = sub_100007060(v66, Object);
      uint64_t v39 = swift_getDynamicType(v38, v37, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v64[0] = v39;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v64);
      sub_100008D04((uint64_t)v64);
      uint64_t v32 = 58LL;
    }

    uint64_t v40 = v68;
    unint64_t v41 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
    LogMessage.init(stringInterpolation:)(v14);
    uint64_t v15 = type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v66);
    LogMessage.init(stringLiteral:)(0xD000000000000025LL, 0x800000010003E0D0LL);
    uint64_t Object = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
    v66[0] = a3;
    id v42 = a3;
    static LogMessage.safe(_:)(v66);
    sub_100008D04((uint64_t)v66);
    sub_10002C300(v20);
    swift_bridgeObjectRelease(v20);
    uint64_t v43 = sub_100005D00(v42);
    if (!v40)
    {
      uint64_t v46 = v44;
      if (v44)
      {
        swift_bridgeObjectRelease(v43);
        sub_100007498(0LL, &qword_1000509D0, &OBJC_CLASS___ASDAppQuery_ptr);
        id v47 = sub_100012314(v46);
        unint64_t v48 = (void *)swift_allocObject(&unk_100049E40, 40LL, 7LL);
        uint64_t v49 = v61;
        v48[2] = v47;
        v48[3] = v49;
        uint64_t v50 = v17;
        v48[4] = v17;
        id v51 = v49;
        id v52 = v62;
        id v53 = v47;
        swift_retain(v50);
        id v54 = v63;
        uint64_t v55 = JSPromise.init(in:executor:)(v52, sub_1000139F4, v48);
        uint64_t v15 = JSPromise.value.getter(v55);

        swift_release(v50);
        (*(void (**)(char *, uint64_t))(v59 + 8))(v54, v60);
        return v15;
      }

      swift_bridgeObjectRelease(v43);
      uint64_t v15 = type metadata accessor for JSError(0LL);
      unint64_t v56 = sub_100009214();
      swift_allocError(v15, v56, 0LL, 0LL);
      uint64_t v57 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000012LL,  0x800000010003E100LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
      swift_willThrow(v57);
    }

    swift_release(v17);
  }

  else
  {
    uint64_t v33 = type metadata accessor for JSError(0LL);
    unint64_t v34 = sub_100009214();
    swift_allocError(v33, v34, 0LL, 0LL);
    uint64_t v35 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v35);
  }

  return v15;
}

id sub_100012314(uint64_t a1)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v4 = [(id)swift_getObjCClassFromMetadata(v1) queryForBundleIDs:isa];

  return v4;
}

uint64_t sub_10001237C(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v44 = a6;
  unint64_t v41 = a1;
  uint64_t v42 = a3;
  uint64_t v40 = a2;
  uint64_t v8 = type metadata accessor for JSCallable(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  __chkstk_darwin(v8, v10);
  uint64_t v12 = v11;
  uint64_t v39 = v11;
  uint64_t v13 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100006674(&qword_1000509D8);
  uint64_t v15 = Promise.__allocating_init()(v14);
  id v47 = sub_100013968;
  uint64_t v48 = v15;
  uint64_t v43 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000125E0;
  uint64_t v46 = &unk_100049E58;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = v48;
  swift_retain(v15);
  swift_release(v17);
  [a4 executeQueryWithResultHandler:v16];
  _Block_release(v16);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v13, v40, v8);
  uint64_t v19 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v21 = v19 | 7;
  uint64_t v22 = swift_allocObject(&unk_100049E90, v20 + v12, v19 | 7);
  uint64_t v23 = v41;
  *(void *)(v22 + 16) = a5;
  *(void *)(v22 + 24) = v23;
  uint64_t v24 = v22 + v20;
  uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  uint64_t v26 = v38;
  v25(v24, v13, v38);
  v18(v13, v42, v26);
  uint64_t v27 = (v19 + 24) & ~v19;
  unint64_t v28 = (v39 + v27 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v29 = swift_allocObject(&unk_100049EB8, v28 + 8, v21);
  *(void *)(v29 + 16) = a5;
  v25(v29 + v27, v13, v26);
  *(void *)(v29 + v28) = v23;
  uint64_t v46 = (void *)type metadata accessor for RunLoopWorkerThread(0LL);
  id v47 = (void (*)(uint64_t, uint64_t))&protocol witness table for RunLoopWorkerThread;
  uint64_t v30 = v44;
  aBlock[0] = v44;
  id v31 = a5;
  id v32 = v23;
  id v33 = v31;
  id v34 = v32;
  swift_retain(v30);
  uint64_t v35 = v43;
  Promise.then(perform:orCatchError:on:)(sub_10001399C, v22, sub_1000139A4, v29, aBlock);
  swift_release(v22);
  swift_release(v29);
  swift_release(v35);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(aBlock);
}

uint64_t sub_1000125E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2)
  {
    uint64_t v7 = sub_100007498(0LL, (unint64_t *)&unk_1000509F0, &OBJC_CLASS___ASDApp_ptr);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }

  swift_retain(v5);
  id v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_1000126B8(uint64_t a1)
{
  return sub_1000126C4(a1, (uint64_t)sub_100013930);
}

uint64_t sub_1000126C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_1000090C0(a1, &qword_100050900, &OBJC_CLASS___JSContext_ptr);
  uint64_t v6 = (void *)static JSContext.requiredCurrent.getter();
  v9[2] = v4;
  v9[3] = a1;
  uint64_t v7 = JSContext.propagateErrorsToExceptions(_:)(a2, v9);

  return v7;
}

uint64_t sub_100012734(void *a1, void *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for JSPromise(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v16 = static RunLoopWorkerThread.current.getter();
  if (v16)
  {
    uint64_t v17 = v16;
    id v62 = a1;
    uint64_t v63 = v10;
    uint64_t v59 = v7;
    uint64_t v60 = v6;
    uint64_t v18 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v19 = type metadata accessor for LogMessage(0LL);
    uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v19 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v20 + 16) = xmmword_10003BCD0;
    uint64_t Object = type metadata accessor for JSAppQueryObject();
    v66[0] = a2;
    id v21 = a2;
    id v22 = (id)AMSLogKey(v21);
    id v61 = v21;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      uint64_t v26 = v25;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v27._countAndFlagsBits = 0LL;
      v27._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v27);
      uint64_t v28 = Object;
      uint64_t v29 = sub_100007060(v66, Object);
      uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v64[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v64);
      sub_100008D04((uint64_t)v64);
      v31._countAndFlagsBits = 5972026LL;
      v31._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v31);
      uint64_t MetatypeMetadata = &type metadata for String;
      v64[0] = v24;
      v64[1] = v26;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v64);
      sub_100008D04((uint64_t)v64);
      uint64_t v32 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v36._countAndFlagsBits = 0LL;
      v36._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v36);
      uint64_t v37 = Object;
      uint64_t v38 = sub_100007060(v66, Object);
      uint64_t v39 = swift_getDynamicType(v38, v37, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v64[0] = v39;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v64);
      sub_100008D04((uint64_t)v64);
      uint64_t v32 = 58LL;
    }

    uint64_t v40 = v68;
    unint64_t v41 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
    LogMessage.init(stringInterpolation:)(v14);
    uint64_t v15 = type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v66);
    LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x800000010003DF60LL);
    uint64_t Object = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
    v66[0] = a3;
    id v42 = a3;
    static LogMessage.safe(_:)(v66);
    sub_100008D04((uint64_t)v66);
    sub_10002C300(v20);
    swift_bridgeObjectRelease(v20);
    uint64_t v43 = sub_100005D00(v42);
    if (!v40)
    {
      uint64_t v46 = (uint64_t)v43;
      if (v43)
      {
        swift_bridgeObjectRelease(v44);
        sub_100007498(0LL, &qword_1000509D0, &OBJC_CLASS___ASDAppQuery_ptr);
        id v47 = sub_100012C44(v46);
        uint64_t v48 = (void *)swift_allocObject(&unk_100049DA0, 40LL, 7LL);
        uint64_t v49 = v61;
        v48[2] = v47;
        v48[3] = v49;
        uint64_t v50 = v17;
        v48[4] = v17;
        id v51 = v49;
        id v52 = v62;
        id v53 = v47;
        swift_retain(v50);
        id v54 = v63;
        uint64_t v55 = JSPromise.init(in:executor:)(v52, sub_10001394C, v48);
        uint64_t v15 = JSPromise.value.getter(v55);

        swift_release(v50);
        (*(void (**)(char *, uint64_t))(v59 + 8))(v54, v60);
        return v15;
      }

      swift_bridgeObjectRelease(v44);
      uint64_t v15 = type metadata accessor for JSError(0LL);
      unint64_t v56 = sub_100009214();
      swift_allocError(v15, v56, 0LL, 0LL);
      uint64_t v57 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000011LL,  0x800000010003DF90LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
      swift_willThrow(v57);
    }

    swift_release(v17);
  }

  else
  {
    uint64_t v33 = type metadata accessor for JSError(0LL);
    unint64_t v34 = sub_100009214();
    swift_allocError(v33, v34, 0LL, 0LL);
    uint64_t v35 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v35);
  }

  return v15;
}

id sub_100012C44(uint64_t a1)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v4 = [(id)swift_getObjCClassFromMetadata(v1) queryForStoreItemIDs:isa];

  return v4;
}

uint64_t sub_100012CC4(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v44 = a6;
  unint64_t v41 = a1;
  uint64_t v42 = a3;
  uint64_t v40 = a2;
  uint64_t v8 = type metadata accessor for JSCallable(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v38 = v8;
  __chkstk_darwin(v8, v10);
  uint64_t v12 = v11;
  uint64_t v39 = v11;
  uint64_t v13 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100006674(&qword_1000509D8);
  uint64_t v15 = Promise.__allocating_init()(v14);
  id v47 = sub_100013968;
  uint64_t v48 = v15;
  uint64_t v43 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000125E0;
  uint64_t v46 = &unk_100049DB8;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = v48;
  swift_retain(v15);
  swift_release(v17);
  [a4 executeQueryWithResultHandler:v16];
  _Block_release(v16);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v13, v40, v8);
  uint64_t v19 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v20 = (v19 + 32) & ~v19;
  uint64_t v21 = v19 | 7;
  uint64_t v22 = swift_allocObject(&unk_100049DF0, v20 + v12, v19 | 7);
  uint64_t v23 = v41;
  *(void *)(v22 + 16) = a5;
  *(void *)(v22 + 24) = v23;
  uint64_t v24 = v22 + v20;
  uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  uint64_t v26 = v38;
  v25(v24, v13, v38);
  v18(v13, v42, v26);
  uint64_t v27 = (v19 + 24) & ~v19;
  unint64_t v28 = (v39 + v27 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v29 = swift_allocObject(&unk_100049E18, v28 + 8, v21);
  *(void *)(v29 + 16) = a5;
  v25(v29 + v27, v13, v26);
  *(void *)(v29 + v28) = v23;
  uint64_t v46 = (void *)type metadata accessor for RunLoopWorkerThread(0LL);
  id v47 = (void (*)(uint64_t, uint64_t))&protocol witness table for RunLoopWorkerThread;
  uint64_t v30 = v44;
  aBlock[0] = v44;
  id v31 = a5;
  id v32 = v23;
  id v33 = v31;
  id v34 = v32;
  swift_retain(v30);
  uint64_t v35 = v43;
  Promise.then(perform:orCatchError:on:)(sub_10001399C, v22, sub_1000139A4, v29, aBlock);
  swift_release(v22);
  swift_release(v29);
  swift_release(v35);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(aBlock);
}

void sub_100012F28(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain(a2);
    NSString v2 = String._bridgeToObjectiveC()();
    sub_100013CB0();
    ((void (*)())Error.localizedDescription.getter)();
    uint64_t v4 = v3;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
    id v6 = (id)AMSError(2LL, v2, v5, 0LL);

    Promise.reject(_:)(v6);
    sub_100013CA8();
  }

  else if (a1)
  {
    uint64_t v9 = a1;
    Promise.resolve(_:)(&v9);
  }

  else
  {
    NSString v7 = String._bridgeToObjectiveC()();
    id v8 = (id)AMSError(2LL, v7, 0LL, 0LL);

    Promise.reject(_:)(v8);
  }

void sub_10001307C(uint64_t *a1, void *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6, v7);
  sub_100013C4C();
  uint64_t v8 = *a1;
  uint64_t v9 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v10 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + 3LL * *(void *)(v10 + 72),
          *(unsigned __int8 *)(v10 + 80) | 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_10003BCD0;
  uint64_t Object = type metadata accessor for JSAppQueryObject();
  id v22 = sub_100013C6C(Object, (uint64_t)&v25);
  id v13 = (id)AMSLogKey(v22);
  if (v13)
  {
    sub_100013C8C((uint64_t)v13);

    sub_100013BF0();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v14 = sub_100013C10();
    sub_100013BBC(v14);
    sub_100013BE0();
    sub_100008DBC();
    sub_100013C7C();
    sub_100013BE0();
    v15._countAndFlagsBits = 93LL;
  }

  else
  {
    sub_100013C00();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v16 = sub_100013C10();
    sub_100013BBC(v16);
    sub_100013BE0();
    v15._countAndFlagsBits = 58LL;
  }

  v15._object = (void *)0xE100000000000000LL;
  sub_100013BE8(v15);
  LogMessage.init(stringInterpolation:)(v3);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v24);
  LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x800000010003E030LL);
  v24[3] = sub_100006674(&qword_1000509E8);
  v24[0] = v8;
  swift_bridgeObjectRetain(v8);
  static LogMessage.safe(_:)(v24);
  sub_100013C84();
  sub_10002C300(v11);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRetain(v8);
  id v17 = sub_100006884(a3, v8);
  swift_bridgeObjectRelease(v8);
  uint64_t v18 = sub_100006674(&qword_1000509E0);
  uint64_t v19 = sub_100013C9C(v18);
  *(_OWORD *)(v19 + 16) = xmmword_10003BAE0;
  *(void *)(v19 + 56) = sub_1000090C0(v19, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v19 + 32) = v17;
  id v20 = v17;
  uint64_t v21 = (void *)JSCallable.call(_:)(v19);

  sub_100013CB8();
  sub_100013C18();
}

void sub_100013424(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v41 = a3;
  uint64_t v7 = type metadata accessor for JSError(0LL);
  uint64_t v42 = *(void *)(v7 - 8);
  uint64_t v43 = v7;
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  sub_100013C4C();
  uint64_t v13 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v14 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v38 = v17 + 3 * v15;
  uint64_t v37 = v16 | 7;
  uint64_t v18 = swift_allocObject(v13, v38, v16 | 7);
  __int128 v36 = xmmword_10003BCD0;
  *(_OWORD *)(v18 + 16) = xmmword_10003BCD0;
  uint64_t v39 = v17;
  uint64_t Object = type metadata accessor for JSAppQueryObject();
  id v35 = sub_100013C6C(Object, (uint64_t)&v51);
  id v20 = (id)AMSLogKey(v35);
  v44.super.Class isa = a4;
  uint64_t v40 = v13;
  if (v20)
  {
    uint64_t v21 = sub_100013C8C((uint64_t)v20);
    uint64_t v23 = v22;

    sub_100013BF0();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v24 = sub_100013C10();
    sub_100013BBC(v24);
    sub_100013BE0();
    sub_100008DBC();
    uint64_t v49 = &type metadata for String;
    uint64_t v47 = v21;
    uint64_t v48 = v23;
    sub_100013C7C();
    sub_100013BE0();
    v25._countAndFlagsBits = 93LL;
  }

  else
  {
    sub_100013C00();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v26 = sub_100013C10();
    sub_100013BBC(v26);
    sub_100013BE0();
    v25._countAndFlagsBits = 58LL;
  }

  v25._object = (void *)0xE100000000000000LL;
  sub_100013BE8(v25);
  sub_100013C30();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v50);
  LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x800000010003DFD0LL);
  swift_getErrorValue(a1);
  uint64_t v27 = v45;
  uint64_t v28 = v46;
  v50[3] = v46;
  uint64_t v29 = sub_100013CD8();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16LL))(v29, v27, v28);
  static LogMessage.safe(_:)(v50);
  sub_100013C84();
  sub_10002C320(v18);
  sub_100013C64();
  uint64_t v30 = sub_100006674(&qword_1000509E0);
  uint64_t v31 = sub_100013C9C(v30);
  *(_OWORD *)(v31 + 16) = xmmword_10003BAE0;
  swift_errorRetain(a1);
  sub_1000186A8(a1);
  Class isa = JSError.makeValue(in:)(v44).super.isa;
  uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v10, v43);
  *(void *)(v31 + 56) = sub_1000090C0(v33, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v31 + 32) = isa;
  id v34 = (void *)JSCallable.call(_:)(v31);
  sub_100013C64();

  sub_100013C18();
}

id sub_100013890()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAppQueryObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000138E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSAppQueryObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSAppQueryObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService16JSAppQueryObject);
}

uint64_t sub_100013930(void *a1)
{
  return sub_100012734(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001394C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100012CC4(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

void sub_100013968(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100013980(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100013990(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000139A8(void *a1)
{
  return sub_100011E0C(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000139C4()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000139F4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001237C(a1, a2, a3, *(void **)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_100013A14()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_100013CEC();

  sub_100013C3C();
  return swift_deallocObject(v0, v3, v4);
}

void sub_100013A7C(uint64_t *a1)
{
}

uint64_t sub_100013AC0()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_100013CEC();
  sub_100013C3C();

  return swift_deallocObject(v0, v4 + 8, v3);
}

void sub_100013B3C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_100013C94() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_100013424( a1,  *(void **)(v1 + 16),  v1 + v4,  *(objc_class **)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_100013B98()
{
  uint64_t v1 = *(void *)(v0 - 96);
  uint64_t v2 = sub_100007060((void *)(v0 - 120), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_100013BBC(uint64_t a1)
{
  *(void *)(v2 - 128) = a1;
  *(void *)(v2 - 152) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 152);
}

void sub_100013BD0()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_100013BE0()
{
  return sub_100008D04(v0 - 152);
}

void sub_100013BE8(Swift::String a1)
{
}

uint64_t sub_100013BF0()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
}

uint64_t sub_100013C00()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
}

uint64_t sub_100013C10()
{
  return swift_getMetatypeMetadata();
}

  ;
}

uint64_t sub_100013C30()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_100013C3C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

  ;
}

uint64_t sub_100013C64()
{
  return swift_bridgeObjectRelease(v0);
}

id sub_100013C6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  *(void *)(v3 - 96) = a1;
  *(void *)(v3 - 120) = v2;
  return v2;
}

uint64_t sub_100013C7C()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 152);
}

uint64_t sub_100013C84()
{
  return sub_100008D04(v0 - 120);
}

uint64_t sub_100013C8C(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_100013C94()
{
  return type metadata accessor for JSCallable(0LL);
}

uint64_t sub_100013C9C(uint64_t a1)
{
  return swift_allocObject(a1, 64LL, 7LL);
}

uint64_t sub_100013CA8()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100013CB0()
{
  return swift_getErrorValue(v0);
}

uint64_t sub_100013CB8()
{
  return swift_bridgeObjectRelease(v0);
}

id sub_100013CC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(a1 - 256);
  *(void *)(v1 - 120) = v2;
  return v2;
}

uint64_t sub_100013CCC(uint64_t a1)
{
  return LogMessage.init(stringLiteral:)(a1, (v1 - 32) | 0x8000000000000000LL);
}

void *sub_100013CD8()
{
  return sub_100007678((void *)(v0 - 120));
}

uint64_t sub_100013CE0()
{
  return static LogMessage.safe(_:)(v0 - 120);
}

void sub_100013CEC()
{
}

id sub_100013CF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_clientInfo] = a1;
  uint64_t v6 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_mediaClient];
  *(void *)uint64_t v6 = a2;
  *((void *)v6 + 1) = a3;
  uint64_t v7 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_metricsContext];
  *uint64_t v7 = a4;
  *((void *)v7 + 1) = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for JSClientObject();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_100013D78()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_metricsContext);
}

uint64_t sub_100013D94()
{
  return sub_100013F04((SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_100013DE8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_mediaClient);
  swift_bridgeObjectRetain(*(void *)(v0
                                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_mediaClient
                                     + 8));
  return v1;
}

uint64_t sub_100013E80()
{
  return swift_bridgeObjectRetain(*(void *)(v0
                                            + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_metricsContext
                                            + 8));
}

id sub_100013EA0(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();
  uint64_t v6 = v5;

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

uint64_t sub_100013EF8()
{
  return sub_100013F04((SEL *)&selRef_clientVersion);
}

uint64_t sub_100013F04(SEL *a1)
{
  id v2 =  [*(id *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService14JSClientObject_clientInfo) *a1];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

void sub_100013F70()
{
}

id sub_100013FA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSClientObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSClientObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService14JSClientObject);
}

const char *sub_100014048()
{
  return "AppleMediaServicesUI";
}

const char *sub_10001405C()
{
  return "JetIntents";
}

uint64_t sub_100014070(uint64_t a1)
{
  uint64_t v124 = v5;
  sub_100006674(&qword_1000505B8);
  sub_100016810();
  __chkstk_darwin(v6, v7);
  sub_10000D574();
  uint64_t v119 = v8;
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v127 = *(void *)(v9 - 8);
  sub_100016810();
  __chkstk_darwin(v10, v11);
  sub_1000168D8();
  uint64_t v14 = v13 - v12;
  uint64_t v126 = v13 - v12;
  uint64_t v15 = type metadata accessor for Bag(0LL);
  uint64_t v129 = *(void *)(v15 - 8);
  sub_100016810();
  uint64_t v18 = __chkstk_darwin(v16, v17);
  uint64_t v120 = (char *)&v111 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v18, v20);
  uint64_t v134 = (char *)&v111 - v21;
  uint64_t v22 = type metadata accessor for DynamicAccountsStore();
  type metadata accessor for BaseObjectGraph(0LL);
  sub_100016808(v22, a1, v22);
  uint64_t v136 = v141[0];
  id v118 = DynamicAccountsStore.account.getter();
  uint64_t v130 = v15;
  sub_100016808(v15, a1, v15);
  uint64_t v23 = sub_100007498(0LL, &qword_1000503B8, &OBJC_CLASS___AMSProcessInfo_ptr);
  sub_1000167FC(v23, a1);
  uint64_t v24 = (void *)v141[0];
  uint64_t v122 = a1;
  sub_1000167FC((uint64_t)&type metadata for JSSourcePackage, a1);
  uint64_t v25 = sub_100007498(0LL, &qword_1000506B8, &OBJC_CLASS___JSVirtualMachine_ptr);
  sub_1000167E8(v25);
  uint64_t v123 = v139;
  sub_1000167E8((uint64_t)&type metadata for MediaClient);
  uint64_t v137 = v139;
  uint64_t v144 = v140;
  sub_1000167E8((uint64_t)&type metadata for MetricsContext);
  LODWORD(v115) = v139;
  uint64_t v114 = v140;
  uint64_t v128 = v9;
  sub_100016808(v9, a1, v9);
  uint64_t v26 = type metadata accessor for URLSessionHandler();
  sub_1000167E8(v26);
  uint64_t v117 = v139;
  uint64_t v27 = sub_100006674(&qword_100050B80);
  uint64_t v28 = type metadata accessor for JSStack.Prerequisite(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(void *)(v29 + 72);
  uint64_t v31 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v32 = (v31 + 32) & ~v31;
  uint64_t v33 = swift_allocObject(v27, v32 + 12 * v30, v31 | 7);
  uint64_t v121 = v33;
  *(_OWORD *)(v33 + 16) = xmmword_10003C200;
  uint64_t v34 = v33 + v32;
  sub_10000D2D0((uint64_t)v141, v34);
  id v35 = *(void (**)(void))(v29 + 104);
  ((void (*)(uint64_t, void, uint64_t))v35)(v34, enum case for JSStack.Prerequisite.source(_:), v28);
  __int128 v36 = (void (*)(void *))v35;
  uint64_t v37 = (void *)(v34 + v30);
  id v38 = objc_allocWithZone((Class)type metadata accessor for JSAccountObject());
  sub_100016940();
  id v39 = v24;
  id v40 = sub_10000FF10(v14, (uint64_t)v39);
  *uint64_t v37 = 0x746E756F636361LL;
  v37[1] = 0xE700000000000000LL;
  void v37[2] = v40;
  uint64_t v41 = enum case for JSStack.Prerequisite.globalObject(_:);
  sub_10001681C(v34 + v30);
  uint64_t v42 = (void *)(v34 + 2 * v30);
  id v43 = [objc_allocWithZone((Class)type metadata accessor for JSAppQueryObject()) init];
  *uint64_t v42 = 0x7972657551707061LL;
  v42[1] = 0xE800000000000000LL;
  v42[2] = v43;
  sub_10001681C((uint64_t)v42);
  JSContext v44 = (void *)(v34 + 3 * v30);
  id v45 = objc_allocWithZone((Class)type metadata accessor for JSClientObject());
  id v46 = v39;
  id v116 = v46;
  sub_1000169F8();
  id v47 = sub_100013CF4((uint64_t)v46, v137, v1, (char)v115, v114);
  *JSContext v44 = 0x746E65696C63LL;
  v44[1] = 0xE600000000000000LL;
  v44[2] = v47;
  sub_10001681C((uint64_t)v44);
  uint64_t v48 = (void *)(v34 + 4 * v30);
  id v49 = [objc_allocWithZone((Class)type metadata accessor for JSDeviceObject()) init];
  *uint64_t v48 = 0x656369766564LL;
  v48[1] = 0xE600000000000000LL;
  v48[2] = v49;
  sub_10001681C((uint64_t)v48);
  uint64_t v50 = v141[5];
  uint64_t v51 = (objc_class *)type metadata accessor for JSLocalizationObject();
  id v52 = (char *)objc_allocWithZone(v51);
  *(void *)&v52[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject_localizations] = v50;
  v138.receiver = v52;
  v138.super_class = v51;
  swift_bridgeObjectRetain(v50);
  id v53 = objc_msgSendSuper2(&v138, "init");
  id v54 = sub_100016A04((uint64_t)v53, 0x617A696C61636F6CLL);
  v36(v54);
  id v55 = [objc_allocWithZone((Class)type metadata accessor for JSLogObject()) init];
  unint64_t v56 = sub_100016A04((uint64_t)v55, 6778732LL);
  unsigned int v131 = v41;
  uint64_t v133 = v28;
  v36(v56);
  uint64_t v57 = (void (*)(void *, uint64_t, uint64_t))v36;
  uint64_t v135 = (void (*)(uint64_t, uint64_t, uint64_t))v36;
  uint64_t v58 = v30;
  uint64_t v59 = (void *)(v34 + 7 * v30);
  uint64_t v132 = v34;
  uint64_t v60 = v128;
  uint64_t v61 = (uint64_t)v119;
  (*(void (**)(void, uint64_t, uint64_t))(v127 + 16))(v119, v126, v128);
  sub_100007438(v61, 0LL, 1LL, v60);
  id v62 = objc_allocWithZone((Class)type metadata accessor for JSServiceObject());
  id v63 = sub_100022760(v61);
  *uint64_t v59 = 0x65636976726573LL;
  v59[1] = 0xE700000000000000LL;
  void v59[2] = v63;
  v57(v59, v41, v28);
  uint64_t v64 = (void *)(v34 + 8 * v58);
  uint64_t v65 = v58;
  uint64_t v113 = v58;
  uint64_t v66 = v130;
  uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v129 + 16);
  uint64_t v68 = (uint64_t)v120;
  Swift::String v69 = v134;
  v67(v120, v134, v130);
  uint64_t v119 = (void (*)(uint64_t, char *, uint64_t))v67;
  id v70 = objc_allocWithZone((Class)type metadata accessor for JSMarketingObject(0LL));
  uint64_t v71 = (uint64_t)v118;
  id v115 = v118;
  id v72 = sub_1000168D0((uint64_t)v142);
  sub_1000169F8();
  uint64_t v73 = v71;
  uint64_t v74 = v137;
  id v75 = sub_100018E7C(v73, v68, (uint64_t)v72, v137, (uint64_t)"init");
  *uint64_t v64 = 0x6E6974656B72616DLL;
  v64[1] = 0xE900000000000067LL;
  v64[2] = v75;
  v135((uint64_t)v64, v131, v133);
  unint64_t v76 = (void *)(v132 + 9 * v65);
  uint64_t v77 = v68;
  id v78 = v69;
  uint64_t v79 = v66;
  v67((char *)v68, v78, v66);
  id v80 = objc_allocWithZone((Class)type metadata accessor for JSMediaAPIObject(0LL));
  uint64_t v81 = v136;
  swift_retain(v136);
  id v82 = v72;
  id v118 = v82;
  uint64_t v83 = v144;
  swift_bridgeObjectRetain(v144);
  id v84 = sub_1000168D0((uint64_t)&v143);
  sub_10001ACB0(v81, v77, v82, v74, v83, v84);
  *unint64_t v76 = 0x495041616964656DLL;
  v76[1] = 0xE800000000000000LL;
  v76[2] = v85;
  uint64_t v86 = v76;
  uint64_t v87 = v131;
  uint64_t v88 = v133;
  uint64_t v89 = v135;
  v135((uint64_t)v86, v131, v133);
  uint64_t v90 = v132;
  uint64_t v91 = v113;
  uint64_t v92 = (void *)(v132 + 10 * v113);
  id v93 = [objc_allocWithZone((Class)type metadata accessor for JSEngagementObject()) init];
  *uint64_t v92 = 0x656D656761676E65LL;
  v92[1] = 0xEA0000000000746ELL;
  v92[2] = v93;
  v89(v90 + 10 * v91, v87, v88);
  __int128 v94 = (void *)(v90 + 11 * v91);
  v119(v77, v134, v79);
  id v95 = objc_allocWithZone((Class)type metadata accessor for JSNetworkObject(0LL));
  sub_100016940();
  id v96 = sub_1000168D0((uint64_t)&v144);
  id v97 = v84;
  uint64_t v98 = v91;
  id v99 = sub_10001CFA8(v91, v77, v96, v137, v144, v97);
  *__int128 v94 = 0x6B726F7774656ELL;
  v94[1] = 0xE700000000000000LL;
  v94[2] = v99;
  v135((uint64_t)v94, v87, v88);
  uint64_t v100 = v122;
  type metadata accessor for JSStack(0LL);
  swift_retain(v100);
  id v101 = sub_1000168D0((uint64_t)&v145);
  uint64_t v102 = v124;
  static JSStack.StandardGlobalConfiguration.default.getter();
  uint64_t v103 = v125;
  uint64_t v104 = JSStack.__allocating_init(asPartOf:virtualMachine:configuration:customPrerequisites:)(v100, v101, v102, v121);
  if (v103)
  {
    swift_release(v98);

    swift_release(v100);
    sub_100016898();
    sub_1000165DC(v141);
    sub_1000168E8();
    uint64_t v105 = type metadata accessor for JSDataProvider();
    uint64_t v106 = v112;
    swift_deallocPartialClassInstance(v112, v105, 24LL, 7LL);
  }

  else
  {
    uint64_t v107 = v104;
    unint64_t v108 = v97;
    id v109 = v115;
    uint64_t v106 = v112;
    *(void *)(v112 + 16) = v104;
    swift_retain(v104);
    swift_retain(v106);
    JSStack.withUnsafeContext(_:)(sub_100016610, v106);
    swift_release(v107);
    swift_release(v106);

    swift_release(v100);
    swift_release(v98);

    sub_100016898();
    sub_1000165DC(v141);
    sub_1000168E8();
  }

  return v106;
}

void sub_1000149B0(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v9 = type metadata accessor for LogMessage(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_10003BD40;
  uint64_t v33 = type metadata accessor for JSDataProvider();
  v32[0] = a2;
  uint64_t v11 = swift_retain(a2);
  id v12 = (id)AMSLogKey(v11);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v16 = v15;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v17._countAndFlagsBits = 0LL;
    v17._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v17);
    uint64_t v18 = v33;
    uint64_t v19 = sub_100007060(v32, v33);
    uint64_t DynamicType = swift_getDynamicType(v19, v18, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v30[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
    sub_100016660((uint64_t)v30, (uint64_t *)&unk_1000509C0);
    v21._countAndFlagsBits = 5972026LL;
    v21._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t MetatypeMetadata = &type metadata for String;
    v30[0] = v14;
    v30[1] = v16;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
    sub_100016660((uint64_t)v30, (uint64_t *)&unk_1000509C0);
    uint64_t v22 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v23._countAndFlagsBits = 0LL;
    v23._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t v24 = v33;
    uint64_t v25 = sub_100007060(v32, v33);
    uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v26);
    v30[0] = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
    sub_100016660((uint64_t)v30, (uint64_t *)&unk_1000509C0);
    uint64_t v22 = 58LL;
  }

  unint64_t v27 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
  LogMessage.init(stringInterpolation:)(v7);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v32);
  LogMessage.init(stringLiteral:)(0xD00000000000002DLL, 0x800000010003E400LL);
  sub_10002C300(v10);
  swift_bridgeObjectRelease(v10);
  id v28 = [a1 virtualMachine];
  if (v28)
  {
    uint64_t v29 = v28;
    [v28 shrinkFootprintWhenIdle];
  }

  else
  {
    __break(1u);
  }

uint64_t sub_100014C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[74] = a4;
  v5[73] = a3;
  v5[72] = a2;
  v5[71] = a1;
  uint64_t v6 = sub_100006674(&qword_100050B58);
  v5[75] = sub_1000167D8(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for JSError(0LL);
  v5[76] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[77] = v8;
  v5[78] = sub_100016884(v8);
  v5[79] = swift_task_alloc(v4);
  uint64_t v9 = sub_100006674(&qword_100050760);
  v5[80] = sub_1000167D8(*(void *)(v9 - 8));
  uint64_t v10 = type metadata accessor for JSONContext(0LL);
  v5[81] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v5[82] = v11;
  v5[83] = sub_1000167D8(v11);
  uint64_t v12 = sub_100006674(&qword_100050B60);
  v5[84] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v5[85] = v13;
  v5[86] = sub_1000167D8(v13);
  uint64_t v14 = type metadata accessor for JSONObject(0LL);
  v5[87] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v5[88] = v15;
  v5[89] = sub_100016884(v15);
  v5[90] = swift_task_alloc(v4);
  uint64_t v16 = type metadata accessor for JSRequestIntent(0LL);
  v5[91] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v5[92] = v17;
  v5[93] = sub_1000167D8(v17);
  uint64_t v18 = type metadata accessor for JSIntentResult(0LL);
  v5[94] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v5[95] = v19;
  v5[96] = sub_1000167D8(v19);
  return swift_task_switch(sub_100014DA0, 0LL, 0LL);
}

uint64_t sub_100014DA0()
{
  uint64_t v1 = v0[74];
  uint64_t v2 = v0[72];
  v0[51] = type metadata accessor for JSServiceRequest(0LL);
  sub_1000165A0( &qword_100050B68,  type metadata accessor for JSServiceRequest,  (uint64_t)&protocol conformance descriptor for JSServiceRequest);
  v0[52] = v3;
  sub_10000D298(v0 + 48);
  sub_10001655C(v2, v4);
  v0[97] = *(void *)(v1 + 16);
  uint64_t v5 = v0[51];
  uint64_t v6 = v0[52];
  sub_100007060(v0 + 48, v5);
  v0[45] = v5;
  v0[46] = *(void *)(v6 + 8);
  v0[47] = *(void *)(v6 + 16);
  sub_10000D298(v0 + 42);
  (*(void (**)(void))(*(void *)(v5 - 8) + 16LL))();
  JSRequestIntent.init(_:timeout:)(v0 + 42, 0LL, 1LL);
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to JSStack.dispatch<A>(_:objectGraph:)[1]);
  v0[98] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100014EFC;
  return JSStack.dispatch<A>(_:objectGraph:)( v0[96],  v0[93],  v0[73],  v0[91],  &protocol witness table for JSRequestIntent);
}

uint64_t sub_100014EFC()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 784LL);
  *(void *)(*(void *)v1 + 792LL) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(void, void))(v2[92] + 8LL))(v2[93], v2[91]);
  if (v0) {
    uint64_t v4 = sub_1000156EC;
  }
  else {
    uint64_t v4 = sub_100014FC0;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_100014FC0()
{
  uint64_t v1 = *(void *)(v0 + 720);
  uint64_t v2 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 704);
  uint64_t v102 = (void *)(v0 + 384);
  uint64_t v103 = *(void *)(v0 + 696);
  uint64_t v4 = *(void *)(v0 + 688);
  uint64_t v5 = *(void *)(v0 + 680);
  uint64_t v6 = *(void *)(v0 + 672);
  uint64_t v7 = *(void *)(v0 + 640);
  JSIntentResult.jsonObject.getter();
  CoarselyTimed.contained.getter(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v103);
  uint64_t v9 = JSONContext.init()(v8);
  JSONObject.dictionary.getter(v9);
  uint64_t v10 = type metadata accessor for JSONDictionary(0LL);
  int v11 = sub_10001698C(v7);
  uint64_t v12 = *(void *)(v0 + 640);
  if (v11 == 1)
  {
    sub_100016660(*(void *)(v0 + 640), &qword_100050760);
LABEL_6:
    uint64_t v29 = *(void *)(v0 + 664);
    uint64_t v30 = *(void *)(v0 + 656);
    uint64_t v31 = *(void *)(v0 + 648);
    id v32 = [objc_allocWithZone(NSError) init];
    swift_willThrow(v32);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    goto LABEL_7;
  }

  uint64_t v13 = JSONDictionary.bridgedPrimitiveValues<A, B>()( &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  sub_100016970(v12, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL));
  if (!v13) {
    goto LABEL_6;
  }
  uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  *(void *)(v0 + 560) = 0LL;
  id v16 = [v14 dataWithJSONObject:isa options:0 error:v0 + 560];

  id v17 = *(id *)(v0 + 560);
  if (v16)
  {
    uint64_t v94 = *(void *)(v0 + 768);
    uint64_t v92 = *(void *)(v0 + 760);
    uint64_t v93 = *(void *)(v0 + 752);
    uint64_t v90 = *(void *)(v0 + 712);
    uint64_t v91 = *(void *)(v0 + 720);
    uint64_t v18 = *(void *)(v0 + 704);
    uint64_t v19 = *(void *)(v0 + 696);
    uint64_t v95 = *(void *)(v0 + 744);
    uint64_t v96 = *(void *)(v0 + 688);
    uint64_t v20 = *(void *)(v0 + 664);
    uint64_t v21 = *(void *)(v0 + 656);
    uint64_t v22 = *(void *)(v0 + 648);
    uint64_t v97 = *(void *)(v0 + 640);
    uint64_t v98 = *(void *)(v0 + 632);
    uint64_t v100 = *(void *)(v0 + 624);
    uint64_t v104 = *(void *)(v0 + 600);
    Swift::String v23 = *(uint64_t **)(v0 + 568);
    uint64_t v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v26 = v25;

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    unint64_t v27 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v27(v90, v19);
    *Swift::String v23 = v24;
    v23[1] = v26;
    v27(v91, v19);
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v94, v93);
    JSStack.requestGarbageCollection()();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v102);
    sub_100016984();
    swift_task_dealloc(v95);
    sub_1000169C0();
    sub_1000169B0();
    swift_task_dealloc(v96);
    swift_task_dealloc(v20);
    swift_task_dealloc(v97);
    swift_task_dealloc(v98);
    swift_task_dealloc(v100);
    swift_task_dealloc(v104);
    id v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }

  uint64_t v85 = v17;
  uint64_t v86 = *(void *)(v0 + 664);
  uint64_t v87 = *(void *)(v0 + 656);
  uint64_t v88 = *(void *)(v0 + 648);
  id v32 = (id)_convertNSErrorToError(_:)(v17);

  swift_willThrow(v89);
  (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
LABEL_7:
  uint64_t v33 = *(void *)(v0 + 768);
  uint64_t v34 = *(void *)(v0 + 760);
  uint64_t v35 = *(void *)(v0 + 720);
  uint64_t v36 = *(void *)(v0 + 696);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 704) + 8LL);
  v37(*(void *)(v0 + 712), v36);
  v37(v35, v36);
  sub_100016970(v33, *(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
  uint64_t v38 = *(void *)(v0 + 608);
  uint64_t v39 = *(void *)(v0 + 600);
  *(void *)(v0 + 552) = v32;
  swift_errorRetain(v32);
  uint64_t v40 = sub_100006674(&qword_100050B70);
  id v105 = v32;
  if ((swift_dynamicCast(v39, v0 + 552, v40, v38, 6LL) & 1) != 0)
  {
    uint64_t v41 = *(void *)(v0 + 632);
    uint64_t v42 = *(void *)(v0 + 624);
    uint64_t v43 = *(void *)(v0 + 616);
    uint64_t v44 = *(void *)(v0 + 608);
    uint64_t v45 = sub_1000169E4();
    sub_100007438(v45, v46, v47, v44);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32);
    v48(v41, v39, v44);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v42, v41, v44);
    sub_1000165A0( (unint64_t *)&qword_1000509B0,  (uint64_t (*)(uint64_t))&type metadata accessor for JSError,  (uint64_t)&protocol conformance descriptor for JSError);
    uint64_t v50 = sub_10000D5C8(v44, v49);
    v48(v51, v42, v44);
    id v52 = (void *)_convertErrorToNSError(_:)(v50);
    uint64_t v53 = sub_100006674(&qword_100050B78);
    uint64_t inited = swift_initStackObject(v53, v0 + 16);
    sub_10001684C((__n128 *)inited, (__n128)xmmword_10003BBC0);
    uint64_t v55 = AnyHashable.init<A>(_:)(v0 + 488, &type metadata for String, &protocol witness table for String);
    uint64_t v56 = JSError.column.getter(v55);
    if ((v57 & 1) != 0)
    {
      *(void *)(inited + 96) = &type metadata for String;
      sub_1000168F8();
      *(void *)(inited + 72) = v60;
      *(void *)(inited + 80) = v59;
    }

    else
    {
      *(void *)(v0 + 448) = &type metadata for Int;
      *(void *)(v0 + 424) = v56;
      sub_100016968((_OWORD *)(inited + 72), (_OWORD *)(v0 + 424));
    }

    sub_100016950();
    sub_1000169D0();
    uint64_t v61 = AnyHashable.init<A>(_:)(v0 + 504, &type metadata for String, &protocol witness table for String);
    uint64_t v62 = JSError.line.getter(v61);
    if ((v63 & 1) != 0)
    {
      *(void *)(inited + 168) = &type metadata for String;
      *(void *)(inited + 144) = v50;
      *(void *)(inited + 152) = 0xE700000000000000LL;
    }

    else
    {
      *(void *)(v0 + 480) = &type metadata for Int;
      *(void *)(v0 + 456) = v62;
      sub_100016968((_OWORD *)(inited + 144), (_OWORD *)(v0 + 456));
    }

    uint64_t v64 = *(void *)(v0 + 632);
    uint64_t v65 = *(void *)(v0 + 616);
    uint64_t v66 = *(void *)(v0 + 608);
    sub_100016910();
    *(void *)(v0 + 528) = 0xE700000000000000LL;
    uint64_t v68 = sub_100016998(v67);
    uint64_t v69 = JSError.message.getter(v68);
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = v69;
    *(void *)(inited + 224) = v70;
    sub_100016828();
    uint64_t v71 = sub_100016998(v0 + 536);
    uint64_t v72 = JSError.sourceURL.getter(v71);
    *(void *)(inited + 312) = &type metadata for String;
    if (v73) {
      uint64_t v74 = v72;
    }
    else {
      uint64_t v74 = v50;
    }
    if (v73) {
      unint64_t v75 = v73;
    }
    else {
      unint64_t v75 = 0xE700000000000000LL;
    }
    *(void *)(inited + 288) = v74;
    *(void *)(inited + 296) = v75;
    uint64_t v76 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
    Class v77 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v76);
    objc_msgSend(v52, "ams_errorByAddingUserInfo:", v77);

    uint64_t v78 = swift_errorRelease(v50);
    swift_willThrow(v78);
    swift_errorRelease(v105);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
  }

  else
  {
    sub_10001686C();
    sub_100016660(v0 + 552, &qword_100050B58);
    swift_willThrow(v58);
  }

  uint64_t v79 = *(void *)(v0 + 744);
  uint64_t v80 = *(void *)(v0 + 712);
  uint64_t v81 = *(void *)(v0 + 688);
  uint64_t v82 = *(void *)(v0 + 664);
  uint64_t v83 = *(void *)(v0 + 640);
  uint64_t v99 = *(void *)(v0 + 624);
  uint64_t v101 = *(void *)(v0 + 600);
  JSStack.requestGarbageCollection()();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v102);
  sub_1000169B0();
  swift_task_dealloc(v79);
  sub_100016984();
  swift_task_dealloc(v80);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  sub_1000169C0();
  swift_task_dealloc(v99);
  swift_task_dealloc(v101);
  id v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_1000156EC()
{
  uint64_t v1 = *(void *)(v0 + 792);
  uint64_t v2 = *(void *)(v0 + 608);
  uint64_t v3 = *(void *)(v0 + 600);
  *(void *)(v0 + 552) = v1;
  swift_errorRetain(v1);
  uint64_t v4 = sub_100006674(&qword_100050B70);
  uint64_t v51 = v1;
  if (swift_dynamicCast(v3, v0 + 552, v4, v2, 6LL))
  {
    uint64_t v5 = *(void *)(v0 + 632);
    uint64_t v6 = *(void *)(v0 + 624);
    uint64_t v7 = *(void *)(v0 + 616);
    uint64_t v8 = *(void *)(v0 + 608);
    uint64_t v9 = sub_1000169E4();
    sub_100007438(v9, v10, v11, v8);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v12(v5, v2, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8);
    sub_1000165A0( (unint64_t *)&qword_1000509B0,  (uint64_t (*)(uint64_t))&type metadata accessor for JSError,  (uint64_t)&protocol conformance descriptor for JSError);
    uint64_t v14 = sub_10000D5C8(v8, v13);
    v12(v15, v6, v8);
    uint64_t v49 = v14;
    id v16 = (void *)_convertErrorToNSError(_:)(v14);
    uint64_t v17 = sub_100006674(&qword_100050B78);
    uint64_t inited = swift_initStackObject(v17, v0 + 16);
    sub_10001684C((__n128 *)inited, (__n128)xmmword_10003BBC0);
    uint64_t v19 = AnyHashable.init<A>(_:)(v0 + 488, &type metadata for String, &protocol witness table for String);
    uint64_t v20 = JSError.column.getter(v19);
    if ((v21 & 1) != 0)
    {
      *(void *)(inited + 96) = &type metadata for String;
      sub_1000168F8();
      *(void *)(inited + 72) = v24;
      *(void *)(inited + 80) = v23;
    }

    else
    {
      *(void *)(v0 + 448) = &type metadata for Int;
      *(void *)(v0 + 424) = v20;
      sub_100016968((_OWORD *)(inited + 72), (_OWORD *)(v0 + 424));
    }

    sub_100016950();
    sub_1000169D0();
    uint64_t v25 = AnyHashable.init<A>(_:)(v0 + 504, &type metadata for String, &protocol witness table for String);
    uint64_t v26 = JSError.line.getter(v25);
    if ((v27 & 1) != 0)
    {
      *(void *)(inited + 168) = &type metadata for String;
      *(void *)(inited + 144) = v2;
      *(void *)(inited + 152) = 0xE700000000000000LL;
    }

    else
    {
      *(void *)(v0 + 480) = &type metadata for Int;
      *(void *)(v0 + 456) = v26;
      sub_100016968((_OWORD *)(inited + 144), (_OWORD *)(v0 + 456));
    }

    uint64_t v28 = *(void *)(v0 + 632);
    uint64_t v29 = *(void *)(v0 + 616);
    uint64_t v30 = *(void *)(v0 + 608);
    sub_100016910();
    *(void *)(v0 + 528) = 0xE700000000000000LL;
    uint64_t v31 = sub_100016978(v0 + 520);
    uint64_t v32 = JSError.message.getter(v31);
    *(void *)(inited + 240) = &type metadata for String;
    *(void *)(inited + 216) = v32;
    *(void *)(inited + 224) = v33;
    sub_100016828();
    uint64_t v34 = sub_100016978(v0 + 536);
    uint64_t v35 = JSError.sourceURL.getter(v34);
    *(void *)(inited + 312) = &type metadata for String;
    if (v36) {
      uint64_t v37 = v35;
    }
    else {
      uint64_t v37 = v2;
    }
    if (v36) {
      unint64_t v38 = v36;
    }
    else {
      unint64_t v38 = 0xE700000000000000LL;
    }
    *(void *)(inited + 288) = v37;
    *(void *)(inited + 296) = v38;
    uint64_t v39 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v39);
    objc_msgSend(v16, "ams_errorByAddingUserInfo:", isa);

    uint64_t v41 = swift_errorRelease(v49);
    swift_willThrow(v41);
    swift_errorRelease(v51);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  }

  else
  {
    sub_10001686C();
    sub_100016660(v0 + 552, &qword_100050B58);
    swift_willThrow(v22);
  }

  uint64_t v42 = *(void *)(v0 + 720);
  uint64_t v43 = *(void *)(v0 + 712);
  uint64_t v44 = *(void *)(v0 + 688);
  uint64_t v45 = *(void *)(v0 + 664);
  uint64_t v47 = *(void *)(v0 + 632);
  uint64_t v48 = *(void *)(v0 + 624);
  uint64_t v50 = *(void *)(v0 + 600);
  JSStack.requestGarbageCollection()();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((void *)(v0 + 384));
  sub_1000169C0();
  sub_100016984();
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  sub_1000169B0();
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v50);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100015AC8(void *a1)
{
  uint64_t v2 = v1;
  sub_100006674(&qword_1000505B8);
  sub_100016810();
  __chkstk_darwin(v4, v5);
  sub_10000D574();
  uint64_t v76 = v6;
  uint64_t v74 = type metadata accessor for JSRequest(0LL);
  uint64_t v78 = *(void *)(v74 - 8);
  sub_100016810();
  __chkstk_darwin(v7, v8);
  sub_1000168D8();
  uint64_t v11 = v10 - v9;
  uint64_t v77 = type metadata accessor for JSRoute(0LL);
  uint64_t v80 = *(void *)(v77 - 8);
  sub_100016810();
  uint64_t v14 = __chkstk_darwin(v12, v13);
  id v16 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14, v17);
  uint64_t v79 = (char *)&v73 - v18;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  sub_100016810();
  __chkstk_darwin(v19, v20);
  sub_1000168D8();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v25 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v26 = swift_allocObject( v24,  ((*(unsigned __int8 *)(v25 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))
        + 3LL * *(void *)(v25 + 72),
          *(unsigned __int8 *)(v25 + 80) | 7LL);
  *(_OWORD *)(v26 + 16) = xmmword_10003BCD0;
  *((void *)&v82 + 1) = type metadata accessor for JSDataProvider();
  *(void *)&__int128 v81 = v2;
  uint64_t v75 = v2;
  uint64_t v27 = swift_retain(v2);
  id v28 = (id)AMSLogKey(v27);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    uint64_t v31 = v11;
    uint64_t v32 = v16;
    uint64_t v33 = a1;
    uint64_t v35 = v34;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    uint64_t v36 = sub_1000168AC();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata(v36);
    sub_100016928(MetatypeMetadata);
    sub_1000169A4();
    v38._countAndFlagsBits = 5972026LL;
    v38._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v38);
    v84[3] = &type metadata for String;
    v84[0] = v30;
    v84[1] = v35;
    a1 = v33;
    id v16 = v32;
    uint64_t v11 = v31;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v84);
    sub_1000169A4();
    uint64_t v39 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    uint64_t v40 = sub_1000168AC();
    uint64_t v41 = swift_getMetatypeMetadata(v40);
    sub_100016928(v41);
    sub_100016660((uint64_t)v84, (uint64_t *)&unk_1000509C0);
    uint64_t v39 = 58LL;
  }

  unint64_t v42 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v39);
  LogMessage.init(stringInterpolation:)(v23);
  type metadata accessor for Log();
  sub_1000169C8();
  LogMessage.init(stringLiteral:)(0xD00000000000001BLL, 0x800000010003E430LL);
  uint64_t v43 = type metadata accessor for JSServiceRequest(0LL);
  *((void *)&v82 + 1) = v43;
  sub_10000D298(&v81);
  sub_10001655C((uint64_t)a1, v44);
  uint64_t v45 = static LogMessage.sensitive(_:)(&v81);
  sub_100016938(v45, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v26);
  swift_bridgeObjectRelease(v26);
  uint64_t v46 = v79;
  JSRoute.init(service:function:)(0x732D726574756F72LL, 0xEE00656369767265LL, 0x6574756F72LL, 0xE500000000000000LL);
  uint64_t v47 = v77;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v16, v46, v77);
  JSRequest.init(route:timeoutInterval:version:)(v16, 0LL, 1LL, 0LL);
  uint64_t v48 = a1[1];
  if (v48)
  {
    uint64_t v49 = *a1;
    *((void *)&v82 + 1) = &type metadata for String;
    *(void *)&__int128 v81 = v49;
    *((void *)&v81 + 1) = v48;
  }

  else
  {
    __int128 v81 = 0u;
    __int128 v82 = 0u;
  }

  uint64_t v50 = v76;
  swift_bridgeObjectRetain(v48);
  uint64_t v51 = sub_1000169B8();
  sub_100016938(v51, (uint64_t *)&unk_1000509C0);
  uint64_t v52 = a1[2];
  if (v52)
  {
    *((void *)&v82 + 1) = sub_100006674(&qword_100050280);
    *(void *)&__int128 v81 = v52;
  }

  else
  {
    __int128 v81 = 0u;
    __int128 v82 = 0u;
  }

  swift_bridgeObjectRetain(v52);
  uint64_t v53 = sub_1000169B8();
  sub_100016938(v53, (uint64_t *)&unk_1000509C0);
  sub_100016618((uint64_t)a1 + *(int *)(v43 + 24), v50);
  uint64_t v54 = type metadata accessor for URL(0LL);
  uint64_t v55 = sub_10001698C(v50);
  if ((_DWORD)v55 == 1)
  {
    sub_100016660(v50, &qword_1000505B8);
    __int128 v81 = 0u;
    __int128 v82 = 0u;
  }

  else
  {
    uint64_t v57 = URL.absoluteString.getter(v55, v56);
    *((void *)&v82 + 1) = &type metadata for String;
    *(void *)&__int128 v81 = v57;
    *((void *)&v81 + 1) = v58;
    sub_100016970(v50, *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v54 - 8) + 8LL));
  }

  uint64_t v60 = v74;
  uint64_t v59 = v75;
  uint64_t v61 = sub_1000169B8();
  sub_100016938(v61, (uint64_t *)&unk_1000509C0);
  uint64_t v62 = sub_100006674(&qword_100050B88);
  uint64_t v63 = Promise.__allocating_init()(v62);
  uint64_t v64 = *(void *)(v59 + 16);
  uint64_t v65 = JSStack.performRequest(_:)(v11);
  uint64_t v66 = sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v67 = swift_retain_n(v63, 2LL);
  uint64_t v68 = static OS_dispatch_queue.main.getter(v67);
  *((void *)&v82 + 1) = v66;
  uint64_t v83 = &protocol witness table for OS_dispatch_queue;
  *(void *)&__int128 v81 = v68;
  Promise.then(perform:orCatchError:on:)(j___s9JetEngine7PromiseC7resolveyyxF, v63, sub_10001669C, v63, &v81);
  swift_release(v65);
  swift_release_n(v63, 2LL);
  sub_1000169C8();
  *((void *)&v82 + 1) = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v83 = &protocol witness table for SyncTaskScheduler;
  sub_10000D298(&v81);
  SyncTaskScheduler.init()(v69);
  uint64_t v70 = swift_allocObject(&unk_100049EE0, 24LL, 7LL);
  swift_weakInit(v70 + 16, v64);
  uint64_t v71 = swift_allocObject(&unk_100049F08, 32LL, 7LL);
  *(void *)(v71 + 16) = v59;
  *(void *)(v71 + 24) = v70;
  swift_retain(v59);
  Promise.always(on:perform:)(&v81, sub_1000166F4, v71);
  swift_release(v71);
  (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v11, v60);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v79, v47);
  sub_1000169C8();
  return v63;
}

uint64_t sub_1000160D8(uint64_t a1)
{
  uint64_t v2 = sub_100006674(&qword_100050B58);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSError(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v18 - v13;
  uint64_t v19 = a1;
  swift_errorRetain(a1);
  uint64_t v15 = sub_100006674(&qword_100050B70);
  if ((swift_dynamicCast(v5, &v19, v15, v6, 6LL) & 1) != 0)
  {
    sub_100007438((uint64_t)v5, 0LL, 1LL, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v5, v6);
    sub_100007498(0LL, &qword_100050B90, &OBJC_CLASS___NSError_ptr);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v14, v6);
    id v16 = sub_10002F330((uint64_t)v11);
    Promise.reject(_:)(v16);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v14, v6);
  }

  else
  {
    sub_100007438((uint64_t)v5, 1LL, 1LL, v6);
    sub_100016660((uint64_t)v5, &qword_100050B58);
    return Promise.reject(_:)(a1);
  }

uint64_t sub_10001628C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a3 + 16;
  uint64_t v10 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v11 = type metadata accessor for LogMessage(0LL);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v11 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_10003BD40;
  uint64_t v35 = type metadata accessor for JSDataProvider();
  v34[0] = a2;
  uint64_t v13 = swift_retain(a2);
  id v14 = (id)AMSLogKey(v13);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v18 = v17;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v19._countAndFlagsBits = 0LL;
    v19._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v19);
    uint64_t v20 = v35;
    uint64_t v21 = sub_100007060(v34, v35);
    uint64_t DynamicType = swift_getDynamicType(v21, v20, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v32[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_100016660((uint64_t)v32, (uint64_t *)&unk_1000509C0);
    v23._countAndFlagsBits = 5972026LL;
    v23._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v32[0] = v16;
    v32[1] = v18;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_100016660((uint64_t)v32, (uint64_t *)&unk_1000509C0);
    uint64_t v24 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v25._countAndFlagsBits = 0LL;
    v25._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    uint64_t v26 = v35;
    uint64_t v27 = sub_100007060(v34, v35);
    uint64_t v28 = swift_getDynamicType(v27, v26, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v28);
    v32[0] = v28;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v32);
    sub_100016660((uint64_t)v32, (uint64_t *)&unk_1000509C0);
    uint64_t v24 = 58LL;
  }

  unint64_t v29 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
  LogMessage.init(stringInterpolation:)(v8);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v34);
  LogMessage.init(stringLiteral:)(0xD00000000000002ALL, 0x800000010003E450LL);
  sub_10002C300(v12);
  swift_bridgeObjectRelease(v12);
  swift_beginAccess(v9, v34, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v9);
  if (result)
  {
    uint64_t v31 = result;
    JSStack.requestGarbageCollection()();
    return swift_release(v31);
  }

  return result;
}

uint64_t sub_100016518()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for JSDataProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService14JSDataProvider);
}

uint64_t sub_10001655C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSServiceRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_1000165A0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_10000870C();
}

void *sub_1000165DC(void *a1)
{
  return a1;
}

void sub_100016610(void *a1)
{
}

uint64_t sub_100016618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_1000505B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_100016660(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006674(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_10000870C();
}

uint64_t sub_10001669C(uint64_t a1)
{
  return sub_1000160D8(a1);
}

uint64_t sub_1000166A4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000166C8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000166F4(uint64_t a1)
{
  return sub_10001628C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t storeEnumTagSinglePayload for DynamicUIFeatureFlags(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10001673C + 4 * byte_10003C210[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10001675C + 4 * byte_10003C215[v4]))();
  }
}

_BYTE *sub_10001673C(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_10001675C(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100016764(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_10001676C(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100016774(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_10001677C(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DynamicUIFeatureFlags()
{
  return &type metadata for DynamicUIFeatureFlags;
}

unint64_t sub_10001679C()
{
  unint64_t result = qword_100050B98;
  if (!qword_100050B98)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C2A8, &type metadata for DynamicUIFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_100050B98);
  }

  return result;
}

uint64_t sub_1000167D8@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_1000167E8(uint64_t a1)
{
  return inject<A, B>(_:from:)(a1, v1, a1, v2);
}

uint64_t sub_1000167FC(uint64_t a1, uint64_t a2)
{
  return inject<A, B>(_:from:)(a1, a2, a1, v2);
}

uint64_t sub_100016808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return inject<A, B>(_:from:)(a1, a2, a3, v3);
}

  ;
}

uint64_t sub_10001681C(uint64_t a1)
{
  return v1(a1, v2, v3);
}

void sub_100016828()
{
  *(void *)(v0 + 536) = 0x5255656372756F73LL;
  *(void *)(v0 + 544) = 0xE90000000000004CLL;
}

__n128 *sub_10001684C(__n128 *result, __n128 a2)
{
  result[1] = a2;
  *(void *)(v2 + 488) = 0x6E6D756C6F63LL;
  *(void *)(v2 + 496) = 0xE600000000000000LL;
  return result;
}

uint64_t sub_10001686C()
{
  return sub_100007438(*(void *)(v0 + 600), 1LL, 1LL, *(void *)(v0 + 608));
}

uint64_t sub_100016884@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_100016898()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 256) + 8LL))( *(void *)(v0 - 264),  *(void *)(v0 - 248));
}

uint64_t sub_1000168AC()
{
  uint64_t v1 = *(void *)(v0 - 136);
  uint64_t v2 = sub_100007060((void *)(v0 - 160), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

id sub_1000168D0@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 - 256);
}

  ;
}

uint64_t sub_1000168E8()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 240) + 8LL))( *(void *)(v0 - 200),  *(void *)(v0 - 232));
}

  ;
}

void sub_100016910()
{
  *(void *)(v0 + 520) = 0x6567617373656DLL;
}

uint64_t sub_100016928(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 112);
}

void sub_100016938(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_100016940()
{
  return swift_retain(*(void *)(v0 - 184));
}

  ;
}

_OWORD *sub_100016968@<X0>(_OWORD *a1@<X1>, _OWORD *a2@<X8>)
{
  return sub_10000750C(a2, a1);
}

uint64_t sub_100016970@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100016978(uint64_t a1)
{
  return AnyHashable.init<A>(_:)(a1, v2, v1);
}

uint64_t sub_100016984()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_10001698C(uint64_t a1)
{
  return sub_10000748C(a1, 1LL, v1);
}

uint64_t sub_100016998(uint64_t a1)
{
  return AnyHashable.init<A>(_:)(a1, v1, v2);
}

void sub_1000169A4()
{
}

uint64_t sub_1000169B0()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1000169B8()
{
  return JSRequest.addOption(_:withName:)();
}

uint64_t sub_1000169C0()
{
  return swift_task_dealloc(v0);
}

uint64_t sub_1000169C8()
{
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((void *)(v0 - 160));
}

void sub_1000169D0()
{
  *(void *)(v0 + 504) = 1701734764LL;
  *(void *)(v0 + 512) = 0xE400000000000000LL;
}

uint64_t sub_1000169E4()
{
  return *(void *)(v0 + 600);
}

uint64_t sub_1000169F8()
{
  return swift_bridgeObjectRetain(*(void *)(v0 - 72));
}

void *sub_100016A04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *uint64_t v3 = a2;
  v3[1] = v2;
  v3[2] = a1;
  return v3;
}

uint64_t sub_100016A24()
{
  if ((deviceIsRunningInternalBuild() & 1) != 0) {
    return 0x6C616E7265746E69LL;
  }
  return 0x72656D6F74737563LL;
}

uint64_t sub_100016A9C()
{
  return sub_100016B0C((SEL *)&selRef_deviceGUID);
}

uint64_t sub_100016AB4()
{
  return sub_100016B0C((SEL *)&selRef_language);
}

uint64_t sub_100016B00()
{
  return sub_100016B0C((SEL *)&selRef_productType);
}

uint64_t sub_100016B0C(SEL *a1)
{
  id v1 = [(id)objc_opt_self(AMSDevice) *a1];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v2;
}

uint64_t sub_100016B74()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___AMSDevice);
  uint64_t result = sub_100016C5C(v0);
  if (!v2) {
    return 0x6E776F6E6B6E75LL;
  }
  return result;
}

id sub_100016BBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSDeviceObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100016C0C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSDeviceObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSDeviceObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService14JSDeviceObject);
}

uint64_t sub_100016C5C(void *a1)
{
  id v1 = [a1 serialNumber];
  if (!v1) {
    return 0LL;
  }
  objc_super v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

uint64_t sub_100016CC0()
{
  return 0LL;
}

uint64_t sub_100016CCC(uint64_t a1)
{
  return sub_1000173C8(a1, (uint64_t)sub_100018434);
}

uint64_t sub_100016CD8(void *a1, void *a2, void *a3)
{
  id v60 = a1;
  uint64_t v6 = type metadata accessor for JSPromise(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  id v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v16 = static RunLoopWorkerThread.current.getter();
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = sub_1000090D0(a2);
    if (v3)
    {
      swift_release(v17);
    }

    else
    {
      uint64_t v55 = v18;
      uint64_t v19 = sub_100006674((uint64_t *)&unk_100051BB0);
      uint64_t v20 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
      uint64_t v21 = *(void *)(v20 + 72);
      uint64_t v22 = *(unsigned __int8 *)(v20 + 80);
      uint64_t v53 = v21;
      uint64_t v23 = swift_allocObject(v19, ((v22 + 32) & ~v22) + 3 * v21, v22 | 7);
      *(_OWORD *)(v23 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
      uint64_t v54 = v23;
      uint64_t v59 = (ValueMetadata *)type metadata accessor for JSEngagementObject();
      v58[0] = a3;
      id v52 = a3;
      id v24 = (id)AMSLogKey(v52);
      if (v24)
      {
        Swift::String v25 = v24;
        uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        uint64_t v51 = v27;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v28._countAndFlagsBits = 0LL;
        v28._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v28);
        unint64_t v29 = v59;
        uint64_t v30 = sub_100007060(v58, (uint64_t)v59);
        uint64_t DynamicType = swift_getDynamicType(v30, v29, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v56[0] = DynamicType;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v56);
        sub_100008D04((uint64_t)v56);
        v32._countAndFlagsBits = 5972026LL;
        v32._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v32);
        uint64_t MetatypeMetadata = &type metadata for String;
        v56[0] = v26;
        v56[1] = v51;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v56);
        sub_100008D04((uint64_t)v56);
        uint64_t v33 = 93LL;
      }

      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v37._countAndFlagsBits = 0LL;
        v37._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v37);
        Swift::String v38 = v59;
        uint64_t v39 = sub_100007060(v58, (uint64_t)v59);
        uint64_t v40 = swift_getDynamicType(v39, v38, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v56[0] = v40;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v56);
        sub_100008D04((uint64_t)v56);
        uint64_t v33 = 58LL;
      }

      unint64_t v41 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v33);
      LogMessage.init(stringInterpolation:)(v14);
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v58);
      LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x800000010003E690LL);
      uint64_t v59 = &type metadata for EngagementEvent;
      uint64_t v42 = v55;
      v58[0] = v55;
      swift_bridgeObjectRetain(v55);
      static LogMessage.safe(_:)(v58);
      sub_100008D04((uint64_t)v58);
      uint64_t v43 = v54;
      sub_10002C300(v54);
      swift_bridgeObjectRelease(v43);
      uint64_t v44 = (void *)swift_allocObject(&unk_10004A090, 40LL, 7LL);
      uint64_t v45 = v52;
      v44[2] = v42;
      void v44[3] = v45;
      v44[4] = v17;
      id v46 = v45;
      id v47 = v60;
      swift_retain(v17);
      uint64_t v48 = JSPromise.init(in:executor:)(v47, sub_100018480, v44);
      uint64_t v15 = JSPromise.value.getter(v48);
      swift_release(v17);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }

  else
  {
    uint64_t v34 = type metadata accessor for JSError(0LL);
    unint64_t v35 = sub_100009214();
    swift_allocError(v34, v35, 0LL, 0LL);
    uint64_t v36 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v36);
  }

  return v15;
}

uint64_t sub_1000170FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v42 = a6;
  Swift::String v37 = a5;
  uint64_t v39 = a3;
  uint64_t v8 = type metadata accessor for JSCallable(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8, v11);
  uint64_t v36 = v10;
  uint64_t v44 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v12 = [objc_allocWithZone(AMSEngagement) init];
  id v41 = v12;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v14 = [v12 enqueueData:isa];

  sub_100006674(&qword_100050BF8);
  id v40 = v14;
  uint64_t v38 = Promise<A>.init(_:)();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v16 = v8;
  v15((char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), a2, v8);
  uint64_t v17 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v19 = v17 | 7;
  uint64_t v20 = swift_allocObject(&unk_10004A0B8, v18 + v10, v17 | 7);
  uint64_t v21 = v37;
  *(void *)(v20 + swift_weakDestroy(v0 + 16) = v37;
  *(void *)(v20 + 24) = a1;
  uint64_t v22 = v20 + v18;
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  id v24 = v44;
  uint64_t v35 = v16;
  v23(v22, v44, v16);
  v15(v24, v39, v16);
  uint64_t v25 = (v17 + 24) & ~v17;
  unint64_t v26 = (v36 + v25 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v27 = swift_allocObject(&unk_10004A0E0, v26 + 8, v19);
  *(void *)(v27 + swift_weakDestroy(v0 + 16) = v21;
  v23(v27 + v25, v44, v35);
  *(void *)(v27 + v26) = a1;
  v43[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v43[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v28 = v42;
  v43[0] = v42;
  id v29 = v21;
  id v30 = a1;
  id v31 = v29;
  id v32 = v30;
  swift_retain(v28);
  uint64_t v33 = v38;
  Promise.then(perform:orCatchError:on:)(sub_10001850C, v20, sub_100018618, v27, v43);

  swift_release(v33);
  swift_release(v20);
  swift_release(v27);

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v43);
}

uint64_t sub_1000173BC(uint64_t a1)
{
  return sub_1000173C8(a1, (uint64_t)sub_10001838C);
}

uint64_t sub_1000173C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_1000090C0(a1, &qword_100050900, &OBJC_CLASS___JSContext_ptr);
  uint64_t v6 = (void *)static JSContext.requiredCurrent.getter();
  v9[2] = a1;
  v9[3] = v4;
  uint64_t v7 = JSContext.propagateErrorsToExceptions(_:)(a2, v9);

  return v7;
}

uint64_t sub_100017438(void *a1, void *a2, void *a3)
{
  id v64 = a1;
  uint64_t v6 = type metadata accessor for JSPromise(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  id v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v16 = static RunLoopWorkerThread.current.getter();
  if (v16)
  {
    uint64_t v17 = v16;
    sub_100009288(a2);
    if (v3)
    {
      swift_release(v17);
    }

    else
    {
      uint64_t v54 = v7;
      uint64_t v57 = v20;
      uint64_t v58 = v19;
      uint64_t v59 = v18;
      uint64_t v21 = sub_100006674((uint64_t *)&unk_100051BB0);
      uint64_t v22 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
      uint64_t v23 = swift_allocObject( v21,  ((*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))
            + 3LL * *(void *)(v22 + 72),
              *(unsigned __int8 *)(v22 + 80) | 7LL);
      *(_OWORD *)(v23 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
      uint64_t v55 = v23;
      uint64_t v63 = (ValueMetadata *)type metadata accessor for JSEngagementObject();
      v62[0] = a3;
      id v56 = a3;
      id v24 = (id)AMSLogKey(v56);
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        uint64_t v53 = v27;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v28._countAndFlagsBits = 0LL;
        v28._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v28);
        id v29 = v63;
        id v30 = sub_100007060(v62, (uint64_t)v63);
        uint64_t DynamicType = swift_getDynamicType(v30, v29, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v60[0] = DynamicType;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v60);
        sub_100008D04((uint64_t)v60);
        v32._countAndFlagsBits = 5972026LL;
        v32._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v32);
        uint64_t MetatypeMetadata = &type metadata for String;
        v60[0] = v26;
        v60[1] = v53;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v60);
        sub_100008D04((uint64_t)v60);
        uint64_t v33 = 93LL;
      }

      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v37._countAndFlagsBits = 0LL;
        v37._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v37);
        uint64_t v38 = v63;
        uint64_t v39 = sub_100007060(v62, (uint64_t)v63);
        uint64_t v40 = swift_getDynamicType(v39, v38, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v60[0] = v40;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v60);
        sub_100008D04((uint64_t)v60);
        uint64_t v33 = 58LL;
      }

      unint64_t v41 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v33);
      LogMessage.init(stringInterpolation:)(v14);
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v62);
      LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x800000010003E610LL);
      uint64_t v43 = v58;
      uint64_t v42 = v59;
      v62[0] = v59;
      v62[1] = v58;
      uint64_t v44 = v57;
      v62[2] = v57;
      uint64_t v63 = &type metadata for EngagementMessageEvent;
      swift_bridgeObjectRetain(v58);
      swift_bridgeObjectRetain(v44);
      static LogMessage.safe(_:)(v62);
      sub_100008D04((uint64_t)v62);
      uint64_t v45 = v55;
      sub_10002C300(v55);
      swift_bridgeObjectRelease(v45);
      id v46 = (void *)swift_allocObject(&unk_10004A018, 56LL, 7LL);
      v46[2] = v42;
      void v46[3] = v43;
      id v47 = v56;
      v46[4] = v44;
      v46[5] = v47;
      v46[6] = v17;
      id v48 = v47;
      id v49 = v64;
      swift_retain(v17);
      uint64_t v50 = JSPromise.init(in:executor:)(v49, sub_1000183E0, v46);
      uint64_t v15 = JSPromise.value.getter(v50);
      swift_release(v17);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v6);
    }
  }

  else
  {
    uint64_t v34 = type metadata accessor for JSError(0LL);
    unint64_t v35 = sub_100009214();
    swift_allocError(v34, v35, 0LL, 0LL);
    uint64_t v36 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v36);
  }

  return v15;
}

uint64_t sub_100017874( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  uint64_t v50 = a8;
  uint64_t v45 = a7;
  uint64_t v47 = a3;
  uint64_t v52 = a1;
  uint64_t v12 = type metadata accessor for JSCallable(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12, v15);
  uint64_t v44 = v14;
  uint64_t v16 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v17 = [objc_allocWithZone(AMSEngagement) init];
  id v49 = v17;
  id v18 = sub_1000095E8(a4, a5, a6);
  id v19 = [v17 enqueueMessageEvent:v18];

  sub_100006674(&qword_100050BF0);
  id v48 = v19;
  uint64_t v46 = Promise<A>.init(_:)();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  uint64_t v43 = v16;
  uint64_t v21 = a2;
  uint64_t v22 = v12;
  v20(v16, v21, v12);
  uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v24 = (v23 + 32) & ~v23;
  uint64_t v25 = v23 | 7;
  uint64_t v26 = swift_allocObject(&unk_10004A040, v24 + v14, v23 | 7);
  uint64_t v27 = v45;
  Swift::String v28 = v52;
  *(void *)(v26 + swift_weakDestroy(v0 + 16) = v45;
  *(void *)(v26 + 24) = v28;
  id v29 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  uint64_t v42 = v22;
  v29(v26 + v24, v16, v22);
  v20(v16, v47, v22);
  uint64_t v30 = (v23 + 24) & ~v23;
  unint64_t v31 = (v44 + v30 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v32 = swift_allocObject(&unk_10004A068, v31 + 8, v25);
  *(void *)(v32 + swift_weakDestroy(v0 + 16) = v27;
  v29(v32 + v30, v43, v42);
  uint64_t v33 = v52;
  *(void *)(v32 + v31) = v52;
  void v51[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v51[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v34 = v50;
  v51[0] = v50;
  id v35 = v27;
  id v36 = v33;
  id v37 = v35;
  id v38 = v36;
  swift_retain(v34);
  uint64_t v39 = v46;
  Promise.then(perform:orCatchError:on:)(sub_100018404, v26, sub_100018428, v32, v51);

  swift_release(v39);
  swift_release(v26);
  swift_release(v32);

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v51);
}

void sub_100017ADC( void **a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, id))
{
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10, v11);
  sub_100013C4C();
  id v29 = *a1;
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
        + 2LL * *(void *)(v13 + 72),
          *(unsigned __int8 *)(v13 + 80) | 7LL);
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v26 = type metadata accessor for JSEngagementObject();
  id v25 = sub_10001869C(v26);
  id v15 = (id)AMSLogKey(v25);
  if (v15)
  {
    sub_100013C8C((uint64_t)v15);

    sub_100013BF0();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v16 = sub_100013C10();
    sub_100013BBC(v16);
    sub_100013BE0();
    sub_100008DBC();
    sub_100013C7C();
    sub_100013BE0();
    v17._countAndFlagsBits = 93LL;
  }

  else
  {
    sub_100013C00();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v18 = sub_100013C10();
    sub_100013BBC(v18);
    sub_100013BE0();
    v17._countAndFlagsBits = 58LL;
  }

  v17._object = (void *)0xE100000000000000LL;
  sub_100013BE8(v17);
  LogMessage.init(stringInterpolation:)(v7);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v32);
  LogMessage.init(stringLiteral:)(a5, a6);
  sub_10002C300(v14);
  swift_bridgeObjectRelease(v14);
  id v19 = v29;
  uint64_t v20 = (void *)a7(a3, v19);
  uint64_t v21 = sub_100006674(&qword_1000509E0);
  uint64_t v22 = sub_100013C9C(v21);
  *(_OWORD *)(v22 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  *(void *)(v22 + 56) = sub_1000090C0(v22, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v22 + 32) = v20;
  id v23 = v20;
  uint64_t v24 = (void *)JSCallable.call(_:)(v22);

  swift_bridgeObjectRelease(v22);
  sub_100013C18();
}

void sub_100017E5C(uint64_t a1, void *a2, uint64_t a3, objc_class *a4, uint64_t a5)
{
  uint64_t v42 = a5;
  uint64_t v8 = type metadata accessor for JSError(0LL);
  uint64_t v43 = *(void *)(v8 - 8);
  uint64_t v44 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v12, v13);
  sub_100013C4C();
  uint64_t v14 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v15 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  uint64_t v17 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (v17 + 32) & ~v17;
  uint64_t v41 = v14;
  uint64_t v39 = v18 + 3 * v16;
  uint64_t v38 = v17 | 7;
  uint64_t v19 = swift_allocObject(v14, v39, v17 | 7);
  __int128 v37 = xmmword_10003BCD0;
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v40 = v18;
  uint64_t v36 = type metadata accessor for JSEngagementObject();
  id v35 = sub_10001869C(v36);
  id v20 = (id)AMSLogKey(v35);
  v45.super.Class isa = a4;
  if (v20)
  {
    uint64_t v21 = sub_100013C8C((uint64_t)v20);
    uint64_t v23 = v22;

    sub_100013BF0();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v24 = sub_100013C10();
    sub_100013BBC(v24);
    sub_100013BE0();
    sub_100008DBC();
    uint64_t v50 = &type metadata for String;
    uint64_t v48 = v21;
    uint64_t v49 = v23;
    sub_100013C7C();
    sub_100013BE0();
    v25._countAndFlagsBits = 93LL;
  }

  else
  {
    sub_100013C00();
    sub_100013BD0();
    sub_100013B98();
    uint64_t v26 = sub_100013C10();
    sub_100013BBC(v26);
    sub_100013BE0();
    v25._countAndFlagsBits = 58LL;
  }

  v25._object = (void *)0xE100000000000000LL;
  sub_100013BE8(v25);
  sub_100013C30();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v51);
  LogMessage.init(stringLiteral:)(0xD00000000000002ALL, v42);
  swift_getErrorValue(a1);
  uint64_t v27 = v46;
  uint64_t v28 = v47;
  void v51[3] = v47;
  id v29 = sub_100013CD8();
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16LL))(v29, v27, v28);
  static LogMessage.safe(_:)(v51);
  sub_100013C84();
  sub_10002C320(v19);
  sub_100013C64();
  uint64_t v30 = sub_100006674(&qword_1000509E0);
  uint64_t v31 = sub_100013C9C(v30);
  *(_OWORD *)(v31 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  swift_errorRetain(a1);
  sub_1000186A8(a1);
  Class isa = JSError.makeValue(in:)(v45).super.isa;
  uint64_t v33 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v11, v44);
  *(void *)(v31 + 56) = sub_1000090C0(v33, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v31 + 32) = isa;
  uint64_t v34 = (void *)JSCallable.call(_:)(v31);
  sub_100013C64();

  sub_100013C18();
}

id sub_1000182EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSEngagementObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10001833C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSEngagementObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSEngagementObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService18JSEngagementObject);
}

uint64_t sub_10001838C(void *a1)
{
  return sub_100017438(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000183A4()
{
  swift_release(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000183E0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100017874( a1,  a2,  a3,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(void *)(v3 + 32),  *(void **)(v3 + 40),  *(void *)(v3 + 48));
}

void sub_100018404(void **a1)
{
}

void sub_100018428(uint64_t a1)
{
}

uint64_t sub_100018434(void *a1)
{
  return sub_100016CD8(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001844C()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100018480(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000170FC(a1, a2, a3, *(void *)(v3 + 16), *(void **)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_1000184A0()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;

  sub_100013C3C();
  return swift_deallocObject(v0, v3, v4);
}

void sub_10001850C(void **a1)
{
}

void sub_10001852C(void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, id))
{
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(sub_100013C94() - 8) + 80LL);
  sub_100017ADC(a1, *(void **)(v4 + 16), *(void *)(v4 + 24), v4 + ((v9 + 32) & ~v9), a2, a3, a4);
}

uint64_t sub_100018598()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8LL;

  sub_100013C3C();
  return swift_deallocObject(v0, v4 + 8, v3);
}

void sub_100018618(uint64_t a1)
{
}

void sub_100018624(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100013C94() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_100017E5C( a1,  *(void **)(v2 + 16),  v2 + v6,  *(objc_class **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8LL)),  a2);
}

void sub_100018688(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_100018694(void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, id))
{
}

id sub_10001869C(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 120) = v1;
  return v1;
}

uint64_t sub_1000186A8(uint64_t a1)
{
  uint64_t v2 = sub_100006674(&qword_100050B58);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSError(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = a1;
  swift_errorRetain(a1);
  uint64_t v11 = sub_100006674(&qword_100050B70);
  if ((swift_dynamicCast(v5, &v31, v11, v6, 6LL) & 1) != 0)
  {
    sub_1000188BC((uint64_t)v5, 0LL);
    uint64_t v12 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v10, v5, v6);
    uint64_t v13 = JSError.message.getter(v12);
    uint64_t v27 = v14;
    uint64_t v28 = v13;
    uint64_t v26 = JSError.line.getter();
    uint64_t v16 = v15 & 1;
    uint64_t v17 = JSError.column.getter();
    uint64_t v19 = v18 & 1;
    uint64_t v20 = JSError.sourceURL.getter();
    uint64_t v22 = v21;
    JSError.constructorName.getter();
    JSError.init(message:line:column:sourceURL:constructorName:)(v28, v27, v26, v16, v17, v19, v20, v22);
    sub_1000188C8();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  else
  {
    sub_1000188BC((uint64_t)v5, 1LL);
    sub_10001887C((uint64_t)v5);
    swift_getErrorValue(a1);
    uint64_t v24 = Error.localizedDescription.getter(v29, v30);
    JSError.init(message:line:column:sourceURL:constructorName:)(v24, v25, 0LL, 1LL, 0LL, 1LL, 0LL, 0LL);
    return sub_1000188C8();
  }

uint64_t sub_10001887C(uint64_t a1)
{
  uint64_t v2 = sub_100006674(&qword_100050B58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000188BC(uint64_t a1, uint64_t a2)
{
  return sub_100007438(a1, a2, 1LL, v2);
}

uint64_t sub_1000188C8()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100018928()
{
  return swift_bridgeObjectRetain(*(void *)(v0
                                            + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject_localizations));
}

void sub_100018938()
{
}

id sub_100018970()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLocalizationObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSLocalizationObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService20JSLocalizationObject);
}

uint64_t sub_1000189D0(uint64_t a1)
{
  return sub_100018B5C(a1, (void (*)(uint64_t))sub_10002C2E0);
}

uint64_t sub_100018A30(uint64_t a1)
{
  return sub_100018B5C(a1, (void (*)(uint64_t))sub_10002C300);
}

uint64_t sub_100018A90(uint64_t a1)
{
  return sub_100018B5C(a1, (void (*)(uint64_t))sub_10002C320);
}

uint64_t sub_100018AF0(uint64_t a1)
{
  return sub_100018B5C(a1, (void (*)(uint64_t))sub_10002C340);
}

uint64_t sub_100018B50(uint64_t a1)
{
  return sub_100018B5C(a1, (void (*)(uint64_t))sub_10002C360);
}

uint64_t sub_100018B5C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4 = v2;
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = JSValue.string.getter(v7);
  if (v11)
  {
    uint64_t v12 = result;
    uint64_t v13 = v11;
    uint64_t v14 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v15 = type metadata accessor for LogMessage(0LL);
    uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v15 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
    uint64_t v29 = (void *)type metadata accessor for JSLogObject();
    v28[0] = v4;
    id v17 = (id)AMSLogKey(v4);
    if (v17)
    {
      char v18 = v17;
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      uint64_t v21 = v20;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      sub_100018E6C();
      sub_10000A948();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_100018E58(MetatypeMetadata);
      sub_100008D94();
      v23._countAndFlagsBits = 5972026LL;
      v23._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v23);
      v27[3] = &type metadata for String;
      v27[0] = v19;
      v27[1] = v21;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
      sub_100008D94();
      uint64_t v24 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      sub_100018E6C();
      sub_10000A948();
      uint64_t v25 = swift_getMetatypeMetadata();
      sub_100018E58(v25);
      sub_100008D94();
      uint64_t v24 = 58LL;
    }

    unint64_t v26 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
    LogMessage.init(stringInterpolation:)(v9);
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v28);
    uint64_t v29 = &type metadata for String;
    v28[0] = v12;
    v28[1] = v13;
    static LogMessage.safe(_:)(v28);
    sub_100008D04((uint64_t)v28);
    a2(v16);
    return swift_bridgeObjectRelease(v16);
  }

  return result;
}

id sub_100018DB8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLogObject();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100018E08()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSLogObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSLogObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService11JSLogObject);
}

uint64_t sub_100018E58(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 144);
}

void sub_100018E6C()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

id sub_100018E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_account] = a1;
  uint64_t v10 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_bag];
  uint64_t v11 = sub_10001ACA8();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, a2, v11);
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_clientInfo] = a3;
  uint64_t v13 = &v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient];
  *(void *)uint64_t v13 = a4;
  *((void *)v13 + 1) = a5;
  v16.receiver = v5;
  v16.super_class = (Class)type metadata accessor for JSMarketingObject(0LL);
  id v14 = objc_msgSendSuper2(&v16, "init");
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a2, v11);
  return v14;
}

uint64_t sub_100018F4C(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100007498(0LL, &qword_100050900, &OBJC_CLASS___JSContext_ptr);
  uint64_t v4 = (void *)static JSContext.requiredCurrent.getter();
  v7[2] = a1;
  v7[3] = v2;
  uint64_t v5 = JSContext.propagateErrorsToExceptions(_:)(sub_10001A70C, v7);

  return v5;
}

uint64_t sub_100018FC0(void *a1, void *a2, void *a3)
{
  id v84 = a1;
  uint64_t v91 = type metadata accessor for Bag(0LL);
  uint64_t v83 = *(void *)(v91 - 8);
  uint64_t v6 = *(void *)(v83 + 64);
  __chkstk_darwin(v91, v7);
  uint64_t v85 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for JSPromise(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v13, v14);
  objc_super v16 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v18 = static RunLoopWorkerThread.current.getter();
  if (v18)
  {
    uint64_t v17 = v18;
    sub_10002C590(a2, __src);
    if (v3) {
      goto LABEL_8;
    }
    uint64_t v80 = v17;
    uint64_t v19 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v20 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v21 = *(void **)(v20 + 72);
    uint64_t v22 = *(unsigned __int8 *)(v20 + 80);
    uint64_t v23 = (v22 + 32) & ~v22;
    uint64_t v78 = v21;
    uint64_t v24 = swift_allocObject(v19, v23 + 3LL * (void)v21, v22 | 7);
    *(_OWORD *)(v24 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
    uint64_t v79 = (void *)v24;
    uint64_t v77 = v24 + v23;
    uint64_t v89 = (ValueMetadata *)type metadata accessor for JSMarketingObject(0LL);
    v88[0] = a3;
    uint64_t v25 = a3;
    id v26 = (id)AMSLogKey(v25);
    uint64_t v82 = 0LL;
    uint64_t v74 = v8;
    uint64_t v73 = v9;
    __int128 v81 = v12;
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      uint64_t v30 = v29;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v31._countAndFlagsBits = 0LL;
      v31._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v31);
      uint64_t v32 = v89;
      uint64_t v33 = sub_100007060(v88, (uint64_t)v89);
      uint64_t DynamicType = swift_getDynamicType(v33, v32, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v86[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v86);
      sub_100008D04((uint64_t)v86);
      v35._countAndFlagsBits = 5972026LL;
      v35._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v35);
      uint64_t MetatypeMetadata = &type metadata for String;
      v86[0] = v28;
      v86[1] = v30;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v86);
      sub_100008D04((uint64_t)v86);
      uint64_t v36 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v40._countAndFlagsBits = 0LL;
      v40._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v40);
      uint64_t v41 = v89;
      uint64_t v42 = sub_100007060(v88, (uint64_t)v89);
      uint64_t v43 = swift_getDynamicType(v42, v41, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v86[0] = v43;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v86);
      sub_100008D04((uint64_t)v86);
      uint64_t v36 = 58LL;
    }

    unint64_t v44 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v36);
    LogMessage.init(stringInterpolation:)(v16);
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v88);
    LogMessage.init(stringLiteral:)(0xD000000000000021LL, 0x800000010003E9D0LL);
    uint64_t v89 = &type metadata for MarketingItemRequest;
    v88[0] = swift_allocObject(&unk_10004A108, 88LL, 7LL);
    memcpy((void *)(v88[0] + 16LL), __src, 0x48uLL);
    sub_10001A768((uint64_t *)__src);
    static LogMessage.safe(_:)(v88);
    sub_100008D04((uint64_t)v88);
    uint64_t v45 = (uint64_t)v79;
    sub_10002C300((uint64_t)v79);
    swift_bridgeObjectRelease(v45);
    uint64_t v79 = *(void **)&v25[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_account];
    uint64_t v78 = *(void **)&v25[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_clientInfo];
    uint64_t v46 = *(void *)&v25[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient + 8];
    uint64_t v77 = *(void *)&v25[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_mediaClient];
    uint64_t v76 = v46;
    uint64_t v47 = v83;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))( v85,  &v25[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17JSMarketingObject_bag],  v91);
    uint64_t v48 = *(unsigned __int8 *)(v47 + 80);
    uint64_t v49 = (v48 + 16) & ~v48;
    unint64_t v50 = (v6 + v49 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v51 = (v50 + 23) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v52 = (v51 + 79) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v53 = (v52 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    id v75 = v25;
    unint64_t v54 = (v53 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v55 = (v54 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v56 = swift_allocObject(&unk_10004A130, v55 + 8, v48 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v56 + v49, v85, v91);
    uint64_t v57 = (uint64_t *)(v56 + v50);
    uint64_t v58 = v76;
    *uint64_t v57 = v77;
    v57[1] = v58;
    memcpy((void *)(v56 + v51), __src, 0x48uLL);
    uint64_t v59 = v79;
    *(void *)(v56 + v52) = v79;
    id v60 = v78;
    *(void *)(v56 + v53) = v78;
    uint64_t v61 = v75;
    *(void *)(v56 + v54) = v75;
    uint64_t v17 = v80;
    *(void *)(v56 + v55) = v80;
    id v62 = v59;
    id v63 = v60;
    swift_retain(v17);
    id v64 = v61;
    id v65 = v84;
    swift_bridgeObjectRetain(v58);
    uint64_t v66 = v81;
    id v67 = v65;
    uint64_t v68 = v82;
    uint64_t v69 = JSPromise.init(in:executor:)(v67, sub_10001A8D0, v56);
    if (v68)
    {
LABEL_8:
      swift_release(v17);
    }

    else
    {
      uint64_t v71 = v17;
      uint64_t v17 = JSPromise.value.getter(v69);
      swift_release(v71);
      (*(void (**)(char *, uint64_t))(v73 + 8))(v66, v74);
    }
  }

  else
  {
    uint64_t v37 = type metadata accessor for JSError(0LL);
    unint64_t v38 = sub_100009214();
    swift_allocError(v37, v38, 0LL, 0LL);
    uint64_t v39 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v39);
  }

  return v17;
}

uint64_t sub_1000195C4( void *a1, void *a2, void *a3, uint64_t a4, void (*a5)(char *, id, uint64_t), uint64_t a6, void *a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11)
{
  uint64_t v61 = a1;
  uint64_t v54 = a8;
  id v55 = a2;
  uint64_t v58 = a3;
  unint64_t v52 = a5;
  uint64_t v53 = a9;
  uint64_t v60 = type metadata accessor for JSCallable(0LL);
  uint64_t v56 = *(void *)(v60 - 8);
  uint64_t v14 = __chkstk_darwin(v60, v13);
  uint64_t v57 = v15;
  uint64_t v59 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = Bag.amsBag.getter(v14);
  uint64_t v18 = a7[7];
  uint64_t v17 = a7[8];
  uint64_t v20 = a7[1];
  uint64_t v19 = a7[2];
  uint64_t v22 = a7[5];
  uint64_t v21 = a7[6];
  objc_allocWithZone(&OBJC_CLASS___AMSMarketingItemTask);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v21);
  id v23 = sub_10001A988(v16, (uint64_t)v52, a6, v18, v17, v20, v19, v22, v21);
  [v23 setAccount:v54];
  [v23 setClientInfo:v53];
  sub_10001AA84((uint64_t)a7, (uint64_t)v64, &qword_100050CB0);
  sub_10001AA84((uint64_t)v64, (uint64_t)&v66, &qword_100050CB0);
  if (v66)
  {
    sub_10002E288(v66);
    uint64_t v25 = v24;
    sub_100006674(&qword_100050570);
    v26.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v25);
  }

  else
  {
    v26.super.Class isa = 0LL;
  }

  uint64_t v54 = a11;
  [v23 setContextInfo:v26.super.isa];

  sub_10001AA84((uint64_t)(a7 + 3), (uint64_t)v63, &qword_100050CB8);
  sub_10001AA84((uint64_t)v63, (uint64_t)v65, &qword_100050CB8);
  if (v65[1]) {
    NSString v27 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v27 = 0LL;
  }
  [v23 setOfferHints:v27];

  sub_100006674(&qword_100050CC0);
  uint64_t v28 = Promise<A>.init(_:)([v23 perform]);
  uint64_t v29 = v56;
  unint64_t v52 = *(void (**)(char *, id, uint64_t))(v56 + 16);
  uint64_t v53 = v28;
  Swift::String v31 = v59;
  uint64_t v30 = v60;
  v52(v59, v55, v60);
  uint64_t v32 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v33 = (v32 + 32) & ~v32;
  uint64_t v34 = v57;
  id v55 = v23;
  uint64_t v35 = swift_allocObject(&unk_10004A158, v33 + v57, v32 | 7);
  *(void *)(v35 + swift_weakDestroy(v0 + 16) = a10;
  unint64_t v51 = a10;
  uint64_t v36 = v61;
  *(void *)(v35 + 24) = v61;
  uint64_t v37 = v35 + v33;
  unint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
  v38(v37, v31, v30);
  v52(v31, v58, v30);
  uint64_t v39 = (v32 + 24) & ~v32;
  unint64_t v40 = (v34 + v39 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v41 = swift_allocObject(&unk_10004A180, v40 + 8, v32 | 7);
  uint64_t v42 = v51;
  *(void *)(v41 + swift_weakDestroy(v0 + 16) = v51;
  v38(v41 + v39, v31, v30);
  *(void *)(v41 + v40) = v36;
  void v62[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v62[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v43 = v54;
  v62[0] = v54;
  id v44 = v42;
  id v45 = v36;
  id v46 = v44;
  id v47 = v45;
  swift_retain(v43);
  uint64_t v48 = v53;
  Promise.then(perform:orCatchError:on:)(sub_10001AB34, v35, sub_10001ABF0, v41, v62);

  swift_release(v48);
  swift_release(v35);
  swift_release(v41);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v62);
}

void sub_100019980(void **a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v48 = a3;
  uint64_t v7 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *a1;
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v45 = v15 | 7;
  uint64_t v46 = ((v15 + 32) & ~v15) + 3 * v14;
  uint64_t v16 = swift_allocObject(v12, v46, v15 | 7);
  __int128 v44 = xmmword_10003BCD0;
  *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v43 = type metadata accessor for JSMarketingObject(0LL);
  *((void *)&v53 + 1) = v43;
  *(void *)&__int128 v52 = a2;
  id v42 = a2;
  id v17 = (id)AMSLogKey(v42);
  uint64_t v47 = v12;
  uint64_t v49 = a4;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v21 = v20;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v22._countAndFlagsBits = 0LL;
    v22._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    uint64_t v23 = *((void *)&v53 + 1);
    uint64_t v24 = sub_100007060(&v52, *((uint64_t *)&v53 + 1));
    uint64_t DynamicType = swift_getDynamicType(v24, v23, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v50[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v50);
    sub_100008D04((uint64_t)v50);
    v26._countAndFlagsBits = 5972026LL;
    v26._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v26);
    uint64_t MetatypeMetadata = &type metadata for String;
    v50[0] = v19;
    v50[1] = v21;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v50);
    sub_100008D04((uint64_t)v50);
    uint64_t v27 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v28._countAndFlagsBits = 0LL;
    v28._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v28);
    uint64_t v29 = *((void *)&v53 + 1);
    uint64_t v30 = sub_100007060(&v52, *((uint64_t *)&v53 + 1));
    uint64_t v31 = swift_getDynamicType(v30, v29, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v50[0] = v31;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v50);
    sub_100008D04((uint64_t)v50);
    uint64_t v27 = 58LL;
  }

  unint64_t v32 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v27);
  LogMessage.init(stringInterpolation:)(v10);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v52);
  LogMessage.init(stringLiteral:)(0xD00000000000003ELL, 0x800000010003EA30LL);
  uint64_t v33 = sub_10001AC34(v11);
  if (v34)
  {
    *((void *)&v53 + 1) = &type metadata for String;
    *(void *)&__int128 v52 = v33;
    *((void *)&v52 + 1) = v34;
  }

  else
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
  }

  uint64_t v35 = v48;
  type metadata accessor for Log();
  static LogMessage.safe(_:)(&v52);
  sub_100008D04((uint64_t)&v52);
  sub_10002C300(v16);
  swift_bridgeObjectRelease(v16);
  id v36 = v11;
  id v37 = sub_10002CA9C(v35, v36);
  uint64_t v38 = sub_100006674(&qword_1000509E0);
  uint64_t v39 = swift_allocObject(v38, 64LL, 7LL);
  *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  *(void *)(v39 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v39 + 32) = v37;
  id v40 = v37;
  uint64_t v41 = (void *)JSCallable.call(_:)(v39);

  swift_bridgeObjectRelease(v39);
}

void sub_100019F0C(uint64_t a1, void *a2, uint64_t a3, objc_class *a4)
{
  uint64_t v51 = a3;
  uint64_t v7 = type metadata accessor for JSError(0LL);
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v48 = v19 + 3 * v17;
  uint64_t v47 = v18 | 7;
  uint64_t v20 = swift_allocObject(v15, v48, v18 | 7);
  __int128 v46 = xmmword_10003BCD0;
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v49 = v19;
  uint64_t v45 = type metadata accessor for JSMarketingObject(0LL);
  uint64_t v60 = v45;
  v59[0] = a2;
  id v44 = a2;
  id v21 = (id)AMSLogKey(v44);
  v54.super.Class isa = a4;
  uint64_t v50 = v15;
  if (v21)
  {
    Swift::String v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v25 = v24;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v26._countAndFlagsBits = 0LL;
    v26._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v26);
    uint64_t v27 = v60;
    Swift::String v28 = sub_100007060(v59, v60);
    uint64_t DynamicType = swift_getDynamicType(v28, v27, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v57[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v57);
    sub_100008D04((uint64_t)v57);
    v30._countAndFlagsBits = 5972026LL;
    v30._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v30);
    uint64_t MetatypeMetadata = &type metadata for String;
    v57[0] = v23;
    v57[1] = v25;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v57);
    sub_100008D04((uint64_t)v57);
    uint64_t v31 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v32._countAndFlagsBits = 0LL;
    v32._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v32);
    uint64_t v33 = v60;
    uint64_t v34 = sub_100007060(v59, v60);
    uint64_t v35 = swift_getDynamicType(v34, v33, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v57[0] = v35;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v57);
    sub_100008D04((uint64_t)v57);
    uint64_t v31 = 58LL;
  }

  unint64_t v36 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v31);
  LogMessage.init(stringInterpolation:)(v14);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v59);
  LogMessage.init(stringLiteral:)(0xD000000000000026LL, 0x800000010003EA00LL);
  swift_getErrorValue(a1);
  uint64_t v37 = v55;
  uint64_t v38 = v56;
  uint64_t v60 = v56;
  uint64_t v39 = sub_100007678(v59);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v38 - 8) + 16LL))(v39, v37, v38);
  static LogMessage.safe(_:)(v59);
  sub_100008D04((uint64_t)v59);
  sub_10002C320(v20);
  swift_bridgeObjectRelease(v20);
  uint64_t v40 = sub_100006674(&qword_1000509E0);
  uint64_t v41 = swift_allocObject(v40, 64LL, 7LL);
  *(_OWORD *)(v41 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  swift_errorRetain(a1);
  sub_1000186A8(a1);
  Class isa = JSError.makeValue(in:)(v54).super.isa;
  (*(void (**)(char *, uint64_t))(v52 + 8))(v10, v53);
  *(void *)(v41 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v41 + 32) = isa;
  uint64_t v43 = (void *)JSCallable.call(_:)(v41);
  swift_bridgeObjectRelease(v41);
}

void sub_10001A560()
{
}

id sub_10001A598()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSMarketingObject(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001A63C()
{
  return type metadata accessor for JSMarketingObject(0LL);
}

uint64_t type metadata accessor for JSMarketingObject(uint64_t a1)
{
  uint64_t result = qword_100050CA0;
  if (!qword_100050CA0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSMarketingObject);
  }
  return result;
}

uint64_t sub_10001A67C(uint64_t a1)
{
  v4[0] = "\b";
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = &unk_10003C3A0;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 4LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10001A70C(void *a1)
{
  return sub_100018FC0(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_10001A724()
{
  return swift_deallocObject(v0, 88LL, 7LL);
}

uint64_t *sub_10001A768(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  swift_bridgeObjectRetain(a1[4]);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t sub_10001A7D0()
{
  uint64_t v1 = sub_10001ACA8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v7 + 79) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(void *)(v0 + v6 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v7));
  swift_bridgeObjectRelease(*(void *)(v0 + v7 + 16));
  swift_bridgeObjectRelease(*(void *)(v0 + v7 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + v7 + 48));
  swift_bridgeObjectRelease(*(void *)(v0 + v7 + 64));

  swift_release(*(void *)(v0 + v11));
  return swift_deallocObject(v0, v11 + 8, v5);
}

uint64_t sub_10001A8D0(void *a1, void *a2, void *a3)
{
  v7 &= 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v9 = (v8 + 79) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_1000195C4( a1,  a2,  a3,  v3 + v10,  *(void (**)(char *, id, uint64_t))(v3 + v7),  *(void *)(v3 + v7 + 8),  (void *)(v3 + v8),  *(void *)(v3 + v9),  *(void *)(v3 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void **)(v3 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v3 + ((((((v9 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFF8LL)));
}

id sub_10001A988( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a5);
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a7);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a9);
  id v18 = [v9 initWithBag:a1 clientIdentifier:v14 clientVersion:v15 placement:v16 serviceType:v17];

  swift_unknownObjectRelease(a1);
  return v18;
}

uint64_t sub_10001AA84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006674(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001AAC8()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;

  sub_100013C3C();
  return swift_deallocObject(v0, v3, v4);
}

void sub_10001AB34(void **a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_100013C94() - 8) + 80LL);
  sub_100019980(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_10001AB70()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8LL;

  sub_100013C3C();
  return swift_deallocObject(v0, v4 + 8, v3);
}

void sub_10001ABF0(uint64_t a1)
{
}

uint64_t sub_10001AC34(void *a1)
{
  id v1 = [a1 itemID];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

  ;
}

uint64_t sub_10001ACA8()
{
  return type metadata accessor for Bag(0LL);
}

void sub_10001ACB0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v38 = a2;
  uint64_t v39 = a6;
  uint64_t v12 = type metadata accessor for JetEngineBootstrap.URLProtocolHandler(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  NSString v16 = (uint64_t *)((char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  *(void *)&v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore] = a1;
  uint64_t v40 = a1;
  NSString v17 = &v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_bag];
  uint64_t v18 = type metadata accessor for Bag(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v41 = v18;
  uint64_t v42 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v17, a2, v18);
  *(void *)&v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_clientInfo] = a3;
  uint64_t v20 = (uint64_t *)&v6[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient];
  *uint64_t v20 = a4;
  v20[1] = a5;
  swift_retain(a1);
  id v21 = a3;
  swift_bridgeObjectRetain_n(a5, 2LL);
  Swift::String v22 = v6;
  uint64_t v23 = Bag.amsBag.getter(v22);
  id v24 = objc_allocWithZone(&OBJC_CLASS___AMSMediaTokenService);
  id v25 = sub_10001CA60(a4, a5, v23);
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_tokenService] = v25;
  id v26 = v25;
  uint64_t v27 = Bag.amsBag.getter(v26);
  id v28 = [objc_allocWithZone(AMSMediaRequestEncoder) initWithTokenService:v26 bag:v27];

  swift_unknownObjectRelease(v27);
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder] = v28;
  id v29 = [v28 setClientInfo:v21];
  Swift::String v30 = v39;
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSessionHandler] = v39;
  sub_1000090C0((uint64_t)v29, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
  uint64_t *v16 = a4;
  v16[1] = a5;
  v16[2] = 0LL;
  v16[3] = 0LL;
  (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))( v16,  enum case for JetEngineBootstrap.URLProtocolHandler.media(_:),  v12);
  id v31 = v30;
  uint64_t v32 = v38;
  uint64_t v33 = (void *)static AMSURLSession.forJetEngineStorefront(with:for:usingProtocol:)(v38, v21, v16);
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v16, v12);
  *(void *)&v22[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSession] = v33;
  id v34 = v31;
  id v35 = v33;
  [v35 setDelegate:v34];

  unint64_t v36 = (objc_class *)type metadata accessor for JSMediaAPIObject(0LL);
  v43.receiver = v22;
  v43.super_class = v36;
  objc_msgSendSuper2(&v43, "init");
  swift_release(v40);

  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v32, v41);
  sub_100013C18();
}

uint64_t sub_10001AF44(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1000090C0(a1, &qword_100050900, &OBJC_CLASS___JSContext_ptr);
  uint64_t v4 = (void *)static JSContext.requiredCurrent.getter();
  v7[2] = v2;
  v7[3] = a1;
  uint64_t v5 = JSContext.propagateErrorsToExceptions(_:)(sub_10001CBBC, v7);

  return v5;
}

uint64_t sub_10001AFB4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v83 = a3;
  uint64_t v5 = type metadata accessor for JSPromise(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  unint64_t v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for MediaAPIRequest(0LL);
  uint64_t v79 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v79 + 64);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v80 = (uint64_t)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13, v14);
  NSString v16 = (char *)&v72 - v15;
  uint64_t v17 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v22 = static RunLoopWorkerThread.current.getter();
  if (v22)
  {
    uint64_t v81 = v22;
    uint64_t v82 = v16;
    id v76 = a1;
    uint64_t v77 = v9;
    uint64_t v74 = v6;
    uint64_t v75 = v5;
    uint64_t v23 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v24 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v25 = swift_allocObject( v23,  ((*(unsigned __int8 *)(v24 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))
          + 3LL * *(void *)(v24 + 72),
            *(unsigned __int8 *)(v24 + 80) | 7LL);
    *(_OWORD *)(v25 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
    uint64_t v87 = type metadata accessor for JSMediaAPIObject(0LL);
    v86[0] = a2;
    uint64_t v78 = a2;
    id v26 = (id)AMSLogKey(v78);
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      uint64_t v30 = v29;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v31._countAndFlagsBits = 0LL;
      v31._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v31);
      uint64_t v32 = v87;
      uint64_t v33 = sub_100007060(v86, v87);
      uint64_t DynamicType = swift_getDynamicType(v33, v32, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v84[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v84);
      sub_1000074D0((uint64_t)v84, (uint64_t *)&unk_1000509C0);
      v35._countAndFlagsBits = 5972026LL;
      v35._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v35);
      uint64_t MetatypeMetadata = &type metadata for String;
      v84[0] = v28;
      v84[1] = v30;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v84);
      sub_1000074D0((uint64_t)v84, (uint64_t *)&unk_1000509C0);
      uint64_t v36 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v40._countAndFlagsBits = 0LL;
      v40._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v40);
      uint64_t v41 = v87;
      uint64_t v42 = sub_100007060(v86, v87);
      uint64_t v43 = swift_getDynamicType(v42, v41, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v84[0] = v43;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v84);
      sub_1000074D0((uint64_t)v84, (uint64_t *)&unk_1000509C0);
      uint64_t v36 = 58LL;
    }

    unint64_t v44 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v36);
    LogMessage.init(stringInterpolation:)(v20);
    uint64_t v21 = type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v86);
    LogMessage.init(stringLiteral:)(0xD00000000000001ALL, 0x800000010003EBC0LL);
    uint64_t v87 = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
    v86[0] = v83;
    id v45 = (id)v83;
    static LogMessage.safe(_:)(v86);
    sub_1000074D0((uint64_t)v86, (uint64_t *)&unk_1000509C0);
    sub_10002C300(v25);
    swift_bridgeObjectRelease(v25);
    id v46 = v45;
    uint64_t v47 = (uint64_t)v82;
    unint64_t v48 = v88;
    sub_10002CBB8(v46, (uint64_t)v82);
    if (v48)
    {
      swift_release(v81);
    }

    else
    {
      uint64_t v49 = *(void *)&v78[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient + 8];
      uint64_t v73 = *(void *)&v78[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_mediaClient];
      uint64_t v50 = *(void **)&v78[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_clientInfo];
      swift_bridgeObjectRetain(v49);
      id v51 = [v50 clientVersion];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
        unint64_t v88 = v53;
      }

      else
      {
        unint64_t v88 = 0xE100000000000000LL;
        uint64_t v83 = 49LL;
      }

      uint64_t v54 = v80;
      sub_10001CBD4(v47, v80);
      uint64_t v55 = *(unsigned __int8 *)(v79 + 80);
      uint64_t v56 = (v55 + 16) & ~v55;
      unint64_t v57 = (v11 + v56 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      unint64_t v58 = (v57 + 15) & 0xFFFFFFFFFFFFFFF8LL;
      unint64_t v59 = (v58 + 23) & 0xFFFFFFFFFFFFFFF8LL;
      unint64_t v60 = (v59 + 23) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v61 = swift_allocObject(&unk_10004A1A8, v60 + 8, v55 | 7);
      sub_10001CD00(v54, v61 + v56);
      id v62 = v78;
      *(void *)(v61 + v57) = v78;
      id v63 = (void *)(v61 + v58);
      *id v63 = v73;
      v63[1] = v49;
      id v64 = (uint64_t *)(v61 + v59);
      unint64_t v65 = v88;
      *id v64 = v83;
      v64[1] = v65;
      uint64_t v66 = v81;
      *(void *)(v61 + v60) = v81;
      id v67 = v62;
      id v68 = v76;
      swift_retain(v66);
      uint64_t v69 = v77;
      uint64_t v70 = JSPromise.init(in:executor:)(v68, sub_10001CD44, v61);
      uint64_t v21 = JSPromise.value.getter(v70);
      swift_release(v66);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v69, v75);
      sub_10001CDE4((uint64_t)v82);
    }
  }

  else
  {
    uint64_t v37 = type metadata accessor for JSError(0LL);
    unint64_t v38 = sub_100009214();
    swift_allocError(v37, v38, 0LL, 0LL);
    uint64_t v39 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v39);
  }

  return v21;
}

uint64_t sub_10001B558( void *a1, void (*a2)(void, void, void), uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v59 = a7;
  uint64_t v60 = a8;
  uint64_t v58 = a6;
  uint64_t v63 = a3;
  uint64_t v61 = a2;
  uint64_t v66 = a1;
  uint64_t v64 = a10;
  uint64_t v12 = type metadata accessor for JSCallable(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v62 = v15;
  NSString v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for URL(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v23);
  uint64_t v25 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v26 = type metadata accessor for MediaAPIRequest(0LL);
  sub_100016618(a4 + *(int *)(v26 + 32), (uint64_t)v20);
  if (sub_10000748C((uint64_t)v20, 1LL, v21) == 1)
  {
    uint64_t v28 = v58;
    uint64_t v27 = v59;
    uint64_t v29 = v60;
    sub_1000074D0((uint64_t)v20, &qword_1000505B8);
    if ((*(_BYTE *)(a4 + 32) & 1) != 0 || (uint64_t v30 = *(void *)(a4 + 16)) == 0)
    {
      sub_100006674(&qword_100050D40);
      NSString v36 = String._bridgeToObjectiveC()();
      id v37 = (id)AMSError(2LL, v36, 0LL, 0LL);

      uint64_t v31 = Promise.__allocating_init(error:)(v37);
    }

    else
    {
      sub_10001C728(*(void *)(a4 + 24), v28, v27, v29, a9, *(_BYTE *)(a4 + 8), v30, *(void *)a4);
    }

    uint64_t v60 = v31;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v25, v20, v21);
    uint64_t v60 = sub_10001C554((uint64_t)v25, v32, v33, v34, v35, *(_BYTE *)(a4 + 8));
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v21);
  }

  unint64_t v38 = v61;
  uint64_t v61 = *(void (**)(void, void, void))(v13 + 16);
  v61(v16, v38, v12);
  uint64_t v39 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v40 = (v39 + 32) & ~v39;
  uint64_t v41 = v62;
  uint64_t v42 = swift_allocObject(&unk_10004A1D0, v40 + v62, v39 | 7);
  uint64_t v43 = v66;
  *(void *)(v42 + swift_weakDestroy(v0 + 16) = a5;
  *(void *)(v42 + 24) = v43;
  uint64_t v44 = v42 + v40;
  id v45 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v45(v44, v16, v12);
  v61(v16, v63, v12);
  uint64_t v46 = (v39 + 24) & ~v39;
  unint64_t v47 = (v41 + v46 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v48 = swift_allocObject(&unk_10004A1F8, v47 + 8, v39 | 7);
  *(void *)(v48 + swift_weakDestroy(v0 + 16) = a5;
  v45(v48 + v46, v16, v12);
  uint64_t v49 = v66;
  *(void *)(v48 + v47) = v66;
  void v65[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v65[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v50 = v64;
  v65[0] = v64;
  id v51 = a5;
  id v52 = v49;
  id v53 = v51;
  id v54 = v52;
  swift_retain(v50);
  uint64_t v55 = v60;
  Promise.then(perform:orCatchError:on:)(sub_10001CE8C, v42, sub_10001CF38, v48, v65);
  swift_release(v55);
  swift_release(v42);
  swift_release(v48);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v65);
}

void sub_10001B8C4(void **a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v48 = a3;
  uint64_t v7 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *a1;
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v49 = v14;
  uint64_t v16 = ((v15 + 32) & ~v15) + 3 * v14;
  uint64_t v45 = v15 | 7;
  uint64_t v17 = swift_allocObject(v12, v16, v15 | 7);
  __int128 v44 = xmmword_10003BCD0;
  *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v43 = type metadata accessor for JSMediaAPIObject(0LL);
  uint64_t v54 = v43;
  v53[0] = a2;
  id v42 = a2;
  id v18 = (id)AMSLogKey(v42);
  uint64_t v50 = a4;
  uint64_t v46 = v16;
  uint64_t v47 = v12;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    uint64_t v22 = v21;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v23._countAndFlagsBits = 0LL;
    v23._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t v24 = v54;
    uint64_t v25 = sub_100007060(v53, v54);
    uint64_t DynamicType = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v51[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v51);
    sub_1000074D0((uint64_t)v51, (uint64_t *)&unk_1000509C0);
    v27._countAndFlagsBits = 5972026LL;
    v27._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t MetatypeMetadata = &type metadata for String;
    v51[0] = v20;
    v51[1] = v22;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v51);
    sub_1000074D0((uint64_t)v51, (uint64_t *)&unk_1000509C0);
    uint64_t v28 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v29._countAndFlagsBits = 0LL;
    v29._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v29);
    uint64_t v30 = v54;
    uint64_t v31 = sub_100007060(v53, v54);
    uint64_t v32 = swift_getDynamicType(v31, v30, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v51[0] = v32;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v51);
    sub_1000074D0((uint64_t)v51, (uint64_t *)&unk_1000509C0);
    uint64_t v28 = 58LL;
  }

  uint64_t v33 = v48;
  unint64_t v34 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
  LogMessage.init(stringInterpolation:)(v10);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v53);
  LogMessage.init(stringLiteral:)(0xD00000000000001BLL, 0x800000010003EC40LL);
  uint64_t v54 = sub_100007498(0LL, &qword_100050D50, &OBJC_CLASS___AMSMediaResult_ptr);
  v53[0] = v11;
  id v35 = v11;
  static LogMessage.safe(_:)(v53);
  sub_1000074D0((uint64_t)v53, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v17);
  swift_bridgeObjectRelease(v17);
  id v36 = v35;
  id v37 = sub_10002D5AC(v33, v36);
  uint64_t v38 = sub_100006674(&qword_1000509E0);
  uint64_t v39 = swift_allocObject(v38, 64LL, 7LL);
  *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  *(void *)(v39 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v39 + 32) = v37;
  id v40 = v37;
  uint64_t v41 = (void *)JSCallable.call(_:)(v39);

  swift_bridgeObjectRelease(v39);
}

void sub_10001BE9C(uint64_t a1, void *a2, uint64_t a3, JSContext a4)
{
  uint64_t v58 = a3;
  uint64_t v56 = a1;
  uint64_t v6 = type metadata accessor for JSError(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v51 = v19 + 3 * v17;
  uint64_t v50 = v18 | 7;
  uint64_t v20 = swift_allocObject(v15, v51, v18 | 7);
  __int128 v49 = xmmword_10003BCD0;
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v53 = v19;
  uint64_t v48 = type metadata accessor for JSMediaAPIObject(0LL);
  uint64_t v64 = v48;
  v63[0] = a2;
  id v47 = a2;
  id v21 = (id)AMSLogKey(v47);
  uint64_t v54 = v15;
  uint64_t v57 = v6;
  uint64_t v55 = v7;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    Class isa = a4.super.isa;
    uint64_t v26 = v25;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v27._countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v64;
    Swift::String v29 = sub_100007060(v63, v64);
    uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v61[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v61);
    sub_1000074D0((uint64_t)v61, (uint64_t *)&unk_1000509C0);
    v31._countAndFlagsBits = 5972026LL;
    v31._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v31);
    uint64_t MetatypeMetadata = &type metadata for String;
    v61[0] = v23;
    v61[1] = v26;
    a4.super.Class isa = isa;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v61);
    sub_1000074D0((uint64_t)v61, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v33._countAndFlagsBits = 0LL;
    v33._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v33);
    uint64_t v34 = v64;
    id v35 = sub_100007060(v63, v64);
    uint64_t v36 = swift_getDynamicType(v35, v34, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v61[0] = v36;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v61);
    sub_1000074D0((uint64_t)v61, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 58LL;
  }

  unint64_t v37 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
  LogMessage.init(stringInterpolation:)(v14);
  uint64_t v38 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v63);
  LogMessage.init(stringLiteral:)(0xD000000000000032LL, 0x800000010003EC00LL);
  uint64_t v39 = v56;
  swift_getErrorValue(v56);
  uint64_t v40 = v59;
  uint64_t v41 = v60;
  uint64_t v64 = v60;
  id v42 = sub_100007678(v63);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16LL))(v42, v40, v41);
  static LogMessage.safe(_:)(v63);
  sub_1000074D0((uint64_t)v63, (uint64_t *)&unk_1000509C0);
  uint64_t v52 = v38;
  sub_10002C320(v20);
  swift_bridgeObjectRelease(v20);
  uint64_t v43 = sub_100006674(&qword_1000509E0);
  uint64_t v44 = swift_allocObject(v43, 64LL, 7LL);
  *(_OWORD *)(v44 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  swift_errorRetain(v39);
  sub_1000186A8(v39);
  Class v45 = JSError.makeValue(in:)(a4).super.isa;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v10, v57);
  *(void *)(v44 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v44 + 32) = v45;
  uint64_t v46 = (void *)JSCallable.call(_:)(v44);
  swift_bridgeObjectRelease(v44);
}

uint64_t sub_10001C554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  if ((a6 & 1) != 0)
  {
    uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
    uint64_t v9 = *(void **)(v6 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore);
    if (v9) {
      uint64_t v9 = DynamicAccountsStore.account.getter();
    }
    sub_10001CFA0(v8, "setAccount:");
  }

  uint64_t v10 = *(void **)(v7 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_encoder);
  uint64_t v12 = v11;
  id v13 = [v10 requestWithURL:v11];

  sub_100006674(&qword_100050D48);
  uint64_t v14 = Promise<A>.init(_:)(  [*(id *)(v7 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_urlSession) dataTaskPromiseWithRequestPromise:v13]);
  v20[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v20[4] = &protocol witness table for SyncTaskScheduler;
  uint64_t v15 = sub_100007678(v20);
  uint64_t v16 = SyncTaskScheduler.init()(v15);
  uint64_t v17 = sub_1000090C0(v16, &qword_100050D50, &OBJC_CLASS___AMSMediaResult_ptr);
  uint64_t v18 = Promise.map<A>(on:_:)(v20, sub_10001C6A8, 0LL, v17);

  swift_release(v14);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v20);
  return v18;
}

id sub_10001C6A8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___AMSMediaResult);
  uint64_t v5 = swift_dynamicCastObjCClass(v3, v4);
  if (v5)
  {
    uint64_t v6 = v5;
    id result = v3;
  }

  else
  {
    id result = [objc_allocWithZone(AMSMediaResult) initWithResult:v3];
    uint64_t v6 = (uint64_t)result;
  }

  *a2 = v6;
  return result;
}

void sub_10001C728( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = v8;
  swift_bridgeObjectRetain(a3);
  uint64_t v18 = swift_bridgeObjectRetain(a5);
  uint64_t v19 = Bag.amsBag.getter(v18);
  id v20 = objc_allocWithZone(&OBJC_CLASS___AMSMediaTask);
  id v21 = sub_10001CAC4(a1, a2, a3, a4, a5, v19);
  if (a8) {
    v22.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else {
    v22.super.Class isa = 0LL;
  }
  sub_10001CFA0(v21, "setAdditionalQueryParams:");

  sub_10001CB70(a7, v21);
  if ((a6 & 1) != 0)
  {
    uint64_t v23 = *(void **)(v9 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16JSMediaAPIObject_accountStore);
    if (v23) {
      uint64_t v23 = DynamicAccountsStore.account.getter();
    }
    sub_10001CFA0(v21, "setAccount:");
  }

  sub_100006674(&qword_100050D40);
  Promise<A>.init(_:)([v21 perform]);

  sub_100013C18();
}

void sub_10001C87C()
{
}

id sub_10001C8B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSMediaAPIObject(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001C988()
{
  return type metadata accessor for JSMediaAPIObject(0LL);
}

uint64_t type metadata accessor for JSMediaAPIObject(uint64_t a1)
{
  uint64_t result = qword_100050D30;
  if (!qword_100050D30) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSMediaAPIObject);
  }
  return result;
}

uint64_t sub_10001C9C8(uint64_t a1)
{
  v4[0] = "\b";
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    void v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = &unk_10003C3F0;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

id sub_10001CA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v7 = [v3 initWithClientIdentifier:v6 bag:a3];

  swift_unknownObjectRelease(a3);
  return v7;
}

id sub_10001CAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a5);
  id v13 = [v6 initWithType:a1 clientIdentifier:v11 clientVersion:v12 bag:a6];

  swift_unknownObjectRelease(a6);
  return v13;
}

void sub_10001CB70(uint64_t a1, void *a2)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [a2 setItemIdentifiers:isa];
}

uint64_t sub_10001CBBC(void *a1)
{
  return sub_10001AFB4(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10001CBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaAPIRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001CC18()
{
  uint64_t v1 = type metadata accessor for MediaAPIRequest(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v4));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 16));
  uint64_t v6 = v0 + v4 + *(int *)(v1 + 32);
  uint64_t v7 = type metadata accessor for URL(0LL);
  unint64_t v8 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v11 = (v10 + 23) & 0xFFFFFFFFFFFFFFF8LL;

  sub_10001CF98(v0 + v9);
  sub_10001CF98(v0 + v10);
  swift_release(*(void *)(v0 + v11));
  return sub_10001CF7C(v0, v11 + 8, v3 | 7);
}

uint64_t sub_10001CD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaAPIRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001CD44(void *a1, void (*a2)(void, void, void), uint64_t a3)
{
  v7 &= 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  return sub_10001B558( a1,  a2,  a3,  v3 + v9,  *(void **)(v3 + v7),  *(void *)(v3 + v8),  *(void *)(v3 + v8 + 8),  *(void *)(v3 + ((v8 + 23) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v3 + ((v8 + 23) & 0xFFFFFFFFFFFFFFF8LL) + 8),  *(void *)(v3 + ((((v8 + 23) & 0xFFFFFFFFFFFFFFF8LL) + 23) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_10001CDE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MediaAPIRequest(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10001CE20()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 32) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;

  sub_100013C3C();
  return swift_deallocObject(v0, v3, v4);
}

void sub_10001CE8C(void **a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_100013C94() - 8) + 80LL);
  sub_10001B8C4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_10001CEC8()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 24) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8LL;

  sub_100013C3C();
  return sub_10001CF7C(v0, v4 + 8, v3);
}

void sub_10001CF38(uint64_t a1)
{
  v5.super.Class isa = *(Class *)(v1 + (v3 & 0xFFFFFFFFFFFFF8LL));
  sub_10001BE9C(a1, *(void **)(v1 + 16), v1 + v4, v5);
}

uint64_t sub_10001CF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

void sub_10001CF90(uint64_t a1@<X8>)
{
}

uint64_t sub_10001CF98@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

id sub_10001CFA0(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

id sub_10001CFA8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v12 = type metadata accessor for JetEngineBootstrap.URLProtocolHandler(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  sub_1000168D8();
  uint64_t v17 = (void *)(v16 - v15);
  uint64_t v18 = v6;
  uint64_t v34 = v12;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000LL) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    uint64_t v19 = a2;
    sub_1000205D8((uint64_t)_swiftEmptyArrayStorage);
  }

  else
  {
    uint64_t v19 = a2;
    id v20 = &_swiftEmptySetSingleton;
  }

  *(void *)&v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_customSessions] = v20;
  *(void *)&v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_accountStore] = a1;
  id v21 = &v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_bag];
  uint64_t v31 = type metadata accessor for Bag(0LL);
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 16))(v21, v19, v31);
  *(void *)&v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo] = a3;
  uint64_t v23 = &v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_mediaClient];
  *(void *)uint64_t v23 = a4;
  *((void *)v23 + 1) = a5;
  *(void *)&v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_urlSessionHandler] = a6;
  sub_1000090C0(v22, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
  void *v17 = a4;
  v17[1] = a5;
  v17[2] = 0LL;
  v17[3] = 0LL;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))( v17,  enum case for JetEngineBootstrap.URLProtocolHandler.media(_:),  v34);
  swift_retain(a1);
  id v24 = a3;
  swift_bridgeObjectRetain(a5);
  id v25 = a6;
  uint64_t v26 = (void *)static AMSURLSession.forJetEngineStorefront(with:for:usingProtocol:)(v19, v24, v17);
  (*(void (**)(void *, uint64_t))(v13 + 8))(v17, v34);
  *(void *)&v18[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_defaultSession] = v26;
  id v27 = v25;
  id v28 = v26;
  [v28 setDelegate:v27];

  v35.receiver = v18;
  v35.super_class = (Class)type metadata accessor for JSNetworkObject(0LL);
  id v29 = objc_msgSendSuper2(&v35, "init");
  swift_release(a1);

  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v19, v31);
  return v29;
}

uint64_t sub_10001D1F8(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_1000090C0(a1, &qword_100050900, &OBJC_CLASS___JSContext_ptr);
  uint64_t v4 = (void *)static JSContext.requiredCurrent.getter();
  v7[2] = a1;
  v7[3] = v2;
  uint64_t v5 = JSContext.propagateErrorsToExceptions(_:)(sub_100021A60, v7);

  return v5;
}

uint64_t sub_10001D268(void *a1, void *a2, char *a3)
{
  uint64_t v167 = a3;
  id v160 = a1;
  uint64_t v5 = type metadata accessor for JSPromise(0LL);
  uint64_t v151 = *(void *)(v5 - 8);
  uint64_t v152 = v5;
  __chkstk_darwin(v5, v6);
  uint64_t v161 = (char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for String.Encoding(0LL);
  uint64_t v154 = *(void *)(v8 - 8);
  uint64_t v155 = v8;
  __chkstk_darwin(v8, v9);
  uint64_t v153 = (char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v156 = type metadata accessor for URL(0LL);
  uint64_t v158 = *(void (***)(char *, char *, uint64_t))(v156 - 8);
  __chkstk_darwin(v156, v11);
  uint64_t v13 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)&v140 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = (int *)type metadata accessor for NetworkRequest(0LL);
  uint64_t v157 = *((void *)v18 - 1);
  uint64_t v19 = *(void *)(v157 + 64);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v159 = (uint64_t)&v140 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v21, v22);
  id v25 = (char *)&v140 - v24;
  __chkstk_darwin(v23, v26);
  id v28 = (char *)&v140 - v27;
  uint64_t v29 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v30 = static RunLoopWorkerThread.current.getter();
  if (!v30)
  {
    uint64_t v31 = type metadata accessor for JSError(0LL);
    unint64_t v32 = sub_100009214();
    swift_allocError(v31, v32, 0LL, 0LL);
    uint64_t v33 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002CLL,  0x800000010003DCE0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
    swift_willThrow(v33);
    return v29;
  }

  uint64_t v29 = v30;
  sub_10001DF94(a2, (uint64_t)v28);
  if (v3)
  {
    swift_release(v29);
    return v29;
  }

  uint64_t v146 = v29;
  uint64_t v150 = 0LL;
  uint64_t v34 = swift_allocObject(&unk_10004A220, 24LL, 7LL);
  objc_super v35 = *(void **)&v167[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_defaultSession];
  uint64_t v149 = v34;
  *(void *)(v34 + swift_weakDestroy(v0 + 16) = v35;
  uint64_t v36 = v28[v18[10]];
  sub_100021A98((uint64_t)v28, (uint64_t)v25);
  if ((v36 & 1) != 0)
  {
    id v40 = v35;
    sub_100021ADC((uint64_t)v25);
    goto LABEL_9;
  }

  uint64_t v37 = *(void *)&v25[v18[13] + 8];
  id v38 = v35;
  uint64_t v39 = sub_100021ADC((uint64_t)v25);
  if (v37)
  {
LABEL_9:
    uint64_t v41 = (void *)objc_opt_self(&OBJC_CLASS___NSURLSessionConfiguration);
    uint64_t v42 = *(void *)&v167[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo];
    uint64_t v43 = Bag.amsBag.getter(v41);
    id v44 = objc_msgSend(v41, "ams_configurationWithProcessInfo:bag:", v42, v43);
    swift_unknownObjectRelease(v43);
    if ((v36 & 1) != 0)
    {
      uint64_t v145 = 0LL;
      uint64_t v141 = 0LL;
    }

    else
    {
      Class v45 = &v28[v18[13]];
      uint64_t v46 = *((void *)v45 + 1);
      uint64_t v145 = *(void *)v45;
      uint64_t v141 = v46;
      swift_bridgeObjectRetain(v46);
    }

    uint64_t v47 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v48 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    __int128 v49 = *(void **)(v48 + 72);
    uint64_t v50 = *(unsigned __int8 *)(v48 + 80);
    uint64_t v51 = (v50 + 32) & ~v50;
    id v148 = v49;
    uint64_t v52 = swift_allocObject(v47, v51 + 3LL * (void)v49, v50 | 7);
    *(_OWORD *)(v52 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
    uint64_t v147 = v52 + v51;
    *((void *)&v166 + 1) = type metadata accessor for JSNetworkObject(0LL);
    *(void *)&__int128 v165 = v167;
    uint64_t v53 = v167;
    id v54 = (id)AMSLogKey(v53);
    id v143 = v44;
    uint64_t v142 = v53;
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
      uint64_t v140 = v57;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v58._countAndFlagsBits = 0LL;
      v58._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v58);
      uint64_t v59 = *((void *)&v166 + 1);
      uint64_t v60 = sub_100007060(&v165, *((uint64_t *)&v166 + 1));
      uint64_t DynamicType = swift_getDynamicType(v60, v59, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
      uint64_t v162 = (char *)DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v162);
      sub_1000074D0((uint64_t)&v162, (uint64_t *)&unk_1000509C0);
      v62._countAndFlagsBits = 5972026LL;
      v62._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v62);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v162 = (char *)v56;
      uint64_t v163 = v140;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v162);
      sub_1000074D0((uint64_t)&v162, (uint64_t *)&unk_1000509C0);
      uint64_t v63 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v64._countAndFlagsBits = 0LL;
      v64._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v64);
      uint64_t v65 = *((void *)&v166 + 1);
      uint64_t v66 = sub_100007060(&v165, *((uint64_t *)&v166 + 1));
      uint64_t v67 = swift_getDynamicType(v66, v65, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v67);
      uint64_t v162 = (char *)v67;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v162);
      sub_1000074D0((uint64_t)&v162, (uint64_t *)&unk_1000509C0);
      uint64_t v63 = 58LL;
    }

    uint64_t v68 = v141;
    unint64_t v69 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v63);
    LogMessage.init(stringInterpolation:)(v17);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v165);
    LogMessage.init(stringLiteral:)(0xD00000000000002ELL, 0x800000010003EEC0LL);
    uint64_t v144 = v13;
    if (v68)
    {
      *((void *)&v166 + 1) = &type metadata for String;
      uint64_t v70 = v68;
      *(void *)&__int128 v165 = v145;
      *((void *)&v165 + 1) = v68;
    }

    else
    {
      uint64_t v70 = 0LL;
      __int128 v165 = 0u;
      __int128 v166 = 0u;
    }

    uint64_t v71 = v143;
    type metadata accessor for Log();
    swift_bridgeObjectRetain(v70);
    static LogMessage.safe(_:)(&v165);
    sub_1000074D0((uint64_t)&v165, (uint64_t *)&unk_1000509C0);
    sub_10002C300(v52);
    swift_bridgeObjectRelease(v52);
    if (v68)
    {
      NSString v72 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v70);
    }

    else
    {
      NSString v72 = 0LL;
    }

    uint64_t v73 = v142;
    objc_msgSend(v71, "set_tlsTrustPinningPolicyName:", v72);

    id v74 = [objc_allocWithZone(AMSURLSession) initWithConfiguration:v71];
    uint64_t v75 = *(void **)(v149 + 16);
    *(void *)(v149 + swift_weakDestroy(v0 + 16) = v74;

    [v74 setDelegate:*(void *)&v73[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_urlSessionHandler]];
    swift_beginAccess( &v73[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_customSessions],  &v165,  33LL,  0LL);
    sub_100020830((Swift::Int *)&v162, v74);
    id v76 = v162;
    swift_endAccess(&v165);

    uint64_t v13 = v144;
  }

  uint64_t v77 = Bag.amsBag.getter(v39);
  id v78 = [objc_allocWithZone(AMSURLRequestEncoder) initWithBag:v77];
  swift_unknownObjectRelease(v77);
  uint64_t v79 = v150;
  if (v28[v18[12]] == 1)
  {
    uint64_t v80 = *(void **)&v167[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_accountStore];
    if (v80) {
      uint64_t v80 = DynamicAccountsStore.account.getter();
    }
    [v78 setAccount:v80];
  }

  uint64_t v81 = &v28[v18[11]];
  uint64_t v82 = *((void *)v81 + 1);
  if (v82)
  {
    swift_bridgeObjectRetain(*((void *)v81 + 1));
    NSString v83 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v82);
  }

  else
  {
    NSString v83 = 0LL;
  }

  uint64_t v84 = v156;
  [v78 setGsTokenIdentifier:v83];

  [v78 setClientInfo:*(void *)&v167[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_clientInfo]];
  int v85 = v28[v18[14]];
  if (v85 != 2) {
    [v78 setUrlKnownToBeTrusted:v85 & 1];
  }
  uint64_t v86 = type metadata accessor for URLRequest(0LL);
  uint64_t v156 = swift_allocBox(v86);
  v158[2](v13, v28, v84);
  uint64_t v87 = URLRequest.init(url:cachePolicy:timeoutInterval:)(v13, 0LL, 60.0);
  uint64_t v89 = *(void *)&v28[v18[6]];
  id v148 = v78;
  if (v89)
  {
    __chkstk_darwin(v87, v88);
    uint64_t v90 = swift_bridgeObjectRetain(v89);
    sub_10001E440(v90, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100021C90);
    uint64_t v150 = v79;
    swift_bridgeObjectRelease(v89);
  }

  uint64_t v91 = &v28[v18[9]];
  uint64_t v92 = *((void *)v91 + 1);
  if (v92)
  {
    uint64_t v93 = *(void *)v91;
    uint64_t v94 = swift_bridgeObjectRetain(*((void *)v91 + 1));
    uint64_t v95 = v153;
    static String.Encoding.utf8.getter(v94);
    uint64_t v96 = String.data(using:allowLossyConversion:)(v95, 0LL, v93, v92);
    unint64_t v98 = v97;
    swift_bridgeObjectRelease(v92);
    (*(void (**)(char *, uint64_t))(v154 + 8))(v95, v155);
  }

  else
  {
    uint64_t v96 = 0LL;
    unint64_t v98 = 0xF000000000000000LL;
  }

  URLRequest.httpBody.setter(v96, v98);
  uint64_t v99 = &v28[v18[5]];
  uint64_t v100 = *(void *)v99;
  uint64_t v101 = *((void *)v99 + 1);
  swift_bridgeObjectRetain(v101);
  URLRequest.httpMethod.setter(v100, v101);
  uint64_t v102 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v103 = type metadata accessor for LogMessage(0LL);
  uint64_t v104 = swift_allocObject( v102,  ((*(unsigned __int8 *)(*(void *)(v103 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v103 - 8) + 80LL))
         + 3LL * *(void *)(*(void *)(v103 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v103 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v104 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  *((void *)&v166 + 1) = type metadata accessor for JSNetworkObject(0LL);
  *(void *)&__int128 v165 = v167;
  id v105 = v167;
  id v106 = (id)AMSLogKey(v105);
  uint64_t v167 = v105;
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v158 = (void (**)(char *, char *, uint64_t))static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
    uint64_t v155 = v108;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v109._countAndFlagsBits = 0LL;
    v109._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v109);
    uint64_t v110 = *((void *)&v166 + 1);
    uint64_t v111 = sub_100007060(&v165, *((uint64_t *)&v166 + 1));
    uint64_t v112 = swift_getDynamicType(v111, v110, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v112);
    uint64_t v162 = (char *)v112;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v162);
    sub_1000074D0((uint64_t)&v162, (uint64_t *)&unk_1000509C0);
    v113._countAndFlagsBits = 5972026LL;
    v113._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v113);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v162 = (char *)v158;
    uint64_t v163 = v155;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v162);
    sub_1000074D0((uint64_t)&v162, (uint64_t *)&unk_1000509C0);
    uint64_t v114 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v115._countAndFlagsBits = 0LL;
    v115._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v115);
    uint64_t v116 = *((void *)&v166 + 1);
    uint64_t v117 = sub_100007060(&v165, *((uint64_t *)&v166 + 1));
    uint64_t v118 = swift_getDynamicType(v117, v116, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v118);
    uint64_t v162 = (char *)v118;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v162);
    sub_1000074D0((uint64_t)&v162, (uint64_t *)&unk_1000509C0);
    uint64_t v114 = 58LL;
  }

  uint64_t v119 = v157;
  unint64_t v120 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v114);
  LogMessage.init(stringInterpolation:)(v17);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v165);
  LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x800000010003EE90LL);
  *((void *)&v166 + 1) = v18;
  uint64_t v121 = sub_100007678(&v165);
  sub_100021A98((uint64_t)v28, (uint64_t)v121);
  static LogMessage.safe(_:)(&v165);
  sub_1000074D0((uint64_t)&v165, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v104);
  swift_bridgeObjectRelease(v104);
  uint64_t v122 = v159;
  sub_100021A98((uint64_t)v28, v159);
  uint64_t v123 = *(unsigned __int8 *)(v119 + 80);
  uint64_t v124 = (v123 + 32) & ~v123;
  unint64_t v125 = (v19 + v124 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v126 = (v125 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v127 = (v126 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v29 = swift_allocObject(&unk_10004A248, v127 + 8, v123 | 7);
  uint64_t v158 = (void (**)(char *, char *, uint64_t))v28;
  uint64_t v128 = v148;
  uint64_t v129 = v156;
  *(void *)(v29 + swift_weakDestroy(v0 + 16) = v148;
  *(void *)(v29 + 24) = v129;
  sub_100021BC8(v122, v29 + v124);
  uint64_t v130 = v167;
  *(void *)(v29 + v125) = v167;
  uint64_t v131 = v149;
  *(void *)(v29 + v126) = v149;
  uint64_t v132 = v146;
  *(void *)(v29 + v127) = v146;
  uint64_t v133 = v130;
  id v134 = v160;
  id v135 = v128;
  swift_retain(v129);
  swift_retain(v131);
  swift_retain(v132);
  uint64_t v136 = v161;
  uint64_t v137 = v150;
  uint64_t v138 = JSPromise.init(in:executor:)(v134, sub_100021C0C, v29);
  if (v137)
  {
    sub_100021ADC((uint64_t)v158);
    swift_release(v131);
    swift_release(v129);
    swift_release(v132);
  }

  else
  {
    uint64_t v29 = JSPromise.value.getter(v138);

    swift_release(v132);
    (*(void (**)(char *, uint64_t))(v151 + 8))(v136, v152);
    sub_100021ADC((uint64_t)v158);
    swift_release(v131);
    swift_release(v129);
  }

  return v29;
}

void sub_10001DF94(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v6, v7);
  sub_1000168D8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  sub_1000168D8();
  uint64_t v51 = v15 - v14;
  uint64_t v16 = (int *)type metadata accessor for NetworkRequest(0LL);
  uint64_t v50 = v16[10];
  *(_BYTE *)(a2 + v50) = 2;
  sub_10002267C(7107189LL, 0xE300000000000000LL);
  uint64_t v17 = sub_100005870();
  sub_100022730();
  if (!v3)
  {
    sub_10002267C(7107189LL, 0xE300000000000000LL);
    uint64_t v21 = sub_10000A1D4();
    unint64_t v22 = sub_100009214();
    sub_10000D5C8(v21, v22);
    uint64_t v20 = sub_100022684();
    goto LABEL_5;
  }

  URL.init(string:)(v17, v3);
  swift_bridgeObjectRelease(v3);
  if (sub_10000748C(v10, 1LL, v11) == 1)
  {
    sub_1000074D0(v10, &qword_1000505B8);
    uint64_t v18 = sub_10000A1D4();
    unint64_t v19 = sub_100009214();
    sub_10000D5C8(v18, v19);
    uint64_t v20 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000002DLL,  0x800000010003ED80LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL);
LABEL_5:
    swift_willThrow(v20);

    return;
  }

  uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32);
  v23(v51, v10, v11);
  sub_10002267C(0x646F6874656DLL, 0xE600000000000000LL);
  uint64_t v24 = sub_100005870();
  sub_100022730();
  uint64_t v49 = v3;
  id v25 = (void *)sub_10002267C(0x73726564616568LL, 0xE700000000000000LL);
  uint64_t v26 = sub_1000091A0(v25);
  uint64_t v47 = v24;
  uint64_t v48 = v23;
  if (v26)
  {
    uint64_t v2 = (void *)v26;
    unint64_t v46 = sub_1000201C0(v26);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    unint64_t v46 = 0LL;
  }

  sub_10002267C(0x6972745379646F62LL, 0xEA0000000000676ELL);
  uint64_t v27 = sub_100005870();
  uint64_t v44 = v28;
  uint64_t v45 = v27;

  sub_10002267C(0xD000000000000011LL, 0x800000010003EDB0LL);
  uint64_t v43 = sub_100005870();
  sub_100022730();
  sub_10002267C(0xD000000000000014LL, 0x800000010003EDD0LL);
  char v42 = sub_1000226E8();

  sub_10002267C(0x6C616E6F73726570LL, 0xEC00000064657A69LL);
  sub_1000226E8();

  sub_10002267C(0xD000000000000012LL, 0x800000010003EDF0LL);
  uint64_t v29 = sub_100005870();
  uint64_t v40 = v30;
  uint64_t v41 = v29;

  sub_10002267C(0xD000000000000013LL, 0x800000010003EE10LL);
  char v31 = sub_1000226E8();

  sub_10002267C(0xD000000000000021LL, 0x800000010003EE30LL);
  char v32 = sub_1000226E8();

  uint64_t v33 = v3;
  uint64_t v34 = (void *)sub_10002267C(0xD000000000000027LL, 0x800000010003EE60LL);
  char v35 = sub_1000226E8();

  v48(a2, v51, v11);
  *(void *)(a2 + v16[6]) = v46;
  uint64_t v36 = (uint64_t *)(a2 + v16[5]);
  *uint64_t v36 = v47;
  v36[1] = v49;
  *(_BYTE *)(a2 + v16[7]) = v32;
  *(_BYTE *)(a2 + v16[8]) = v35;
  uint64_t v37 = (uint64_t *)(a2 + v16[9]);
  *uint64_t v37 = v45;
  v37[1] = v44;
  id v38 = (uint64_t *)(a2 + v16[11]);
  *id v38 = v43;
  v38[1] = v33;
  *(_BYTE *)(a2 + v50) = v42;
  *(_BYTE *)(a2 + v16[12]) = 1;
  uint64_t v39 = (uint64_t *)(a2 + v16[13]);
  *uint64_t v39 = v41;
  v39[1] = v40;
  *(_BYTE *)(a2 + v16[14]) = v31;
}

uint64_t sub_10001E440(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = v21[0];
  uint64_t v22 = v21[1];
  int64_t v5 = v21[3];
  unint64_t v6 = v21[4];
  int64_t v7 = (unint64_t)(v21[2] + 64LL) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  if (!v6) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v10 = v9 | (v5 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v10);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 56) + 16 * v10);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v20);
    a2(v16, v17, v19, v20);
    swift_bridgeObjectRelease(v20);
    uint64_t result = swift_bridgeObjectRelease(v17);
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v11 = v5 + 1;
    if (__OFADD__(v5, 1LL)) {
      break;
    }
    if (v11 >= v7) {
      return swift_release(v4);
    }
    unint64_t v12 = *(void *)(v22 + 8 * v11);
    int64_t v13 = v5 + 1;
    if (!v12)
    {
      int64_t v13 = v5 + 2;
      if (v5 + 2 >= v7) {
        return swift_release(v4);
      }
      unint64_t v12 = *(void *)(v22 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v5 + 3;
        if (v5 + 3 >= v7) {
          return swift_release(v4);
        }
        unint64_t v12 = *(void *)(v22 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v5 + 4;
          if (v5 + 4 >= v7) {
            return swift_release(v4);
          }
          unint64_t v12 = *(void *)(v22 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v5 + 5;
            if (v5 + 5 >= v7) {
              return swift_release(v4);
            }
            unint64_t v12 = *(void *)(v22 + 8 * v13);
            if (!v12)
            {
              int64_t v14 = v5 + 6;
              while (v14 < v7)
              {
                unint64_t v12 = *(void *)(v22 + 8 * v14++);
                if (v12)
                {
                  int64_t v13 = v14 - 1;
                  goto LABEL_18;
                }
              }

              return swift_release(v4);
            }
          }
        }
      }
    }

LABEL_18:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v5 = v13;
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  sub_100007438((uint64_t)v44, v76, 1LL, (uint64_t)v45);
  swift_bridgeObjectRelease(v59);
  if (sub_10000748C((uint64_t)v44, 1LL, (uint64_t)v45) != 1)
  {
    sub_100025DFC((uint64_t)v44, (uint64_t)v54);
    type metadata accessor for JSSourceUrlOverrides();
    uint64_t v93 = sub_1000298C8();
    uint64_t v94 = *((void *)v54 + 1);
    uint64_t v95 = *((void *)v54 + 2);
    swift_bridgeObjectRetain(v95);
    uint64_t v96 = v239;
    sub_100027678(v94, v95, v93, v239);
    swift_bridgeObjectRelease(v95);
    swift_bridgeObjectRelease(v93);
    unint64_t v97 = v240;
    if (sub_10000748C(v96, 1LL, v240) == 1)
    {
      sub_100029634(v96, &qword_1000505B8);
      unint64_t v98 = sub_1000298D4();
      uint64_t v99 = *((void *)v54 + 1);
      uint64_t v100 = *((void *)v54 + 2);
      swift_bridgeObjectRetain(v100);
      uint64_t v101 = v237;
      sub_100027678(v99, v100, v98, v237);
      swift_bridgeObjectRelease(v100);
      swift_bridgeObjectRelease(v98);
      if (sub_10000748C(v101, 1LL, v97) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v243 + 32))(v233, v101, v97);
        id v134 = sub_100006674((uint64_t *)&unk_100051BB0);
        id v135 = type metadata accessor for LogMessage(0LL);
        uint64_t v136 = swift_allocObject( v134,  ((*(unsigned __int8 *)(*(void *)(v135 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v135 - 8) + 80LL))
               + 2LL * *(void *)(*(void *)(v135 - 8) + 72LL),
                 *(unsigned __int8 *)(*(void *)(v135 - 8) + 80LL) | 7LL);
        *(_OWORD *)(v136 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
        v260 = type metadata accessor for JSSourceUrlOverrider(0LL);
        v257 = v245;
        uint64_t v137 = swift_retain(v245);
        uint64_t v138 = (id)AMSLogKey(v137);
        if (v138)
        {
          uint64_t v139 = v138;
          uint64_t v140 = static String._unconditionallyBridgeFromObjectiveC(_:)(v138);
          uint64_t v142 = v141;

          id v143 = v244;
          LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
          v144._countAndFlagsBits = 0LL;
          v144._object = (void *)0xE000000000000000LL;
          LogMessage.StringInterpolation.appendLiteral(_:)(v144);
          uint64_t v145 = v260;
          uint64_t v146 = sub_100007060(&v257, v260);
          uint64_t DynamicType = swift_getDynamicType(v146, v145, 1LL);
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
          v254 = DynamicType;
          LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
          sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
          v148._countAndFlagsBits = 5972026LL;
          v148._object = (void *)0xE300000000000000LL;
          LogMessage.StringInterpolation.appendLiteral(_:)(v148);
          uint64_t MetatypeMetadata = &type metadata for String;
          v254 = v140;
          v255 = v142;
          LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
          sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
          uint64_t v149 = 93LL;
        }

        else
        {
          id v143 = v244;
          LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
          v174._countAndFlagsBits = 0LL;
          v174._object = (void *)0xE000000000000000LL;
          LogMessage.StringInterpolation.appendLiteral(_:)(v174);
          uint64_t v175 = v260;
          uint64_t v176 = sub_100007060(&v257, v260);
          uint64_t v177 = swift_getDynamicType(v176, v175, 1LL);
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v177);
          v254 = v177;
          LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
          sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
          uint64_t v149 = 58LL;
        }

        uint64_t v178 = 0xE100000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v149);
        LogMessage.init(stringInterpolation:)(v143);
        type metadata accessor for Log();
        _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v257);
        LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x800000010003F2B0LL);
        sub_10002C300(v136);
        swift_bridgeObjectRelease(v136);
        sub_100006674(&qword_100051318);
        uint64_t v155 = v243;
        id v179 = *(int *)(v242 + 48);
        uint64_t v180 = *(void (**)(char *, uint64_t, uint64_t))(v243 + 16);
        uint64_t v158 = v238;
        uint64_t v181 = v238;
        uint64_t v182 = &v261;
LABEL_39:
        uint64_t v161 = *(v182 - 32);
        v180(v181, v161, v97);
        v158[v179] = 0;
        goto LABEL_40;
      }

      sub_100029634(v101, &qword_1000505B8);
      uint64_t v102 = v232;
      sub_10002546C(v232);
      uint64_t v103 = v242;
      if (sub_10000748C(v102, 1LL, v242) != 1)
      {
        uint64_t v162 = v103;
        uint64_t v163 = *(int *)(v103 + 48);
        uint64_t v164 = v243;
        __int128 v165 = v102;
        __int128 v166 = *(void (**)(char *, uint64_t, uint64_t))(v243 + 32);
        uint64_t v167 = (uint64_t)v231;
        v166(v231, v165, v97);
        uint64_t v168 = *(_BYTE *)(v165 + v163);
        *(_BYTE *)(v167 + v163) = v168;
        sub_100006674(&qword_100051318);
        uint64_t v169 = *(int *)(v162 + 48);
        uint64_t v170 = *(void (**)(char *, uint64_t, uint64_t))(v164 + 16);
        uint64_t v171 = v238;
        v170(v238, v167, v97);
        v171[v169] = v168;
        uint64_t v172 = *(int *)(v162 + 48);
        uint64_t v173 = v230;
        v166(v230, (uint64_t)v171, v97);
        v173[v172] = v168;
        Swift::String v109 = Promise.__allocating_init(value:)(v173);
        sub_100029634(v167, &qword_100051088);
        goto LABEL_41;
      }

      sub_100029634(v102, &qword_100051328);
      uint64_t v104 = v229;
      sub_100016618((uint64_t)&v54[v45[6]], v229);
      if (sub_10000748C(v104, 1LL, v97) == 1)
      {
        sub_100029634(v104, &qword_1000505B8);
        id v105 = v226;
        sub_100016618((uint64_t)&v54[v45[8]], v226);
        if (sub_10000748C(v105, 1LL, v97) == 1)
        {
          sub_100029634(v105, &qword_1000505B8);
          sub_100006674(&qword_100051318);
          id v106 = sub_1000295F8();
          uint64_t v107 = swift_allocError(&type metadata for JSSourceUrlOverrider.OverrideURLError, v106, 0LL, 0LL);
          *uint64_t v108 = 0;
          Swift::String v109 = Promise.__allocating_init(error:)(v107);
LABEL_41:
          sub_100025D08((uint64_t)v54);
          return v109;
        }

        (*(void (**)(char *, uint64_t, uint64_t))(v243 + 32))(v227, v105, v97);
        uint64_t v200 = sub_100006674((uint64_t *)&unk_100051BB0);
        uint64_t v201 = type metadata accessor for LogMessage(0LL);
        uint64_t v202 = swift_allocObject( v200,  ((*(unsigned __int8 *)(*(void *)(v201 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v201 - 8) + 80LL))
               + 2LL * *(void *)(*(void *)(v201 - 8) + 72LL),
                 *(unsigned __int8 *)(*(void *)(v201 - 8) + 80LL) | 7LL);
        *(_OWORD *)(v202 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
        v260 = type metadata accessor for JSSourceUrlOverrider(0LL);
        v257 = v245;
        uint64_t v203 = swift_retain(v245);
        uint64_t v204 = (id)AMSLogKey(v203);
        if (v204)
        {
          id v205 = v204;
          uint64_t v206 = static String._unconditionallyBridgeFromObjectiveC(_:)(v204);
          uint64_t v208 = v207;

          uint64_t v209 = v244;
          LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
          v210._countAndFlagsBits = 0LL;
          v210._object = (void *)0xE000000000000000LL;
          LogMessage.StringInterpolation.appendLiteral(_:)(v210);
          uint64_t v211 = v260;
          uint64_t v212 = sub_100007060(&v257, v260);
          uint64_t v213 = swift_getDynamicType(v212, v211, 1LL);
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v213);
          v254 = v213;
          LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
          sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
          v214._countAndFlagsBits = 5972026LL;
          v214._object = (void *)0xE300000000000000LL;
          LogMessage.StringInterpolation.appendLiteral(_:)(v214);
          uint64_t MetatypeMetadata = &type metadata for String;
          v254 = v206;
          v255 = v208;
          LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
          sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
          uint64_t v215 = 93LL;
        }

        else
        {
          uint64_t v209 = v244;
          LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
          v221._countAndFlagsBits = 0LL;
          v221._object = (void *)0xE000000000000000LL;
          LogMessage.StringInterpolation.appendLiteral(_:)(v221);
          uint64_t v222 = v260;
          v223 = sub_100007060(&v257, v260);
          v224 = swift_getDynamicType(v223, v222, 1LL);
          uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v224);
          v254 = v224;
          LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
          sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
          uint64_t v215 = 58LL;
        }

        uint64_t v225 = 0xE100000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v215);
        LogMessage.init(stringInterpolation:)(v209);
        type metadata accessor for Log();
        _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v257);
        LogMessage.init(stringLiteral:)(0xD000000000000026LL, 0x800000010003F260LL);
        sub_10002C300(v202);
        swift_bridgeObjectRelease(v202);
        sub_100006674(&qword_100051318);
        uint64_t v155 = v243;
        id v179 = *(int *)(v242 + 48);
        uint64_t v180 = *(void (**)(char *, uint64_t, uint64_t))(v243 + 16);
        uint64_t v158 = v238;
        uint64_t v181 = v238;
        uint64_t v182 = (uint64_t *)&v258;
        goto LABEL_39;
      }

      (*(void (**)(char *, uint64_t, uint64_t))(v243 + 32))(v228, v104, v97);
      uint64_t v184 = sub_100006674((uint64_t *)&unk_100051BB0);
      uint64_t v185 = type metadata accessor for LogMessage(0LL);
      uint64_t v186 = swift_allocObject( v184,  ((*(unsigned __int8 *)(*(void *)(v185 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v185 - 8) + 80LL))
             + 2LL * *(void *)(*(void *)(v185 - 8) + 72LL),
               *(unsigned __int8 *)(*(void *)(v185 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v186 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
      v260 = type metadata accessor for JSSourceUrlOverrider(0LL);
      v257 = v245;
      uint64_t v187 = swift_retain(v245);
      uint64_t v188 = (id)AMSLogKey(v187);
      if (v188)
      {
        uint64_t v189 = v188;
        uint64_t v190 = static String._unconditionallyBridgeFromObjectiveC(_:)(v188);
        uint64_t v192 = v191;

        uint64_t v193 = v244;
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v194._countAndFlagsBits = 0LL;
        v194._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v194);
        uint64_t v195 = v260;
        uint64_t v196 = sub_100007060(&v257, v260);
        uint64_t v197 = swift_getDynamicType(v196, v195, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v197);
        v254 = v197;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
        sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
        v198._countAndFlagsBits = 5972026LL;
        v198._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v198);
        uint64_t MetatypeMetadata = &type metadata for String;
        v254 = v190;
        v255 = v192;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
        sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
        id v199 = 93LL;
      }

      else
      {
        uint64_t v193 = v244;
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v216._countAndFlagsBits = 0LL;
        v216._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v216);
        uint64_t v217 = v260;
        uint64_t v218 = sub_100007060(&v257, v260);
        uint64_t v219 = swift_getDynamicType(v218, v217, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v219);
        v254 = v219;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
        sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
        id v199 = 58LL;
      }

      v220 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v199);
      LogMessage.init(stringInterpolation:)(v193);
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v257);
      LogMessage.init(stringLiteral:)(0xD000000000000016LL, 0x800000010003F290LL);
      sub_10002C300(v186);
      swift_bridgeObjectRelease(v186);
      sub_100006674(&qword_100051318);
      uint64_t v155 = v243;
      uint64_t v156 = *(int *)(v242 + 48);
      uint64_t v157 = *(void (**)(char *, uint64_t, uint64_t))(v243 + 16);
      uint64_t v158 = v238;
      uint64_t v159 = v238;
      id v160 = (uint64_t *)&v259;
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v243 + 32))(v241, v96, v97);
      uint64_t v110 = sub_100006674((uint64_t *)&unk_100051BB0);
      uint64_t v111 = type metadata accessor for LogMessage(0LL);
      uint64_t v112 = swift_allocObject( v110,  ((*(unsigned __int8 *)(*(void *)(v111 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v111 - 8) + 80LL))
             + 2LL * *(void *)(*(void *)(v111 - 8) + 72LL),
               *(unsigned __int8 *)(*(void *)(v111 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v112 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
      v260 = type metadata accessor for JSSourceUrlOverrider(0LL);
      v257 = v245;
      Swift::String v113 = swift_retain(v245);
      uint64_t v114 = (id)AMSLogKey(v113);
      if (v114)
      {
        Swift::String v115 = v114;
        uint64_t v116 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
        uint64_t v118 = v117;

        uint64_t v119 = v244;
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v120._countAndFlagsBits = 0LL;
        v120._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v120);
        uint64_t v121 = v260;
        uint64_t v122 = sub_100007060(&v257, v260);
        uint64_t v123 = swift_getDynamicType(v122, v121, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v123);
        v254 = v123;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
        sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
        v124._countAndFlagsBits = 5972026LL;
        v124._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v124);
        uint64_t MetatypeMetadata = &type metadata for String;
        v254 = v116;
        v255 = v118;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
        sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
        unint64_t v125 = 93LL;
      }

      else
      {
        uint64_t v119 = v244;
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v150._countAndFlagsBits = 0LL;
        v150._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v150);
        uint64_t v151 = v260;
        uint64_t v152 = sub_100007060(&v257, v260);
        uint64_t v153 = swift_getDynamicType(v152, v151, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v153);
        v254 = v153;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
        sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
        unint64_t v125 = 58LL;
      }

      uint64_t v154 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v125);
      LogMessage.init(stringInterpolation:)(v119);
      type metadata accessor for Log();
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v257);
      LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010003F2D0LL);
      sub_10002C300(v112);
      swift_bridgeObjectRelease(v112);
      sub_100006674(&qword_100051318);
      uint64_t v155 = v243;
      uint64_t v156 = *(int *)(v242 + 48);
      uint64_t v157 = *(void (**)(char *, uint64_t, uint64_t))(v243 + 16);
      uint64_t v158 = v238;
      uint64_t v159 = v238;
      id v160 = &v262;
    }

    uint64_t v161 = *(v160 - 32);
    v157(v159, v161, v97);
    v158[v156] = 1;
LABEL_40:
    Swift::String v109 = Promise.__allocating_init(value:)(v158);
    (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v161, v97);
    goto LABEL_41;
  }

  sub_100029634((uint64_t)v44, &qword_100051330);
  uint64_t v77 = sub_100006674((uint64_t *)&unk_100051BB0);
  id v78 = type metadata accessor for LogMessage(0LL);
  uint64_t v79 = swift_allocObject( v77,  ((*(unsigned __int8 *)(*(void *)(v78 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v78 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v78 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v78 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v79 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  v260 = type metadata accessor for JSSourceUrlOverrider(0LL);
  v257 = v245;
  uint64_t v80 = swift_retain(v245);
  uint64_t v81 = (id)AMSLogKey(v80);
  if (v81)
  {
    uint64_t v82 = v81;
    NSString v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v81);
    int v85 = v84;

    uint64_t v86 = v244;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v87._countAndFlagsBits = 0LL;
    v87._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v87);
    uint64_t v88 = v260;
    uint64_t v89 = sub_100007060(&v257, v260);
    uint64_t v90 = swift_getDynamicType(v89, v88, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v90);
    v254 = v90;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
    sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
    v91._countAndFlagsBits = 5972026LL;
    v91._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v91);
    uint64_t MetatypeMetadata = &type metadata for String;
    v254 = v83;
    v255 = v85;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
    sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
    uint64_t v92 = 93LL;
  }

  else
  {
    uint64_t v86 = v244;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v126._countAndFlagsBits = 0LL;
    v126._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v126);
    unint64_t v127 = v260;
    uint64_t v128 = sub_100007060(&v257, v260);
    uint64_t v129 = swift_getDynamicType(v128, v127, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v129);
    v254 = v129;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v254);
    sub_100029634((uint64_t)&v254, (uint64_t *)&unk_1000509C0);
    uint64_t v92 = 58LL;
  }

  uint64_t v130 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v92);
  LogMessage.init(stringInterpolation:)(v86);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v257);
  LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010003F240LL);
  sub_10002C300(v79);
  swift_bridgeObjectRelease(v79);
  sub_100006674(&qword_100051318);
  uint64_t v131 = sub_1000295F8();
  uint64_t v132 = swift_allocError(&type metadata for JSSourceUrlOverrider.OverrideURLError, v131, 0LL, 0LL);
  *uint64_t v133 = 1;
  return Promise.__allocating_init(error:)(v132);
}

    unint64_t v12 = (v16 - 1) & v16;
    int64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    id v38 = v17;
  }

  __break(1u);
}

uint64_t sub_10001E5EC( void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, _BYTE *a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v83 = a8;
  uint64_t v77 = a7;
  uint64_t v68 = a6;
  uint64_t v72 = a3;
  uint64_t v69 = a2;
  id v76 = a1;
  uint64_t v75 = a9;
  uint64_t v74 = type metadata accessor for JSCallable(0LL);
  uint64_t v70 = *(void *)(v74 - 8);
  __chkstk_darwin(v74, v11);
  uint64_t v71 = v12;
  uint64_t v73 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for NetworkRequest(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13, v16);
  uint64_t v17 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for URLRequest(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  uint64_t v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = swift_projectBox(a5);
  swift_beginAccess(v23, v82, 0LL, 0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v23, v18);
  Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
  id v25 = [a4 requestByEncodingRequest:isa parameters:0];

  uint64_t v26 = *(int *)(v13 + 28);
  uint64_t v27 = (uint64_t)v68;
  if ((v68[v26] & 1) != 0)
  {
    sub_100006674(&qword_100050DE0);
    id v28 = v25;
    uint64_t v29 = Promise<A>.init(_:)(v28);
    sub_100021A98(v27, (uint64_t)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    uint64_t v30 = *(unsigned __int8 *)(v14 + 80);
    uint64_t v31 = (v30 + 24) & ~v30;
    unint64_t v32 = (v15 + v31 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v33 = swift_allocObject(&unk_10004A2C0, v32 + 8, v30 | 7);
    *(void *)(v33 + swift_weakDestroy(v0 + 16) = a4;
    sub_100021BC8((uint64_t)v17, v33 + v31);
    uint64_t v34 = v77;
    *(void *)(v33 + v32) = v77;
    uint64_t v35 = type metadata accessor for SyncTaskScheduler(0LL);
    uint64_t v79 = v35;
    uint64_t v80 = &protocol witness table for SyncTaskScheduler;
    sub_100007678(v78);
    id v36 = a4;
    SyncTaskScheduler.init()(v34);
    uint64_t v37 = sub_100007498(0LL, &qword_100050DE8, &OBJC_CLASS___AMSURLRequest_ptr);
    uint64_t v38 = Promise.map<A>(on:_:)(v78, sub_100021E98, v33, v37);
    swift_release(v29);
    swift_release(v33);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v78);
    uint64_t v79 = v35;
    uint64_t v80 = &protocol witness table for SyncTaskScheduler;
    uint64_t v39 = sub_100007678(v78);
    SyncTaskScheduler.init()(v39);
    id v25 = (id)Promise<A>.toAMSPromise(on:)(v78);
    swift_release(v38);

    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v78);
  }

  uint64_t v68 = v25;
  uint64_t v40 = v83 + 16;
  uint64_t v41 = v83;
  sub_100006674(&qword_100050D48);
  swift_beginAccess(v40, v81, 0LL, 0LL);
  uint64_t v67 = Promise<A>.init(_:)([*(id *)(v41 + 16) dataTaskPromiseWithRequestPromise:v25]);
  uint64_t v42 = v70;
  uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 16);
  uint64_t v45 = v73;
  uint64_t v44 = v74;
  v43(v73, v69, v74);
  uint64_t v46 = *(unsigned __int8 *)(v42 + 80);
  uint64_t v47 = (v46 + 40) & ~v46;
  uint64_t v48 = v71;
  uint64_t v49 = v46 | 7;
  uint64_t v50 = (void *)swift_allocObject(&unk_10004A270, v47 + v71, v46 | 7);
  uint64_t v51 = v83;
  v50[2] = v77;
  void v50[3] = v51;
  v50[4] = v76;
  uint64_t v52 = (char *)v50 + v47;
  uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
  v53(v52, v45, v44);
  v43(v45, v72, v44);
  uint64_t v54 = (v46 + 32) & ~v46;
  unint64_t v55 = (v48 + v54 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v56 = swift_allocObject(&unk_10004A298, v55 + 8, v49);
  uint64_t v57 = v77;
  uint64_t v58 = v83;
  *(void *)(v56 + swift_weakDestroy(v0 + 16) = v77;
  *(void *)(v56 + 24) = v58;
  v53((char *)(v56 + v54), v45, v44);
  uint64_t v59 = v76;
  *(void *)(v56 + v55) = v76;
  uint64_t v79 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v80 = &protocol witness table for RunLoopWorkerThread;
  uint64_t v60 = v75;
  v78[0] = v75;
  id v61 = v57;
  swift_retain_n(v58, 2LL);
  id v62 = v59;
  id v63 = v61;
  id v64 = v62;
  swift_retain(v60);
  uint64_t v65 = v67;
  Promise.then(perform:orCatchError:on:)(sub_100021D28, v50, sub_100021DD8, v56, v78);
  swift_release(v65);
  swift_release(v50);
  swift_release(v56);

  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v78);
}

void sub_10001EA8C(id *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, void *a5@<X8>)
{
  id v61 = a5;
  uint64_t v9 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v13 = *a1;
  objc_msgSend(*a1, "ak_addAnisetteHeaders");
  id v14 = [a2 account];
  if ((*(_BYTE *)(a3 + *(int *)(type metadata accessor for NetworkRequest(0LL) + 32)) & 1) != 0)
  {
    id v15 = [(id)objc_opt_self(ACAccountStore) defaultStore];
    if (!v15)
    {

      __break(1u);
      return;
    }

    uint64_t v16 = v15;
    id v17 = objc_msgSend(v15, "ams_activeiCloudAccount");

    uint64_t v18 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v19 = type metadata accessor for LogMessage(0LL);
    uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v19 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
    *((void *)&v66 + 1) = type metadata accessor for JSNetworkObject(0LL);
    *(void *)&__int128 v65 = a4;
    id v21 = a4;
    id v14 = v17;
    id v22 = (id)AMSLogKey(v14);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      uint64_t v59 = v25;
      id v60 = (id)v24;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v26._countAndFlagsBits = 0LL;
      v26._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v26);
      uint64_t v27 = *((void *)&v66 + 1);
      id v28 = sub_100007060(&v65, *((uint64_t *)&v66 + 1));
      uint64_t DynamicType = swift_getDynamicType(v28, v27, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
      uint64_t v62 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v62);
      sub_1000074D0((uint64_t)&v62, (uint64_t *)&unk_1000509C0);
      v30._countAndFlagsBits = 5972026LL;
      v30._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v30);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v62 = (uint64_t)v60;
      uint64_t v63 = v59;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v62);
      sub_1000074D0((uint64_t)&v62, (uint64_t *)&unk_1000509C0);
      uint64_t v31 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v32._countAndFlagsBits = 0LL;
      v32._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v32);
      uint64_t v33 = *((void *)&v66 + 1);
      uint64_t v34 = sub_100007060(&v65, *((uint64_t *)&v66 + 1));
      uint64_t v35 = swift_getDynamicType(v34, v33, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v35);
      uint64_t v62 = v35;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v62);
      sub_1000074D0((uint64_t)&v62, (uint64_t *)&unk_1000509C0);
      uint64_t v31 = 58LL;
    }

    unint64_t v36 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v31);
    LogMessage.init(stringInterpolation:)(v12);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v65);
    LogMessage.init(stringLiteral:)(0xD000000000000025LL, 0x800000010003EF10LL);
    if (v14)
    {
      *((void *)&v66 + 1) = sub_100007498(0LL, (unint64_t *)&qword_1000503B0, &OBJC_CLASS___ACAccount_ptr);
      *(void *)&__int128 v65 = v14;
    }

    else
    {
      __int128 v65 = 0u;
      __int128 v66 = 0u;
    }

    type metadata accessor for Log();
    static LogMessage.safe(_:)(&v65);
    sub_1000074D0((uint64_t)&v65, (uint64_t *)&unk_1000509C0);
    sub_10002C300(v20);
    swift_bridgeObjectRelease(v20);
  }

  if (v14)
  {
    uint64_t v37 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v38 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v39 = swift_allocObject( v37,  ((*(unsigned __int8 *)(v38 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))
          + 2LL * *(void *)(v38 + 72),
            *(unsigned __int8 *)(v38 + 80) | 7LL);
    *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
    *((void *)&v66 + 1) = type metadata accessor for JSNetworkObject(0LL);
    *(void *)&__int128 v65 = a4;
    id v40 = a4;
    id v41 = v14;
    id v42 = (id)AMSLogKey(v41);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
      id v60 = v13;
      uint64_t v45 = v44;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v46._countAndFlagsBits = 0LL;
      v46._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v46);
      uint64_t v47 = *((void *)&v66 + 1);
      uint64_t v48 = sub_100007060(&v65, *((uint64_t *)&v66 + 1));
      uint64_t v49 = swift_getDynamicType(v48, v47, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v49);
      uint64_t v62 = v49;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v62);
      sub_1000074D0((uint64_t)&v62, (uint64_t *)&unk_1000509C0);
      v50._countAndFlagsBits = 5972026LL;
      v50._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v50);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v62 = v59;
      uint64_t v63 = v45;
      id v13 = v60;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v62);
      sub_1000074D0((uint64_t)&v62, (uint64_t *)&unk_1000509C0);
      uint64_t v51 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v52._countAndFlagsBits = 0LL;
      v52._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v52);
      uint64_t v53 = *((void *)&v66 + 1);
      uint64_t v54 = sub_100007060(&v65, *((uint64_t *)&v66 + 1));
      uint64_t v55 = swift_getDynamicType(v54, v53, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v55);
      uint64_t v62 = v55;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v62);
      sub_1000074D0((uint64_t)&v62, (uint64_t *)&unk_1000509C0);
      uint64_t v51 = 58LL;
    }

    unint64_t v56 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v51);
    LogMessage.init(stringInterpolation:)(v12);
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v65);
    LogMessage.init(stringLiteral:)(0xD000000000000019LL, 0x800000010003EEF0LL);
    sub_10002C300(v39);
    swift_bridgeObjectRelease(v39);
    objc_msgSend(v13, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v41, 0);
  }

  objc_msgSend(v13, "ak_addClientInfoHeader");

  void *v61 = v13;
  id v57 = v13;
}

void sub_10001F050(void **a1, char *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = *a1;
  swift_beginAccess(a3 + 16, v58, 0LL, 0LL);
  uint64_t v12 = *(void **)(a3 + 16);
  swift_beginAccess( &a2[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_customSessions],  v56,  33LL,  0LL);
  id v13 = v12;
  id v14 = (void *)sub_100021564(v13);
  swift_endAccess(v56);

  uint64_t v15 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = (v18 + 32) & ~v18;
  uint64_t v49 = v18 | 7;
  uint64_t v50 = v19 + 3 * v17;
  uint64_t v20 = swift_allocObject(v15, v50, v18 | 7);
  __int128 v48 = xmmword_10003BCD0;
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v51 = v19;
  uint64_t v47 = type metadata accessor for JSNetworkObject(0LL);
  uint64_t v57 = v47;
  v56[0] = a2;
  id v21 = a2;
  id v22 = (id)AMSLogKey(v21);
  uint64_t v52 = v15;
  Swift::String v46 = v21;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    uint64_t v26 = v25;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v27._countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v57;
    uint64_t v29 = sub_100007060(v56, v57);
    uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v54[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v54);
    sub_1000074D0((uint64_t)v54, (uint64_t *)&unk_1000509C0);
    v31._countAndFlagsBits = 5972026LL;
    v31._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v31);
    uint64_t MetatypeMetadata = &type metadata for String;
    v54[0] = v24;
    v54[1] = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v54);
    sub_1000074D0((uint64_t)v54, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v33._countAndFlagsBits = 0LL;
    v33._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v33);
    uint64_t v34 = v57;
    uint64_t v35 = sub_100007060(v56, v57);
    uint64_t v36 = swift_getDynamicType(v35, v34, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v36);
    v54[0] = v36;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v54);
    sub_1000074D0((uint64_t)v54, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 58LL;
  }

  uint64_t v37 = v53;
  unint64_t v38 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
  LogMessage.init(stringInterpolation:)(v11);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v56);
  LogMessage.init(stringLiteral:)(0xD000000000000019LL, 0x800000010003EF70LL);
  uint64_t v57 = sub_100007498(0LL, &qword_100050DF0, &OBJC_CLASS___AMSURLResult_ptr);
  v56[0] = v37;
  id v39 = v37;
  static LogMessage.safe(_:)(v56);
  sub_1000074D0((uint64_t)v56, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v20);
  swift_bridgeObjectRelease(v20);
  id v40 = v39;
  id v41 = sub_10001F694(a4, v40);
  uint64_t v42 = sub_100006674(&qword_1000509E0);
  uint64_t v43 = swift_allocObject(v42, 64LL, 7LL);
  *(_OWORD *)(v43 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  *(void *)(v43 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v43 + 32) = v41;
  id v44 = v41;
  uint64_t v45 = (void *)JSCallable.call(_:)(v43);

  swift_bridgeObjectRelease(v43);
}

id sub_10001F694(void *a1, void *a2)
{
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_13;
  }

  id v5 = result;
  id v6 = [a2 object];
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = v6;
  _bridgeAnyObjectToAny(_:)(v26);
  swift_unknownObjectRelease(v7);
  uint64_t v8 = sub_10000750C(v26, &v27);
  sub_1000090C0((uint64_t)v8, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  sub_100006638((uint64_t)&v27, (uint64_t)v26);
  id v9 = a1;
  id result = sub_10002299C(v26, a1);
  if (!result)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  sub_1000090C8();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v27);
LABEL_5:
  id v10 = [a2 response];
  if (!v10) {
    return v5;
  }
  uint64_t v11 = v10;
  uint64_t v12 = objc_opt_self(&OBJC_CLASS___NSHTTPURLResponse);
  uint64_t v13 = swift_dynamicCastObjCClass(v11, v12);
  if (!v13)
  {
LABEL_10:

    return v5;
  }

  id v14 = (void *)v13;
  sub_1000090C0(v13, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  id v15 = [v14 statusCode];
  uint64_t v28 = &type metadata for Int;
  *(void *)&__int128 v27 = v15;
  id v16 = a1;
  id result = sub_1000226F0((uint64_t)v16, v17, v18, v19);
  if (!result) {
    goto LABEL_14;
  }
  sub_1000090C8();
  id v20 = [v14 allHeaderFields];
  uint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v20,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  uint64_t v28 = (void *)sub_100006674(&qword_100050280);
  *(void *)&__int128 v27 = v21;
  id v22 = v16;
  id result = sub_1000226F0((uint64_t)v22, v23, v24, v25);
  if (result)
  {
    sub_1000090C8();
    goto LABEL_10;
  }

LABEL_15:
  __break(1u);
  return result;
}

void sub_10001F8C4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, JSContext a5)
{
  uint64_t v59 = a4;
  uint64_t v9 = type metadata accessor for JSError(0LL);
  uint64_t v61 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v10);
  id v60 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v12, v13);
  id v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess(a3 + 16, v69, 0LL, 0LL);
  id v16 = *(void **)(a3 + 16);
  swift_beginAccess( &a2[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSNetworkObject_customSessions],  v67,  33LL,  0LL);
  id v17 = v16;
  uint64_t v18 = (void *)sub_100021564(v17);
  swift_endAccess(v67);

  uint64_t v19 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v20 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v21 = *(void *)(v20 + 72);
  uint64_t v22 = *(unsigned __int8 *)(v20 + 80);
  uint64_t v23 = (v22 + 32) & ~v22;
  uint64_t v55 = v23 + 3 * v21;
  uint64_t v54 = v22 | 7;
  uint64_t v24 = swift_allocObject(v19, v55, v22 | 7);
  __int128 v53 = xmmword_10003BCD0;
  *(_OWORD *)(v24 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v56 = v23;
  uint64_t v52 = type metadata accessor for JSNetworkObject(0LL);
  uint64_t v68 = v52;
  v67[0] = a2;
  uint64_t v25 = a2;
  id v26 = (id)AMSLogKey(v25);
  uint64_t v62 = a1;
  uint64_t v57 = v19;
  uint64_t v51 = v25;
  if (v26)
  {
    __int128 v27 = v26;
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    uint64_t v58 = v29;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v30._countAndFlagsBits = 0LL;
    v30._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v30);
    uint64_t v31 = v68;
    uint64_t v32 = sub_100007060(v67, v68);
    uint64_t DynamicType = swift_getDynamicType(v32, v31, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v65[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v65);
    sub_1000074D0((uint64_t)v65, (uint64_t *)&unk_1000509C0);
    v34._countAndFlagsBits = 5972026LL;
    v34._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v34);
    uint64_t MetatypeMetadata = &type metadata for String;
    v65[0] = v28;
    v65[1] = v58;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v65);
    sub_1000074D0((uint64_t)v65, (uint64_t *)&unk_1000509C0);
    uint64_t v35 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v36._countAndFlagsBits = 0LL;
    v36._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v36);
    uint64_t v37 = v68;
    unint64_t v38 = sub_100007060(v67, v68);
    uint64_t v39 = swift_getDynamicType(v38, v37, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v39);
    v65[0] = v39;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v65);
    sub_1000074D0((uint64_t)v65, (uint64_t *)&unk_1000509C0);
    uint64_t v35 = 58LL;
  }

  unint64_t v40 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v35);
  LogMessage.init(stringInterpolation:)(v15);
  uint64_t v41 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v67);
  LogMessage.init(stringLiteral:)(0xD000000000000028LL, 0x800000010003EF40LL);
  uint64_t v42 = v62;
  swift_getErrorValue(v62);
  uint64_t v43 = v63;
  uint64_t v44 = v64;
  uint64_t v68 = v64;
  uint64_t v45 = sub_100007678(v67);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 16LL))(v45, v43, v44);
  static LogMessage.safe(_:)(v67);
  sub_1000074D0((uint64_t)v67, (uint64_t *)&unk_1000509C0);
  uint64_t v58 = v41;
  sub_10002C320(v24);
  swift_bridgeObjectRelease(v24);
  uint64_t v46 = sub_100006674(&qword_1000509E0);
  uint64_t v47 = swift_allocObject(v46, 64LL, 7LL);
  *(_OWORD *)(v47 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
  swift_errorRetain(v42);
  __int128 v48 = v60;
  sub_1000186A8(v42);
  Class isa = JSError.makeValue(in:)(a5).super.isa;
  (*(void (**)(char *, uint64_t))(v61 + 8))(v48, v9);
  *(void *)(v47 + 56) = sub_100007498(0LL, (unint64_t *)&qword_100050290, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v47 + 32) = isa;
  uint64_t v50 = (void *)JSCallable.call(_:)(v47);
  swift_bridgeObjectRelease(v47);
}

void sub_10001FFF4()
{
}

id sub_10002002C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSNetworkObject(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100020104()
{
  return type metadata accessor for JSNetworkObject(0LL);
}

uint64_t type metadata accessor for JSNetworkObject(uint64_t a1)
{
  return sub_100020550(a1, (uint64_t *)&unk_100050DB8, (uint64_t)&nominal type descriptor for JSNetworkObject);
}

uint64_t sub_100020120(uint64_t a1)
{
  v4[0] = "\b";
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    void v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = &unk_10003C440;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 7LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

unint64_t sub_1000201C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100006674(&qword_100050DC8);
    unint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    unint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  sub_1000205A0(a1, v53);
  int64_t v4 = v55;
  unint64_t v5 = v56;
  uint64_t v42 = v54;
  int64_t v44 = (unint64_t)(v54 + 64) >> 6;
  uint64_t v45 = v53[1];
  uint64_t v47 = v53[0];
  uint64_t v43 = (uint64_t)(v3 + 8);
  unint64_t result = swift_bridgeObjectRetain(a1);
  uint64_t v14 = &type metadata for String;
  uint64_t v46 = (char *)&type metadata for Any + 8;
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v15 = (v5 - 1) & v5;
  unint64_t v16 = __clz(__rbit64(v5)) | (v4 << 6);
  for (int64_t i = v4; ; v16 = __clz(__rbit64(v19)) + (i << 6))
  {
    sub_100009D8C(*(void *)(v47 + 48) + 40 * v16, (uint64_t)__src);
    sub_100006638(*(void *)(v47 + 56) + 32 * v16, (uint64_t)&__src[40]);
    memcpy(__dst, __src, sizeof(__dst));
    sub_100009D8C((uint64_t)__dst, (uint64_t)v50);
    if (!sub_100022718((uint64_t)&v48, (uint64_t)v50, (uint64_t)&type metadata for AnyHashable))
    {
      uint64_t v48 = 0LL;
      uint64_t v49 = 0LL;
      sub_1000074D0((uint64_t)__dst, &qword_100050DD0);
LABEL_33:
      uint64_t v31 = swift_bridgeObjectRelease(v49);
      uint64_t v39 = sub_100022740( v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v41,  v42,  v43,  v44,  v45,  (uint64_t)v46,  (uint64_t)&__dst[40],  (uint64_t)&__src[40],  v47);
      sub_10000B908(v39);
      swift_release(v3);
      return 0LL;
    }

    uint64_t v21 = v48;
    uint64_t v22 = v49;
    sub_100006638((uint64_t)&__dst[40], (uint64_t)v50);
    sub_1000074D0((uint64_t)__dst, &qword_100050DD0);
    if ((sub_100022718((uint64_t)&v48, (uint64_t)v50, (uint64_t)v46) & 1) == 0)
    {
      uint64_t v48 = 0LL;
      uint64_t v49 = 0LL;
      swift_bridgeObjectRelease(v22);
      goto LABEL_33;
    }

    uint64_t v23 = v14;
    uint64_t v24 = v48;
    uint64_t v25 = v49;
    unint64_t result = sub_1000098A8(v21, v22);
    if ((v7 & 1) != 0)
    {
      sub_100022754(v3[6]);
      MEMORY[0x28] = v21;
      MEMORY[0x30] = v22;
      unint64_t result = sub_100022754(v3[7]);
      MEMORY[0x28] = v24;
      MEMORY[0x30] = v25;
      goto LABEL_29;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)(v43 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    id v26 = (uint64_t *)(v3[6] + 16 * result);
    *id v26 = v21;
    v26[1] = v22;
    __int128 v27 = (uint64_t *)(v3[7] + 16 * result);
    *__int128 v27 = v24;
    v27[1] = v25;
    uint64_t v28 = v3[2];
    BOOL v29 = __OFADD__(v28, 1LL);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_37;
    }
    v3[2] = v30;
LABEL_29:
    int64_t v4 = i;
    unint64_t v5 = v15;
    uint64_t v14 = v23;
    if (v15) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v18 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      goto LABEL_38;
    }
    if (v18 >= v44) {
      goto LABEL_34;
    }
    unint64_t v19 = *(void *)(v45 + 8 * v18);
    int64_t i = v4 + 1;
    if (!v19)
    {
      int64_t i = v4 + 2;
      if (v4 + 2 >= v44) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v45 + 8 * i);
      if (!v19)
      {
        int64_t i = v4 + 3;
        if (v4 + 3 >= v44) {
          goto LABEL_34;
        }
        unint64_t v19 = *(void *)(v45 + 8 * i);
        if (!v19)
        {
          int64_t i = v4 + 4;
          if (v4 + 4 >= v44) {
            goto LABEL_34;
          }
          unint64_t v19 = *(void *)(v45 + 8 * i);
          if (!v19)
          {
            int64_t i = v4 + 5;
            if (v4 + 5 >= v44) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v45 + 8 * i);
            if (!v19)
            {
              int64_t v20 = v4 + 6;
              while (v20 < v44)
              {
                unint64_t v19 = *(void *)(v45 + 8 * v20++);
                if (v19)
                {
                  int64_t i = v20 - 1;
                  goto LABEL_21;
                }
              }

LABEL_34:
              uint64_t v40 = sub_100022740( result,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v41,  v42,  v43,  v44,  v45,  (uint64_t)v46,  (uint64_t)&__dst[40],  (uint64_t)&__src[40],  v47);
              sub_10000B908(v40);
              return (unint64_t)v3;
            }
          }
        }
      }
    }

LABEL_21:
    uint64_t v15 = (v19 - 1) & v19;
  }

  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

  uint64_t v54 = [v31[1] profileVersion];
  uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
  uint64_t v2 = v56;

  uint64_t v57 = [v40[1] profileVersion];
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
  uint64_t v59 = v58;

  if (v55 == v41 && v2 == v59)
  {
    sub_100038E98();
    sub_100038EC8();
    sub_100038DF0(v72);
    sub_100038E4C();
    sub_100038E3C();
    goto LABEL_28;
  }

  uint64_t v61 = _stringCompareWithSmolCheck(_:_:expecting:)(v55, v2, v41, v59, 0LL);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v59);
  sub_100038EC8();
  sub_100038DF0(v72);
  sub_100038E4C();
  sub_100038E3C();
  if ((v61 & 1) == 0)
  {
LABEL_9:
    sub_100038DF0(v41);
    sub_100038E6C();
    sub_100038E74((uint64_t)a1);
    sub_100038E88();
LABEL_10:
    sub_100038E64();
    sub_100038DF0(v2);
    sub_100038EBC();
    sub_100038EB0();
    goto LABEL_11;
  }

void sub_100020528(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t type metadata accessor for NetworkRequest(uint64_t a1)
{
  return sub_100020550(a1, qword_100050E50, (uint64_t)&nominal type descriptor for NetworkRequest);
}

uint64_t sub_100020550(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_100020580(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1000205A0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1LL;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1LL << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0LL;
  a2[4] = v2 & v5;
  return result;
}

void sub_1000205D8(uint64_t a1)
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
      sub_100006674(&qword_100050DD8);
      int64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  int64_t v4 = &_swiftEmptySetSingleton;
  if (!v2)
  {
LABEL_4:
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v5)
    {
LABEL_31:
      swift_bridgeObjectRelease(v1);
      return;
    }

    goto LABEL_15;
  }

uint64_t sub_100020830(Swift::Int *a1, void *a2)
{
  uint64_t v3 = v2;
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

      uint64_t v31 = v9;
      uint64_t v10 = sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v23 = sub_100020AC8(v7, result + 1);
    Swift::Int v32 = v23;
    unint64_t v24 = *(void *)(v23 + 16);
    if (*(void *)(v23 + 24) <= v24)
    {
      uint64_t v29 = v24 + 1;
      id v30 = v8;
      sub_100020CAC(v29);
      uint64_t v25 = v32;
    }

    else
    {
      uint64_t v25 = v23;
      id v26 = v8;
    }

    sub_100020F44((uint64_t)v8, v25);
    uint64_t v28 = *v3;
    *uint64_t v3 = v25;
  }

  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v14) & 1) != 0)
    {
      sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if ((v16 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        char v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = (Swift::Int)v20;
        id v21 = v20;
        return 0LL;
      }

      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if ((v19 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v32 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_100020FC4((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t v28 = *v3;
    *uint64_t v3 = v32;
  }

  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

Swift::Int sub_100020AC8(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  sub_100006674(&qword_100050DD8);
  uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
  uint64_t v23 = v4;
  uint64_t v5 = __CocoaSet.makeIterator()(a1);
  uint64_t v6 = __CocoaSet.Iterator.next()();
  if (!v6)
  {
LABEL_16:
    swift_release(v5);
    return v4;
  }

  uint64_t v7 = v6;
  uint64_t v8 = sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
  while (1)
  {
    uint64_t v21 = v7;
    swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
    uint64_t v4 = v23;
    unint64_t v9 = *(void *)(v23 + 16);
    if (*(void *)(v23 + 24) <= v9)
    {
      sub_100020CAC(v9 + 1);
      uint64_t v4 = v23;
    }

    uint64_t v10 = v22;
    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v12 = v4 + 56;
    uint64_t v13 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v14 = result & ~v13;
    unint64_t v15 = v14 >> 6;
    if (((-1LL << v14) & ~*(void *)(v4 + 56 + 8 * (v14 >> 6))) == 0) {
      break;
    }
    unint64_t v16 = __clz(__rbit64((-1LL << v14) & ~*(void *)(v4 + 56 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_15:
    *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
    *(void *)(*(void *)(v4 + 48) + 8 * vswift_weakDestroy(v0 + 16) = v10;
    ++*(void *)(v4 + 16);
    uint64_t v7 = __CocoaSet.Iterator.next()();
    if (!v7) {
      goto LABEL_16;
    }
  }

  char v17 = 0;
  unint64_t v18 = (unint64_t)(63 - v13) >> 6;
  while (++v15 != v18 || (v17 & 1) == 0)
  {
    BOOL v19 = v15 == v18;
    if (v15 == v18) {
      unint64_t v15 = 0LL;
    }
    v17 |= v19;
    uint64_t v20 = *(void *)(v12 + 8 * v15);
    if (v20 != -1)
    {
      unint64_t v16 = __clz(__rbit64(~v20)) + (v15 << 6);
      goto LABEL_15;
    }
  }

  __break(1u);
  return result;
}

Swift::Int sub_100020CAC(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100006674(&qword_100050DD8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    id v30 = v2;
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
    if (!v10) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      uint64_t v20 = *(void *)(*(void *)(v3 + 48) + 8 * i);
      Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      uint64_t v21 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1LL << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) == 0)
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v21) >> 6;
        while (++v23 != v26 || (v25 & 1) == 0)
        {
          BOOL v27 = v23 == v26;
          if (v23 == v26) {
            unint64_t v23 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v12 + 8 * v23);
          if (v28 != -1)
          {
            unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
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

      unint64_t v24 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v24;
      *(void *)(*(void *)(v6 + 48) + 8 * v24) = v20;
      ++*(void *)(v6 + 16);
      if (v10) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        goto LABEL_41;
      }
      if (v17 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = v8[v17];
      ++v14;
      if (!v18)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = v8[v14];
        if (!v18)
        {
          int64_t v14 = v17 + 2;
          if (v17 + 2 >= v11) {
            goto LABEL_35;
          }
          unint64_t v18 = v8[v14];
          if (!v18)
          {
            int64_t v19 = v17 + 3;
            if (v19 >= v11)
            {
LABEL_35:
              swift_release(v3);
              unint64_t v2 = v30;
              uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
              if (v29 > 63) {
                sub_100020580(0LL, (unint64_t)(v29 + 63) >> 6, (void *)(v3 + 56));
              }
              else {
                *uint64_t v8 = -1LL << v29;
              }
              *(void *)(v3 + swift_weakDestroy(v0 + 16) = 0LL;
              break;
            }

            unint64_t v18 = v8[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v14 = v19 + 1;
                if (__OFADD__(v19, 1LL)) {
                  goto LABEL_42;
                }
                if (v14 >= v11) {
                  goto LABEL_35;
                }
                unint64_t v18 = v8[v14];
                ++v19;
                if (v18) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v14 = v19;
          }
        }
      }

LABEL_23:
      unint64_t v10 = (v18 - 1) & v18;
    }
  }

  Swift::Int result = swift_release(v3);
  *unint64_t v2 = v6;
  return result;
}

    unint64_t v10 = (v18 - 1) & v18;
  }

  int64_t v19 = v17 + 3;
  if (v19 >= v11)
  {
LABEL_35:
    Swift::Int result = swift_release_n(v3, 2LL);
    unint64_t v2 = v30;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_35;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }

              swift_release(v11);
              uint64_t v29 = v32;
              id v30 = 1LL;
LABEL_24:
              sub_100007438(v29, v30, 1LL, v36);
              return;
            }
          }
        }
      }
    }

unint64_t sub_100020F44(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_100020FC4(uint64_t a1, unint64_t a2, char a3)
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
    sub_100020CAC(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_100021148();
      goto LABEL_14;
    }

    sub_1000212F0(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
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
    *(void *)(v19 + swift_weakDestroy(v0 + 16) = v22;
  }
}

  __int128 v66 = v13;
  uint64_t v67 = v9;
  uint64_t v47 = [v39[1] profile];
  uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
  unint64_t v2 = v49;

  uint64_t v40 = (id *)[v35[1] profile];
  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  uint64_t v52 = v51;

  if (v48 == v50 && v2 == v52)
  {
    sub_100038E98();
    sub_100038E6C();
    sub_100038E64();
    sub_100038E7C();
    sub_100038E2C();
    uint64_t v13 = v66;
    uint64_t v9 = v67;
    goto LABEL_21;
  }

  uint64_t v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v2, v50, v52, 0LL);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v52);
  sub_100038E6C();
  sub_100038E64();
  sub_100038E7C();
  sub_100038E2C();
  uint64_t v13 = v66;
  uint64_t v9 = v67;
  if ((v41 & 1) == 0)
  {
LABEL_8:
    sub_100038EC8();
    sub_100038DF0((uint64_t)v40);
    sub_100038E4C();
    sub_100038E3C();
    goto LABEL_9;
  }

id sub_100021148()
{
  uint64_t v1 = v0;
  sub_100006674(&qword_100050DD8);
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
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = *(void *)(v2 + 16);
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
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

LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_1000212F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100006674(&qword_100050DD8);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    *uint64_t v2 = v6;
    return result;
  }

  id v30 = v2;
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
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    Swift::Int v20 = *(void *)(v6 + 40);
    id v21 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    Swift::Int result = NSObject._rawHashValue(seed:)(v20);
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
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
        uint64_t v29 = *(void *)(v12 + 8 * v24);
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

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    *(void *)(*(void *)(v6 + 48) + 8 * v25) = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      goto LABEL_39;
    }
    if (v17 >= v11) {
      goto LABEL_35;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100021564(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001LL) == 0)
  {
    Swift::Int v10 = *(void *)(v4 + 40);
    swift_bridgeObjectRetain(v4);
    Swift::Int v11 = NSObject._rawHashValue(seed:)(v10);
    uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v13 = v11 & ~v12;
    if (((*(void *)(v4 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) != 0)
    {
      sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
      id v14 = *(id *)(*(void *)(v4 + 48) + 8 * v13);
      char v15 = static NSObject.== infix(_:_:)(v14, a1);

      if ((v15 & 1) != 0)
      {
LABEL_12:
        swift_bridgeObjectRelease(v4);
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
        uint64_t v20 = *v2;
        uint64_t v22 = *v2;
        *uint64_t v2 = 0x8000000000000000LL;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_100021148();
          uint64_t v20 = v22;
        }

        uint64_t v8 = *(void *)(*(void *)(v20 + 48) + 8 * v13);
        sub_1000218CC(v13);
        uint64_t v9 = *v2;
        *uint64_t v2 = v22;
        goto LABEL_15;
      }

      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v4 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v4 + 48) + 8 * v13);
        char v18 = static NSObject.== infix(_:_:)(v17, a1);

        if ((v18 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

uint64_t sub_100021734(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRelease(*v3);
  uint64_t v6 = __CocoaSet.count.getter(a1);
  uint64_t v7 = swift_unknownObjectRetain(a1);
  Swift::Int v8 = sub_100020AC8(v7, v6);
  Swift::Int v19 = v8;
  Swift::Int v9 = *(void *)(v8 + 40);
  swift_retain(v8);
  Swift::Int v10 = NSObject._rawHashValue(seed:)(v9);
  uint64_t v11 = -1LL << *(_BYTE *)(v8 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) != 0)
  {
    sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
    id v13 = *(id *)(*(void *)(v8 + 48) + 8 * v12);
    char v14 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v14 & 1) != 0)
    {
LABEL_6:
      swift_release(v8);
      Swift::Int v8 = *(void *)(*(void *)(v8 + 48) + 8 * v12);
      sub_1000218CC(v12);
      if ((static NSObject.== infix(_:_:)(a2, v8) & 1) != 0)
      {
        *uint64_t v3 = v19;
        return v8;
      }

      __break(1u);
    }

    else
    {
      uint64_t v15 = ~v11;
      while (1)
      {
        unint64_t v12 = (v12 + 1) & v15;
        if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
          break;
        }
        id v16 = *(id *)(*(void *)(v8 + 48) + 8 * v12);
        char v17 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v17 & 1) != 0) {
          goto LABEL_6;
        }
      }
    }

    swift_release(v8);
    __break(1u);
  }

  uint64_t result = swift_release(v8);
  __break(1u);
  return result;
}

unint64_t sub_1000218CC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56LL;
  uint64_t v5 = -1LL << *(_BYTE *)(*v1 + 32LL);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain(*v1);
    uint64_t v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_15:
            uint64_t v16 = *(void *)(v3 + 48);
            char v17 = (void *)(v16 + 8 * v2);
            char v18 = (void *)(v16 + 8 * v6);
            BOOL v19 = v2 != v6 || v17 >= v18 + 1;
            int64_t v2 = v6;
            if (v19)
            {
              void *v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }

        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_15;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    uint64_t result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFSUB__(v20, 1LL);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + swift_weakDestroy(v0 + 16) = v22;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

uint64_t sub_100021A60(void *a1)
{
  return sub_10001D268(a1, *(void **)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_100021A78()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100021A98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021ADC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkRequest(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100021B18()
{
  uint64_t v2 = (int *)type metadata accessor for NetworkRequest(0LL);
  sub_100022700();
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v5 = ((v3 & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  sub_100013CEC();
  sub_100022738();
  uint64_t v7 = sub_10000F6B0();
  sub_1000226D4(v7);
  sub_100022670(v2[5]);
  sub_100022724();
  sub_100022670(v2[9]);
  sub_100022670(v2[11]);
  sub_100022670(v2[13]);

  swift_release(*(void *)(v1 + v5));
  swift_release(*(void *)(v1 + v6));
  return sub_10001CF7C(v1, v6 + 8, v0);
}

uint64_t sub_100021BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkRequest(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100021C0C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001E5EC( a1,  a2,  a3,  *(void **)(v3 + 16),  *(void *)(v3 + 24),  (_BYTE *)(v3 + v8),  *(void **)(v3 + (v7 & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v3 + (((v7 & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void *)(v3 + (((((v7 & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFF8LL)));
}

void sub_100021C90(Swift::String forHTTPHeaderField, Swift::String _)
{
  object = forHTTPHeaderField._object;
  uint64_t countAndFlagsBits = forHTTPHeaderField._countAndFlagsBits;
  v5._uint64_t countAndFlagsBits = countAndFlagsBits;
  v5._object = object;
  URLRequest.addValue(_:forHTTPHeaderField:)(_, v5);
}

uint64_t sub_100021CC8()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = ((v2 + 40) & ~v2) + *(void *)(v1 + 64);
  uint64_t v4 = v2 | 7;
  sub_100013CEC();
  sub_100022738();

  sub_100013C3C();
  return sub_1000226A4(v0, v3, v4);
}

void sub_100021D28(void **a1)
{
}

uint64_t sub_100021D68()
{
  uint64_t v1 = *(void *)(sub_100013C94() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = (*(void *)(v1 + 64) + ((v2 + 32) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_100013CEC();
  sub_100022738();
  sub_100013C3C();

  return sub_10001CF7C(v0, v4 + 8, v3);
}

void sub_100021DD8(uint64_t a1)
{
  v4.super.Class isa = *(Class *)(v1 + (v3 & 0xFFFFFFFFFFFFF8LL));
  sub_10001F8C4(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), v1 + v5, v4);
}

uint64_t sub_100021E10()
{
  uint64_t v2 = (int *)type metadata accessor for NetworkRequest(0LL);
  sub_100022700();
  unint64_t v4 = v3 & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v5 = (v3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
  sub_100013CEC();
  uint64_t v6 = sub_10000F6B0();
  sub_1000226D4(v6);
  sub_100022670(v2[5]);
  sub_100022724();
  sub_100022670(v2[9]);
  sub_100022670(v2[11]);
  sub_100022670(v2[13]);

  return sub_1000226A4(v1, v5, v0);
}

void sub_100021E98(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for NetworkRequest(0LL) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_10001EA8C( a1,  *(void **)(v2 + 16),  v2 + v6,  *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8LL)),  a2);
}

void *sub_100021F08(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *a2;
    *a1 = *a2;
    a1 = (void *)(v30 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v30);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    Swift::Int v10 = (void *)((char *)a1 + v8);
    id v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *Swift::Int v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = *(void *)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v13;
    uint64_t v14 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
    uint64_t v15 = a3[9];
    uint64_t v16 = a3[10];
    char v17 = (void *)((char *)a1 + v15);
    char v18 = (void *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    *((_BYTE *)a1 + vswift_weakDestroy(v0 + 16) = *((_BYTE *)a2 + v16);
    uint64_t v20 = a3[11];
    uint64_t v21 = a3[12];
    uint64_t v22 = (void *)((char *)a1 + v20);
    unint64_t v23 = (void *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    *((_BYTE *)a1 + v21) = *((_BYTE *)a2 + v21);
    uint64_t v25 = a3[13];
    uint64_t v26 = a3[14];
    unint64_t v27 = (void *)((char *)a1 + v25);
    BOOL v28 = (void *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *unint64_t v27 = *v28;
    v27[1] = v29;
    *((_BYTE *)a1 + v26) = *((_BYTE *)a2 + v26);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v24);
    swift_bridgeObjectRetain(v29);
  }

  return a1;
}

uint64_t sub_100022034(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[6]));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[9] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[11] + 8));
  return swift_bridgeObjectRelease(*(void *)(a1 + a2[13] + 8));
}

uint64_t sub_1000220B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  Swift::Int v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = *(void *)(a2 + v8);
  *(void *)(a1 + v8) = v12;
  uint64_t v13 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v14);
  char v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  uint64_t v19 = a3[11];
  uint64_t v20 = a3[12];
  uint64_t v21 = (void *)(a1 + v19);
  uint64_t v22 = (void *)(a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  *(_BYTE *)(a1 + v20) = *(_BYTE *)(a2 + v20);
  uint64_t v24 = a3[13];
  uint64_t v25 = a3[14];
  uint64_t v26 = (void *)(a1 + v24);
  unint64_t v27 = (void *)(a2 + v24);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  *(_BYTE *)(a1 + v25) = *(_BYTE *)(a2 + v25);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v28);
  return a1;
}

uint64_t sub_1000221B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = *(void *)(a1 + v12);
  uint64_t v14 = *(void *)(a2 + v12);
  *(void *)(a1 + v12) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v13);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)(a1 + v15);
  char v17 = (void *)(a2 + v15);
  void *v16 = *v17;
  uint64_t v18 = v17[1];
  uint64_t v19 = v16[1];
  v16[1] = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  uint64_t v20 = a3[11];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  uint64_t v23 = v22[1];
  uint64_t v24 = v21[1];
  v21[1] = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v24);
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)(a1 + v25);
  unint64_t v27 = (void *)(a2 + v25);
  *uint64_t v26 = *v27;
  uint64_t v28 = v27[1];
  uint64_t v29 = v26[1];
  v26[1] = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_100022310(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  return a1;
}

uint64_t sub_1000223C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = v8[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = *(void *)(a1 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  swift_bridgeObjectRelease(v14);
  uint64_t v15 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  uint64_t v16 = a3[9];
  char v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  uint64_t v21 = v17[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease(v21);
  uint64_t v22 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  uint64_t v27 = v23[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease(v27);
  uint64_t v28 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  uint64_t v33 = v29[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease(v33);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  return a1;
}

uint64_t sub_1000224C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000224D4);
}

uint64_t sub_1000224D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000F6B0();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)a2) {
    return sub_10000748C(a1, a2, v6);
  }
  unint64_t v8 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF) {
    LODWORD(v8) = -1;
  }
  return (v8 + 1);
}

uint64_t sub_10002254C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100022558);
}

uint64_t sub_100022558(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000F6B0();
  if (*(_DWORD *)(*(void *)(result - 8) + 84LL) == a3) {
    return sub_100007438(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1000225CC(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_10003C440;
    v4[2] = "\b";
    v4[3] = &unk_10003C490;
    void v4[4] = &unk_10003C490;
    v4[5] = &unk_10003C4A8;
    v4[6] = &unk_10003C490;
    void v4[7] = &unk_10003C4A8;
    void v4[8] = &unk_10003C4C0;
    void v4[9] = &unk_10003C4A8;
    v4[10] = &unk_10003C490;
    swift_initStructMetadata(a1, 256LL, 11LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_100022670@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1 + 8));
}

uint64_t sub_10002267C(uint64_t a1, uint64_t a2)
{
  return JSValue.subscript.getter(a1, a2);
}

uint64_t sub_100022684()
{
  return JSError.init(badValue:expected:)(v0, 0x676E69727473LL, 0xE600000000000000LL);
}

uint64_t sub_1000226A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_deallocObject(a1, a2, a3);
}

  ;
}

uint64_t sub_1000226D4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

uint64_t sub_1000226E8()
{
  return JSValue.BOOL.getter();
}

id sub_1000226F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  return sub_10002299C((uint64_t *)va, v4);
}

  ;
}

uint64_t sub_100022718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_dynamicCast(a1, a2, a3, v3, 6LL);
}

uint64_t sub_100022724()
{
  return swift_bridgeObjectRelease(*(void *)(v1 + *(int *)(v0 + 24)));
}

void sub_100022730()
{
}

uint64_t sub_100022738()
{
  return swift_release(*(void *)(v0 + 24));
}

uint64_t sub_100022740( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return a17;
}

uint64_t sub_100022754@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16 * v1 + 8));
}

id sub_100022760(uint64_t a1)
{
  uint64_t v3 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100016618(a1, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for URL(0LL);
  int v8 = sub_10000748C((uint64_t)v6, 1LL, v7);
  uint64_t v9 = v1;
  uint64_t v11 = v9;
  if (v8 == 1)
  {
    sub_10000B8C8((uint64_t)v6);
    unint64_t v12 = 0xE700000000000000LL;
    uint64_t v13 = 0x6E776F6E6B6E75LL;
  }

  else
  {
    uint64_t v13 = URL.absoluteString.getter(v9, v10);
    unint64_t v12 = v14;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  }

  uint64_t v15 = (uint64_t *)&v11[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSServiceObject_url];
  uint64_t *v15 = v13;
  v15[1] = v12;

  uint64_t v16 = (objc_class *)type metadata accessor for JSServiceObject();
  v19.receiver = v11;
  v19.super_class = v16;
  id v17 = objc_msgSendSuper2(&v19, "init");
  sub_10000B8C8(a1);
  return v17;
}

uint64_t sub_1000228C8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSServiceObject_url);
  swift_bridgeObjectRetain(*(void *)(v0 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSServiceObject_url + 8));
  return v1;
}

void sub_100022900()
{
}

id sub_100022938()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSServiceObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSServiceObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService15JSServiceObject);
}

id sub_10002299C(void *a1, void *a2)
{
  uint64_t v5 = a1[3];
  if (v5)
  {
    uint64_t v7 = sub_100007060(a1, a1[3]);
    uint64_t v8 = *(void *)(v5 - 8);
    __chkstk_darwin(v7, v7);
    sub_10002483C();
    (*(void (**)(uint64_t))(v8 + 16))(v3);
    uint64_t v9 = _bridgeAnythingToObjectiveC<A>(_:)(v3, v5);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3, v5);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = [(id)swift_getObjCClassFromMetadata(v2) valueWithObject:v9 inContext:a2];
  swift_unknownObjectRelease(v9);

  return v10;
}

uint64_t JSServiceRequest.init(fragment:options:url:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  uint64_t v6 = (uint64_t)a5 + *(int *)(sub_10002488C() + 24);
  return sub_100022AF8(a4, v6);
}

uint64_t type metadata accessor for JSServiceRequest(uint64_t a1)
{
  uint64_t result = qword_100050F88;
  if (!qword_100050F88) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSServiceRequest);
  }
  return result;
}

uint64_t sub_100022AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_1000505B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t JSServiceRequest.fragment.getter()
{
  uint64_t v1 = *v0;
  sub_10000A210();
  return v1;
}

uint64_t JSServiceRequest.options.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 16));
}

uint64_t JSServiceRequest.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(sub_10002488C() + 24);
  return sub_100016618(v3, a1);
}

void JSServiceRequest.init(deserializing:using:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v32 = a2;
  sub_100006674(&qword_1000505B8);
  sub_100024794();
  __chkstk_darwin(v5, v6);
  sub_10000D574();
  uint64_t v33 = v7;
  sub_100006674(&qword_100050760);
  sub_100024794();
  __chkstk_darwin(v8, v9);
  sub_1000168D8();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_1000248E8();
  uint64_t v15 = __chkstk_darwin(v13, v14);
  id v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15, v18);
  uint64_t v20 = (char *)&v32 - v19;
  sub_1000248A4();
  uint64_t v21 = sub_1000248E0();
  uint64_t v22 = JSONObject.string.getter(v21);
  uint64_t v24 = v23;
  sub_100024884((uint64_t)v20);
  *a3 = v22;
  a3[1] = v24;
  sub_10002486C();
  uint64_t v25 = sub_1000248E0();
  JSONObject.dictionary.getter(v25);
  sub_100024884((uint64_t)v17);
  uint64_t v26 = type metadata accessor for JSONDictionary(0LL);
  if (sub_10000748C(v12, 1LL, v26) == 1)
  {
    sub_1000074D0(v12, &qword_100050760);
    uint64_t v27 = 0LL;
  }

  else
  {
    uint64_t v27 = JSONDictionary.bridgedPrimitiveValues<A, B>()( &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8LL))(v12, v26);
  }

  a3[2] = v27;
  uint64_t v28 = sub_1000248E0();
  uint64_t v29 = v33;
  JSONObject.url.getter(v28);
  uint64_t v30 = sub_1000248F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8LL))(v32, v30);
  sub_100024884(a1);
  sub_100024884((uint64_t)v20);
  uint64_t v31 = sub_10002488C();
  sub_100022AF8(v29, (uint64_t)a3 + *(int *)(v31 + 24));
  sub_1000247A4();
}

void sub_100022DA4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
}

unint64_t JSServiceRequest.kind.getter()
{
  return 0xD000000000000016LL;
}

JSValue __swiftcall JSServiceRequest.makeValue(in:)(JSContext in)
{
  result.super.Class isa = (Class) [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:in.super.isa];
  if (!result.super.isa)
  {
    __break(1u);
    goto LABEL_15;
  }

  Class isa = result.super.isa;
  sub_10000FB50();
  uint64_t v8 = in.super.isa;
  result.super.Class isa = (Class)sub_1000247BC();
  if (!result.super.isa)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  sub_10000A9A0();
  if (!*(void *)(v1 + 8)) {
    goto LABEL_6;
  }
  uint64_t v9 = v8;
  sub_10000A210();
  result.super.Class isa = (Class)sub_1000247BC();
  if (!result.super.isa)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  sub_10000A9A0();
LABEL_6:
  uint64_t v10 = sub_10002488C();
  sub_100016618(v1 + *(int *)(v10 + 24), v2);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = sub_10000748C(v2, 1LL, v11);
  if ((_DWORD)v12 == 1)
  {
    sub_1000074D0(v2, &qword_1000505B8);
LABEL_10:
    if (!*(void *)(v1 + 16)) {
      return (JSValue)isa;
    }
    sub_100006674(&qword_100050280);
    uint64_t v15 = v8;
    sub_10000A210();
    result.super.Class isa = (Class)sub_1000247BC();
    if (result.super.isa)
    {
      sub_10000A9A0();
      return (JSValue)isa;
    }

    goto LABEL_17;
  }

  URL.absoluteString.getter(v12, v13);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(v2, v11);
  uint64_t v14 = v8;
  result.super.Class isa = (Class)sub_1000247BC();
  if (result.super.isa)
  {
    sub_10000A9A0();
    goto LABEL_10;
  }

void sub_100022FF0()
{
}

unint64_t sub_100023000()
{
  return 0xD000000000000016LL;
}

void *Data.init(deserializing:using:)(void *a1)
{
  uint64_t v5 = a1;
  JSONObject.dictionary.getter(v6);
  uint64_t v7 = type metadata accessor for JSONDictionary(0LL);
  if (sub_10000748C(v1, 1LL, v7) == 1)
  {
    sub_1000074D0(v1, &qword_100050760);
LABEL_6:
    id v14 = [objc_allocWithZone(NSError) init];
LABEL_7:
    swift_willThrow(v14);
    uint64_t v15 = sub_1000248F0();
    sub_1000226D4(v15);
    uint64_t v16 = sub_1000248E8();
    sub_100024828(v16);
    return v5;
  }

  uint64_t v5 = (void *)JSONDictionary.bridgedPrimitiveValues<A, B>()( &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v1, v7);
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v8 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  id v10 = sub_1000248C4(v8, "dataWithJSONObject:options:error:", (uint64_t)isa);

  id v11 = 0LL;
  if (!v10)
  {
    uint64_t v5 = v11;
    _convertNSErrorToError(_:)(v11);

    goto LABEL_7;
  }

  uint64_t v5 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);

  uint64_t v12 = sub_1000248F0();
  sub_1000226D4(v12);
  uint64_t v13 = sub_1000248E8();
  sub_100024828(v13);
  return v5;
}

uint64_t sub_10002322C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x746E656D67617266LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v7 = 0xE800000000000000LL;
    goto LABEL_8;
  }

  uint64_t v5 = sub_1000248A4();
  if ((sub_1000247CC(v5, v6) & 1) != 0)
  {
    unint64_t v7 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v7);
    return 0LL;
  }

  if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000LL)
  {
    unint64_t v12 = 0xE700000000000000LL;
    goto LABEL_16;
  }

  uint64_t v10 = sub_10002486C();
  if ((sub_1000247CC(v10, v11) & 1) != 0)
  {
    unint64_t v12 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v12);
    return 1LL;
  }

  if (a1 == 7107189 && a2 == 0xE300000000000000LL)
  {
    swift_bridgeObjectRelease(0xE300000000000000LL);
    return 2LL;
  }

  else
  {
    char v14 = sub_1000247CC(7107189LL, 0xE300000000000000LL);
    swift_bridgeObjectRelease(a2);
    if ((v14 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_100023324(char a1)
{
  if (!a1) {
    return 0x746E656D67617266LL;
  }
  if (a1 == 1) {
    return 0x736E6F6974706FLL;
  }
  return 7107189LL;
}

void *sub_100023374@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  JSValue result = Data.init(deserializing:using:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }

  return result;
}

uint64_t sub_10002339C()
{
  return sub_100023324(*v0);
}

uint64_t sub_1000233A4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10002322C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000233C8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1000233D4(uint64_t a1)
{
  unint64_t v2 = sub_100023CF4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000233FC(uint64_t a1)
{
  unint64_t v2 = sub_100023CF4();
  return CodingKey.debugDescription.getter(a1, v2);
}

void JSServiceRequest.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = v7;
  uint64_t v40 = sub_100006674(&qword_100050EE0);
  uint64_t v8 = *(void *)(v40 - 8);
  __chkstk_darwin(v40, v9);
  sub_100024854();
  uint64_t v10 = sub_10002488C();
  sub_100024794();
  __chkstk_darwin(v11, v12);
  sub_1000168D8();
  uint64_t v15 = (void *)(v14 - v13);
  uint64_t v17 = a1[3];
  uint64_t v16 = a1[4];
  sub_100007060(a1, v17);
  unint64_t v18 = sub_100023CF4();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for JSServiceRequest.CodingKeys,  &type metadata for JSServiceRequest.CodingKeys,  v18,  v17,  v16);
  if (v2)
  {
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
  }

  else
  {
    uint64_t v37 = v8;
    LOBYTE(v42) = 0;
    uint64_t v19 = v3;
    void *v15 = KeyedDecodingContainer.decode(_:forKey:)(&v42, v40);
    v15[1] = v20;
    LOBYTE(v41) = 1;
    uint64_t v21 = v20;
    unint64_t v22 = sub_100023D30();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v42, &type metadata for Data, &v41, v40, &type metadata for Data, v22);
    uint64_t v36 = v21;
    uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v42 = 0LL;
    id v25 = sub_1000248C4(v23, "JSONObjectWithData:options:error:", (uint64_t)isa);

    id v26 = v42;
    if (v25)
    {
      id v27 = v42;
      _bridgeAnyObjectToAny(_:)(&v42);
      sub_1000248CC();
      swift_unknownObjectRelease(v25);
      uint64_t v28 = sub_100006674(&qword_100050280);
      int v29 = swift_dynamicCast(&v41, &v42, (char *)&type metadata for Any + 8, v28, 6LL);
      uint64_t v30 = v41;
      if (!v29) {
        uint64_t v30 = 0LL;
      }
      v15[2] = v30;
      LOBYTE(v42) = 2;
      uint64_t v31 = KeyedDecodingContainer.decode(_:forKey:)(&v42, v40);
      uint64_t v33 = v32;
      URL.init(string:)(v31, v32);
      swift_bridgeObjectRelease(v33);
      sub_100024894();
      sub_100022AF8(v38, (uint64_t)v15 + *(int *)(v10 + 24));
      sub_10001655C((uint64_t)v15, a2);
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
      sub_100023D6C((uint64_t)v15);
    }

    else
    {
      id v34 = v42;
      _convertNSErrorToError(_:)(v26);

      swift_willThrow(v35);
      sub_1000248CC();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v19, v40);
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
      swift_bridgeObjectRelease(v36);
    }
  }

  sub_1000247A4();
}

void JSServiceRequest.encode(to:)(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  sub_100006674(&qword_1000505B8);
  sub_100024794();
  __chkstk_darwin(v6, v7);
  sub_1000168D8();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v38 = *(void *)(v11 - 8);
  uint64_t v39 = v11;
  __chkstk_darwin(v11, v12);
  sub_10000D574();
  uint64_t v37 = v13;
  uint64_t v14 = sub_100006674(&qword_100050EF8);
  __chkstk_darwin(v14, v15);
  sub_1000168D8();
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  sub_100007060(a1, v16);
  unint64_t v18 = sub_100023CF4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for JSServiceRequest.CodingKeys,  &type metadata for JSServiceRequest.CodingKeys,  v18,  v16,  v17);
  uint64_t v19 = v4[1];
  if (v19)
  {
    uint64_t v20 = *v4;
    LOBYTE(v41[0]) = 0;
    sub_1000247EC(v20, v19);
    uint64_t v3 = v2;
    if (v2) {
      goto LABEL_12;
    }
  }

  if (!v4[2]) {
    goto LABEL_9;
  }
  uint64_t v21 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v41[0] = 0LL;
  id v23 = sub_1000248C4(v21, "dataWithJSONObject:options:error:", (uint64_t)isa);

  id v24 = 0LL;
  if (!v23)
  {
    int v29 = v24;
    _convertNSErrorToError(_:)(v24);

    swift_willThrow(v30);
    goto LABEL_12;
  }

  uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v23);
  uint64_t v27 = v26;

  v41[0] = v25;
  v41[1] = v27;
  char v40 = 1;
  unint64_t v28 = sub_100023DEC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v41, &v40, v14, &type metadata for Data, v28);
  if (!v3)
  {
    sub_1000248F8();
LABEL_9:
    uint64_t v31 = sub_10002488C();
    sub_100016618((uint64_t)v4 + *(int *)(v31 + 24), v10);
    if (sub_10000748C(v10, 1LL, v39) == 1)
    {
      sub_1000247DC();
      sub_1000074D0(v10, &qword_1000505B8);
      goto LABEL_13;
    }

    uint64_t v32 = (*(uint64_t (**)(void))(v38 + 32))();
    uint64_t v34 = URL.absoluteString.getter(v32, v33);
    uint64_t v36 = v35;
    LOBYTE(v41[0]) = 2;
    sub_1000247EC(v34, v35);
    swift_bridgeObjectRelease(v36);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
LABEL_12:
    sub_1000247DC();
    goto LABEL_13;
  }

  sub_1000247DC();
  sub_1000248F8();
LABEL_13:
  sub_1000247A4();
}

void sub_100023A78(void *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_100023A8C(void *a1)
{
}

uint64_t JSServiceRequest.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)0xE900000000000064LL;
  uint64_t v3 = 0x656E696665646E75LL;
  uint64_t v4 = sub_100006674(&qword_1000505B8);
  sub_100024794();
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7, v10);
  uint64_t v12 = (char *)v37 - v11;
  uint64_t v38 = 0LL;
  unint64_t v39 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(56LL);
  uint64_t v13 = sub_10002488C();
  v37[0] = v13;
  uint64_t v14 = sub_100006674(&qword_100050F08);
  v15._uint64_t countAndFlagsBits = sub_10002481C(v14);
  object = v15._object;
  String.append(_:)(v15);
  sub_1000248D8();
  v17._object = (void *)0x800000010003F150LL;
  v17._uint64_t countAndFlagsBits = 0xD000000000000013LL;
  String.append(_:)(v17);
  uint64_t v18 = v0[1];
  if (v18)
  {
    v37[0] = *v0;
    v37[1] = v18;
    swift_bridgeObjectRetain(v18);
    uint64_t v19 = sub_100006674(&qword_100050CB8);
    uint64_t v20 = sub_10002481C(v19);
    object = v21;
  }

  else
  {
    uint64_t v20 = sub_100024800();
  }

  unint64_t v22 = object;
  String.append(_:)(*(Swift::String *)&v20);
  sub_1000248D8();
  v23._uint64_t countAndFlagsBits = 0x706F202020200A29LL;
  v23._object = (void *)0xEF203A736E6F6974LL;
  String.append(_:)(v23);
  uint64_t v24 = v0[2];
  if (v24)
  {
    v37[0] = v0[2];
    swift_bridgeObjectRetain(v24);
    uint64_t v25 = sub_100006674(&qword_100050F10);
    uint64_t v26 = sub_10002481C(v25);
    object = v27;
  }

  else
  {
    uint64_t v26 = sub_100024800();
  }

  unint64_t v28 = object;
  String.append(_:)(*(Swift::String *)&v26);
  sub_1000248D8();
  v29._uint64_t countAndFlagsBits = 0x7275202020200A29LL;
  v29._object = (void *)0xEB00000000203A6CLL;
  String.append(_:)(v29);
  uint64_t v30 = (uint64_t)v0 + *(int *)(v13 + 24);
  sub_100016618((uint64_t)v1 + *(int *)(v13 + 24), (uint64_t)v12);
  uint64_t v31 = type metadata accessor for URL(0LL);
  int v32 = sub_10000748C((uint64_t)v12, 1LL, v31);
  sub_1000074D0((uint64_t)v12, &qword_1000505B8);
  if (v32 != 1)
  {
    sub_100016618(v30, (uint64_t)v9);
    uint64_t v3 = String.init<A>(describing:)(v9, v4);
    uint64_t v2 = v33;
  }

  v34._uint64_t countAndFlagsBits = v3;
  v34._object = v2;
  String.append(_:)(v34);
  swift_bridgeObjectRelease(v2);
  v35._uint64_t countAndFlagsBits = 8194601LL;
  v35._object = (void *)0xE300000000000000LL;
  String.append(_:)(v35);
  return v38;
}

unint64_t sub_100023CF4()
{
  unint64_t result = qword_100050EE8;
  if (!qword_100050EE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C7CC, &type metadata for JSServiceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050EE8);
  }

  return result;
}

unint64_t sub_100023D30()
{
  unint64_t result = qword_100050EF0;
  if (!qword_100050EF0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100050EF0);
  }

  return result;
}

uint64_t sub_100023D6C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSServiceRequest(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100023DA8(uint64_t result, unint64_t a2)
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

unint64_t sub_100023DEC()
{
  unint64_t result = qword_100050F00;
  if (!qword_100050F00)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100050F00);
  }

  return result;
}

uint64_t sub_100023E28()
{
  return sub_100023E70(&qword_100050F18, (uint64_t)&protocol conformance descriptor for JSServiceRequest);
}

uint64_t sub_100023E4C()
{
  return sub_100023E70(&qword_100050F20, (uint64_t)&protocol conformance descriptor for JSServiceRequest);
}

uint64_t sub_100023E70(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for JSServiceRequest(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100023EB4()
{
  unint64_t result = qword_100050F28;
  if (!qword_100050F28)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100050F28);
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for JSServiceRequest(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v12);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[2];
    a1[2] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for URL(0LL);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    if (sub_10000748C((uint64_t)v9, 1LL, v10))
    {
      uint64_t v11 = sub_100006674(&qword_1000505B8);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
      sub_100007438((uint64_t)v8, 0LL, 1LL, v10);
    }
  }

  return v3;
}

uint64_t destroy for JSServiceRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t result = sub_10000748C(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }
  return result;
}

void *initializeWithCopy for JSServiceRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  a1[2] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  if (sub_10000748C((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_100006674(&qword_1000505B8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16LL))(v7, v8, v9);
    sub_100007438((uint64_t)v7, 0LL, 1LL, v9);
  }

  return a1;
}

void *assignWithCopy for JSServiceRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a1[2];
  uint64_t v9 = a2[2];
  a1[2] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v8);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for URL(0LL);
  int v14 = sub_10000748C((uint64_t)v11, 1LL, v13);
  int v15 = sub_10000748C((uint64_t)v12, 1LL, v13);
  if (!v14)
  {
    uint64_t v16 = *(void *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v11, v12, v13);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }

  if (v15)
  {
LABEL_6:
    uint64_t v17 = sub_100006674(&qword_1000505B8);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
  sub_100007438((uint64_t)v11, 0LL, 1LL, v13);
  return a1;
}

uint64_t initializeWithTake for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for URL(0LL);
  if (sub_10000748C((uint64_t)v6, 1LL, v7))
  {
    uint64_t v8 = sub_100006674(&qword_1000505B8);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
    sub_100007438((uint64_t)v5, 0LL, 1LL, v7);
  }

  return a1;
}

void *assignWithTake for JSServiceRequest(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a1[2];
  a1[2] = a2[2];
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for URL(0LL);
  int v13 = sub_10000748C((uint64_t)v10, 1LL, v12);
  int v14 = sub_10000748C((uint64_t)v11, 1LL, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }

  if (v14)
  {
LABEL_6:
    uint64_t v16 = sub_100006674(&qword_1000505B8);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  sub_100007438((uint64_t)v10, 0LL, 1LL, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024438);
}

uint64_t sub_100024438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(__chkstk_darwin(v3, v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }

  else
  {
    uint64_t v9 = sub_100006674(&qword_1000505B8);
    return sub_10000748C(a1 + *(int *)(a3 + 24), a2, v9);
  }

uint64_t storeEnumTagSinglePayload for JSServiceRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000244C8);
}

uint64_t sub_1000244C8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }

  else
  {
    uint64_t v7 = sub_100006674(&qword_1000505B8);
    return sub_100007438(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }

  return result;
}

void sub_100024538(uint64_t a1)
{
  v4[0] = &unk_10003C6D8;
  v4[1] = &unk_10003C6F0;
  sub_1000245B4(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

void sub_1000245B4(uint64_t a1)
{
  if (!qword_100050F98)
  {
    uint64_t v2 = type metadata accessor for URL(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100050F98);
    }
  }

uint64_t storeEnumTagSinglePayload for JSServiceRequest.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(__chkstk_darwin(v3, v4) = 1;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_100024654 + 4 * byte_10003C505[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100024688 + 4 * asc_10003C500[v4]))();
}

uint64_t sub_100024688(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100024690(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100024698LL);
  }
  return result;
}

uint64_t sub_1000246A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000246ACLL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1000246B0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000246B8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JSServiceRequest.CodingKeys()
{
  return &type metadata for JSServiceRequest.CodingKeys;
}

unint64_t sub_1000246D8()
{
  unint64_t result = qword_100050FD0;
  if (!qword_100050FD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C7A4, &type metadata for JSServiceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050FD0);
  }

  return result;
}

unint64_t sub_100024718()
{
  unint64_t result = qword_100050FD8;
  if (!qword_100050FD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C714, &type metadata for JSServiceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050FD8);
  }

  return result;
}

unint64_t sub_100024758()
{
  unint64_t result = qword_100050FE0;
  if (!qword_100050FE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C73C, &type metadata for JSServiceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100050FE0);
  }

  return result;
}

  ;
}

  ;
}

id sub_1000247BC()
{
  return sub_10002299C((void *)(v1 - 112), v0);
}

uint64_t sub_1000247CC(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0LL);
}

uint64_t sub_1000247DC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_1000247EC(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v3 - 104, v2);
}

uint64_t sub_100024800()
{
  return 0x656E696665646E75LL;
}

uint64_t sub_10002481C(uint64_t a1)
{
  return String.init<A>(describing:)(v1 - 112, a1);
}

uint64_t sub_100024828(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v1, a1);
}

  ;
}

  ;
}

uint64_t sub_10002486C()
{
  return 0x736E6F6974706FLL;
}

uint64_t sub_100024884(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_10002488C()
{
  return type metadata accessor for JSServiceRequest(0LL);
}

uint64_t sub_100024894()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_1000248A4()
{
  return 0x746E656D67617266LL;
}

uint64_t sub_1000248BC()
{
  return swift_errorRelease(v0);
}

id sub_1000248C4(id a1, SEL a2, uint64_t a3)
{
  return objc_msgSend(a1, a2, a3, 0);
}

uint64_t sub_1000248CC()
{
  return sub_100023DA8(v1, v0);
}

uint64_t sub_1000248D8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000248E0()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_1000248E8()
{
  return type metadata accessor for JSONObject(0LL);
}

uint64_t sub_1000248F0()
{
  return type metadata accessor for JSONContext(0LL);
}

uint64_t sub_1000248F8()
{
  return sub_100023DA8(v0, v1);
}

uint64_t *sub_100024904(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v9);
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for URL(0LL);
    (*(void (**)(_BYTE *, char *, uint64_t))(*(void *)(v8 - 8) + 16LL))(v6, v7, v8);
  }

  return v3;
}

uint64_t sub_10002498C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
}

_BYTE *sub_1000249C4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for URL(0LL);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v7 - 8) + 16LL))(v5, v6, v7);
  return a1;
}

_BYTE *sub_100024A20(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for URL(0LL);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v7 - 8) + 24LL))(v5, v6, v7);
  return a1;
}

_BYTE *sub_100024A7C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for URL(0LL);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

_BYTE *sub_100024AD8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for URL(0LL);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(void *)(v7 - 8) + 40LL))(v5, v6, v7);
  return a1;
}

uint64_t sub_100024B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100024B40);
}

uint64_t sub_100024B40(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 250)
  {
    unsigned int v4 = *a1;
    if (v4 >= 6) {
      return v4 - 5;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    return sub_10000748C((uint64_t)&a1[*(int *)(a3 + 20)], a2, v8);
  }

uint64_t sub_100024BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100024BB8);
}

_BYTE *sub_100024BB8(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 250)
  {
    *unint64_t result = a2 + 5;
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    return (_BYTE *)sub_100007438((uint64_t)&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for JSSourceFile(uint64_t a1)
{
  uint64_t result = qword_100051040;
  if (!qword_100051040) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSSourceFile);
  }
  return result;
}

uint64_t sub_100024C58(uint64_t a1)
{
  v4[0] = &unk_10003C840;
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t getEnumTagSinglePayload for JSSourceFile.Format(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
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

    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for JSSourceFile.Format(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(__chkstk_darwin(v3, v4) = 1;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_100024DA0 + 4 * byte_10003C825[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100024DD4 + 4 * byte_10003C820[v4]))();
}

uint64_t sub_100024DD4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100024DDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100024DE4LL);
  }
  return result;
}

uint64_t sub_100024DF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100024DF8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_100024DFC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100024E04(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JSSourceFile.Format()
{
  return &type metadata for JSSourceFile.Format;
}

unint64_t sub_100024E24()
{
  unint64_t result = qword_100051078;
  if (!qword_100051078)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C8A0, &type metadata for JSSourceFile.Format);
    atomic_store(result, (unint64_t *)&qword_100051078);
  }

  return result;
}

Swift::Int sub_100024E60(char a1)
{
  int v1 = a1 & 1;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)((v1 + 1));
  return Hasher._finalize()();
}

void sub_100024EA4(uint64_t a1, char a2)
{
}

Swift::Int sub_100024ECC(uint64_t a1, char a2)
{
  int v2 = a2 & 1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)((v2 + 1));
  return Hasher._finalize()();
}

uint64_t sub_100024F0C(uint64_t a1)
{
  if (a1 == 2) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (a1 == 1) {
    return 0LL;
  }
  else {
    return v1;
  }
}

uint64_t sub_100024F24(char a1)
{
  return (a1 & 1u) + 1;
}

BOOL sub_100024F30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100027748(*a1, *a2);
}

Swift::Int sub_100024F3C()
{
  return sub_100024E60(*v0);
}

void sub_100024F44(uint64_t a1)
{
}

Swift::Int sub_100024F4C(uint64_t a1)
{
  return sub_100024ECC(a1, *v1);
}

uint64_t sub_100024F54@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_100024F0C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100024F7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100024F24(*v1);
  *a1 = result;
  return result;
}

void sub_100024FA4(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = v6 - v7;
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v47 - v11;
  uint64_t v13 = type metadata accessor for URL(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  sub_100026A90();
  uint64_t v18 = v16 - v17;
  __chkstk_darwin(v19, v20);
  unint64_t v22 = (char *)&v47 - v21;
  Swift::String v23 = (int *)type metadata accessor for JSSourceInfo(0LL);
  sub_100024794();
  uint64_t v26 = __chkstk_darwin(v24, v25);
  unint64_t v28 = (char *)&v47 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = 25705LL;
  unint64_t v53 = 0xE200000000000000LL;
  sub_100026A68(v26, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  sub_100026A28();
  sub_100026AB4();
  if (!v55)
  {
    unint64_t v35 = a1;
    goto LABEL_10;
  }

  uint64_t v29 = sub_100026A14((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any);
  if ((v29 & 1) == 0)
  {
    unint64_t v38 = a1;
    goto LABEL_13;
  }

  uint64_t v51 = a2;
  unint64_t v30 = v53;
  uint64_t v49 = v52;
  *(double *)&uint64_t v52 = 1.06441005e248;
  unint64_t v53 = 0xE800000000000000LL;
  sub_100026A68(v29, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  sub_100026A28();
  sub_100026AB4();
  if (!v55)
  {
    sub_100026ADC();
    sub_100005868();
    sub_1000074D0((uint64_t)v54, (uint64_t *)&unk_1000509C0);
LABEL_17:
    uint64_t v39 = 1LL;
    a2 = v51;
    goto LABEL_18;
  }

  unint64_t v50 = v30;
  uint64_t v31 = sub_100006674(&qword_1000510A0);
  if ((sub_100026A14(v31, (uint64_t)&type metadata for Any) & 1) == 0)
  {
    swift_bridgeObjectRelease(v50);
    sub_100005868();
    goto LABEL_17;
  }

  uint64_t v32 = v52;
  v54[0] = 0xD000000000000012LL;
  v54[1] = 0x800000010003F170LL;
  AnyHashable.init<A>(_:)(v54, &type metadata for String, &protocol witness table for String);
  sub_100026A28();
  sub_100026AB4();
  if (v55)
  {
    uint64_t v33 = sub_100026A14((uint64_t)&type metadata for Double, (uint64_t)&type metadata for Any);
    if ((_DWORD)v33) {
      double v34 = *(double *)&v52;
    }
    else {
      double v34 = 86400.0;
    }
  }

  else
  {
    uint64_t v33 = sub_1000074D0((uint64_t)v54, (uint64_t *)&unk_1000509C0);
    double v34 = 86400.0;
  }

  uint64_t v52 = 7107189LL;
  unint64_t v53 = 0xE300000000000000LL;
  sub_100026A68(v33, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  sub_100026A28();
  sub_100026AB4();
  uint64_t v48 = v32;
  if (!v55)
  {
    uint64_t v41 = (uint64_t *)&unk_1000509C0;
    id v42 = v54;
LABEL_25:
    uint64_t v40 = sub_1000074D0((uint64_t)v42, v41);
    goto LABEL_26;
  }

  uint64_t v40 = sub_100026A14((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any);
  if ((v40 & 1) != 0)
  {
    URL.init(string:)(v52, v53);
    sub_100026ADC();
    if (sub_10000748C((uint64_t)v12, 1LL, v13) != 1)
    {
      sub_100005868();
      int64_t v44 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v44(v22, v12, v13);
      v44(&v28[v23[8]], v22, v13);
      *(double *)unint64_t v28 = v34;
      unint64_t v45 = v50;
      *((void *)v28 + 1) = v49;
      *((void *)v28 + 2) = v45;
      sub_100026ABC(v23[6]);
      *(void *)&v28[v23[7]] = v48;
      sub_100026AA0();
      a2 = v51;
      goto LABEL_34;
    }

    uint64_t v41 = &qword_1000505B8;
    id v42 = v12;
    goto LABEL_25;
  }

LABEL_26:
  unint64_t v43 = v50;
  a2 = v51;
  *(double *)&uint64_t v52 = 3.06712947e103;
  unint64_t v53 = 0xEA00000000004C52LL;
  sub_100026A68(v40, (uint64_t)&type metadata for String, (uint64_t)&protocol witness table for String);
  sub_100026A28();
  sub_100005868();
  sub_100026AB4();
  if (v55)
  {
    if ((sub_100026A14((uint64_t)&type metadata for String, (uint64_t)&type metadata for Any) & 1) != 0)
    {
      URL.init(string:)(v52, v53);
      sub_100005868();
      if (sub_10000748C(v8, 1LL, v13) == 1)
      {
        sub_100026AE4();
        swift_bridgeObjectRelease(v43);
        uint64_t v36 = &qword_1000505B8;
        uint64_t v37 = (void *)v8;
        goto LABEL_11;
      }

      uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
      v46(v18, v8, v13);
      v46((uint64_t)&v28[v23[6]], v18, v13);
      *(double *)unint64_t v28 = v34;
      *((void *)v28 + 1) = v49;
      *((void *)v28 + 2) = v43;
      sub_100026AA0();
      *(void *)&v28[v23[7]] = v48;
      sub_100026ABC(v23[8]);
LABEL_34:
      sub_100025DFC((uint64_t)v28, a2);
      uint64_t v39 = 0LL;
      goto LABEL_18;
    }

    sub_100026AE4();
    unint64_t v38 = v43;
LABEL_13:
    swift_bridgeObjectRelease(v38);
    goto LABEL_14;
  }

  sub_100026AE4();
  unint64_t v35 = v43;
LABEL_10:
  swift_bridgeObjectRelease(v35);
  uint64_t v36 = (uint64_t *)&unk_1000509C0;
  uint64_t v37 = v54;
LABEL_11:
  sub_1000074D0((uint64_t)v37, v36);
LABEL_14:
  uint64_t v39 = 1LL;
LABEL_18:
  sub_100007438(a2, v39, 1LL, (uint64_t)v23);
  sub_100026A74();
}

void sub_10002546C(uint64_t a1@<X8>)
{
  uint64_t v129 = a1;
  sub_100006674(&qword_100051080);
  sub_100024794();
  __chkstk_darwin(v1, v2);
  sub_10000D574();
  uint64_t v119 = v3;
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v117 = *(void *)(v4 - 8);
  uint64_t v118 = v4;
  __chkstk_darwin(v4, v5);
  sub_10000D574();
  uint64_t v116 = v6;
  uint64_t v7 = type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v123 = *(void *)(v7 - 8);
  uint64_t v124 = v7;
  __chkstk_darwin(v7, v8);
  sub_10000D574();
  uint64_t v122 = v9;
  uint64_t v10 = type metadata accessor for JSSourceInfo(0LL);
  sub_100024794();
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v115 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100006674(&qword_1000505B8);
  sub_100024794();
  __chkstk_darwin(v15, v16);
  sub_100026A90();
  uint64_t v19 = v17 - v18;
  uint64_t v22 = __chkstk_darwin(v20, v21);
  uint64_t v24 = (char *)&v115 - v23;
  uint64_t v26 = __chkstk_darwin(v22, v25);
  unint64_t v28 = (char *)&v115 - v27;
  uint64_t v30 = __chkstk_darwin(v26, v29);
  uint64_t v32 = (char *)&v115 - v31;
  __chkstk_darwin(v30, v33);
  unint64_t v35 = (char *)&v115 - v34;
  uint64_t v36 = type metadata accessor for URL(0LL);
  uint64_t v37 = *(void *)(v36 - 8);
  __chkstk_darwin(v36, v38);
  sub_100026A90();
  uint64_t v121 = v39 - v40;
  sub_100026AEC();
  __chkstk_darwin(v41, v42);
  unint64_t v120 = (char *)&v115 - v43;
  sub_100026AEC();
  __chkstk_darwin(v44, v45);
  unint64_t v125 = (char *)&v115 - v46;
  sub_100026AEC();
  __chkstk_darwin(v47, v48);
  unint64_t v126 = (char *)&v115 - v49;
  sub_100026AEC();
  __chkstk_darwin(v50, v51);
  uint64_t v128 = (char *)&v115 - v52;
  id v53 = objc_msgSend((id)objc_opt_self(NSURL), "ams_cachesDirectory");
  if (v53)
  {
    uint64_t v54 = v53;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v53);

    uint64_t v55 = 0LL;
  }

  else
  {
    uint64_t v55 = 1LL;
  }

  sub_100026A40((uint64_t)v28, v55);
  sub_100022AF8((uint64_t)v28, (uint64_t)v32);
  sub_100026A4C((uint64_t)v32);
  if (v57)
  {
    sub_1000074D0((uint64_t)v32, &qword_1000505B8);
    sub_100026A40((uint64_t)v35, 1LL);
LABEL_9:
    uint64_t v58 = &qword_1000505B8;
    uint64_t v59 = (uint64_t)v35;
    goto LABEL_10;
  }

  URL.appendingPathComponent(_:)(0x5563696D616E7944LL, 0xE900000000000049LL);
  unint64_t v56 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  sub_100026A38((uint64_t)v32);
  sub_100026A40((uint64_t)v35, 0LL);
  sub_100026A4C((uint64_t)v35);
  if (v57) {
    goto LABEL_9;
  }
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  uint64_t v64 = (uint64_t)v128;
  v63(v128, v35, v36);
  uint64_t v65 = v127;
  sub_100016618(v127 + *(int *)(v10 + 24), v19);
  sub_100025CC4(v65, (uint64_t)v14);
  sub_100026A4C(v19);
  if (v66)
  {
    sub_100016618((uint64_t)&v14[*(int *)(v10 + 32)], (uint64_t)v24);
    sub_100025D08((uint64_t)v14);
    sub_1000074D0(v19, &qword_1000505B8);
  }

  else
  {
    sub_100025D08((uint64_t)v14);
    v63(v24, (char *)v19, v36);
    sub_100026A40((uint64_t)v24, 0LL);
  }

  sub_100026A4C((uint64_t)v24);
  if (v57)
  {
    sub_100026A38(v64);
    uint64_t v58 = &qword_1000505B8;
    uint64_t v59 = (uint64_t)v24;
  }

  else
  {
    Swift::String v115 = (void (*)(uint64_t, uint64_t, uint64_t))v63;
    v63(v126, v24, v36);
    uint64_t v67 = (uint64_t)v120;
    uint64_t v68 = URL.appendingPathComponent(_:)(*(void *)(v65 + 8), *(void *)(v65 + 16));
    uint64_t v69 = URL.pathExtension.getter(v68);
    uint64_t v70 = (uint64_t)v125;
    URL.appendingPathExtension(_:)(v69, v71);
    sub_100026ADC();
    sub_100026A38(v67);
    strcpy((char *)&v130, "metadata.plist");
    HIBYTE(v130) = -18;
    uint64_t v73 = v122;
    uint64_t v72 = v123;
    uint64_t v74 = v124;
    (*(void (**)(uint64_t, void, uint64_t))(v123 + 104))( v122,  enum case for URL.DirectoryHint.inferFromPath(_:),  v124);
    unint64_t v75 = sub_100025D44();
    uint64_t v76 = v121;
    URL.appending<A>(path:directoryHint:)(&v130, v73, &type metadata for String, v75);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v73, v74);
    swift_bridgeObjectRelease(*((void *)&v130 + 1));
    uint64_t v77 = Data.init(contentsOf:options:)(v76, 0LL);
    uint64_t v79 = v78;
    uint64_t v80 = type metadata accessor for PropertyListDecoder(0LL);
    swift_allocObject(v80, *(unsigned int *)(v80 + 48), *(unsigned __int16 *)(v80 + 52));
    uint64_t v81 = PropertyListDecoder.init()();
    unint64_t v82 = sub_100025DC0();
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)( &v130,  &type metadata for JetpackMetadata,  v77,  v79,  &type metadata for JetpackMetadata,  v82);
    v56(v76, v36);
    swift_release(v81);
    sub_100026AD0();
    BOOL v114 = (void)v130 == 2LL;
    uint64_t v83 = v70;
    id v84 = [(id)objc_opt_self(NSFileManager) defaultManager];
    URL.path.getter(v84);
    uint64_t v86 = v85;
    NSString v87 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v86);
    *(void *)&__int128 v130 = 0LL;
    id v88 = [v84 attributesOfItemAtPath:v87 error:&v130];

    uint64_t v89 = (void *)v130;
    if (!v88)
    {
      id v110 = (id)v130;
      uint64_t v111 = _convertNSErrorToError(_:)(v89);

      swift_willThrow(v112);
      swift_errorRelease(v111);
      sub_100026A38(v70);
      sub_100026A38((uint64_t)v126);
      uint64_t v113 = (uint64_t)v128;
LABEL_28:
      sub_100026A38(v113);
      goto LABEL_11;
    }

    type metadata accessor for FileAttributeKey(0LL);
    uint64_t v91 = v90;
    unint64_t v92 = sub_100025D80();
    uint64_t v93 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v88, v91, (char *)&type metadata for Any + 8, v92);
    id v94 = v89;

    uint64_t v95 = NSFileModificationDate;
    sub_100027630((uint64_t)v95, v93, &v130);

    swift_bridgeObjectRelease(v93);
    if (v131)
    {
      uint64_t v96 = v119;
      uint64_t v97 = v118;
      int v98 = swift_dynamicCast(v119, &v130, (char *)&type metadata for Any + 8, v118, 6LL);
      sub_100007438(v96, v98 ^ 1u, 1LL, v97);
      int v99 = sub_10000748C(v96, 1LL, v97);
      uint64_t v100 = (uint64_t)v128;
      if (v99 != 1)
      {
        BOOL v101 = v114;
        uint64_t v102 = v117;
        uint64_t v103 = (uint64_t)v128;
        uint64_t v104 = v116;
        uint64_t v105 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v117 + 32))(v116, v96, v97);
        double v106 = Date.timeIntervalSinceNow.getter(v105);
        (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v104, v97);
        sub_100026A38((uint64_t)v126);
        sub_100026A38(v103);
        if (*(double *)v65 > -v106)
        {
          uint64_t v107 = sub_100006674(&qword_100051088);
          uint64_t v108 = *(int *)(v107 + 48);
          uint64_t v109 = v129;
          v115(v129, v83, v36);
          *(_BYTE *)(v109 + v108) = v101;
          uint64_t v61 = v109;
          uint64_t v62 = 0LL;
          uint64_t v60 = v107;
          goto LABEL_12;
        }

        uint64_t v113 = v83;
        goto LABEL_28;
      }
    }

    else
    {
      sub_1000074D0((uint64_t)&v130, (uint64_t *)&unk_1000509C0);
      uint64_t v96 = v119;
      sub_100007438(v119, 1LL, 1LL, v118);
      uint64_t v100 = (uint64_t)v128;
    }

    sub_100026A38(v70);
    sub_100026A38((uint64_t)v126);
    sub_100026A38(v100);
    uint64_t v58 = &qword_100051080;
    uint64_t v59 = v96;
  }

LABEL_10:
  sub_1000074D0(v59, v58);
LABEL_11:
  uint64_t v60 = sub_100006674(&qword_100051088);
  uint64_t v61 = v129;
  uint64_t v62 = 1LL;
LABEL_12:
  sub_100007438(v61, v62, 1LL, v60);
  sub_100026A74();
}

    __break(1u);
    goto LABEL_11;
  }

uint64_t type metadata accessor for JSSourceInfo(uint64_t a1)
{
  uint64_t result = qword_100051100;
  if (!qword_100051100) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSSourceInfo);
  }
  return result;
}

uint64_t sub_100025CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSSourceInfo(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025D08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceInfo(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_100025D44()
{
  unint64_t result = qword_100051090;
  if (!qword_100051090)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100051090);
  }

  return result;
}

unint64_t sub_100025D80()
{
  unint64_t result = qword_100050240;
  if (!qword_100050240)
  {
    type metadata accessor for FileAttributeKey(255LL);
    unint64_t result = swift_getWitnessTable(&unk_10003B988, v1);
    atomic_store(result, (unint64_t *)&qword_100050240);
  }

  return result;
}

unint64_t sub_100025DC0()
{
  unint64_t result = qword_100051098;
  if (!qword_100051098)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003BEAC, &type metadata for JetpackMetadata);
    atomic_store(result, (unint64_t *)&qword_100051098);
  }

  return result;
}

uint64_t sub_100025DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSSourceInfo(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for JetpackKind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFF)
  {
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

    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for JetpackKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(__chkstk_darwin(v3, v4) = 1;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100025F14 + 4 * byte_10003C8D5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100025F48 + 4 * byte_10003C8D0[v4]))();
}

uint64_t sub_100025F48(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100025F50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100025F58LL);
  }
  return result;
}

uint64_t sub_100025F64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100025F6CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100025F70(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100025F78(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100025F84(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for JetpackKind()
{
  return &type metadata for JetpackKind;
}

uint64_t *sub_100025FA0(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v13);
  }

  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a2[2];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL(0LL);
    swift_bridgeObjectRetain(v7);
    if (sub_10000748C((uint64_t)v10, 1LL, v11))
    {
      uint64_t v12 = sub_100006674(&qword_1000505B8);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_100007438((uint64_t)v9, 0LL, 1LL, v11);
    }

    uint64_t v14 = a3[7];
    uint64_t v15 = a3[8];
    uint64_t v16 = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v4 + v14) = v16;
    uint64_t v17 = (char *)v4 + v15;
    uint64_t v18 = (char *)a2 + v15;
    swift_bridgeObjectRetain(v16);
    if (sub_10000748C((uint64_t)v18, 1LL, v11))
    {
      uint64_t v19 = sub_100006674(&qword_1000505B8);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v17, v18, v11);
      sub_100007438((uint64_t)v17, 0LL, 1LL, v11);
    }
  }

  return v4;
}

uint64_t sub_10002611C(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[7]));
  uint64_t v6 = a1 + a2[8];
  uint64_t result = sub_10000748C(v6, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v6, v5);
  }
  return result;
}

uint64_t sub_1000261D0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRetain(v6);
  if (sub_10000748C((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_100006674(&qword_1000505B8);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
    sub_100007438((uint64_t)v8, 0LL, 1LL, v10);
  }

  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = *(void *)(a2 + v12);
  *(void *)(a1 + v12) = v14;
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = (const void *)(a2 + v13);
  swift_bridgeObjectRetain(v14);
  if (sub_10000748C((uint64_t)v16, 1LL, v10))
  {
    uint64_t v17 = sub_100006674(&qword_1000505B8);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v15, v16, v10);
    sub_100007438((uint64_t)v15, 0LL, 1LL, v10);
  }

  return a1;
}

void *sub_100026320(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  int v12 = sub_10000748C((uint64_t)v9, 1LL, v11);
  int v13 = sub_10000748C((uint64_t)v10, 1LL, v11);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_100007438((uint64_t)v9, 0LL, 1LL, v11);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    uint64_t v15 = sub_100006674(&qword_1000505B8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = a3[7];
  uint64_t v17 = *(void *)((char *)a2 + v16);
  uint64_t v18 = *(void *)((char *)a1 + v16);
  *(void *)((char *)a1 + vswift_weakDestroy(v0 + 16) = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  LODWORD(v18) = sub_10000748C((uint64_t)a1 + v19, 1LL, v11);
  int v22 = sub_10000748C((uint64_t)v21, 1LL, v11);
  if (!(_DWORD)v18)
  {
    uint64_t v23 = *(void *)(v11 - 8);
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v11);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v11);
    goto LABEL_12;
  }

  if (v22)
  {
LABEL_12:
    uint64_t v24 = sub_100006674(&qword_1000505B8);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v20, v21, v11);
  sub_100007438((uint64_t)v20, 0LL, 1LL, v11);
  return a1;
}

uint64_t sub_100026520(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for URL(0LL);
  if (sub_10000748C((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_100006674(&qword_1000505B8);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    sub_100007438((uint64_t)v7, 0LL, 1LL, v9);
  }

  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  int v12 = (void *)(a1 + v11);
  int v13 = (const void *)(a2 + v11);
  if (sub_10000748C((uint64_t)v13, 1LL, v9))
  {
    uint64_t v14 = sub_100006674(&qword_1000505B8);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v12, v13, v9);
    sub_100007438((uint64_t)v12, 0LL, 1LL, v9);
  }

  return a1;
}

void *sub_10002665C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  int v12 = sub_10000748C((uint64_t)v9, 1LL, v11);
  int v13 = sub_10000748C((uint64_t)v10, 1LL, v11);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
      sub_100007438((uint64_t)v9, 0LL, 1LL, v11);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    uint64_t v15 = sub_100006674(&qword_1000505B8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = a3[7];
  uint64_t v17 = *(void *)((char *)a1 + v16);
  *(void *)((char *)a1 + vswift_weakDestroy(v0 + 16) = *(void *)((char *)a2 + v16);
  swift_bridgeObjectRelease(v17);
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  int v21 = sub_10000748C((uint64_t)a1 + v18, 1LL, v11);
  int v22 = sub_10000748C((uint64_t)v20, 1LL, v11);
  if (!v21)
  {
    uint64_t v23 = *(void *)(v11 - 8);
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v19, v20, v11);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v11);
    goto LABEL_12;
  }

  if (v22)
  {
LABEL_12:
    uint64_t v24 = sub_100006674(&qword_1000505B8);
    memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v19, v20, v11);
  sub_100007438((uint64_t)v19, 0LL, 1LL, v11);
  return a1;
}

uint64_t sub_100026844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026850);
}

uint64_t sub_100026850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(__chkstk_darwin(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_100006674(&qword_1000505B8);
    return sub_10000748C(a1 + *(int *)(a3 + 24), a2, v8);
  }

uint64_t sub_1000268C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000268D4);
}

uint64_t sub_1000268D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + swift_weakDestroy(v0 + 16) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_100006674(&qword_1000505B8);
    return sub_100007438(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }

  return result;
}

void sub_100026944(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[1] = &unk_10003C900;
  sub_1000245B4(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v5 = *(void *)(v2 - 8) + 64LL;
    uint64_t v6 = (char *)&value witness table for Builtin.BridgeObject + 64;
    uint64_t v7 = v5;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
  }

unint64_t sub_1000269D8()
{
  unint64_t result = qword_100051148;
  if (!qword_100051148)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C990, &type metadata for JetpackKind);
    atomic_store(result, (unint64_t *)&qword_100051148);
  }

  return result;
}

uint64_t sub_100026A14@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return swift_dynamicCast(v2 - 184, v2 - 128, a2 + 8, a1, 6LL);
}

void sub_100026A28()
{
}

uint64_t sub_100026A38(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100026A40(uint64_t a1, uint64_t a2)
{
  return sub_100007438(a1, a2, 1LL, v2);
}

uint64_t sub_100026A4C(uint64_t a1)
{
  return sub_10000748C(a1, 1LL, v1);
}

uint64_t sub_100026A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AnyHashable.init<A>(_:)(v3 - 184, a2, a3);
}

  ;
}

  ;
}

uint64_t sub_100026AA0()
{
  return sub_100007438(v1, 0LL, 1LL, v0);
}

uint64_t sub_100026AB4()
{
  return sub_100009DC8(v0 - 168);
}

uint64_t sub_100026ABC@<X0>(uint64_t a1@<X8>)
{
  return sub_100007438(v2 + a1, 1LL, 1LL, v1);
}

uint64_t sub_100026AD0()
{
  return sub_100023DA8(v1, v0);
}

uint64_t sub_100026ADC()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100026AE4()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 216));
}

  ;
}

uint64_t sub_100026AF8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v55 = a3;
  uint64_t v56 = a4;
  uint64_t v53 = a2;
  v51[1] = a1;
  uint64_t v6 = sub_10001ACA8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v52 = v9;
  uint64_t v54 = (uint64_t)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v51[0] = type metadata accessor for JSSourceUrlParser(0LL);
  __chkstk_darwin(v51[0], v10);
  int v12 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v18 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v19 = swift_allocObject( v17,  ((*(unsigned __int8 *)(v18 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))
        + 3LL * *(void *)(v18 + 72),
          *(unsigned __int8 *)(v18 + 80) | 7LL);
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v58 = type metadata accessor for JSSourceLoader();
  v57[0] = v5;
  uint64_t v20 = swift_retain(v5);
  id v21 = (id)AMSLogKey(v20);
  if (v21)
  {
    int v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v25 = v24;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    uint64_t v26 = v58;
    uint64_t v27 = sub_100007060(v57, v58);
    uint64_t DynamicType = swift_getDynamicType(v27, v26, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    uint64_t v60 = DynamicType;
    sub_1000271C0();
    sub_100008DB4();
    v29._uint64_t countAndFlagsBits = 5972026LL;
    v29._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v29);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v60 = v23;
    uint64_t v61 = v25;
    sub_1000271C0();
    sub_100008DB4();
    uint64_t v30 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    uint64_t v31 = v58;
    uint64_t v32 = sub_100007060(v57, v58);
    uint64_t v33 = swift_getDynamicType(v32, v31, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v33);
    uint64_t v60 = v33;
    sub_1000271C0();
    sub_100008DB4();
    uint64_t v30 = 58LL;
  }

  unint64_t v34 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v30);
  LogMessage.init(stringInterpolation:)(v16);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v57);
  LogMessage.init(stringLiteral:)(0xD000000000000014LL, 0x800000010003F1D0LL);
  uint64_t v58 = type metadata accessor for URL(0LL);
  unint64_t v35 = sub_100007678(v57);
  sub_1000271D4((uint64_t)v35);
  static LogMessage.safe(_:)(v57);
  sub_100008D04((uint64_t)v57);
  sub_10002C300(v19);
  swift_bridgeObjectRelease(v19);
  sub_1000271D4((uint64_t)&v12[*(int *)(v51[0] + 20LL)]);
  sub_1000271C8((uint64_t)v12);
  uint64_t v36 = sub_1000299C8();
  sub_100027060((uint64_t)v12);
  uint64_t v37 = v54;
  sub_1000271C8(v54);
  uint64_t v38 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v39 = (v38 + 16) & ~v38;
  unint64_t v40 = (v52 + v39 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v41 = (v40 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v42 = swift_allocObject(&unk_10004A678, v41 + 8, v38 | 7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v42 + v39, v37, v6);
  uint64_t v44 = v55;
  uint64_t v43 = v56;
  *(void *)(v42 + v40) = v55;
  *(void *)(v42 + v41) = v43;
  uint64_t v58 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v59 = &protocol witness table for SyncTaskScheduler;
  sub_100007678(v57);
  id v45 = v44;
  uint64_t v46 = swift_retain(v43);
  SyncTaskScheduler.init()(v46);
  uint64_t v47 = sub_100006674(&qword_1000506C0);
  unint64_t v48 = sub_10002717C();
  uint64_t v49 = Promise.flatMap<A>(on:_:)(v57, sub_100027124, v42, v47, v48);
  swift_release(v36);
  swift_release(v42);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v57);
  return v49;
}

void sub_100026EF8(uint64_t a1)
{
  __asm { BR              X10 }

uint64_t sub_100026F40()
{
  uint64_t v8 = type metadata accessor for JetpackLoader();
  uint64_t v9 = &off_1000496D0;
  v7[0] = swift_allocObject(v8, 16LL, 7LL);
  sub_100007060(v7, v8);
  uint64_t v4 = type metadata accessor for JSSourceFile(0LL);
  uint64_t v5 = sub_10000CFC0((void *)(v3 + *(int *)(v4 + 20)), v2, v1, v0);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v7);
  return v5;
}

uint64_t type metadata accessor for JSSourceLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService14JSSourceLoader);
}

uint64_t sub_100027060(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceUrlParser(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10002709C()
{
  uint64_t v1 = sub_10001ACA8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release(*(void *)(v0 + v7));
  return swift_deallocObject(v0, v7 + 8, v5);
}

void sub_100027124(uint64_t a1)
{
}

unint64_t sub_10002717C()
{
  unint64_t result = qword_1000511F0;
  if (!qword_1000511F0)
  {
    uint64_t v1 = sub_10000D01C(&qword_1000506C0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000511F0);
  }

  return result;
}

uint64_t sub_1000271C0()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 112);
}

uint64_t sub_1000271C8(uint64_t a1)
{
  return v1(a1, v2, v3);
}

uint64_t sub_1000271D4(uint64_t a1)
{
  return v1(a1, v3, v2);
}

id sub_1000271E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = Bag.amsBag.getter();
  id v4 = [objc_allocWithZone(AMSURLRequestEncoder) initWithBag:v3];
  swift_unknownObjectRelease(v3);
  [v4 setClientInfo:a2];
  return v4;
}

id sub_10002726C(uint64_t a1, uint64_t a2)
{
  id v3 = [(id)objc_opt_self(NSURLCache) sharedURLCache];
  [v3 setMemoryCapacity:0];

  id v4 = (void *)objc_opt_self(&OBJC_CLASS___NSURLSessionConfiguration);
  uint64_t v5 = Bag.amsBag.getter();
  id v6 = objc_msgSend(v4, "ams_configurationWithProcessInfo:bag:", a2, v5);
  swift_unknownObjectRelease(v5);
  sub_10002732C();
  return sub_100027368(v6, 0LL, 0LL);
}

unint64_t sub_10002732C()
{
  unint64_t result = qword_1000503C0;
  if (!qword_1000503C0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___AMSURLSession);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000503C0);
  }

  return result;
}

id sub_100027368(void *a1, uint64_t a2, void *a3)
{
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)) initWithConfiguration:a1 delegate:a2 delegateQueue:a3];

  swift_unknownObjectRelease(a2);
  return v7;
}

uint64_t destroy for JSSourcePackage(void *a1)
{
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t initializeWithCopy for JSSourcePackage(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *assignWithCopy for JSSourcePackage(void *a1, void *a2)
{
  uint64_t v4 = a2[5];
  uint64_t v5 = a1[5];
  a1[5] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  return a1;
}

__n128 initializeWithTake for JSSourcePackage(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for JSSourcePackage(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSSourcePackage(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for JSSourcePackage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JSSourcePackage()
{
  return &type metadata for JSSourcePackage;
}

void sub_10002756C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    unint64_t v4 = sub_1000098A8(a1, a2);
    if ((v5 & 1) != 0) {
      swift_unknownObjectRetain(*(void *)(*(void *)(a3 + 56) + 8 * v4));
    }
  }

  sub_10000870C();
}

void sub_1000275A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    unint64_t v4 = sub_1000098A8(a1, a2);
    if ((v5 & 1) != 0) {
      id v6 = *(id *)(*(void *)(a3 + 56) + 8 * v4);
    }
  }

  sub_10000870C();
}

void sub_1000275E8(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100009878(a1), (v6 & 1) != 0))
  {
    sub_1000298B8(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }

  else
  {
    *a3 = 0u;
    a3[1] = 0u;
    sub_10000870C();
  }

void sub_100027630(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100009908(a1), (v6 & 1) != 0))
  {
    sub_1000298B8(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }

  else
  {
    *a3 = 0u;
    a3[1] = 0u;
    sub_10000870C();
  }

uint64_t sub_100027678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1000098A8(a1, a2), (v7 & 1) != 0))
  {
    unint64_t v8 = v6;
    uint64_t v9 = *(void *)(a3 + 56);
    uint64_t v10 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))( a4,  v9 + *(void *)(*(void *)(v10 - 8) + 72LL) * v8,  v10);
    uint64_t v11 = a4;
    uint64_t v12 = 0LL;
    uint64_t v13 = v10;
  }

  else
  {
    uint64_t v13 = type metadata accessor for URL(0LL);
    uint64_t v11 = a4;
    uint64_t v12 = 1LL;
  }

  return sub_100007438(v11, v12, 1LL, v13);
}

NSString sub_10002770C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000511F8 = (uint64_t)result;
  return result;
}

BOOL sub_100027748(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100027758(uint64_t a1, char a2)
{
}

Swift::Int sub_100027778(char a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_1000277BC()
{
  return sub_100027778(*v0);
}

void sub_1000277C4(uint64_t a1)
{
}

uint64_t sub_1000277CC()
{
  uint64_t v1 = v0;
  uint64_t v31 = sub_10000F6B0();
  uint64_t v2 = *(void *)(v31 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v31, v4);
  unint64_t v5 = (char *)&v32[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100006674(&qword_100051300);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v32[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Bag(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v32[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000298C0( (uint64_t)v15,  v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_bag,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  if (qword_100050190 != -1) {
    swift_once(&qword_100050190, sub_10002770C);
  }
  Bag.subscript.getter(qword_1000511F8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t v16 = Bag.Value.promise()(v6);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  uint64_t v17 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v33 = v17;
  unint64_t v34 = &protocol witness table for SyncTaskScheduler;
  sub_100007678(v32);
  uint64_t v18 = swift_retain(v1);
  SyncTaskScheduler.init()(v18);
  uint64_t v19 = sub_100006674(&qword_100051308);
  sub_1000294E4(&qword_100051310, &qword_100051308);
  uint64_t v21 = Promise.flatMap<A>(on:_:)(v32, sub_100029420, v1, v19, v20);
  swift_release(v16);
  swift_release(v1);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v32);
  sub_1000298C0( (uint64_t)&v32[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_url,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  uint64_t v22 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  unint64_t v24 = (v3 + v23 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v25 = swift_allocObject(&unk_10004A720, v24 + 8, v22 | 7);
  sub_1000298C0(v25 + v23, (uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
  *(void *)(v25 + v24) = v1;
  uint64_t v33 = v17;
  unint64_t v34 = &protocol witness table for SyncTaskScheduler;
  sub_100007678(v32);
  uint64_t v26 = swift_retain(v1);
  SyncTaskScheduler.init()(v26);
  uint64_t v27 = sub_100006674(&qword_100051318);
  sub_1000294E4(&qword_100051320, &qword_100051318);
  uint64_t v29 = Promise.flatMap<A>(on:_:)(v32, sub_100029498, v25, v27, v28);
  swift_release(v21);
  swift_release(v25);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v32);
  return v29;
}

uint64_t sub_100027AAC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_100051330);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for JSSourceInfo(0LL);
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8, v9);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  uint64_t v15 = (char *)&v52 - v14;
  uint64_t v16 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (*a1 && (uint64_t v20 = sub_10000600C(*a1)) != 0LL)
  {
    uint64_t v21 = v20;
    uint64_t v22 = v20[2];
    if (v22)
    {
      swift_bridgeObjectRetain(v20);
      uint64_t v23 = 0LL;
      unint64_t v24 = _swiftEmptyArrayStorage;
      do
      {
        unint64_t v25 = swift_bridgeObjectRetain(v21[v23 + 4]);
        sub_100024FA4(v25, (uint64_t)v7);
        if (sub_10000748C((uint64_t)v7, 1LL, v8) == 1)
        {
          sub_100029634((uint64_t)v7, &qword_100051330);
        }

        else
        {
          sub_100025DFC((uint64_t)v7, (uint64_t)v15);
          sub_100025DFC((uint64_t)v15, (uint64_t)v12);
          if ((swift_isUniquelyReferenced_nonNull_native(v24) & 1) == 0) {
            unint64_t v24 = (void *)sub_10002965C(0LL, v24[2] + 1LL, 1, (uint64_t)v24);
          }
          unint64_t v27 = v24[2];
          unint64_t v26 = v24[3];
          if (v27 >= v26 >> 1) {
            unint64_t v24 = (void *)sub_10002965C(v26 > 1, v27 + 1, 1, (uint64_t)v24);
          }
          v24[2] = v27 + 1;
          sub_100025DFC( (uint64_t)v12,  (uint64_t)v24 + ((*(unsigned __int8 *)(v53 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))
          + *(void *)(v53 + 72) * v27);
        }

        ++v23;
      }

      while (v22 != v23);
      swift_bridgeObjectRelease_n(v21, 2LL);
    }

    else
    {
      swift_bridgeObjectRelease(v20);
      unint64_t v24 = _swiftEmptyArrayStorage;
    }

    sub_100006674(&qword_100051308);
    v56[0] = v24;
    return Promise.__allocating_init(value:)(v56);
  }

  else
  {
    uint64_t v28 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v29 = type metadata accessor for LogMessage(0LL);
    uint64_t v30 = swift_allocObject( v28,  ((*(unsigned __int8 *)(*(void *)(v29 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v29 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v29 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v29 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v30 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
    uint64_t v57 = type metadata accessor for JSSourceUrlOverrider(0LL);
    v56[0] = a2;
    uint64_t v31 = swift_retain(a2);
    id v32 = (id)AMSLogKey(v31);
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
      uint64_t v36 = v35;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v37._uint64_t countAndFlagsBits = 0LL;
      v37._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v37);
      uint64_t v38 = v57;
      uint64_t v39 = sub_100007060(v56, v57);
      uint64_t DynamicType = swift_getDynamicType(v39, v38, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
      v54[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v54);
      sub_100029634((uint64_t)v54, (uint64_t *)&unk_1000509C0);
      v41._uint64_t countAndFlagsBits = 5972026LL;
      v41._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v41);
      uint64_t MetatypeMetadata = &type metadata for String;
      v54[0] = v34;
      v54[1] = v36;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v54);
      sub_100029634((uint64_t)v54, (uint64_t *)&unk_1000509C0);
      uint64_t v42 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v43._uint64_t countAndFlagsBits = 0LL;
      v43._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v43);
      uint64_t v44 = v57;
      id v45 = sub_100007060(v56, v57);
      uint64_t v46 = swift_getDynamicType(v45, v44, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v46);
      v54[0] = v46;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v54);
      sub_100029634((uint64_t)v54, (uint64_t *)&unk_1000509C0);
      uint64_t v42 = 58LL;
    }

    unint64_t v47 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v42);
    LogMessage.init(stringInterpolation:)(v19);
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v56);
    LogMessage.init(stringLiteral:)(0xD00000000000002BLL, 0x800000010003F2F0LL);
    sub_10002C320(v30);
    swift_bridgeObjectRelease(v30);
    sub_100006674(&qword_100051308);
    unint64_t v48 = sub_1000295F8();
    uint64_t v49 = swift_allocError(&type metadata for JSSourceUrlOverrider.OverrideURLError, v48, 0LL, 0LL);
    *uint64_t v50 = 0;
    return Promise.__allocating_init(error:)(v49);
  }

uint64_t sub_100027F34(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v245 = a3;
  uint64_t v4 = sub_100006674(&qword_100051328);
  __chkstk_darwin(v4, v5);
  uint64_t v232 = (uint64_t)&v226 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v242 = sub_100006674(&qword_100051088);
  uint64_t v8 = __chkstk_darwin(v242, v7);
  uint64_t v230 = (char *)&v226 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v231 = (char *)&v226 - v12;
  __chkstk_darwin(v11, v13);
  v238 = (char *)&v226 - v14;
  uint64_t v15 = sub_100006674(&qword_1000505B8);
  uint64_t v17 = __chkstk_darwin(v15, v16);
  uint64_t v226 = (uint64_t)&v226 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v17, v19);
  uint64_t v229 = (uint64_t)&v226 - v21;
  uint64_t v23 = __chkstk_darwin(v20, v22);
  uint64_t v237 = (uint64_t)&v226 - v24;
  __chkstk_darwin(v23, v25);
  uint64_t v239 = (uint64_t)&v226 - v26;
  uint64_t v240 = type metadata accessor for URL(0LL);
  uint64_t v243 = *(void *)(v240 - 8);
  uint64_t v28 = __chkstk_darwin(v240, v27);
  v227 = (char *)&v226 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v31 = __chkstk_darwin(v28, v30);
  v228 = (char *)&v226 - v32;
  uint64_t v34 = __chkstk_darwin(v31, v33);
  v233 = (char *)&v226 - v35;
  __chkstk_darwin(v34, v36);
  v241 = (char *)&v226 - v37;
  uint64_t v38 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v38, v39);
  v244 = (char *)&v226 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v41 = sub_100006674(&qword_100051330);
  __chkstk_darwin(v41, v42);
  uint64_t v44 = (char *)&v226 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v45 = (int *)type metadata accessor for JSSourceInfo(0LL);
  uint64_t v46 = *((void *)v45 - 1);
  uint64_t v48 = __chkstk_darwin(v45, v47);
  uint64_t v50 = (char *)&v226 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v52 = __chkstk_darwin(v48, v51);
  uint64_t v54 = (char *)&v226 - v53;
  uint64_t v55 = *a1;
  uint64_t v57 = URL.absoluteString.getter(v52, v56);
  unint64_t v59 = v58;
  uint64_t v250 = *(void *)(v55 + 16);
  if (v250)
  {
    v235 = v44;
    v236 = v54;
    uint64_t v60 = v55 + ((*(unsigned __int8 *)(v46 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80));
    uint64_t v61 = HIBYTE(v58) & 0xF;
    if ((v58 & 0x2000000000000000LL) == 0) {
      uint64_t v61 = v57;
    }
    uint64_t v252 = (v61 << 16) | 7;
    uint64_t v253 = v57;
    uint64_t v62 = *(void *)(v46 + 72);
    uint64_t v234 = v55;
    swift_bridgeObjectRetain(v55);
    uint64_t v63 = 0LL;
    v248 = v50;
    v249 = v45;
    uint64_t v246 = v62;
    uint64_t v247 = v60;
    while (1)
    {
      sub_100025CC4(v60 + v62 * v63, (uint64_t)v50);
      uint64_t v64 = v45[7];
      uint64_t v65 = *(void *)&v50[v64];
      uint64_t v66 = *(void *)(v65 + 16);
      if (v66) {
        break;
      }
LABEL_14:
      ++v63;
      sub_100025D08((uint64_t)v50);
      if (v63 == v250)
      {
        swift_bridgeObjectRelease(v234);
        uint64_t v76 = 1LL;
        uint64_t v54 = v236;
        uint64_t v44 = v235;
        goto LABEL_18;
      }
    }

    swift_bridgeObjectRetain_n(*(void *)&v50[v64], 2LL);
    uint64_t v251 = v65;
    uint64_t v67 = (uint64_t *)(v65 + 40);
    uint64_t v68 = v253;
    while (1)
    {
      uint64_t v69 = *(v67 - 1);
      uint64_t v70 = *v67;
      objc_allocWithZone(&OBJC_CLASS___NSRegularExpression);
      swift_bridgeObjectRetain_n(v70, 2LL);
      id v71 = sub_100029520(v69, v70, 0LL);
      if (v71)
      {
        Swift::Int v72 = (v59 & 0x1000000000000000LL) != 0
            ? String.UTF16View._foreignCount()()
            : String.UTF16View._nativeGetOffset(for:)(v252, v68, v59);
        Swift::Int v73 = v72;
        NSString v74 = String._bridgeToObjectiveC()();
        id v75 = objc_msgSend(v71, "firstMatchInString:options:range:", v74, 0, 0, v73);

        uint64_t v68 = v253;
        if (v75) {
          break;
        }
      }

      v67 += 2;
      swift_bridgeObjectRelease(v70);
      if (!--v66)
      {
        swift_bridgeObjectRelease_n(v251, 2LL);
        uint64_t v50 = v248;
        id v45 = v249;
        uint64_t v62 = v246;
        uint64_t v60 = v247;
        goto LABEL_14;
      }
    }

    swift_bridgeObjectRelease(v234);
    swift_bridgeObjectRelease_n(v251, 2LL);
    swift_bridgeObjectRelease(v70);

    uint64_t v44 = v235;
    sub_100025DFC((uint64_t)v248, (uint64_t)v235);
    uint64_t v76 = 0LL;
    uint64_t v54 = v236;
    id v45 = v249;
  }

  else
  {
    uint64_t v76 = 1LL;
  }

uint64_t sub_100029304()
{
  uint64_t v1 = type metadata accessor for Bag(0LL);
  sub_100024828(v1);
  uint64_t v2 = sub_10000F6B0();
  sub_100024828(v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100029358()
{
  return type metadata accessor for JSSourceUrlOverrider(0LL);
}

uint64_t type metadata accessor for JSSourceUrlOverrider(uint64_t a1)
{
  uint64_t result = qword_100051238;
  if (!qword_100051238) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSSourceUrlOverrider);
  }
  return result;
}

uint64_t sub_100029398(uint64_t a1)
{
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for URL(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v5, a1 + 80);
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_100029420(uint64_t *a1)
{
  return sub_100027AAC(a1, v1);
}

uint64_t sub_100029428()
{
  uint64_t v1 = sub_10000F6B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100029498(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_10000F6B0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100027F34(a1, v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

void sub_1000294E4(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_10000D01C(a2);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v3), a1);
  }

  sub_10000870C();
}

id sub_100029520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v12 = 0LL;
  id v7 = [v3 initWithPattern:v6 options:a3 error:&v12];

  id v8 = v12;
  if (v7)
  {
    id v9 = v12;
  }

  else
  {
    id v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }

  return v7;
}

unint64_t sub_1000295F8()
{
  unint64_t result = qword_100051338;
  if (!qword_100051338)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CACC, &type metadata for JSSourceUrlOverrider.OverrideURLError);
    atomic_store(result, (unint64_t *)&qword_100051338);
  }

  return result;
}

void sub_100029634(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_100006674(a2);
  sub_100024828(v2);
  sub_10000870C();
}

size_t sub_10002965C(size_t result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100006674(&qword_100051340);
  uint64_t v11 = *(void *)(type metadata accessor for JSSourceInfo(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  unint64_t result = j__malloc_size(v15);
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
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  uint64_t v17 = type metadata accessor for JSSourceInfo(0LL);
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL);
  uint64_t v19 = (v18 + 32) & ~v18;
  if ((v5 & 1) != 0)
  {
    sub_10000654C(a4 + v19, v8, (unint64_t)v15 + v19);
    *(void *)(a4 + swift_weakDestroy(v0 + 16) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy((char *)v15 + v19, a4 + v19, v8, v17);
  }

  swift_bridgeObjectRelease(a4);
  return (size_t)v15;
}

uint64_t storeEnumTagSinglePayload for JSSourceUrlOverrider.OverrideURLError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(__chkstk_darwin(v3, v4) = 1;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_1000297F8 + 4 * byte_10003CA25[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10002982C + 4 * asc_10003CA20[v4]))();
}

uint64_t sub_10002982C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100029834(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10002983CLL);
  }
  return result;
}

uint64_t sub_100029848(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100029850LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100029854(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002985C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JSSourceUrlOverrider.OverrideURLError()
{
  return &type metadata for JSSourceUrlOverrider.OverrideURLError;
}

unint64_t sub_10002987C()
{
  unint64_t result = qword_100051348;
  if (!qword_100051348)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CAA4, &type metadata for JSSourceUrlOverrider.OverrideURLError);
    atomic_store(result, (unint64_t *)&qword_100051348);
  }

  return result;
}

uint64_t sub_1000298B8(uint64_t a1, uint64_t a2)
{
  return sub_100006638(a1, a2);
}

uint64_t sub_1000298C0@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_1000298C8()
{
  return sub_1000298E0((SEL *)&selRef_jsSourceOverrides);
}

uint64_t sub_1000298D4()
{
  return sub_1000298E0((SEL *)&selRef_sourceOverrides);
}

uint64_t sub_1000298E0(SEL *a1)
{
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___AMSDefaults);
  uint64_t result = sub_100029960(v2, a1);
  if (!result)
  {
    uint64_t v4 = type metadata accessor for URL(0LL);
    return Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  v4,  &protocol witness table for String);
  }

  return result;
}

uint64_t type metadata accessor for JSSourceUrlOverrides()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrides);
}

uint64_t sub_100029960(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v3,  &type metadata for String,  v4,  &protocol witness table for String);

  return v5;
}

uint64_t sub_1000299C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10002BD44();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v41 + 64);
  __chkstk_darwin(v2, v4);
  uint64_t v42 = (uint64_t)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v10 = type metadata accessor for LogMessage(0LL);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v10 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v44 = v2;
  sub_10002BD58();
  sub_10002B308(v1, v12, type metadata accessor for JSSourceUrlParser);
  id v14 = (id)AMSLogKey(v13);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v18 = v17;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    uint64_t v19 = v44;
    uint64_t v20 = sub_100007060(v43, v44);
    uint64_t DynamicType = swift_getDynamicType(v20, v19, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v46[0] = DynamicType;
    sub_1000271C0();
    sub_10002BD60();
    v22._uint64_t countAndFlagsBits = 5972026LL;
    v22._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    uint64_t MetatypeMetadata = &type metadata for String;
    v46[0] = v16;
    v46[1] = v18;
    sub_1000271C0();
    sub_10002BD60();
    uint64_t v23 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    uint64_t v24 = v44;
    uint64_t v25 = sub_100007060(v43, v44);
    uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v26);
    v46[0] = v26;
    sub_1000271C0();
    sub_100029634((uint64_t)v46, (uint64_t *)&unk_1000509C0);
    uint64_t v23 = 58LL;
  }

  unint64_t v27 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v23);
  LogMessage.init(stringInterpolation:)(v8);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v43);
  LogMessage.init(stringLiteral:)(0x20676E6973726150LL, 0xEC0000003A6C7275LL);
  uint64_t v28 = sub_10000F6B0();
  uint64_t v44 = v28;
  sub_10002BD58();
  (*(void (**)(void))(*(void *)(v28 - 8) + 16LL))();
  static LogMessage.safe(_:)(v43);
  sub_100029634((uint64_t)v43, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v11);
  swift_bridgeObjectRelease(v11);
  uint64_t v29 = sub_10002A078();
  uint64_t v30 = v42;
  sub_10002B308(v1, v42, type metadata accessor for JSSourceUrlParser);
  uint64_t v31 = *(unsigned __int8 *)(v41 + 80);
  uint64_t v32 = (v31 + 16) & ~v31;
  uint64_t v33 = swift_allocObject(&unk_10004A838, v32 + v3, v31 | 7);
  sub_10002B2DC(v30, v33 + v32, type metadata accessor for JSSourceUrlParser);
  uint64_t v34 = swift_allocObject(&unk_10004A860, 32LL, 7LL);
  *(void *)(v34 + swift_weakDestroy(v0 + 16) = sub_10002AD58;
  *(void *)(v34 + 24) = v33;
  uint64_t v44 = type metadata accessor for SyncTaskScheduler(0LL);
  id v45 = &protocol witness table for SyncTaskScheduler;
  sub_10002BD58();
  SyncTaskScheduler.init()(v35);
  uint64_t v36 = sub_100006674(&qword_1000513F0);
  unint64_t v37 = sub_10002B25C();
  uint64_t v38 = Promise.flatMap<A>(on:_:)(v43, sub_10002B254, v34, v36, v37);
  swift_release(v29);
  swift_release(v34);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v43);
  return v38;
}

uint64_t type metadata accessor for JSSourceUrlParser(uint64_t a1)
{
  uint64_t result = qword_100051478;
  if (!qword_100051478) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSSourceUrlParser);
  }
  return result;
}

void sub_100029DC0( uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, char *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v32 = a3;
  uint64_t v35 = a2;
  uint64_t v36 = sub_100006674(&qword_100051418);
  uint64_t v5 = __chkstk_darwin(v36, v4);
  uint64_t v7 = (uint64_t *)((char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (uint64_t *)((char *)&v31 - v9);
  sub_10002059C(v37, a1);
  uint64_t v11 = v37[0];
  int64_t v38 = v37[3];
  unint64_t v12 = v37[4];
  uint64_t v33 = v37[1];
  int64_t v34 = (unint64_t)(v37[2] + 64LL) >> 6;
  swift_bridgeObjectRetain(a1);
  if (!v12) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v13 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  unint64_t v14 = v13 | (v38 << 6);
  while (1)
  {
    uint64_t v19 = *(void *)(v11 + 56);
    uint64_t v20 = (uint64_t *)(*(void *)(v11 + 48) + 16 * v14);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = v19 + *(void *)(*(void *)(type metadata accessor for JSSourceFile(0LL) - 8) + 72LL) * v14;
    uint64_t v24 = v36;
    sub_10002B308(v23, (uint64_t)v10 + *(int *)(v36 + 48), type metadata accessor for JSSourceFile);
    *uint64_t v10 = v21;
    v10[1] = v22;
    sub_10002B6DC((uint64_t)v10, (uint64_t)v7);
    uint64_t v25 = *v7;
    uint64_t v26 = v7[1];
    unint64_t v27 = (char *)v7 + *(int *)(v24 + 48);
    swift_bridgeObjectRetain(v22);
    if ((v35(v25, v26, v27) & 1) != 0)
    {
      swift_release(v11);
      uint64_t v28 = v32;
      sub_10002B6DC((uint64_t)v7, v32);
      uint64_t v29 = v28;
      uint64_t v30 = 0LL;
      goto LABEL_24;
    }

    sub_100029634((uint64_t)v7, &qword_100051418);
    if (v12) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v15 = v38 + 1;
    if (__OFADD__(v38, 1LL)) {
      break;
    }
    if (v15 >= v34) {
      goto LABEL_23;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    int64_t v17 = v38 + 1;
    if (!v16)
    {
      int64_t v17 = v38 + 2;
      if (v38 + 2 >= v34) {
        goto LABEL_23;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v38 + 3;
        if (v38 + 3 >= v34) {
          goto LABEL_23;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v38 + 4;
          if (v38 + 4 >= v34) {
            goto LABEL_23;
          }
          unint64_t v16 = *(void *)(v33 + 8 * v17);
          if (!v16)
          {
            int64_t v17 = v38 + 5;
            if (v38 + 5 >= v34) {
              goto LABEL_23;
            }
            unint64_t v16 = *(void *)(v33 + 8 * v17);
            if (!v16)
            {
              int64_t v18 = v38 + 6;
              while (v18 < v34)
              {
                unint64_t v16 = *(void *)(v33 + 8 * v18++);
                if (v16)
                {
                  int64_t v17 = v18 - 1;
                  goto LABEL_18;
                }
              }

void sub_10002A064()
{
  qword_1000513E8 = (uint64_t)&_swiftEmptyDictionarySingleton;
}

uint64_t sub_10002A078()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Bag(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v33 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11, v12);
  unint64_t v14 = (char *)&v31 - v13;
  uint64_t v31 = v1 + *(int *)(type metadata accessor for JSSourceUrlParser(0LL) + 20);
  int64_t v15 = *(void (**)(char *))(v8 + 16);
  v15(v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, v2);
  uint64_t v16 = type metadata accessor for JSSourceUrlOverrider(0LL);
  uint64_t v17 = swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  int64_t v18 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v18(v17 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_url, v14, v7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))( v17 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20JSSourceUrlOverrider_bag,  v6,  v2);
  uint64_t v32 = sub_1000277CC();
  swift_release(v17);
  uint64_t v19 = sub_100006674(&qword_100051318);
  uint64_t v20 = Promise.__allocating_init()(v19);
  uint64_t v21 = swift_allocObject(&unk_10004A888, 32LL, 7LL);
  *(void *)(v21 + swift_weakDestroy(v0 + 16) = sub_10002B724;
  *(void *)(v21 + 24) = v20;
  ((void (*)(char *, uint64_t, uint64_t))v15)(v14, v31, v7);
  uint64_t v22 = v33;
  ((void (*)(char *, char *, uint64_t))v15)(v33, v14, v7);
  uint64_t v23 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v24 = (v23 + 24) & ~v23;
  uint64_t v25 = swift_allocObject(&unk_10004A8B0, v24 + v9, v23 | 7);
  *(void *)(v25 + swift_weakDestroy(v0 + 16) = v20;
  v18(v25 + v24, v22, v7);
  unint64_t v26 = sub_10002B7D0();
  uint64_t v27 = swift_retain_n(v20, 2LL);
  uint64_t v28 = static OS_dispatch_queue.main.getter(v27);
  void v34[3] = v26;
  v34[4] = &protocol witness table for OS_dispatch_queue;
  v34[0] = v28;
  uint64_t v29 = v32;
  Promise.then(perform:orCatchError:on:)(sub_10002B254, v21, sub_10002B794, v25, v34);
  swift_release(v29);
  swift_release(v21);
  swift_release(v25);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v34);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  return v20;
}

uint64_t sub_10002A304(uint64_t a1, int a2, uint64_t a3)
{
  int v116 = a2;
  uint64_t v127 = a1;
  uint64_t v4 = sub_100006674(&qword_100051400);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v117 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6, v8);
  uint64_t v126 = (uint64_t)&v114 - v9;
  uint64_t v10 = type metadata accessor for JSSourceFile(0LL);
  uint64_t v12 = __chkstk_darwin(v10, v11);
  unint64_t v14 = (char *)&v114 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v12, v15);
  uint64_t v118 = (uint64_t)&v114 - v17;
  __chkstk_darwin(v16, v18);
  uint64_t v20 = (char *)&v114 - v19;
  uint64_t v21 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v21, v22);
  uint64_t v24 = (char *)&v114 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v26 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v27 = *(void *)(v26 + 72);
  uint64_t v28 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v29 = (v28 + 32) & ~v28;
  uint64_t v123 = v28 | 7;
  uint64_t v124 = v25;
  uint64_t v121 = v29 + 3 * v27;
  uint64_t v30 = swift_allocObject(v25, v121, v28 | 7);
  __int128 v122 = xmmword_10003BCD0;
  *(_OWORD *)(v30 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v125 = v29;
  Swift::String v120 = (void *)type metadata accessor for JSSourceUrlParser(0LL);
  uint64_t v134 = v120;
  sub_10000D298(&v132);
  uint64_t v128 = (char *)a3;
  sub_10002B308(a3, v31, type metadata accessor for JSSourceUrlParser);
  id v33 = (id)AMSLogKey(v32);
  uint64_t v119 = v14;
  if (v33)
  {
    int64_t v34 = v33;
    uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
    uint64_t v36 = v20;
    uint64_t v37 = v27;
    uint64_t v38 = v10;
    uint64_t v40 = v39;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v41._uint64_t countAndFlagsBits = 0LL;
    v41._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v41);
    uint64_t v42 = v134;
    uint64_t v43 = sub_100007060(&v132, (uint64_t)v134);
    uint64_t DynamicType = swift_getDynamicType(v43, v42, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    uint64_t v129 = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
    sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
    v45._uint64_t countAndFlagsBits = 5972026LL;
    v45._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v45);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v129 = v35;
    uint64_t v130 = v40;
    uint64_t v10 = v38;
    uint64_t v27 = v37;
    uint64_t v20 = v36;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
    sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
    uint64_t v46 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v47._uint64_t countAndFlagsBits = 0LL;
    v47._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v47);
    uint64_t v48 = v134;
    uint64_t v49 = sub_100007060(&v132, (uint64_t)v134);
    uint64_t v50 = swift_getDynamicType(v49, v48, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v50);
    uint64_t v129 = v50;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
    sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
    uint64_t v46 = 58LL;
  }

  unint64_t v51 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v46);
  LogMessage.init(stringInterpolation:)(v24);
  uint64_t v52 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v132);
  LogMessage.init(stringLiteral:)(0x742064657070614DLL, 0xEE003A6C7275206FLL);
  uint64_t v53 = (void *)type metadata accessor for URL(0LL);
  uint64_t v134 = v53;
  sub_10000D298(&v132);
  uint64_t v54 = v127;
  (*(void (**)(void))(*((void *)v53 - 1) + 16LL))();
  static LogMessage.safe(_:)(&v132);
  sub_100029634((uint64_t)&v132, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v30);
  swift_bridgeObjectRelease(v30);
  uint64_t v55 = v126;
  uint64_t v56 = (uint64_t)v128;
  sub_10002ADA0(v54, v126);
  if (sub_10000748C(v55, 1LL, v10) != 1)
  {
    uint64_t v127 = 2 * v27;
    sub_10002B2DC(v55, (uint64_t)v20, type metadata accessor for JSSourceFile);
    uint64_t v63 = swift_allocObject(v124, v121, v123);
    *(_OWORD *)(v63 + swift_weakDestroy(v0 + 16) = v122;
    uint64_t v134 = v120;
    sub_10000D298(&v132);
    sub_10002B308(v56, v64, type metadata accessor for JSSourceUrlParser);
    id v66 = (id)AMSLogKey(v65);
    uint64_t v115 = v52;
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
      uint64_t v128 = v20;
      uint64_t v70 = v69;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v71._uint64_t countAndFlagsBits = 0LL;
      v71._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v71);
      Swift::Int v72 = v134;
      Swift::Int v73 = sub_100007060(&v132, (uint64_t)v134);
      uint64_t v74 = swift_getDynamicType(v73, v72, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v74);
      uint64_t v129 = v74;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
      sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
      v75._uint64_t countAndFlagsBits = 5972026LL;
      v75._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v75);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v129 = v68;
      uint64_t v130 = v70;
      uint64_t v20 = v128;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
      sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
      uint64_t v76 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v92._uint64_t countAndFlagsBits = 0LL;
      v92._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v92);
      uint64_t v93 = v134;
      uint64_t v94 = sub_100007060(&v132, (uint64_t)v134);
      uint64_t v95 = swift_getDynamicType(v94, v93, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v95);
      uint64_t v129 = v95;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
      sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
      uint64_t v76 = 58LL;
    }

    uint64_t v77 = (uint64_t)v119;
    unint64_t v96 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v76);
    LogMessage.init(stringInterpolation:)(v24);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v132);
    uint64_t v97 = LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x800000010003F380LL);
    uint64_t v99 = URL.absoluteString.getter(v97, v98);
    uint64_t v134 = &type metadata for String;
    uint64_t v132 = v99;
    uint64_t v133 = v100;
    static LogMessage.safe(_:)(&v132);
    sub_100029634((uint64_t)&v132, (uint64_t *)&unk_1000509C0);
    sub_10002C300(v63);
    swift_bridgeObjectRelease(v63);
    sub_100006674(&qword_1000513F0);
    sub_10002B308((uint64_t)v20, v77, type metadata accessor for JSSourceFile);
    uint64_t v62 = Promise.__allocating_init(value:)(v77);
    uint64_t v101 = (uint64_t)v20;
    goto LABEL_15;
  }

  char v57 = v116 & 1;
  sub_100029634(v55, &qword_100051400);
  uint64_t v58 = v54;
  unint64_t v59 = v117;
  sub_10002B074(v58, v57, v117);
  if (sub_10000748C((uint64_t)v59, 1LL, v10) != 1)
  {
    uint64_t v127 = 2 * v27;
    uint64_t v115 = v52;
    sub_10002B2DC((uint64_t)v59, v118, type metadata accessor for JSSourceFile);
    uint64_t v78 = swift_allocObject(v124, v121, v123);
    *(_OWORD *)(v78 + swift_weakDestroy(v0 + 16) = v122;
    uint64_t v134 = v120;
    sub_10000D298(&v132);
    sub_10002B308(v56, v79, type metadata accessor for JSSourceUrlParser);
    id v81 = (id)AMSLogKey(v80);
    if (v81)
    {
      unint64_t v82 = v81;
      uint64_t v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v81);
      uint64_t v85 = v84;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v86._uint64_t countAndFlagsBits = 0LL;
      v86._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v86);
      Swift::String v87 = v134;
      uint64_t v88 = sub_100007060(&v132, (uint64_t)v134);
      uint64_t v89 = swift_getDynamicType(v88, v87, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v89);
      uint64_t v129 = v89;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
      sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
      v90._uint64_t countAndFlagsBits = 5972026LL;
      v90._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v90);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v129 = v83;
      uint64_t v130 = v85;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
      sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
      uint64_t v91 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v102._uint64_t countAndFlagsBits = 0LL;
      v102._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v102);
      uint64_t v103 = v134;
      uint64_t v104 = sub_100007060(&v132, (uint64_t)v134);
      uint64_t v105 = swift_getDynamicType(v104, v103, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v105);
      uint64_t v129 = v105;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v129);
      sub_100029634((uint64_t)&v129, (uint64_t *)&unk_1000509C0);
      uint64_t v91 = 58LL;
    }

    unint64_t v106 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v91);
    LogMessage.init(stringInterpolation:)(v24);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v132);
    uint64_t v107 = LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010003F360LL);
    uint64_t v108 = v118;
    uint64_t v110 = URL.absoluteString.getter(v107, v109);
    uint64_t v134 = &type metadata for String;
    uint64_t v132 = v110;
    uint64_t v133 = v111;
    static LogMessage.safe(_:)(&v132);
    sub_100029634((uint64_t)&v132, (uint64_t *)&unk_1000509C0);
    sub_10002C300(v78);
    swift_bridgeObjectRelease(v78);
    sub_100006674(&qword_1000513F0);
    uint64_t v112 = (uint64_t)v119;
    sub_10002B308(v108, (uint64_t)v119, type metadata accessor for JSSourceFile);
    uint64_t v62 = Promise.__allocating_init(value:)(v112);
    uint64_t v101 = v108;
LABEL_15:
    sub_10002B334(v101);
    return v62;
  }

  sub_100029634((uint64_t)v59, &qword_100051400);
  sub_100006674(&qword_1000513F0);
  unint64_t v60 = sub_10002B2A0();
  uint64_t v61 = swift_allocError(&type metadata for JSSourceUrlParser.ParseError, v60, 0LL, 0LL);
  return Promise.__allocating_init(error:)(v61);
}

uint64_t sub_10002ACDC()
{
  uint64_t v1 = *(void *)(sub_10002BD44() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  uint64_t v8 = sub_10000F6B0();
  sub_100024828(v8);
  return sub_1000226A4(v0, v4, v5);
}

uint64_t sub_10002AD58(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(sub_10002BD44() - 8) + 80LL);
  return sub_10002A304(a1, v4, v2 + ((v5 + 16) & ~v5));
}

uint64_t sub_10002ADA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v37 = a2;
  uint64_t v3 = sub_100006674(&qword_100051410);
  uint64_t v5 = __chkstk_darwin(v3, v4);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (char *)&v35 - v9;
  uint64_t v36 = type metadata accessor for JSSourceFile(0LL);
  uint64_t v12 = __chkstk_darwin(v36, v11);
  unint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = __chkstk_darwin(v12, v15);
  uint64_t v18 = (char *)&v35 - v17;
  uint64_t v20 = __chkstk_darwin(v16, v19);
  uint64_t v23 = (char *)&v35 - v22;
  if (qword_100050198 != -1) {
    uint64_t v20 = swift_once(&qword_100050198, sub_10002A064);
  }
  uint64_t v24 = qword_1000513E8;
  __chkstk_darwin(v20, v21);
  *(&v35 - 2) = v2;
  uint64_t v25 = swift_bridgeObjectRetain(v24);
  sub_100029DC0(v25, (uint64_t (*)(uint64_t, uint64_t, char *))sub_10002B654, (uint64_t)v10);
  swift_bridgeObjectRelease(v24);
  uint64_t v26 = sub_100006674(&qword_100051418);
  if (sub_10000748C((uint64_t)v10, 1LL, v26) != 1)
  {
    swift_bridgeObjectRelease(*((void *)v10 + 1));
    sub_10002B2DC((uint64_t)&v10[*(int *)(v26 + 48)], (uint64_t)v23, type metadata accessor for JSSourceFile);
    uint64_t v33 = (uint64_t)v23;
LABEL_8:
    uint64_t v32 = v37;
    sub_10002B2DC(v33, v37, type metadata accessor for JSSourceFile);
    uint64_t v31 = 0LL;
    return sub_100007438(v32, v31, 1LL, v36);
  }

  sub_100029634((uint64_t)v10, &qword_100051410);
  uint64_t v27 = qword_1000513E8;
  __chkstk_darwin(v28, v29);
  *(&v35 - 2) = v35;
  uint64_t v30 = swift_bridgeObjectRetain(v27);
  sub_100029DC0(v30, (uint64_t (*)(uint64_t, uint64_t, char *))sub_10002B6D4, (uint64_t)v7);
  swift_bridgeObjectRelease(v27);
  if (sub_10000748C((uint64_t)v7, 1LL, v26) != 1)
  {
    swift_bridgeObjectRelease(*((void *)v7 + 1));
    sub_10002B2DC((uint64_t)&v7[*(int *)(v26 + 48)], (uint64_t)v14, type metadata accessor for JSSourceFile);
    sub_10002B2DC((uint64_t)v14, (uint64_t)v18, type metadata accessor for JSSourceFile);
    uint64_t v33 = (uint64_t)v18;
    goto LABEL_8;
  }

  sub_100029634((uint64_t)v7, &qword_100051410);
  uint64_t v31 = 1LL;
  uint64_t v32 = v37;
  return sub_100007438(v32, v31, 1LL, v36);
}

uint64_t sub_10002B074@<X0>(uint64_t a1@<X0>, char a2@<W1>, char *a3@<X8>)
{
  uint64_t v6 = URL.pathExtension.getter(a1);
  if (v6 == 29546 && v7 == 0xE200000000000000LL)
  {
    unint64_t v11 = 0xE200000000000000LL;
  }

  else
  {
    uint64_t v9 = v6;
    unint64_t v10 = v7;
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(29546LL, 0xE200000000000000LL, v6, v7, 0LL) & 1) == 0)
    {
      if (v9 == 0x6B63617074656ALL && v10 == 0xE700000000000000LL)
      {
        swift_bridgeObjectRelease(0xE700000000000000LL);
      }

      else
      {
        char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6B63617074656ALL, 0xE700000000000000LL, v9, v10, 0LL);
        swift_bridgeObjectRelease(v10);
        if ((v18 & 1) == 0) {
          goto LABEL_9;
        }
      }

      char v15 = a2 & 1 | 4;
      uint64_t v12 = type metadata accessor for JSSourceFile(0LL);
      uint64_t v19 = &a3[*(int *)(v12 + 20)];
      uint64_t v20 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16LL))(v19, a1, v20);
      goto LABEL_10;
    }

    unint64_t v11 = v10;
  }

  swift_bridgeObjectRelease(v11);
LABEL_9:
  uint64_t v12 = type metadata accessor for JSSourceFile(0LL);
  uint64_t v13 = &a3[*(int *)(v12 + 20)];
  uint64_t v14 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL))(v13, a1, v14);
  char v15 = 3;
LABEL_10:
  *a3 = v15;
  type metadata accessor for JSSourceFile(0LL);
  return sub_100007438((uint64_t)a3, 0LL, 1LL, v12);
}

uint64_t sub_10002B1E8(uint64_t a1, uint64_t (*a2)(uint64_t, void))
{
  uint64_t v4 = sub_100006674(&qword_100051088);
  return a2(a1, *(unsigned __int8 *)(a1 + *(int *)(v4 + 48)));
}

uint64_t sub_10002B230()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002B254(uint64_t a1)
{
  return sub_10002B1E8(a1, *(uint64_t (**)(uint64_t, void))(v1 + 16));
}

unint64_t sub_10002B25C()
{
  unint64_t result = qword_1000513F8;
  if (!qword_1000513F8)
  {
    uint64_t v1 = sub_10000D01C(&qword_1000513F0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000513F8);
  }

  return result;
}

unint64_t sub_10002B2A0()
{
  unint64_t result = qword_100051408;
  if (!qword_100051408)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CBCC, &type metadata for JSSourceUrlParser.ParseError);
    atomic_store(result, (unint64_t *)&qword_100051408);
  }

  return result;
}

void sub_10002B2DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_10002BD34(a1, a2, a3);
  sub_10002BD4C(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_10000870C();
}

void sub_10002B308(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_10002BD34(a1, a2, a3);
  sub_10002BD4C(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_10000870C();
}

uint64_t sub_10002B334(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSSourceFile(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_10002B370(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  uint64_t v4 = sub_100006674(&qword_100051088);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(int *)(v6 + 48);
  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, a1, v10);
  v8[v9] = v3;
  Promise.resolve(_:)(v8);
  sub_100029634((uint64_t)v8, &qword_100051088);
}

void sub_10002B420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100006674(&qword_100051088);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for Log();
  uint64_t v9 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v10 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + 2LL * *(void *)(v10 + 72),
          *(unsigned __int8 *)(v10 + 80) | 7LL);
  *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  LogMessage.init(stringLiteral:)(0xD00000000000001FLL, 0x800000010003F3A0LL);
  swift_getErrorValue(a1);
  uint64_t v12 = v16;
  v17[3] = v16;
  sub_10000D298(v17);
  (*(void (**)(void))(*(void *)(v12 - 8) + 16LL))();
  static LogMessage.safe(_:)(v17);
  sub_100029634((uint64_t)v17, (uint64_t *)&unk_1000509C0);
  sub_10002C320(v11);
  swift_bridgeObjectRelease(v11);
  uint64_t v13 = *(int *)(v5 + 48);
  uint64_t v14 = type metadata accessor for URL(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL))(v8, a3, v14);
  v8[v13] = 0;
  Promise.resolve(_:)(v8);
  sub_100029634((uint64_t)v8, &qword_100051088);
}

uint64_t sub_10002B5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSSourceUrlParser(0LL);
  uint64_t v6 = URL.absoluteString.getter(v4, v5);
  uint64_t v8 = v7;
  v12[2] = v6;
  v12[3] = v7;
  v12[0] = a1;
  v12[1] = a2;
  unint64_t v9 = sub_100025D44();
  char v10 = StringProtocol.contains<A>(_:)(v12, &type metadata for String, &type metadata for String, v9, v9);
  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

uint64_t sub_10002B654(uint64_t a1, uint64_t a2)
{
  return sub_10002B5CC(a1, a2);
}

uint64_t sub_10002B65C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = URL.absoluteString.getter(a1, a2);
  uint64_t v6 = v5;
  v9[2] = v4;
  v9[3] = v5;
  v9[0] = a1;
  v9[1] = v2;
  unint64_t v7 = sub_100025D44();
  LOBYTE(v2) = StringProtocol.contains<A>(_:)(v9, &type metadata for String, &type metadata for String, v7, v7);
  swift_bridgeObjectRelease(v6);
  return v2 & 1;
}

uint64_t sub_10002B6D4(uint64_t a1, uint64_t a2)
{
  return sub_10002B65C(a1, a2);
}

uint64_t sub_10002B6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_100051418);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_10002B724(uint64_t a1, char a2)
{
}

uint64_t sub_10002B730()
{
  uint64_t v1 = sub_10000F6B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return sub_1000226A4(v0, v5, v6);
}

void sub_10002B794(uint64_t a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_10000F6B0() - 8) + 80LL);
  sub_10002B420(a1, *(void *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

unint64_t sub_10002B7D0()
{
  unint64_t result = qword_1000506E0;
  if (!qword_1000506E0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000506E0);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for JSSourceUrlParser.ParseError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10002B84C + 4 * asc_10003CB30[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10002B86C + 4 * byte_10003CB35[v4]))();
  }
}

_BYTE *sub_10002B84C(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10002B86C(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002B874(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002B87C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002B884(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002B88C(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for JSSourceUrlParser.ParseError()
{
  return &type metadata for JSSourceUrlParser.ParseError;
}

uint64_t *sub_10002B8A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v12);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Bag(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    unint64_t v9 = (char *)a1 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_10002B950(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_10002B9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10002BA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10002BAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10002BB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10002BB9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002BBA8);
}

uint64_t sub_10002BBA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000086D8();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84LL) == (_DWORD)v3)
  {
    uint64_t v7 = v6;
    uint64_t v8 = v4;
  }

  else
  {
    uint64_t v7 = sub_10000F6B0();
    uint64_t v8 = v4 + *(int *)(a3 + 20);
  }

  return sub_10000748C(v8, v3, v7);
}

uint64_t sub_10002BC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002BC0C);
}

uint64_t sub_10002BC0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1000086D8();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v5;
  }

  else
  {
    uint64_t v9 = sub_10000F6B0();
    uint64_t v10 = v5 + *(int *)(a4 + 20);
  }

  return sub_100007438(v10, v4, v4, v9);
}

uint64_t sub_10002BC6C(uint64_t a1)
{
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for URL(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

unint64_t sub_10002BCF4()
{
  unint64_t result = qword_1000514B0;
  if (!qword_1000514B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CBA4, &type metadata for JSSourceUrlParser.ParseError);
    atomic_store(result, (unint64_t *)&qword_1000514B0);
  }

  return result;
}

uint64_t sub_10002BD34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t sub_10002BD44()
{
  return type metadata accessor for JSSourceUrlParser(0LL);
}

uint64_t sub_10002BD4C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

void sub_10002BD58()
{
}

void sub_10002BD60()
{
}

uint64_t type metadata accessor for Localizations()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService13Localizations);
}

uint64_t sub_10002BD8C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for JSSource(0LL);
  uint64_t v37 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v38[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v38[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v41 = type metadata accessor for LocalJavascriptLoader();
  v40[0] = v2;
  uint64_t v15 = swift_retain(v2);
  id v16 = (id)AMSLogKey(v15);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v20 = v19;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    uint64_t v21 = v41;
    uint64_t v22 = sub_100007060(v40, v41);
    uint64_t DynamicType = swift_getDynamicType(v22, v21, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v38[0] = DynamicType;
    sub_10002C2D0();
    sub_10002C2D8();
    v24._uint64_t countAndFlagsBits = 5972026LL;
    v24._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v24);
    uint64_t MetatypeMetadata = &type metadata for String;
    v38[0] = v18;
    v38[1] = v20;
    sub_10002C2D0();
    sub_10002C2D8();
    uint64_t v25 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    uint64_t v26 = v41;
    uint64_t v27 = sub_100007060(v40, v41);
    uint64_t v28 = swift_getDynamicType(v27, v26, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v28);
    v38[0] = v28;
    sub_10002C2D0();
    sub_10002C2D8();
    uint64_t v25 = 58LL;
  }

  unint64_t v29 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v25);
  LogMessage.init(stringInterpolation:)(v11);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v40);
  LogMessage.init(stringLiteral:)(0xD00000000000001ELL, 0x800000010003F440LL);
  uint64_t v30 = type metadata accessor for URL(0LL);
  uint64_t v41 = v30;
  uint64_t v31 = sub_100007678(v40);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16LL))(v31, a1, v30);
  static LogMessage.safe(_:)(v40);
  sub_100008D04((uint64_t)v40);
  sub_10002C300(v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v32 = String.init(contentsOf:)(a1);
  JSSource.init(_:file:)(v32);
  uint64_t v41 = v4;
  uint64_t v42 = &protocol witness table for JSSource;
  uint64_t v33 = sub_100007678(v40);
  uint64_t v34 = v37;
  (*(void (**)(void *, char *, uint64_t))(v37 + 16))(v33, v7, v4);
  uint64_t v43 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  sub_100006674(&qword_1000506C0);
  sub_10002C1B8((uint64_t)v40, (uint64_t)v38);
  uint64_t v35 = Promise.__allocating_init(value:)(v38);
  sub_1000165DC(v40);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v4);
  return v35;
}

uint64_t type metadata accessor for LocalJavascriptLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService21LocalJavascriptLoader);
}

uint64_t sub_10002C15C(uint64_t a1)
{
  return sub_10002BD8C(a1);
}

unint64_t sub_10002C17C()
{
  unint64_t result = qword_1000515F0;
  if (!qword_1000515F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CCDC, &type metadata for LocalJavascriptLoader.LoadError);
    atomic_store(result, (unint64_t *)&qword_1000515F0);
  }

  return result;
}

uint64_t sub_10002C1B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t storeEnumTagSinglePayload for LocalJavascriptLoader.LoadError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10002C234 + 4 * asc_10003CC30[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10002C254 + 4 * byte_10003CC35[v4]))();
  }
}

_BYTE *sub_10002C234(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10002C254(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002C25C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002C264(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002C26C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002C274(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LocalJavascriptLoader.LoadError()
{
  return &type metadata for LocalJavascriptLoader.LoadError;
}

unint64_t sub_10002C294()
{
  unint64_t result = qword_1000515F8;
  if (!qword_1000515F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CCB4, &type metadata for LocalJavascriptLoader.LoadError);
    atomic_store(result, (unint64_t *)&qword_1000515F8);
  }

  return result;
}

uint64_t sub_10002C2D0()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 184);
}

uint64_t sub_10002C2D8()
{
  return sub_100008D04(v0 - 184);
}

uint64_t sub_10002C2E0(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.debug.getter();
  return sub_10002C588(v2, a1);
}

uint64_t sub_10002C300(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.default.getter();
  return sub_10002C588(v2, a1);
}

uint64_t sub_10002C320(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.error.getter();
  return sub_10002C588(v2, a1);
}

uint64_t sub_10002C340(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.fault.getter();
  return sub_10002C588(v2, a1);
}

uint64_t sub_10002C360(uint64_t a1)
{
  uint64_t v2 = static os_log_type_t.info.getter();
  return sub_10002C588(v2, a1);
}

uint64_t sub_10002C380()
{
  uint64_t result = OS_os_log.init(subsystem:category:)( 0xD00000000000001CLL,  0x800000010003F530LL,  0x2D63696D616E7964LL,  0xEA00000000006975LL);
  qword_100051600 = result;
  return result;
}

uint64_t sub_10002C3E0(uint64_t a1, uint64_t a2)
{
  if (qword_1000501A0 != -1) {
    swift_once(&qword_1000501A0, sub_10002C380);
  }
  uint64_t v4 = qword_100051600;
  uint64_t result = os_log_type_enabled((os_log_t)qword_100051600, (os_log_type_t)a1);
  if ((_DWORD)result)
  {
    char v6 = static LogMessage.isRedactionEnabled.getter();
    uint64_t v7 = static LogMessage.describe(contentsOf:withRedaction:separator:)(a2, v6 & 1, 32LL, 0xE100000000000000LL);
    uint64_t v9 = v8;
    uint64_t v10 = sub_100006674(&qword_1000516A0);
    uint64_t v11 = swift_allocObject(v10, 72LL, 7LL);
    *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = xmmword_10003BAE0;
    *(void *)(v11 + 56) = &type metadata for String;
    *(void *)(v11 + 64) = sub_10002C510();
    *(void *)(v11 + 32) = v7;
    *(void *)(v11 + 40) = v9;
    os_log(_:dso:log:type:_:)("%{public}@", 10LL, 2LL, &_mh_execute_header, v4, a1, v11);
    return swift_bridgeObjectRelease(v11);
  }

  return result;
}

uint64_t type metadata accessor for Log()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService3Log);
}

unint64_t sub_10002C510()
{
  unint64_t result = qword_1000516A8;
  if (!qword_1000516A8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000516A8);
  }

  return result;
}

unint64_t sub_10002C54C()
{
  unint64_t result = qword_1000516B0;
  if (!qword_1000516B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000516B0);
  }

  return result;
}

uint64_t sub_10002C588(uint64_t a1, uint64_t a2)
{
  return sub_10002C3E0(a1, a2);
}

void sub_10002C590(void *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v5 = (void *)sub_10002267C(0xD000000000000015LL, 0x800000010003F550LL);
  uint64_t v6 = sub_1000091A0(v5);
  if (v6)
  {
    uint64_t v2 = (void *)v6;
    unint64_t v7 = sub_1000201C0(v6);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  sub_10002267C(0x6E6948726566666FLL, 0xEA00000000007374LL);
  uint64_t v8 = sub_100005870();
  unint64_t v10 = v9;

  uint64_t v11 = sub_10002CA80();
  sub_10002267C(v11, v12);
  uint64_t v13 = sub_100005870();
  unint64_t v15 = v14;

  if (v15)
  {
    uint64_t v33 = v8;
    uint64_t v16 = sub_10002CA60();
    sub_10002267C(v16, v17);
    uint64_t v32 = sub_100005870();
    unint64_t v19 = v18;

    if (v19)
    {
      unint64_t v31 = v7;
      uint64_t v20 = sub_10000D714();
      sub_10002267C(v20, v21);
      uint64_t v30 = sub_100005870();
      unint64_t v23 = v22;

      if (v23)
      {

        *a2 = v31;
        a2[1] = v13;
        a2[2] = v15;
        a2[3] = v33;
        a2[4] = v10;
        a2[5] = v32;
        a2[6] = v19;
        a2[7] = v30;
        a2[8] = v23;
        return;
      }

      swift_bridgeObjectRelease(v19);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v31);
      sub_100005868();
      uint64_t v24 = sub_10000D714();
    }

    else
    {
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v7);
      sub_100005868();
      uint64_t v24 = sub_10002CA60();
    }
  }

  else
  {
    swift_bridgeObjectRelease(v7);
    sub_100005868();
    uint64_t v24 = sub_10002CA80();
  }

  uint64_t v26 = sub_10002267C(v24, v25);
  uint64_t v27 = type metadata accessor for JSError(0LL);
  unint64_t v28 = sub_100009214();
  swift_allocError(v27, v28, 0LL, 0LL);
  uint64_t v29 = JSError.init(badValue:expected:)(v26, 0x676E69727473LL, 0xE600000000000000LL);
  swift_willThrow(v29);
}

void sub_10002C77C(void *a1@<X0>, void *a2@<X8>)
{
  if (!v2) {
    memcpy(a2, __src, 0x48uLL);
  }
}

uint64_t destroy for MarketingItemRequest(void *a1)
{
  return swift_bridgeObjectRelease(a1[8]);
}

uint64_t *initializeWithCopy for MarketingItemRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v8 = a2[4];
  uint64_t v7 = a2[5];
  a1[4] = v8;
  a1[5] = v7;
  uint64_t v10 = a2[6];
  uint64_t v9 = a2[7];
  a1[6] = v10;
  a1[7] = v9;
  uint64_t v11 = a2[8];
  a1[8] = v11;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  return a1;
}

uint64_t *assignWithCopy for MarketingItemRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[5] = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a1[6];
  a1[6] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[7] = a2[7];
  uint64_t v12 = a2[8];
  uint64_t v13 = a1[8];
  a1[8] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

void *initializeWithTake for MarketingItemRequest(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t *assignWithTake for MarketingItemRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = a2[2];
  uint64_t v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = a2[4];
  uint64_t v8 = a1[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = a2[6];
  uint64_t v10 = a1[6];
  a1[5] = a2[5];
  a1[6] = v9;
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = a2[8];
  uint64_t v12 = a1[8];
  a1[7] = a2[7];
  a1[8] = v11;
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarketingItemRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for MarketingItemRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 72) = 1;
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
      *(void *)(result + swift_weakDestroy(v0 + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MarketingItemRequest()
{
  return &type metadata for MarketingItemRequest;
}

uint64_t sub_10002CA60()
{
  return 0x5465636976726573LL;
}

uint64_t sub_10002CA80()
{
  return 0x6E656D6563616C70LL;
}

id sub_10002CA9C(void *a1, void *a2)
{
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (result)
  {
    id v5 = result;
    sub_10000FB50();
    id v6 = [a2 rawValues];
    uint64_t v7 = sub_100006674(&qword_100050570);
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v6,  &type metadata for String,  v7,  &protocol witness table for String);

    v10[3] = sub_100006674(&qword_100050578);
    v10[0] = v8;
    id v9 = a1;
    id result = sub_10002299C(v10, a1);
    if (result)
    {
      JSValue.subscript.setter(result, 0x6E6974656B72616DLL, 0xED00006D65744967LL);
      return v5;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

void sub_10002CBB8(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for URL(0LL);
  uint64_t v30 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(a2 + 24) = 0LL;
  *(_BYTE *)(a2 + 32) = 1;
  uint64_t v13 = a2 + *(int *)(type metadata accessor for MediaAPIRequest(0LL) + 32);
  sub_100026A40(v13, 1LL);
  unint64_t v14 = (void *)sub_100005860();
  uint64_t v15 = sub_1000091A0(v14);
  if (v15)
  {
    sub_1000201C0(v15);
    sub_10002D5A0();
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  *(void *)a2 = v2;
  uint64_t v16 = (void *)sub_100005860();
  uint64_t v17 = sub_1000065D4(v16);
  if (v17)
  {
    sub_100005DBC(v17);
    sub_10002D5A0();
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  *(void *)(a2 + swift_weakDestroy(v0 + 16) = v2;
  unint64_t v18 = (void *)sub_100005860();
  char v19 = JSValue.BOOL.getter();

  *(_BYTE *)(a2 + 8) = v19 & 1;
  uint64_t v20 = (void *)sub_100005860();
  uint64_t v21 = JSValue.string.getter(v20);
  uint64_t v23 = v22;

  if (v23)
  {
    URL.init(string:)(v21, v23);
    swift_bridgeObjectRelease(v23);
    if (sub_10000748C((uint64_t)v8, 1LL, v9) == 1)
    {
      sub_10000B8C8((uint64_t)v8);
    }

    else
    {
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
      v24(v12, v8, v9);
      sub_10000B8C8(v13);
      v24((char *)v13, v12, v9);
      sub_100026A40(v13, 0LL);
    }
  }

  uint64_t v25 = (void *)sub_100005860();
  uint64_t v26 = JSValue.int.getter();
  char v28 = v27;

  if ((v28 & 1) == 0)
  {
    *(void *)(a2 + 24) = v26;
    *(_BYTE *)(a2 + 32) = 0;
  }

void sub_10002CE30(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t type metadata accessor for MediaAPIRequest(uint64_t a1)
{
  uint64_t result = qword_100051710;
  if (!qword_100051710) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MediaAPIRequest);
  }
  return result;
}

uint64_t sub_10002CE7C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = v4 + ((v3 + 16LL) & ~(unint64_t)v3);
    swift_retain(v4);
  }

  else
  {
    uint64_t v5 = a1;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    uint64_t v7 = a2[2];
    uint64_t v6 = a2[3];
    *(void *)(a1 + swift_weakDestroy(v0 + 16) = v7;
    *(void *)(a1 + 24) = v6;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    uint64_t v8 = *(int *)(a3 + 32);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for URL(0LL);
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v7);
    if (sub_10000748C((uint64_t)v10, 1LL, v11))
    {
      uint64_t v12 = sub_100006674(&qword_1000505B8);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_100007438((uint64_t)v9, 0LL, 1LL, v11);
    }
  }

  return v5;
}

uint64_t sub_10002CF80(void *a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t result = sub_10000748C(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }
  return result;
}

uint64_t sub_10002CFF4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for URL(0LL);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  if (sub_10000748C((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_100006674(&qword_1000505B8);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
    sub_100007438((uint64_t)v8, 0LL, 1LL, v10);
  }

  return a1;
}

uint64_t *sub_10002D0D0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v8 = a1[2];
  uint64_t v9 = a2[2];
  a1[2] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v8);
  uint64_t v10 = a2[3];
  *((_BYTE *)a1 + 32) = *((_BYTE *)a2 + 32);
  a1[3] = v10;
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for URL(0LL);
  int v15 = sub_10000748C((uint64_t)v12, 1LL, v14);
  int v16 = sub_10000748C((uint64_t)v13, 1LL, v14);
  if (!v15)
  {
    uint64_t v17 = *(void *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 24))(v12, v13, v14);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_6;
  }

  if (v16)
  {
LABEL_6:
    uint64_t v18 = sub_100006674(&qword_1000505B8);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
  sub_100007438((uint64_t)v12, 0LL, 1LL, v14);
  return a1;
}

uint64_t sub_10002D214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for URL(0LL);
  if (sub_10000748C((uint64_t)v7, 1LL, v8))
  {
    uint64_t v9 = sub_100006674(&qword_1000505B8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32LL))(v6, v7, v8);
    sub_100007438((uint64_t)v6, 0LL, 1LL, v8);
  }

  return a1;
}

uint64_t *sub_10002D2D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v7 = a1[2];
  a1[2] = a2[2];
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  *((_BYTE *)a1 + 32) = *((_BYTE *)a2 + 32);
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  int v12 = sub_10000748C((uint64_t)v9, 1LL, v11);
  int v13 = sub_10000748C((uint64_t)v10, 1LL, v11);
  if (!v12)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_6;
  }

  if (v13)
  {
LABEL_6:
    uint64_t v15 = sub_100006674(&qword_1000505B8);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
  sub_100007438((uint64_t)v9, 0LL, 1LL, v11);
  return a1;
}

uint64_t sub_10002D40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002D418);
}

uint64_t sub_10002D418(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }

  else
  {
    uint64_t v9 = sub_100006674(&qword_1000505B8);
    return sub_10000748C((uint64_t)a1 + *(int *)(a3 + 32), a2, v9);
  }

uint64_t sub_10002D49C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002D4A8);
}

void *sub_10002D4A8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }

  else
  {
    uint64_t v7 = sub_100006674(&qword_1000505B8);
    return (void *)sub_100007438((uint64_t)v5 + *(int *)(a4 + 32), a2, a2, v7);
  }

  return result;
}

void sub_10002D518(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = &unk_10003CDD0;
  void v4[2] = "\b";
  void v4[3] = &unk_10003CDE8;
  sub_1000245B4(319LL);
  if (v3 <= 0x3F)
  {
    void v4[4] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
  }

uint64_t sub_10002D5A0()
{
  return swift_bridgeObjectRelease(v0);
}

id sub_10002D5AC(void *a1, void *a2)
{
  id result = [(id)objc_opt_self(JSValue) valueWithNewObjectInContext:a1];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }

  id v5 = result;
  if (sub_10002D6D4(a2))
  {
    sub_10002D7A8();
    sub_100006674(&qword_100050280);
    sub_10002D79C();
    id result = sub_10002299C(v6, a1);
    if (result)
    {
      JSValue.subscript.setter(result, 0xD000000000000012LL, 0x800000010003F5B0LL);
      goto LABEL_5;
    }

LABEL_5:
  if (!sub_10002D73C(a2)) {
    return v5;
  }
  sub_10002D7A8();
  sub_100006674(&qword_100050558);
  sub_10002D79C();
  id result = sub_10002299C(v6, a1);
  if (result)
  {
    JSValue.subscript.setter(result, 0xD000000000000011LL, 0x800000010003F590LL);
    return v5;
  }

uint64_t sub_10002D6D4(void *a1)
{
  id v1 = [a1 responseDictionary];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

  return v3;
}

uint64_t sub_10002D73C(void *a1)
{
  id v1 = [a1 responseDataItems];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100006674(&qword_100050280);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  return v4;
}

id sub_10002D79C()
{
  return v0;
}

unint64_t sub_10002D7A8()
{
  return sub_10000FB50();
}

void *initializeBufferWithCopyOfBuffer for MediaClient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for MediaClient(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for MediaClient(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

void *assignWithTake for MediaClient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaClient(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MediaClient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)id result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 1;
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

    *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MediaClient()
{
  return &type metadata for MediaClient;
}

uint64_t sub_10002D8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
  }
}

uint64_t sub_10002D900(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469LL && a2 == 0xEA00000000007265LL)
  {
    swift_bridgeObjectRelease(0xEA00000000007265LL);
    char v5 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x696669746E656469LL, 0xEA00000000007265LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v5 = v4 ^ 1;
  }

  return v5 & 1;
}

uint64_t sub_10002D990()
{
  return 0x696669746E656469LL;
}

uint64_t sub_10002D9AC(uint64_t *a1, uint64_t *a2)
{
  return sub_10002D8E4(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_10002D9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10002D900(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10002D9EC(uint64_t a1)
{
  unint64_t v2 = sub_10002DD5C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002DA14(uint64_t a1)
{
  unint64_t v2 = sub_10002DD5C();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10002DA3C(void *a1)
{
  uint64_t v3 = sub_100006674(&qword_100051758);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = sub_100007060(a1, v8);
  unint64_t v11 = sub_10002DD5C();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for MediaClient.CodingKeys,  &type metadata for MediaClient.CodingKeys,  v11,  v8,  v9);
  if (!v1)
  {
    uint64_t v10 = (void *)KeyedDecodingContainer.decode(_:forKey:)(v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
  return v10;
}

uint64_t sub_10002DB48(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006674(&qword_100051768);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_100007060(a1, v11);
  unint64_t v13 = sub_10002DD5C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for MediaClient.CodingKeys,  &type metadata for MediaClient.CodingKeys,  v13,  v11,  v12);
  KeyedEncodingContainer.encode(_:forKey:)(a2, a3, v14, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

void *sub_10002DC38@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_10002DA3C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }

  return result;
}

uint64_t sub_10002DC60(void *a1)
{
  return sub_10002DB48(a1, *v1, v1[1]);
}

ValueMetadata *sub_10002DC78(uint64_t a1, void *a2)
{
  unint64_t v13 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(27LL);
  uint64_t v12 = &type metadata for MediaClient;
  uint64_t v4 = sub_100006674(&qword_100051770);
  uint64_t v5 = String.init<A>(describing:)(&v12, v4);
  unint64_t v7 = v6;
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v12 = (ValueMetadata *)v5;
  unint64_t v13 = v7;
  v8._object = (void *)0x800000010003F5D0LL;
  v8._uint64_t countAndFlagsBits = 0xD000000000000015LL;
  String.append(_:)(v8);
  swift_bridgeObjectRetain(a2);
  v9._uint64_t countAndFlagsBits = a1;
  v9._object = a2;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(a2);
  v10._uint64_t countAndFlagsBits = 32010LL;
  v10._object = (void *)0xE200000000000000LL;
  String.append(_:)(v10);
  return v12;
}

ValueMetadata *sub_10002DD54()
{
  return sub_10002DC78(*(void *)v0, *(void **)(v0 + 8));
}

unint64_t sub_10002DD5C()
{
  unint64_t result = qword_100051760;
  if (!qword_100051760)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CF84, &type metadata for MediaClient.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051760);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for MediaClient.CodingKeys(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10002DDD8 + 4 * byte_10003CE00[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10002DDF8 + 4 * byte_10003CE05[v4]))();
  }
}

_BYTE *sub_10002DDD8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10002DDF8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002DE00(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002DE08(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10002DE10(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10002DE18(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MediaClient.CodingKeys()
{
  return &type metadata for MediaClient.CodingKeys;
}

unint64_t sub_10002DE38()
{
  unint64_t result = qword_100051778;
  if (!qword_100051778)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CF5C, &type metadata for MediaClient.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051778);
  }

  return result;
}

unint64_t sub_10002DE78()
{
  unint64_t result = qword_100051780;
  if (!qword_100051780)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CECC, &type metadata for MediaClient.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051780);
  }

  return result;
}

unint64_t sub_10002DEB8()
{
  unint64_t result = qword_100051788;
  if (!qword_100051788)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CEF4, &type metadata for MediaClient.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100051788);
  }

  return result;
}

void sub_10002DEF8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100006674(&qword_1000517E0);
    uint64_t v2 = (void *)sub_10002F2CC();
  }

  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v32 = a1 + 64;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  unint64_t v6 = (char *)(v2 + 8);
  sub_10002F2EC();
  swift_retain(v2);
  int64_t v7 = 0LL;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    uint64_t v18 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v9);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    sub_100006638(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(void *)&__int128 v43 = v20;
    *((void *)&v43 + 1) = v19;
    void v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(void *)&v41[0] = v20;
    *((void *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v33, v41, &type metadata for String, &type metadata for AnyHashable, 7LL);
    sub_10000750C(v42, v36);
    __int128 v37 = v33;
    __int128 v38 = v34;
    uint64_t v39 = v35;
    sub_10000750C(v36, v40);
    __int128 v33 = v37;
    __int128 v34 = v38;
    uint64_t v35 = v39;
    sub_10000750C(v40, v41);
    sub_10000750C(v41, &v37);
    Swift::Int v21 = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v22 = -1LL << *((_BYTE *)v2 + 32);
    unint64_t v23 = v21 & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)&v6[8 * (v23 >> 6)]) == 0)
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
        uint64_t v29 = *(void *)&v6[8 * v24];
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }

      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)&v6[8 * (v23 >> 6)])) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_38:
    *(void *)&v6[(v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v25;
    uint64_t v30 = v2[6] + 40 * v25;
    *(_OWORD *)uint64_t v30 = v33;
    *(_OWORD *)(v30 + swift_weakDestroy(v0 + 16) = v34;
    *(void *)(v30 + 32) = v35;
    sub_10000750C(&v37, (_OWORD *)(v2[7] + 32 * v25));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1LL)) {
      goto LABEL_42;
    }
    if (v10 >= v31) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      sub_10002F30C();
      if (v13 == v14) {
        goto LABEL_40;
      }
      sub_10002F2F4();
      if (!v11)
      {
        sub_10002F30C();
        if (v13 == v14) {
          goto LABEL_40;
        }
        sub_10002F2F4();
        if (!v11)
        {
          sub_10002F30C();
          if (v13 == v14) {
            goto LABEL_40;
          }
          sub_10002F2F4();
          if (!v11) {
            break;
          }
        }
      }
    }

LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }

  int64_t v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    swift_release(v2);
    sub_10000B908(a1);
    return;
  }

  unint64_t v11 = *(void *)(v32 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }

  while (!__OFADD__(v16, 1LL))
  {
    sub_10002F30C();
    if (v13 == v14) {
      goto LABEL_40;
    }
    sub_10002F2F4();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }

  uint64_t v2 = sub_100007498(0LL, &qword_100051E70, &OBJC_CLASS___NSObject_ptr);
  uint64_t v62 = static NSObject.== infix(_:_:)(*(void *)(v41 + 16), *(void *)(v59 + 16));
  sub_100038DF0(v41);
  sub_100038E6C();
  uint64_t v63 = v70;
  sub_100038E74((uint64_t)a1);
  sub_100038E88();
  if ((v62 & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v64 = static MetricsContext.== infix(_:_:)( *(unsigned __int8 *)(v63 + 24),  *(void *)(v63 + 32),  *(unsigned __int8 *)(v2 + 24),  *(void *)(v2 + 32));
  sub_100038E64();
  sub_100038DF0(v2);
  sub_100038EBC();
  sub_100038EB0();
  if ((v64 & 1) != 0)
  {
    Swift::String v45 = static URL.== infix(_:_:)((char *)v13 + *(int *)(v65 + 32), &v9[*(int *)(v65 + 32)]);
    goto LABEL_12;
  }

LABEL_43:
  __break(1u);
}

void sub_10002E288(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100006674(&qword_1000517D8);
    uint64_t v2 = (void *)sub_10002F2CC();
  }

  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v40 = v1 + 64;
  uint64_t v3 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v39 = (unint64_t)(63 - v3) >> 6;
  sub_10002F2EC();
  int64_t v6 = 0LL;
  int64_t v7 = &type metadata for String;
  unint64_t v8 = &qword_100050570;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v9 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v10 = v9 | (v6 << 6);
      }

      else
      {
        int64_t v11 = v6 + 1;
        if (__OFADD__(v6, 1LL)) {
          goto LABEL_38;
        }
        if (v11 >= v39)
        {
LABEL_35:
          sub_10000B908(v1);
          return;
        }

        unint64_t v12 = *(void *)(v40 + 8 * v11);
        int64_t v13 = v6 + 1;
        if (!v12)
        {
          sub_10002F300();
          if (v14 == v15) {
            goto LABEL_35;
          }
          sub_10002F318();
          if (!v12)
          {
            sub_10002F300();
            if (v14 == v15) {
              goto LABEL_35;
            }
            sub_10002F318();
            if (!v12)
            {
              sub_10002F300();
              if (v14 == v15) {
                goto LABEL_35;
              }
              sub_10002F318();
              if (!v12)
              {
                int64_t v17 = v16 + 4;
                if (v17 >= v39) {
                  goto LABEL_35;
                }
                unint64_t v12 = *(void *)(v40 + 8 * v17);
                if (!v12)
                {
                  while (!__OFADD__(v17, 1LL))
                  {
                    sub_10002F300();
                    if (v14 == v15) {
                      goto LABEL_35;
                    }
                    sub_10002F318();
                    int64_t v17 = v18 + 1;
                    if (v12) {
                      goto LABEL_29;
                    }
                  }

                  goto LABEL_39;
                }

                int64_t v13 = v17;
              }
            }
          }
        }

LABEL_29:
        unint64_t v5 = (v12 - 1) & v12;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
        int64_t v6 = v13;
      }

      uint64_t v19 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v10);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      uint64_t v22 = (void *)(*(void *)(v1 + 56) + 16 * v10);
      uint64_t v23 = v22[1];
      v42[0] = *v22;
      v42[1] = v23;
      swift_bridgeObjectRetain(v20);
      swift_bridgeObjectRetain(v23);
      uint64_t v24 = sub_100006674(v8);
      swift_dynamicCast(&v43, v42, v7, v24, 7LL);
      uint64_t v25 = v43;
      unint64_t v26 = sub_1000098A8(v21, v20);
      unint64_t v27 = v26;
      if ((v28 & 1) == 0) {
        break;
      }
      uint64_t v41 = v25;
      unint64_t v29 = v5;
      uint64_t v30 = v1;
      uint64_t v31 = v6;
      uint64_t v32 = v8;
      __int128 v33 = v7;
      __int128 v34 = (uint64_t *)(v2[6] + 16 * v26);
      swift_bridgeObjectRelease(v34[1]);
      *__int128 v34 = v21;
      v34[1] = v20;
      int64_t v7 = v33;
      unint64_t v8 = v32;
      int64_t v6 = v31;
      uint64_t v1 = v30;
      unint64_t v5 = v29;
      uint64_t v35 = v2[7];
      swift_unknownObjectRelease(*(void *)(v35 + 8 * v27));
      *(void *)(v35 + 8 * v27) = v41;
    }

    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << v26;
    uint64_t v36 = (uint64_t *)(v2[6] + 16 * v26);
    *uint64_t v36 = v21;
    v36[1] = v20;
    *(void *)(v2[7] + 8 * v26) = v25;
    uint64_t v37 = v2[2];
    BOOL v15 = __OFADD__(v37, 1LL);
    uint64_t v38 = v37 + 1;
    if (v15) {
      goto LABEL_37;
    }
    v2[2] = v38;
  }

  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t MetricsContext.isAnonymous.getter(char a1)
{
  return a1 & 1;
}

unint64_t static MetricsContext.== infix(_:_:)(int a1, uint64_t a2, int a3, uint64_t a4)
{
  if (((a1 ^ a3) & 1) != 0) {
    return 0LL;
  }
  unint64_t v4 = (a2 | a4) == 0;
  if (a2 && a4)
  {
    sub_10002E62C();
    sub_10002DEF8(a2);
    id v8 = sub_10002E7D8(v7);
    sub_10002DEF8(a4);
    uint64_t v10 = v9;
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v10);
    unint64_t v4 = (unint64_t)[v8 isEqualToDictionary:isa];
  }

  return v4;
}

unint64_t sub_10002E62C()
{
  unint64_t result = qword_100051790;
  if (!qword_100051790)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSDictionary);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100051790);
  }

  return result;
}

void sub_10002E668(uint64_t a1, char a2)
{
}

uint64_t sub_10002E68C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6D796E6F6E417369LL && a2 == 0xEB0000000073756FLL)
  {
    unint64_t v5 = 0xEB0000000073756FLL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D796E6F6E417369LL, 0xEB0000000073756FLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x79616C7265766FLL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    return 1LL;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x79616C7265766FLL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_10002E790()
{
  return 2LL;
}

uint64_t sub_10002E798(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x79616C7265766FLL;
  }
  else {
    return 0x6D796E6F6E417369LL;
  }
}

id sub_10002E7D8(uint64_t a1)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v5 = [v3 initWithDictionary:isa];

  return v5;
}

unint64_t sub_10002E85C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static MetricsContext.== infix(_:_:)(*a1, *((void *)a1 + 1), *a2, *((void *)a2 + 1));
}

void sub_10002E878(uint64_t a1)
{
}

uint64_t sub_10002E880()
{
  return sub_10002E798(*v0);
}

uint64_t sub_10002E888@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10002E68C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10002E8AC()
{
  return sub_10000D708();
}

uint64_t sub_10002E8C8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = sub_10002E790();
  *a1 = result;
  return result;
}

uint64_t sub_10002E8EC(uint64_t a1)
{
  unint64_t v2 = sub_10002EBAC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10002E914(uint64_t a1)
{
  unint64_t v2 = sub_10002EBAC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t MetricsContext.init(from:)(void *a1)
{
  uint64_t v3 = sub_100006674(&qword_100051798);
  __chkstk_darwin(v3, v4);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_100007060(a1, v5);
  unint64_t v7 = sub_10002EBAC();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for MetricsContext.CodingKeys,  &type metadata for MetricsContext.CodingKeys,  v7,  v5,  v6);
  if (!v1)
  {
    LOBYTE(v18) = 0;
    LOBYTE(__chkstk_darwin(v4, v5) = KeyedDecodingContainer.decode(_:forKey:)(&v18, v3);
    LOBYTE(v17) = 1;
    unint64_t v9 = sub_100023D30();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v18, &type metadata for Data, &v17, v3, &type metadata for Data, v9);
    uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v18 = 0LL;
    id v12 = [v10 JSONObjectWithData:isa options:0 error:&v18];

    id v13 = v18;
    if (v12)
    {
      id v14 = v18;
      _bridgeAnyObjectToAny(_:)(&v18);
      sub_10002F324();
      swift_unknownObjectRelease(v12);
      sub_10002F2BC();
      uint64_t v15 = sub_100006674(&qword_100050270);
      swift_dynamicCast(&v17, &v18, (char *)&type metadata for Any + 8, v15, 6LL);
    }

    else
    {
      uint64_t v5 = (uint64_t)v18;
      _convertNSErrorToError(_:)(v13);

      swift_willThrow(v16);
      sub_10002F324();
      sub_10002F2BC();
    }
  }

  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(a1);
  return v5 & 1;
}

unint64_t sub_10002EBAC()
{
  unint64_t result = qword_1000517A0;
  if (!qword_1000517A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D168, &type metadata for MetricsContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000517A0);
  }

  return result;
}

uint64_t MetricsContext.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100006674(&qword_1000517A8);
  __chkstk_darwin(v7, v8);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100007060(a1, v9);
  unint64_t v11 = sub_10002EBAC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for MetricsContext.CodingKeys,  &type metadata for MetricsContext.CodingKeys,  v11,  v9,  v10);
  LOBYTE(v24[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, v24, v7);
  if (v3 || !a3) {
    return sub_10002F2DC();
  }
  id v13 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v24[0] = 0LL;
  id v15 = [v13 dataWithJSONObject:isa options:0 error:v24];

  id v16 = v24[0];
  if (!v15)
  {
    uint64_t v21 = v16;
    _convertNSErrorToError(_:)(v16);

    swift_willThrow(v22);
    return sub_10002F2DC();
  }

  uint64_t v17 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v15);
  uint64_t v19 = v18;

  v24[0] = v17;
  v24[1] = v19;
  char v23 = 1;
  unint64_t v20 = sub_100023DEC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v24, &v23, v7, &type metadata for Data, v20);
  sub_10002F2DC();
  return sub_100023DA8((uint64_t)v17, (unint64_t)v19);
}

uint64_t sub_10002EDF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = MetricsContext.init(from:)(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result & 1;
    *(void *)(a2 + 8) = v5;
  }

  return result;
}

uint64_t sub_10002EE28(void *a1)
{
  return MetricsContext.encode(to:)(a1, *v1, *((void *)v1 + 1));
}

ValueMetadata *MetricsContext.description.getter(char a1, uint64_t a2)
{
  unint64_t v22 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(45LL);
  uint64_t v21 = &type metadata for MetricsContext;
  uint64_t v4 = sub_100006674(&qword_1000517B0);
  uint64_t v5 = String.init<A>(describing:)(&v21, v4);
  unint64_t v7 = v6;
  swift_bridgeObjectRelease(0xE000000000000000LL);
  uint64_t v21 = (ValueMetadata *)v5;
  unint64_t v22 = v7;
  v8._object = (void *)0x800000010003F5F0LL;
  v8._uint64_t countAndFlagsBits = 0xD000000000000016LL;
  String.append(_:)(v8);
  if ((a1 & 1) != 0) {
    uint64_t v9 = 1702195828LL;
  }
  else {
    uint64_t v9 = 0x65736C6166LL;
  }
  if ((a1 & 1) != 0) {
    unint64_t v10 = 0xE400000000000000LL;
  }
  else {
    unint64_t v10 = 0xE500000000000000LL;
  }
  unint64_t v11 = v10;
  String.append(_:)(*(Swift::String *)&v9);
  swift_bridgeObjectRelease(v10);
  v12._uint64_t countAndFlagsBits = 0x65766F202020200ALL;
  v12._object = (void *)0xEE00203A79616C72LL;
  String.append(_:)(v12);
  if (a2)
  {
    uint64_t v20 = a2;
    sub_10002F2EC();
    uint64_t v13 = sub_100006674(&qword_1000517B8);
    uint64_t v14 = String.init<A>(describing:)(&v20, v13);
    unint64_t v16 = v15;
  }

  else
  {
    unint64_t v16 = 0xE900000000000064LL;
    uint64_t v14 = 0x656E696665646E75LL;
  }

  unint64_t v17 = v16;
  String.append(_:)(*(Swift::String *)&v14);
  swift_bridgeObjectRelease(v16);
  v18._uint64_t countAndFlagsBits = 8194601LL;
  v18._object = (void *)0xE300000000000000LL;
  String.append(_:)(v18);
  return v21;
}

ValueMetadata *sub_10002EFC0()
{
  return MetricsContext.description.getter(*(_BYTE *)v0, *(void *)(v0 + 8));
}

uint64_t initializeBufferWithCopyOfBuffer for MetricsContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for MetricsContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t assignWithTake for MetricsContext(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricsContext(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }

    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricsContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MetricsContext()
{
  return &type metadata for MetricsContext;
}

uint64_t storeEnumTagSinglePayload for MetricsContext.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(__chkstk_darwin(v3, v4) = 1;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_10002F178 + 4 * byte_10003CFE5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10002F1AC + 4 * byte_10003CFE0[v4]))();
}

uint64_t sub_10002F1AC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002F1B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10002F1BCLL);
  }
  return result;
}

uint64_t sub_10002F1C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10002F1D0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10002F1D4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002F1DC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MetricsContext.CodingKeys()
{
  return &type metadata for MetricsContext.CodingKeys;
}

unint64_t sub_10002F1FC()
{
  unint64_t result = qword_1000517C0;
  if (!qword_1000517C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D140, &type metadata for MetricsContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000517C0);
  }

  return result;
}

unint64_t sub_10002F23C()
{
  unint64_t result = qword_1000517C8;
  if (!qword_1000517C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D0B0, &type metadata for MetricsContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000517C8);
  }

  return result;
}

unint64_t sub_10002F27C()
{
  unint64_t result = qword_1000517D0;
  if (!qword_1000517D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D0D8, &type metadata for MetricsContext.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000517D0);
  }

  return result;
}

uint64_t sub_10002F2BC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_10002F2CC()
{
  return static _DictionaryStorage.allocate(capacity:)(v0);
}

uint64_t sub_10002F2DC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_10002F2EC()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_10002F324()
{
  return sub_100023DA8(*(void *)(v1 - 136), v0);
}

id sub_10002F330(uint64_t a1)
{
  uint64_t v2 = v1;
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = sub_100006674(&qword_1000502A8);
  uint64_t inited = swift_initStackObject(v5, v40);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_10003D1C0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = 0x726F727245534ALL;
  *(void *)(inited + 56) = 0xE700000000000000LL;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedFailureReasonErrorKey);
  *(void *)(inited + 80) = v8;
  *(void *)(inited + 88) = v9;
  uint64_t v10 = JSError.message.getter(v8);
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x6E6D756C6F43LL;
  *(void *)(inited + 136) = 0xE600000000000000LL;
  Swift::String v12 = (_OWORD *)JSError.column.getter(v10);
  if ((v19 & 1) != 0)
  {
    *(void *)(inited + 168) = &type metadata for String;
    *(void *)(inited + 144) = 0x6E776F6E6B6E75LL;
    *(void *)(inited + 152) = 0xE700000000000000LL;
  }

  else
  {
    Swift::String v12 = sub_10002F5C0((uint64_t)v12, (_OWORD *)(inited + 144), v13, v14, v15, v16, v17, v18, v37, v38, v39);
  }

  *(void *)(inited + 176) = 1701734732LL;
  *(void *)(inited + 184) = 0xE400000000000000LL;
  uint64_t v20 = (_OWORD *)JSError.line.getter(v12);
  if ((v27 & 1) != 0)
  {
    *(void *)(inited + 2swift_weakDestroy(v0 + 16) = &type metadata for String;
    *(void *)(inited + 192) = 0x6E776F6E6B6E75LL;
    *(void *)(inited + 200) = 0xE700000000000000LL;
  }

  else
  {
    uint64_t v20 = sub_10002F5C0((uint64_t)v20, (_OWORD *)(inited + 192), v21, v22, v23, v24, v25, v26, v37, v38, v39);
  }

  *(void *)(inited + 224) = 0x5520656372756F53LL;
  *(void *)(inited + 232) = 0xEA00000000004C52LL;
  uint64_t v28 = JSError.sourceURL.getter(v20);
  *(void *)(inited + 264) = &type metadata for String;
  if (v29) {
    uint64_t v30 = v28;
  }
  else {
    uint64_t v30 = 0x6E776F6E6B6E75LL;
  }
  unint64_t v31 = 0xE700000000000000LL;
  if (v29) {
    unint64_t v31 = v29;
  }
  *(void *)(inited + 240) = v30;
  *(void *)(inited + 248) = v31;
  id v32 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  uint64_t v33 = Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v34 = sub_10002F530((uint64_t)v4, 0LL, v33, v32);

  uint64_t v35 = type metadata accessor for JSError(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8LL))(a1, v35);
  return v34;
}

id sub_10002F530(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  id v9 = [a4 initWithDomain:a1 code:a2 userInfo:isa];

  return v9;
}

_OWORD *sub_10002F5C0( uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11)
{
  a11 = v11;
  *(void *)&a9 = a1;
  return sub_10000750C(&a9, a2);
}

uint64_t sub_10002F5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002F620(a1, a2, a3);
}

uint64_t sub_10002F620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for DependencyDictionary(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v3 + qword_1000517E8) = 0LL;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a3, v7);
  uint64_t v12 = BaseObjectGraph.init(name:dependencies:)(a1, a2, v11);
  unint64_t v13 = sub_10002732C();
  swift_retain(v12);
  BaseObjectGraph.optional<A>(_:)(&v17, v13, v13);
  swift_release(v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a3, v7);
  uint64_t v14 = *(void **)(v12 + qword_1000517E8);
  *(void *)(v12 + qword_1000517E8) = v17;

  return v12;
}

void sub_10002F724()
{
}

uint64_t ObjectGraph.deinit()
{
  uint64_t v0 = BaseObjectGraph.deinit();

  return v0;
}

uint64_t ObjectGraph.__deallocating_deinit()
{
  uint64_t v0 = BaseObjectGraph.deinit();

  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for ObjectGraph(uint64_t a1)
{
  uint64_t result = qword_1000517F0;
  if (!qword_1000517F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ObjectGraph);
  }
  return result;
}

uint64_t sub_10002F7DC(uint64_t a1)
{
  uint64_t v2 = "\b";
  return swift_initClassMetadata2(a1, 0LL, 1LL, &v2, a1 + class metadata base offset for ObjectGraph);
}

uint64_t sub_10002F824()
{
  return type metadata accessor for ObjectGraph(0LL);
}

uint64_t sub_10002F82C(uint64_t a1, uint64_t a2, char a3)
{
  v30[0] = a2;
  v30[1] = a1;
  uint64_t v6 = type metadata accessor for JetPackFileStreamSource(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DiskJetPackLoader(0LL);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  __chkstk_darwin(v11, v12);
  sub_10002483C();
  uint64_t v13 = type metadata accessor for JetPackSigningPolicy(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  uint64_t v18 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v16, v19);
  uint64_t v21 = (char *)v30 - v20;
  static DiskJetPackResourceBundle.cleanUpOldSessions(baseURL:)(a2);
  uint64_t v22 = (unsigned int *)&enum case for JetPackSigningPolicy.required(_:);
  if ((a3 & 1) == 0) {
    uint64_t v22 = (unsigned int *)&enum case for JetPackSigningPolicy.ignore(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v21, *v22, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v18, v21, v13);
  uint64_t v35 = type metadata accessor for JetPackManagedKeyProvider(0LL);
  uint64_t v36 = &protocol witness table for JetPackManagedKeyProvider;
  sub_100007678(v34);
  JetPackManagedKeyProvider.init()();
  uint64_t v23 = DiskJetPackLoader.init(signingPolicy:keyProvider:)(v18, v34);
  uint64_t v24 = URL.path.getter(v23);
  JetPackFileStreamSource.init(path:)(v24);
  uint64_t v35 = v6;
  uint64_t v36 = &protocol witness table for JetPackFileStreamSource;
  uint64_t v25 = sub_100007678(v34);
  uint64_t v26 = (*(uint64_t (**)(void *, char *, uint64_t))(v7 + 16))(v25, v10, v6);
  uint64_t v27 = static DiskJetPackLoader.sharedUnpackQueue.getter(v26);
  v33[3] = sub_10002B7D0();
  v33[4] = &protocol witness table for OS_dispatch_queue;
  v33[0] = v27;
  uint64_t v28 = DiskJetPackLoader.bundle(from:baseURL:automaticallyCleanUp:on:)(v34, v30[0], 1LL, v33);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v33);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v3, v32);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v34);
  return v28;
}

uint64_t sub_10002FA5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t result = DiskJetPackResourceBundle.fileData(atPath:)(a1);
  if (!v3)
  {
    if (v7 >> 60 == 15)
    {
      swift_willThrow(result);
      return swift_errorRetain(a2);
    }

    else
    {
      *a3 = result;
      a3[1] = v7;
    }
  }

  return result;
}

uint64_t sub_10002FABC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JetPackPath(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  sub_10002483C();
  uint64_t v7 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = sub_100007438((uint64_t)v10, 1LL, 1LL, v11);
  static JetPackPath.sourcePath.getter(v12);
  DiskJetPackResourceBundle.memoryMappedSource(atPath:virtualMachine:cacheURL:)(v2, a2, v10);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  return sub_10000B8C8((uint64_t)v10);
}

id sub_10002FBBC()
{
  uint64_t v0 = (void *)_convertErrorToNSError(_:)();
  id v1 = objc_msgSend(v0, "ams_sanitizedForSecureCoding");

  return v1;
}

uint64_t sub_10002FBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v76 = (void *)a3;
  uint64_t v74 = a2;
  uint64_t v78 = a1;
  uint64_t v5 = sub_10000F6B0();
  uint64_t v80 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v6);
  uint64_t v77 = v7;
  uint64_t v79 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v75 = sub_10001ACA8();
  uint64_t v73 = *(void *)(v75 - 8);
  __chkstk_darwin(v75, v8);
  uint64_t v72 = v9;
  uint64_t v10 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v16 = type metadata accessor for LogMessage(0LL);
  uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v16 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v82 = type metadata accessor for RemoteJavaScriptLoader();
  v81[0] = v4;
  uint64_t v18 = swift_retain(v4);
  id v19 = (id)AMSLogKey(v18);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    uint64_t v23 = v22;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    uint64_t v24 = v82;
    uint64_t v25 = sub_100007060(v81, v82);
    uint64_t DynamicType = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    uint64_t v84 = DynamicType;
    sub_10000D5D4();
    sub_100013C84();
    v27._uint64_t countAndFlagsBits = 5972026LL;
    v27._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v84 = v21;
    uint64_t v85 = v23;
    sub_10000D5D4();
    sub_100013C84();
    uint64_t v28 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    uint64_t v29 = v82;
    uint64_t v30 = sub_100007060(v81, v82);
    uint64_t v31 = swift_getDynamicType(v30, v29, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v31);
    uint64_t v84 = v31;
    sub_10000D5D4();
    sub_100013C84();
    uint64_t v28 = 58LL;
  }

  unint64_t v32 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
  LogMessage.init(stringInterpolation:)(v14);
  type metadata accessor for Log();
  sub_1000169C8();
  LogMessage.init(stringLiteral:)(0xD00000000000001FLL, 0x800000010003F6C0LL);
  uint64_t v82 = v5;
  uint64_t v33 = (char *)sub_100030690();
  uint64_t v34 = v80;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 16);
  uint64_t v69 = v5;
  uint64_t v70 = v35;
  uint64_t v36 = v5;
  uint64_t v37 = v78;
  v35(v33, v78, v36);
  static LogMessage.safe(_:)(v81);
  sub_100008D04((uint64_t)v81);
  sub_10002C300(v17);
  swift_bridgeObjectRelease(v17);
  uint64_t v38 = v74;
  uint64_t v39 = v76;
  id v40 = sub_1000271E0(v74, (uint64_t)v76);
  id v71 = v40;
  sub_100006674(&qword_100050DE0);
  URL._bridgeToObjectiveC()(v41);
  uint64_t v43 = v42;
  id v44 = [v40 requestWithMethod:2 URL:v42 parameters:0];

  uint64_t v45 = Promise<A>.init(_:)(v44);
  uint64_t v46 = v73;
  uint64_t v47 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v10, v38, v75);
  uint64_t v48 = *(unsigned __int8 *)(v46 + 80);
  uint64_t v49 = (v48 + 16) & ~v48;
  unint64_t v50 = (v72 + v49 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v51 = swift_allocObject(&unk_10004AF38, v50 + 8, v48 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 32))(v51 + v49, v10, v47);
  *(void *)(v51 + v50) = v39;
  uint64_t v52 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v82 = v52;
  uint64_t v83 = &protocol witness table for SyncTaskScheduler;
  sub_100030690();
  SyncTaskScheduler.init()(v39);
  uint64_t v53 = sub_100006674(&qword_100050D48);
  uint64_t v54 = sub_10003051C(&qword_1000518E0, &qword_100050D48);
  uint64_t v55 = Promise.flatMap<A>(on:_:)(v81, sub_100030460, v51, v53, v54);
  swift_release(v45);
  swift_release(v51);
  sub_1000169C8();
  uint64_t v56 = v79;
  uint64_t v57 = v37;
  uint64_t v58 = v69;
  v70(v79, v57, v69);
  uint64_t v59 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v60 = (v59 + 16) & ~v59;
  uint64_t v61 = swift_allocObject(&unk_10004AF60, v60 + v77, v59 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v61 + v60, v56, v58);
  uint64_t v82 = v52;
  uint64_t v83 = &protocol witness table for SyncTaskScheduler;
  uint64_t v62 = sub_100030690();
  SyncTaskScheduler.init()(v62);
  uint64_t v63 = sub_100006674(&qword_1000518E8);
  uint64_t v64 = sub_10003051C(&qword_1000518F0, &qword_1000518E8);
  uint64_t v65 = Promise.flatMap<A>(on:_:)(v81, sub_1000304E4, v61, v63, v64);
  swift_release(v55);
  swift_release(v61);
  sub_1000169C8();
  uint64_t v82 = v52;
  uint64_t v83 = &protocol witness table for SyncTaskScheduler;
  id v66 = sub_100030690();
  SyncTaskScheduler.init()(v66);
  uint64_t v67 = Promise.map<A>(on:_:)(v81, sub_100030368, 0LL, &type metadata for JSSourcePackage);

  swift_release(v65);
  sub_1000169C8();
  return v67;
}

uint64_t sub_100030148(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  id v4 = sub_10002726C(a2, a3);
  sub_100006674(&qword_100050D48);
  uint64_t v5 = Promise<A>.init(_:)([v4 dataTaskPromiseWithRequest:v3]);

  return v5;
}

uint64_t sub_1000301B8(id *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_1000505B8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v25[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v25[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v12 = [*a1 data];
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v12);
  unint64_t v15 = v14;

  static String.Encoding.utf8.getter(v16);
  uint64_t v17 = String.init(data:encoding:)(v13, v15, v11);
  uint64_t v19 = v18;
  sub_100023DA8(v13, v15);
  sub_100006674(&qword_1000518E8);
  if (v19)
  {
    uint64_t v20 = type metadata accessor for URL(0LL);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16LL))(v7, a2, v20);
    sub_100007438((uint64_t)v7, 0LL, 1LL, v20);
    v25[3] = type metadata accessor for JSSource(0LL);
    v25[4] = &protocol witness table for JSSource;
    sub_100007678(v25);
    JSSource.init(code:sourceURL:)(v17, v19, v7);
    return Promise.__allocating_init(value:)(v25);
  }

  else
  {
    unint64_t v22 = sub_10003055C();
    uint64_t v23 = swift_allocError(&type metadata for RemoteJavaScriptLoader.LoadError, v22, 0LL, 0LL);
    return Promise.__allocating_init(error:)(v23);
  }

uint64_t sub_100030368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = Dictionary.init(dictionaryLiteral:)( _swiftEmptyArrayStorage,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  uint64_t result = sub_10000D2D0(a1, a2);
  *(void *)(a2 + 40) = v4;
  return result;
}

uint64_t type metadata accessor for RemoteJavaScriptLoader()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService22RemoteJavaScriptLoader);
}

uint64_t sub_1000303F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10002FBFC(a1, a2, a3);
}

uint64_t sub_100030414()
{
  uint64_t v2 = v1 | 7;
  unint64_t v5 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  sub_10000F6A4(v6);

  return sub_10000F61C(v0, v5 + 8, v2);
}

uint64_t sub_100030460(uint64_t *a1)
{
  uint64_t v3 = *(void *)(sub_10001ACA8() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100030148(a1, v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_1000304AC()
{
  uint64_t v3 = v1 + v2;
  uint64_t v5 = v4 | 7;
  sub_10000F6A4(v6);
  return sub_10000F61C(v0, v3, v5);
}

uint64_t sub_1000304E4(id *a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_10000F6B0() - 8) + 80LL);
  return sub_1000301B8(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_10003051C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_10000D01C(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v4);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10003055C()
{
  unint64_t result = qword_1000518F8;
  if (!qword_1000518F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D2AC, &type metadata for RemoteJavaScriptLoader.LoadError);
    atomic_store(result, (unint64_t *)&qword_1000518F8);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for RemoteJavaScriptLoader.LoadError(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_1000305D8 + 4 * byte_10003D200[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000305F8 + 4 * byte_10003D205[v4]))();
  }
}

_BYTE *sub_1000305D8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000305F8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100030600(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100030608(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_100030610(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_100030618(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RemoteJavaScriptLoader.LoadError()
{
  return &type metadata for RemoteJavaScriptLoader.LoadError;
}

unint64_t sub_100030638()
{
  unint64_t result = qword_100051900;
  if (!qword_100051900)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D284, &type metadata for RemoteJavaScriptLoader.LoadError);
    atomic_store(result, (unint64_t *)&qword_100051900);
  }

  return result;
}

  ;
}

void *sub_100030690()
{
  return sub_100007678((void *)(v0 - 160));
}

uint64_t sub_100030698( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + swift_weakDestroy(v0 + 16) = a1;
  uint64_t v16 = v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
  uint64_t v17 = sub_10001ACA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32LL))(v16, a2, v17);
  *(void *)(v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_clientInfo) = a3;
  uint64_t v18 = (void *)(v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient);
  *uint64_t v18 = a4;
  v18[1] = a5;
  uint64_t v19 = v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext;
  *(_BYTE *)uint64_t v19 = a6;
  *(void *)(v19 + 8) = a7;
  uint64_t v20 = v8 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_url;
  uint64_t v21 = sub_10000F6B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32LL))(v20, a8, v21);
  return v8;
}

uint64_t sub_100030774()
{
  uint64_t v0 = v10;
  uint64_t v1 = v11;
  sub_100007060(v9, v10);
  uint64_t v2 = dispatch thunk of AsyncObjectGraphBuilder.makeObjectGraph()(v0, v1);
  v8[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v8[4] = &protocol witness table for SyncTaskScheduler;
  int v3 = sub_100007678(v8);
  SyncTaskScheduler.init()(v3);
  uint64_t v4 = type metadata accessor for BaseObjectGraph(0LL);
  uint64_t v5 = Promise.map<A>(on:_:)(v8, sub_1000308C4, 0LL, v4);
  uint64_t v6 = swift_release(v2);
  sub_1000313EC(v6);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v12);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v13);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v14);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v9);
  return v5;
}

uint64_t sub_100030864(uint64_t a1)
{
  uint64_t v2 = swift_retain(a1);
  uint64_t v3 = BaseObjectGraph.__allocating_init(_:)(v2);
  swift_retain(v3);
  dispatch thunk of BaseObjectGraph.name.setter(0x65636976726553LL, 0xE700000000000000LL);
  swift_release(v3);
  return v3;
}

uint64_t sub_1000308C4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100030864(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000308F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for BaseBootstrap(0LL);
  uint64_t v4 = __chkstk_darwin(v2, v3);
  uint64_t v6 = (void *)((char *)&v27[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v7 = *(void **)(v1 + 16);
  uint64_t v8 = v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
  uint64_t v9 = (char *)v6 + *(int *)(v4 + 20);
  uint64_t v10 = sub_10001ACA8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v9, v8, v10);
  uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_clientInfo);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient);
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient + 8);
  *uint64_t v6 = v7;
  *(void *)((char *)v6 + *(int *)(v2 + swift_release(*(void *)(v0 + 24)) = v11;
  unint64_t v14 = (void *)((char *)v6 + *(int *)(v2 + 28));
  *unint64_t v14 = v12;
  v14[1] = v13;
  id v15 = v7;
  id v16 = v11;
  swift_bridgeObjectRetain(v13);
  uint64_t v17 = sub_10000778C();
  uint64_t v18 = sub_100031378((uint64_t)v6);
  Promise<A>.withDependenciesSatisfied.getter(v29, v18);
  swift_release(v17);
  uint64_t v19 = v29[3];
  uint64_t v20 = v29[4];
  sub_1000086FC(v29);
  uint64_t v21 = *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext + 8);
  LOBYTE(v27[0]) = *(_BYTE *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext);
  v27[1] = v21;
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)( &type metadata for MetricsContext,  v27,  v19,  &type metadata for MetricsContext,  v20);
  uint64_t v22 = v28[3];
  uint64_t v23 = v28[4];
  sub_1000086FC(v28);
  uint64_t v24 = sub_10000F6B0();
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)( v24,  v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_url,  v22,  v24,  v23);
  sub_1000313B4(v27);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v27);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v28);
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v29);
}

uint64_t sub_100030AB4(void *a1)
{
  uint64_t v3 = type metadata accessor for ServiceRequestHandler();
  uint64_t v4 = swift_allocObject(v3, 16LL, 7LL);
  uint64_t v7 = v4;
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v3, &v7, v1, v3, v2);
  swift_release(v4);
  uint64_t v5 = sub_1000313B4(v8);
  return sub_1000313EC(v5);
}

uint64_t sub_100030B3C(void *a1)
{
  uint64_t v3 = type metadata accessor for URLSessionHandler();
  AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v6, v3, sub_100030BA0, 0LL, v1, v3, v2);
  uint64_t v4 = sub_1000313B4(v6);
  return sub_1000313EC(v4);
}

void sub_100030BA0(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (objc_class *)type metadata accessor for URLSessionHandler();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService17URLSessionHandler_objectGraph] = a1;
  v11.receiver = v5;
  v11.super_class = v4;
  swift_retain(a1);
  id v6 = objc_msgSendSuper2(&v11, "init");
  uint64_t v7 = sub_100007498(0LL, (unint64_t *)&qword_1000503C0, &OBJC_CLASS___AMSURLSession_ptr);
  uint64_t v8 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v7, a1, v7, v8);
  uint64_t v9 = v12;
  id v10 = v6;
  objc_msgSend(v9, "setDelegate:", v10, v11.receiver, v11.super_class);

  *a2 = v10;
}

id sub_100030C88@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v38 = a2;
  uint64_t v37 = sub_10001ACA8();
  uint64_t v36 = *(void *)(v37 - 8);
  uint64_t v5 = *(void *)(v36 + 64);
  __chkstk_darwin(v37, v6);
  uint64_t v35 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_10000F6B0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7, v10);
  objc_super v11 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = a1[3];
  uint64_t v12 = a1[4];
  sub_1000086FC(a1);
  id result = [objc_allocWithZone(JSVirtualMachine) init];
  if (result)
  {
    id v15 = result;
    uint64_t v16 = sub_100007498(0LL, &qword_1000506B8, &OBJC_CLASS___JSVirtualMachine_ptr);
    v44[0] = v15;
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v16, v44, v13, v16, v12);

    sub_100007060(v47, v47[3]);
    sub_1000313DC();
    uint64_t v33 = v45;
    uint64_t v34 = v46;
    v32[1] = sub_100007060(v44, v45);
    uint64_t v17 = v3 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_bag;
    v32[0] = *(void *)(v3 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_clientInfo);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))( (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v3 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_url,  v7);
    uint64_t v18 = v36;
    uint64_t v19 = v35;
    uint64_t v20 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v35, v17, v37);
    uint64_t v21 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v22 = (v21 + 16) & ~v21;
    uint64_t v23 = *(unsigned __int8 *)(v18 + 80);
    uint64_t v24 = (v9 + v23 + v22) & ~v23;
    unint64_t v25 = (v5 + v24 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v26 = swift_allocObject(&unk_10004B080, v25 + 8, v21 | v23 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v26 + v22, v11, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v26 + v24, v19, v20);
    Swift::String v27 = (void *)v32[0];
    *(void *)(v26 + v25) = v32[0];
    id v28 = v27;
    dispatch thunk of AsyncObjectGraphBuilder.satisfying<A>(_:with:)( v43,  &type metadata for JSSourcePackage,  sub_100031304,  v26,  &type metadata for JSSourcePackage,  v33,  v34);
    swift_release(v26);
    sub_100007060(v43, v43[3]);
    sub_1000313DC();
    uint64_t v29 = v41;
    uint64_t v30 = v42;
    sub_100007060(v40, v41);
    uint64_t v31 = type metadata accessor for JSDataProvider();
    AsyncObjectGraphBuilder.satisfying<A>(_:with:)(v39, v31, sub_100031058, 0LL, v29, v31, v30);
    sub_100007060(v39, v39[3]);
    sub_1000313DC();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v39);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v40);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v43);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v44);
    return (id)_s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v47);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_100030FE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for JSSourceLoader();
  uint64_t v9 = swift_allocObject(v8, 16LL, 7LL);
  uint64_t v10 = sub_100026AF8(a2, a3, a4, a1);
  swift_release(v9);
  return v10;
}

uint64_t sub_100031058@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for JSDataProvider();
  swift_allocObject(v5, 24LL, 7LL);
  uint64_t v6 = swift_retain(a1);
  uint64_t result = sub_100014070(v6);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1000310B8()
{
  uint64_t v1 = sub_10001ACA8();
  sub_100024828(v1);

  sub_100031418(OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_mediaClient);
  sub_100031418(OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService16ServiceBootstrap_metricsContext);
  uint64_t v2 = sub_10000F6B0();
  sub_100024828(v2);
  return v0;
}

uint64_t sub_10003112C()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100031150()
{
  return type metadata accessor for ServiceBootstrap(0LL);
}

uint64_t type metadata accessor for ServiceBootstrap(uint64_t a1)
{
  uint64_t result = qword_100051958;
  if (!qword_100051958) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceBootstrap);
  }
  return result;
}

uint64_t sub_100031190(uint64_t a1)
{
  v5[0] = "\b";
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v5[1] = *(void *)(result - 8) + 64LL;
    void v5[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v5[3] = &unk_10003D330;
    v5[4] = &unk_10003D348;
    uint64_t result = type metadata accessor for URL(319LL);
    if (v4 <= 0x3F)
    {
      v5[5] = *(void *)(result - 8) + 64LL;
      uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v5, a1 + 80);
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_100031244()
{
  uint64_t v1 = sub_10000F6B0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_10001ACA8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v3 | v8 | 7;
  unint64_t v11 = (*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return swift_deallocObject(v0, v11 + 8, v10);
}

uint64_t sub_100031304(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10000F6B0() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(sub_10001ACA8() - 8);
  unint64_t v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return sub_100030FE0(a1, v1 + v4, v1 + v7, *(void **)(v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_100031378(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BaseBootstrap(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000313B4(void *a1)
{
  return AsyncObjectGraphBuilder.withDependenciesSatisfied.getter(v1, v2);
}

uint64_t sub_1000313DC()
{
  return AsyncObjectGraphBuilder.withDependenciesSatisfied.getter(v0, v1);
}

uint64_t sub_1000313EC(uint64_t a1, ...)
{
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((uint64_t *)va);
}

uint64_t sub_1000313F4(void *a1)
{
  return 0LL;
}

uint64_t sub_100031418@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(void *)(v1 + a1 + 8));
}

void *sub_100031424()
{
  uint64_t v0 = type metadata accessor for ServiceConnection();
  uint64_t v1 = swift_allocObject(v0, 40LL, 7LL);
  uint64_t result = sub_100032138();
  qword_100054C90 = v1;
  return result;
}

uint64_t sub_10003145C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (!v1) {
    return 0LL;
  }
  aBlock[4] = sub_100032614;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000317FC;
  void aBlock[3] = &unk_10004B110;
  uint64_t v2 = _Block_copy(aBlock);
  uint64_t v3 = aBlock[5];
  id v4 = v1;
  swift_retain(v0);
  swift_release(v3);
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v2];
  _Block_release(v2);

  _bridgeAnyObjectToAny(_:)(aBlock);
  swift_unknownObjectRelease(v5);
  uint64_t v6 = sub_100006674(&qword_100051BC8);
  else {
    return 0LL;
  }
}

uint64_t sub_10003156C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  unint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v9 = type metadata accessor for LogMessage(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + 3LL * *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v37 = type metadata accessor for ServiceConnection();
  v36[0] = a2;
  uint64_t v11 = swift_retain(a2);
  id v12 = (id)AMSLogKey(v11);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v16 = v15;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v17._uint64_t countAndFlagsBits = 0LL;
    v17._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v17);
    uint64_t v18 = v37;
    uint64_t v19 = sub_100007060(v36, v37);
    uint64_t DynamicType = swift_getDynamicType(v19, v18, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v34[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_100008D04((uint64_t)v34);
    v21._uint64_t countAndFlagsBits = 5972026LL;
    v21._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t MetatypeMetadata = &type metadata for String;
    v34[0] = v14;
    v34[1] = v16;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_100008D04((uint64_t)v34);
    uint64_t v22 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v23._uint64_t countAndFlagsBits = 0LL;
    v23._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t v24 = v37;
    unint64_t v25 = sub_100007060(v36, v37);
    uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v26);
    v34[0] = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
    sub_100008D04((uint64_t)v34);
    uint64_t v22 = 58LL;
  }

  unint64_t v27 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
  LogMessage.init(stringInterpolation:)(v7);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v36);
  LogMessage.init(stringLiteral:)(0xD000000000000028LL, 0x800000010003F8D0LL);
  swift_getErrorValue(a1);
  uint64_t v28 = v32;
  uint64_t v29 = v33;
  uint64_t v37 = v33;
  uint64_t v30 = sub_100007678(v36);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16LL))(v30, v28, v29);
  static LogMessage.safe(_:)(v36);
  sub_100008D04((uint64_t)v36);
  sub_10002C320(v10);
  return swift_bridgeObjectRelease(v10);
}

void sub_1000317FC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  v4();
  swift_release(v3);
}

uint64_t sub_10003184C(void **a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  sub_100008DFC();
  uint64_t v6 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v7 = type metadata accessor for LogMessage(0LL);
  uint64_t v8 = swift_allocObject( v6,  ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL))
       + 3LL * *(void *)(*(void *)(v7 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v8 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v38 = type metadata accessor for ServiceConnection();
  uint64_t v36 = (void **)v1;
  uint64_t v9 = swift_retain(v1);
  id v10 = (id)AMSLogKey(v9);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    uint64_t v14 = v13;

    sub_100008DDC();
    sub_100008D80();
    uint64_t v15 = v38;
    uint64_t v16 = sub_100007060(&v36, v38);
    uint64_t v17 = sub_100008D9C((uint64_t)v16, v15);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v17);
    uint64_t v41 = v17;
    sub_100032640();
    sub_100032638();
    sub_100008DBC();
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v41 = v12;
    uint64_t v42 = v14;
    sub_100032640();
    sub_100032638();
    uint64_t v18 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    uint64_t v19 = v38;
    uint64_t v20 = sub_100007060(&v36, v38);
    uint64_t v21 = sub_100008D9C((uint64_t)v20, v19);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v21);
    uint64_t v41 = v21;
    sub_100032640();
    sub_100032638();
    uint64_t v18 = 58LL;
  }

  unint64_t v22 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v18);
  sub_10003262C();
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v36);
  LogMessage.init(stringLiteral:)(0xD000000000000028LL, 0x800000010003F840LL);
  uint64_t v38 = sub_10003258C();
  uint64_t v36 = a1;
  Swift::String v23 = a1;
  static LogMessage.safe(_:)(&v36);
  sub_100008D04((uint64_t)&v36);
  sub_10002C300(v8);
  swift_bridgeObjectRelease(v8);
  uint64_t v24 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = v23;
  unint64_t v25 = v23;

  uint64_t v26 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCInterface);
  id v27 =  [v26 interfaceWithProtocol:&OBJC_PROTOCOL____TtP34AppleMediaServicesUIDynamicService24ClientConnectionProtocol_];
  [v25 setRemoteObjectInterface:v27];
  id v28 =  [v26 interfaceWithProtocol:&OBJC_PROTOCOL____TtP34AppleMediaServicesUIDynamicService25ServiceConnectionProtocol_];
  [v25 setExportedInterface:v28];
  uint64_t v29 = swift_allocObject(&unk_10004B0A8, 24LL, 7LL);
  swift_weakInit(v29 + 16, v2);
  uint64_t v39 = sub_1000325EC;
  uint64_t v40 = v29;
  uint64_t v36 = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256LL;
  uint64_t v30 = sub_100032654((uint64_t)&unk_10004B0C0);
  uint64_t v31 = swift_release(v40);
  sub_100032648(v31, "setInvalidationHandler:");
  _Block_release(v30);
  uint64_t v39 = sub_10003260C;
  uint64_t v40 = v2;
  uint64_t v36 = _NSConcreteStackBlock;
  uint64_t v37 = 1107296256LL;
  uint64_t v32 = sub_100032654((uint64_t)&unk_10004B0E8);
  uint64_t v33 = v40;
  swift_retain(v2);
  uint64_t v34 = swift_release(v33);
  sub_100032648(v34, "setInterruptionHandler:");
  _Block_release(v32);
  [v25 setExportedObject:*(void *)(v2 + 16)];
  [v25 resume];

  return 1LL;
}

void sub_100031BEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v30[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v34, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v7 = Strong;
    uint64_t v8 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v9 = type metadata accessor for LogMessage(0LL);
    uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v9 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
    uint64_t v33 = type metadata accessor for ServiceConnection();
    v32[0] = v7;
    uint64_t v11 = swift_retain(v7);
    id v12 = (id)AMSLogKey(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      uint64_t v16 = v15;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v17._uint64_t countAndFlagsBits = 0LL;
      v17._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      uint64_t v18 = v33;
      uint64_t v19 = sub_100007060(v32, v33);
      uint64_t DynamicType = swift_getDynamicType(v19, v18, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
      v30[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
      sub_100008D04((uint64_t)v30);
      v21._uint64_t countAndFlagsBits = 5972026LL;
      v21._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      uint64_t MetatypeMetadata = &type metadata for String;
      v30[0] = v14;
      v30[1] = v16;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
      sub_100008D04((uint64_t)v30);
      uint64_t v22 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v23._uint64_t countAndFlagsBits = 0LL;
      v23._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v23);
      uint64_t v24 = v33;
      unint64_t v25 = sub_100007060(v32, v33);
      uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v26);
      v30[0] = v26;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
      sub_100008D04((uint64_t)v30);
      uint64_t v22 = 58LL;
    }

    unint64_t v27 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
    LogMessage.init(stringInterpolation:)(v5);
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v32);
    LogMessage.init(stringLiteral:)(0xD000000000000016LL, 0x800000010003F890LL);
    sub_10002C300(v10);
    swift_bridgeObjectRelease(v10);
    id v28 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0LL;
    swift_release(v7);
  }

uint64_t sub_100031E64(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100031E90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v7 = type metadata accessor for LogMessage(0LL);
  uint64_t v8 = swift_allocObject( v6,  ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL))
       + 2LL * *(void *)(*(void *)(v7 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v8 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v30 = type metadata accessor for ServiceConnection();
  v29[0] = a1;
  uint64_t v9 = swift_retain(a1);
  id v10 = (id)AMSLogKey(v9);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    uint64_t v14 = v13;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v15._uint64_t countAndFlagsBits = 0LL;
    v15._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v15);
    uint64_t v16 = v30;
    Swift::String v17 = sub_100007060(v29, v30);
    uint64_t DynamicType = swift_getDynamicType(v17, v16, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v27[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
    sub_100008D04((uint64_t)v27);
    v19._uint64_t countAndFlagsBits = 5972026LL;
    v19._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v19);
    uint64_t MetatypeMetadata = &type metadata for String;
    v27[0] = v12;
    v27[1] = v14;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
    sub_100008D04((uint64_t)v27);
    uint64_t v20 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v21._uint64_t countAndFlagsBits = 0LL;
    v21._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t v22 = v30;
    Swift::String v23 = sub_100007060(v29, v30);
    uint64_t v24 = swift_getDynamicType(v23, v22, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v24);
    v27[0] = v24;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
    sub_100008D04((uint64_t)v27);
    uint64_t v20 = 58LL;
  }

  unint64_t v25 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v20);
  LogMessage.init(stringInterpolation:)(v5);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v29);
  LogMessage.init(stringLiteral:)(0xD000000000000016LL, 0x800000010003F870LL);
  sub_10002C300(v8);
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_1000320CC()
{
  return v0;
}

uint64_t sub_1000320F8()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for ServiceConnection()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService17ServiceConnection);
}

void *sub_100032138()
{
  uint64_t v1 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  uint64_t v2 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = 0LL;
  uint64_t v3 = v2 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObject_serviceOptions;
  uint64_t v4 = type metadata accessor for ServiceOptions(0LL);
  sub_100007438(v3, 1LL, 1LL, v4);
  v0[3] = 0LL;
  v0[4] = 0LL;
  v0[2] = v2;
  return v0;
}

id sub_1000321A8()
{
  *(void *)&v0[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener] = 0LL;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceConnection();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100032204()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for XPCServiceConnection()) init];
  qword_100054C98 = (uint64_t)result;
  return result;
}

void sub_100032230(uint64_t a1)
{
  objc_super v2 = *(void **)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener);
  *(void *)(v1 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener) = a1;
}

void sub_100032244()
{
  uint64_t v1 = OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener;
  if (!*(void *)&v0[OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection_connectionListener])
  {
    uint64_t v2 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v3 = type metadata accessor for LogMessage(0LL);
    uint64_t v4 = swift_allocObject( v2,  ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL))
         + 2LL * *(void *)(*(void *)(v3 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v4 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
    uint64_t v20 = type metadata accessor for XPCServiceConnection();
    v19[0] = v0;
    uint64_t v5 = v0;
    id v6 = (id)AMSLogKey();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

      sub_100008DDC();
      sub_100008D80();
      uint64_t v9 = v20;
      id v10 = sub_100007060(v19, v20);
      sub_100008D9C((uint64_t)v10, v9);
      swift_getMetatypeMetadata();
      sub_100008D8C();
      sub_100008D94();
      sub_100008DBC();
      uint64_t v18 = v8;
      sub_100008D8C();
      sub_100008D94();
      uint64_t v11 = 93LL;
    }

    else
    {
      sub_100008DEC();
      sub_100008D80();
      uint64_t v12 = v20;
      uint64_t v13 = sub_100007060(v19, v20);
      uint64_t v14 = sub_100008D9C((uint64_t)v13, v12);
      swift_getMetatypeMetadata();
      uint64_t v18 = v14;
      sub_100008D8C();
      sub_100008D94();
      uint64_t v11 = 58LL;
    }

    unint64_t v15 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v11);
    sub_10003262C();
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v19);
    LogMessage.init(stringLiteral:)(0xD00000000000001CLL, 0x800000010003F820LL);
    sub_10002C300(v4);
    swift_bridgeObjectRelease(v4);
    id v16 = objc_msgSend((id)objc_opt_self(NSXPCListener), "serviceListener", v18);
    sub_100032230((uint64_t)v16);
    Swift::String v17 = *(void **)&v0[v1];
    if (v17)
    {
      [v17 setDelegate:v5];
      Swift::String v17 = *(void **)&v0[v1];
    }

    [v17 resume];
  }

uint64_t sub_10003247C(uint64_t a1, void **a2)
{
  if (qword_1000501A8 != -1) {
    swift_once(&qword_1000501A8, sub_100031424);
  }
  sub_10003184C(a2);
  return 1LL;
}

id sub_10003252C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCServiceConnection();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for XPCServiceConnection()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService20XPCServiceConnection);
}

unint64_t sub_10003258C()
{
  unint64_t result = qword_100051BC0;
  if (!qword_100051BC0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSXPCConnection);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100051BC0);
  }

  return result;
}

uint64_t sub_1000325C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000325EC()
{
}

uint64_t sub_1000325F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100032604(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10003260C()
{
  return sub_100031E90(v0);
}

uint64_t sub_100032614(uint64_t a1)
{
  return sub_10003156C(a1, v1);
}

uint64_t sub_10003262C()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_100032638()
{
  return sub_100008D04(v0 - 128);
}

uint64_t sub_100032640()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 128);
}

id sub_100032648(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

void *sub_100032654@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 160) = v1;
  *(void *)(v2 - 152) = a1;
  return _Block_copy((const void *)(v2 - 176));
}

uint64_t sub_100032660(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  unint64_t v6 = sub_100037D50();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v8,  &type metadata for MediaClient,  a1,  a2,  &type metadata for MediaClient,  v6);
  return v8;
}

uint64_t sub_100032A04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  unint64_t v6 = sub_100037D14();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v8,  &type metadata for MetricsContext,  a1,  a2,  &type metadata for MetricsContext,  v6);
  return v8;
}

uint64_t sub_100032DA8(uint64_t a1, uint64_t a2)
{
  v3[0] = a1;
  v3[1] = a2;
  return Promise.resolve(_:)(v3);
}

uint64_t sub_100032DD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3();
  Promise.reject(_:)();
  return swift_errorRelease(v3);
}

void sub_100032E14(unsigned __int8 a1)
{
}

void sub_100032E54()
{
}

void sub_100032E6C(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  Hasher._combine(_:)(v2);
  Hasher._finalize()();
  sub_10003836C();
}

uint64_t sub_100032EA4(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v82 = a3;
  uint64_t v84 = a2;
  sub_100006674(&qword_100051D18);
  sub_100024794();
  __chkstk_darwin(v4, v5);
  sub_1000168D8();
  uint64_t v8 = v7 - v6;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  sub_100024794();
  __chkstk_darwin(v9, v10);
  sub_1000168D8();
  sub_100006674(&qword_100051D20);
  sub_100024794();
  __chkstk_darwin(v11, v12);
  sub_1000168D8();
  unint64_t v15 = (void *)(v14 - v13);
  uint64_t v16 = sub_10002488C();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  uint64_t v20 = __chkstk_darwin(v16, v19);
  __chkstk_darwin(v20, v21);
  Swift::String v23 = (void **)((char *)&v77 - v22);
  uint64_t v24 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  JSONDecoder.init()();
  unint64_t v25 = sub_100037D8C();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v15, v16, a1, v84, v16, v25);
  uint64_t v80 = v18;
  uint64_t v81 = v17;
  uint64_t v84 = (char *)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v79 = v8;
  sub_100038354();
  sub_100038340((uint64_t)v15, 0LL);
  sub_10002B2DC((uint64_t)v15, (uint64_t)v23, type metadata accessor for JSServiceRequest);
  uint64_t v26 = type metadata accessor for JSDataProvider();
  uint64_t v27 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v26, v82, v26, v27);
  uint64_t v28 = v88[0];
  uint64_t v89 = &type metadata for DynamicUIFeatureFlags;
  Swift::String v90 = (void *)sub_100037DCC();
  LOBYTE(v26) = isFeatureEnabled(_:)(v88);
  sub_100038338();
  if ((v26 & 1) != 0)
  {
    uint64_t v77 = v23;
    uint64_t v29 = sub_100006674(&qword_100050768);
    uint64_t v30 = Promise.__allocating_init()(v29);
    sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v31 = sub_100038314();
    uint64_t v32 = (__n128 *)sub_100038308( ((*(unsigned __int8 *)(*(void *)(v31 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v31 - 8) + 80LL))
                    + 2LL * *(void *)(*(void *)(v31 - 8) + 72LL),
                      *(unsigned __int8 *)(*(void *)(v31 - 8) + 80LL));
    uint64_t v89 = (ValueMetadata *)sub_100038320(v32, (__n128)xmmword_10003BD40);
    v88[0] = v83;
    uint64_t v33 = swift_retain(v83);
    id v34 = (id)AMSLogKey(v33);
    uint64_t v78 = v28;
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      uint64_t v38 = v37;

      sub_100008DDC();
      sub_100008D80();
      sub_100038290();
      uint64_t v39 = sub_100038394();
      sub_1000382D0(v39);
      sub_1000383A4();
      sub_100008DBC();
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v85 = v36;
      uint64_t v86 = v38;
      sub_1000382EC();
      sub_1000383A4();
      uint64_t v40 = 93LL;
    }

    else
    {
      sub_100008DEC();
      sub_100008D80();
      sub_100038290();
      uint64_t v55 = sub_100038394();
      sub_1000382D0(v55);
      sub_100029634((uint64_t)&v85, (uint64_t *)&unk_1000509C0);
      uint64_t v40 = 58LL;
    }

    uint64_t v56 = (uint64_t)v84;
    uint64_t v58 = v80;
    uint64_t v57 = v81;
    sub_100038378(v40);
    sub_10003835C();
    sub_100038330();
    sub_100038338();
    sub_1000382F4();
    sub_10002C300((uint64_t)v32);
    swift_bridgeObjectRelease(v32);
    uint64_t v59 = type metadata accessor for TaskPriority(0LL);
    uint64_t v60 = v79;
    sub_100007438(v79, 1LL, 1LL, v59);
    uint64_t v61 = (uint64_t)v77;
    sub_10002B308((uint64_t)v77, v56, type metadata accessor for JSServiceRequest);
    uint64_t v62 = *(unsigned __int8 *)(v57 + 80);
    uint64_t v63 = (v62 + 40) & ~v62;
    unint64_t v64 = (v58 + v63 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v65 = v56;
    unint64_t v66 = (v64 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v67 = (v66 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v68 = (void *)swift_allocObject(&unk_10004B350, v67 + 8, v62 | 7);
    v68[2] = 0LL;
    v68[3] = 0LL;
    uint64_t v69 = v78;
    v68[4] = v78;
    sub_10002B2DC(v65, (uint64_t)v68 + v63, type metadata accessor for JSServiceRequest);
    uint64_t v71 = v82;
    uint64_t v70 = v83;
    *(void *)((char *)v68 + v64) = v82;
    *(void *)((char *)v68 + v66) = v70;
    *(void *)((char *)v68 + v67) = v30;
    swift_retain(v70);
    sub_10003838C();
    swift_retain(v71);
    swift_retain(v30);
    uint64_t v72 = sub_100033A98(v60, (uint64_t)&unk_100051D40, (uint64_t)v68);
    swift_release(v72);
    swift_release(v69);
    uint64_t v73 = v61;
  }

  else
  {
    sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v41 = *(void *)(sub_100038314() - 8);
    uint64_t v42 = (__n128 *)sub_100038308( ((*(unsigned __int8 *)(v41 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))
                    + 2LL * *(void *)(v41 + 72),
                      *(unsigned __int8 *)(v41 + 80));
    uint64_t v89 = (ValueMetadata *)sub_100038320(v42, (__n128)xmmword_10003BD40);
    uint64_t v43 = v83;
    v88[0] = v83;
    uint64_t v44 = sub_10003838C();
    id v45 = (id)AMSLogKey(v44);
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
      uint64_t v48 = v28;
      uint64_t v50 = v49;

      sub_100008DDC();
      sub_100008D80();
      uint64_t v51 = v89;
      uint64_t v52 = sub_100007060(v88, (uint64_t)v89);
      uint64_t v53 = sub_100008D9C((uint64_t)v52, (uint64_t)v51);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v53);
      uint64_t v85 = v53;
      sub_1000382EC();
      sub_100029634((uint64_t)&v85, (uint64_t *)&unk_1000509C0);
      sub_100008DBC();
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v85 = v47;
      uint64_t v86 = v50;
      uint64_t v28 = v48;
      sub_1000382EC();
      sub_100029634((uint64_t)&v85, (uint64_t *)&unk_1000509C0);
      uint64_t v54 = 93LL;
    }

    else
    {
      sub_100008DEC();
      sub_100008D80();
      sub_100038290();
      uint64_t v74 = sub_100038394();
      sub_1000382D0(v74);
      sub_100029634((uint64_t)&v85, (uint64_t *)&unk_1000509C0);
      uint64_t v54 = 58LL;
    }

    sub_100038378(v54);
    sub_10003835C();
    sub_100038330();
    sub_100038338();
    sub_1000382F4();
    sub_10002C300((uint64_t)v42);
    swift_bridgeObjectRelease(v42);
    sub_100015AC8(v23);
    uint64_t v89 = (ValueMetadata *)type metadata accessor for SyncTaskScheduler(0LL);
    Swift::String v90 = &protocol witness table for SyncTaskScheduler;
    sub_10000D298(v88);
    uint64_t v75 = sub_10003838C();
    SyncTaskScheduler.init()(v75);
    uint64_t v30 = Promise.map<A>(on:_:)(v88, sub_100037E08, v43, &type metadata for Data);
    swift_release(v43);
    sub_100038354();
    swift_release(v28);
    sub_100038338();
    uint64_t v73 = (uint64_t)v23;
  }

  sub_100037E20(v73, type metadata accessor for JSServiceRequest);
  return v30;
}

uint64_t sub_100033508( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[46] = a7;
  v8[47] = a8;
  uint64_t v12 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  v8[48] = swift_task_alloc((*(void *)(*(void *)(v12 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v15 = (char *)&dword_100050B50 + dword_100050B50;
  uint64_t v13 = (void *)swift_task_alloc(unk_100050B54);
  v8[49] = v13;
  *uint64_t v13 = v8;
  v13[1] = sub_1000335B4;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))v15)(v8 + 43, a5, a6, a4);
}

uint64_t sub_1000335B4()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 392LL);
  *(void *)(*(void *)v1 + 40Hasher.init(_seed:)(v2, 0LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_100033838;
  }
  else {
    uint64_t v3 = sub_100033618;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_100033618()
{
  uint64_t v1 = *(void *)(v0 + 368);
  unint64_t v23 = *(void *)(v0 + 352);
  uint64_t v24 = *(void *)(v0 + 344);
  uint64_t v2 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v3 = type metadata accessor for LogMessage(0LL);
  uint64_t v4 = (__n128 *)swift_allocObject( v2,  ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL))
                 + 2LL * *(void *)(*(void *)(v3 - 8) + 72LL),
                   *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) | 7LL);
  *(void *)(v0 + 296) = sub_100038380(v4, (__n128)xmmword_10003BD40);
  *(void *)(v0 + 272) = v1;
  uint64_t v5 = sub_100038364();
  id v6 = (id)AMSLogKey(v5);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v10 = v9;

    sub_100008DDC();
    sub_100008D80();
    uint64_t v11 = *(void *)(v0 + 296);
    uint64_t v12 = sub_100007060((void *)(v0 + 272), v11);
    uint64_t v13 = sub_100008D9C((uint64_t)v12, v11);
    *(void *)(v0 + 168) = swift_getMetatypeMetadata(v13);
    *(void *)(v0 + 144) = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 + 144);
    sub_100029634(v0 + 144, (uint64_t *)&unk_1000509C0);
    sub_100008DBC();
    *(void *)(v0 + 208) = v8;
    uint64_t v14 = v0 + 208;
    *(void *)(v0 + 232) = &type metadata for String;
    *(void *)(v0 + 2swift_weakDestroy(v0 + 16) = v10;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 + 208);
    uint64_t v15 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    uint64_t v16 = *(void *)(v0 + 296);
    uint64_t v17 = sub_100007060((void *)(v0 + 272), v16);
    uint64_t v18 = sub_100008D9C((uint64_t)v17, v16);
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata(v18);
    *(void *)(v0 + 176) = v18;
    uint64_t v14 = v0 + 176;
    *(void *)(v0 + 200) = MetatypeMetadata;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 + 176);
    uint64_t v15 = 58LL;
  }

  sub_100029634(v14, (uint64_t *)&unk_1000509C0);
  uint64_t v20 = *(void *)(v0 + 384);
  v21._uint64_t countAndFlagsBits = v15;
  v21._object = (void *)0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  LogMessage.init(stringInterpolation:)(v20);
  sub_100038330();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((void *)(v0 + 272));
  LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x800000010003FD30LL);
  sub_10002C300((uint64_t)v4);
  swift_bridgeObjectRelease(v4);
  *(void *)(v0 + 328) = v24;
  *(void *)(v0 + 336) = v23;
  Promise.resolve(_:)(v0 + 328);
  sub_100023DA8(v24, v23);
  swift_task_dealloc(*(void *)(v0 + 384));
  return sub_1000382B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100033838()
{
  uint64_t v1 = *(void *)(v0 + 368);
  sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v2 = *(void *)(sub_100038314() - 8);
  uint64_t v3 = (__n128 *)sub_100038308( ((*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
                 + 3LL * *(void *)(v2 + 72),
                   *(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = sub_100038380(v3, (__n128)xmmword_10003BCD0);
  *(void *)(v0 + 48) = v1;
  *(void *)(v0 + 72) = v4;
  uint64_t v5 = sub_100038364();
  id v6 = (id)AMSLogKey(v5);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v10 = v9;

    sub_100008DDC();
    sub_100008D80();
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v12 = sub_100007060((void *)(v0 + 48), v11);
    uint64_t v13 = sub_100008D9C((uint64_t)v12, v11);
    *(void *)(v0 + 40) = swift_getMetatypeMetadata(v13);
    *(void *)(v0 + swift_weakDestroy(v0 + 16) = v13;
    sub_10003839C();
    sub_100029634(v0 + 16, (uint64_t *)&unk_1000509C0);
    sub_100008DBC();
    *(void *)(v0 + 240) = v8;
    uint64_t v14 = v0 + 240;
    *(void *)(v0 + 264) = &type metadata for String;
    *(void *)(v0 + 248) = v10;
    sub_10003839C();
    uint64_t v15 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    uint64_t v16 = *(void *)(v0 + 72);
    uint64_t v17 = sub_100007060((void *)(v0 + 48), v16);
    uint64_t v18 = sub_100008D9C((uint64_t)v17, v16);
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata(v18);
    *(void *)(v0 + 80) = v18;
    uint64_t v14 = v0 + 80;
    *(void *)(v0 + 104) = MetatypeMetadata;
    sub_10003839C();
    uint64_t v15 = 58LL;
  }

  sub_100029634(v14, (uint64_t *)&unk_1000509C0);
  uint64_t v20 = *(void *)(v0 + 400);
  sub_100038378(v15);
  sub_10003835C();
  sub_100038330();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((void *)(v0 + 48));
  LogMessage.init(stringLiteral:)(0xD000000000000015LL, 0x800000010003FD10LL);
  swift_getErrorValue(v20);
  uint64_t v21 = *(void *)(v0 + 312);
  *(void *)(v0 + 136) = v21;
  sub_10000D298((void *)(v0 + 112));
  (*(void (**)(void))(*(void *)(v21 - 8) + 16LL))();
  static LogMessage.safe(_:)(v0 + 112);
  sub_100029634(v0 + 112, (uint64_t *)&unk_1000509C0);
  sub_10002C320((uint64_t)v3);
  swift_bridgeObjectRelease(v3);
  uint64_t v22 = (void *)_convertErrorToNSError(_:)(v20);
  Promise.reject(_:)(v22);

  swift_errorRelease(v20);
  swift_task_dealloc(*(void *)(v0 + 384));
  return sub_1000382B4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100033A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_10000748C(a1, 1LL, v6) == 1)
  {
    sub_100029634(a1, &qword_100051D18);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t v10 = *(void *)(a3 + 24);
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
    uint64_t v14 = v13;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = swift_allocObject(&unk_10004B378, 32LL, 7LL);
  *(void *)(v15 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v18[0] = 0LL;
    v18[1] = 0LL;
    uint64_t v16 = v18;
    v18[2] = v12;
    v18[3] = v14;
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return swift_task_create(v7, v16, (char *)&type metadata for () + 8, &unk_100051D50, v15);
}

uint64_t sub_100033BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v56[0] = a3;
  uint64_t v58 = a1;
  uint64_t v4 = type metadata accessor for JSONObject(0LL);
  uint64_t v59 = *(void *)(v4 - 8);
  uint64_t v60 = v4;
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100006674(&qword_100050B60);
  uint64_t v57 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v17 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  uint64_t v19 = *(unsigned __int8 *)(v17 + 80);
  v56[2] = v18;
  uint64_t v20 = swift_allocObject(v16, ((v19 + 32) & ~v19) + 2 * v18, v19 | 7);
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v64 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  *(void *)&__int128 v63 = a2;
  uint64_t v21 = swift_retain(a2);
  id v22 = (id)AMSLogKey(v21);
  if (v22)
  {
    unint64_t v23 = v22;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    uint64_t v26 = v25;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v27._uint64_t countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v64;
    uint64_t v29 = sub_100007060(&v63, v64);
    uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    *(void *)&__int128 v61 = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v61);
    sub_100029634((uint64_t)&v61, (uint64_t *)&unk_1000509C0);
    v31._uint64_t countAndFlagsBits = 5972026LL;
    v31._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v31);
    uint64_t MetatypeMetadata = &type metadata for String;
    *(void *)&__int128 v61 = v24;
    *((void *)&v61 + 1) = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v61);
    sub_100029634((uint64_t)&v61, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v33._uint64_t countAndFlagsBits = 0LL;
    v33._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v33);
    uint64_t v34 = v64;
    uint64_t v35 = sub_100007060(&v63, v64);
    uint64_t v36 = swift_getDynamicType(v35, v34, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v36);
    *(void *)&__int128 v61 = v36;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v61);
    sub_100029634((uint64_t)&v61, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 58LL;
  }

  unint64_t v37 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
  LogMessage.init(stringInterpolation:)(v15);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v63);
  LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010003FD60LL);
  sub_10002C300(v20);
  uint64_t v38 = swift_bridgeObjectRelease(v20);
  JSResponse.body.getter(v38);
  CoarselyTimed.contained.getter(v8);
  uint64_t v39 = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v11, v8);
  JSONObject.untyped.getter(&v61, v39);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v60);
  if (MetatypeMetadata)
  {
    sub_10000750C(&v61, &v63);
    uint64_t v40 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
    uint64_t v41 = v64;
    uint64_t v42 = sub_100007060(&v63, v64);
    uint64_t v43 = _bridgeAnythingToObjectiveC<A>(_:)(v42, v41);
    *(void *)&__int128 v61 = 0LL;
    id v44 = [v40 dataWithJSONObject:v43 options:0 error:&v61];
    swift_unknownObjectRelease(v43);
    id v45 = (id)v61;
    if (v44)
    {
      uint64_t v46 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v44);
      uint64_t v48 = v47;

      uint64_t result = _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v63);
      uint64_t v50 = v56[0];
      *(void *)v56[0] = v46;
      *(void *)(v50 + 8) = v48;
    }

    else
    {
      uint64_t v54 = v45;
      _convertNSErrorToError(_:)(v45);

      swift_willThrow(v55);
      return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v63);
    }
  }

  else
  {
    sub_100029634((uint64_t)&v61, (uint64_t *)&unk_1000509C0);
    unint64_t v51 = sub_100037884();
    uint64_t v52 = swift_allocError(&type metadata for ServiceConnectionExportedObject.PerformError, v51, 0LL, 0LL);
    *uint64_t v53 = 2;
    return swift_willThrow(v52);
  }

  return result;
}

uint64_t sub_10003404C()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_100034088()
{
  return type metadata accessor for ServiceConnectionExportedObject(0LL);
}

uint64_t type metadata accessor for ServiceConnectionExportedObject(uint64_t a1)
{
  uint64_t result = qword_100051C00;
  if (!qword_100051C00) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceConnectionExportedObject);
  }
  return result;
}

void sub_1000340C8(uint64_t a1)
{
  v4[0] = "\b";
  sub_100034140(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }

void sub_100034140(uint64_t a1)
{
  if (!qword_100051C10)
  {
    uint64_t v2 = type metadata accessor for ServiceOptions(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_100051C10);
    }
  }

void sub_100034194( void *a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, const void *a11)
{
  uint64_t v240 = a8;
  uint64_t v239 = a7;
  uint64_t v249 = a5;
  uint64_t v250 = a6;
  unint64_t v234 = a3;
  uint64_t v233 = a2;
  id v232 = a1;
  uint64_t v231 = type metadata accessor for URL(0LL);
  uint64_t v229 = *(void *)(v231 - 8);
  __chkstk_darwin(v231, v12);
  unint64_t v225 = (char *)&v220 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Bag(0LL);
  __chkstk_darwin(v14, v15);
  uint64_t v224 = (char *)&v220 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v230 = sub_100006674(&qword_100051CE8);
  __chkstk_darwin(v230, v17);
  uint64_t v237 = (uint64_t)&v220 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_100006674(&qword_100051CF0);
  uint64_t v21 = __chkstk_darwin(v19, v20);
  v228 = (char *)&v220 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = __chkstk_darwin(v21, v23);
  v227 = (char *)&v220 - v25;
  uint64_t v27 = __chkstk_darwin(v24, v26);
  uint64_t v226 = (id **)((char *)&v220 - v28);
  __chkstk_darwin(v27, v29);
  uint64_t v251 = (char *)&v220 - v30;
  uint64_t v235 = type metadata accessor for ServiceOptions(0LL);
  uint64_t v32 = __chkstk_darwin(v235, v31);
  v223 = (uint64_t *)((char *)&v220 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v32, v34);
  v238 = (char *)&v220 - v35;
  uint64_t v36 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v36, v37);
  uint64_t v39 = (char *)&v220 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v40 = swift_allocObject(&unk_10004B2B0, 24LL, 7LL);
  *(void *)(v40 + swift_weakDestroy(v0 + 16) = a11;
  uint64_t v41 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v42 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v43 = *(void *)(v42 + 72);
  uint64_t v44 = *(unsigned __int8 *)(v42 + 80);
  uint64_t v45 = (v44 + 32) & ~v44;
  uint64_t v243 = v41;
  uint64_t v241 = v45 + 2 * v43;
  uint64_t v242 = v44 | 7;
  uint64_t v46 = swift_allocObject(v41, v241, v44 | 7);
  __int128 v244 = xmmword_10003BD40;
  *(_OWORD *)(v46 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v246 = v45;
  uint64_t v245 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  uint64_t v253 = v245;
  unint64_t v252 = a10;
  _Block_copy(a11);
  uint64_t v47 = swift_retain(a10);
  id v48 = (id)AMSLogKey(v47);
  uint64_t v247 = v40;
  v248 = (void (**)(void, void *))a11;
  v236 = a4;
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
    uint64_t v52 = v51;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v53._uint64_t countAndFlagsBits = 0LL;
    v53._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v53);
    uint64_t v54 = v253;
    uint64_t v55 = sub_100007060(&v252, v253);
    uint64_t DynamicType = swift_getDynamicType(v55, v54, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    uint64_t v256 = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
    sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
    v57._uint64_t countAndFlagsBits = 5972026LL;
    v57._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v57);
    uint64_t MetatypeMetadata = &type metadata for String;
    uint64_t v256 = v50;
    uint64_t v257 = v52;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
    sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
    uint64_t v58 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v59._uint64_t countAndFlagsBits = 0LL;
    v59._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v59);
    uint64_t v60 = v253;
    __int128 v61 = sub_100007060(&v252, v253);
    uint64_t v62 = swift_getDynamicType(v61, v60, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v62);
    uint64_t v256 = v62;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
    sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
    uint64_t v58 = 58LL;
  }

  uint64_t v63 = v250;
  uint64_t v64 = (uint64_t)v251;
  uint64_t v65 = v249;
  unint64_t v66 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v58);
  LogMessage.init(stringInterpolation:)(v39);
  uint64_t v67 = type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v252);
  LogMessage.init(stringLiteral:)(0xD000000000000010LL, 0x800000010003FB90LL);
  uint64_t v250 = v67;
  sub_10002C300(v46);
  swift_bridgeObjectRelease(v46);
  uint64_t v68 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v68, *(unsigned int *)(v68 + 48), *(unsigned __int16 *)(v68 + 52));
  uint64_t v69 = JSONDecoder.init()();
  uint64_t v70 = sub_100032660(v65, v63);
  uint64_t v72 = v71;
  swift_release(v69);
  if (!v72)
  {
    uint64_t v90 = swift_allocObject(v243, v241, v242);
    *(_OWORD *)(v90 + swift_weakDestroy(v0 + 16) = v244;
    uint64_t v253 = v245;
    unint64_t v252 = a10;
    uint64_t v91 = swift_retain(a10);
    id v92 = (id)AMSLogKey(v91);
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = static String._unconditionallyBridgeFromObjectiveC(_:)(v92);
      uint64_t v96 = v95;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v97._uint64_t countAndFlagsBits = 0LL;
      v97._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v97);
      uint64_t v98 = v253;
      uint64_t v99 = sub_100007060(&v252, v253);
      uint64_t v100 = swift_getDynamicType(v99, v98, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v100);
      uint64_t v256 = v100;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      v101._uint64_t countAndFlagsBits = 5972026LL;
      v101._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v101);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v256 = v94;
      uint64_t v257 = v96;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      uint64_t v102 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v127._uint64_t countAndFlagsBits = 0LL;
      v127._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v127);
      uint64_t v128 = v253;
      uint64_t v129 = sub_100007060(&v252, v253);
      uint64_t v130 = swift_getDynamicType(v129, v128, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v130);
      uint64_t v256 = v130;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      uint64_t v102 = 58LL;
    }

    uint64_t v132 = v247;
    unint64_t v131 = v248;
    unint64_t v133 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v102);
    LogMessage.init(stringInterpolation:)(v39);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v252);
    LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010003FBB0LL);
    sub_10002C320(v90);
    swift_bridgeObjectRelease(v90);
    unint64_t v134 = sub_100037B6C();
    uint64_t v135 = swift_allocError(&type metadata for ServiceConnectionExportedObject.BootstrapError, v134, 0LL, 0LL);
    *uint64_t v136 = 0;
    uint64_t v137 = (void *)_convertErrorToNSError(_:)(v135);
    goto LABEL_26;
  }

  swift_allocObject(v68, *(unsigned int *)(v68 + 48), *(unsigned __int16 *)(v68 + 52));
  uint64_t v73 = JSONDecoder.init()();
  uint64_t v74 = sub_100032A04(v239, v240);
  uint64_t v76 = v75;
  swift_release(v73);
  if (v76 == 1)
  {
    swift_bridgeObjectRelease(v72);
    uint64_t v77 = swift_allocObject(v243, v241, v242);
    *(_OWORD *)(v77 + swift_weakDestroy(v0 + 16) = v244;
    uint64_t v253 = v245;
    unint64_t v252 = a10;
    uint64_t v78 = swift_retain(a10);
    id v79 = (id)AMSLogKey(v78);
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
      uint64_t v83 = v82;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v84._uint64_t countAndFlagsBits = 0LL;
      v84._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v84);
      uint64_t v85 = v253;
      uint64_t v86 = sub_100007060(&v252, v253);
      uint64_t v87 = swift_getDynamicType(v86, v85, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v87);
      uint64_t v256 = v87;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      v88._uint64_t countAndFlagsBits = 5972026LL;
      v88._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v88);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v256 = v81;
      uint64_t v257 = v83;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      uint64_t v89 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v138._uint64_t countAndFlagsBits = 0LL;
      v138._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v138);
      uint64_t v139 = v253;
      uint64_t v140 = sub_100007060(&v252, v253);
      uint64_t v141 = swift_getDynamicType(v140, v139, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v141);
      uint64_t v256 = v141;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      uint64_t v89 = 58LL;
    }

    uint64_t v132 = v247;
    unint64_t v142 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v89);
    LogMessage.init(stringInterpolation:)(v39);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v252);
    LogMessage.init(stringLiteral:)(0xD000000000000020LL, 0x800000010003FBD0LL);
    sub_10002C320(v77);
    swift_bridgeObjectRelease(v77);
    unint64_t v143 = sub_100037B6C();
    uint64_t v144 = swift_allocError(&type metadata for ServiceConnectionExportedObject.BootstrapError, v143, 0LL, 0LL);
    uint64_t v135 = v144;
    char v146 = 1;
LABEL_25:
    *uint64_t v145 = v146;
    uint64_t v137 = (void *)_convertErrorToNSError(_:)(v144);
    unint64_t v131 = v248;
LABEL_26:
    v131[2](v131, v137);

    swift_errorRelease(v135);
    swift_release(v132);
    uint64_t v171 = v131;
    goto LABEL_27;
  }

  uint64_t v222 = v70;
  sub_100007498(0LL, &qword_100051D00, &OBJC_CLASS___AMSSnapshotBag_ptr);
  uint64_t v103 = v233;
  unint64_t v104 = v234;
  sub_10000D314(v233, v234);
  uint64_t v105 = (char *)sub_1000355AC(v103, v104);
  if (!v105)
  {
    swift_bridgeObjectRelease(v72);
    sub_100037BA8(v74, v76);
    uint64_t v147 = swift_allocObject(v243, v241, v242);
    *(_OWORD *)(v147 + swift_weakDestroy(v0 + 16) = v244;
    uint64_t v253 = v245;
    unint64_t v252 = a10;
    uint64_t v148 = swift_retain(a10);
    id v149 = (id)AMSLogKey(v148);
    if (v149)
    {
      Swift::String v150 = v149;
      uint64_t v151 = static String._unconditionallyBridgeFromObjectiveC(_:)(v149);
      uint64_t v153 = v152;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v154._uint64_t countAndFlagsBits = 0LL;
      v154._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v154);
      uint64_t v155 = v253;
      uint64_t v156 = sub_100007060(&v252, v253);
      uint64_t v157 = swift_getDynamicType(v156, v155, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v157);
      uint64_t v256 = v157;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      v158._uint64_t countAndFlagsBits = 5972026LL;
      v158._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v158);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v256 = v151;
      uint64_t v257 = v153;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      uint64_t v159 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v165._uint64_t countAndFlagsBits = 0LL;
      v165._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v165);
      uint64_t v166 = v253;
      uint64_t v167 = sub_100007060(&v252, v253);
      uint64_t v168 = swift_getDynamicType(v167, v166, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v168);
      uint64_t v256 = v168;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
      sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
      uint64_t v159 = 58LL;
    }

    uint64_t v132 = v247;
    unint64_t v169 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v159);
    LogMessage.init(stringInterpolation:)(v39);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v252);
    LogMessage.init(stringLiteral:)(0xD00000000000001ELL, 0x800000010003FC00LL);
    sub_10002C320(v147);
    swift_bridgeObjectRelease(v147);
    unint64_t v170 = sub_100037B6C();
    uint64_t v144 = swift_allocError(&type metadata for ServiceConnectionExportedObject.BootstrapError, v170, 0LL, 0LL);
    uint64_t v135 = v144;
    char v146 = 2;
    goto LABEL_25;
  }

  unint64_t v106 = v105;
  uint64_t v239 = v72;
  uint64_t v233 = v43;
  uint64_t v107 = v74 & 1;
  uint64_t v249 = v74;
  uint64_t v108 = v235;
  uint64_t v109 = (uint64_t)v238;
  uint64_t v110 = &v238[*(int *)(v235 + 32)];
  uint64_t v111 = *(void (**)(void))(v229 + 16);
  uint64_t v221 = a9;
  unint64_t v220 = (void (*)(void, void, void))v111;
  v111(v110);
  id v112 = v232;
  *(void *)uint64_t v109 = v232;
  *(void *)(v109 + 8) = v106;
  uint64_t v113 = v236;
  *(void *)(v109 + swift_weakDestroy(v0 + 16) = v236;
  uint64_t v229 = v107;
  *(_BYTE *)(v109 + 24) = v107;
  *(void *)(v109 + 32) = v76;
  sub_10002B308(v109, v64, type metadata accessor for ServiceOptions);
  sub_100007438(v64, 0LL, 1LL, v108);
  uint64_t v114 = v106;
  unint64_t v234 = a10;
  uint64_t v115 = a10 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObject_serviceOptions;
  swift_beginAccess( a10 + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObject_serviceOptions,  v255,  0LL,  0LL);
  uint64_t v116 = v64;
  uint64_t v117 = v76;
  uint64_t v118 = v237;
  uint64_t v119 = v237 + *(int *)(v230 + 48);
  sub_100037BBC(v116, v237);
  uint64_t v230 = v115;
  sub_100037BBC(v115, v119);
  int v120 = sub_10000748C(v118, 1LL, v108);
  uint64_t v240 = v117;
  if (v120 != 1)
  {
    id v160 = v113;
    uint64_t v161 = v226;
    sub_100037BBC(v118, (uint64_t)v226);
    if (sub_10000748C(v119, 1LL, v108) != 1)
    {
      uint64_t v172 = v223;
      sub_10002B2DC(v119, (uint64_t)v223, type metadata accessor for ServiceOptions);
      id v173 = v112;
      uint64_t v124 = v114;
      Swift::String v174 = v114;
      id v175 = v160;
      sub_100037C04(v249, v240);
      char v176 = sub_100038918(v161, v172);
      sub_100037E20((uint64_t)v172, type metadata accessor for ServiceOptions);
      sub_100029634((uint64_t)v251, &qword_100051CF0);
      sub_100037E20((uint64_t)v161, type metadata accessor for ServiceOptions);
      uint64_t v113 = v160;
      sub_100029634(v118, &qword_100051CF0);
      uint64_t v125 = (uint64_t)v238;
      unint64_t v126 = v234;
      if ((v176 & 1) != 0) {
        goto LABEL_33;
      }
LABEL_29:
      uint64_t v251 = v124;
      uint64_t v177 = swift_allocObject(v243, v241, v242);
      *(_OWORD *)(v177 + swift_weakDestroy(v0 + 16) = v244;
      uint64_t v253 = v245;
      unint64_t v252 = v126;
      uint64_t v178 = swift_retain(v126);
      id v179 = (id)AMSLogKey(v178);
      if (v179)
      {
        uint64_t v180 = v179;
        uint64_t v181 = static String._unconditionallyBridgeFromObjectiveC(_:)(v179);
        uint64_t v183 = v182;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v184._uint64_t countAndFlagsBits = 0LL;
        v184._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v184);
        uint64_t v185 = v253;
        uint64_t v186 = sub_100007060(&v252, v253);
        uint64_t v187 = swift_getDynamicType(v186, v185, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v187);
        uint64_t v256 = v187;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
        sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
        v188._uint64_t countAndFlagsBits = 5972026LL;
        v188._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v188);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v256 = v181;
        uint64_t v257 = v183;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
        uint64_t v125 = (uint64_t)v238;
        sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
        uint64_t v189 = 93LL;
      }

      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v190._uint64_t countAndFlagsBits = 0LL;
        v190._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v190);
        uint64_t v191 = v253;
        uint64_t v192 = sub_100007060(&v252, v253);
        uint64_t v193 = swift_getDynamicType(v192, v191, 1LL);
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v193);
        uint64_t v256 = v193;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(&v256);
        sub_100029634((uint64_t)&v256, (uint64_t *)&unk_1000509C0);
        uint64_t v189 = 58LL;
      }

      uint64_t v194 = (uint64_t)v228;
      uint64_t v195 = (uint64_t)v227;
      uint64_t v196 = v230;
      unint64_t v197 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v189);
      LogMessage.init(stringInterpolation:)(v39);
      _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v252);
      LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010003FC20LL);
      sub_10002C300(v177);
      swift_bridgeObjectRelease(v177);
      sub_10002B308(v125, v195, type metadata accessor for ServiceOptions);
      sub_100007438(v195, 0LL, 1LL, v235);
      sub_100037C18(v195, v194);
      swift_beginAccess(v196, &v252, 33LL, 0LL);
      sub_100037C60(v194, v196);
      swift_endAccess(&v252);
      uint64_t v198 = *(void *)(v126 + 16);
      *(void *)(v126 + swift_weakDestroy(v0 + 16) = 0LL;
      swift_release(v198);
      uint64_t v113 = v236;
      uint64_t v124 = v251;
      goto LABEL_33;
    }

    id v162 = v112;
    uint64_t v124 = v114;
    uint64_t v163 = v114;
    id v164 = v113;
    sub_100037C04(v249, v240);
    sub_100029634((uint64_t)v251, &qword_100051CF0);
    sub_100037E20((uint64_t)v161, type metadata accessor for ServiceOptions);
LABEL_22:
    sub_100029634(v237, &qword_100051CE8);
    uint64_t v125 = (uint64_t)v238;
    unint64_t v126 = v234;
    goto LABEL_29;
  }

  id v121 = v112;
  __int128 v122 = v114;
  id v123 = v113;
  sub_100037C04(v249, v117);
  sub_100029634(v116, &qword_100051CF0);
  uint64_t v124 = v114;
  sub_100029634(v237, &qword_100051CF0);
  uint64_t v125 = (uint64_t)v238;
  unint64_t v126 = v234;
LABEL_33:
  if (*(void *)(v126 + 16))
  {
    swift_bridgeObjectRelease(v239);
    sub_100037BA8(v249, v240);
  }

  else
  {
    uint64_t v199 = (uint64_t)v232;
    id v200 = v232;
    uint64_t v201 = v124;
    uint64_t v202 = (uint64_t)v224;
    Bag.init(from:)(v201);
    uint64_t v203 = (uint64_t)v225;
    v220(v225, v221, v231);
    uint64_t v204 = type metadata accessor for ServiceBootstrap(0LL);
    swift_allocObject(v204, *(unsigned int *)(v204 + 48), *(unsigned __int16 *)(v204 + 52));
    uint64_t v205 = sub_100030698(v199, v202, (uint64_t)v113, v222, v239, v229, v240, v203);
    id v206 = v113;
    uint64_t v207 = sub_100030774();
    swift_release(v205);
    uint64_t v208 = *(void *)(v126 + 16);
    *(void *)(v126 + swift_weakDestroy(v0 + 16) = v207;
    swift_release(v208);
  }

  uint64_t v209 = v247;
  uint64_t v210 = *(void *)(v126 + 16);
  if (v210)
  {
    uint64_t v211 = sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v212 = swift_retain(v210);
    uint64_t v213 = (void *)static OS_dispatch_queue.main.getter(v212);
    uint64_t v214 = sub_100037A30( (uint64_t)sub_10002FBBC,  0LL,  v213,  v210,  (uint64_t)&unk_10004B1C0,  (uint64_t)sub_10000F424,  (uint64_t)sub_100038258);
    swift_release(v210);

    uint64_t v215 = (void *)swift_allocObject(&unk_10004B2D8, 40LL, 7LL);
    v215[2] = v126;
    v215[3] = sub_100038254;
    v215[4] = v209;
    uint64_t v216 = swift_allocObject(&unk_10004B300, 24LL, 7LL);
    swift_weakInit(v216 + 16, v126);
    uint64_t v217 = (void *)swift_allocObject(&unk_10004B328, 40LL, 7LL);
    v217[2] = v216;
    v217[3] = sub_100038254;
    v217[4] = v209;
    swift_retain_n(v209, 2LL);
    swift_retain(v126);
    uint64_t v218 = swift_retain(v216);
    uint64_t v219 = static OS_dispatch_queue.main.getter(v218);
    uint64_t v253 = v211;
    uint64_t v254 = &protocol witness table for OS_dispatch_queue;
    unint64_t v252 = v219;
    Promise.then(perform:orCatchError:on:)(sub_100037CAC, v215, sub_100037D08, v217, &v252);

    swift_release(v214);
    swift_release(v215);
    swift_release(v217);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(&v252);
    sub_100037E20(v125, type metadata accessor for ServiceOptions);
    swift_release(v209);
    swift_release(v216);
  }

  else
  {
    sub_100037E20(v125, type metadata accessor for ServiceOptions);
    swift_release(v209);
  }

  uint64_t v171 = v248;
LABEL_27:
  _Block_release(v171);
}

id sub_1000355AC(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v7 = [v5 initWithData:isa];
  sub_100023DA8(a1, a2);

  return v7;
}

uint64_t sub_100035620(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v10 = type metadata accessor for LogMessage(0LL);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v10 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v33 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  v32[0] = a2;
  uint64_t v12 = swift_retain(a2);
  id v13 = (id)AMSLogKey(v12);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    uint64_t v17 = v16;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v18._uint64_t countAndFlagsBits = 0LL;
    v18._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v18);
    uint64_t v19 = v33;
    uint64_t v20 = sub_100007060(v32, v33);
    uint64_t DynamicType = swift_getDynamicType(v20, v19, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v30[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
    sub_100029634((uint64_t)v30, (uint64_t *)&unk_1000509C0);
    v22._uint64_t countAndFlagsBits = 5972026LL;
    v22._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    uint64_t MetatypeMetadata = &type metadata for String;
    v30[0] = v15;
    v30[1] = v17;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
    sub_100029634((uint64_t)v30, (uint64_t *)&unk_1000509C0);
    uint64_t v23 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v24._uint64_t countAndFlagsBits = 0LL;
    v24._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v24);
    uint64_t v25 = v33;
    uint64_t v26 = sub_100007060(v32, v33);
    uint64_t v27 = swift_getDynamicType(v26, v25, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v27);
    v30[0] = v27;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
    sub_100029634((uint64_t)v30, (uint64_t *)&unk_1000509C0);
    uint64_t v23 = 58LL;
  }

  unint64_t v28 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v23);
  LogMessage.init(stringInterpolation:)(v8);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v32);
  LogMessage.init(stringLiteral:)(0xD000000000000020LL, 0x800000010003FC60LL);
  sub_10002C300(v11);
  swift_bridgeObjectRelease(v11);
  return a3(0LL);
}

uint64_t sub_100035894(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2 += 16LL;
  swift_beginAccess(a2, v40, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(a2);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v34 = a3;
    uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
    uint64_t v13 = type metadata accessor for LogMessage(0LL);
    uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v13 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
    uint64_t v39 = type metadata accessor for ServiceConnectionExportedObject(0LL);
    v38[0] = v11;
    uint64_t v15 = swift_retain(v11);
    id v16 = (id)AMSLogKey(v15);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
      uint64_t v20 = v19;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v21._uint64_t countAndFlagsBits = 0LL;
      v21._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v21);
      uint64_t v22 = v39;
      uint64_t v23 = sub_100007060(v38, v39);
      uint64_t DynamicType = swift_getDynamicType(v23, v22, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
      v36[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
      sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
      v25._uint64_t countAndFlagsBits = 5972026LL;
      v25._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v25);
      uint64_t MetatypeMetadata = &type metadata for String;
      v36[0] = v18;
      v36[1] = v20;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
      sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
      uint64_t v26 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v27._uint64_t countAndFlagsBits = 0LL;
      v27._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v27);
      uint64_t v28 = v39;
      uint64_t v29 = sub_100007060(v38, v39);
      uint64_t v30 = swift_getDynamicType(v29, v28, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v30);
      v36[0] = v30;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
      sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
      uint64_t v26 = 58LL;
    }

    unint64_t v31 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
    LogMessage.init(stringInterpolation:)(v9);
    type metadata accessor for Log();
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v38);
    LogMessage.init(stringLiteral:)(0xD000000000000018LL, 0x800000010003FC40LL);
    swift_getErrorValue(a1);
    uint64_t v32 = v35;
    uint64_t v39 = v35;
    sub_10000D298(v38);
    (*(void (**)(void))(*(void *)(v32 - 8) + 16LL))();
    static LogMessage.safe(_:)(v38);
    sub_100029634((uint64_t)v38, (uint64_t *)&unk_1000509C0);
    sub_10002C320(v14);
    swift_bridgeObjectRelease(v14);
    uint64_t v33 = *(void *)(v11 + 16);
    *(void *)(v11 + swift_weakDestroy(v0 + 16) = 0LL;
    swift_release(v33);
    v34(a1);
    return swift_release(v11);
  }

  return result;
}

void sub_100035D68(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100035DB4(uint64_t a1, unint64_t a2, uint64_t a3, const void *a4)
{
  unint64_t v54 = a2;
  uint64_t v7 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = swift_allocObject(&unk_10004B1E8, 24LL, 7LL);
  *(void *)(v11 + swift_weakDestroy(v0 + 16) = a4;
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v57 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  uint64_t v55 = a4;
  v56[0] = a3;
  _Block_copy(a4);
  uint64_t v15 = swift_retain(a3);
  id v16 = (id)AMSLogKey(v15);
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v53 = a1;
    uint64_t v19 = v18;
    uint64_t v21 = v20;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v22._uint64_t countAndFlagsBits = 0LL;
    v22._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    uint64_t v23 = v57;
    Swift::String v24 = sub_100007060(v56, v57);
    uint64_t DynamicType = swift_getDynamicType(v24, v23, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v59[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v59);
    sub_100029634((uint64_t)v59, (uint64_t *)&unk_1000509C0);
    v26._uint64_t countAndFlagsBits = 5972026LL;
    v26._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v26);
    uint64_t MetatypeMetadata = &type metadata for String;
    v59[0] = v19;
    v59[1] = v21;
    a1 = v53;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v59);
    sub_100029634((uint64_t)v59, (uint64_t *)&unk_1000509C0);
    uint64_t v27 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v28._uint64_t countAndFlagsBits = 0LL;
    v28._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v28);
    uint64_t v29 = v57;
    uint64_t v30 = sub_100007060(v56, v57);
    uint64_t v31 = swift_getDynamicType(v30, v29, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v31);
    v59[0] = v31;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v59);
    sub_100029634((uint64_t)v59, (uint64_t *)&unk_1000509C0);
    uint64_t v27 = 58LL;
  }

  unint64_t v32 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v27);
  LogMessage.init(stringInterpolation:)(v10);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v56);
  LogMessage.init(stringLiteral:)(0x206D726F66726550LL, 0xEE0064656C6C6163LL);
  sub_10002C300(v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v33 = *(void *)(a3 + 16);
  if (v33)
  {
    uint64_t v34 = (void *)swift_allocObject(&unk_10004B210, 40LL, 7LL);
    v34[2] = a3;
    void v34[3] = a1;
    unint64_t v35 = v54;
    v34[4] = v54;
    uint64_t v57 = type metadata accessor for SyncTaskScheduler(0LL);
    uint64_t v58 = &protocol witness table for SyncTaskScheduler;
    sub_10000D298(v56);
    swift_retain(a3);
    swift_retain(v33);
    uint64_t v36 = sub_10000D314(a1, v35);
    SyncTaskScheduler.init()(v36);
    uint64_t v37 = sub_100006674(&qword_100050768);
    unint64_t v38 = sub_1000379DC();
    uint64_t v39 = Promise.flatMap<A>(on:_:)(v56, sub_1000379D0, v34, v37, v38);
    swift_release(v34);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v56);
    uint64_t v40 = sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v41 = (void *)static OS_dispatch_queue.main.getter(v40);
    uint64_t v42 = sub_100037A30( (uint64_t)sub_10002FBBC,  0LL,  v41,  v39,  (uint64_t)&unk_10004B288,  (uint64_t)sub_100037B44,  (uint64_t)sub_100037B50);

    uint64_t v43 = (void *)swift_allocObject(&unk_10004B238, 40LL, 7LL);
    v43[2] = a3;
    void v43[3] = sub_1000379A0;
    void v43[4] = v11;
    uint64_t v44 = (void *)swift_allocObject(&unk_10004B260, 40LL, 7LL);
    _OWORD v44[2] = a3;
    void v44[3] = sub_1000379A0;
    v44[4] = v11;
    swift_retain_n(a3, 2LL);
    uint64_t v45 = swift_retain_n(v11, 2LL);
    uint64_t v46 = static OS_dispatch_queue.main.getter(v45);
    uint64_t v57 = v40;
    uint64_t v58 = &protocol witness table for OS_dispatch_queue;
    v56[0] = v46;
    Promise.then(perform:orCatchError:on:)(sub_100037B28, v43, sub_100037B38, v44, v56);
    swift_release(v33);
    swift_release(v39);
    swift_release(v42);
    swift_release(v43);
    swift_release(v44);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v56);
    swift_release(v11);
    uint64_t v47 = v55;
  }

  else
  {
    unint64_t v48 = sub_100037884();
    uint64_t v49 = swift_allocError(&type metadata for ServiceConnectionExportedObject.PerformError, v48, 0LL, 0LL);
    *uint64_t v50 = 0;
    uint64_t v51 = (void *)_convertErrorToNSError(_:)(v49);
    uint64_t v52 = v55;
    (*((void (**)(const void *, void, void *))v55 + 2))(v55, 0LL, v51);

    swift_errorRelease(v49);
    swift_release(v11);
    uint64_t v47 = v52;
  }

  _Block_release(v47);
}

uint64_t sub_1000362A0(uint64_t *a1, uint64_t a2, uint64_t a3, char *a4)
{
  return sub_100032EA4(a3, a4, *a1);
}

uint64_t sub_1000362D0(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void, void, void))
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v12 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  uint64_t v15 = swift_allocObject( v12,  ((*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)) + 2 * v14,  *(unsigned __int8 *)(v13 + 80) | 7LL);
  *(_OWORD *)(v15 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v39 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  v38[0] = a2;
  uint64_t v16 = swift_retain(a2);
  id v17 = (id)AMSLogKey(v16);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v35[1] = v14;
    uint64_t v20 = a3;
    uint64_t v22 = v21;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v23._uint64_t countAndFlagsBits = 0LL;
    v23._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t v24 = v39;
    Swift::String v25 = sub_100007060(v38, v39);
    uint64_t DynamicType = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v36[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    v27._uint64_t countAndFlagsBits = 5972026LL;
    v27._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t MetatypeMetadata = &type metadata for String;
    v36[0] = v19;
    v36[1] = v22;
    a3 = v20;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    uint64_t v28 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v29._uint64_t countAndFlagsBits = 0LL;
    v29._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v29);
    uint64_t v30 = v39;
    uint64_t v31 = sub_100007060(v38, v39);
    uint64_t v32 = swift_getDynamicType(v31, v30, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v32);
    v36[0] = v32;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    uint64_t v28 = 58LL;
  }

  unint64_t v33 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
  LogMessage.init(stringInterpolation:)(v9);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v38);
  LogMessage.init(stringLiteral:)(0xD00000000000001FLL, 0x800000010003FB70LL);
  sub_10002C300(v15);
  swift_bridgeObjectRelease(v15);
  return a3(v10, v11, 0LL);
}

uint64_t sub_10003657C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, unint64_t, uint64_t))
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v11 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
        + 2LL * *(void *)(v11 + 72),
          *(unsigned __int8 *)(v11 + 80) | 7LL);
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v39 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  v38[0] = a2;
  uint64_t v13 = swift_retain(a2);
  id v14 = (id)AMSLogKey(v13);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v18 = v17;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v19._uint64_t countAndFlagsBits = 0LL;
    v19._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v19);
    uint64_t v20 = v39;
    uint64_t v21 = sub_100007060(v38, v39);
    uint64_t DynamicType = swift_getDynamicType(v21, v20, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v36[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    v23._uint64_t countAndFlagsBits = 5972026LL;
    v23._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v36[0] = v16;
    v36[1] = v18;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    uint64_t v24 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v25._uint64_t countAndFlagsBits = 0LL;
    v25._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    uint64_t v26 = v39;
    Swift::String v27 = sub_100007060(v38, v39);
    uint64_t v28 = swift_getDynamicType(v27, v26, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v28);
    v36[0] = v28;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    uint64_t v24 = 58LL;
  }

  unint64_t v29 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
  LogMessage.init(stringInterpolation:)(v9);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v38);
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(21LL, 1LL);
  v30._object = (void *)0x800000010003FB50LL;
  v30._uint64_t countAndFlagsBits = 0xD000000000000015LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v30);
  swift_getErrorValue(a1);
  uint64_t v31 = v35;
  uint64_t v39 = v35;
  sub_10000D298(v38);
  (*(void (**)(void))(*(void *)(v31 - 8) + 16LL))();
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v38);
  sub_100029634((uint64_t)v38, (uint64_t *)&unk_1000509C0);
  v32._uint64_t countAndFlagsBits = 0LL;
  v32._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v32);
  LogMessage.init(stringInterpolation:)(v9);
  sub_10002C300(v12);
  swift_bridgeObjectRelease(v12);
  return a3(0LL, 0xF000000000000000LL, a1);
}

void sub_100036908(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0LL;
    goto LABEL_6;
  }

  Class isa = 0LL;
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = _convertErrorToNSError(_:)(a3);
LABEL_6:
  id v8 = (id)v7;
  (*(void (**)(uint64_t, Class))(a4 + 16))(a4, isa);
}

void sub_100036988(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v9 = type metadata accessor for LogMessage(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v31 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  v30[0] = a1;
  uint64_t v11 = swift_retain(a1);
  id v12 = (id)AMSLogKey(v11);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v16 = v15;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v17._uint64_t countAndFlagsBits = 0LL;
    v17._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v17);
    uint64_t v18 = v31;
    Swift::String v19 = sub_100007060(v30, v31);
    uint64_t DynamicType = swift_getDynamicType(v19, v18, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v28[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
    sub_100029634((uint64_t)v28, (uint64_t *)&unk_1000509C0);
    v21._uint64_t countAndFlagsBits = 5972026LL;
    v21._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t MetatypeMetadata = &type metadata for String;
    v28[0] = v14;
    v28[1] = v16;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
    sub_100029634((uint64_t)v28, (uint64_t *)&unk_1000509C0);
    uint64_t v22 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v23._uint64_t countAndFlagsBits = 0LL;
    v23._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t v24 = v31;
    Swift::String v25 = sub_100007060(v30, v31);
    uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v26);
    v28[0] = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
    sub_100029634((uint64_t)v28, (uint64_t *)&unk_1000509C0);
    uint64_t v22 = 58LL;
  }

  unint64_t v27 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
  LogMessage.init(stringInterpolation:)(v7);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v30);
  LogMessage.init(stringLiteral:)(0x6320707520746553LL, 0xED000064656C6C61LL);
  sub_10002C300(v10);
  swift_bridgeObjectRelease(v10);
  a2[2](a2, 0LL);
  _Block_release(a2);
}

void sub_100036C10(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v9 = type metadata accessor for LogMessage(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v32 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  v31[0] = a1;
  uint64_t v11 = swift_retain(a1);
  id v12 = (id)AMSLogKey(v11);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v16 = v15;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v17._uint64_t countAndFlagsBits = 0LL;
    v17._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v17);
    uint64_t v18 = v32;
    Swift::String v19 = sub_100007060(v31, v32);
    uint64_t DynamicType = swift_getDynamicType(v19, v18, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v29[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v29);
    sub_100029634((uint64_t)v29, (uint64_t *)&unk_1000509C0);
    v21._uint64_t countAndFlagsBits = 5972026LL;
    v21._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v21);
    uint64_t MetatypeMetadata = &type metadata for String;
    v29[0] = v14;
    v29[1] = v16;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v29);
    sub_100029634((uint64_t)v29, (uint64_t *)&unk_1000509C0);
    uint64_t v22 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v23._uint64_t countAndFlagsBits = 0LL;
    v23._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t v24 = v32;
    Swift::String v25 = sub_100007060(v31, v32);
    uint64_t v26 = swift_getDynamicType(v25, v24, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v26);
    v29[0] = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v29);
    sub_100029634((uint64_t)v29, (uint64_t *)&unk_1000509C0);
    uint64_t v22 = 58LL;
  }

  unint64_t v27 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v22);
  LogMessage.init(stringInterpolation:)(v7);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v31);
  LogMessage.init(stringLiteral:)(0xD000000000000010LL, 0x800000010003FB30LL);
  sub_10002C300(v10);
  swift_bridgeObjectRelease(v10);
  uint64_t v28 = *(void *)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = 0LL;
  swift_release(v28);
  a2[2](a2, 0LL);
  _Block_release(a2);
}

uint64_t sub_100036EA4(uint64_t a1, int a2, void *aBlock, void (*a4)(uint64_t, void *))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  uint64_t v7 = sub_100038364();
  a4(v7, v6);
  _Block_release(v6);
  return swift_release(a1);
}

void sub_100036EF4(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject(&unk_10004B148, 24LL, 7LL);
  *(void *)(v6 + swift_weakDestroy(v0 + 16) = a3;
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    uint64_t v8 = sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    _Block_copy(a3);
    uint64_t v9 = swift_retain(v7);
    uint64_t v10 = (void *)static OS_dispatch_queue.main.getter(v9);
    uint64_t v11 = sub_100037A30( (uint64_t)sub_10002FBBC,  0LL,  v10,  v7,  (uint64_t)&unk_10004B1C0,  (uint64_t)sub_10000F424,  (uint64_t)sub_100038258);

    id v12 = (void *)swift_allocObject(&unk_10004B170, 48LL, 7LL);
    v12[2] = a1;
    v12[3] = a2;
    void v12[4] = sub_10003787C;
    void v12[5] = v6;
    uint64_t v13 = (void *)swift_allocObject(&unk_10004B198, 40LL, 7LL);
    v13[2] = a2;
    void v13[3] = sub_10003787C;
    v13[4] = v6;
    id v14 = a1;
    swift_retain_n(a2, 2LL);
    uint64_t v15 = swift_retain_n(v6, 2LL);
    v20[3] = v8;
    v20[4] = &protocol witness table for OS_dispatch_queue;
    v20[0] = static OS_dispatch_queue.main.getter(v15);
    Promise.then(perform:orCatchError:on:)(sub_100037980, v12, sub_100037990, v13, v20);
    swift_release(v7);
    swift_release(v11);
    swift_release(v12);
    swift_release(v13);
    _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v20);
    swift_release(v6);
    _Block_release(a3);
  }

  else
  {
    unint64_t v16 = sub_100037884();
    uint64_t v17 = swift_allocError(&type metadata for ServiceConnectionExportedObject.PerformError, v16, 0LL, 0LL);
    *uint64_t v18 = 0;
    _Block_copy(a3);
    Swift::String v19 = (void *)_convertErrorToNSError(_:)(v17);
    ((void (**)(void, void *))a3)[2](a3, v19);

    swift_errorRelease(v17);
    swift_release(v6);
    _Block_release(a3);
  }

void sub_100037124(uint64_t *a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v47 = a5;
  unint64_t v48 = a4;
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *a1;
  uint64_t v13 = type metadata accessor for DynamicAccountsStore();
  uint64_t v14 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v13, v12, v13, v14);
  uint64_t v15 = v51[0];
  unint64_t v16 = DynamicAccountsStore.account.getter();
  id v17 = objc_msgSend(v16, "ams_DSID");

  id v46 = a2;
  DynamicAccountsStore.account.setter(a2);
  uint64_t v18 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v19 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))
        + 3LL * *(void *)(v19 + 72),
          *(unsigned __int8 *)(v19 + 80) | 7LL);
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_10003BCD0;
  uint64_t v52 = (void *)type metadata accessor for ServiceConnectionExportedObject(0LL);
  v51[0] = a3;
  uint64_t v21 = swift_retain(a3);
  id v22 = (id)AMSLogKey(v21);
  if (v22)
  {
    Swift::String v23 = v22;
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    uint64_t v26 = v25;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v27._uint64_t countAndFlagsBits = 0LL;
    v27._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    uint64_t v28 = v52;
    unint64_t v29 = sub_100007060(v51, (uint64_t)v52);
    uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v49[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v49);
    sub_100029634((uint64_t)v49, (uint64_t *)&unk_1000509C0);
    v31._uint64_t countAndFlagsBits = 5972026LL;
    v31._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v31);
    uint64_t MetatypeMetadata = &type metadata for String;
    v49[0] = v24;
    v49[1] = v26;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v49);
    sub_100029634((uint64_t)v49, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v33._uint64_t countAndFlagsBits = 0LL;
    v33._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v33);
    uint64_t v34 = v52;
    uint64_t v35 = sub_100007060(v51, (uint64_t)v52);
    uint64_t v36 = swift_getDynamicType(v35, v34, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v36);
    v49[0] = v36;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v49);
    sub_100029634((uint64_t)v49, (uint64_t *)&unk_1000509C0);
    uint64_t v32 = 58LL;
  }

  unint64_t v37 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v32);
  LogMessage.init(stringInterpolation:)(v11);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v51);
  LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x800000010003FB10LL);
  v51[0] = 0x203A646C6FLL;
  v51[1] = 0xE500000000000000LL;
  v49[0] = v17;
  id v38 = v17;
  uint64_t v39 = sub_100006674(&qword_100051CD8);
  v40._uint64_t countAndFlagsBits = String.init<A>(describing:)(v49, v39);
  object = v40._object;
  String.append(_:)(v40);
  swift_bridgeObjectRelease(object);
  v42._uint64_t countAndFlagsBits = 0x203A77656E20LL;
  v42._object = (void *)0xE600000000000000LL;
  String.append(_:)(v42);
  v49[0] = objc_msgSend(v46, "ams_DSID");
  v43._uint64_t countAndFlagsBits = String.init<A>(describing:)(v49, v39);
  uint64_t v44 = v43._object;
  String.append(_:)(v43);
  swift_bridgeObjectRelease(v44);
  uint64_t v52 = &type metadata for String;
  static LogMessage.sensitive(_:)(v51);
  sub_100029634((uint64_t)v51, (uint64_t *)&unk_1000509C0);
  sub_10002C300(v20);
  swift_bridgeObjectRelease(v20);
  v48(0LL);
  swift_release(v15);
}

uint64_t sub_100037500(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v11 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
        + 2LL * *(void *)(v11 + 72),
          *(unsigned __int8 *)(v11 + 80) | 7LL);
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v39 = type metadata accessor for ServiceConnectionExportedObject(0LL);
  v38[0] = a2;
  uint64_t v13 = swift_retain(a2);
  id v14 = (id)AMSLogKey(v13);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v18 = v17;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v19._uint64_t countAndFlagsBits = 0LL;
    v19._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v19);
    uint64_t v20 = v39;
    uint64_t v21 = sub_100007060(v38, v39);
    uint64_t DynamicType = swift_getDynamicType(v21, v20, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(DynamicType);
    v36[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    v23._uint64_t countAndFlagsBits = 5972026LL;
    v23._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v23);
    uint64_t MetatypeMetadata = &type metadata for String;
    v36[0] = v16;
    v36[1] = v18;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    uint64_t v24 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v25._uint64_t countAndFlagsBits = 0LL;
    v25._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    uint64_t v26 = v39;
    Swift::String v27 = sub_100007060(v38, v39);
    uint64_t v28 = swift_getDynamicType(v27, v26, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata(v28);
    v36[0] = v28;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v36);
    sub_100029634((uint64_t)v36, (uint64_t *)&unk_1000509C0);
    uint64_t v24 = 58LL;
  }

  unint64_t v29 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
  LogMessage.init(stringInterpolation:)(v9);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v38);
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(23LL, 1LL);
  v30._object = (void *)0x800000010003FAF0LL;
  v30._uint64_t countAndFlagsBits = 0xD000000000000017LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v30);
  swift_getErrorValue(a1);
  uint64_t v31 = v35;
  uint64_t v39 = v35;
  sub_10000D298(v38);
  (*(void (**)(void))(*(void *)(v31 - 8) + 16LL))();
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v38);
  sub_100029634((uint64_t)v38, (uint64_t *)&unk_1000509C0);
  v32._uint64_t countAndFlagsBits = 0LL;
  v32._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v32);
  LogMessage.init(stringInterpolation:)(v9);
  sub_10002C300(v12);
  swift_bridgeObjectRelease(v12);
  return a3(a1);
}

uint64_t sub_100037858()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10003787C(uint64_t a1)
{
}

unint64_t sub_100037884()
{
  unint64_t result = qword_100051CD0;
  if (!qword_100051CD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D574, &type metadata for ServiceConnectionExportedObject.PerformError);
    atomic_store(result, (unint64_t *)&qword_100051CD0);
  }

  return result;
}

uint64_t sub_1000378C0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100037924;
  return v6(a1);
}

uint64_t sub_100037924()
{
  return sub_1000382E0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10003794C()
{
  swift_release(*(void *)(v0 + 24));
  swift_release(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_100037980(uint64_t *a1)
{
}

uint64_t sub_100037990(uint64_t a1)
{
  return sub_100037500(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

void sub_1000379A0(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000379A8()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000379D0(uint64_t *a1)
{
  return sub_1000362A0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(char **)(v1 + 32));
}

unint64_t sub_1000379DC()
{
  unint64_t result = qword_100051CE0;
  if (!qword_100051CE0)
  {
    uint64_t v1 = sub_10000D01C(&qword_100050768);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100051CE0);
  }

  return result;
}

uint64_t sub_100037A20(uint64_t *a1)
{
  return sub_100032DA8(*a1, a1[1]);
}

uint64_t sub_100037A30(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v16[3] = sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  v16[4] = &protocol witness table for OS_dispatch_queue;
  v16[0] = a3;
  uint64_t v13 = Promise.__allocating_init()(a3);
  id v14 = (void *)swift_allocObject(a5, 40LL, 7LL);
  v14[2] = v13;
  v14[3] = a1;
  v14[4] = a2;
  swift_retain_n(v13, 2LL);
  swift_retain(a2);
  Promise.then(perform:orCatchError:on:)(a6, v13, a7, v14, v16);
  swift_release(v13);
  swift_release(v14);
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v16);
  return v13;
}

uint64_t sub_100037B28(uint64_t *a1)
{
  return sub_1000362D0(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, void, void))(v1 + 24));
}

uint64_t sub_100037B38(uint64_t a1)
{
  return sub_10003657C(a1, *(void *)(v1 + 16), *(uint64_t (**)(void, unint64_t, uint64_t))(v1 + 24));
}

uint64_t sub_100037B44(uint64_t *a1)
{
  return sub_100037A20(a1);
}

uint64_t sub_100037B50(uint64_t a1)
{
  return sub_100032DD8(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

unint64_t sub_100037B6C()
{
  unint64_t result = qword_100051CF8;
  if (!qword_100051CF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D534, &type metadata for ServiceConnectionExportedObject.BootstrapError);
    atomic_store(result, (unint64_t *)&qword_100051CF8);
  }

  return result;
}

uint64_t sub_100037BA8(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t sub_100037BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_100051CF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100037C04(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t sub_100037C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_100051CF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100037C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006674(&qword_100051CF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100037CAC(uint64_t a1)
{
  return sub_100035620(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24));
}

uint64_t sub_100037CB8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100037CE0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100037D08(uint64_t a1)
{
  return sub_100035894(a1, *(void *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24));
}

unint64_t sub_100037D14()
{
  unint64_t result = qword_100051D08;
  if (!qword_100051D08)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for MetricsContext,  &type metadata for MetricsContext);
    atomic_store(result, (unint64_t *)&qword_100051D08);
  }

  return result;
}

unint64_t sub_100037D50()
{
  unint64_t result = qword_100051D10;
  if (!qword_100051D10)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003CE70, &type metadata for MediaClient);
    atomic_store(result, (unint64_t *)&qword_100051D10);
  }

  return result;
}

unint64_t sub_100037D8C()
{
  unint64_t result = qword_100051D28;
  if (!qword_100051D28)
  {
    uint64_t v1 = type metadata accessor for JSServiceRequest(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for JSServiceRequest, v1);
    atomic_store(result, (unint64_t *)&qword_100051D28);
  }

  return result;
}

unint64_t sub_100037DCC()
{
  unint64_t result = qword_100051D30;
  if (!qword_100051D30)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003C2D0, &type metadata for DynamicUIFeatureFlags);
    atomic_store(result, &qword_100051D30);
  }

  return result;
}

uint64_t sub_100037E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100033BDC(a1, v2, a2);
}

void sub_100037E20(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = a2(0LL);
  sub_100024828(v2);
  sub_10000870C();
}

uint64_t sub_100037E48()
{
  uint64_t v1 = sub_10002488C();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 16));
  uint64_t v6 = v0 + v4 + *(int *)(v1 + 24);
  uint64_t v7 = type metadata accessor for URL(0LL);
  unint64_t v8 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + v8));
  swift_release(*(void *)(v0 + v9));
  swift_release(*(void *)(v0 + v10));
  return swift_deallocObject(v0, v10 + 8, v3 | 7);
}

uint64_t sub_100037F34(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_10002488C() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[4];
  uint64_t v11 = (uint64_t)v1 + v5;
  uint64_t v12 = *(void *)((char *)v1 + v6);
  uint64_t v13 = *(void *)((char *)v1 + v7);
  uint64_t v14 = *(void *)((char *)v1 + ((v7 + 15) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v15 = (void *)swift_task_alloc(dword_100051D3C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v15;
  void *v15 = v2;
  v15[1] = sub_100038004;
  return sub_100033508(a1, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_100038004()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100038030()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100038054(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc(dword_100051D4C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1000380C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100051D48 + dword_100051D48))(a1, v4);
}

uint64_t sub_1000380C4()
{
  return sub_1000382E0(*(uint64_t (**)(void))(v0 + 8));
}

ValueMetadata *type metadata accessor for ServiceConnectionExportedObject.BootstrapError()
{
  return &type metadata for ServiceConnectionExportedObject.BootstrapError;
}

uint64_t _s34AppleMediaServicesUIDynamicService31ServiceConnectionExportedObjectC14BootstrapErrorOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(__chkstk_darwin(v3, v4) = 1;
  }
  else {
    LODWORD(__chkstk_darwin(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_10003814C + 4 * byte_10003D3C5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100038180 + 4 * byte_10003D3C0[v4]))();
}

uint64_t sub_100038180(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100038188(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100038190LL);
  }
  return result;
}

uint64_t sub_10003819C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000381A4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1000381A8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000381B0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceConnectionExportedObject.PerformError()
{
  return &type metadata for ServiceConnectionExportedObject.PerformError;
}

unint64_t sub_1000381D0()
{
  unint64_t result = qword_100051D58;
  if (!qword_100051D58)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D4A4, &type metadata for ServiceConnectionExportedObject.PerformError);
    atomic_store(result, (unint64_t *)&qword_100051D58);
  }

  return result;
}

unint64_t sub_100038210()
{
  unint64_t result = qword_100051D60;
  if (!qword_100051D60)
  {
    unint64_t result = swift_getWitnessTable(&unk_10003D50C, &type metadata for ServiceConnectionExportedObject.BootstrapError);
    atomic_store(result, (unint64_t *)&qword_100051D60);
  }

  return result;
}

uint64_t sub_100038270()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100038290()
{
  uint64_t v1 = *(void *)(v0 - 104);
  uint64_t v2 = sub_100007060((void *)(v0 - 128), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_1000382B4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000382D0(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 160);
}

uint64_t sub_1000382E0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000382EC()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 160);
}

uint64_t sub_1000382F4()
{
  return LogMessage.init(stringLiteral:)(0xD000000000000025LL, (v0 - 32) | 0x8000000000000000LL);
}

uint64_t sub_100038308@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_allocObject(v2, a1, a2 | 7);
}

uint64_t sub_100038314()
{
  return type metadata accessor for LogMessage(0LL);
}

uint64_t sub_100038320(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for ServiceConnectionExportedObject(0LL);
}

uint64_t sub_100038330()
{
  return type metadata accessor for Log();
}

uint64_t sub_100038338()
{
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((void *)(v0 - 128));
}

uint64_t sub_100038340(uint64_t a1, uint64_t a2)
{
  return sub_100007438(a1, a2, 1LL, v2);
}

uint64_t sub_10003834C()
{
  return swift_release(*(void *)(v0 + 16));
}

uint64_t sub_100038354()
{
  return swift_release(v0);
}

uint64_t sub_10003835C()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

uint64_t sub_100038364()
{
  return swift_retain(v0);
}

  ;
}

void sub_100038378(uint64_t a1)
{
  unint64_t v1 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

uint64_t sub_100038380(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for ServiceConnectionExportedObject(0LL);
}

uint64_t sub_10003838C()
{
  return swift_retain(v0);
}

uint64_t sub_100038394()
{
  return swift_getMetatypeMetadata();
}

uint64_t sub_10003839C()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0);
}

void sub_1000383A4()
{
}

char *sub_1000383B0(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v5 = &v4[(v3 + 16LL) & ~(unint64_t)v3];
    swift_retain(v4);
  }

  else
  {
    unint64_t v5 = a1;
    unint64_t v6 = a2[1];
    unint64_t v7 = a2[2];
    *((void *)a1 + 1) = v6;
    *((void *)a1 + 2) = v7;
    a1[24] = *((_BYTE *)a2 + 24);
    uint64_t v8 = a2[4];
    *((void *)a1 + 4) = v8;
    uint64_t v9 = *(int *)(a3 + 32);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = type metadata accessor for URL(0LL);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL);
    uint64_t v14 = v4;
    swift_unknownObjectRetain(v6);
    uint64_t v15 = v7;
    swift_bridgeObjectRetain(v8);
    v13(v10, v11, v12);
  }

  return v5;
}

uint64_t sub_100038480(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease(*(void *)(a1 + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + 32));
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_1000384E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  unint64_t v6 = *(void **)(a2 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(int *)(a3 + 32);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
  id v13 = v5;
  swift_unknownObjectRetain(v4);
  id v14 = v6;
  swift_bridgeObjectRetain(v7);
  v12(v9, v10, v11);
  return a1;
}

uint64_t sub_100038588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  swift_unknownObjectRetain(v9);
  swift_unknownObjectRelease(v10);
  uint64_t v11 = *(void **)(a2 + 16);
  uint64_t v12 = *(void **)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v11;
  id v13 = v11;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24LL))(v17, v18, v19);
  return a1;
}

uint64_t sub_100038644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

uint64_t sub_1000386B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_unknownObjectRelease(v7);
  id v8 = *(void **)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for URL(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40LL))(v11, v12, v13);
  return a1;
}

uint64_t sub_100038754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100038760);
}

uint64_t sub_100038760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(__chkstk_darwin(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for URL(0LL);
    return sub_10000748C(a1 + *(int *)(a3 + 32), a2, v8);
  }

uint64_t sub_1000387D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000387E0);
}

uint64_t sub_1000387E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    return sub_100007438(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for ServiceOptions(uint64_t a1)
{
  uint64_t result = qword_100051DC8;
  if (!qword_100051DC8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceOptions);
  }
  return result;
}

uint64_t sub_100038884(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = &unk_10003D5F0;
  void v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  void v4[3] = &unk_10003D608;
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    void v4[4] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_100038918(id **a1, uint64_t *a2)
{
  uint64_t v5 = type metadata accessor for ServiceOptions(0LL);
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v7, v10);
  uint64_t v13 = (id *)((char *)&v65 - v12);
  uint64_t v15 = __chkstk_darwin(v11, v14);
  __chkstk_darwin(v15, v16);
  sub_100038EA4();
  uint64_t v70 = v17;
  sub_100026AEC();
  __chkstk_darwin(v18, v19);
  sub_100038EA4();
  uint64_t v69 = v20;
  sub_100026AEC();
  __chkstk_darwin(v21, v22);
  sub_100038EA4();
  uint64_t v68 = v23;
  sub_100026AEC();
  __chkstk_darwin(v24, v25);
  sub_100038EA4();
  uint64_t v72 = v26;
  sub_100026AEC();
  uint64_t v29 = __chkstk_darwin(v27, v28);
  uint64_t v31 = (id *)((char *)&v65 - v30);
  uint64_t v33 = __chkstk_darwin(v29, v32);
  uint64_t v35 = (id *)((char *)&v65 - v34);
  uint64_t v37 = __chkstk_darwin(v33, v36);
  uint64_t v39 = (id *)((char *)&v65 - v38);
  Swift::String v40 = *a1;
  uint64_t v41 = *a2;
  uint64_t v71 = v42;
  if (!v40)
  {
    if (!v41)
    {
      uint64_t v65 = v37;
      sub_100038E5C((uint64_t)a1);
      sub_100038E74((uint64_t)a2);
      goto LABEL_14;
    }

    goto LABEL_6;
  }

  if (!v41)
  {
LABEL_6:
    sub_100038E5C((uint64_t)a1);
    sub_100038E74((uint64_t)a2);
    goto LABEL_7;
  }

  uint64_t v65 = v37;
  sub_100007498(0LL, (unint64_t *)&qword_1000503B0, &OBJC_CLASS___ACAccount_ptr);
  uint64_t v41 = (uint64_t)(id)v41;
  Swift::String v43 = v40;
  Swift::String v40 = v13;
  uint64_t v44 = v43;
  uint64_t v2 = static NSObject.== infix(_:_:)(v43, v41);

  uint64_t v13 = v40;
  sub_100038E5C((uint64_t)a1);
  sub_100038E74((uint64_t)a2);
  if ((v2 & 1) == 0)
  {
LABEL_7:
    sub_100038E6C();
    sub_100038E64();
    sub_100038E7C();
    sub_100038E2C();
    goto LABEL_8;
  }

uint64_t sub_100038DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ServiceOptions(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100038DF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ServiceOptions(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100038E2C()
{
  return sub_100038DAC(v0, *(void *)(v1 - 88));
}

uint64_t sub_100038E3C()
{
  return sub_100038DAC(v0, *(void *)(v1 - 112));
}

uint64_t sub_100038E4C()
{
  return sub_100038DAC(v0, *(void *)(v1 - 120));
}

uint64_t sub_100038E5C(uint64_t a1)
{
  return sub_100038DAC(a1, v1);
}

uint64_t sub_100038E64()
{
  return sub_100038DF0(v0);
}

uint64_t sub_100038E6C()
{
  return sub_100038DF0(v0);
}

uint64_t sub_100038E74(uint64_t a1)
{
  return sub_100038DAC(a1, v1);
}

uint64_t sub_100038E7C()
{
  return sub_100038DAC(v1, v0);
}

uint64_t sub_100038E88()
{
  return sub_100038DAC(v0, *(void *)(v1 - 96));
}

uint64_t sub_100038E98()
{
  return swift_bridgeObjectRelease_n(v0, 2LL);
}

  ;
}

uint64_t sub_100038EB0()
{
  return sub_100038DAC(v0, v1);
}

uint64_t sub_100038EBC()
{
  return sub_100038DAC(v0, v1);
}

uint64_t sub_100038EC8()
{
  return sub_100038DF0(v0);
}

void sub_100038ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100038EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100038F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  if (qword_1000501A8 != -1) {
    swift_once(&qword_1000501A8, sub_100031424);
  }
  uint64_t v12 = sub_10003145C();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v16[4] = a2;
    uint64_t v17 = a3;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256LL;
    v16[2] = a4;
    v16[3] = a5;
    uint64_t v14 = _Block_copy(v16);
    uint64_t v15 = v17;
    swift_retain(a3);
    swift_release(v15);
    objc_msgSend(v13, *a6, a1, v14);
    swift_unknownObjectRelease(v13);
    _Block_release(v14);
  }

void sub_100038FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100039018(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void (**)(void *, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v8 = a2;
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

uint64_t type metadata accessor for ServiceRequestHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService21ServiceRequestHandler);
}

uint64_t sub_1000390AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000390BC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

CFRunLoopMode sub_1000390D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  __chkstk_darwin();
  sub_1000168D8();
  uint64_t v5 = v4 - v3;
  uint64_t v38 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v6 = *(void *)(v38 - 8);
  __chkstk_darwin();
  sub_1000168D8();
  uint64_t v9 = v8 - v7;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin();
  sub_1000168D8();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v14 = type metadata accessor for LogMessage(0LL);
  uint64_t v15 = swift_allocObject( v13,  ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v14 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v15 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  Swift::String v40 = (void *)type metadata accessor for ServiceStartupTask();
  aBlock[0] = v1;
  uint64_t v16 = swift_retain(v1);
  id v17 = (id)AMSLogKey(v16);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v35 = v6;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v20 = v1;
    uint64_t v21 = v9;
    uint64_t v23 = v22;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    sub_100008D80();
    sub_1000168AC();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100016928(MetatypeMetadata);
    sub_100008DB4();
    v25._uint64_t countAndFlagsBits = 5972026LL;
    v25._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v25);
    void v43[3] = &type metadata for String;
    v43[0] = v19;
    v43[1] = v23;
    uint64_t v6 = v35;
    uint64_t v9 = v21;
    uint64_t v1 = v20;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
    sub_100008DB4();
    uint64_t v26 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    sub_100008D80();
    sub_1000168AC();
    uint64_t v27 = swift_getMetatypeMetadata();
    sub_100016928(v27);
    sub_100008DB4();
    uint64_t v26 = 58LL;
  }

  unint64_t v28 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
  LogMessage.init(stringInterpolation:)(v12);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(aBlock);
  LogMessage.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010003FE90LL);
  sub_10002C300(v15);
  swift_bridgeObjectRelease(v15);
  setenv("JSC_criticalGCMemoryThreshold", "0.25", 1);
  [(id)objc_opt_self(AMSEphemeralDefaults) setBagKeyRegistrationEnabled:0];
  CFRunLoopMode result = kCFRunLoopCommonModes;
  if (kCFRunLoopCommonModes)
  {
    static Unstable.runLoopInstallAutoreleasePools(for:)();
    sub_100007498(0LL, &qword_100051FC8, &OBJC_CLASS___OS_dispatch_source_ptr);
    sub_100007498(0LL, (unint64_t *)&qword_1000506E0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v30 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v31 = static OS_dispatch_source.makeSignalSource(signal:queue:)(15LL, v30);

    uint64_t ObjectType = swift_getObjectType(v31);
    uint64_t v41 = sub_100039784;
    uint64_t v42 = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100031E64;
    Swift::String v40 = &unk_10004B598;
    uint64_t v33 = _Block_copy(aBlock);
    uint64_t v34 = swift_retain(v1);
    static DispatchQoS.unspecified.getter(v34);
    sub_1000396E8();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)(v9, v5, v33, ObjectType);
    _Block_release(v33);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v5, v37);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v38);
    swift_release(v42);
    OS_dispatch_source.resume()();
    if (qword_1000501B0 != -1) {
      swift_once(&qword_1000501B0, sub_100032204);
    }
    sub_100032244();
    return (CFRunLoopMode)swift_unknownObjectRelease(v31);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_1000394C0(uint64_t a1)
{
  uint64_t v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100006674((uint64_t *)&unk_100051BB0);
  uint64_t v5 = type metadata accessor for LogMessage(0LL);
  uint64_t v6 = swift_allocObject( v4,  ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL))
       + 2LL * *(void *)(*(void *)(v5 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v6 + swift_weakDestroy(v0 + 16) = xmmword_10003BD40;
  uint64_t v27 = type metadata accessor for ServiceStartupTask();
  v26[0] = a1;
  uint64_t v7 = swift_retain(a1);
  id v8 = (id)AMSLogKey(v7);
  if (v8)
  {
    uint64_t v14 = v8;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    uint64_t v17 = v16;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
    v18._uint64_t countAndFlagsBits = 0LL;
    v18._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v18);
    uint64_t v19 = v27;
    uint64_t v20 = sub_100007060(v26, v27);
    uint64_t DynamicType = swift_getDynamicType(v20, v19, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v24[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v24);
    sub_100008D04((uint64_t)v24);
    v22._uint64_t countAndFlagsBits = 5972026LL;
    v22._object = (void *)0xE300000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v22);
    uint64_t MetatypeMetadata = &type metadata for String;
    v24[0] = v15;
    v24[1] = v17;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v24);
    sub_100008D04((uint64_t)v24);
    uint64_t v13 = 93LL;
  }

  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
    v9._uint64_t countAndFlagsBits = 0LL;
    v9._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v9);
    uint64_t v10 = v27;
    uint64_t v11 = sub_100007060(v26, v27);
    uint64_t v12 = swift_getDynamicType(v11, v10, 1LL);
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v24[0] = v12;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v24);
    sub_100008D04((uint64_t)v24);
    uint64_t v13 = 58LL;
  }

  unint64_t v23 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v13);
  LogMessage.init(stringInterpolation:)(v3);
  type metadata accessor for Log();
  _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0(v26);
  LogMessage.init(stringLiteral:)(0xD000000000000021LL, 0x800000010003FEE0LL);
  sub_10002C300(v6);
  swift_bridgeObjectRelease(v6);
  exit(0);
}

uint64_t sub_1000396E8()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v5 = &_swiftEmptyArrayStorage;
  unint64_t v1 = sub_1000397A4();
  uint64_t v2 = sub_100006674(&qword_100051FD8);
  unint64_t v3 = sub_1000397E4();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

uint64_t type metadata accessor for ServiceStartupTask()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService18ServiceStartupTask);
}

void sub_100039784()
{
}

uint64_t sub_10003978C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10003979C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_1000397A4()
{
  unint64_t result = qword_100051FD0;
  if (!qword_100051FD0)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100051FD0);
  }

  return result;
}

unint64_t sub_1000397E4()
{
  unint64_t result = qword_100051FE0;
  if (!qword_100051FE0)
  {
    uint64_t v1 = sub_10000D01C(&qword_100051FD8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100051FE0);
  }

  return result;
}

void sub_100039828()
{
  uint64_t v2 = sub_100039FF4();
  unint64_t v3 = (__n128 *)sub_100039EB8(v2);
  uint64_t v4 = sub_10003A05C(v3, (__n128)xmmword_10003BCD0);
  sub_100039FB8(v4);
  id v5 = (id)sub_10003A054();
  if (v5)
  {
    sub_10003A034((uint64_t)v5);
    sub_100039F00();
    sub_100008DDC();
    sub_100008D80();
    sub_100039F34();
    sub_10003A03C();
    sub_100008D8C();
    sub_100008D94();
    sub_100008DBC();
    sub_100039EE0((uint64_t)&type metadata for String);
    sub_100008D94();
    uint64_t v6 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    sub_100039F70();
    sub_10003A06C();
    sub_100008D8C();
    sub_100008D94();
    uint64_t v6 = 58LL;
  }

  sub_100039FDC(v6);
  sub_100039FD0();
  sub_100038330();
  sub_10003A000();
  uint64_t v7 = sub_10003A044(33LL, 0x800000010003FFB0LL);
  uint64_t v8 = sub_1000090C0(v7, (unint64_t *)&unk_1000520F0, &OBJC_CLASS___AMSAuthenticateRequest_ptr);
  sub_100039FC4(v8);
  sub_100039F94();
  sub_100008DB4();
  sub_10003A064();
  sub_100013CB8();
  sub_10003A04C();
  uint64_t v9 = sub_100039FE8();
  sub_100039F58(v9);
  uint64_t v10 = sub_100039FA4();
  sub_100038ED0(v10, v11, v12);
  sub_100038354();
  sub_100013C18();
}

void sub_1000399B4()
{
  uint64_t v2 = sub_100039FF4();
  unint64_t v3 = (__n128 *)sub_100039EB8(v2);
  uint64_t v4 = sub_10003A05C(v3, (__n128)xmmword_10003BCD0);
  sub_100039FB8(v4);
  id v5 = (id)sub_10003A054();
  if (v5)
  {
    sub_10003A034((uint64_t)v5);
    sub_100039F00();
    sub_100008DDC();
    sub_100008D80();
    sub_100039F34();
    sub_10003A03C();
    sub_100008D8C();
    sub_100008D94();
    sub_100008DBC();
    sub_100039EE0((uint64_t)&type metadata for String);
    sub_100008D94();
    uint64_t v6 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    sub_100039F70();
    sub_10003A06C();
    sub_100008D8C();
    sub_100008D94();
    uint64_t v6 = 58LL;
  }

  sub_100039FDC(v6);
  sub_100039FD0();
  sub_100038330();
  sub_10003A000();
  uint64_t v7 = sub_10003A044(25LL, 0x800000010003FF90LL);
  uint64_t v8 = sub_1000090C0(v7, &qword_1000520E8, &OBJC_CLASS___AMSDialogRequest_ptr);
  sub_100039FC4(v8);
  sub_100039F94();
  sub_100008DB4();
  sub_10003A064();
  sub_100013CB8();
  sub_10003A04C();
  uint64_t v9 = sub_100039FE8();
  sub_100039F58(v9);
  uint64_t v10 = sub_100039FA4();
  sub_100038EF0(v10, v11, v12);
  sub_100038354();
  sub_100013C18();
}

uint64_t sub_100039B40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(void))
{
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  Swift::String v18 = v17;
  uint64_t v20 = _Block_copy(v19);
  uint64_t v21 = swift_allocObject(v10, 24LL, 7LL);
  *(void *)(v21 + swift_weakDestroy(v0 + 16) = v20;
  id v22 = v16;
  id v23 = v14;
  id v24 = v12;
  id v25 = v18;
  a9();

  return swift_release(v21);
}

void sub_100039BF4()
{
  uint64_t v2 = sub_100039FF4();
  unint64_t v3 = (__n128 *)sub_100039EB8(v2);
  uint64_t v4 = sub_10003A05C(v3, (__n128)xmmword_10003BCD0);
  sub_100039FB8(v4);
  id v5 = (id)sub_10003A054();
  if (v5)
  {
    sub_10003A034((uint64_t)v5);
    sub_100039F00();
    sub_100008DDC();
    sub_100008D80();
    sub_100039F34();
    sub_10003A03C();
    sub_100008D8C();
    sub_100008D94();
    sub_100008DBC();
    sub_100039EE0((uint64_t)&type metadata for String);
    sub_100008D94();
    uint64_t v6 = 93LL;
  }

  else
  {
    sub_100008DEC();
    sub_100008D80();
    sub_100039F70();
    sub_10003A06C();
    sub_100008D8C();
    sub_100008D94();
    uint64_t v6 = 58LL;
  }

  sub_100039FDC(v6);
  sub_100039FD0();
  sub_100038330();
  sub_10003A000();
  uint64_t v7 = sub_10003A044(29LL, 0x800000010003FF70LL);
  uint64_t v8 = sub_1000090C0(v7, &qword_1000520E0, &OBJC_CLASS___AMSEngagementRequest_ptr);
  sub_100039FC4(v8);
  sub_100039F94();
  sub_100008DB4();
  sub_10003A064();
  sub_100013CB8();
  sub_10003A04C();
  uint64_t v9 = sub_100039FE8();
  sub_100039F58(v9);
  uint64_t v10 = sub_100039FA4();
  sub_100038FFC(v10, v11, v12);
  sub_100038354();
  sub_100013C18();
}

void sub_100039D80()
{
}

void sub_100039DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id sub_100039E10()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for URLSessionHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for URLSessionHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC34AppleMediaServicesUIDynamicService17URLSessionHandler);
}

uint64_t sub_100039E70()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100039E94(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100039EB8(uint64_t a1)
{
  return swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL))
         + 3LL * *(void *)(*(void *)(a1 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) | 7LL);
}

uint64_t sub_100039EE0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 120) = a1;
  *(void *)(v3 - 144) = v1;
  *(void *)(v3 - 136) = v2;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v3 - 144);
}

void sub_100039F00()
{
  *(void *)(v2 - 152) = v0;
}

uint64_t sub_100039F1C()
{
  return type metadata accessor for LogMessage.StringInterpolation(0LL);
}

uint64_t sub_100039F34()
{
  uint64_t v1 = *(void *)(v0 - 88);
  uint64_t v2 = sub_100007060((void *)(v0 - 112), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_100039F58(uint64_t a1)
{
  return inject<A, B>(_:from:)(v1, v2, v1, a1);
}

uint64_t sub_100039F70()
{
  uint64_t v1 = *(void *)(v0 - 88);
  uint64_t v2 = sub_100007060((void *)(v0 - 112), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_100039F94()
{
  return static LogMessage.safe(_:)(v0 - 112);
}

uint64_t sub_100039FA4()
{
  return v0;
}

id sub_100039FB8(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return v1;
}

id sub_100039FC4(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return v1;
}

uint64_t sub_100039FD0()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

void sub_100039FDC(uint64_t a1)
{
  unint64_t v1 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

uint64_t sub_100039FE8()
{
  return type metadata accessor for BaseObjectGraph(0LL);
}

uint64_t sub_100039FF4()
{
  return type metadata accessor for LogMessage(0LL);
}

uint64_t sub_10003A000()
{
  return _s34AppleMediaServicesUIDynamicService9JSAccountVwxx_0((void *)(v0 - 112));
}

  ;
}

uint64_t sub_10003A034(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_10003A03C()
{
  return swift_getMetatypeMetadata();
}

uint64_t sub_10003A044(uint64_t a1, uint64_t a2)
{
  return LogMessage.init(stringLiteral:)(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000LL, a2);
}

uint64_t sub_10003A04C()
{
  return type metadata accessor for ServiceRequestHandler();
}

uint64_t sub_10003A054()
{
  return AMSLogKey();
}

uint64_t sub_10003A05C(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return type metadata accessor for URLSessionHandler();
}

uint64_t sub_10003A064()
{
  return sub_10002C300(v0);
}

uint64_t sub_10003A06C()
{
  return swift_getMetatypeMetadata();
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}