int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  id v5;
  v3 = objc_autoreleasePoolPush();
  sub_100003CFC(qword_10002ED30);
  objc_autoreleasePoolPop(v3);
  v4 = objc_autoreleasePoolPush();
  sub_100017004();
  objc_autoreleasePoolPop(v4);
  v5 = [(id)objc_opt_self(NSRunLoop) currentRunLoop];
  [v5 run];

  return 0;
}

uint64_t sub_100003CFC@<X0>(uint64_t *a1@<X8>)
{
  v13[3] = &type metadata for AAFeatureFlags;
  v13[4] = sub_1000044F4();
  LOBYTE(v13[0]) = 0;
  char v2 = isFeatureEnabled(_:)(v13);
  sub_100004538(v13);
  if ((v2 & 1) == 0)
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_100004558(v9, (uint64_t)qword_100032790);
    v10 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "AAFeatureFlags.runAppleAccountdOntvOS = false, appleaccountd will not run on this platform",  v12,  2u);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    exit(0);
  }

  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100004558(v3, (uint64_t)qword_100032790);
  v4 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "AAFeatureFlags.runAppleAccountdOntvOS = true, launching appleaccountd",  v6,  2u);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  uint64_t v7 = type metadata accessor for AppleAccountDaemon();
  swift_allocObject(v7, 24LL, 7LL);
  uint64_t result = sub_100016834();
  a1[3] = v7;
  a1[4] = (uint64_t)&off_10002A0B0;
  *a1 = result;
  return result;
}

uint64_t variable initialization expression of OSActivity.activityState()
{
  return 0LL;
}

uint64_t sub_100003EF8(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF68,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_1000208C4);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100003F38(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF68,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_1000208C4);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100003F7C(uint64_t a1)
{
  uint64_t v2 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100003FBC()
{
  return *v0;
}

uint64_t sub_100003FC4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100003FCC(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF28,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_1000209DC);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_10000400C(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF28,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_1000209DC);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000404C(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_10000408C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(AAErrorDomain);
}

uint64_t sub_10000409C(uint64_t a1)
{
  uint64_t v2 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000040DC(uint64_t a1)
{
  uint64_t v2 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10000411C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100004180()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000041B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

void *sub_100004208@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100004218(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004224()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(AASignInErrorDomain);
}

uint64_t sub_100004234(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100004274(uint64_t a1)
{
  uint64_t v2 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000042B4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100004318(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100004368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[9] = *v3;
  Hasher.init(_seed:)(v7);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

uint64_t sub_1000043C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_10000441C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100004430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

__n128 sub_100004488(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004498(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000044B8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

unint64_t sub_1000044F4()
{
  unint64_t result = qword_100030210;
  if (!qword_100030210)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002194C, &type metadata for AAFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_100030210);
  }

  return result;
}

uint64_t sub_100004538(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100004558(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for AASignInError(uint64_t a1)
{
}

void type metadata accessor for AAError(uint64_t a1)
{
}

void type metadata accessor for AKRemoteDeviceRemovalReason(uint64_t a1)
{
}

uint64_t sub_1000045AC()
{
  return sub_100004604( &qword_10002EF08,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_1000207EC);
}

uint64_t sub_1000045D8()
{
  return sub_100004604( &qword_10002EF10,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020814);
}

uint64_t sub_100004604(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100004644()
{
  return sub_100004604( &qword_10002EF18,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020904);
}

uint64_t sub_100004670()
{
  return sub_100004604( &qword_10002EF20,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_10002092C);
}

uint64_t sub_10000469C()
{
  return sub_100004604( &qword_10002EF28,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_1000209DC);
}

uint64_t sub_1000046C8()
{
  return sub_100004604( &qword_10002EF30,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_1000209AC);
}

uint64_t sub_1000046F4()
{
  return sub_100004604( &qword_10002EF38,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_10002096C);
}

uint64_t sub_100004720()
{
  return sub_100004604(&qword_10002EF40, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_100020ABC);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_100004760()
{
  return sub_100004604(&qword_10002EF48, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_100020A84);
}

unint64_t sub_100004790()
{
  unint64_t result = qword_10002EF50;
  if (!qword_10002EF50)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10002EF50);
  }

  return result;
}

uint64_t sub_1000047D4()
{
  return sub_100004604(&qword_10002EF58, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_100020AF4);
}

uint64_t sub_100004800()
{
  return sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
}

uint64_t sub_10000482C()
{
  return sub_100004604( &qword_10002EF68,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_1000208C4);
}

uint64_t sub_100004858()
{
  return sub_100004604( &qword_10002EF70,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020894);
}

uint64_t sub_100004884()
{
  return sub_100004604( &qword_10002EF78,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020854);
}

uint64_t sub_1000048B0()
{
  return sub_100004604( &qword_10002EF80,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100020BBC);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_1000048F0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100004934()
{
  return sub_100004604( &qword_10002EF88,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100020B84);
}

uint64_t sub_100004960()
{
  return sub_100004604( &qword_10002EF90,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_100020BF4);
}

uint64_t sub_10000498C()
{
  return sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
}

uint64_t sub_1000049CC()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for WalrusPCSSignatureValidator()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd27WalrusPCSSignatureValidator);
}

uint64_t sub_1000049FC(char *a1, uint64_t a2, char a3)
{
  *(void *)(v4 + 24) = 0LL;
  *(void *)(v4 + 32) = 0LL;
  if ((a3 & 1) != 0)
  {
    if ((unint64_t)a1 >> 32)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }

    unsigned int v8 = a1 >> 11;
    if (a1 >> 11 == 27)
    {
      __break(1u);
    }

    else
    {
      unsigned int v8 = a1 >> 16;
      if (a1 >> 16 > 0x10)
      {
        __break(1u);
      }

      else if ((a1 & 0xFFFFFF80) == 0)
      {
        if (a1 > 0xFF)
        {
          __break(1u);
          goto LABEL_21;
        }

        unsigned int v9 = ((_BYTE)a1 + 1);
LABEL_11:
        *(void *)description = (v9 + 0xFEFEFEFEFEFEFFLL) & ~(-1LL << ((32 - (__clz(v9) & 0x38)) & 0x38));
        if (qword_10002ED58 == -1)
        {
LABEL_12:
          uint64_t v6 = (os_activity_s *)qword_10002F0B0;
          uint64_t v7 = description;
          goto LABEL_13;
        }

LABEL_21:
        swift_once(&qword_10002ED58, sub_100004C28);
        goto LABEL_12;
      }

      int v3 = (a1 & 0x3F) << 8;
      if (a1 < 0x800)
      {
        unsigned int v9 = (v3 | (a1 >> 6)) + 33217;
        goto LABEL_11;
      }
    }

    unsigned int v13 = (v3 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v14 = (((v13 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v15 = (v13 | (a1 >> 12)) + 8487393;
    if (v8) {
      unsigned int v9 = v14;
    }
    else {
      unsigned int v9 = v15;
    }
    goto LABEL_11;
  }

  if (!a1)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (qword_10002ED58 != -1) {
LABEL_16:
  }
    swift_once(&qword_10002ED58, sub_100004C28);
  uint64_t v6 = (os_activity_s *)qword_10002F0B0;
  uint64_t v7 = a1;
LABEL_13:
  os_activity_t v10 = _os_activity_create((void *)&_mh_execute_header, v7, v6, OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)(v4 + 16) = v10;
  swift_beginAccess(v4 + 24, description, 33LL, 0LL);
  os_log_type_t v11 = (os_activity_s *)swift_unknownObjectRetain(v10);
  os_activity_scope_enter(v11, (os_activity_scope_state_t)(v4 + 24));
  swift_endAccess(description);
  swift_unknownObjectRelease(v10);
  return v4;
}

Swift::Void __swiftcall OSActivity.close()()
{
}

uint64_t sub_100004C28()
{
  qword_10002F0B0 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

uint64_t OSActivity.deinit()
{
  return v0;
}

uint64_t OSActivity.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for OSActivity()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd10OSActivity);
}

uint64_t type metadata accessor for DaemonCDPFollowUpHandler()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd24DaemonCDPFollowUpHandler);
}

uint64_t sub_100004CD0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100005384;
  return v7();
}

uint64_t sub_100004D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_100005240(a1);
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
  uint64_t v16 = swift_allocObject(&unk_100029198, 32LL, 7LL);
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

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10002F300, v16);
}

uint64_t type metadata accessor for DaemonTaskDispatcher()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd20DaemonTaskDispatcher);
}

uint64_t sub_100004E8C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100004EF0;
  return v6(a1);
}

uint64_t sub_100004EF0()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100004F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_10002F2D8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1LL, 1LL, v7);
  uint64_t v9 = (void *)swift_allocObject(&unk_100029148, 48LL, 7LL);
  v9[2] = 0LL;
  uint64_t v10 = v9 + 2;
  v9[3] = 0LL;
  v9[4] = a1;
  v9[5] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7);
  uint64_t v11 = swift_retain(a2);
  if ((_DWORD)a1 == 1)
  {
    sub_100005240((uint64_t)v6);
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = 7168LL;
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    uint64_t v14 = v15 | 0x1C00LL;
    uint64_t v16 = *v10;
    if (*v10)
    {
      uint64_t v17 = v9[3];
      uint64_t ObjectType = swift_getObjectType(*v10);
      swift_unknownObjectRetain(v16);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v17);
      uint64_t v13 = v19;
      swift_unknownObjectRelease(v16);
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
    }
  }

  uint64_t v20 = swift_allocObject(&unk_100029170, 32LL, 7LL);
  *(void *)(v20 + 16) = &unk_10002F2E8;
  *(void *)(v20 + 24) = v9;
  if (v13 | v12)
  {
    v24[0] = 0LL;
    v24[1] = 0LL;
    v21 = v24;
    v24[2] = v12;
    v24[3] = v13;
  }

  else
  {
    v21 = 0LL;
  }

  uint64_t v22 = swift_task_create(v14, v21, (char *)&type metadata for () + 8, &unk_10002F2F8, v20);
  return swift_release(v22);
}

uint64_t sub_100005110(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005150()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000517C()
{
  uint64_t v2 = *(int **)(v0 + 32);
  int v3 = (void *)swift_task_alloc(dword_10002F2E4);
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = sub_1000051F8;
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc(v2[1]);
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_100005384;
  return v6();
}

uint64_t sub_1000051F8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100005240(uint64_t a1)
{
  uint64_t v2 = sub_100005110(&qword_10002F2D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100005280()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000052A4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10002F2F4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100005384;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002F2F0 + dword_10002F2F0))(a1, v4);
}

uint64_t sub_100005314(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10002F2F4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000051F8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002F2F0 + dword_10002F2F0))(a1, v4);
}

uint64_t sub_10000538C()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for DaemonAccountStore()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd18DaemonAccountStore);
}

uint64_t sub_1000053D8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_100005110((uint64_t *)&unk_10002F498);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v7);
  uint64_t v8 = sub_100005110(&qword_10002F560);
  uint64_t v9 = swift_allocObject(v8, 72LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_100020E10;
  uint64_t v10 = type metadata accessor for AppleIDAvailabilityHealthCheck(0LL);
  uint64_t v11 = swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  swift_retain(a2);
  uint64_t v12 = sub_100005110(&qword_10002F568);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v12);
  uint64_t v13 = sub_100005110(&qword_10002F570);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v13);
  uint64_t v14 = sub_100005110(&qword_10002F578);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v14);
  uint64_t v15 = sub_100005B44(0LL, &qword_10002F580, &OBJC_CLASS___AKAccountManager_ptr);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v15);
  uint64_t v16 = sub_100005B44(0LL, &qword_10002F588, &OBJC_CLASS___AADeviceInfo_ptr);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v16);
  uint64_t v17 = (void *)(v11 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck_reportEvent);
  void *v17 = a1;
  v17[1] = a2;
  *(void *)(v9 + 56) = v10;
  *(void *)(v9 + 64) = &off_10002A160;
  *(void *)(v9 + 32) = v11;
  uint64_t v42 = v9;
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_100004558(v18, (uint64_t)qword_1000327A8);
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v22 = static os_log_type_t.default.getter(v21);
  if (os_log_type_enabled(v20, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v24 = swift_slowAlloc(32LL, -1LL);
    v41[0] = v24;
    *(_DWORD *)v23 = 136315138;
    uint64_t v37 = a2;
    swift_beginAccess(&v42, v40, 0LL, 0LL);
    uint64_t v25 = v14;
    uint64_t v26 = v4;
    uint64_t v27 = v42;
    swift_bridgeObjectRetain(v42);
    uint64_t v28 = sub_100005110(&qword_10002F590);
    uint64_t v29 = Array.description.getter(v27, v28);
    unint64_t v31 = v30;
    uint64_t v32 = v27;
    uint64_t v4 = v26;
    uint64_t v14 = v25;
    swift_bridgeObjectRelease(v32);
    uint64_t v39 = sub_10001BAA4(v29, v31, v41);
    a2 = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40);
    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v20, v22, "activities: %s", v23, 0xCu);
    swift_arrayDestroy(v24, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1LL, -1LL);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  swift_beginAccess(&v42, v41, 0LL, 0LL);
  uint64_t v33 = v42;
  uint64_t v34 = type metadata accessor for AppleIDAvailabilityActivityProvider(0LL);
  uint64_t v35 = swift_allocObject(v34, *(unsigned int *)(v34 + 48), *(unsigned __int16 *)(v34 + 52));
  swift_bridgeObjectRetain(v33);
  Dependency.init(dependencyId:config:)(0LL, 0LL, 0LL, v14);
  *(void *)(v35 + 16) = v33;
  *(_BYTE *)(v35 + 24) = a3 & 1;
  swift_release(a2);
  *(void *)(v4 + OBJC_IVAR____TtC13appleaccountd28AppleIDAvailabilityScheduler_activityProvider) = v35;
  swift_bridgeObjectRelease(v33);
  return v4;
}

uint64_t sub_1000057EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005110(&qword_10002F598);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_100004558(v6, (uint64_t)qword_1000327A8);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v10 = static os_log_type_t.default.getter(v9);
  if (os_log_type_enabled(v8, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v10, "Scheduling Apple ID Availability activity", v11, 2u);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))( v5,  v1 + OBJC_IVAR____TtC13appleaccountd28AppleIDAvailabilityScheduler__xpcActivityScheduler,  v2);
  Dependency.wrappedValue.getter(v18, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v12 = sub_100005B7C(v18, v18[3]);
  uint64_t v13 = *(void *)(v1 + OBJC_IVAR____TtC13appleaccountd28AppleIDAvailabilityScheduler_activityProvider);
  uint64_t v14 = *v12;
  uint64_t v15 = swift_retain(v13);
  sub_100005BA0(v15, v14);
  swift_release(v13);
  return sub_100004538(v18);
}

uint64_t sub_100005988()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13appleaccountd28AppleIDAvailabilityScheduler__xpcActivityScheduler;
  uint64_t v2 = sub_100005110(&qword_10002F598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC13appleaccountd28AppleIDAvailabilityScheduler_activityProvider));
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1000059EC()
{
  return type metadata accessor for AppleIDAvailabilityScheduler(0LL);
}

uint64_t type metadata accessor for AppleIDAvailabilityScheduler(uint64_t a1)
{
  uint64_t result = qword_10002F480;
  if (!qword_10002F480) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppleIDAvailabilityScheduler);
  }
  return result;
}

void sub_100005A30(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
  }

void sub_100005AA8(uint64_t a1)
{
  if (!qword_10002F490)
  {
    uint64_t v2 = sub_100005B00((uint64_t *)&unk_10002F498);
    unint64_t v3 = type metadata accessor for Dependency(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10002F490);
    }
  }

uint64_t sub_100005B00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005B44(uint64_t a1, unint64_t *a2, void *a3)
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

void *sub_100005B7C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100005BA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for AppleIDAvailabilityActivityProvider(0LL);
  uint64_t v30 = v7;
  unint64_t v31 = &off_100029BA0;
  v29[0] = a1;
  swift_retain(a1);
  uint64_t v8 = static String._fromUTF8Repairing(_:)("com.apple.appleaccountd.appleid.availability", 44LL);
  os_log_type_t v10 = v9;
  if (*(_BYTE *)(*sub_100005B7C(v29, v7) + 24LL) == 1)
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_100004558(v11, (uint64_t)qword_1000327A8);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "Time interval for AppleID Availability activity is being overridden.",  v15,  2u);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    unint64_t v16 = 60LL;
  }

  else
  {
    unint64_t v16 = 86400LL;
  }

  uint64_t v17 = *sub_100005B7C(v29, v30);
  uint64_t v18 = swift_allocObject(&unk_100029278, 24LL, 7LL);
  swift_weakInit(v18 + 16, v17);
  __n128 v19 = swift_bridgeObjectRetain(v10);
  static DispatchQoS.background.getter(v19);
  uint64_t v20 = swift_allocObject(&unk_1000292A0, 56LL, 7LL);
  *(_WORD *)(v20 + 16) = 257;
  *(_DWORD *)(v20 + 18) = v32;
  *(_WORD *)(v20 + 22) = v33;
  *(void *)(v20 + 24) = v16 >> 1;
  *(void *)(v20 + 32) = v16 >> 1;
  *(void *)(v20 + 40) = v16;
  *(void *)(v20 + 48) = 8LL;
  uint64_t v21 = swift_allocObject(&unk_1000292C8, 32LL, 7LL);
  *(void *)(v21 + 16) = sub_100005EE8;
  *(void *)(v21 + 24) = v18;
  uint64_t v22 = type metadata accessor for XPCActivity();
  swift_allocObject(v22, 104LL, 7LL);
  swift_retain(v18);
  uint64_t v23 = sub_100009994(v8, v10, (uint64_t)v6, (uint64_t)sub_100005F00, v20, (uint64_t)sub_100005F2C, v21);
  swift_release(v18);
  swift_bridgeObjectRelease(v10);
  swift_release(v20);
  swift_release(v21);
  uint64_t v24 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = v23;
  swift_release(v24);
  uint64_t v25 = swift_allocObject(&unk_1000292F0, 24LL, 7LL);
  swift_weakInit(v25 + 16, a2);
  uint64_t v26 = type metadata accessor for OSTransaction();
  swift_allocObject(v26, 48LL, 7LL);
  uint64_t v27 = sub_100015AD8("com.apple.appleaccountd.appleid.availability", 44LL, 2);
  sub_1000178F0(v27, v25);
  swift_release(v25);
  swift_release(v27);
  return sub_100004538(v29);
}

uint64_t sub_100005EC4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

BOOL sub_100005EE8(uint64_t a1)
{
  return sub_10000E828(a1, v1);
}

uint64_t sub_100005EF0()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

double sub_100005F00@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_100017C78(v1 + 16, a1).n128_u64[0];
  return result;
}

uint64_t sub_100005F08()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100005F2C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_100017CA0(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100005F38(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v3 = 0x7974696C697475LL;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000LL;
  }
  else {
    unint64_t v4 = 0xEB0000000065636ELL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v5 = 0x7974696C697475LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xEB0000000065636ELL;
  }
  else {
    unint64_t v6 = 0xE700000000000000LL;
  }
  if (v3 == v5 && v4 == v6)
  {
    char v7 = 1;
    unint64_t v6 = v4;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

void sub_100005FE4(void *a1)
{
  uint64_t v3 = a1[3];
  unint64_t v2 = a1[4];
  uint64_t v4 = String.utf8CString.getter(v3, v2);
  xpc_activity_unregister((const char *)(v4 + 32));
  swift_release(v4);
  uint64_t v5 = a1[11];
  uint64_t v6 = a1[12];
  a1[11] = 0LL;
  a1[12] = 0LL;
  sub_10000A99C(v5, v6);
  swift_unknownObjectWeakAssign(a1 + 9, 0LL);
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_100004558(v7, (uint64_t)qword_1000327A8);
  uint64_t v8 = swift_retain(a1);
  __n128 v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v14 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain(v2);
    uint64_t v13 = sub_10001BAA4(v3, v2, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    swift_release(a1);
    swift_bridgeObjectRelease(v2);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s - Unregistered criteria", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {

    swift_release(a1);
  }

uint64_t sub_1000061D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1000061F4()
{
  uint64_t v1 = v0;
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100004558(v2, (uint64_t)qword_1000327A8);
  uint64_t v3 = swift_retain(v0);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v6 = static os_log_type_t.default.getter(v5);
  if (os_log_type_enabled(v4, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = (_xpc_activity_s *)swift_slowAlloc(32LL, -1LL);
    v30[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    uint64_t v9 = *(void *)(v1 + 24);
    unint64_t v10 = *(void *)(v1 + 32);
    swift_bridgeObjectRetain(v10);
    uint64_t v32 = sub_10001BAA4(v9, v10, (uint64_t *)v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);
    swift_release(v1);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v6, "%s - updateCriteria called.", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {

    swift_release(v1);
  }

  uint64_t v11 = *(dispatch_queue_s **)(v1 + 16);
  uint64_t v12 = sub_100005110(&qword_10002F7A8);
  OS_dispatch_queue.sync<A>(execute:)(v30, sub_10000B02C, v1, v12);
  uint64_t v13 = v30[0];
  if (v30[0])
  {
    sub_100007494(v30[0]);
    swift_unknownObjectRelease(v13);
    return;
  }

  int v14 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v15 = swift_retain(v1);
  unint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  uint64_t v18 = static os_log_type_t.default.getter(v17);
  BOOL v19 = os_log_type_enabled(v16, (os_log_type_t)v18);
  if (v14 != 1)
  {
    if (v19)
    {
      uint64_t v24 = swift_slowAlloc(22LL, -1LL);
      uint64_t v25 = (_xpc_activity_s *)swift_slowAlloc(64LL, -1LL);
      v30[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v26 = *(void *)(v1 + 24);
      unint64_t v27 = *(void *)(v1 + 32);
      swift_bridgeObjectRetain(v27);
      uint64_t v32 = sub_10001BAA4(v26, v27, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);
      swift_bridgeObjectRelease(v27);
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain(v27);
      uint64_t v32 = sub_10001BAA4(v26, v27, (uint64_t *)v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);
      swift_release(v1);
      swift_bridgeObjectRelease(v27);
      _os_log_impl( (void *)&_mh_execute_header,  v16,  (os_log_type_t)v18,  "%s - No current activity -- hasn't checked in yet: %s",  (uint8_t *)v24,  0x16u);
      swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      return;
    }

    goto LABEL_16;
  }

  if (v19)
  {
    uint64_t v20 = swift_slowAlloc(22LL, -1LL);
    uint64_t v21 = (_xpc_activity_s *)swift_slowAlloc(64LL, -1LL);
    v30[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v22 = *(void *)(v1 + 24);
    unint64_t v23 = *(void *)(v1 + 32);
    swift_bridgeObjectRetain(v23);
    uint64_t v32 = sub_10001BAA4(v22, v23, (uint64_t *)v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain(v23);
    uint64_t v32 = sub_10001BAA4(v22, v23, (uint64_t *)v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33);
    swift_release(v1);
    swift_bridgeObjectRelease(v23);
    _os_log_impl( (void *)&_mh_execute_header,  v16,  (os_log_type_t)v18,  "%s - No current activity -- re-registering: %s",  (uint8_t *)v20,  0x16u);
    swift_arrayDestroy(v21, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {

    swift_release(v1);
  }

  unint64_t v16 = (os_log_s *)swift_allocObject(&unk_100029508, 32LL, 7LL);
  *((void *)v16 + 2) = sub_10000AA18;
  *((void *)v16 + 3) = v1;
  v30[4] = (_xpc_activity_s *)sub_10000B044;
  unint64_t v31 = v16;
  v30[0] = (_xpc_activity_s *)_NSConcreteStackBlock;
  v30[1] = (_xpc_activity_s *)1107296256;
  v30[2] = (_xpc_activity_s *)sub_1000061D4;
  v30[3] = (_xpc_activity_s *)&unk_100029520;
  uint64_t v28 = _Block_copy(v30);
  uint64_t v29 = v31;
  swift_retain(v1);
  swift_retain(v16);
  swift_release(v29);
  dispatch_sync(v11, v28);
  _Block_release(v28);
  LOBYTE(v28) = swift_isEscapingClosureAtFileLocation(v16, "", 107LL, 135LL, 20LL, 1LL);
  swift_release(v1);
  swift_release(v16);
  if ((v28 & 1) != 0)
  {
    __break(1u);
LABEL_16:

    swift_release(v1);
  }

BOOL sub_100006760()
{
  return sub_1000067A8((uint64_t)sub_10000B02C, 3LL, "%s - defer called on invalidated XPCActivity");
}

BOOL sub_100006778()
{
  return sub_1000067A8((uint64_t)sub_10000B02C, 4LL, "%s - continue called on invalidated XPCActivity");
}

BOOL sub_100006790()
{
  return sub_1000067A8((uint64_t)sub_10000A9E8, 5LL, "%s - done called on invalidated XPCActivity");
}

BOOL sub_1000067A8(uint64_t a1, xpc_activity_state_t a2, const char *a3)
{
  uint64_t v7 = v3;
  uint64_t v8 = sub_100005110(&qword_10002F7A8);
  OS_dispatch_queue.sync<A>(execute:)(&activity, a1, v3, v8);
  xpc_activity_t v9 = activity;
  if (activity)
  {
    BOOL v10 = xpc_activity_set_state(activity, a2);
    swift_unknownObjectRelease(v9);
  }

  else
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    sub_100004558(v11, (uint64_t)qword_1000327A8);
    uint64_t v12 = swift_retain(v7);
    uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      unint64_t v16 = (_xpc_activity_s *)swift_slowAlloc(32LL, -1LL);
      xpc_activity_t activity = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      uint64_t v17 = *(void *)(v7 + 24);
      unint64_t v18 = *(void *)(v7 + 32);
      swift_bridgeObjectRetain(v18);
      uint64_t v20 = sub_10001BAA4(v17, v18, (uint64_t *)&activity);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21);
      swift_release(v7);
      swift_bridgeObjectRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, a3, v15, 0xCu);
      swift_arrayDestroy(v16, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1LL, -1LL);
      swift_slowDealloc(v15, -1LL, -1LL);
    }

    else
    {

      swift_release(v7);
    }

    return 0LL;
  }

  return v10;
}

uint64_t sub_1000069A4(void *a1)
{
  uint64_t v2 = swift_allocObject(&unk_100029558, 24LL, 7LL);
  swift_weakInit(v2 + 16, a1);
  uint64_t v3 = a1[11];
  uint64_t v4 = a1[12];
  a1[11] = sub_10000AA54;
  a1[12] = v2;
  swift_retain(v2);
  sub_10000A99C(v3, v4);
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  v11[4] = sub_10000AA54;
  uint64_t v12 = v2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256LL;
  v11[2] = sub_100006CB0;
  v11[3] = &unk_100029570;
  uint64_t v7 = _Block_copy(v11);
  uint64_t v8 = v12;
  swift_retain(v2);
  swift_release(v8);
  uint64_t v9 = String.utf8CString.getter(v6, v5);
  xpc_activity_register((const char *)(v9 + 32), XPC_ACTIVITY_CHECK_IN, v7);
  swift_release(v9);
  _Block_release(v7);
  return swift_release(v2);
}

uint64_t sub_100006AB8(_xpc_activity_s *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v19, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v3);
  if (result)
  {
    uint64_t v5 = result;
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    sub_100004558(v6, (uint64_t)qword_1000327A8);
    uint64_t v7 = swift_unknownObjectRetain_n(a1, 2LL);
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v10 = static os_log_type_t.default.getter(v9);
    if (os_log_type_enabled(v8, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v12 = swift_slowAlloc(32LL, -1LL);
      uint64_t v17 = (uint64_t)a1;
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      swift_unknownObjectRetain(a1);
      uint64_t v13 = sub_100005110(&qword_10002F7A0);
      uint64_t v14 = String.init<A>(describing:)(&v17, v13);
      unint64_t v16 = v15;
      uint64_t v17 = sub_10001BAA4(v14, v15, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18);
      swift_unknownObjectRelease_n(a1, 2LL);
      swift_bridgeObjectRelease(v16);
      _os_log_impl((void *)&_mh_execute_header, v8, v10, "registered activity: %s", v11, 0xCu);
      swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1LL, -1LL);
      swift_slowDealloc(v11, -1LL, -1LL);
    }

    else
    {

      swift_unknownObjectRelease_n(a1, 2LL);
    }

    sub_100006CF8(a1);
    return swift_release(v5);
  }

  return result;
}

uint64_t sub_100006CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

id sub_100006CF8(_xpc_activity_s *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v47 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v46 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  __chkstk_darwin(v6);
  v43 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v42 = type metadata accessor for DispatchTime(0LL);
  uint64_t v8 = *(void (**)(void, void))(v42 - 8);
  uint64_t v9 = __chkstk_darwin(v42);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  v41 = (char *)&v37 - v12;
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  sub_100004558(v13, (uint64_t)qword_1000327A8);
  uint64_t v14 = swift_retain(v1);
  unint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v40 = v8;
    uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = swift_slowAlloc(32LL, -1LL);
    v38 = a1;
    uint64_t v19 = v18;
    aBlock[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v39 = v4;
    uint64_t v21 = *(void *)(v2 + 24);
    unint64_t v20 = *(void *)(v2 + 32);
    swift_bridgeObjectRetain(v20);
    uint64_t v48 = sub_10001BAA4(v21, v20, aBlock);
    uint64_t v8 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, aBlock);
    swift_release(v2);
    unint64_t v22 = v20;
    uint64_t v4 = v39;
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s - calling activityHandler", v17, 0xCu);
    swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
    uint64_t v23 = v19;
    a1 = v38;
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  else
  {

    swift_release(v2);
  }

  uint64_t v24 = type metadata accessor for OSTransaction();
  swift_allocObject(v24, 48LL, 7LL);
  uint64_t v25 = sub_100015AD8("XPCActivity", 11LL, 2);
  sub_10000715C(v25, a1, v2);
  swift_release(v25);
  id result = [(id)objc_opt_self(AAFDeviceInfo) deviceIsAudioAccessory];
  if ((_DWORD)result)
  {
    static DispatchTime.now()();
    unint64_t v27 = v41;
    + infix(_:_:)(v11, 600.0);
    v40 = (void (*)(void, void))*((void *)v8 + 1);
    uint64_t v28 = v42;
    v40(v11, v42);
    unint64_t v29 = sub_10000A9AC();
    uint64_t v30 = (void *)static OS_dispatch_queue.main.getter(v29);
    aBlock[4] = (uint64_t)sub_1000073C8;
    aBlock[5] = 0LL;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = (uint64_t)sub_10000C1A4;
    aBlock[3] = (uint64_t)&unk_1000294D0;
    unint64_t v31 = _Block_copy(aBlock);
    uint64_t v32 = v43;
    static DispatchQoS.unspecified.getter(v31);
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    uint64_t v33 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v34 = sub_100005110(&qword_10002F790);
    uint64_t v35 = sub_10000AFE8( (unint64_t *)&qword_10002F798,  &qword_10002F790,  (uint64_t)&protocol conformance descriptor for [A]);
    v36 = v46;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v34, v35, v4, v33);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v27, v32, v36, v31);
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v36, v4);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v45);
    return (id)((uint64_t (*)(char *, uint64_t))v40)(v27, v28);
  }

  return result;
}

uint64_t sub_10000715C(uint64_t a1, xpc_activity_t activity, uint64_t a3)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  unint64_t v7 = sub_10000A088(state);
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_100004558(v8, (uint64_t)qword_1000327A8);
  uint64_t v9 = swift_unknownObjectRetain_n(activity, 2LL);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc(22LL, -1LL);
    uint64_t v13 = swift_slowAlloc(64LL, -1LL);
    xpc_activity_t v22 = activity;
    uint64_t v23 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_unknownObjectRetain(activity);
    uint64_t v14 = sub_100005110(&qword_10002F7A0);
    uint64_t v15 = String.init<A>(describing:)(&v22, v14);
    unint64_t v17 = v16;
    xpc_activity_t v22 = (xpc_activity_t)sub_10001BAA4(v15, v16, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
    swift_unknownObjectRelease_n(activity, 2LL);
    swift_bridgeObjectRelease(v17);
    *(_WORD *)(v12 + 12) = 2080;
    LOBYTE(v22) = v7;
    uint64_t v18 = String.init<A>(describing:)(&v22, &type metadata for XPCActivity.State);
    unint64_t v20 = v19;
    xpc_activity_t v22 = (xpc_activity_t)sub_10001BAA4(v18, v19, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "activityHandler for %s -- state: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v13, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);

    if (!(_BYTE)v7) {
      goto LABEL_7;
    }
  }

  else
  {

    swift_unknownObjectRelease_n(activity, 2LL);
    if (!(_BYTE)v7)
    {
LABEL_7:
      swift_unknownObjectWeakAssign(a3 + 72, activity);
      *(_BYTE *)(a3 + 80) = 1;
      unint64_t v7 = sub_100007494(activity);
    }
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a3 + 56))(a3, a1, v7);
}

uint64_t sub_1000073C8()
{
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100004558(v0, (uint64_t)qword_1000327A8);
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "XPCActivity: Trying to exit appleaccountd.", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  return xpc_transaction_exit_clean();
}

unint64_t sub_100007494(_xpc_activity_s *a1)
{
  void (*v7)(void *__return_ptr, _OWORD *);
  uint64_t v8;
  uint64_t v9;
  _xpc_activity_s *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_s *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  dispatch_queue_s *v27;
  void *v28;
  _xpc_activity_s *v29;
  dispatch_queue_s *v30;
  _xpc_activity_s *v31;
  void *v33;
  void *v34;
  void *v35;
  xpc_activity_state_t state;
  uint64_t v37;
  uint64_t v38;
  os_log_s *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_s *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  os_log_s *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  uint64_t (*v73)();
  uint64_t v74;
  __int128 aBlock;
  __int128 v76;
  uint64_t (*v77)();
  _xpc_activity_s *v78;
  uint64_t v79[5];
  void v80[5];
  __int128 v81;
  __int128 v82;
  uint64_t (*v83)();
  _OWORD v84[2];
  uint64_t v85;
  _OWORD v86[4];
  uint64_t v2 = (void *)v1;
  os_log_type_t v3 = a1;
  xpc_object_t v4 = xpc_activity_copy_criteria(a1);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (void *)swift_unknownObjectRetain(v4);
    sub_100009F18(v6, v79);
    sub_10000A8F4((uint64_t)v79, (uint64_t)v84);
    if (LOBYTE(v84[0]) != 2LL)
    {
      v86[0] = v84[0];
      v86[1] = v84[1];
      *(void *)&v86[2] = v85;
      (*(void (**)(void *__return_ptr, uint64_t *))(v1 + 40))(v80, v79);
      sub_10000A8F4((uint64_t)v80, (uint64_t)&v81);
      if (v81 != 2LL)
      {
        aBlock = v81;
        v76 = v82;
        v77 = v83;
        if (!sub_100009874((uint64_t)&aBlock, (uint64_t)v86))
        {
          if (qword_10002ED70 != -1) {
            swift_once(&qword_10002ED70, sub_10000B0D4);
          }
          uint64_t v48 = type metadata accessor for Logger(0LL);
          sub_100004558(v48, (uint64_t)qword_1000327A8);
          v49 = swift_retain(v1);
          v50 = (os_log_s *)Logger.logObject.getter(v49);
          v51 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v50, v51))
          {
            v52 = swift_slowAlloc(22LL, -1LL);
            v53 = swift_slowAlloc(64LL, -1LL);
            v74 = v53;
            *(_DWORD *)v52 = 136315394;
            v55 = v2[3];
            v54 = v2[4];
            swift_bridgeObjectRetain(v54);
            *(void *)&v71 = sub_10001BAA4(v55, v54, &v74);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
            swift_release(v2);
            swift_bridgeObjectRelease(v54);
            *(_WORD *)(v52 + 12) = 2080;
            v71 = v86[0];
            v72 = v86[1];
            v73 = *(uint64_t (**)())&v86[2];
            v56 = String.init<A>(describing:)(&v71, &type metadata for XPCActivity.Criteria);
            v58 = v57;
            *(void *)&v71 = sub_10001BAA4(v56, v57, &v74);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
            swift_bridgeObjectRelease(v58);
            _os_log_impl((void *)&_mh_execute_header, v50, v51, "%s - Existing criteria: %s", (uint8_t *)v52, 0x16u);
            swift_arrayDestroy(v53, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v53, -1LL, -1LL);
            swift_slowDealloc(v52, -1LL, -1LL);
          }

          else
          {

            swift_release(v1);
          }

          v59 = swift_retain(v2);
          v60 = (os_log_s *)Logger.logObject.getter(v59);
          v61 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v60, v61))
          {
            v62 = swift_slowAlloc(22LL, -1LL);
            v63 = swift_slowAlloc(64LL, -1LL);
            v74 = v63;
            *(_DWORD *)v62 = 136315394;
            v64 = v2[3];
            v65 = v2[4];
            swift_bridgeObjectRetain(v65);
            *(void *)&v71 = sub_10001BAA4(v64, v65, &v74);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
            swift_release(v2);
            swift_bridgeObjectRelease(v65);
            *(_WORD *)(v62 + 12) = 2080;
            v71 = aBlock;
            v72 = v76;
            v73 = v77;
            v66 = String.init<A>(describing:)(&v71, &type metadata for XPCActivity.Criteria);
            v68 = v67;
            *(void *)&v71 = sub_10001BAA4(v66, v67, &v74);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
            swift_bridgeObjectRelease(v68);
            _os_log_impl( (void *)&_mh_execute_header,  v60,  v61,  "%s - Registering updated  criteria: %s",  (uint8_t *)v62,  0x16u);
            swift_arrayDestroy(v63, 2LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v63, -1LL, -1LL);
            swift_slowDealloc(v62, -1LL, -1LL);
          }

          else
          {

            swift_release(v2);
          }

          sub_100007FB4();
          v70 = v69;
          xpc_activity_set_criteria(v3, v69);
          swift_unknownObjectRelease(v70);
          uint64_t v35 = v5;
          goto LABEL_21;
        }

        if (qword_10002ED70 == -1) {
          goto LABEL_25;
        }
        goto LABEL_38;
      }

      unint64_t v27 = *(dispatch_queue_s **)(v1 + 16);
      uint64_t v10 = (_xpc_activity_s *)swift_allocObject(&unk_100029490, 32LL, 7LL);
      *((void *)v10 + 2) = sub_10000A93C;
      *((void *)v10 + 3) = v2;
      v77 = sub_10000B044;
      v78 = v10;
      *(void *)&aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256LL;
      *(void *)&v76 = sub_1000061D4;
      *((void *)&v76 + 1) = &unk_1000294A8;
      uint64_t v28 = _Block_copy(&aBlock);
      unint64_t v29 = v78;
      swift_retain(v2);
      swift_retain(v10);
      swift_release(v29);
      dispatch_sync(v27, v28);
      _Block_release(v28);
      LOBYTE(v27) = swift_isEscapingClosureAtFileLocation(v10, "", 107LL, 49LL, 20LL, 1LL);
      swift_unknownObjectRelease(v5);
      swift_release(v2);
      swift_release(v10);
      __break(1u);
      goto LABEL_16;
    }

    swift_unknownObjectRelease(v5);
  }

  unint64_t v7 = *(void (**)(void *__return_ptr, _OWORD *))(v1 + 40);
  *(void *)&v86[0] = 2LL;
  memset((char *)v86 + 8, 0, 32);
  v7(v80, v86);
  sub_10000A8F4((uint64_t)v80, (uint64_t)&v81);
  if (v81 != 2LL)
  {
    aBlock = v81;
    v76 = v82;
    v77 = v83;
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    unint64_t v16 = type metadata accessor for Logger(0LL);
    sub_100004558(v16, (uint64_t)qword_1000327A8);
    unint64_t v17 = swift_retain(v1);
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
    unint64_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = swift_slowAlloc(22LL, -1LL);
      uint64_t v21 = swift_slowAlloc(64LL, -1LL);
      v74 = v21;
      *(_DWORD *)unint64_t v20 = 136315394;
      xpc_activity_t v22 = v2[3];
      uint64_t v23 = v2[4];
      swift_bridgeObjectRetain(v23);
      *(void *)&v71 = sub_10001BAA4(v22, v23, &v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
      swift_release(v2);
      swift_bridgeObjectRelease(v23);
      *(_WORD *)(v20 + 12) = 2080;
      v71 = aBlock;
      v72 = v76;
      v73 = v77;
      uint64_t v24 = String.init<A>(describing:)(&v71, &type metadata for XPCActivity.Criteria);
      uint64_t v26 = v25;
      *(void *)&v71 = sub_10001BAA4(v24, v25, &v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
      swift_bridgeObjectRelease(v26);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s - Registering new criteria: %s", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy(v21, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    else
    {

      swift_release(v2);
    }

    sub_100007FB4();
    uint64_t v34 = v33;
    xpc_activity_set_criteria(v3, v33);
    uint64_t v35 = v34;
    goto LABEL_21;
  }

  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  sub_100004558(v8, (uint64_t)qword_1000327A8);
  uint64_t v9 = swift_retain(v1);
  uint64_t v10 = (_xpc_activity_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v10, v11))
  {
LABEL_16:

    swift_release(v2);
    goto LABEL_17;
  }

  uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v13 = swift_slowAlloc(32LL, -1LL);
  *(void *)&aBlock = v13;
  *(_DWORD *)uint64_t v12 = 136315138;
  uint64_t v14 = v2[3];
  uint64_t v15 = v2[4];
  swift_bridgeObjectRetain(v15);
  *(void *)&v71 = sub_10001BAA4(v14, v15, (uint64_t *)&aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
  swift_release(v2);
  swift_bridgeObjectRelease(v15);
  _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s - criteriaBlock returned nil", v12, 0xCu);
  swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v13, -1LL, -1LL);
  swift_slowDealloc(v12, -1LL, -1LL);

LABEL_17:
  uint64_t v30 = (dispatch_queue_s *)v2[2];
  os_log_type_t v3 = (_xpc_activity_s *)swift_allocObject(&unk_100029440, 32LL, 7LL);
  *((void *)v3 + 2) = sub_10000A93C;
  *((void *)v3 + 3) = v2;
  v77 = sub_10000A954;
  v78 = v3;
  *(void *)&aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256LL;
  *(void *)&v76 = sub_1000061D4;
  *((void *)&v76 + 1) = &unk_100029458;
  uint64_t v5 = _Block_copy(&aBlock);
  unint64_t v31 = v78;
  swift_retain(v2);
  swift_retain(v3);
  swift_release(v31);
  dispatch_sync(v30, v5);
  _Block_release(v5);
  LOBYTE(v30) = swift_isEscapingClosureAtFileLocation(v3, "", 107LL, 49LL, 20LL, 1LL);
  swift_release(v2);
  swift_release(v3);
  __break(1u);
LABEL_38:
  swift_once(&qword_10002ED70, sub_10000B0D4);
LABEL_25:
  uint64_t v37 = type metadata accessor for Logger(0LL);
  sub_100004558(v37, (uint64_t)qword_1000327A8);
  v38 = swift_retain(v2);
  uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
  v40 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = swift_slowAlloc(22LL, -1LL);
    uint64_t v42 = swift_slowAlloc(64LL, -1LL);
    v74 = v42;
    *(_DWORD *)v41 = 136315394;
    v43 = v2[3];
    uint64_t v44 = v2[4];
    swift_bridgeObjectRetain(v44);
    *(void *)&v71 = sub_10001BAA4(v43, v44, &v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
    swift_release(v2);
    swift_bridgeObjectRelease(v44);
    *(_WORD *)(v41 + 12) = 2080;
    v71 = v86[0];
    v72 = v86[1];
    v73 = *(uint64_t (**)())&v86[2];
    uint64_t v45 = String.init<A>(describing:)(&v71, &type metadata for XPCActivity.Criteria);
    uint64_t v47 = v46;
    *(void *)&v71 = sub_10001BAA4(v45, v46, &v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 8);
    swift_bridgeObjectRelease(v47);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "%s - Keeping existing criteria for: %s", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy(v42, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1LL, -1LL);
    swift_slowDealloc(v41, -1LL, -1LL);
    swift_unknownObjectRelease(v5);

    goto LABEL_22;
  }

  swift_release(v2);
  uint64_t v35 = v5;
LABEL_21:
  swift_unknownObjectRelease(v35);
LABEL_22:
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  return sub_10000A088(state);
}

void sub_100007FB4()
{
  xpc_object_t v1 = xpc_dictionary_create(0LL, 0LL, 0LL);
  uint64_t v2 = v1;
  os_log_type_t v3 = (const char **)&XPC_ACTIVITY_PRIORITY_MAINTENANCE;
  if (!*(_BYTE *)v0) {
    os_log_type_t v3 = (const char **)&XPC_ACTIVITY_PRIORITY_UTILITY;
  }
  xpc_dictionary_set_string(v1, XPC_ACTIVITY_PRIORITY, *v3);
  int v4 = *(unsigned __int8 *)(v0 + 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, *(_BYTE *)(v0 + 1));
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_DELAY, *(void *)(v0 + 8));
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, *(void *)(v0 + 16));
  if (v4 == 1) {
    xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, *(void *)(v0 + 24));
  }
  uint64_t v5 = *(void *)(v0 + 32);
  if ((v5 & 1) != 0)
  {
    if (!XPC_ACTIVITY_POWER_NAP)
    {
      __break(1u);
      goto LABEL_39;
    }

    xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_POWER_NAP, 1);
  }

  if ((v5 & 4) == 0) {
    goto LABEL_11;
  }
  if (!XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
LABEL_11:
  if ((v5 & 2) == 0) {
    goto LABEL_14;
  }
  if (!XPC_ACTIVITY_SHOULD_WAKE_DEVICE)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_SHOULD_WAKE_DEVICE, 1);
LABEL_14:
  if ((v5 & 0x800) == 0) {
    goto LABEL_17;
  }
  if (!XPC_ACTIVITY_REQUIRES_CLASS_A)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
LABEL_17:
  if ((v5 & 8) == 0) {
    goto LABEL_20;
  }
  if (!XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
LABEL_20:
  if ((v5 & 0x10) == 0) {
    goto LABEL_23;
  }
  if (!XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
LABEL_23:
  if ((v5 & 0x20) != 0) {
    xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  }
  if ((v5 & 0x40) != 0)
  {
    if (XPC_ACTIVITY_MEMORY_INTENSIVE)
    {
      xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
      goto LABEL_28;
    }

LABEL_44:
    __break(1u);
    goto LABEL_45;
  }

LABEL_28:
  if ((v5 & 0x80) == 0) {
    goto LABEL_31;
  }
  if (!XPC_ACTIVITY_CPU_INTENSIVE)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_CPU_INTENSIVE, 1);
LABEL_31:
  if ((v5 & 0x100) == 0) {
    goto LABEL_34;
  }
  if (!XPC_ACTIVITY_DISK_INTENSIVE)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_DISK_INTENSIVE, 1);
LABEL_34:
  if ((v5 & 0x400) == 0) {
    return;
  }
  if (!XPC_ACTIVITY_POST_INSTALL)
  {
LABEL_47:
    __break(1u);
    return;
  }

  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_POST_INSTALL, 1);
}

  __break(1u);
  return result;
}

uint64_t sub_100008210()
{
  uint64_t result = String.init(cString:)(XPC_ACTIVITY_PRIORITY_UTILITY);
  qword_10002F5A0 = result;
  *(void *)algn_10002F5A8 = v1;
  return result;
}

uint64_t sub_10000823C(char *a1, char *a2)
{
  return sub_100005F38(*a1, *a2);
}

Swift::Int sub_100008248()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v5);
  if (v1) {
    uint64_t v2 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v2 = 0x7974696C697475LL;
  }
  if (v1) {
    unint64_t v3 = 0xEB0000000065636ELL;
  }
  else {
    unint64_t v3 = 0xE700000000000000LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1000082D0(uint64_t a1)
{
  if (*v1) {
    uint64_t v2 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v2 = 0x7974696C697475LL;
  }
  if (*v1) {
    unint64_t v3 = 0xEB0000000065636ELL;
  }
  else {
    unint64_t v3 = 0xE700000000000000LL;
  }
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100008334()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v5);
  if (v1) {
    uint64_t v2 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v2 = 0x7974696C697475LL;
  }
  if (v1) {
    unint64_t v3 = 0xEB0000000065636ELL;
  }
  else {
    unint64_t v3 = 0xE700000000000000LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1000083B8@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  int v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100028E20, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_100008414(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x7974696C697475LL;
  if (*v1) {
    uint64_t v2 = 0x616E65746E69616DLL;
  }
  unint64_t v3 = 0xE700000000000000LL;
  if (*v1) {
    unint64_t v3 = 0xEB0000000065636ELL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10000845C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000AFA4();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_1000084B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000AFA4();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_100008504()
{
  if (*v0) {
    return 0x6E65746E69616D2ELL;
  }
  else {
    return 0x7974696C6974752ELL;
  }
}

BOOL sub_100008548(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000855C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000085A0()
{
}

Swift::Int sub_1000085C8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_100008608@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10000A148(*a1);
  *a2 = result;
  return result;
}

void sub_100008630(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000863C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000A158();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100008698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000A158();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_1000086E4(__int16 a1)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = (char *)&_swiftEmptyArrayStorage;
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }

  uint64_t v2 = sub_100009768(0LL, 1LL, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  Swift::Int v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 0x614E7265776F702ELL;
  *((void *)v5 + 5) = 0xE900000000000070LL;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
      uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_100009768((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x766544656B61772ELL;
    *((void *)v8 + 5) = 0xEB00000000656369LL;
  }

LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
      uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_100009768((char *)(v9 > 1), v10 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    os_log_type_t v11 = &v2[16 * v10];
    *((void *)v11 + 4) = 0xD00000000000001ALL;
    *((void *)v11 + 5) = 0x800000010001F070LL;
    if ((a1 & 8) == 0)
    {
LABEL_14:
      if ((a1 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_33;
    }
  }

  else if ((a1 & 8) == 0)
  {
    goto LABEL_14;
  }

  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v13 = *((void *)v2 + 2);
  unint64_t v12 = *((void *)v2 + 3);
  if (v13 >= v12 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v12 > 1), v13 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v13 + 1;
  uint64_t v14 = &v2[16 * v13];
  *((void *)v14 + 4) = 0xD000000000000010LL;
  *((void *)v14 + 5) = 0x800000010001F050LL;
  if ((a1 & 0x10) == 0)
  {
LABEL_15:
    if ((a1 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }

LABEL_33:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v16 = *((void *)v2 + 2);
  unint64_t v15 = *((void *)v2 + 3);
  if (v16 >= v15 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v15 > 1), v16 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v16 + 1;
  unint64_t v17 = &v2[16 * v16];
  *((void *)v17 + 4) = 0xD00000000000001BLL;
  *((void *)v17 + 5) = 0x800000010001F030LL;
  if ((a1 & 0x20) == 0)
  {
LABEL_16:
    if ((a1 & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }

    os_log_type_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    unint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    unint64_t v31 = v30[1];
    unint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_errorRetain(v33);
    }

    Hasher.init(_seed:)(v38);
    String.hash(into:)(v38, v32, v31);
    unint64_t result = Hasher._finalize()();
    unint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        unint64_t v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        unint64_t v29 = *(void *)(v12 + 8 * v17);
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
  unint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    char *v23 = -1LL << v34;
  }
  *(void *)(v5 + swift_weakDestroy(v0 + 16) = 0LL;
LABEL_43:
  unint64_t result = swift_release(v5);
  *unint64_t v3 = v8;
  return result;
}

LABEL_38:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v19 = *((void *)v2 + 2);
  unint64_t v18 = *((void *)v2 + 3);
  if (v19 >= v18 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v18 > 1), v19 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v19 + 1;
  unint64_t v20 = &v2[16 * v19];
  strcpy(v20 + 32, ".allowBattery");
  *((_WORD *)v20 + 23) = -4864;
  if ((a1 & 0x40) == 0)
  {
LABEL_17:
    if ((a1 & 0x80) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }

LABEL_43:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v22 = *((void *)v2 + 2);
  unint64_t v21 = *((void *)v2 + 3);
  if (v22 >= v21 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v21 > 1), v22 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v22 + 1;
  uint64_t v23 = &v2[16 * v22];
  *((void *)v23 + 4) = 0xD000000000000010LL;
  *((void *)v23 + 5) = 0x800000010001F010LL;
  if ((a1 & 0x80) == 0)
  {
LABEL_18:
    if ((a1 & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }

LABEL_48:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v25 = *((void *)v2 + 2);
  unint64_t v24 = *((void *)v2 + 3);
  if (v25 >= v24 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v24 > 1), v25 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v25 + 1;
  uint64_t v26 = &v2[16 * v25];
  strcpy(v26 + 32, ".cpuIntensive");
  *((_WORD *)v26 + 23) = -4864;
  if ((a1 & 0x100) == 0)
  {
LABEL_19:
    if ((a1 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }

  v79 = sub_10001B564();
  if (v79)
  {
    v80 = (void *)v79;
    sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
    v81 = NSNumber.init(integerLiteral:)(0LL).super.super.isa;
    v82 = static NSObject.== infix(_:_:)(v80, v81);

    v83 = v82 & 1;
  }

  else
  {
    v83 = 1;
  }

  v84 = v16;
  sub_10001C4DC(v83, v16);

  v85 = sub_100005B44(0LL, &qword_1000305C8, &OBJC_CLASS___AAFDeviceInfo_ptr);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v85);
  if (objc_msgSend( ObjCClassFromMetadata,  "respondsToSelector:",  Selector.init(_:)(0x6365536C61636F6CLL, 0xEF65707954746572)))
  {
    if (!v16) {
      goto LABEL_59;
    }
    v87 = *(void *)(v0 + 1168);
    v88 = *(void *)(v0 + 1160);
    v89 = *(void *)(v0 + 1152);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16))( v87,  *(void *)(v0 + 1128) + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__deviceInfo,  v89);
    v90 = v84;
    Dependency.wrappedValue.getter((void *)(v0 + 1080), v89);
    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
    v91 = *(void **)(v0 + 1080);
    v92 = [v91 localSecretType];

    v93 = String._bridgeToObjectiveC()();
    [v90 setObject:v92 forKeyedSubscript:v93];
  }

  else if (!v16)
  {
    goto LABEL_59;
  }

  v94 = v84;
  v95 = sub_100017D3C();
  if (v95)
  {
    v96 = v95;
    v97 = (void *)_convertErrorToNSError(_:)(v95);
  }

  else
  {
    v97 = 0LL;
  }

  [v94 updateTaskResultWithError:v97];

LABEL_59:
  sub_10001A080(v16);
  v98 = (void *)swift_task_alloc(dword_100030354);
  *(void *)(v0 + 1256) = v98;
  *v98 = v0;
  v98[1] = sub_1000195CC;
  return sub_10001A3F0((uint64_t)v16);
}

LABEL_53:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v28 = *((void *)v2 + 2);
  unint64_t v27 = *((void *)v2 + 3);
  if (v28 >= v27 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v27 > 1), v28 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v28 + 1;
  unint64_t v29 = &v2[16 * v28];
  strcpy(v29 + 32, ".diskIntensive");
  v29[47] = -18;
  if ((a1 & 0x200) == 0)
  {
LABEL_20:
    if ((a1 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_63;
  }

LABEL_58:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v31 = *((void *)v2 + 2);
  unint64_t v30 = *((void *)v2 + 3);
  if (v31 >= v30 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v30 > 1), v31 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v31 + 1;
  uint64_t v32 = &v2[16 * v31];
  *((void *)v32 + 4) = 0xD000000000000019LL;
  *((void *)v32 + 5) = 0x800000010001EFF0LL;
  if ((a1 & 0x400) == 0)
  {
LABEL_21:
    if ((a1 & 0x800) == 0) {
      goto LABEL_73;
    }
    goto LABEL_68;
  }

LABEL_63:
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
  }
  unint64_t v34 = *((void *)v2 + 2);
  unint64_t v33 = *((void *)v2 + 3);
  if (v34 >= v33 >> 1) {
    uint64_t v2 = sub_100009768((char *)(v33 > 1), v34 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v34 + 1;
  uint64_t v35 = &v2[16 * v34];
  strcpy(v35 + 32, ".postInstall");
  v35[45] = 0;
  *((_WORD *)v35 + 23) = -5120;
  if ((a1 & 0x800) != 0)
  {
LABEL_68:
    if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
      uint64_t v2 = sub_100009768(0LL, *((void *)v2 + 2) + 1LL, 1, v2);
    }
    unint64_t v37 = *((void *)v2 + 2);
    unint64_t v36 = *((void *)v2 + 3);
    if (v37 >= v36 >> 1) {
      uint64_t v2 = sub_100009768((char *)(v36 > 1), v37 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v37 + 1;
    v38 = &v2[16 * v37];
    *((void *)v38 + 4) = 0x657269757165722ELL;
    *((void *)v38 + 5) = 0xEF417373616C4373LL;
  }

LABEL_73:
  uint64_t v39 = sub_100005110(&qword_10002F810);
  uint64_t v40 = sub_10000AFE8(&qword_10002F818, &qword_10002F810, (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v41 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v39, v40);
  v43 = v42;
  swift_bridgeObjectRelease(v2);
  v44._countAndFlagsBits = v41;
  v44._object = v43;
  String.append(_:)(v44);
  swift_bridgeObjectRelease(v43);
  v45._countAndFlagsBits = 93LL;
  v45._object = (void *)0xE100000000000000LL;
  String.append(_:)(v45);
  return 91LL;
}

void *sub_100008E14@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100008E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000AE40();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100008E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10000AE40();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_100008EC8()
{
  return sub_1000086E4(*v0);
}

void sub_100008ED0(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_100008ED8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100008EEC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100008F00@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100008F14(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100008F44@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100008F70@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100008F94(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100008FA8(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100008FBC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100008FD0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100008FE4(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_100008FF8(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_10000900C(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_100009020()
{
  return *v0 == 0LL;
}

uint64_t sub_100009030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100009048(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_10000905C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_10000A28C(a1);
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_100009098()
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000090C8 + 4 * byte_100020E88[*v0]))( 0x797469726F697270LL,  0xE800000000000000LL);
}

uint64_t sub_1000090C8()
{
  return 0x6E69746165706572LL;
}

uint64_t sub_1000090E4()
{
  return 0x79616C6564LL;
}

uint64_t sub_1000090F8()
{
  return 0x7265506563617267LL;
}

uint64_t sub_100009118()
{
  return 0x6C61767265746E69LL;
}

uint64_t sub_10000912C()
{
  return 0x736E6F6974706FLL;
}

uint64_t sub_100009144@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000A2C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100009168()
{
  return 0LL;
}

void sub_100009174(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100009180(uint64_t a1)
{
  unint64_t v2 = sub_10000A7A0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000091A8(uint64_t a1)
{
  unint64_t v2 = sub_10000A7A0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000091D0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005110(&qword_10002F760);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100005B7C(a1, v9);
  unint64_t v11 = sub_10000A7A0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for XPCActivity.Criteria.CodingKeys,  &type metadata for XPCActivity.Criteria.CodingKeys,  v11,  v9,  v10);
  char v27 = *v3;
  char v26 = 0;
  unint64_t v12 = sub_10000A86C();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v27, &v26, v5, &type metadata for XPCActivity.Priority, v12);
  if (!v2)
  {
    uint64_t v13 = v3[1];
    char v25 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, &v25, v5);
    uint64_t v14 = *((void *)v3 + 1);
    char v24 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v14, &v24, v5);
    uint64_t v15 = *((void *)v3 + 2);
    char v23 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v15, &v23, v5);
    uint64_t v16 = *((void *)v3 + 3);
    char v22 = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v16, &v22, v5);
    uint64_t v21 = *((void *)v3 + 4);
    char v20 = 5;
    unint64_t v17 = sub_10000A8B0();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v20, v5, &type metadata for XPCActivity.Criteria.Options, v17);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

double sub_1000093B4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    double result = *(double *)v6;
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + swift_weakDestroy(v0 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }

  return result;
}

uint64_t sub_1000093F8(void *a1)
{
  return sub_1000091D0(a1);
}

BOOL sub_10000940C(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return sub_100009874((uint64_t)v5, (uint64_t)v7);
}

uint64_t sub_100009454()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  swift_release(*(void *)(v0 + 48));
  swift_release(*(void *)(v0 + 64));
  sub_10000AA5C(v0 + 72);
  sub_10000A99C(*(void *)(v0 + 88), *(void *)(v0 + 96));
  return swift_deallocClassInstance(v0, 104LL, 7LL);
}

uint64_t type metadata accessor for XPCActivity()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd11XPCActivity);
}

_BYTE *initializeBufferWithCopyOfBuffer for XPCActivity.Priority(_BYTE *result, _BYTE *a2)
{
  *double result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCActivity.State(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

      swift_unknownObjectRelease(v14);
      Swift::UInt v1 = v45;
      __int128 v5 = v47;
      if (v11 == v47) {
        return;
      }
    }
  }

  unint64_t v28 = 0LL;
  Swift::String v44 = v1 + 32;
  v46 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v28 != v46)
  {
    unint64_t v29 = v4[5];
    unint64_t v30 = *(id *)(v44 + 8 * v28);
    unint64_t v31 = NSObject._rawHashValue(seed:)(v29);
    uint64_t v32 = -1LL << *((_BYTE *)v4 + 32);
    unint64_t v33 = v31 & ~v32;
    unint64_t v34 = v33 >> 6;
    uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
    unint64_t v36 = 1LL << v33;
    if (((1LL << v33) & v35) != 0)
    {
      sub_100005B44(0LL, &qword_1000306B8, &OBJC_CLASS___UNNotificationCategory_ptr);
      unint64_t v37 = *(id *)(v4[6] + 8 * v33);
      v38 = static NSObject.== infix(_:_:)(v37, v30);

      if ((v38 & 1) != 0)
      {
LABEL_30:

        goto LABEL_31;
      }

      uint64_t v39 = ~v32;
      while (1)
      {
        unint64_t v33 = (v33 + 1) & v39;
        unint64_t v34 = v33 >> 6;
        uint64_t v35 = *(void *)&v10[8 * (v33 >> 6)];
        unint64_t v36 = 1LL << v33;
        if ((v35 & (1LL << v33)) == 0) {
          break;
        }
        uint64_t v40 = *(id *)(v4[6] + 8 * v33);
        uint64_t v41 = static NSObject.== infix(_:_:)(v40, v30);

        if ((v41 & 1) != 0) {
          goto LABEL_30;
        }
      }
    }

    *(void *)&v10[8 * v34] = v36 | v35;
    *(void *)(v4[6] + 8 * v33) = v30;
    uint64_t v42 = v4[2];
    uint64_t v13 = __OFADD__(v42, 1LL);
    v43 = v42 + 1;
    if (v13) {
      goto LABEL_44;
    }
    void v4[2] = v43;
LABEL_31:
    if (++v28 == v47) {
      return;
    }
  }

uint64_t storeEnumTagSinglePayload for XPCActivity.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_1000095A8 + 4 * byte_100020E93[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1000095DC + 4 * byte_100020E8E[v4]))();
}

uint64_t sub_1000095DC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000095E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000095ECLL);
  }
  return result;
}

uint64_t sub_1000095F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100009600LL);
  }
  *(_BYTE *)double result = a2 + 6;
  return result;
}

uint64_t sub_100009604(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000960C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009618(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100009624(_BYTE *result, char a2)
{
  *double result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.State()
{
  return &type metadata for XPCActivity.State;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCActivity.Criteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 initializeWithCopy for XPCActivity.Criteria(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCActivity.Criteria(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[40]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCActivity.Criteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 40) = 0;
    }
    if (a2) {
      *(_BYTE *)__n128 result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.Criteria()
{
  return &type metadata for XPCActivity.Criteria;
}

unint64_t sub_100009724()
{
  unint64_t result = qword_10002F730;
  if (!qword_10002F730)
  {
    unint64_t result = swift_getWitnessTable(&unk_100021060, &type metadata for XPCActivity.State);
    atomic_store(result, (unint64_t *)&qword_10002F730);
  }

  return result;
}

char *sub_100009768(char *result, int64_t a2, char a3, char *a4)
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
      uint64_t v10 = sub_100005110((uint64_t *)&unk_10002F820);
      unint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
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

    sub_10000A19C(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

BOOL sub_100009874(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(_BYTE *)a1 == 0;
  if (*(_BYTE *)a1) {
    uint64_t v5 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v5 = 0x7974696C697475LL;
  }
  if (v4) {
    unint64_t v6 = 0xE700000000000000LL;
  }
  else {
    unint64_t v6 = 0xEB0000000065636ELL;
  }
  if (*(_BYTE *)a2) {
    uint64_t v7 = 0x616E65746E69616DLL;
  }
  else {
    uint64_t v7 = 0x7974696C697475LL;
  }
  if (*(_BYTE *)a2) {
    unint64_t v8 = 0xEB0000000065636ELL;
  }
  else {
    unint64_t v8 = 0xE700000000000000LL;
  }
  if (v5 == v7 && v6 == v8)
  {
    swift_bridgeObjectRelease_n(v6, 2LL);
  }

  else
  {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v8);
    BOOL result = 0LL;
    if ((v10 & 1) == 0) {
      return result;
    }
  }

  return ((*(unsigned __int8 *)(a1 + 1) ^ *(unsigned __int8 *)(a2 + 1)) & 1) == 0
      && *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(void *)(a1 + 24) == *(void *)(a2 + 24)
      && *(void *)(a1 + 32) == *(void *)(a2 + 32);
}

uint64_t sub_100009994(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v43 = a6;
  uint64_t v44 = a7;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v45 = a3;
  uint64_t v40 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v40);
  uint64_t v39 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_unknownObjectWeakInit(v7 + 72, 0LL);
  *(_BYTE *)(v7 + 80) = 0;
  unint64_t v38 = sub_10000A9AC();
  *(void *)(v7 + 88) = 0LL;
  *(void *)(v7 + 96) = 0LL;
  strcpy((char *)&aBlock, "XPCActivity-");
  BYTE13(aBlock) = 0;
  HIWORD(aBlock) = -5120;
  v20._countAndFlagsBits = a1;
  v20._object = a2;
  String.append(_:)(v20);
  uint64_t v36 = *((void *)&aBlock + 1);
  uint64_t v37 = aBlock;
  uint64_t v35 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v45, v16);
  (*(void (**)(char *, void, uint64_t))(v13 + 104))( v15,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v12);
  *(void *)&__int128 aBlock = &_swiftEmptyArrayStorage;
  uint64_t v21 = sub_100004604( &qword_10002F7B0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v22 = sub_100005110(&qword_10002F7B8);
  uint64_t v23 = sub_10000AFE8( (unint64_t *)&qword_10002F7C0,  &qword_10002F7B8,  (uint64_t)&protocol conformance descriptor for [A]);
  char v24 = v39;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v22, v23, v40, v21);
  char v25 = (dispatch_queue_s *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( v37,  v36,  v19,  v24,  v15,  0LL);
  *(void *)(v7 + swift_weakDestroy(v0 + 16) = v25;
  *(void *)(v7 + 24) = a1;
  uint64_t v26 = v41;
  uint64_t v27 = v42;
  *(void *)(v7 + 32) = a2;
  *(void *)(v7 + 40) = v26;
  uint64_t v28 = v43;
  uint64_t v29 = v44;
  *(void *)(v7 + 48) = v27;
  *(void *)(v7 + 56) = v28;
  *(void *)(v7 + 64) = v29;
  uint64_t v30 = swift_allocObject(&unk_1000295A8, 32LL, 7LL);
  *(void *)(v30 + swift_weakDestroy(v0 + 16) = sub_10000AA18;
  *(void *)(v30 + 24) = v8;
  v49 = sub_10000B044;
  uint64_t v50 = v30;
  *(void *)&__int128 aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256LL;
  uint64_t v47 = sub_1000061D4;
  uint64_t v48 = &unk_1000295C0;
  unint64_t v31 = _Block_copy(&aBlock);
  uint64_t v32 = v50;
  swift_retain(v27);
  swift_retain(v29);
  swift_retain(v8);
  swift_retain(v30);
  swift_release(v32);
  dispatch_sync(v25, v31);
  _Block_release(v31);
  LOBYTE(v25) = swift_isEscapingClosureAtFileLocation(v30, "", 107LL, 135LL, 20LL, 1LL);
  swift_release(v8);
  uint64_t result = swift_release(v30);
  if ((v25 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v45, v16);
    return v8;
  }

  return result;
}

uint64_t sub_100009CD0(uint64_t result)
{
  if (!XPC_ACTIVITY_POWER_NAP)
  {
    __break(1u);
    goto LABEL_34;
  }

  __int16 v1 = (void *)result;
  uint64_t result = xpc_dictionary_get_BOOL((xpc_object_t)result, XPC_ACTIVITY_POWER_NAP);
  if (!XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  unsigned int v2 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY);
  if (!XPC_ACTIVITY_SHOULD_WAKE_DEVICE)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  int v3 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_SHOULD_WAKE_DEVICE);
  if (!XPC_ACTIVITY_REQUIRES_CLASS_A)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }

  int v4 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_REQUIRES_CLASS_A);
  if (!XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }

  int v5 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY);
  if (!XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }

  unsigned __int8 v6 = result;
  BOOL v7 = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY);
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_ALLOW_BATTERY);
  if (!XPC_ACTIVITY_MEMORY_INTENSIVE)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

  unsigned __int8 v8 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_MEMORY_INTENSIVE);
  if (!XPC_ACTIVITY_CPU_INTENSIVE)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  unsigned __int8 v9 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_CPU_INTENSIVE);
  if (!XPC_ACTIVITY_DISK_INTENSIVE)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }

  unsigned __int8 v10 = result;
  uint64_t result = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_DISK_INTENSIVE);
  if (!XPC_ACTIVITY_POST_INSTALL)
  {
LABEL_42:
    __break(1u);
    return result;
  }

  uint64_t v11 = v2;
  if (v3) {
    uint64_t v11 = v2 | 4LL;
  }
  if (v4) {
    v11 |= 2uLL;
  }
  if (v5) {
    v11 |= 0x800uLL;
  }
  if ((v6 & ((v11 & 8) == 0)) != 0) {
    v11 |= 8uLL;
  }
  if (v7 && (v11 & 0x10) == 0) {
    v11 |= 0x10uLL;
  }
  if ((v8 & ((v11 & 0x20) == 0)) != 0) {
    v11 |= 0x20uLL;
  }
  if ((v9 & ((v11 & 0x40) == 0)) != 0) {
    v11 |= 0x40uLL;
  }
  if ((v10 & ((v11 & 0x80) == 0)) != 0) {
    v11 |= 0x80uLL;
  }
  else {
    uint64_t v12 = v11;
  }
  BOOL v13 = xpc_dictionary_get_BOOL(v1, XPC_ACTIVITY_POST_INSTALL);
  swift_unknownObjectRelease(v1);
  if (v13 && (v12 & 0x400) == 0) {
    return v12 | 0x400;
  }
  else {
    return v12;
  }
}

uint64_t sub_100009F18@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  string = xpc_dictionary_get_string(a1, XPC_ACTIVITY_PRIORITY);
  if (string)
  {
    uint64_t v5 = String.init(cString:)(string);
    uint64_t v7 = v6;
    if (qword_10002ED60 != -1) {
      swift_once(&qword_10002ED60, sub_100008210);
    }
    if (v5 == qword_10002F5A0 && v7 == *(void *)algn_10002F5A8)
    {
      swift_bridgeObjectRelease(v7);
      uint64_t v10 = 0LL;
    }

    else
    {
      int v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, qword_10002F5A0, *(void *)algn_10002F5A8, 0LL);
      swift_bridgeObjectRelease(v7);
      uint64_t v10 = ~v9 & 1LL;
    }

    BOOL v16 = xpc_dictionary_get_BOOL(a1, XPC_ACTIVITY_REPEATING);
    int64_t int64 = xpc_dictionary_get_int64(a1, XPC_ACTIVITY_DELAY);
    int64_t v12 = xpc_dictionary_get_int64(a1, XPC_ACTIVITY_GRACE_PERIOD);
    int64_t v13 = xpc_dictionary_get_int64(a1, XPC_ACTIVITY_INTERVAL);
    uint64_t result = sub_100009CD0((uint64_t)a1);
    uint64_t v17 = 256LL;
    if (!v16) {
      uint64_t v17 = 0LL;
    }
    uint64_t v15 = v17 | v10;
  }

  else
  {
    swift_unknownObjectRelease(a1);
    int64_t int64 = 0LL;
    int64_t v12 = 0LL;
    int64_t v13 = 0LL;
    uint64_t result = 0LL;
    uint64_t v15 = 2LL;
  }

  *a2 = v15;
  a2[1] = int64;
  a2[2] = v12;
  a2[3] = v13;
  a2[4] = result;
  return result;
}

unint64_t sub_10000A088(unint64_t result)
{
  if (result >= 6)
  {
    _StringGuts.grow(_:)(38LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v1._object;
    String.append(_:)(v1);
    swift_bridgeObjectRelease(object);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000027LL,  0x800000010001EFA0LL,  "appleaccountd/XPCActivity.swift",  31LL,  2LL,  251LL,  0);
    __break(1u);
  }

  return result;
}

unint64_t sub_10000A148(unint64_t result)
{
  if (result >= 7) {
    return 7LL;
  }
  return result;
}

unint64_t sub_10000A158()
{
  unint64_t result = qword_10002F738;
  if (!qword_10002F738)
  {
    unint64_t result = swift_getWitnessTable(&unk_100020FE8, &type metadata for XPCActivity.State);
    atomic_store(result, (unint64_t *)&qword_10002F738);
  }

  return result;
}

uint64_t sub_10000A19C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_10000A28C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0LL;
    }
    result |= v5;
    --v1;
  }

  while (v1);
  return result;
}

uint64_t sub_10000A2C4(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x797469726F697270LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v5 = 0xE800000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x797469726F697270LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x6E69746165706572LL && a2 == 0xE900000000000067LL)
  {
    unint64_t v7 = 0xE900000000000067LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E69746165706572LL, 0xE900000000000067LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x79616C6564LL && a2 == 0xE500000000000000LL)
  {
    unint64_t v8 = 0xE500000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x79616C6564LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x7265506563617267LL && a2 == 0xEB00000000646F69LL)
  {
    unint64_t v9 = 0xEB00000000646F69LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7265506563617267LL, 0xEB00000000646F69LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x6C61767265746E69LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v10 = 0xE800000000000000LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C61767265746E69LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    return 5LL;
  }

  else
  {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x736E6F6974706FLL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_10000A560@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100005110(&qword_10002F740);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100005B7C(a1, v9);
  unint64_t v11 = sub_10000A7A0();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for XPCActivity.Criteria.CodingKeys,  &type metadata for XPCActivity.Criteria.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_100004538(a1);
  }
  char v28 = 0;
  unint64_t v12 = sub_10000A7E4();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &v29,  &type metadata for XPCActivity.Priority,  &v28,  v5,  &type metadata for XPCActivity.Priority,  v12);
  char v13 = v29;
  char v27 = 1;
  char v14 = KeyedDecodingContainer.decode(_:forKey:)(&v27, v5);
  char v26 = 2;
  uint64_t v21 = KeyedDecodingContainer.decode(_:forKey:)(&v26, v5);
  char v25 = 3;
  uint64_t v20 = KeyedDecodingContainer.decode(_:forKey:)(&v25, v5);
  char v24 = 4;
  uint64_t v19 = KeyedDecodingContainer.decode(_:forKey:)(&v24, v5);
  char v23 = 5;
  unint64_t v15 = sub_10000A828();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &v22,  &type metadata for XPCActivity.Criteria.Options,  &v23,  v5,  &type metadata for XPCActivity.Criteria.Options,  v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = v22;
  uint64_t result = sub_100004538(a1);
  *(_BYTE *)a2 = v13;
  *(_BYTE *)(a2 + 1) = v14 & 1;
  uint64_t v18 = v20;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + swift_weakDestroy(v0 + 16) = v18;
  *(void *)(a2 + 24) = v19;
  *(void *)(a2 + 32) = v16;
  return result;
}

unint64_t sub_10000A7A0()
{
  unint64_t result = qword_10002F748;
  if (!qword_10002F748)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002147C, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002F748);
  }

  return result;
}

unint64_t sub_10000A7E4()
{
  unint64_t result = qword_10002F750;
  if (!qword_10002F750)
  {
    unint64_t result = swift_getWitnessTable(&unk_100021454, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_10002F750);
  }

  return result;
}

unint64_t sub_10000A828()
{
  unint64_t result = qword_10002F758;
  if (!qword_10002F758)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002142C, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_10002F758);
  }

  return result;
}

unint64_t sub_10000A86C()
{
  unint64_t result = qword_10002F768;
  if (!qword_10002F768)
  {
    unint64_t result = swift_getWitnessTable(&unk_100021404, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_10002F768);
  }

  return result;
}

unint64_t sub_10000A8B0()
{
  unint64_t result = qword_10002F770;
  if (!qword_10002F770)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000213DC, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_10002F770);
  }

  return result;
}

uint64_t sub_10000A8F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_10002F778);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_10000A93C()
{
}

uint64_t sub_10000A944()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000A954()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000A974(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000A984(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000A98C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000A99C(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

unint64_t sub_10000A9AC()
{
  unint64_t result = qword_10002F780;
  if (!qword_10002F780)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_dispatch_queue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002F780);
  }

  return result;
}

uint64_t sub_10000A9E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_unknownObjectWeakLoadStrong(v1 + 72);
  *a1 = result;
  return result;
}

uint64_t sub_10000AA18()
{
  return sub_1000069A4(v0);
}

uint64_t sub_10000AA20()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000AA30()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10000AA54(_xpc_activity_s *a1)
{
  return sub_100006AB8(a1, v1);
}

uint64_t sub_10000AA5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000AA80()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t getEnumTagSinglePayload for XPCActivity.Criteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t storeEnumTagSinglePayload for XPCActivity.Criteria.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_10000AB6C + 4 * byte_100020E9D[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10000ABA0 + 4 * byte_100020E98[v4]))();
}

uint64_t sub_10000ABA0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000ABA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000ABB0LL);
  }
  return result;
}

uint64_t sub_10000ABBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000ABC4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 5;
  return result;
}

uint64_t sub_10000ABC8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000ABD0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.Criteria.CodingKeys()
{
  return &type metadata for XPCActivity.Criteria.CodingKeys;
}

ValueMetadata *type metadata accessor for XPCActivity.Criteria.Options()
{
  return &type metadata for XPCActivity.Criteria.Options;
}

uint64_t getEnumTagSinglePayload for XPCActivity.Priority(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XPCActivity.Priority(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000ACD8 + 4 * byte_100020EA7[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000AD0C + 4 * byte_100020EA2[v4]))();
}

uint64_t sub_10000AD0C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AD14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000AD1CLL);
  }
  return result;
}

uint64_t sub_10000AD28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000AD30LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10000AD34(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000AD3C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000AD48(_BYTE *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.Priority()
{
  return &type metadata for XPCActivity.Priority;
}

unint64_t sub_10000AD68()
{
  unint64_t result = qword_10002F7C8;
  if (!qword_10002F7C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100021144, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_10002F7C8);
  }

  return result;
}

unint64_t sub_10000ADB0()
{
  unint64_t result = qword_10002F7D0;
  if (!qword_10002F7D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002119C, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_10002F7D0);
  }

  return result;
}

unint64_t sub_10000ADF8()
{
  unint64_t result = qword_10002F7D8;
  if (!qword_10002F7D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002116C, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_10002F7D8);
  }

  return result;
}

unint64_t sub_10000AE40()
{
  unint64_t result = qword_10002F7E0;
  if (!qword_10002F7E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000211C4, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_10002F7E0);
  }

  return result;
}

unint64_t sub_10000AE88()
{
  unint64_t result = qword_10002F7E8;
  if (!qword_10002F7E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000211FC, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_10002F7E8);
  }

  return result;
}

unint64_t sub_10000AED0()
{
  unint64_t result = qword_10002F7F0;
  if (!qword_10002F7F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000213B4, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002F7F0);
  }

  return result;
}

unint64_t sub_10000AF18()
{
  unint64_t result = qword_10002F7F8;
  if (!qword_10002F7F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100021324, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002F7F8);
  }

  return result;
}

unint64_t sub_10000AF60()
{
  unint64_t result = qword_10002F800;
  if (!qword_10002F800)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002134C, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002F800);
  }

  return result;
}

unint64_t sub_10000AFA4()
{
  unint64_t result = qword_10002F808;
  if (!qword_10002F808)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000210CC, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_10002F808);
  }

  return result;
}

uint64_t sub_10000AFE8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_100005B00(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10000B02C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10000A9E8(a1);
}

uint64_t sub_10000B078(uint64_t a1)
{
  return sub_10000B0FC(a1, qword_100032790, 0x6E6F6D656164LL, 0xE600000000000000LL);
}

uint64_t *sub_10000B094(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000B0D4(uint64_t a1)
{
  return sub_10000B0FC(a1, qword_1000327A8, 0x616E65746E69616DLL, 0xEB0000000065636ELL);
}

uint64_t sub_10000B0FC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_10000B094(v7, a2);
  sub_100004558(v7, (uint64_t)a2);
  uint64_t v8 = qword_10002F830;
  uint64_t v9 = off_10002F838;
  swift_bridgeObjectRetain(off_10002F838);
  return Logger.init(subsystem:category:)(v8, v9, a3, a4);
}

uint64_t sub_10000B180(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100005110(&qword_10002F9A0);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    **(void **)(*(void *)(v3 + 64) + 4swift_beginAccess(v0 + 24, v1, 33LL, 0LL) = a2;
    return swift_continuation_throwingResume(v3);
  }

uint64_t sub_10000B200(uint64_t a1, int a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    uint64_t v5 = sub_100005110(&qword_10002F9A0);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else
  {
    **(_DWORD **)(*(void *)(v3 + 64) + 4swift_beginAccess(v0 + 24, v1, 33LL, 0LL) = a2;
    return swift_continuation_throwingResume(v3);
  }

uint64_t type metadata accessor for CDPRequestController()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd20CDPRequestController);
}

unint64_t sub_10000B2A0(unint64_t result)
{
  if (result >= 5) {
    return 5LL;
  }
  return result;
}

id sub_10000B2B0()
{
  id v0 = [objc_allocWithZone(ACAccountStore) init];
  id v1 = objc_msgSend(v0, "aa_primaryAppleAccount");

  if (v1)
  {
    id v2 = objc_msgSend(v1, "aa_personID");

    if (v2)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
      uint64_t v4 = v3;

      uint64_t v5 = (void *)objc_opt_self(&OBJC_CLASS___CDPAccount);
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v4);
      id v1 = [v5 isICDPEnabledForDSID:v6];
    }

    else
    {
      return 0LL;
    }
  }

  return v1;
}

uint64_t sub_10000B394()
{
  return swift_task_switch(sub_10000B3A8, 0LL, 0LL);
}

id sub_10000B3A8()
{
  id v1 = (void *)objc_opt_self(&OBJC_CLASS___CDPAccount);
  id result = [v1 sharedInstance];
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v3 = result;
  id v4 = [result contextForPrimaryAccount];
  *(void *)(v0 + 128) = v4;

  if (v4)
  {
    id result = [v1 sharedInstance];
    *(void *)(v0 + 136) = result;
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = v0 + 16;
      *(void *)(v0 + 56) = v0 + 120;
      *(void *)(v0 + swift_weakDestroy(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_10000B588;
      uint64_t v7 = swift_continuation_init(v0 + 16, 1LL);
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      id v8 = (void *)(v0 + 80);
      v8[1] = 0x40000000LL;
      v8[2] = sub_10000B180;
      v8[3] = &unk_100029988;
      v8[4] = v7;
      [v5 octagonStatusForContext:v4 withCompletion:v8];
      return (id)swift_continuation_await(v6);
    }

    goto LABEL_11;
  }

  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = sub_100004558(v9, (uint64_t)qword_100032790);
  unint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    char v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Missing context, reporting CliqueStatus.error", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(-1LL);
}

uint64_t sub_10000B588()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 144LL) = v1;
  if (v1) {
    id v2 = sub_10000B628;
  }
  else {
    id v2 = sub_10000B5E8;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000B5E8()
{
  uint64_t v1 = *(void **)(v0 + 136);

  uint64_t v2 = *(void *)(v0 + 120);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_10000B628()
{
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 128);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B670()
{
  return swift_task_switch(sub_10000B684, 0LL, 0LL);
}

id sub_10000B684()
{
  uint64_t v1 = (void *)objc_opt_self(&OBJC_CLASS___CDPAccount);
  id result = [v1 sharedInstance];
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }

  uint64_t v3 = result;
  id v4 = [result contextForPrimaryAccount];
  *(void *)(v0 + 120) = v4;

  if (v4)
  {
    id result = [v1 sharedInstance];
    *(void *)(v0 + 128) = result;
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = v0 + 16;
      *(void *)(v0 + 56) = v0 + 144;
      *(void *)(v0 + swift_weakDestroy(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_10000B864;
      uint64_t v7 = swift_continuation_init(v0 + 16, 1LL);
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      id v8 = (void *)(v0 + 80);
      v8[1] = 0x40000000LL;
      v8[2] = sub_10000B200;
      v8[3] = &unk_100029970;
      v8[4] = v7;
      [v5 sosStatusForContext:v4 withCompletion:v8];
      return (id)swift_continuation_await(v6);
    }

    goto LABEL_11;
  }

  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = sub_100004558(v9, (uint64_t)qword_100032790);
  unint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v11, v12))
  {
    char v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Missing context, reporting SOSCCStatus.error", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(0xFFFFFFFFLL);
}

uint64_t sub_10000B864()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 136LL) = v1;
  if (v1) {
    uint64_t v2 = sub_10000B904;
  }
  else {
    uint64_t v2 = sub_10000B8C4;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_10000B8C4()
{
  uint64_t v1 = *(void **)(v0 + 128);

  uint64_t v2 = *(unsigned int *)(v0 + 144);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_10000B904()
{
  uint64_t v1 = *(void **)(v0 + 128);
  uint64_t v2 = *(void **)(v0 + 120);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000B94C(uint64_t *a1@<X8>)
{
  id v2 = [objc_allocWithZone(ACAccountStore) init];
  id v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  if (v3)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v3 accountPropertyForKey:v4];

    if (v5)
    {
      _bridgeAnyObjectToAny(_:)(&v32, v5);
      swift_unknownObjectRelease(v5);
    }

    else
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
    }

    sub_10000BE58((uint64_t)&v32, (uint64_t)v34);
    if (v35)
    {
      unint64_t v12 = sub_10000BEE0();
      int v13 = swift_dynamicCast(&v31, v34, (char *)&type metadata for Any + 8, v12, 6LL);
      uint64_t v14 = v31;
      if (!v13) {
        uint64_t v14 = 0LL;
      }
      uint64_t v30 = v14;
    }

    else
    {
      sub_10000BEA0((uint64_t)v34);
      uint64_t v30 = 0LL;
    }

    NSString v15 = String._bridgeToObjectiveC()();
    id v16 = [v3 accountPropertyForKey:v15];

    if (v16)
    {
      _bridgeAnyObjectToAny(_:)(&v32, v16);
      swift_unknownObjectRelease(v16);
    }

    else
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
    }

    sub_10000BE58((uint64_t)&v32, (uint64_t)v34);
    if (v35)
    {
      unint64_t v17 = sub_10000BEE0();
      else {
        uint64_t v6 = 0LL;
      }
    }

    else
    {
      sub_10000BEA0((uint64_t)v34);
      uint64_t v6 = 0LL;
    }

    NSString v18 = String._bridgeToObjectiveC()();
    id v19 = [v3 accountPropertyForKey:v18];

    if (v19)
    {
      _bridgeAnyObjectToAny(_:)(&v32, v19);
      swift_unknownObjectRelease(v19);
    }

    else
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
    }

    sub_10000BE58((uint64_t)&v32, (uint64_t)v34);
    if (v35)
    {
      unint64_t v20 = sub_10000BEE0();
      else {
        uint64_t v7 = 0LL;
      }
    }

    else
    {
      sub_10000BEA0((uint64_t)v34);
      uint64_t v7 = 0LL;
    }

    NSString v21 = String._bridgeToObjectiveC()();
    id v22 = [v3 accountPropertyForKey:v21];

    if (v22)
    {
      _bridgeAnyObjectToAny(_:)(&v32, v22);
      swift_unknownObjectRelease(v22);
    }

    else
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
    }

    sub_10000BE58((uint64_t)&v32, (uint64_t)v34);
    if (v35)
    {
      else {
        uint64_t v8 = 2LL;
      }
    }

    else
    {
      sub_10000BEA0((uint64_t)v34);
      uint64_t v8 = 2LL;
    }

    NSString v23 = String._bridgeToObjectiveC()();
    id v24 = [v3 accountPropertyForKey:v23];

    if (v24)
    {
      _bridgeAnyObjectToAny(_:)(&v32, v24);
      swift_unknownObjectRelease(v24);
    }

    else
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
    }

    sub_10000BE58((uint64_t)&v32, (uint64_t)v34);
    if (v35)
    {
      unint64_t v25 = sub_10000BEE0();
      else {
        uint64_t v9 = 0LL;
      }
    }

    else
    {
      sub_10000BEA0((uint64_t)v34);
      uint64_t v9 = 0LL;
    }

    NSString v26 = String._bridgeToObjectiveC()();
    id v27 = [v3 accountPropertyForKey:v26];

    if (v27)
    {
      _bridgeAnyObjectToAny(_:)(&v32, v27);

      swift_unknownObjectRelease(v27);
    }

    else
    {

      __int128 v32 = 0u;
      __int128 v33 = 0u;
    }

    sub_10000BE58((uint64_t)&v32, (uint64_t)v34);
    if (v35)
    {
      unint64_t v28 = sub_10000BEE0();
      int v29 = swift_dynamicCast(&v31, v34, (char *)&type metadata for Any + 8, v28, 6LL);
      uint64_t v10 = v31;
      if (!v29) {
        uint64_t v10 = 0LL;
      }
    }

    else
    {
      sub_10000BEA0((uint64_t)v34);
      uint64_t v10 = 0LL;
    }

    uint64_t v11 = v30;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 1LL;
  }

  *a1 = v11;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v9;
  a1[5] = v10;
}

uint64_t sub_10000BE58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_10002F9B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BEA0(uint64_t a1)
{
  uint64_t v2 = sub_100005110(&qword_10002F9B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_10000BEE0()
{
  unint64_t result = qword_10002F9B8;
  if (!qword_10002F9B8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002F9B8);
  }

  return result;
}

void destroy for CachedEDPHealth(id *a1)
{
}

uint64_t initializeWithCopy for CachedEDPHealth(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  id v5 = *(void **)(a2 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v5;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v6 = *(void **)(a2 + 32);
  uint64_t v7 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  id v8 = v3;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  return a1;
}

uint64_t assignWithCopy for CachedEDPHealth(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  uint64_t v7 = *(void **)(a1 + 8);
  id v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  id v10 = *(void **)(a1 + 16);
  id v11 = *(void **)(a2 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v11;
  id v12 = v11;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  int v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v14;
  id v15 = v14;

  id v16 = *(void **)(a1 + 40);
  unint64_t v17 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v17;
  id v18 = v17;

  return a1;
}

__n128 initializeWithTake for CachedEDPHealth(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CachedEDPHealth(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  id v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CachedEDPHealth(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CachedEDPHealth(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 48) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CachedEDPHealth()
{
  return &type metadata for CachedEDPHealth;
}

uint64_t sub_10000C1A4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

id sub_10000C1FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppleAccountDaemonManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AppleAccountDaemonManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd25AppleAccountDaemonManager);
}

uint64_t sub_10000C284()
{
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100004558(v0, (uint64_t)qword_100032790);
  objc_super v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "AppleAccountDaemonManager: Trying to exit appleaccountd.",  v4,  2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  return xpc_transaction_exit_clean();
}

uint64_t sub_10000C520(uint64_t a1, uint64_t a2)
{
  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  return swift_task_switch(sub_10000C53C, 0LL, 0LL);
}

uint64_t sub_10000C53C()
{
  id v1 = objc_msgSend(*(id *)(v0 + 96), "aa_altDSID");
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 104);
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    uint64_t v7 = v6;

    *(void *)(v0 + 112) = v5;
    *(void *)(v0 + 120) = v7;
    id v8 = (void *)(v3 + OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache);
    uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache + 24);
    uint64_t v10 = v8[4];
    sub_100005B7C(v8, v9);
    *(void *)(v0 + 56) = v4;
    *(void *)(v0 + swift_weakDestroy(v0 + 16) = v5;
    *(void *)(v0 + 24) = v7;
    uint64_t v11 = *(void *)(*(void *)(v10 + 8) + 8LL);
    id v12 = *(int **)(v11 + 32);
    uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
    int v13 = (void *)swift_task_alloc(v12[1]);
    *(void *)(v0 + 128) = v13;
    *int v13 = v0;
    v13[1] = sub_10000C828;
    return v30(v0 + 48, v0 + 56, v0 + 16, v9, v11);
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    id v15 = *(void **)(v0 + 96);
    uint64_t v16 = type metadata accessor for Logger(0LL);
    sub_100004558(v16, (uint64_t)qword_100032790);
    unint64_t v17 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v18 = static os_log_type_t.error.getter();
    BOOL v19 = os_log_type_enabled(v17, v18);
    unint64_t v20 = *(void **)(v0 + 96);
    if (v19)
    {
      NSString v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      id v22 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)NSString v21 = 138412290;
      *(void *)(v0 + 40) = v20;
      id v23 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48);
      *id v22 = v20;

      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to get altDSID from account: %@", v21, 0xCu);
      uint64_t v24 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v22, 1LL, v24);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    else
    {
    }

    type metadata accessor for AAError(0LL);
    uint64_t v26 = v25;
    *(void *)(v0 + 32) = -4410LL;
    unint64_t v27 = sub_10001B724((uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v28 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
    int v29 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 64), v0 + 32, v27, v26, v28);
    swift_willThrow(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_10000C828()
{
  uint64_t v1 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 128));

  return swift_task_switch(sub_10000C880, 0LL, 0LL);
}

uint64_t sub_10000C880()
{
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100004558(v3, (uint64_t)qword_100032790);
  id v4 = v1;
  swift_bridgeObjectRetain(v2);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  unint64_t v9 = *(void *)(v0 + 120);
  if (v8)
  {
    uint64_t v17 = *(void *)(v0 + 112);
    uint64_t v10 = *(void **)(v0 + 88);
    uint64_t v11 = swift_slowAlloc(22LL, -1LL);
    uint64_t v16 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v18 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v11 = 138412546;
    *(void *)(v0 + 72) = v10;
    id v12 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80);
    *uint64_t v16 = v10;

    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain(v9);
    *(void *)(v0 + 80) = sub_10001BAA4(v17, v9, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
    swift_bridgeObjectRelease_n(v9, 3LL);
    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "Cached login response (%@) for altDSID: %s",  (uint8_t *)v11,  0x16u);
    uint64_t v13 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v16, 1LL, v13);
    swift_slowDealloc(v16, -1LL, -1LL);
    swift_arrayDestroy(v18, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {
    uint64_t v14 = *(void **)(v0 + 88);

    swift_bridgeObjectRelease_n(v9, 2LL);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000CC14(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  void v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v8 = dword_10002FADC;
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = (void *)swift_task_alloc(v8);
  v4[6] = v12;
  void *v12 = v4;
  v12[1] = sub_10000CCB8;
  v12[12] = v10;
  v12[13] = v11;
  v12[11] = v9;
  return swift_task_switch(sub_10000C53C, 0LL, 0LL);
}

uint64_t sub_10000CCB8()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  id v4 = *(void **)(*v1 + 24);
  uint64_t v3 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc(v2);

  uint64_t v7 = *(void *)(v6 + 40);
  if (v0)
  {
    uint64_t v8 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }

  else
  {
    (*(void (**)(void, void))(v7 + 16))(*(void *)(v6 + 40), 0LL);
  }

  _Block_release(*(const void **)(v6 + 40));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_10000CD6C(uint64_t a1)
{
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = v1;
  return swift_task_switch(sub_10000CD84, 0LL, 0LL);
}

uint64_t sub_10000CD84()
{
  id v1 = objc_msgSend(*(id *)(v0 + 104), "aa_altDSID");
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)(v0 + 112);
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    uint64_t v6 = v5;

    *(void *)(v0 + 120) = v4;
    *(void *)(v0 + 128) = v6;
    uint64_t v7 = (void *)(v3 + OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache);
    uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache + 24);
    uint64_t v9 = v7[4];
    sub_100005B7C(v7, v8);
    *(void *)(v0 + swift_weakDestroy(v0 + 16) = v4;
    *(void *)(v0 + 24) = v6;
    uint64_t v10 = *(void *)(*(void *)(v9 + 8) + 8LL);
    id v11 = *(int **)(v10 + 40);
    int v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v11 + *v11);
    id v12 = (void *)swift_task_alloc(v11[1]);
    *(void *)(v0 + 136) = v12;
    void *v12 = v0;
    v12[1] = sub_10000D060;
    return v29(v0 + 48, v0 + 16, v8, v10);
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v14 = *(void **)(v0 + 104);
    uint64_t v15 = type metadata accessor for Logger(0LL);
    sub_100004558(v15, (uint64_t)qword_100032790);
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v17 = static os_log_type_t.error.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = *(void **)(v0 + 104);
    if (v18)
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      NSString v21 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)unint64_t v20 = 138412290;
      *(void *)(v0 + 40) = v19;
      id v22 = v19;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48);
      void *v21 = v19;

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to get altDSID from account: %@", v20, 0xCu);
      uint64_t v23 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v21, 1LL, v23);
      swift_slowDealloc(v21, -1LL, -1LL);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    else
    {
    }

    type metadata accessor for AAError(0LL);
    uint64_t v25 = v24;
    *(void *)(v0 + 32) = -4410LL;
    unint64_t v26 = sub_10001B724((uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v27 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
    uint64_t v28 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 56), v0 + 32, v26, v25, v27);
    swift_willThrow(v28);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_10000D060()
{
  return swift_task_switch(sub_10000D0B4, 0LL, 0LL);
}

uint64_t sub_10000D0B4()
{
  id v1 = *(void **)(v0 + 48);
  if (v1)
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v2 = *(void *)(v0 + 128);
    uint64_t v3 = type metadata accessor for Logger(0LL);
    sub_100004558(v3, (uint64_t)qword_100032790);
    id v4 = v1;
    swift_bridgeObjectRetain(v2);
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.info.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    unint64_t v9 = *(void *)(v0 + 128);
    if (v8)
    {
      uint64_t v30 = *(void *)(v0 + 120);
      uint64_t v10 = swift_slowAlloc(22LL, -1LL);
      int v29 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v31 = swift_slowAlloc(32LL, -1LL);
      v32[0] = v31;
      *(_DWORD *)uint64_t v10 = 138412546;
      *(void *)(v0 + 88) = v4;
      id v11 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96);
      *int v29 = v1;

      *(_WORD *)(v10 + 12) = 2080;
      swift_bridgeObjectRetain(v9);
      *(void *)(v0 + 96) = sub_10001BAA4(v30, v9, v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104);
      swift_bridgeObjectRelease_n(v9, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "Returning cached login response (%@) for altDSID: %s",  (uint8_t *)v10,  0x16u);
      uint64_t v12 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v29, 1LL, v12);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_arrayDestroy(v31, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1LL, -1LL);
      swift_slowDealloc(v10, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v9, 2LL);
    }

    return (*(uint64_t (**)(id))(v0 + 8))(v4);
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v13 = *(void *)(v0 + 128);
    uint64_t v14 = type metadata accessor for Logger(0LL);
    sub_100004558(v14, (uint64_t)qword_100032790);
    swift_bridgeObjectRetain(v13);
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.error.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    unint64_t v19 = *(void *)(v0 + 128);
    if (v18)
    {
      uint64_t v20 = *(void *)(v0 + 120);
      NSString v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v22 = swift_slowAlloc(32LL, -1LL);
      v32[0] = v22;
      *(_DWORD *)NSString v21 = 136315138;
      swift_bridgeObjectRetain(v19);
      *(void *)(v0 + 80) = sub_10001BAA4(v20, v19, v32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
      swift_bridgeObjectRelease_n(v19, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Cached login response not found for altDSID: %s", v21, 0xCu);
      swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(*(void *)(v0 + 128), 2LL);
    }

    type metadata accessor for AAError(0LL);
    uint64_t v25 = v24;
    *(void *)(v0 + 72) = -4411LL;
    unint64_t v26 = sub_10001B724((uint64_t)&_swiftEmptyArrayStorage);
    uint64_t v27 = sub_100004604( (unint64_t *)&qword_10002EF98,  (uint64_t (*)(uint64_t))type metadata accessor for AAError,  (uint64_t)&unk_100020B1C);
    uint64_t v28 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 64), v0 + 72, v26, v25, v27);
    swift_willThrow(v28);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_10000D64C(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_10002FAA4;
  id v7 = a1;
  id v8 = a3;
  unint64_t v9 = (void *)swift_task_alloc(v6);
  v3[5] = v9;
  *unint64_t v9 = v3;
  v9[1] = sub_10000D6DC;
  v9[13] = v7;
  v9[14] = v8;
  return swift_task_switch(sub_10000CD84, 0LL, 0LL);
}

uint64_t sub_10000D6DC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*v2 + 40);
  id v7 = *(void **)(*v2 + 16);
  uint64_t v6 = *(void **)(*v2 + 24);
  uint64_t v8 = *v2;
  swift_task_dealloc(v5);

  unint64_t v9 = *(void (***)(void, void, void))(v8 + 32);
  if (v3)
  {
    uint64_t v10 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v10);

    _Block_release(v9);
  }

  else
  {
    ((void (**)(void, void *, void))v9)[2](v9, a1, 0LL);
    _Block_release(v9);
  }

  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_10000D7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_100004558(v6, (uint64_t)qword_100032790);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[AppleAccountDaemonManager urlConfiguration] called.", v10, 2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  sub_100005B7C( (void *)(v3 + OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_urlConfigurationManager),  *(void *)(v3 + OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_urlConfigurationManager + 24));
  return sub_100011914(a1, a2);
}

void sub_10000D914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = _convertErrorToNSError(_:)(a3);
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);
}

uint64_t sub_10000D97C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10000D9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_10000D9A8()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_10000D9DC()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  id v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10002FA64);
  *(void *)(v1 + swift_weakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005384;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_10002FA60 + dword_10002FA60))(v2, v3, v4);
}

uint64_t sub_10000DA48(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + swift_weakDestroy(v0 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100005384;
  return v6();
}

uint64_t sub_10000DAA0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  id v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10002FA74);
  *(void *)(v1 + swift_weakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005384;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10002FA70 + dword_10002FA70))(v2, v3, v4);
}

uint64_t sub_10000DB1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_10002FA84);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005384;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10002FA80 + dword_10002FA80))( a1,  v4,  v5,  v6);
}

uint64_t sub_10000DBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100005240(a1);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      uint64_t v11 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v16 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_100029AE8, 32LL, 7LL);
  *(void *)(v17 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    BOOL v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    BOOL v18 = 0LL;
  }

  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_10002FA98, v17);
}

uint64_t sub_10000DCE4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10000DD08(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10002FA94);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000051F8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002FA90 + dword_10002FA90))(a1, v4);
}

uint64_t sub_10000DD78()
{
  uint64_t v0 = sub_100005110(&qword_10002FAE8);
  else {
    uint64_t v1 = 0LL;
  }
  if (v1) {
    uint64_t v2 = (uint64_t *)&unk_1000306B0;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_10002FAF0;
  }
  return sub_100005110(v2);
}

uint64_t sub_10000DDC4()
{
  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_10000DE00()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc(dword_10002FABC);
  *(void *)(v1 + swift_weakDestroy(v0 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_1000051F8;
  return ((uint64_t (*)(void *, void *, void *, void *))((char *)&dword_10002FAB8 + dword_10002FAB8))( v2,  v3,  v5,  v4);
}

uint64_t sub_10000DE80()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

id sub_10000DEAC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v32 = a1;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v31 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchTime(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  unsigned __int8 v16 = (char *)&v27 - v15;
  if ([(id)objc_opt_self(AAFDeviceInfo) deviceIsAudioAccessory])
  {
    static DispatchTime.now()();
    + infix(_:_:)(v14, 600.0);
    uint64_t v17 = *(void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v29 = v10;
    uint64_t v30 = v17;
    v17(v14, v10);
    uint64_t v18 = sub_100005B44(0LL, (unint64_t *)&qword_10002F780, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v19 = static OS_dispatch_queue.main.getter(v18);
    uint64_t v28 = v7;
    uint64_t v20 = (void *)v19;
    aBlock[4] = sub_10000C284;
    aBlock[5] = 0LL;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_10000C1A4;
    aBlock[3] = &unk_100029B78;
    NSString v21 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter(v21);
    aBlock[0] = &_swiftEmptyArrayStorage;
    uint64_t v22 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v27 = v4;
    uint64_t v23 = v22;
    uint64_t v24 = sub_100005110(&qword_10002F790);
    unint64_t v25 = sub_10000E3C0();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v3, v23);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v16, v9, v6, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v28);
    v30(v16, v29);
  }

  return [v2 shouldAcceptNewConnection:v32];
}

void sub_10000E150(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v8 = sub_100004558(v4, (uint64_t)qword_100032790);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  uint64_t v10 = (void *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (!os_log_type_enabled((os_log_t)v10, v11))
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_7;
  }

  uint64_t v21 = v5;
  uint64_t v22 = a2;
  uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v20 = swift_slowAlloc(32LL, -1LL);
  uint64_t v24 = v20;
  *(_DWORD *)uint64_t v12 = 136315138;
  id v13 = objc_msgSend(v9, "aa_altDSID");
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    unint64_t v17 = v16;

    uint64_t v23 = sub_10001BAA4(v15, v17, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);

    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, v11, "Account %s is deleted.", v12, 0xCu);
    uint64_t v18 = v20;
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v4);
    a2 = v22;
LABEL_7:
    (*((void (**)(const void *, void))a2 + 2))(a2, 0LL);
    return;
  }

  _Block_release(v22);

  __break(1u);
}

uint64_t sub_10000E3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E3B8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10000E3C0()
{
  unint64_t result = qword_10002F798;
  if (!qword_10002F798)
  {
    uint64_t v1 = sub_100005B00(&qword_10002F790);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10002F798);
  }

  return result;
}

void NSXPCInterface.aa_setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  id v9 = sub_10000E568(a1);
  id v10 = objc_allocWithZone(&OBJC_CLASS___NSSet);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  id v12 = [v10 initWithArray:isa];

  uint64_t v15 = 0LL;
  static Set._conditionallyBridgeFromObjectiveC(_:result:)( v12,  &v15,  &type metadata for AnyHashable,  &protocol witness table for AnyHashable);

  uint64_t v13 = v15;
  if (v15)
  {
    Class v14 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v13);
    [v5 setClasses:v14 forSelector:a2 argumentIndex:a3 ofReply:a4 & 1];
  }

  else
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002DLL,  0x800000010001F4A0LL,  "appleaccountd/NSXPCInterface+AppleAccount.swift",  47LL,  2LL,  17LL,  0);
    __break(1u);
  }

void *sub_10000E568(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    os_log_type_t v11 = &_swiftEmptyArrayStorage;
    sub_10000E690(0, v1, 0);
    uint64_t v4 = (uint64_t *)(a1 + 32);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    do
    {
      uint64_t v9 = *v4;
      uint64_t v5 = sub_100005110(&qword_10002FAE8);
      swift_dynamicCast(v10, &v9, v5, (char *)&type metadata for Any + 8, 7LL);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10000E690(0, v2[2] + 1LL, 1);
        uint64_t v2 = v11;
      }

      unint64_t v7 = v2[2];
      unint64_t v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_10000E690(v6 > 1, v7 + 1, 1);
        uint64_t v2 = v11;
      }

      v2[2] = v7 + 1;
      sub_10000E6AC(v10, &v2[4 * v7 + 4]);
      ++v4;
      --v1;
    }

    while (v1);
  }

  return v2;
}

uint64_t sub_10000E690(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E6BC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

_OWORD *sub_10000E6AC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000E6BC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    uint64_t v10 = sub_100005110(&qword_10002FAF8);
    os_log_type_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }

  else
  {
    os_log_type_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  Class v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

BOOL sub_10000E828(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100005110(&qword_10002FC28);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2 += 16LL;
  swift_beginAccess(a2, v46, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a2);
  if (Strong)
  {
    uint64_t v13 = Strong;
    v41[1] = a1;
    uint64_t v14 = Strong + OBJC_IVAR____TtC13appleaccountd35AppleIDAvailabilityActivityProvider__accountStore;
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v15(v11, Strong + OBJC_IVAR____TtC13appleaccountd35AppleIDAvailabilityActivityProvider__accountStore, v8);
    Dependency.wrappedValue.getter(v44, v8);
    unint64_t v16 = *(void (**)(char *, uint64_t))(v9 + 8);
    v16(v11, v8);
    id v17 = objc_msgSend(*(id *)(*sub_100005B7C(v44, v45) + 16), "aa_primaryAppleAccount");

    uint64_t v18 = sub_100004538(v44);
    if (v17)
    {
      uint64_t v19 = UUID.init()(v18);
      UUID.uuidString.getter(v19);
      v41[0] = v20;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v15(v11, v14, v8);
      Dependency.wrappedValue.getter(v44, v8);
      v16(v11, v8);
      id v21 = objc_msgSend(*(id *)(*sub_100005B7C(v44, v45) + 16), "aa_primaryAppleAccount");

      sub_100004538(v44);
      if (v21)
      {
        sub_10001048C(1, (uint64_t)sub_10000ECA0, 0LL);
        swift_release(v13);
        unint64_t v22 = v41[0];
      }

      else
      {
        uint64_t v33 = sub_100005110(&qword_10002FC30);
        uint64_t inited = swift_initStackObject(v33, v43);
        *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_100020E10;
        *(void *)(inited + 32) = 0x72456E496E676953LL;
        *(void *)(inited + 40) = 0xEB00000000726F72LL;
        type metadata accessor for AASignInError(0LL);
        uint64_t v36 = v35;
        uint64_t v42 = -8014LL;
        unint64_t v37 = sub_10001B724((uint64_t)&_swiftEmptyArrayStorage);
        uint64_t v38 = sub_100004604( &qword_10002EF60,  (uint64_t (*)(uint64_t))type metadata accessor for AASignInError,  (uint64_t)&unk_100020A1C);
        _BridgedStoredNSError.init(_:userInfo:)(v44, &v42, v37, v36, v38);
        *(void *)(inited + 48) = v44[0];
        unint64_t v39 = sub_10001C83C(inited);
        sub_10000ECA0(0, v39);
        swift_release(v13);
        swift_bridgeObjectRelease(v41[0]);
        unint64_t v22 = v39;
      }

      swift_bridgeObjectRelease(v22);
    }

    else
    {
      if (qword_10002ED70 != -1) {
        swift_once(&qword_10002ED70, sub_10000B0D4);
      }
      uint64_t v28 = type metadata accessor for Logger(0LL);
      uint64_t v29 = sub_100004558(v28, (uint64_t)qword_1000327A8);
      uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
      os_log_type_t v31 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "No account signed in. Skipping AppleID Availability activity.",  v32,  2u);
        swift_slowDealloc(v32, -1LL, -1LL);
        swift_release(v13);
      }

      else
      {

        swift_release(v13);
      }
    }
  }

  else
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v23 = type metadata accessor for Logger(0LL);
    uint64_t v24 = sub_100004558(v23, (uint64_t)qword_1000327A8);
    unint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Lost reference to self. Aborting AppleID Availability XPC activity",  v27,  2u);
      swift_slowDealloc(v27, -1LL, -1LL);
    }
  }

  return sub_100006790();
}

void sub_10000ECA0(char a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v4 = type metadata accessor for Logger(0LL);
    sub_100004558(v4, (uint64_t)qword_1000327A8);
    uint64_t v5 = swift_bridgeObjectRetain_n(a2, 2LL);
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v9 = swift_slowAlloc(32LL, -1LL);
      uint64_t v15 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v10 = sub_100005110(&qword_10002F9A0);
      uint64_t v11 = Dictionary.description.getter(a2, &type metadata for String, v10, &protocol witness table for String);
      unint64_t v13 = v12;
      swift_bridgeObjectRelease(a2);
      uint64_t v14 = sub_10001BAA4(v11, v13, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15);
      swift_bridgeObjectRelease_n(a2, 2LL);
      swift_bridgeObjectRelease(v13);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Overall AppleID Availability activity failed: %s", v8, 0xCu);
      swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1LL, -1LL);
      swift_slowDealloc(v8, -1LL, -1LL);

      if ((a1 & 1) == 0) {
        return;
      }
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
      if ((a1 & 1) == 0) {
        return;
      }
    }

    [(id)objc_opt_self(AAPreferences) isHealthCheckTTREnabled];
  }

void sub_10000EEAC(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, dispatch_group_s *a7)
{
  LODWORD(v77) = a2;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin();
  unint64_t v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  uint64_t v17 = __chkstk_darwin();
  uint64_t v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    uint64_t v72 = a5;
    uint64_t v73 = v18;
    uint64_t v74 = v17;
    uint64_t v76 = v14;
    swift_errorRetain(a1);
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v75 = a4;
    uint64_t v21 = type metadata accessor for Logger(0LL);
    sub_100004558(v21, (uint64_t)qword_1000327A8);
    sub_100010F9C((uint64_t)a3, (uint64_t)&aBlock);
    swift_errorRetain(a1);
    uint64_t v22 = swift_errorRetain(a1);
    uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc(32LL, -1LL);
      v71 = a7;
      uint64_t v26 = v25;
      v68 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      uint64_t v69 = swift_slowAlloc(64LL, -1LL);
      *(void *)&v84[0] = v69;
      *(_DWORD *)uint64_t v26 = 136315650;
      if ((v77 & 1) != 0) {
        uint64_t v27 = 0x656C756465686353LL;
      }
      else {
        uint64_t v27 = 0x6E616D6544206E4FLL;
      }
      uint64_t v70 = a6;
      v85 = (void *)sub_10001BAA4(v27, 0xE900000000000064LL, (uint64_t *)v84);
      uint64_t v77 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      swift_bridgeObjectRelease(0xE900000000000064LL);
      *(_WORD *)(v26 + 12) = 2080;
      uint64_t v28 = v81;
      uint64_t v29 = sub_100005B7C(&aBlock, (uint64_t)v81);
      uint64_t DynamicType = swift_getDynamicType(v29, v28, 1LL);
      uint64_t v31 = _typeName(_:qualified:)(DynamicType, 0LL);
      unint64_t v33 = v32;
      v85 = (void *)sub_10001BAA4(v31, v32, (uint64_t *)v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      swift_bridgeObjectRelease(v33);
      sub_100004538(&aBlock);
      *(_WORD *)(v26 + 22) = 2112;
      uint64_t v34 = _convertErrorToNSError(_:)(a1);
      v85 = (void *)v34;
      uint64_t v13 = v77;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      uint64_t v35 = v68;
      uint64_t *v68 = v34;
      a6 = v70;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl( (void *)&_mh_execute_header,  v23,  v24,  "%s %s Apple ID Availability activity failed with error %@",  (uint8_t *)v26,  0x20u);
      uint64_t v36 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v35, 1LL, v36);
      swift_slowDealloc(v35, -1LL, -1LL);
      uint64_t v37 = v69;
      swift_arrayDestroy(v69, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v37, -1LL, -1LL);
      uint64_t v38 = v26;
      a7 = v71;
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    else
    {
      sub_100004538(&aBlock);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    uint64_t v52 = a3[3];
    v53 = sub_100005B7C(a3, v52);
    uint64_t v54 = swift_getDynamicType(v53, v52, 1LL);
    uint64_t v55 = a3[4];
    __int128 aBlock = (void **)v54;
    uint64_t v79 = v55;
    uint64_t v56 = sub_100005110(&qword_10002FC38);
    uint64_t v57 = String.init<A>(describing:)(&aBlock, v56);
    uint64_t v59 = v58;
    sub_100010F9C((uint64_t)a3, (uint64_t)v84);
    v60 = (void *)swift_allocObject(&unk_100029D10, 96LL, 7LL);
    uint64_t v61 = v72;
    v60[2] = a1;
    v60[3] = v61;
    v60[4] = v57;
    v60[5] = v59;
    v60[6] = a6;
    sub_100011024(v84, (uint64_t)(v60 + 7));
    v82 = sub_100011180;
    v83 = v60;
    __int128 aBlock = _NSConcreteStackBlock;
    uint64_t v79 = 1107296256LL;
    v80 = sub_10000C1A4;
    v81 = &unk_100029D28;
    v62 = _Block_copy(&aBlock);
    swift_errorRetain(a1);
    swift_retain(v61);
    uint64_t v63 = swift_retain(a6);
    static DispatchQoS.unspecified.getter(v63);
    v85 = &_swiftEmptyArrayStorage;
    uint64_t v64 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v65 = sub_100005110(&qword_10002F790);
    uint64_t v66 = sub_1000110B8((unint64_t *)&qword_10002F798, &qword_10002F790);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v85, v65, v66, v13, v64);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v20, v16, v62);
    _Block_release(v62);
    swift_errorRelease(a1);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v16, v13);
    (*(void (**)(char *, uint64_t))(v73 + 8))(v20, v74);
    swift_release(v83);
  }

  else
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v39 = type metadata accessor for Logger(0LL);
    sub_100004558(v39, (uint64_t)qword_1000327A8);
    uint64_t v40 = sub_100010F9C((uint64_t)a3, (uint64_t)&aBlock);
    uint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc(22LL, -1LL);
      uint64_t v44 = swift_slowAlloc(64LL, -1LL);
      *(void *)&v84[0] = v44;
      *(_DWORD *)uint64_t v43 = 136315394;
      if ((v77 & 1) != 0) {
        uint64_t v45 = 0x656C756465686353LL;
      }
      else {
        uint64_t v45 = 0x6E616D6544206E4FLL;
      }
      v85 = (void *)sub_10001BAA4(v45, 0xE900000000000064LL, (uint64_t *)v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      swift_bridgeObjectRelease(0xE900000000000064LL);
      *(_WORD *)(v43 + 12) = 2080;
      v46 = v81;
      uint64_t v47 = sub_100005B7C(&aBlock, (uint64_t)v81);
      uint64_t v48 = swift_getDynamicType(v47, v46, 1LL);
      uint64_t v49 = _typeName(_:qualified:)(v48, 0LL);
      unint64_t v51 = v50;
      v85 = (void *)sub_10001BAA4(v49, v50, (uint64_t *)v84);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86);
      swift_bridgeObjectRelease(v51);
      sub_100004538(&aBlock);
      _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "%s %s Apple ID Availability activity completed.",  (uint8_t *)v43,  0x16u);
      swift_arrayDestroy(v44, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1LL, -1LL);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    else
    {
      sub_100004538(&aBlock);
    }
  }

  dispatch_group_leave(a7);
}

uint64_t sub_10000F5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (void *)(a2 + 16);
  uint64_t v10 = (void *)_convertErrorToNSError(_:)(a1);
  id v11 = objc_msgSend(v10, "aa_partialErrorsByName");

  if (!v11) {
    goto LABEL_5;
  }
  uint64_t v12 = sub_100005110(&qword_10002F9A0);
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v11,  &type metadata for String,  v12,  &protocol witness table for String);

  if (!*(void *)(v13 + 16))
  {
    swift_bridgeObjectRelease(v13);
LABEL_5:
    swift_beginAccess(v9, v18, 33LL, 0LL);
    swift_bridgeObjectRetain(a4);
    swift_errorRetain(a1);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v9);
    uint64_t v17 = *v9;
    *uint64_t v9 = 0x8000000000000000LL;
    sub_10001017C(a1, a3, a4, isUniquelyReferenced_nonNull_native);
    uint64_t v15 = *v9;
    *uint64_t v9 = v17;
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(v15);
    swift_endAccess(v18);
    goto LABEL_6;
  }

  swift_bridgeObjectRetain(a4);
  sub_100011194(v13, v9, a3, a4);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(a4);
LABEL_6:
  uint64_t result = swift_beginAccess(a5 + 16, v18, 1LL, 0LL);
  *(_BYTE *)(a5 + swift_weakDestroy(v0 + 16) = 1;
  return result;
}

uint64_t sub_10000F73C()
{
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100004558(v0, (uint64_t)qword_1000327A8);
  __int128 v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "AppleIDAvailabilityActivityProvider: Trying to exit appleaccountd.",  v4,  2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }

  return xpc_transaction_exit_clean();
}

uint64_t sub_10000F808(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = a1;
  char v10 = a2 & 1;
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v26 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = swift_allocObject(&unk_100029CC0, 56LL, 7LL);
  *(_BYTE *)(v18 + swift_weakDestroy(v0 + 16) = v10;
  *(void *)(v18 + 24) = a3;
  *(void *)(v18 + 32) = a4;
  *(void *)(v18 + 40) = a5;
  *(void *)(v18 + 48) = a6;
  aBlock[4] = sub_10001112C;
  uint64_t v30 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000C1A4;
  aBlock[3] = &unk_100029CD8;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain(a3);
  swift_retain(a5);
  uint64_t v20 = swift_retain(a6);
  static DispatchQoS.unspecified.getter(v20);
  uint64_t v28 = &_swiftEmptyArrayStorage;
  uint64_t v21 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v22 = sub_100005110(&qword_10002F790);
  uint64_t v23 = sub_1000110B8((unint64_t *)&qword_10002F798, &qword_10002F790);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v22, v23, v11, v21);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v17, v13, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  return swift_release(v30);
}

uint64_t sub_10000FA14(char a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5)
{
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v9 = (void *)(a2 + 16);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  sub_100004558(v10, (uint64_t)qword_1000327A8);
  uint64_t v11 = swift_retain_n(a2, 2LL);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc(22LL, -1LL);
    uint64_t v25 = swift_slowAlloc(64LL, -1LL);
    v30[0] = v25;
    *(_DWORD *)uint64_t v14 = 136315394;
    if ((a1 & 1) != 0) {
      uint64_t v15 = 0x656C756465686353LL;
    }
    else {
      uint64_t v15 = 0x6E616D6544206E4FLL;
    }
    uint64_t v26 = a5;
    uint64_t v28 = sub_10001BAA4(v15, 0xE900000000000064LL, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, v29);
    swift_bridgeObjectRelease(0xE900000000000064LL);
    *(_WORD *)(v14 + 12) = 2080;
    swift_beginAccess(a2 + 16, v27, 0LL, 0LL);
    uint64_t v16 = *(void *)(a2 + 16);
    swift_bridgeObjectRetain(v16);
    uint64_t v17 = sub_100005110(&qword_10002F9A0);
    uint64_t v18 = Dictionary.description.getter(v16, &type metadata for String, v17, &protocol witness table for String);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease(v16);
    uint64_t v28 = sub_10001BAA4(v18, v20, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, v29);
    swift_release_n(a2, 2LL);
    unint64_t v21 = v20;
    a5 = v26;
    swift_bridgeObjectRelease(v21);
    _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "Overall %s Apple ID Availability activities finished with errors: %s",  (uint8_t *)v14,  0x16u);
    swift_arrayDestroy(v25, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {

    swift_release_n(a2, 2LL);
  }

  swift_beginAccess(a5 + 16, v30, 0LL, 0LL);
  uint64_t v22 = *(unsigned __int8 *)(a5 + 16);
  swift_beginAccess(a2 + 16, &v28, 0LL, 0LL);
  uint64_t v23 = *v9;
  swift_bridgeObjectRetain(*v9);
  a3(v22, v23);
  return swift_bridgeObjectRelease(v23);
}

uint64_t sub_10000FCEC()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC13appleaccountd35AppleIDAvailabilityActivityProvider__accountStore;
  uint64_t v2 = sub_100005110(&qword_10002FC28);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_10000FD48()
{
  return type metadata accessor for AppleIDAvailabilityActivityProvider(0LL);
}

uint64_t type metadata accessor for AppleIDAvailabilityActivityProvider(uint64_t a1)
{
  uint64_t result = qword_10002FB30;
  if (!qword_10002FB30) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppleIDAvailabilityActivityProvider);
  }
  return result;
}

void sub_10000FD8C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[1] = &unk_1000215F8;
  sub_10000FE10(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(v2 - 8) + 64LL;
    swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
  }

void sub_10000FE10(uint64_t a1)
{
  if (!qword_10002FB40)
  {
    uint64_t v2 = sub_100005B00(&qword_10002F578);
    unint64_t v3 = type metadata accessor for Dependency(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10002FB40);
    }
  }

Swift::Int sub_10000FE68(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005110(&qword_10002FC40);
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

uint64_t sub_10001017C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001CF20(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1000102D8();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_errorRelease(*(void *)(v19 + 8 * v12));
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }

LABEL_11:
    v18[(v12 >> 6) + 8] |= 1LL << v12;
    uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
    uint64_t *v23 = a2;
    v23[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v24 = v18[2];
    BOOL v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }

    goto LABEL_14;
  }

  sub_10000FE68(v15, a4 & 1);
  unint64_t v21 = sub_10001CF20(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    unint64_t v12 = v21;
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void *sub_1000102D8()
{
  uint64_t v1 = v0;
  sub_100005110(&qword_10002FC40);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = *(void *)(v2 + 16);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    uint64_t result = (void *)swift_errorRetain(v20);
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

uint64_t sub_10001048C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v95 = a3;
  uint64_t v94 = a2;
  uint64_t v93 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v92 = *(void *)(v93 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v91 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v102 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v101 = *(void *)(v102 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v100 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v90 = type metadata accessor for DispatchTime(0LL);
  uint64_t v88 = *(void *)(v90 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v87 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  v89 = (char *)&v86 - v8;
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v99 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v98 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  int64_t v13 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = dispatch_group_create();
  uint64_t v108 = swift_allocObject(&unk_100029BD0, 24LL, 7LL);
  *(void *)(v108 + swift_weakDestroy(v0 + 16) = &_swiftEmptyDictionarySingleton;
  unint64_t v19 = sub_10000A9AC();
  uint64_t v20 = (*(uint64_t (**)(char *, void, uint64_t))(v15 + 104))( v17,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v14);
  static DispatchQoS.unspecified.getter(v20);
  __int128 aBlock = (void **)&_swiftEmptyArrayStorage;
  uint64_t v21 = sub_100004604( &qword_10002F7B0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v22 = sub_100005110(&qword_10002F7B8);
  uint64_t v23 = sub_1000110B8((unint64_t *)&qword_10002F7C0, &qword_10002F7B8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v22, v23, v9, v21);
  v97 = v13;
  unint64_t v96 = v19;
  int64_t v24 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000037LL,  0x800000010001F540LL,  v13,  v11,  v17,  0LL);
  uint64_t v25 = swift_allocObject(&unk_100029BF8, 17LL, 7LL);
  *(_BYTE *)(v25 + swift_weakDestroy(v0 + 16) = 0;
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  LODWORD(v26) = a1 & 1;
  uint64_t v27 = type metadata accessor for Logger(0LL);
  v107 = (uint64_t (*)(char *, uint64_t))sub_100004558(v27, (uint64_t)qword_1000327A8);
  BOOL v28 = (os_log_s *)Logger.logObject.getter(v107);
  os_log_type_t v29 = static os_log_type_t.info.getter();
  BOOL v30 = os_log_type_enabled(v28, v29);
  int v106 = v26;
  if (v30)
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v32 = (void **)swift_slowAlloc(32LL, -1LL);
    __int128 aBlock = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    if (v106) {
      uint64_t v33 = 0x656C756465686353LL;
    }
    else {
      uint64_t v33 = 0x6E616D6544206E4FLL;
    }
    *(void *)&__int128 v116 = sub_10001BAA4(v33, 0xE900000000000064LL, (uint64_t *)&aBlock);
    LODWORD(v26) = v106;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, (char *)&v116 + 8);
    swift_bridgeObjectRelease(0xE900000000000064LL);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Starting %s Apple ID Availability activities.", v31, 0xCu);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v34 = v105[2];
  uint64_t v35 = *(void *)(v34 + 16);
  if (v35)
  {
    uint64_t v36 = v34 + 32;
    uint64_t v37 = 0x656C756465686353LL;
    if (!(_DWORD)v26) {
      uint64_t v37 = 0x6E616D6544206E4FLL;
    }
    v105 = (void *)v37;
    uint64_t v86 = v34;
    __n128 v38 = swift_bridgeObjectRetain(v34);
    v38.n128_u64[0] = 136315394LL;
    __n128 v104 = v38;
    v103 = (char *)&type metadata for Any + 8;
    do
    {
      sub_100010F9C(v36, (uint64_t)&aBlock);
      dispatch_group_enter(v18);
      uint64_t v43 = sub_100010F9C((uint64_t)&aBlock, (uint64_t)&v116);
      uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
      os_log_type_t v45 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v26 = swift_slowAlloc(22LL, -1LL);
        uint64_t v46 = swift_slowAlloc(64LL, -1LL);
        uint64_t v109 = v46;
        *(_DWORD *)uint64_t v26 = v104.n128_u32[0];
        *(void *)(v26 + 4) = sub_10001BAA4((uint64_t)v105, 0xE900000000000064LL, &v109);
        swift_bridgeObjectRelease(0xE900000000000064LL);
        *(_WORD *)(v26 + 12) = 2080;
        uint64_t v47 = v117;
        uint64_t v48 = sub_100005B7C(&v116, v117);
        uint64_t DynamicType = swift_getDynamicType(v48, v47, 1LL);
        uint64_t v50 = _typeName(_:qualified:)(DynamicType, 0LL);
        unint64_t v52 = v51;
        *(void *)(v26 + 14) = sub_10001BAA4(v50, v51, &v109);
        swift_bridgeObjectRelease(v52);
        sub_100004538(&v116);
        _os_log_impl( (void *)&_mh_execute_header,  v44,  v45,  "Starting %s Apple ID Availability activity - %s",  (uint8_t *)v26,  0x16u);
        swift_arrayDestroy(v46, 2LL, v103);
        swift_slowDealloc(v46, -1LL, -1LL);
        uint64_t v53 = v26;
        LOBYTE(v26) = v106;
        swift_slowDealloc(v53, -1LL, -1LL);
      }

      else
      {
        sub_100004538(&v116);
      }

      sub_100005B7C(&aBlock, (uint64_t)v113);
      sub_100010F9C((uint64_t)&aBlock, (uint64_t)&v116);
      uint64_t v39 = swift_allocObject(&unk_100029C20, 96LL, 7LL);
      *(_BYTE *)(v39 + swift_weakDestroy(v0 + 16) = v26;
      sub_100011024(&v116, v39 + 24);
      uint64_t v40 = v108;
      *(void *)(v39 + 64) = v24;
      *(void *)(v39 + 72) = v40;
      *(void *)(v39 + 80) = v25;
      *(void *)(v39 + 88) = v18;
      id v41 = v24;
      swift_retain(v40);
      swift_retain(v25);
      os_log_type_t v42 = v18;
      sub_10001C1B0((uint64_t)sub_10001103C, v39);
      swift_release(v39);
      sub_100004538(&aBlock);
      v36 += 40LL;
      --v35;
    }

    while (v35);
    swift_bridgeObjectRelease(v86);
  }

  if ([(id)objc_opt_self(AAFDeviceInfo) deviceIsAudioAccessory])
  {
    uint64_t v54 = v87;
    static DispatchTime.now()();
    uint64_t v55 = v89;
    + infix(_:_:)(v54, 600.0);
    v107 = *(uint64_t (**)(char *, uint64_t))(v88 + 8);
    uint64_t v56 = v107(v54, v90);
    v105 = (void *)static OS_dispatch_queue.main.getter(v56);
    v114 = sub_10000F73C;
    uint64_t v115 = 0LL;
    __int128 aBlock = _NSConcreteStackBlock;
    uint64_t v111 = 1107296256LL;
    v112 = sub_10000C1A4;
    v113 = &unk_100029C88;
    uint64_t v57 = _Block_copy(&aBlock);
    uint64_t v26 = (uint64_t)v97;
    static DispatchQoS.unspecified.getter(v57);
    __int128 aBlock = (void **)&_swiftEmptyArrayStorage;
    uint64_t v58 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v59 = sub_100005110(&qword_10002F790);
    uint64_t v60 = sub_1000110B8((unint64_t *)&qword_10002F798, &qword_10002F790);
    uint64_t v61 = v100;
    uint64_t v62 = v59;
    uint64_t v63 = v102;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v62, v60, v102, v58);
    uint64_t v64 = v105;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v55, v26, v61, v57);
    _Block_release(v57);

    (*(void (**)(char *, uint64_t))(v101 + 8))(v61, v63);
    uint64_t v65 = v26;
    LOBYTE(v26) = v106;
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v65, v99);
    v107(v55, v90);
  }

  uint64_t v66 = v92;
  uint64_t v67 = v91;
  uint64_t v68 = v93;
  (*(void (**)(char *, void, uint64_t))(v92 + 104))( v91,  enum case for DispatchQoS.QoSClass.default(_:),  v93);
  v107 = (uint64_t (*)(char *, uint64_t))static OS_dispatch_queue.global(qos:)(v67);
  (*(void (**)(char *, uint64_t))(v66 + 8))(v67, v68);
  uint64_t v69 = swift_allocObject(&unk_100029C48, 64LL, 7LL);
  *(void *)(v69 + swift_weakDestroy(v0 + 16) = v24;
  *(_BYTE *)(v69 + 24) = v26;
  uint64_t v70 = v108;
  uint64_t v71 = v94;
  *(void *)(v69 + 32) = v108;
  *(void *)(v69 + 40) = v71;
  uint64_t v72 = v95;
  *(void *)(v69 + 48) = v95;
  *(void *)(v69 + 56) = v25;
  v114 = sub_10001108C;
  uint64_t v115 = v69;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v111 = 1107296256LL;
  v112 = sub_10000C1A4;
  v113 = &unk_100029C60;
  uint64_t v73 = _Block_copy(&aBlock);
  id v74 = v24;
  swift_retain(v70);
  swift_retain(v25);
  uint64_t v75 = swift_retain(v72);
  uint64_t v76 = v97;
  static DispatchQoS.unspecified.getter(v75);
  *(void *)&__int128 v116 = &_swiftEmptyArrayStorage;
  uint64_t v77 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v78 = sub_100005110(&qword_10002F790);
  uint64_t v79 = sub_1000110B8((unint64_t *)&qword_10002F798, &qword_10002F790);
  v80 = v100;
  uint64_t v81 = v78;
  uint64_t v82 = v102;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v116, v81, v79, v102, v77);
  v83 = v107;
  OS_dispatch_group.notify(qos:flags:queue:execute:)(v76, v80, v107, v73);
  _Block_release(v73);

  (*(void (**)(char *, uint64_t))(v101 + 8))(v80, v82);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v76, v99);
  uint64_t v84 = v115;
  swift_release(v70);
  swift_release(v25);
  return swift_release(v84);
}

uint64_t sub_100010F68()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100010F8C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100010F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010FE0()
{
  swift_release(*(void *)(v0 + 72));
  swift_release(*(void *)(v0 + 80));

  return swift_deallocObject(v0, 96LL, 7LL);
}

uint64_t sub_100011024(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + swift_weakDestroy(v0 + 16) = v3;
  return a2;
}

void sub_10001103C(uint64_t a1)
{
}

uint64_t sub_100011050()
{
  swift_release(*(void *)(v0 + 32));
  swift_release(*(void *)(v0 + 48));
  swift_release(*(void *)(v0 + 56));
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_10001108C()
{
  return sub_10000F808( *(void *)(v0 + 16),  *(_BYTE *)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(void *)(v0 + 48),  *(void *)(v0 + 56));
}

uint64_t sub_1000110A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000110B0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000110B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v4 = sub_100005B00(a2);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_1000110F8()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10001112C()
{
  return sub_10000FA14( *(_BYTE *)(v0 + 16),  *(void *)(v0 + 24),  *(void (**)(uint64_t, uint64_t))(v0 + 32),  *(void *)(v0 + 40),  *(void *)(v0 + 48));
}

uint64_t sub_10001113C()
{
  return swift_deallocObject(v0, 96LL, 7LL);
}

uint64_t sub_100011180()
{
  return sub_10000F5C0(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_100011194(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v41 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  for (int64_t i = 0LL; ; int64_t i = v46)
  {
    if (v7)
    {
      uint64_t v45 = (v7 - 1) & v7;
      int64_t v46 = i;
      unint64_t v11 = __clz(__rbit64(v7)) | (i << 6);
    }

    else
    {
      int64_t v12 = i + 1;
      if (__OFADD__(i, 1LL)) {
        goto LABEL_38;
      }
      if (v12 >= v41) {
        return swift_release(a1);
      }
      unint64_t v13 = *(void *)(v40 + 8 * v12);
      int64_t v14 = i + 1;
      if (!v13)
      {
        int64_t v14 = i + 2;
        if (i + 2 >= v41) {
          return swift_release(a1);
        }
        unint64_t v13 = *(void *)(v40 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = i + 3;
          if (i + 3 >= v41) {
            return swift_release(a1);
          }
          unint64_t v13 = *(void *)(v40 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = i + 4;
            if (i + 4 >= v41) {
              return swift_release(a1);
            }
            unint64_t v13 = *(void *)(v40 + 8 * v14);
            if (!v13)
            {
              uint64_t v15 = i + 5;
              if (i + 5 >= v41) {
                return swift_release(a1);
              }
              unint64_t v13 = *(void *)(v40 + 8 * v15);
              if (!v13)
              {
                while (1)
                {
                  int64_t v14 = v15 + 1;
                  if (__OFADD__(v15, 1LL)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v41) {
                    return swift_release(a1);
                  }
                  unint64_t v13 = *(void *)(v40 + 8 * v14);
                  ++v15;
                  if (v13) {
                    goto LABEL_23;
                  }
                }
              }

              int64_t v14 = i + 5;
            }
          }
        }
      }

LABEL_23:
      uint64_t v45 = (v13 - 1) & v13;
      int64_t v46 = v14;
      unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    }

    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v17 = *v16;
    uint64_t v18 = (void *)v16[1];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    uint64_t v47 = a3;
    uint64_t v48 = a4;
    swift_bridgeObjectRetain(v18);
    swift_errorRetain(v19);
    swift_bridgeObjectRetain(a4);
    v20._countAndFlagsBits = 58LL;
    v20._object = (void *)0xE100000000000000LL;
    String.append(_:)(v20);
    v21._countAndFlagsBits = v17;
    v21._object = v18;
    String.append(_:)(v21);
    uint64_t v22 = v47;
    uint64_t v23 = v48;
    swift_beginAccess(a2, &v47, 33LL, 0LL);
    swift_errorRetain(v19);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a2);
    uint64_t v49 = (void *)*a2;
    uint64_t v25 = v49;
    *a2 = 0x8000000000000000LL;
    unint64_t v27 = sub_10001CF20(v22, v23);
    uint64_t v28 = v25[2];
    BOOL v29 = (v26 & 1) == 0;
    uint64_t v30 = v28 + v29;
    if (__OFADD__(v28, v29)) {
      break;
    }
    char v31 = v26;
    if (v25[3] >= v30)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v34 = v49;
        if ((v26 & 1) != 0) {
          goto LABEL_4;
        }
      }

      else
      {
        sub_1000102D8();
        uint64_t v34 = v49;
        if ((v31 & 1) != 0) {
          goto LABEL_4;
        }
      }
    }

    else
    {
      sub_10000FE68(v30, isUniquelyReferenced_nonNull_native);
      unint64_t v32 = sub_10001CF20(v22, v23);
      if ((v31 & 1) != (v33 & 1)) {
        goto LABEL_40;
      }
      unint64_t v27 = v32;
      uint64_t v34 = v49;
      if ((v31 & 1) != 0)
      {
LABEL_4:
        uint64_t v9 = v34[7];
        swift_errorRelease(*(void *)(v9 + 8 * v27));
        *(void *)(v9 + 8 * v2sub_100004538(v0 + 7) = v19;
        goto LABEL_5;
      }
    }

    v34[(v27 >> 6) + 8] |= 1LL << v27;
    uint64_t v35 = (uint64_t *)(v34[6] + 16 * v27);
    *uint64_t v35 = v22;
    v35[1] = v23;
    *(void *)(v34[7] + 8 * v2sub_100004538(v0 + 7) = v19;
    uint64_t v36 = v34[2];
    BOOL v37 = __OFADD__(v36, 1LL);
    uint64_t v38 = v36 + 1;
    if (v37) {
      goto LABEL_37;
    }
    v34[2] = v38;
    swift_bridgeObjectRetain(v23);
LABEL_5:
    uint64_t v10 = *a2;
    *a2 = v34;
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v10);
    swift_endAccess(&v47);
    swift_bridgeObjectRelease(v18);
    swift_errorRelease(v19);
    unint64_t v7 = v45;
  }

  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100011514()
{
  uint64_t v0 = type metadata accessor for URLConfigurationManager();
  swift_allocObject(v0, 64LL, 7LL);
  uint64_t result = sub_10001154C();
  qword_1000327C0 = result;
  return result;
}

uint64_t sub_10001154C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000A9AC();
  *(_OWORD *)(v1 + swift_weakDestroy(v0 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(void *)(v1 + 48) = 0LL;
  uint64_t v12 = (*(uint64_t (**)(char *, void, uint64_t))(v9 + 104))( v11,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v8);
  static DispatchQoS.unspecified.getter(v12);
  uint64_t v18 = &_swiftEmptyArrayStorage;
  uint64_t v13 = sub_100004604( &qword_10002F7B0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v14 = sub_100005110(&qword_10002F7B8);
  uint64_t v15 = sub_1000110B8((unint64_t *)&qword_10002F7C0, &qword_10002F7B8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v18, v14, v15, v2, v13);
  *(void *)(v1 + 56) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000030LL,  0x800000010001F5D0LL,  v7,  v4,  v11,  0LL);
  return v1;
}

uint64_t sub_100011718@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005110(&qword_100030680);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = objc_allocWithZone(&OBJC_CLASS___NSURLComponents);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithString:v6];

  if (v7)
  {
    id v8 = v7;
    NSString v9 = String._bridgeToObjectiveC()();
    [v8 setPath:v9];

    id v10 = v8;
    NSString v11 = String._bridgeToObjectiveC()();
    [v10 setQuery:v11];

    id v12 = [v10 URL];
    if (v12)
    {
      uint64_t v13 = v12;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v14 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v4, 0LL, 1LL, v14);
    }

    else
    {

      uint64_t v17 = type metadata accessor for URL(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v4, 1LL, 1LL, v17);
    }

    return sub_1000131F0((uint64_t)v4, a1);
  }

  else
  {
    uint64_t v15 = type metadata accessor for URL(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))( a1,  1LL,  1LL,  v15);
  }

uint64_t sub_100011914(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = *(void *)(v2 + 56);
  uint64_t v13 = (void *)swift_allocObject(&unk_100029D78, 40LL, 7LL);
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_100012CCC;
  uint64_t v23 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000C1A4;
  aBlock[3] = &unk_100029D90;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain(v2);
  uint64_t v15 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v15);
  Swift::String v21 = &_swiftEmptyArrayStorage;
  uint64_t v16 = sub_100004604( (unint64_t *)&qword_10002F788,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_100005110(&qword_10002F790);
  uint64_t v18 = sub_1000110B8((unint64_t *)&qword_10002F798, &qword_10002F790);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v17, v18, v5, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release(v23);
}

void sub_100011B0C(uint64_t a1, void (*a2)(void *, void, void), uint64_t a3)
{
  id v6 = sub_100011C78();
  if (v6)
  {
    uint64_t v7 = v6;
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v8 = type metadata accessor for Logger(0LL);
    uint64_t v9 = sub_100004558(v8, (uint64_t)qword_100032790);
    uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
    os_log_type_t v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "cachedURLConfiguration is present", v12, 2u);
      swift_slowDealloc(v12, -1LL, -1LL);
    }

    id v13 = v7;
    a2(v7, 0LL, 0LL);
  }

  else
  {
    dispatch_suspend(*(dispatch_object_t *)(a1 + 56));
    swift_retain(a1);
    swift_retain(a3);
    sub_100012CF0(a1, a1, (uint64_t (*)(void, void, void))a2, a3);
    swift_release(a1);
    swift_release(a3);
  }

id sub_100011C78()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v41 - v7;
  uint64_t v9 = (void *)(v1 + 16);
  swift_beginAccess(v1 + 16, v47, 0LL, 0LL);
  sub_10001333C(v1 + 16, (uint64_t)&v44, &qword_10002FCF0);
  if (*((void *)&v45 + 1))
  {
    uint64_t v10 = sub_100011024(&v44, (uint64_t)&v48);
    static Date.now.getter(v10);
    os_log_type_t v11 = sub_100005B7C(&v48, v49[2]);
    (*(void (**)(char *, void *, uint64_t))(v3 + 16))(v6, v11, v2);
    double v12 = Date.timeIntervalSince(_:)(v6);
    id v13 = *(void (**)(char *, uint64_t))(v3 + 8);
    v13(v6, v2);
    v13(v8, v2);
    if (v12 > 600.0)
    {
      uint64_t v46 = 0LL;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      swift_beginAccess(v1 + 16, v43, 33LL, 0LL);
      sub_1000132B0((uint64_t)&v44, v1 + 16);
      swift_endAccess(v43);
    }

    sub_100004538(&v48);
  }

  else
  {
    sub_100013274((uint64_t)&v44, &qword_10002FCF0);
  }

  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  sub_100004558(v14, (uint64_t)qword_100032790);
  uint64_t v15 = swift_retain_n(v1, 2LL);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  LODWORD(v1sub_100004538(v0 + 7) = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, (os_log_type_t)v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v19 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v18 = 138412290;
    uint64_t v20 = *(void *)(v1 + 40);
    if (v20)
    {
      Swift::String v21 = sub_100005B7C((void *)(v1 + 16), *(void *)(v1 + 40));
      v41[1] = v41;
      uint64_t v22 = *(void *)(v20 - 8);
      __chkstk_darwin(v21);
      int64_t v24 = (char *)v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      (*(void (**)(char *))(v22 + 16))(v24);
      uint64_t v25 = *(void **)&v24[*(int *)(type metadata accessor for URLConfigurationCache(0LL) + 20)];
      int v42 = (int)v17;
      uint64_t v17 = v18;
      uint64_t v26 = v1;
      unint64_t v27 = v19;
      uint64_t v28 = v9;
      BOOL v29 = *(void (**)(char *, uint64_t))(v22 + 8);
      id v30 = v25;
      v29(v24, v20);
      uint64_t v9 = v28;
      uint64_t v19 = v27;
      uint64_t v1 = v26;
      uint64_t v18 = v17;
      LOBYTE(v1sub_100004538(v0 + 7) = v42;
      id v48 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, v49);
    }

    else
    {
      id v48 = 0LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, v49);
      id v30 = 0LL;
    }

    *uint64_t v19 = v30;
    swift_release_n(v1, 2LL);
    _os_log_impl( (void *)&_mh_execute_header,  v16,  (os_log_type_t)v17,  "[URLConfigurationManager cachedURLConfiguration]: %@",  v18,  0xCu);
    uint64_t v39 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v19, 1LL, v39);
    swift_slowDealloc(v19, -1LL, -1LL);
    swift_slowDealloc(v18, -1LL, -1LL);

    uint64_t v31 = *(void *)(v1 + 40);
    if (!v31) {
      return 0LL;
    }
  }

  else
  {

    swift_release_n(v1, 2LL);
    uint64_t v31 = *(void *)(v1 + 40);
    if (!v31) {
      return 0LL;
    }
  }

  unint64_t v32 = sub_100005B7C(v9, v31);
  uint64_t v33 = *(void *)(v31 - 8);
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)v41 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v33 + 16))(v35);
  uint64_t v36 = type metadata accessor for URLConfigurationCache(0LL);
  BOOL v37 = *(void (**)(char *, uint64_t))(v33 + 8);
  id v38 = *(id *)&v35[*(int *)(v36 + 20)];
  v37(v35, v31);
  return v38;
}

uint64_t sub_1000120EC( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void))
{
  if (a1 && a2)
  {
    uint64_t v10 = qword_10002ED68;
    id v11 = a1;
    id v12 = a2;
    if (v10 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    uint64_t v14 = sub_100004558(v13, (uint64_t)qword_100032790);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = a5;
      uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Successfully fetched URL configuration", v18, 2u);
      uint64_t v19 = v18;
      a5 = v17;
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    if (qword_10002ED78 != -1) {
      swift_once(&qword_10002ED78, sub_100011514);
    }
    sub_100012438(v11, v12);
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    sub_100004558(v20, (uint64_t)qword_100032790);
    swift_errorRetain(a3);
    uint64_t v21 = swift_errorRetain(a3);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      BOOL v29 = a5;
      int64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)int64_t v24 = 138412290;
      if (a3)
      {
        swift_errorRetain(a3);
        uint64_t v26 = _swift_stdlib_bridgeErrorToNSError(a3);
        uint64_t v30 = v26;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
      }

      else
      {
        uint64_t v30 = 0LL;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31);
        uint64_t v26 = 0LL;
      }

      *uint64_t v25 = v26;
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to fetch URL configuration, error: %@", v24, 0xCu);
      uint64_t v27 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v25, 1LL, v27);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      a5 = v29;
    }

    else
    {
      swift_errorRelease(a3);
      swift_errorRelease(a3);
    }
  }

  dispatch_resume(*(dispatch_object_t *)(a4 + 56));
  return a5(a1, a2, a3);
}

uint64_t sub_100012438(void *a1, void *a2)
{
  uint64_t v5 = sub_100005110(&qword_10002FD00);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URLConfigurationCache(0LL);
  v18[3] = v8;
  v18[4] = &off_10002A038;
  uint64_t v9 = sub_100013238(v18);
  id v10 = a1;
  id v11 = a2;
  Date.init()();
  *(void *)((char *)v9 + *(int *)(v8 + 20)) = v10;
  *(void *)((char *)v9 + *(int *)(v8 + sub_100004538((void *)(v0 + 24)) = v11;
  uint64_t v12 = sub_100005110(qword_10002FD08);
  int v13 = swift_dynamicCast(v7, v18, v12, v8, 6LL);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL);
  if (v13)
  {
    v14(v7, 0LL, 1LL, v8);
    *((void *)&v20 + 1) = v8;
    uint64_t v21 = &off_10002A038;
    uint64_t v15 = sub_100013238(&v19);
    sub_1000132F8((uint64_t)v7, (uint64_t)v15);
  }

  else
  {
    v14(v7, 1LL, 1LL, v8);
    sub_100013274((uint64_t)v7, &qword_10002FD00);
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v21 = 0LL;
  }

  swift_beginAccess(v2 + 16, v18, 33LL, 0LL);
  sub_1000132B0((uint64_t)&v19, v2 + 16);
  return swift_endAccess(v18);
}

void sub_1000125B8(uint64_t a1, uint64_t a2, void *a3, void (*a4)(id, uint64_t, id))
{
  if (*(void *)(a1 + 24))
  {
    sub_10001333C(a1, (uint64_t)&v42, &qword_10002F9B0);
    if (v43[2])
    {
      uint64_t v6 = sub_100005110(&qword_10002FCF8);
      if ((swift_dynamicCast(&v41, &v42, (char *)&type metadata for Any + 8, v6, 6LL) & 1) != 0)
      {
        uint64_t v7 = v41;
        id v8 = objc_allocWithZone(&OBJC_CLASS___AAURLConfiguration);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v7);
        id v10 = [v8 initWithDictionary:isa];

        if (qword_10002ED68 != -1) {
          swift_once(&qword_10002ED68, sub_10000B078);
        }
        uint64_t v11 = type metadata accessor for Logger(0LL);
        sub_100004558(v11, (uint64_t)qword_100032790);
        id v12 = v10;
        int v13 = (os_log_s *)Logger.logObject.getter(v12);
        os_log_type_t v14 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          os_log_type_t v16 = (void *)swift_slowAlloc(8LL, -1LL);
          *(_DWORD *)uint64_t v15 = 138412290;
          uint64_t v42 = (uint64_t)v12;
          id v17 = v12;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43);
          *os_log_type_t v16 = v12;

          _os_log_impl( (void *)&_mh_execute_header,  v13,  v14,  "[URLConfigurationManager fetchURLConfiguration]: %@",  v15,  0xCu);
          uint64_t v18 = sub_100005110(&qword_10002FAB0);
          swift_arrayDestroy(v16, 1LL, v18);
          swift_slowDealloc(v16, -1LL, -1LL);
          swift_slowDealloc(v15, -1LL, -1LL);
        }

        else
        {
        }

        id v33 = v12;
        a4(v12, a2, 0LL);

LABEL_31:
        return;
      }
    }

    else
    {
      sub_100013274((uint64_t)&v42, &qword_10002F9B0);
    }

    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    uint64_t v28 = sub_100004558(v27, (uint64_t)qword_100032790);
    BOOL v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  v30,  "[URLConfigurationManager fetchURLConfiguration]: Failed to convert object to dictionary.",  v31,  2u);
      swift_slowDealloc(v31, -1LL, -1LL);
    }

    if (a3) {
      unint64_t v32 = (void *)_convertErrorToNSError(_:)(a3);
    }
    else {
      unint64_t v32 = 0LL;
    }
    id v33 = objc_msgSend((id)objc_opt_self(NSError), "aa_errorWithCode:underlyingError:", -4402, v32);

    a4(0LL, a2, v33);
    goto LABEL_31;
  }

  if (a3)
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    sub_100004558(v19, (uint64_t)qword_100032790);
    swift_errorRetain(a3);
    uint64_t v20 = swift_errorRetain(a3);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      int64_t v24 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)os_log_type_t v23 = 138412290;
      swift_errorRetain(a3);
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError(a3);
      uint64_t v42 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, v43);
      *int64_t v24 = v25;
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[URLConfigurationManager fetchURLConfiguration]: %@",  v23,  0xCu);
      uint64_t v26 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v24, 1LL, v26);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    else
    {
      swift_errorRelease(a3);
      swift_errorRelease(a3);
    }

    a4(0LL, a2, a3);
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v34 = type metadata accessor for Logger(0LL);
    uint64_t v35 = sub_100004558(v34, (uint64_t)qword_100032790);
    uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
    os_log_type_t v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v38 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  v37,  "[URLConfigurationManager fetchURLConfiguration]: Both object and error are nil.",  v38,  2u);
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    id v39 = objc_msgSend((id)objc_opt_self(NSError), "aa_errorWithCode:underlyingError:", -4402, 0);
    a4(0LL, a2, v39);
  }

uint64_t sub_100012BC4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = *(void (**)(__int128 *, void *, void *))(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (a2)
  {
    *((void *)&v13 + 1) = swift_getObjectType(a2);
    *(void *)&__int128 v12 = a2;
  }

  else
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
  }

  swift_retain(v7);
  swift_unknownObjectRetain(a2);
  id v9 = a3;
  id v10 = a4;
  v8(&v12, a3, a4);

  swift_release(v7);
  return sub_100013274((uint64_t)&v12, &qword_10002F9B0);
}

uint64_t sub_100012C74()
{
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t type metadata accessor for URLConfigurationManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd23URLConfigurationManager);
}

void sub_100012CCC()
{
}

uint64_t sub_100012CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100012CE8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100012CF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, void, void), uint64_t a4)
{
  uint64_t v46 = a1;
  uint64_t v7 = type metadata accessor for URLRequest(0LL);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  __chkstk_darwin(v7);
  uint64_t v43 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100005110(&qword_100030680);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v41 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v42 = (char *)&v39 - v16;
  id v17 = (void *)swift_allocObject(&unk_100029DC8, 40LL, 7LL);
  v17[2] = a2;
  v17[3] = a3;
  v17[4] = a4;
  uint64_t v18 = qword_10002ED68;
  swift_retain(a2);
  swift_retain(a4);
  if (v18 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_100004558(v19, (uint64_t)qword_100032790);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v21, v22))
  {
    os_log_type_t v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v40 = a2;
    int64_t v24 = v23;
    *(_WORD *)os_log_type_t v23 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  v22,  "[URLConfigurationManager fetchURLConfiguration] called.",  v23,  2u);
    a2 = v40;
    swift_slowDealloc(v24, -1LL, -1LL);
  }

  sub_100011718((uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12) == 1)
  {
    uint64_t v25 = sub_100013274((uint64_t)v11, &qword_100030680);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "[URLConfigurationManager fetchURLConfiguration]: configurationURL is nil.",  v28,  2u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    id v29 = objc_msgSend((id)objc_opt_self(NSError), "aa_errorWithCode:underlyingError:", -4417, 0);
    sub_1000120EC(0LL, 0LL, (uint64_t)v29, a2, a3);
    swift_release(v17);
  }

  else
  {
    os_log_type_t v30 = v42;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v42, v11, v12);
    uint64_t v31 = v41;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v41, v30, v12);
    unint64_t v32 = v43;
    URLRequest.init(url:cachePolicy:timeoutInterval:)(v31, 0LL, 60.0);
    id v33 = [(id)objc_opt_self(AAURLSession) sharedSession];
    Class isa = URLRequest._bridgeToObjectiveC()().super.isa;
    uint64_t v35 = swift_allocObject(&unk_100029DF0, 32LL, 7LL);
    *(void *)(v35 + swift_weakDestroy(v0 + 16) = sub_1000131B8;
    *(void *)(v35 + 24) = v17;
    aBlock[4] = sub_1000131E8;
    uint64_t v48 = v35;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_100012BC4;
    aBlock[3] = &unk_100029E08;
    uint64_t v36 = _Block_copy(aBlock);
    uint64_t v37 = v48;
    swift_retain(v17);
    swift_release(v37);
    id v38 = [v33 bodyTaskWithRequest:isa completion:v36];
    _Block_release(v36);

    [v38 resume];
    swift_unknownObjectRelease(v38);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v45);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v30, v12);
    swift_release(v17);
  }

uint64_t sub_10001318C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000131B8(void *a1, void *a2, uint64_t a3)
{
  return sub_1000120EC(a1, a2, a3, *(void *)(v3 + 16), *(uint64_t (**)(void, void, void))(v3 + 24));
}

uint64_t sub_1000131C4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000131E8(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_1000131F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_100030680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_100013238(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_100013274(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005110(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_1000132B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_10002FCF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000132F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URLConfigurationCache(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001333C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005110(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001338C(uint64_t a1)
{
  v2[1] = &unk_1000217C0;
  v2[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  return swift_initClassMetadata2(a1, 0LL, 3LL, v2, a1 + 104);
}

uint64_t sub_1000133E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(int **)(a4 + 40);
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v9 + *v9);
  uint64_t v10 = (void *)swift_task_alloc(v9[1]);
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = v10;
  void *v10 = v4;
  v10[1] = sub_100005384;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_10001346C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[5] = a2;
  uint64_t v7 = *v3;
  v4[8] = *v3;
  uint64_t v8 = *(void *)(v7 + 88);
  v4[9] = v8;
  uint64_t v9 = sub_100005B00(&qword_10002FDF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255LL, v8, v9, "inner expiration ", 0LL);
  v4[10] = TupleTypeMetadata2;
  uint64_t v11 = type metadata accessor for Optional(0LL, TupleTypeMetadata2);
  v4[11] = swift_task_alloc((*(void *)(*(void *)(v11 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(v7 + 80);
  v4[12] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v4[13] = v13;
  uint64_t v14 = *(void *)(v13 + 64);
  v4[14] = v14;
  v4[15] = swift_task_alloc((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100005110(&qword_10002F2D8);
  v4[16] = swift_task_alloc((*(void *)(*(void *)(v15 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = (void *)swift_task_alloc(dword_10002FD9C);
  v4[17] = v16;
  *uint64_t v16 = v4;
  v16[1] = sub_100013588;
  return sub_100014A18(a1, a3);
}

uint64_t sub_100013588()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 136LL));
  return swift_task_switch(sub_1000135E0, v1, 0LL);
}

uint64_t sub_1000135E0()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v27 = v1;
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v21 = v2;
  uint64_t v22 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 64);
  uint64_t v9 = *(void *)(v0 + 48);
  uint64_t v24 = v9;
  uint64_t v25 = *(void *)(v0 + 88);
  uint64_t v26 = *(void *)(v0 + 40);
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v1, 1LL, 1LL, v10);
  os_log_type_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v23(v2, v9, v4);
  uint64_t v11 = *(void *)(v7 + 96);
  uint64_t v12 = type metadata accessor for ExpiringValueCache(255LL, v4, v6, v11);
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100021890, v12);
  uint64_t v14 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = (v14 + 64) & ~v14;
  uint64_t v16 = (char *)swift_allocObject(&unk_100029F20, v15 + v22, v14 | 7);
  *((void *)v16 + 2) = v8;
  *((void *)v16 + 3) = WitnessTable;
  *((void *)v16 + 4) = v4;
  *((void *)v16 + 5) = v6;
  *((void *)v16 + 6) = v11;
  *((void *)v16 + sub_100004538(v0 + 7) = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v16[v15], v21, v4);
  swift_retain_n(v8, 2LL);
  uint64_t v17 = sub_1000148EC(v27, (uint64_t)&unk_10002FE00, (uint64_t)v16);
  v23(v21, v24, v4);
  uint64_t v18 = *(int *)(v5 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v25, v26, v6);
  *(void *)(v25 + v18) = v17;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v25, 0LL, 1LL, v5);
  swift_beginAccess(v8 + 128, v0 + 16, 33LL, 0LL);
  uint64_t v19 = type metadata accessor for Dictionary(0LL, v4, v5, v11);
  swift_retain(v17);
  Dictionary.subscript.setter(v25, v21, v19);
  swift_endAccess(v0 + 16);
  swift_release(v17);
  swift_task_dealloc(v27);
  swift_task_dealloc(v21);
  swift_task_dealloc(v25);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000137F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  v5[8] = a4;
  void v5[9] = a5;
  uint64_t v7 = *a4;
  v5[10] = *a4;
  uint64_t v8 = *(void *)(v7 + 80);
  v5[11] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v5[12] = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v5[13] = swift_task_alloc(v10);
  v5[14] = swift_task_alloc(v10);
  v5[15] = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for CancellationError(0LL);
  v5[16] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v5[17] = v12;
  unint64_t v13 = (*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v5[18] = swift_task_alloc(v13);
  v5[19] = swift_task_alloc(v13);
  uint64_t v14 = *(void *)(v7 + 88);
  v5[20] = v14;
  uint64_t v15 = type metadata accessor for Optional(0LL, v14);
  v5[21] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v5[22] = v16;
  v5[23] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for ContinuousClock(0LL);
  v5[24] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v5[25] = v18;
  v5[26] = swift_task_alloc((*(void *)(v18 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100013914, a4, 0LL);
}

uint64_t sub_100013914()
{
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_10002FE08 + dword_10002FE08);
  uint64_t v1 = (void *)swift_task_alloc(unk_10002FE0C);
  *(void *)(v0 + 2swift_weakDestroy(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100013994;
  return v3(0x86AC351052600000LL, 32LL, 0LL, 0LL, 1);
}

uint64_t sub_100013994()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 216LL);
  *(void *)(*(void *)v1 + 224LL) = v0;
  swift_task_dealloc(v3);
  uint64_t v5 = v2[25];
  uint64_t v4 = v2[26];
  uint64_t v6 = v2[24];
  uint64_t v7 = v2[8];
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v0) {
    uint64_t v8 = sub_1000140AC;
  }
  else {
    uint64_t v8 = sub_100013A0C;
  }
  return swift_task_switch(v8, v7, 0LL);
}

uint64_t sub_100013A0C()
{
  uint64_t v1 = *(void *)(v0 + 224);
  static Task<>.checkCancellation()();
  if (!v1)
  {
    uint64_t v27 = *(void *)(v0 + 160);
    uint64_t v29 = *(void *)(v0 + 80);
    uint64_t v28 = *(void *)(v0 + 88);
    *(void *)(v0 + 56) = *(void *)(v0 + 64);
    os_log_type_t v30 = (void *)swift_task_alloc(dword_10002FE14);
    *(void *)(v0 + 232) = v30;
    uint64_t v31 = type metadata accessor for ExpiringValueCache(0LL, v28, v27, *(void *)(v29 + 96));
    uint64_t WitnessTable = swift_getWitnessTable(&unk_100021858, v31);
    uint64_t v33 = WitnessTable;
    uint64_t v34 = sub_1000146E4;
LABEL_16:
    *os_log_type_t v30 = v0;
    v30[1] = v34;
    uint64_t v69 = *(void *)(v0 + 184);
    uint64_t v70 = *(void *)(v0 + 72);
    uint64_t v71 = *(int **)(WitnessTable + 40);
    uint64_t v77 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v71 + *v71);
    uint64_t v72 = (void *)swift_task_alloc(v71[1]);
    v30[2] = v72;
    *uint64_t v72 = v30;
    v72[1] = sub_100005384;
    return v77(v69, v70, v31, v33);
  }

  *(void *)(v0 + 240) = v1;
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  *(void *)(v0 + swift_weakDestroy(v0 + 16) = v1;
  swift_errorRetain(v1);
  uint64_t v4 = sub_100005110(&qword_10002F9A0);
  if (!swift_dynamicCast(v2, v0 + 16, v4, v3, 0LL))
  {
    swift_errorRelease(*(void *)(v0 + 16));
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v36 = *(void *)(v0 + 96);
    uint64_t v35 = *(void *)(v0 + 104);
    uint64_t v37 = *(void *)(v0 + 88);
    uint64_t v38 = *(void *)(v0 + 72);
    uint64_t v39 = type metadata accessor for Logger(0LL);
    sub_100004558(v39, (uint64_t)qword_100032790);
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
    v40(v35, v38, v37);
    swift_errorRetain(v1);
    uint64_t v41 = swift_errorRetain(v1);
    uint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v45 = *(void *)(v0 + 104);
      uint64_t v44 = *(void *)(v0 + 112);
      uint64_t v46 = *(void *)(v0 + 88);
      uint64_t v73 = *(void *)(v0 + 96);
      uint64_t v47 = swift_slowAlloc(22LL, -1LL);
      id v74 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      uint64_t v76 = swift_slowAlloc(32LL, -1LL);
      v78[0] = v76;
      *(_DWORD *)uint64_t v47 = 136315394;
      v40(v44, v45, v46);
      uint64_t v48 = String.init<A>(describing:)(v44, v46);
      unint64_t v50 = v49;
      *(void *)(v0 + 32) = sub_10001BAA4(v48, v49, v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40);
      swift_bridgeObjectRelease(v50);
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v45, v46);
      *(_WORD *)(v47 + 12) = 2112;
      swift_errorRetain(v1);
      uint64_t v51 = _swift_stdlib_bridgeErrorToNSError(v1);
      *(void *)(v0 + 40) = v51;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48);
      *id v74 = v51;
      swift_errorRelease(v1);
      swift_errorRelease(v1);
      _os_log_impl( (void *)&_mh_execute_header,  v42,  v43,  "Expiration task failed for key (%s with error: %@)",  (uint8_t *)v47,  0x16u);
      uint64_t v52 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v74, 1LL, v52);
      swift_slowDealloc(v74, -1LL, -1LL);
      swift_arrayDestroy(v76, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v76, -1LL, -1LL);
      swift_slowDealloc(v47, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 96) + 8LL))(*(void *)(v0 + 104), *(void *)(v0 + 88));
      swift_errorRelease(v1);
      swift_errorRelease(v1);
    }

    uint64_t v66 = *(void *)(v0 + 160);
    uint64_t v68 = *(void *)(v0 + 80);
    uint64_t v67 = *(void *)(v0 + 88);
    *(void *)(v0 + 24) = *(void *)(v0 + 64);
    os_log_type_t v30 = (void *)swift_task_alloc(dword_10002FE14);
    *(void *)(v0 + 248) = v30;
    uint64_t v31 = type metadata accessor for ExpiringValueCache(0LL, v67, v66, *(void *)(v68 + 96));
    uint64_t WitnessTable = swift_getWitnessTable(&unk_100021858, v31);
    uint64_t v33 = WitnessTable;
    uint64_t v34 = sub_1000147E0;
    goto LABEL_16;
  }

  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 136);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v5, v6, v7);
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 96);
  uint64_t v12 = *(void *)(v0 + 72);
  uint64_t v13 = type metadata accessor for Logger(0LL);
  sub_100004558(v13, (uint64_t)qword_100032790);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  uint64_t v15 = v14(v9, v12, v10);
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v19 = *(void *)(v0 + 120);
  if (v18)
  {
    uint64_t v20 = *(void *)(v0 + 112);
    uint64_t v21 = *(void *)(v0 + 88);
    uint64_t v75 = *(void *)(v0 + 96);
    uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v23 = swift_slowAlloc(32LL, -1LL);
    v78[0] = v23;
    *(_DWORD *)uint64_t v22 = 136315138;
    v14(v20, v19, v21);
    uint64_t v24 = String.init<A>(describing:)(v20, v21);
    unint64_t v26 = v25;
    *(void *)(v0 + 48) = sub_10001BAA4(v24, v25, v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v19, v21);
    _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Expiration cancelled, skipping value removal for key: %s",  v22,  0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v22, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 96) + 8LL))(*(void *)(v0 + 120), *(void *)(v0 + 88));
  }

  uint64_t v54 = *(void *)(v0 + 136);
  uint64_t v53 = *(void *)(v0 + 144);
  uint64_t v55 = *(void *)(v0 + 128);
  uint64_t v56 = sub_100004604( &qword_10002FE18,  (uint64_t (*)(uint64_t))&type metadata accessor for CancellationError,  (uint64_t)&protocol conformance descriptor for CancellationError);
  swift_allocError(v55, v56, 0LL, 0LL);
  uint64_t v58 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 16))(v57, v53, v55);
  swift_willThrow(v58);
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
  swift_errorRelease(*(void *)(v0 + 16));
  uint64_t v59 = *(void *)(v0 + 184);
  uint64_t v61 = *(void *)(v0 + 144);
  uint64_t v60 = *(void *)(v0 + 152);
  uint64_t v63 = *(void *)(v0 + 112);
  uint64_t v62 = *(void *)(v0 + 120);
  uint64_t v64 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v59);
  swift_task_dealloc(v60);
  swift_task_dealloc(v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000140AC()
{
  uint64_t v1 = *(void *)(v0 + 224);
  *(void *)(v0 + swift_weakDestroy(v0 + 16) = v1;
  *(void *)(v0 + 240) = v1;
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  swift_errorRetain(v1);
  uint64_t v4 = sub_100005110(&qword_10002F9A0);
  if (swift_dynamicCast(v2, v0 + 16, v4, v3, 0LL))
  {
    uint64_t v5 = *(void *)(v0 + 144);
    uint64_t v6 = *(void *)(v0 + 152);
    uint64_t v7 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 136);
    swift_errorRelease(v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v5, v6, v7);
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v9 = *(void *)(v0 + 120);
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v11 = *(void *)(v0 + 96);
    uint64_t v12 = *(void *)(v0 + 72);
    uint64_t v13 = type metadata accessor for Logger(0LL);
    sub_100004558(v13, (uint64_t)qword_100032790);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    uint64_t v15 = v14(v9, v12, v10);
    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = *(void *)(v0 + 120);
    if (v18)
    {
      uint64_t v20 = *(void *)(v0 + 112);
      uint64_t v21 = *(void *)(v0 + 88);
      uint64_t v70 = *(void *)(v0 + 96);
      uint64_t v22 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v23 = swift_slowAlloc(32LL, -1LL);
      v73[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      v14(v20, v19, v21);
      uint64_t v24 = String.init<A>(describing:)(v20, v21);
      unint64_t v26 = v25;
      *(void *)(v0 + 48) = sub_10001BAA4(v24, v25, v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56);
      swift_bridgeObjectRelease(v26);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v19, v21);
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v17,  "Expiration cancelled, skipping value removal for key: %s",  v22,  0xCu);
      swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1LL, -1LL);
      swift_slowDealloc(v22, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 96) + 8LL))(*(void *)(v0 + 120), *(void *)(v0 + 88));
    }

    uint64_t v46 = *(void *)(v0 + 136);
    uint64_t v45 = *(void *)(v0 + 144);
    uint64_t v47 = *(void *)(v0 + 128);
    uint64_t v48 = sub_100004604( &qword_10002FE18,  (uint64_t (*)(uint64_t))&type metadata accessor for CancellationError,  (uint64_t)&protocol conformance descriptor for CancellationError);
    swift_allocError(v47, v48, 0LL, 0LL);
    uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v49, v45, v47);
    swift_willThrow(v50);
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
    swift_errorRelease(*(void *)(v0 + 16));
    uint64_t v51 = *(void *)(v0 + 184);
    uint64_t v53 = *(void *)(v0 + 144);
    uint64_t v52 = *(void *)(v0 + 152);
    uint64_t v55 = *(void *)(v0 + 112);
    uint64_t v54 = *(void *)(v0 + 120);
    uint64_t v56 = *(void *)(v0 + 104);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    swift_task_dealloc(v53);
    swift_task_dealloc(v54);
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    swift_errorRelease(*(void *)(v0 + 16));
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v28 = *(void *)(v0 + 96);
    uint64_t v27 = *(void *)(v0 + 104);
    uint64_t v29 = *(void *)(v0 + 88);
    uint64_t v30 = *(void *)(v0 + 72);
    uint64_t v31 = type metadata accessor for Logger(0LL);
    sub_100004558(v31, (uint64_t)qword_100032790);
    unint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
    v32(v27, v30, v29);
    swift_errorRetain(v1);
    uint64_t v33 = swift_errorRetain(v1);
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v37 = *(void *)(v0 + 104);
      uint64_t v36 = *(void *)(v0 + 112);
      uint64_t v38 = *(void *)(v0 + 88);
      uint64_t v68 = *(void *)(v0 + 96);
      uint64_t v39 = swift_slowAlloc(22LL, -1LL);
      uint64_t v69 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      uint64_t v71 = swift_slowAlloc(32LL, -1LL);
      v73[0] = v71;
      *(_DWORD *)uint64_t v39 = 136315394;
      v32(v36, v37, v38);
      uint64_t v40 = String.init<A>(describing:)(v36, v38);
      unint64_t v42 = v41;
      *(void *)(v0 + 32) = sub_10001BAA4(v40, v41, v73);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40);
      swift_bridgeObjectRelease(v42);
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v37, v38);
      *(_WORD *)(v39 + 12) = 2112;
      swift_errorRetain(v1);
      uint64_t v43 = _swift_stdlib_bridgeErrorToNSError(v1);
      *(void *)(v0 + 40) = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48);
      *uint64_t v69 = v43;
      swift_errorRelease(v1);
      swift_errorRelease(v1);
      _os_log_impl( (void *)&_mh_execute_header,  v34,  v35,  "Expiration task failed for key (%s with error: %@)",  (uint8_t *)v39,  0x16u);
      uint64_t v44 = sub_100005110(&qword_10002FAB0);
      swift_arrayDestroy(v69, 1LL, v44);
      swift_slowDealloc(v69, -1LL, -1LL);
      swift_arrayDestroy(v71, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v71, -1LL, -1LL);
      swift_slowDealloc(v39, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 96) + 8LL))(*(void *)(v0 + 104), *(void *)(v0 + 88));
      swift_errorRelease(v1);
      swift_errorRelease(v1);
    }

    uint64_t v58 = *(void *)(v0 + 160);
    uint64_t v60 = *(void *)(v0 + 80);
    uint64_t v59 = *(void *)(v0 + 88);
    *(void *)(v0 + 24) = *(void *)(v0 + 64);
    uint64_t v61 = (void *)swift_task_alloc(dword_10002FE14);
    *(void *)(v0 + 248) = v61;
    uint64_t v62 = type metadata accessor for ExpiringValueCache(0LL, v59, v58, *(void *)(v60 + 96));
    uint64_t WitnessTable = swift_getWitnessTable(&unk_100021858, v62);
    *uint64_t v61 = v0;
    v61[1] = sub_1000147E0;
    uint64_t v64 = *(void *)(v0 + 184);
    uint64_t v65 = *(void *)(v0 + 72);
    uint64_t v66 = *(int **)(WitnessTable + 40);
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v66 + *v66);
    uint64_t v67 = (void *)swift_task_alloc(v66[1]);
    v61[2] = v67;
    *uint64_t v67 = v61;
    v67[1] = sub_100005384;
    return v72(v64, v65, v62, WitnessTable);
  }

uint64_t sub_1000146E4()
{
  uint64_t v2 = *(void *)(*(void *)v0 + 176LL);
  uint64_t v1 = *(void *)(*(void *)v0 + 184LL);
  uint64_t v3 = *(void *)(*(void *)v0 + 168LL);
  uint64_t v4 = *(void *)(*(void *)v0 + 64LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 232LL));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch(sub_10001475C, v4, 0LL);
}

uint64_t sub_10001475C()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000147E0()
{
  uint64_t v2 = *(void *)(*(void *)v0 + 176LL);
  uint64_t v1 = *(void *)(*(void *)v0 + 184LL);
  uint64_t v3 = *(void *)(*(void *)v0 + 168LL);
  uint64_t v4 = *(void *)(*(void *)v0 + 64LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 248LL));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch(sub_100014858, v4, 0LL);
}

uint64_t sub_100014858()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 104);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000148EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100005240(a1);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (!v10)
    {
LABEL_6:
      uint64_t v16 = 0LL;
      return swift_task_create(v9, v16, (char *)&type metadata for () + 8, a2, a3);
    }
  }

  else
  {
    unsigned __int8 v17 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v17 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (!v10) {
      goto LABEL_6;
    }
  }

  uint64_t v11 = *(void *)(a3 + 24);
  uint64_t ObjectType = swift_getObjectType(v10);
  swift_unknownObjectRetain(v10);
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
  uint64_t v15 = v14;
  swift_unknownObjectRelease(v10);
  if (!(v15 | v13)) {
    goto LABEL_6;
  }
  v19[0] = 0LL;
  v19[1] = 0LL;
  uint64_t v16 = v19;
  v19[2] = v13;
  v19[3] = v15;
  return swift_task_create(v9, v16, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_100014A18(uint64_t a1, uint64_t a2)
{
  void v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v4 = *v2;
  v3[11] = *v2;
  uint64_t v5 = *(void *)(v4 + 80);
  v3[12] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[13] = v6;
  v3[14] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *(void *)(v4 + 88);
  v3[15] = v7;
  uint64_t v8 = sub_100005B00(&qword_10002FDF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255LL, v7, v8, "inner expiration ", 0LL);
  v3[16] = TupleTypeMetadata2;
  uint64_t v10 = type metadata accessor for Optional(0LL, TupleTypeMetadata2);
  v3[17] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[18] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[19] = swift_task_alloc(v12);
  v3[20] = swift_task_alloc(v12);
  v3[21] = swift_task_alloc(v12);
  v3[22] = swift_task_alloc(v12);
  return swift_task_switch(sub_100014B08, v2, 0LL);
}

uint64_t sub_100014B08()
{
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v0 + 88);
  uint64_t v7 = *(void *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v39 = (void *)(*(void *)(v0 + 80) + 128LL);
  uint64_t v40 = v0 + 40;
  swift_beginAccess(v39, v0 + 16, 0LL, 0LL);
  uint64_t v9 = *v39;
  uint64_t v10 = *(void *)(v6 + 96);
  __n128 v11 = swift_bridgeObjectRetain(*v39);
  Dictionary.subscript.getter(v8, v9, v7, v5, v10, v11);
  swift_bridgeObjectRelease(v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  uint64_t v12 = *(void *)(v5 - 8);
  uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  int v13 = v38(v2, 1LL, v5);
  uint64_t v14 = *(void *)(v0 + 168);
  if (v13 == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 144) + 8LL))(*(void *)(v0 + 168), *(void *)(v0 + 136));
  }

  else
  {
    uint64_t v15 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v14 + *(int *)(*(void *)(v0 + 128) + 48LL));
    sub_100005110(&qword_10002F9A0);
    Task.cancel()();
    swift_release(v16);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8LL))(v14, v15);
  }

  uint64_t v37 = *(void *)(v0 + 176);
  uint64_t v17 = *(void *)(v0 + 152);
  uint64_t v18 = *(void *)(v0 + 160);
  uint64_t v20 = *(void *)(v0 + 136);
  uint64_t v19 = *(void *)(v0 + 144);
  uint64_t v21 = *(void *)(v0 + 128);
  uint64_t v22 = *(void *)(v0 + 112);
  uint64_t v23 = *(void *)(v0 + 96);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 104) + 16LL))(v22, *(void *)(v0 + 72), v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v18, 1LL, 1LL, v21);
  swift_beginAccess(v39, v40, 33LL, 0LL);
  uint64_t v24 = type metadata accessor for Dictionary(0LL, v23, v21, v10);
  Dictionary.subscript.setter(v18, v22, v24);
  swift_endAccess(v40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v17, v37, v20);
  int v25 = v38(v17, 1LL, v21);
  uint64_t v26 = *(void *)(v0 + 152);
  uint64_t v27 = *(void *)(v0 + 120);
  if (v25 == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 144) + 8LL))(*(void *)(v0 + 152), *(void *)(v0 + 136));
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = 1LL;
  }

  else
  {
    uint64_t v30 = *(void *)(v0 + 64);
    swift_release(*(void *)(v26 + *(int *)(*(void *)(v0 + 128) + 48LL)));
    uint64_t v28 = *(void *)(v27 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v30, v26, v27);
    uint64_t v29 = 0LL;
  }

  uint64_t v31 = *(void *)(v0 + 168);
  uint64_t v32 = *(void *)(v0 + 176);
  uint64_t v34 = *(void *)(v0 + 152);
  uint64_t v33 = *(void *)(v0 + 160);
  uint64_t v35 = *(void *)(v0 + 112);
  (*(void (**)(void, uint64_t, uint64_t, void))(v28 + 56))( *(void *)(v0 + 64),  v29,  1LL,  *(void *)(v0 + 120));
  swift_task_dealloc(v32);
  swift_task_dealloc(v31);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100014DAC()
{
  return v0;
}

uint64_t sub_100014DD0()
{
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for ExpiringValueCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10001539C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ExpiringValueCache);
}

unint64_t sub_100014E00(uint64_t a1)
{
  unint64_t result = sub_100014E24();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100014E24()
{
  unint64_t result = qword_10002FDA0;
  if (!qword_10002FDA0)
  {
    uint64_t v1 = sub_100005B00(&qword_100030200);
    unint64_t result = swift_getWitnessTable(&unk_100021874, v1);
    atomic_store(result, (unint64_t *)&qword_10002FDA0);
  }

  return result;
}

uint64_t sub_100014E70(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_100014E78()
{
  return v0;
}

uint64_t sub_100014E84()
{
  return sub_100014E78();
}

uint64_t sub_100014E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(dword_10002FD94);
  *(void *)(v3 + swift_weakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100005384;
  return sub_10001346C(a1, a2, a3);
}

uint64_t sub_100014F08(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc(dword_10002FD9C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000051F8;
  return sub_100014A18(a1, a2);
}

uint64_t sub_100014F6C(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_getWitnessTable(&unk_100021858, a2);
  *(void *)(a1 + 8) = result;
  return result;
}

double sub_100014F98()
{
  uint64_t v0 = sub_100005110(&qword_100030200);
  uint64_t v1 = swift_allocObject(v0, 136LL, 15LL);
  swift_defaultActor_initialize();
  *(void *)(v1 + 128) = sub_10001C708((uint64_t)&_swiftEmptyArrayStorage);
  double result = -1.59123824e-276;
  *(_OWORD *)(v1 + 112) = xmmword_100021720;
  qword_1000327C8 = v1;
  return result;
}

uint64_t sub_100014FF4()
{
  uint64_t v1 = *((void *)v0 + 4);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*((void *)v0 + 2));
  swift_release(*((void *)v0 + 7));
  (*(void (**)(char *, uint64_t))(v2 + 8))(&v0[v4], v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100015068(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(v1[4] - 8LL) + 80LL);
  uint64_t v6 = v1[2];
  uint64_t v7 = (uint64_t *)v1[7];
  uint64_t v8 = (uint64_t)v1 + ((v5 + 64) & ~v5);
  uint64_t v9 = (void *)swift_task_alloc(dword_10002FDFC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1000051F8;
  return sub_1000137F8(a1, v6, v4, v7, v8);
}

uint64_t sub_1000150F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = type metadata accessor for ContinuousClock.Instant(0LL);
  *(void *)(v6 + 64) = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  *(void *)(v6 + 72) = v13;
  unint64_t v14 = (*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v6 + 80) = swift_task_alloc(v14);
  *(void *)(v6 + 88) = swift_task_alloc(v14);
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + swift_weakDestroy(v0 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch(sub_10001519C, 0LL, 0LL);
}

uint64_t sub_10001519C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = type metadata accessor for ContinuousClock(0LL);
  uint64_t v5 = sub_100004604( &qword_10002FE20,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock,  (uint64_t)&protocol conformance descriptor for ContinuousClock);
  dispatch thunk of Clock.now.getter(v4, v5);
  uint64_t v6 = sub_100004604( &qword_10002FE28,  (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant,  (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)(v0 + 5, v2, v6);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v7;
  v7(v1, v2);
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
  v0[13] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1000152B4;
  return dispatch thunk of Clock.sleep(until:tolerance:)(v0[11], v0 + 2, v4, v5);
}

uint64_t sub_1000152B4()
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v2 = *(void *)(*v1 + 104);
  uint64_t v4 = *(void *)(*v1 + 88);
  uint64_t v5 = *(void *)(*v1 + 64);
  uint64_t v6 = *v1;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  v3(v4, v5);
  if (v0) {
    return swift_task_switch(sub_100015360, 0LL, 0LL);
  }
  uint64_t v8 = *(void *)(v6 + 80);
  swift_task_dealloc(*(void *)(v6 + 88));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_100015360()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_task_dealloc(*(void *)(v0 + 88));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001539C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  _OWORD v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t getEnumTagSinglePayload for AAFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for AAFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_1000154A4 + 4 * byte_1000218BD[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1000154D8 + 4 * byte_1000218B8[v4]))();
}

uint64_t sub_1000154D8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000154E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000154E8LL);
  }
  return result;
}

uint64_t sub_1000154F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000154FCLL);
  }
  *(_BYTE *)double result = a2 + 4;
  return result;
}

uint64_t sub_100015500(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100015508(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AAFeatureFlags()
{
  return &type metadata for AAFeatureFlags;
}

unint64_t sub_100015528()
{
  unint64_t result = qword_10002FE30;
  if (!qword_10002FE30)
  {
    unint64_t result = swift_getWitnessTable(&unk_100021924, &type metadata for AAFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_10002FE30);
  }

  return result;
}

const char *sub_10001556C()
{
  return "AppleAccount";
}

uint64_t sub_100015580()
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_1000155A8 + 4 * byte_1000218C2[*v0]))( "RunAppleAccountdOntvOS",  22LL);
}

const char *sub_1000155A8()
{
  return "OverrideAppleIDHealthCheckInterval";
}

const char *sub_1000155BC()
{
  return "DecoupleOTPeerID";
}

const char *sub_1000155D0()
{
  return "AABranding";
}

const char *sub_1000155E4()
{
  return "LegacyContactAutoHealing";
}

uint64_t *sub_1000155F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = type metadata accessor for Date(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    __n128 v11 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v11;
    id v12 = v10;
    id v13 = v11;
  }

  return a1;
}

void sub_100015690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
}

uint64_t sub_1000156E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + vsub_100004538(v0 + 7) = v9;
  uint64_t v10 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v10;
  id v11 = v9;
  id v12 = v10;
  return a1;
}

uint64_t sub_10001574C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + vsub_100004538(v0 + 7) = v8;
  id v10 = v8;

  uint64_t v11 = *(int *)(a3 + 24);
  id v12 = *(void **)(a2 + v11);
  id v13 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = v12;
  id v14 = v12;

  return a1;
}

uint64_t sub_1000157CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + vsub_100004538(v0 + 7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_100015830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + vsub_100004538(v0 + 7) = *(void *)(a2 + v7);

  uint64_t v9 = *(int *)(a3 + 24);
  id v10 = *(void **)(a1 + v9);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);

  return a1;
}

uint64_t sub_1000158A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000158B4);
}

uint64_t sub_1000158B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_100015930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001593C);
}

uint64_t sub_10001593C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for URLConfigurationCache(uint64_t a1)
{
  uint64_t result = qword_10002FE90;
  if (!qword_10002FE90) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for URLConfigurationCache);
  }
  return result;
}

uint64_t sub_1000159F0(uint64_t a1)
{
  uint64_t result = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    void v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t static OSTransaction.named(_:block:)(char *a1, uint64_t a2, int a3, void (*a4)(void))
{
  uint64_t v9 = sub_100015AD8(a1, a2, a3);
  a4();
  return swift_release(v9);
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v11;
  swift_initStackObject(v4, &v11);
  uint64_t v9 = sub_100015AD8(a1, a2, a3);
  a4();
  return swift_release(v9);
}

uint64_t sub_100015AD8(char *a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  id v13 = (char *)&v46 - v12;
  int v47 = a3;
  uint64_t v46 = a2;
  if ((a3 & 1) == 0)
  {
    if (a1)
    {
      id v14 = (uint64_t *)a1;
      uint64_t v15 = a2;
      goto LABEL_11;
    }

    __break(1u);
    goto LABEL_14;
  }

  unint64_t v12 = (unint64_t)a1 >> 32;
  if ((unint64_t)a1 >> 32)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  if (a1 >> 11 == 27)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  LODWORD(v12) = a1 >> 16;
  if (a1 >> 16 > 0x10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if ((a1 & 0xFFFFFF80) != 0)
  {
LABEL_16:
    int v41 = (a1 & 0x3F) << 8;
    unsigned int v42 = (v41 | (a1 >> 6)) + 33217;
    unsigned int v43 = (v41 | (a1 >> 6) & 0x3F) << 8;
    unsigned int v44 = (((v43 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    unsigned int v45 = (v43 | (a1 >> 12)) + 8487393;
    if ((_DWORD)v12) {
      unsigned int v16 = v44;
    }
    else {
      unsigned int v16 = v45;
    }
    goto LABEL_10;
  }

  if (a1 > 0xFF)
  {
    __break(1u);
    goto LABEL_23;
  }

  unsigned int v16 = ((_BYTE)a1 + 1);
LABEL_10:
  unsigned int v17 = __clz(v16);
  uint64_t v15 = 4LL - (v17 >> 3);
  uint64_t v48 = (v16 + 0xFEFEFEFEFEFEFFLL) & ~(-1LL << (8 * ((4 - (v17 >> 3)) & 7)));
  id v14 = &v48;
LABEL_11:
  uint64_t v18 = static String._fromUTF8Repairing(_:)(v14, v15);
  uint64_t v20 = v19;
  uint64_t v48 = v18;
  uint64_t v49 = v19;
  swift_bridgeObjectRetain(v19);
  v21._countAndFlagsBits = 46LL;
  v21._object = (void *)0xE100000000000000LL;
  String.append(_:)(v21);
  uint64_t v22 = swift_bridgeObjectRelease(v20);
  uint64_t v23 = v48;
  uint64_t v24 = v49;
  uint64_t v25 = UUID.init()(v22);
  uint64_t v26 = UUID.uuidString.getter(v25);
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  uint64_t v48 = v23;
  uint64_t v49 = v24;
  swift_bridgeObjectRetain(v24);
  v29._countAndFlagsBits = v26;
  v29._object = v28;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v24);
  uint64_t v31 = v48;
  uint64_t v30 = v49;
  void v4[2] = v48;
  void v4[3] = v30;
  __n128 v32 = swift_bridgeObjectRetain(v30);
  uint64_t v33 = static os_log_type_t.default.getter(v32);
  uint64_t v34 = sub_100005110(&qword_10002FF80);
  uint64_t v35 = swift_allocObject(v34, 72LL, 7LL);
  *(_OWORD *)(v35 + swift_weakDestroy(v0 + 16) = xmmword_100020E10;
  *(void *)(v35 + 56) = &type metadata for String;
  *(void *)(v35 + 64) = sub_100015FF8();
  *(void *)(v35 + 32) = v31;
  *(void *)(v35 + 40) = v30;
  sub_10001603C();
  __n128 v36 = swift_bridgeObjectRetain(v30);
  uint64_t v37 = (void *)static OS_os_log.default.getter(v36);
  os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v37, "Opening transaction - %@", 24LL, 2LL, v35);
  swift_bridgeObjectRelease(v35);

  uint64_t v38 = String.utf8CString.getter(v31, v30);
  swift_bridgeObjectRelease(v30);
  uint64_t v39 = os_transaction_create(v38 + 32);
  uint64_t result = swift_release(v38);
  if (v39)
  {
    v4[4] = v39;
    uint64_t v40 = type metadata accessor for OSActivity();
    swift_allocObject(v40, 40LL, 7LL);
    v4[5] = sub_1000049FC(a1, v46, v47);
    return (uint64_t)v4;
  }

LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_100015DF8(__n128 a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = static os_log_type_t.default.getter(a1);
  uint64_t v4 = sub_100005110(&qword_10002FF80);
  uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = xmmword_100020E10;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100015FF8();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v6;
  sub_10001603C();
  __n128 v8 = swift_bridgeObjectRetain(v6);
  uint64_t v9 = (void *)static OS_os_log.default.getter(v8);
  os_log(_:dso:log:_:_:)(v3, &_mh_execute_header, v9, "Closing transaction - %@", 24LL, 2LL, v5);
  swift_bridgeObjectRelease(v5);

  id v10 = (os_activity_scope_state_s *)(*(void *)(v2 + 40) + 24LL);
  swift_beginAccess(v10, v12, 33LL, 0LL);
  os_activity_scope_leave(v10);
  return swift_endAccess(v12);
}

void *OSTransaction.deinit(__n128 a1)
{
  return v1;
}

uint64_t OSTransaction.__deallocating_deinit(__n128 a1)
{
  return swift_deallocClassInstance(v1, 48LL, 7LL);
}

uint64_t type metadata accessor for OSTransaction()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd13OSTransaction);
}

unint64_t sub_100015FF8()
{
  unint64_t result = qword_10002FF88;
  if (!qword_10002FF88)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10002FF88);
  }

  return result;
}

unint64_t sub_10001603C()
{
  unint64_t result = qword_10002FF90;
  if (!qword_10002FF90)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___OS_os_log);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002FF90);
  }

  return result;
}

uint64_t sub_100016078()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

void sub_100016098()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v6 = type metadata accessor for Logger(0LL);
    uint64_t v7 = sub_100004558(v6, (uint64_t)qword_100032790);
    uint64_t v20 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v8, "Already registered XPC observer.", v9, 2u);
      swift_slowDealloc(v9, -1LL, -1LL);
    }
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_100004558(v10, (uint64_t)qword_100032790);
    unint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Registering XPC observer.", v14, 2u);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    *(_BYTE *)(v1 + swift_weakDestroy(v0 + 16) = 1;
    sub_10000A9AC();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for DispatchQoS.QoSClass.userInitiated(_:),  v2);
    uint64_t v15 = (dispatch_queue_s *)static OS_dispatch_queue.global(qos:)(v5);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v16 = swift_allocObject(&unk_10002A070, 24LL, 7LL);
    swift_weakInit(v16 + 16, v1);
    aBlock[4] = sub_100016610;
    uint64_t v22 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_1000163D0;
    aBlock[3] = &unk_10002A088;
    unsigned int v17 = _Block_copy(aBlock);
    swift_release(v22);
    uint64_t v18 = (int *)(v1 + 20);
    swift_beginAccess(v18, aBlock, 33LL, 0LL);
    notify_register_dispatch("com.apple.jett.switch.environmentChange.idms.complete", v18, v15, v17);
    swift_endAccess(aBlock);
    _Block_release(v17);
  }

uint64_t sub_10001637C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v2);
  if (result)
  {
    uint64_t v4 = result;
    -[XPCNotificationObserver didChangeEnvironment]_0();
    return swift_release(v4);
  }

  return result;
}

uint64_t sub_1000163D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_10001640C()
{
  if (*(_BYTE *)(v0 + 16) == 1)
  {
    uint64_t v1 = v0;
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v2 = type metadata accessor for Logger(0LL);
    uint64_t v3 = sub_100004558(v2, (uint64_t)qword_100032790);
    uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Canceling XPC observer.", v6, 2u);
      swift_slowDealloc(v6, -1LL, -1LL);
    }

    *(_BYTE *)(v1 + swift_weakDestroy(v0 + 16) = 0;
    swift_beginAccess(v1 + 20, v12, 0LL, 0LL);
    notify_cancel(*(_DWORD *)(v1 + 20));
  }

  else
  {
    if (qword_10002ED68 != -1) {
      swift_once(&qword_10002ED68, sub_10000B078);
    }
    uint64_t v7 = type metadata accessor for Logger(0LL);
    uint64_t v8 = sub_100004558(v7, (uint64_t)qword_100032790);
    oslog = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Already canceled XPC observer.", v10, 2u);
      swift_slowDealloc(v10, -1LL, -1LL);
    }
  }

uint64_t type metadata accessor for XPCNotificationObserver()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd23XPCNotificationObserver);
}

uint64_t sub_1000165EC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100016610(uint64_t a1)
{
  return sub_10001637C(a1, v1);
}

uint64_t sub_100016618(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100016628(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100016738()
{
  uint64_t result = sub_100016758();
  qword_1000327D8 = result;
  unk_1000327E0 = v1;
  return result;
}

uint64_t sub_100016758()
{
  id v0 = [(id)objc_opt_self(NSProcessInfo) processInfo];
  id v1 = [v0 environment];

  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v1,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_10001CF20(0xD000000000000010LL, 0x800000010001F930LL), (v4 & 1) != 0))
  {
    os_log_type_t v5 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v3);
    uint64_t v6 = *v5;
    swift_bridgeObjectRetain(v5[1]);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  swift_bridgeObjectRelease(v2);
  return v6;
}

uint64_t sub_100016834()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin();
  char v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100005B44(0LL, (unint64_t *)&qword_10002F780, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v11 = (*(uint64_t (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v7);
  static DispatchQoS.unspecified.getter(v11);
  unsigned int v17 = &_swiftEmptyArrayStorage;
  uint64_t v12 = sub_100004604( &qword_10002F7B0,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v13 = sub_100005110(&qword_10002F7B8);
  unint64_t v14 = sub_100017278();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v13, v14, v2, v12);
  *(void *)(v1 + swift_weakDestroy(v0 + 16) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001ELL,  0x800000010001F950LL,  v6,  v4,  v10,  0LL);
  return v1;
}

uint64_t sub_1000169F4()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for AppleAccountDaemon()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd18AppleAccountDaemon);
}

id sub_100016A38()
{
  uint64_t v0 = type metadata accessor for DependencyRegistry.Entry(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (uint64_t *)((char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_100004558(v4, (uint64_t)qword_100032790);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Setting up dependencies", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  type metadata accessor for DependencyRegistry(0LL);
  uint64_t v9 = sub_100005110((uint64_t *)&unk_10002F498);
  uint64_t v10 = type metadata accessor for XPCActivitySchedulerFactory();
  uint64_t v11 = swift_allocObject(v10, 16LL, 7LL);
  v3[3] = v10;
  v3[4] = sub_100004604( &qword_100030140,  (uint64_t (*)(uint64_t))type metadata accessor for XPCActivitySchedulerFactory,  (uint64_t)&unk_100021DC0);
  *uint64_t v3 = v11;
  uint64_t v12 = *(void (**)(uint64_t *))(v1 + 104);
  unsigned int v41 = enum case for DependencyRegistry.Entry.factory(_:);
  v12(v3);
  static DependencyRegistry.register<A>(_:entry:dependencyId:)(v9, v3, 0LL, 0LL, v9);
  uint64_t v13 = *(void (**)(uint64_t *, uint64_t))(v1 + 8);
  v13(v3, v0);
  uint64_t v14 = type metadata accessor for DaemonAccountStore();
  uint64_t v15 = swift_allocObject(v14, 32LL, 7LL);
  id result = [(id)objc_opt_self(ACAccountStore) defaultStore];
  if (result)
  {
    *(void *)(v15 + swift_weakDestroy(v0 + 16) = result;
    id v39 = (id)objc_opt_self(&OBJC_CLASS___AKAccountManager);
    *(void *)(v15 + 24) = [v39 sharedInstance];
    uint64_t v17 = sub_100005110(&qword_10002F578);
    v3[3] = v14;
    *uint64_t v3 = v15;
    uint64_t v18 = enum case for DependencyRegistry.Entry.exact(_:);
    ((void (*)(uint64_t *, void, uint64_t))v12)(v3, enum case for DependencyRegistry.Entry.exact(_:), v0);
    swift_retain(v15);
    static DependencyRegistry.register<A>(_:entry:dependencyId:)(v17, v3, 0LL, 0LL, v17);
    v13(v3, v0);
    id v19 = [objc_allocWithZone(CDPWalrusStateController) init];
    id v20 = [objc_allocWithZone(CDPStateController) init];
    uint64_t v21 = type metadata accessor for CDPRequestController();
    uint64_t v40 = v15;
    uint64_t v22 = v21;
    uint64_t v23 = swift_allocObject(v21, 32LL, 7LL);
    *(void *)(v23 + swift_weakDestroy(v0 + 16) = v19;
    *(void *)(v23 + 24) = v20;
    v42[3] = v22;
    v42[4] = &off_1000298E8;
    v42[0] = v23;
    uint64_t v24 = sub_100005110(&qword_10002F570);
    uint64_t v25 = sub_100005B7C(v42, v22);
    v3[3] = v22;
    uint64_t v26 = sub_100013238(v3);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16LL))(v26, v25, v22);
    ((void (*)(uint64_t *, uint64_t, uint64_t))v12)(v3, v18, v0);
    static DependencyRegistry.register<A>(_:entry:dependencyId:)(v24, v3, 0LL, 0LL, v24);
    v13(v3, v0);
    uint64_t v27 = sub_100005110(&qword_100030148);
    uint64_t v28 = type metadata accessor for CDPFollowUpHandlerFactory();
    uint64_t v29 = swift_allocObject(v28, 16LL, 7LL);
    v3[3] = v28;
    v3[4] = sub_100004604( &qword_100030150,  (uint64_t (*)(uint64_t))type metadata accessor for CDPFollowUpHandlerFactory,  (uint64_t)&unk_100021D98);
    *uint64_t v3 = v29;
    ((void (*)(uint64_t *, void, uint64_t))v12)(v3, v41, v0);
    static DependencyRegistry.register<A>(_:entry:dependencyId:)(v27, v3, 0LL, 0LL, v27);
    v13(v3, v0);
    id v30 = [objc_allocWithZone(AAFollowUpController) init];
    uint64_t v31 = sub_100005110(&qword_10002F568);
    v3[3] = sub_100005B44(0LL, &qword_100030158, &OBJC_CLASS___AAFollowUpController_ptr);
    *uint64_t v3 = (uint64_t)v30;
    ((void (*)(uint64_t *, uint64_t, uint64_t))v12)(v3, v18, v0);
    id v32 = v30;
    static DependencyRegistry.register<A>(_:entry:dependencyId:)(v31, v3, 0LL, 0LL, v31);
    v13(v3, v0);
    id v33 = [v39 sharedInstance];
    uint64_t v34 = sub_100005B44(0LL, &qword_10002F580, &OBJC_CLASS___AKAccountManager_ptr);
    v3[3] = v34;
    *uint64_t v3 = (uint64_t)v33;
    ((void (*)(uint64_t *, uint64_t, uint64_t))v12)(v3, v18, v0);
    id v35 = v33;
    static DependencyRegistry.register<A>(_:entry:dependencyId:)(v34, v3, 0LL, 0LL, v34);
    v13(v3, v0);
    id v36 = [(id)objc_opt_self(AADeviceInfo) currentInfo];
    if (!v36) {
      id v36 = [objc_allocWithZone(AADeviceInfo) init];
    }
    uint64_t v37 = sub_100005B44(0LL, &qword_10002F588, &OBJC_CLASS___AADeviceInfo_ptr);
    v3[3] = v37;
    *uint64_t v3 = (uint64_t)v36;
    ((void (*)(uint64_t *, uint64_t, uint64_t))v12)(v3, v18, v0);
    id v38 = v36;
    static DependencyRegistry.register<A>(_:entry:dependencyId:)(v37, v3, 0LL, 0LL, v37);

    swift_release(v40);
    v13(v3, v0);
    return (id)sub_100004538(v42);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_100017004()
{
  if (qword_10002ED88 != -1) {
    swift_once(&qword_10002ED88, sub_100016738);
  }
  if (unk_1000327E0) {
    uint64_t v0 = qword_1000327D8;
  }
  else {
    uint64_t v0 = 0xD000000000000012LL;
  }
  if (unk_1000327E0) {
    unint64_t v1 = unk_1000327E0;
  }
  else {
    unint64_t v1 = 0x800000010001F910LL;
  }
  uint64_t v2 = qword_10002ED68;
  swift_bridgeObjectRetain(unk_1000327E0);
  if (v2 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  sub_100004558(v3, (uint64_t)qword_100032790);
  swift_bridgeObjectRetain(v1);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = swift_slowAlloc(32LL, -1LL);
    uint64_t v13 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    swift_bridgeObjectRetain(v1);
    uint64_t v12 = sub_10001BAA4(v0, v1, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
    swift_bridgeObjectRelease_n(v1, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Starting appleaccountd - %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v1, 2LL);
  }

  sub_100016A38();
  if (qword_10002ED90 != -1) {
    swift_once(&qword_10002ED90, sub_1000172C4);
  }
  uint64_t v9 = qword_1000327E8;
  [*(id *)(qword_1000327E8 + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_daemonManager) startup];
  uint64_t v10 = *(void *)(v9 + OBJC_IVAR____TtC13appleaccountd17ConnectionManager_appleIDAvailabilityScheduler);
  swift_retain(v10);
  sub_1000057EC();
  swift_release(v10);
  uint64_t v11 = type metadata accessor for XPCNotificationObserver();
  swift_initStaticObject(v11, &unk_10002EDA8);
  sub_100016098();
}

unint64_t sub_100017278()
{
  unint64_t result = qword_10002F7C0;
  if (!qword_10002F7C0)
  {
    uint64_t v1 = sub_100005B00(&qword_10002F7B8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10002F7C0);
  }

  return result;
}

id sub_1000172C4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ConnectionManager()) init];
  qword_1000327E8 = (uint64_t)result;
  return result;
}

id sub_1000172F0()
{
  uint64_t v1 = type metadata accessor for DependencyRegistry.Entry(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (uint64_t *)((char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v5 = OBJC_IVAR____TtC13appleaccountd17ConnectionManager_daemonManager;
  uint64_t v6 = qword_10002ED80;
  os_log_type_t v7 = v0;
  if (v6 != -1) {
    swift_once(&qword_10002ED80, sub_100014F98);
  }
  uint64_t v8 = qword_1000327C8;
  uint64_t v9 = qword_10002ED78;
  swift_retain(qword_1000327C8);
  if (v9 != -1) {
    swift_once(&qword_10002ED78, sub_100011514);
  }
  uint64_t v10 = qword_1000327C0;
  uint64_t v11 = (objc_class *)type metadata accessor for AppleAccountDaemonManager();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  uint64_t v13 = (uint64_t *)&v12[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_loginResponseCache];
  v13[3] = sub_100005110(&qword_100030200);
  v13[4] = sub_100017884();
  *uint64_t v13 = v8;
  uint64_t v14 = (uint64_t *)&v12[OBJC_IVAR____TtC13appleaccountd25AppleAccountDaemonManager_urlConfigurationManager];
  v14[3] = type metadata accessor for URLConfigurationManager();
  v14[4] = (uint64_t)&off_100029D58;
  *uint64_t v14 = v10;
  v27.receiver = v12;
  v27.super_class = v11;
  swift_retain(v10);
  *(void *)&v7[v5] = objc_msgSendSuper2(&v27, "init");
  static String._unconditionallyBridgeFromObjectiveC(_:)(AAAccountUserNotificationMachService);
  uint64_t v16 = v15;
  id v17 = objc_allocWithZone(&OBJC_CLASS___NSXPCListener);
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  id v19 = [v17 initWithMachServiceName:v18];

  *(void *)&v7[OBJC_IVAR____TtC13appleaccountd17ConnectionManager_notificationServiceListener] = v19;
  v26[3] = &type metadata for AAFeatureFlags;
  v26[4] = sub_1000044F4();
  LOBYTE(v26[0]) = 1;
  LOBYTE(v18) = isFeatureEnabled(_:)(v26);
  sub_100004538(v26);
  uint64_t v20 = type metadata accessor for AppleIDAvailabilityScheduler(0LL);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  uint64_t v21 = sub_1000053D8((uint64_t)sub_1000175BC, 0LL, v18 & 1);
  *(void *)&v7[OBJC_IVAR____TtC13appleaccountd17ConnectionManager_appleIDAvailabilityScheduler] = v21;
  type metadata accessor for DependencyRegistry(0LL);
  void v4[3] = v20;
  uint64_t *v4 = v21;
  (*(void (**)(uint64_t *, void, uint64_t))(v2 + 104))( v4,  enum case for DependencyRegistry.Entry.exact(_:),  v1);
  swift_retain(v21);
  static DependencyRegistry.register<A>(_:entry:dependencyId:)(v20, v4, 0LL, 0LL, v20);

  (*(void (**)(uint64_t *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v22 = (objc_class *)type metadata accessor for ConnectionManager();
  v25.receiver = v7;
  v25.super_class = v22;
  return objc_msgSendSuper2(&v25, "init");
}

uint64_t sub_1000175BC(void *a1)
{
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100004558(v2, (uint64_t)qword_1000327A8);
  id v3 = a1;
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v6 = static os_log_type_t.default.getter(v5);
  if (os_log_type_enabled(v4, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v8 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)os_log_type_t v7 = 138412290;
    id v13 = v3;
    id v9 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    *uint64_t v8 = v3;

    _os_log_impl((void *)&_mh_execute_header, v4, v6, "ConnectionManager: Sending %@ to reporter", v7, 0xCu);
    uint64_t v10 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v8, 1LL, v10);
    swift_slowDealloc(v8, -1LL, -1LL);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  else
  {
  }

  id v11 = [(id)objc_opt_self(AAAnalyticsRTCReporter) reporter];
  [v11 sendEvent:v3];
  return swift_unknownObjectRelease(v11);
}

id sub_1000177A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConnectionManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ConnectionManager()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd17ConnectionManager);
}

unint64_t sub_100017884()
{
  unint64_t result = qword_100030208;
  if (!qword_100030208)
  {
    uint64_t v1 = sub_100005B00(&qword_100030200);
    unint64_t result = swift_getWitnessTable(&unk_100021824, v1);
    atomic_store(result, (unint64_t *)&qword_100030208);
  }

  return result;
}

id sub_1000178D0()
{
  return [*v0 isRenewCredentialsCFUPosted];
}

uint64_t sub_1000178F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v24 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  __chkstk_darwin(v7);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10000A9AC();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))( v13,  enum case for DispatchQoS.QoSClass.default(_:),  v10);
  uint64_t v14 = (void *)static OS_dispatch_queue.global(qos:)(v13);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v15 = swift_allocObject(&unk_10002A120, 32LL, 7LL);
  *(void *)(v15 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  aBlock[4] = sub_100017C10;
  uint64_t v27 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10000C1A4;
  aBlock[3] = &unk_10002A138;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain(a1);
  uint64_t v17 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v17);
  objc_super v25 = &_swiftEmptyArrayStorage;
  unint64_t v18 = sub_100017C30();
  uint64_t v19 = sub_100005110(&qword_10002F790);
  unint64_t v20 = sub_10000E3C0();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v19, v20, v4, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v9, v6, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
  return swift_release(v27);
}

uint64_t sub_100017B34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v2);
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 16);
    swift_retain(v5);
    uint64_t result = swift_release(v4);
    if (v5)
    {
      sub_1000061F4();
      return swift_release(v5);
    }
  }

  return result;
}

uint64_t sub_100017BA0()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for DaemonActivityScheduler()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd23DaemonActivityScheduler);
}

uint64_t sub_100017BE4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100017C10()
{
  return sub_100017B34(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100017C18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100017C28(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_100017C30()
{
  unint64_t result = qword_10002F788;
  if (!qword_10002F788)
  {
    uint64_t v1 = type metadata accessor for DispatchWorkItemFlags(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10002F788);
  }

  return result;
}

__n128 sub_100017C78@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(_BYTE *)a1 & 1 | ((unint64_t)(*(_BYTE *)(a1 + 1) & 1) << 8);
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a2 + 24) = result;
  return result;
}

uint64_t sub_100017CA0(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(void))
{
  switch(a3)
  {
    case 4:
      return sub_100006778();
    case 3:
      return sub_100006760();
    case 2:
      return a4();
  }

  return result;
}

uint64_t sub_100017CF4()
{
  uint64_t v3 = type metadata accessor for AppleIDAvailabilityHealthCheck(0LL);
  uint64_t v0 = sub_100005110(&qword_100030588);
  uint64_t result = String.init<A>(describing:)(&v3, v0);
  qword_1000302D8 = result;
  unk_1000302E0 = v2;
  return result;
}

id sub_100017D3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005110(&qword_100030590);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100005110(&qword_100030598);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!sub_100018450())
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v25 = type metadata accessor for Logger(0LL);
    uint64_t v26 = sub_100004558(v25, (uint64_t)qword_1000327A8);
    uint64_t v27 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v29 = static os_log_type_t.default.getter(v28);
    if (os_log_type_enabled(v27, v29))
    {
      id v30 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v31 = swift_slowAlloc(32LL, -1LL);
      v57[0] = v31;
      *(_DWORD *)id v30 = 136315138;
      if (qword_10002ED98 != -1) {
        swift_once(&qword_10002ED98, sub_100017CF4);
      }
      uint64_t v32 = qword_1000302D8;
      unint64_t v33 = unk_1000302E0;
      swift_bridgeObjectRetain(unk_1000302E0);
      uint64_t v60 = sub_10001BAA4(v32, v33, v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);
      swift_bridgeObjectRelease(v33);
      _os_log_impl( (void *)&_mh_execute_header,  v27,  v29,  "%s - Could not get Continuation Key, Apple ID is NOT available.",  v30,  0xCu);
      swift_arrayDestroy(v31, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1LL, -1LL);
      swift_slowDealloc(v30, -1LL, -1LL);
    }

    type metadata accessor for AAError(0LL);
    uint64_t v23 = v34;
    uint64_t v24 = -4413LL;
    goto LABEL_33;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))( v9,  v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__followUpController,  v6);
  Dependency.wrappedValue.getter(v57, v6);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v10 = v58;
  uint64_t v11 = v59;
  sub_100005B7C(v57, v58);
  char v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 32))(v10, v11);
  sub_100004538(v57);
  if ((v12 & 1) != 0)
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v13 = type metadata accessor for Logger(0LL);
    uint64_t v14 = sub_100004558(v13, (uint64_t)qword_1000327A8);
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v17 = static os_log_type_t.default.getter(v16);
    if (os_log_type_enabled(v15, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v19 = swift_slowAlloc(32LL, -1LL);
      v57[0] = v19;
      *(_DWORD *)unint64_t v18 = 136315138;
      if (qword_10002ED98 != -1) {
        swift_once(&qword_10002ED98, sub_100017CF4);
      }
      uint64_t v20 = qword_1000302D8;
      unint64_t v21 = unk_1000302E0;
      swift_bridgeObjectRetain(unk_1000302E0);
      uint64_t v60 = sub_10001BAA4(v20, v21, v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);
      swift_bridgeObjectRelease(v21);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v17,  "%s - Renew Credentials CFU is posted, Apple ID is NOT available.",  v18,  0xCu);
      swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1LL, -1LL);
      swift_slowDealloc(v18, -1LL, -1LL);
    }

    type metadata accessor for AAError(0LL);
    uint64_t v23 = v22;
    uint64_t v24 = -4412LL;
    goto LABEL_33;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))( v5,  v1 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__cdpController,  v2);
  Dependency.wrappedValue.getter(v57, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v35 = (void *)objc_opt_self(&OBJC_CLASS___CDPAccount);
  id result = [v35 sharedInstance];
  if (!result)
  {
    __break(1u);
    goto LABEL_37;
  }

  uint64_t v37 = result;
  id v38 = [result contextForPrimaryAccount];

  if (!v38)
  {
    sub_100004538(v57);
    goto LABEL_26;
  }

  id result = [v35 sharedInstance];
  if (!result)
  {
LABEL_37:
    __break(1u);
    return result;
  }

  id v39 = result;
  unsigned __int8 v40 = [result isOTEnabledForContext:v38];

  sub_100004538(v57);
  if ((v40 & 1) == 0)
  {
LABEL_26:
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v45 = type metadata accessor for Logger(0LL);
    uint64_t v46 = sub_100004558(v45, (uint64_t)qword_1000327A8);
    int v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v49 = static os_log_type_t.default.getter(v48);
    if (os_log_type_enabled(v47, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v51 = swift_slowAlloc(32LL, -1LL);
      v57[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      if (qword_10002ED98 != -1) {
        swift_once(&qword_10002ED98, sub_100017CF4);
      }
      uint64_t v52 = qword_1000302D8;
      unint64_t v53 = unk_1000302E0;
      swift_bridgeObjectRetain(unk_1000302E0);
      uint64_t v60 = sub_10001BAA4(v52, v53, v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);
      swift_bridgeObjectRelease(v53);
      _os_log_impl( (void *)&_mh_execute_header,  v47,  v49,  "%s - Octagon trust is not healthy, Apple ID is NOT available.",  v50,  0xCu);
      swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1LL, -1LL);
      swift_slowDealloc(v50, -1LL, -1LL);
    }

    type metadata accessor for AAError(0LL);
    uint64_t v23 = v54;
    uint64_t v24 = -4414LL;
    goto LABEL_33;
  }

  id result = (id)sub_10001B564();
  if (!result) {
    return result;
  }
  unsigned int v41 = result;
  id v42 = [result integerValue];

  int v43 = sub_10000B2A0((unint64_t)v42);
  if (v43 != 4 && v43 != 2) {
    return 0LL;
  }
  type metadata accessor for AAError(0LL);
  uint64_t v23 = v44;
  uint64_t v24 = -4416LL;
LABEL_33:
  uint64_t v60 = v24;
  unint64_t v55 = sub_10001B724((uint64_t)&_swiftEmptyArrayStorage);
  unint64_t v56 = sub_10001C120();
  _BridgedStoredNSError.init(_:userInfo:)(v57, &v60, v55, v23, v56);
  return (id)v57[0];
}

BOOL sub_100018450()
{
  uint64_t v1 = sub_100005110(&qword_100030578);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v5 = sub_100019A88();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))( v4,  v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__akAccountManager,  v1);
  Dependency.wrappedValue.getter(&v14, v1);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v6 = v14;
  if (!v5)
  {

LABEL_6:
    uint64_t v11 = 0LL;
    goto LABEL_7;
  }

  id v7 = v5;
  id v8 = [v6 continuationTokenForAccount:v7];
  if (!v8)
  {

    goto LABEL_6;
  }

  id v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

LABEL_7:
  swift_bridgeObjectRelease(v11);
  return v11 != 0;
}

uint64_t sub_10001857C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[143] = a6;
  v6[142] = a5;
  v6[141] = a4;
  uint64_t v7 = sub_100005110(&qword_1000305B0);
  v6[144] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[145] = v8;
  v6[146] = swift_task_alloc((*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100005110(&qword_100030590);
  v6[147] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[148] = v10;
  v6[149] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100005110(&qword_100030578);
  v6[150] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v6[151] = v12;
  v6[152] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_100005110(&qword_10002FC28);
  v6[153] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v6[154] = v14;
  v6[155] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100018698, 0LL, 0LL);
}

uint64_t sub_100018698()
{
  uint64_t v1 = *(void *)(v0 + 1240);
  uint64_t v2 = *(void *)(v0 + 1232);
  uint64_t v3 = *(void *)(v0 + 1224);
  uint64_t v4 = *(void *)(v0 + 1128);
  static String._unconditionallyBridgeFromObjectiveC(_:)(kAppleIDHealthCheckEventName);
  uint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))( v1,  v4 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__accountStore,  v3);
  Dependency.wrappedValue.getter((void *)(v0 + 640), v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v7 =  objc_msgSend( *(id *)(*sub_100005B7C((void *)(v0 + 640), *(void *)(v0 + 664)) + 16),  "aa_primaryAppleAccount");
  if (v7 && (v8 = v7, id v9 = objc_msgSend(v7, "aa_altDSID"), v8, v9))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    uint64_t v11 = v10;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  uint64_t v12 = (uint64_t *)(v0 + 160);
  uint64_t v13 = (void *)(v0 + 680);
  sub_100004538((void *)(v0 + 640));
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  if (v11)
  {
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v11);
  }

  else
  {
    NSString v15 = 0LL;
  }

  id v16 =  [(id)objc_opt_self(AAFAnalyticsEvent) analyticsEventWithName:v14 altDSID:v15 flowID:0];
  *(void *)(v0 + 1248) = v16;

  p_info = (__objc2_class_ro **)(&OBJC_CLASS____TtC13appleaccountd23XPCNotificationObserver + 32);
  if (v16)
  {
    id v18 = v16;

    Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
    [v18 setObject:isa forKeyedSubscript:kAAFDidSucceed];

    id v20 = v18;
    id v21 = sub_100019A88();
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)(v0 + 1216);
      uint64_t v24 = *(void *)(v0 + 1208);
      uint64_t v25 = *(void *)(v0 + 1200);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))( v23,  *(void *)(v0 + 1128) + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__akAccountManager,  v25);
      Dependency.wrappedValue.getter((void *)(v0 + 800), v25);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
      uint64_t v26 = *(void **)(v0 + 800);
      [v26 securityLevelForAccount:v22];
    }

    uint64_t v29 = *(void *)(v0 + 1192);
    uint64_t v30 = *(void *)(v0 + 1184);
    uint64_t v31 = *(void *)(v0 + 1176);
    uint64_t v32 = *(void *)(v0 + 1128);
    Class v33 = UInt._bridgeToObjectiveC()().super.super.isa;
    [v20 setObject:v33 forKeyedSubscript:kAAAnalyticsSecurityLevel];

    uint64_t v34 = (char *)(v32 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__cdpController);
    __n128 v28 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 16);
    v28(v29, v34, v31);
    id v35 = v20;
    Dependency.wrappedValue.getter((void *)(v0 + 720), v31);
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    sub_10000B2B0();
    Class v36 = Bool._bridgeToObjectiveC()().super.super.isa;
    sub_100004538((void *)(v0 + 720));
    [v35 setObject:v36 forKeyedSubscript:kAAAnalyticsCdpStatus];

    p_info = &OBJC_CLASS____TtC13appleaccountd23XPCNotificationObserver.info;
    uint64_t v27 = *(void *)(v0 + 1184);
    uint64_t v12 = (uint64_t *)(v0 + 160);
    uint64_t v13 = (void *)(v0 + 680);
  }

  else
  {
    uint64_t v27 = *(void *)(v0 + 1184);
    __n128 v28 = *(void (**)(uint64_t, char *, uint64_t))(v27 + 16);
  }

  uint64_t v37 = *(void *)(v0 + 1192);
  uint64_t v38 = *(void *)(v0 + 1176);
  v28(v37, (char *)p_info[94] + *(void *)(v0 + 1128), v38);
  Dependency.wrappedValue.getter(v13, v38);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v37, v38);
  sub_10000B94C(v12);
  sub_100004538(v13);
  if (v16)
  {
    id v39 = (_OWORD *)(v0 + 592);
    sub_10001C6C4((uint64_t)v12, v0 + 64, &qword_1000305D0);
    if (*(void *)(v0 + 64) == 1LL)
    {
      id v40 = v16;
    }

    else
    {
      __int128 v41 = *(_OWORD *)(v0 + 80);
      *(_OWORD *)(v0 + 400) = *(_OWORD *)(v0 + 64);
      *(_OWORD *)(v0 + 4swift_weakDestroy(v0 + 16) = v41;
      *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 96);
      sub_10001C6C4(v0 + 400, v0 + 920, &qword_1000305D8);
      sub_10001C6C4(v0 + 408, v0 + 912, &qword_1000305D8);
      id v42 = v16;
      sub_10001C5E4(v12, (void (*)(void, void, void, void, void, void))sub_10001C61C);
      sub_10001C69C((id *)(v0 + 912));
      sub_10001C6C4(v0 + 416, v0 + 904, &qword_1000305D8);
      sub_10001C69C((id *)(v0 + 904));
      sub_10001C6C4(v0 + 432, v0 + 896, &qword_1000305D8);
      sub_10001C69C((id *)(v0 + 896));
      sub_10001C6C4(v0 + 440, v0 + 888, &qword_1000305D8);
      sub_10001C69C((id *)(v0 + 888));
      sub_10001C6C4(v0 + 920, v0 + 1024, &qword_1000305D8);
      uint64_t v43 = *(void *)(v0 + 1024);
      if (v43)
      {
        *(void *)(v0 + 1088) = v43;
        uint64_t v44 = sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
        uint64_t v45 = _bridgeAnythingToObjectiveC<A>(_:)(v0 + 1088, v44);

LABEL_19:
        uint64_t v46 = (_OWORD *)(v0 + 496);
        [v16 setObject:v45 forKeyedSubscript:kAAAnalyticsEdpHealth];
        swift_unknownObjectRelease(v45);

        sub_10001C6C4((uint64_t)v12, v0 + 592, &qword_1000305D0);
        if (*(void *)v39 == 1LL)
        {
          id v47 = v16;
          uint64_t v48 = 0LL;
        }

        else
        {
          __int128 v49 = *(_OWORD *)(v0 + 608);
          *(_OWORD *)(v0 + 112) = *v39;
          *(_OWORD *)(v0 + 128) = v49;
          *(_OWORD *)(v0 + 144) = *(_OWORD *)(v0 + 624);
          sub_10001C6C4(v0 + 120, v0 + 880, &qword_1000305D8);
          uint64_t v12 = (uint64_t *)(v0 + 160);
          sub_10001C6C4(v0 + 112, v0 + 872, &qword_1000305D8);
          id v50 = v16;
          sub_10001C5E4( (void *)(v0 + 160),  (void (*)(void, void, void, void, void, void))sub_10001C61C);
          sub_10001C69C((id *)(v0 + 872));
          sub_10001C6C4(v0 + 128, v0 + 864, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 864));
          sub_10001C6C4(v0 + 144, v0 + 856, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 856));
          sub_10001C6C4(v0 + 152, v0 + 848, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 848));
          sub_10001C6C4(v0 + 880, v0 + 1040, &qword_1000305D8);
          uint64_t v51 = *(void *)(v0 + 1040);
          if (v51)
          {
            *(void *)(v0 + 1096) = v51;
            uint64_t v52 = sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
            uint64_t v48 = _bridgeAnythingToObjectiveC<A>(_:)(v0 + 1096, v52);
          }

          else
          {
            uint64_t v48 = 0LL;
          }
        }

        unint64_t v53 = (_OWORD *)(v0 + 16);
        [v16 setObject:v48 forKeyedSubscript:kAAAnalyticsEdpPrimaryRecordHealth];
        swift_unknownObjectRelease(v48);

        sub_10001C6C4((uint64_t)v12, v0 + 496, &qword_1000305D0);
        if (*(void *)v46 == 1LL)
        {
          id v54 = v16;
          uint64_t v55 = 0LL;
        }

        else
        {
          __int128 v56 = *(_OWORD *)(v0 + 512);
          *(_OWORD *)(v0 + 544) = *v46;
          *(_OWORD *)(v0 + 560) = v56;
          *(_OWORD *)(v0 + 576) = *(_OWORD *)(v0 + 528);
          sub_10001C6C4(v0 + 560, v0 + 840, &qword_1000305D8);
          sub_10001C6C4(v0 + 544, v0 + 832, &qword_1000305D8);
          id v57 = v16;
          sub_10001C5E4(v12, (void (*)(void, void, void, void, void, void))sub_10001C61C);
          sub_10001C674((id *)(v0 + 840));
          sub_10001C69C((id *)(v0 + 832));
          sub_10001C6C4(v0 + 552, v0 + 824, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 824));
          sub_10001C69C((id *)(v0 + 840));
          sub_10001C6C4(v0 + 576, v0 + 816, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 816));
          sub_10001C6C4(v0 + 584, v0 + 808, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 808));
          sub_10001C6C4(v0 + 840, v0 + 1032, &qword_1000305D8);
          uint64_t v58 = *(void *)(v0 + 1032);
          if (v58)
          {
            *(void *)(v0 + 1104) = v58;
            uint64_t v59 = sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
            uint64_t v55 = _bridgeAnythingToObjectiveC<A>(_:)(v0 + 1104, v59);
          }

          else
          {
            uint64_t v55 = 0LL;
          }

          uint64_t v12 = (uint64_t *)(v0 + 160);
        }

        uint64_t v60 = (_OWORD *)(v0 + 304);
        [v16 setObject:v55 forKeyedSubscript:kAAAnalyticsEdpRecoveryRecordHealth];
        swift_unknownObjectRelease(v55);

        sub_10001C6C4((uint64_t)v12, v0 + 16, &qword_1000305D0);
        if (*(void *)v53 == 1LL)
        {
          id v61 = v16;
          uint64_t v62 = 0LL;
        }

        else
        {
          uint64_t v100 = v0 + 1274;
          __int128 v63 = *(_OWORD *)(v0 + 32);
          *(_OWORD *)(v0 + 448) = *v53;
          *(_OWORD *)(v0 + 464) = v63;
          *(_OWORD *)(v0 + 480) = *(_OWORD *)(v0 + 48);
          sub_10001C6C4(v0 + 472, v0 + 1274, (uint64_t *)&unk_1000305E0);
          sub_10001C6C4(v0 + 448, v0 + 792, &qword_1000305D8);
          id v64 = v16;
          sub_10001C5E4(v12, (void (*)(void, void, void, void, void, void))sub_10001C61C);
          sub_10001C69C((id *)(v0 + 792));
          sub_10001C6C4(v0 + 456, v0 + 784, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 784));
          sub_10001C6C4(v0 + 464, v0 + 776, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 776));
          sub_10001C6C4(v0 + 480, v0 + 768, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 768));
          sub_10001C6C4(v0 + 488, v0 + 760, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 760));
          sub_10001C6C4(v0 + 1274, v0 + 1273, (uint64_t *)&unk_1000305E0);
          int v65 = *(unsigned __int8 *)(v0 + 1273);
          if (v65 == 2)
          {
            uint64_t v62 = 0LL;
          }

          else
          {
            *(_BYTE *)(v0 + 1272) = v65;
            uint64_t v62 = _bridgeAnythingToObjectiveC<A>(_:)(v0 + 1272, &type metadata for Bool);
          }

          uint64_t v12 = (uint64_t *)(v0 + 160);
        }

        uint64_t v66 = (_OWORD *)(v0 + 208);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v62, kAAAnalyticsEDPPasswordVersionDoesMatch, v100);
        swift_unknownObjectRelease(v62);

        sub_10001C6C4((uint64_t)v12, v0 + 304, &qword_1000305D0);
        if (*(void *)v60 == 1LL)
        {
          id v67 = v16;
          uint64_t v68 = 0LL;
        }

        else
        {
          __int128 v69 = *(_OWORD *)(v0 + 320);
          *(_OWORD *)(v0 + 352) = *v60;
          *(_OWORD *)(v0 + 368) = v69;
          *(_OWORD *)(v0 + 384) = *(_OWORD *)(v0 + 336);
          sub_10001C6C4(v0 + 384, v0 + 928, &qword_1000305D8);
          sub_10001C6C4(v0 + 352, v0 + 936, &qword_1000305D8);
          id v70 = v16;
          sub_10001C5E4(v12, (void (*)(void, void, void, void, void, void))sub_10001C61C);
          sub_10001C674((id *)(v0 + 928));
          sub_10001C69C((id *)(v0 + 936));
          sub_10001C6C4(v0 + 360, v0 + 944, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 944));
          sub_10001C6C4(v0 + 368, v0 + 952, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 952));
          sub_10001C69C((id *)(v0 + 928));
          sub_10001C6C4(v0 + 392, v0 + 960, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 960));
          sub_10001C6C4(v0 + 928, v0 + 1016, &qword_1000305D8);
          uint64_t v71 = *(void *)(v0 + 1016);
          if (v71)
          {
            *(void *)(v0 + 1120) = v71;
            uint64_t v72 = sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
            uint64_t v68 = _bridgeAnythingToObjectiveC<A>(_:)(v0 + 1120, v72);
          }

          else
          {
            uint64_t v68 = 0LL;
          }

          uint64_t v12 = (uint64_t *)(v0 + 160);
        }

        [v16 setObject:v68 forKeyedSubscript:kAAAnalyticsEdpRemainingPrimaryRecordAttempts];
        swift_unknownObjectRelease(v68);

        sub_10001C6C4((uint64_t)v12, v0 + 208, &qword_1000305D0);
        if (*(void *)v66 == 1LL)
        {
          id v73 = v16;
          uint64_t v74 = 0LL;
        }

        else
        {
          __int128 v75 = *(_OWORD *)(v0 + 224);
          *(_OWORD *)(v0 + 256) = *v66;
          *(_OWORD *)(v0 + 272) = v75;
          *(_OWORD *)(v0 + 288) = *(_OWORD *)(v0 + 240);
          sub_10001C6C4(v0 + 296, v0 + 968, &qword_1000305D8);
          sub_10001C6C4(v0 + 256, v0 + 976, &qword_1000305D8);
          id v76 = v16;
          sub_10001C5E4(v12, (void (*)(void, void, void, void, void, void))sub_10001C61C);
          sub_10001C674((id *)(v0 + 968));
          sub_10001C69C((id *)(v0 + 976));
          sub_10001C6C4(v0 + 264, v0 + 984, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 984));
          sub_10001C6C4(v0 + 272, v0 + 992, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 992));
          sub_10001C6C4(v0 + 288, v0 + 1000, &qword_1000305D8);
          sub_10001C69C((id *)(v0 + 1000));
          sub_10001C69C((id *)(v0 + 968));
          sub_10001C6C4(v0 + 968, v0 + 1008, &qword_1000305D8);
          uint64_t v77 = *(void *)(v0 + 1008);
          if (v77)
          {
            *(void *)(v0 + 1112) = v77;
            uint64_t v78 = sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
            uint64_t v74 = _bridgeAnythingToObjectiveC<A>(_:)(v0 + 1112, v78);
          }

          else
          {
            uint64_t v74 = 0LL;
          }
        }

        [v16 setObject:v74 forKeyedSubscript:kAAAnalyticsEdpRemainingRecoveryRecordAttempts];
        swift_unknownObjectRelease(v74);

        goto LABEL_48;
      }
    }

    uint64_t v45 = 0LL;
    goto LABEL_19;
  }

uint64_t sub_1000195CC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 1248);
  uint64_t v5 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 1256));
  uint64_t v3 = (void *)swift_task_alloc(dword_10003035C);
  *(void *)(v1 + 1264) = v3;
  *uint64_t v3 = v5;
  v3[1] = sub_10001966C;
  return sub_10001A89C(v2);
}

uint64_t sub_10001966C()
{
  return swift_task_switch(sub_1000196EC, 0LL, 0LL);
}

uint64_t sub_1000196EC()
{
  uint64_t v1 = *(void **)(v0 + 1248);
  sub_10001AD48(v1);
  id v2 = sub_100019A88();
  sub_100019C8C(v1, v2);

  sub_10001B15C(v1);
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v3 = *(void **)(v0 + 1248);
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_100004558(v4, (uint64_t)qword_1000327A8);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v7 = static os_log_type_t.default.getter(v6);
  if (os_log_type_enabled(v5, v7))
  {
    uint64_t v31 = v0 + 1072;
    uint64_t v8 = swift_slowAlloc(22LL, -1LL);
    uint64_t v30 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v32 = swift_slowAlloc(32LL, -1LL);
    uint64_t v34 = v32;
    *(_DWORD *)uint64_t v8 = 136315394;
    if (qword_10002ED98 != -1) {
      swift_once(&qword_10002ED98, sub_100017CF4);
    }
    uint64_t v9 = *(void *)(v0 + 1248);
    uint64_t v10 = qword_1000302D8;
    unint64_t v11 = unk_1000302E0;
    swift_bridgeObjectRetain(unk_1000302E0);
    *(void *)(v0 + 1056) = sub_10001BAA4(v10, v11, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1056, v0 + 1064);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v8 + 12) = 2112;
    if (v9)
    {
      uint64_t v12 = *(void **)(v0 + 1248);
      *(void *)(v0 + 1072) = v12;
      id v13 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, v0 + 1080);
      NSString v14 = *(void **)(v0 + 1248);
      NSString v15 = v14;
    }

    else
    {
      *(void *)(v0 + 1064) = 0LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 1064, v31);
      NSString v15 = 0LL;
      NSString v14 = *(void **)(v0 + 1248);
    }

    *uint64_t v30 = v15;

    _os_log_impl( (void *)&_mh_execute_header,  v5,  v7,  "%s - Reporting AppleID Availability Healthcheck event %@",  (uint8_t *)v8,  0x16u);
    uint64_t v17 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v30, 1LL, v17);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_arrayDestroy(v32, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    id v16 = *(void **)(v0 + 1248);
  }

  id v18 = *(void **)(v0 + 1248);
  if (v18)
  {
    uint64_t v19 = *(void *)(v0 + 1128) + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck_reportEvent;
    id v21 = *(void (**)(id))v19;
    uint64_t v20 = *(void *)(v19 + 8);
    id v22 = v18;
    swift_retain(v20);
    v21(v22);

    swift_release(v20);
    uint64_t v23 = *(void **)(v0 + 1248);
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  uint64_t v24 = *(void *)(v0 + 1240);
  uint64_t v25 = *(void *)(v0 + 1216);
  uint64_t v26 = *(void *)(v0 + 1192);
  uint64_t v33 = *(void *)(v0 + 1168);
  uint64_t v27 = *(void (**)(void))(v0 + 1136);
  id v28 = sub_100017D3C();
  v27();

  sub_10001C5E4( (void *)(v0 + 160),  (void (*)(void, void, void, void, void, void))sub_10001C58C);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100019A88()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100005110(&qword_100030578);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100005110(&qword_10002FC28);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))( v9,  v1 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__accountStore,  v6);
  Dependency.wrappedValue.getter(v20, v6);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v10 = objc_msgSend(*(id *)(*sub_100005B7C(v20, (uint64_t)v20[3]) + 16), "aa_primaryAppleAccount");
  if (v10
    && (unint64_t v11 = v10, v12 = objc_msgSend(v10, "aa_altDSID"), v11, v12))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v14 = v13;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  sub_100004538(v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))( v5,  v1 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__akAccountManager,  v2);
  Dependency.wrappedValue.getter(v20, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v15 = v20[0];
  if (v14)
  {
    swift_bridgeObjectRetain(v14);
    NSString v16 = String._bridgeToObjectiveC()();
    id v17 = [v15 authKitAccountWithAltDSID:v16];

    swift_bridgeObjectRelease_n(v14, 2LL);
  }

  else
  {

    return 0LL;
  }

  return v17;
}

void sub_100019C8C(void *a1, void *a2)
{
  uint64_t v5 = sub_100005110(&qword_100030578);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1)
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v25 = type metadata accessor for Logger(0LL);
    uint64_t v26 = sub_100004558(v25, (uint64_t)qword_1000327A8);
    Class v36 = (os_log_s *)Logger.logObject.getter(v26);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)id v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  v27,  "AppleIDAvailabilityHealthCheck attachCKReason event is nil",  v28,  2u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    goto LABEL_17;
  }

  if (!a2)
  {
    uint64_t v29 = qword_10002ED70;
    Class v36 = a1;
    if (v29 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v30 = type metadata accessor for Logger(0LL);
    uint64_t v31 = sub_100004558(v30, (uint64_t)qword_1000327A8);
    uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  v33,  "AppleIDAvailabilityHealthCheck attachCKReason account is nil",  v34,  2u);
      swift_slowDealloc(v34, -1LL, -1LL);
    }

LABEL_17:
    return;
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))( v8,  v2 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__akAccountManager,  v5);
  id v9 = a1;
  id v10 = a2;
  Dependency.wrappedValue.getter(&v38, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v11 = v38;
  id v12 = [v38 deviceRemovalReasonForAccount:v10];

  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  [v9 setObject:isa forKeyedSubscript:kAAAnalyticsDeviceRemovalReason];

  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v14 = type metadata accessor for Logger(0LL);
  uint64_t v15 = sub_100004558(v14, (uint64_t)qword_1000327A8);
  NSString v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v18 = static os_log_type_t.default.getter(v17);
  if (os_log_type_enabled(v16, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v20 = (void *)swift_slowAlloc(32LL, -1LL);
    uint64_t v37 = (uint64_t)v12;
    id v38 = v20;
    *(_DWORD *)uint64_t v19 = 136315138;
    type metadata accessor for AKRemoteDeviceRemovalReason(0LL);
    uint64_t v22 = String.init<A>(describing:)(&v37, v21);
    unint64_t v24 = v23;
    uint64_t v37 = sub_10001BAA4(v22, v23, (uint64_t *)&v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38);
    swift_bridgeObjectRelease(v24);
    _os_log_impl( (void *)&_mh_execute_header,  v16,  v18,  "AppleIDAvailabilityHealthCheck attachCKReason attached %s",  v19,  0xCu);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    swift_slowDealloc(v19, -1LL, -1LL);
  }
}

void sub_10001A080(void *a1)
{
  uint64_t v3 = sub_100005110(&qword_100030590);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))( v6,  v1 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__cdpController,  v3);
    Dependency.wrappedValue.getter(v24, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = *(void **)(*sub_100005B7C(v24, v24[3]) + 16LL);
    id v23 = 0LL;
    [v7 walrusStatus:&v23];
    if (v23)
    {
      id v8 = v23;
      swift_willThrow(v8);
      sub_100004538(v24);
      if (qword_10002ED70 != -1) {
        swift_once(&qword_10002ED70, sub_10000B0D4);
      }
      uint64_t v9 = type metadata accessor for Logger(0LL);
      sub_100004558(v9, (uint64_t)qword_1000327A8);
      id v10 = v8;
      id v11 = (os_log_s *)Logger.logObject.getter(v10);
      os_log_type_t v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc(22LL, -1LL);
        uint64_t v14 = (void *)swift_slowAlloc(8LL, -1LL);
        uint64_t v15 = swift_slowAlloc(32LL, -1LL);
        v24[0] = v15;
        *(_DWORD *)uint64_t v13 = 136315394;
        if (qword_10002ED98 != -1) {
          swift_once(&qword_10002ED98, sub_100017CF4);
        }
        uint64_t v16 = qword_1000302D8;
        unint64_t v17 = unk_1000302E0;
        swift_bridgeObjectRetain(unk_1000302E0);
        id v23 = (id)sub_10001BAA4(v16, v17, v24);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
        swift_bridgeObjectRelease(v17);
        *(_WORD *)(v13 + 12) = 2112;
        id v18 = v10;
        uint64_t v19 = (void *)_swift_stdlib_bridgeErrorToNSError(v18);
        id v23 = v19;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
        *uint64_t v14 = v19;

        _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "%s - Failed to attach Walrus Status: %@",  (uint8_t *)v13,  0x16u);
        uint64_t v20 = sub_100005110(&qword_10002FAB0);
        swift_arrayDestroy(v14, 1LL, v20);
        swift_slowDealloc(v14, -1LL, -1LL);
        swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v15, -1LL, -1LL);
        swift_slowDealloc(v13, -1LL, -1LL);
      }

      else
      {
      }
    }

    else
    {
      Class isa = UInt._bridgeToObjectiveC()().super.super.isa;
      sub_100004538(v24);
      [a1 setObject:isa forKeyedSubscript:kAAAnalyticsAdvancedDataProtectionState];
    }
  }

uint64_t sub_10001A3F0(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_100005110(&qword_100030590);
  v2[11] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10001A454, 0LL, 0LL);
}

uint64_t sub_10001A454()
{
  if (v0[9])
  {
    uint64_t v2 = v0[12];
    uint64_t v1 = v0[13];
    uint64_t v3 = v0[11];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))( v1,  v0[10] + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__cdpController,  v3);
    Dependency.wrappedValue.getter(v0 + 2, v3);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v7 = (uint64_t (*)(void))((char *)&dword_10002F9A8 + dword_10002F9A8);
    uint64_t v4 = (void *)swift_task_alloc(unk_10002F9AC);
    v0[14] = v4;
    void *v4 = v0;
    v4[1] = sub_10001A51C;
    uint64_t v5 = v7;
  }

  else
  {
    swift_task_dealloc(v0[13]);
    uint64_t v5 = (uint64_t (*)(void))v0[1];
  }

  return v5();
}

uint64_t sub_10001A51C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 112);
  *(void *)(*v2 + 120) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_10001A608;
  }

  else
  {
    *(void *)(v4 + 128) = a1;
    uint64_t v6 = sub_10001A590;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_10001A590()
{
  uint64_t v1 = *(void **)(v0 + 72);
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  sub_100004538((void *)(v0 + 16));
  [v1 setObject:isa forKeyedSubscript:kAAAnalyticsCliqueStatus];

  swift_task_dealloc(*(void *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A608()
{
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100004558(v2, (uint64_t)qword_1000327A8);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc(22LL, -1LL);
    uint64_t v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v15 = swift_slowAlloc(32LL, -1LL);
    uint64_t v16 = v15;
    *(_DWORD *)uint64_t v6 = 136315394;
    if (qword_10002ED98 != -1) {
      swift_once(&qword_10002ED98, sub_100017CF4);
    }
    uint64_t v8 = *(void *)(v0 + 120);
    uint64_t v10 = qword_1000302D8;
    unint64_t v9 = unk_1000302E0;
    swift_bridgeObjectRetain(unk_1000302E0);
    *(void *)(v0 + 56) = sub_10001BAA4(v10, v9, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64);
    swift_bridgeObjectRelease(v9);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain(v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError(v8);
    *(void *)(v0 + 64) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72);
    *uint64_t v7 = v11;
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s - Failed to attach Octagon Status: %@", (uint8_t *)v6, 0x16u);
    uint64_t v12 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v7, 1LL, v12);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    swift_errorRelease(v8);
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 120);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
  }

  swift_task_dealloc(*(void *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A89C(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = sub_100005110(&qword_100030590);
  v2[11] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_10001A900, 0LL, 0LL);
}

uint64_t sub_10001A900()
{
  if (v0[9])
  {
    uint64_t v2 = v0[12];
    uint64_t v1 = v0[13];
    uint64_t v3 = v0[11];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))( v1,  v0[10] + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__cdpController,  v3);
    Dependency.wrappedValue.getter(v0 + 2, v3);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    uint64_t v7 = (uint64_t (*)(void))((char *)&dword_10002F998 + dword_10002F998);
    uint64_t v4 = (void *)swift_task_alloc(unk_10002F99C);
    v0[14] = v4;
    void *v4 = v0;
    v4[1] = sub_10001A9C8;
    os_log_type_t v5 = v7;
  }

  else
  {
    swift_task_dealloc(v0[13]);
    os_log_type_t v5 = (uint64_t (*)(void))v0[1];
  }

  return v5();
}

uint64_t sub_10001A9C8(int a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 112);
  *(void *)(*v2 + 120) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_10001AAB4;
  }

  else
  {
    *(_DWORD *)(v4 + 128) = a1;
    uint64_t v6 = sub_10001AA3C;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_10001AA3C()
{
  uint64_t v1 = *(void **)(v0 + 72);
  Class isa = Int32._bridgeToObjectiveC()().super.super.isa;
  sub_100004538((void *)(v0 + 16));
  [v1 setObject:isa forKeyedSubscript:kAAAnalyticsCircleSyncingStatus];

  swift_task_dealloc(*(void *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001AAB4()
{
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_100004558(v2, (uint64_t)qword_1000327A8);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc(22LL, -1LL);
    uint64_t v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v15 = swift_slowAlloc(32LL, -1LL);
    uint64_t v16 = v15;
    *(_DWORD *)uint64_t v6 = 136315394;
    if (qword_10002ED98 != -1) {
      swift_once(&qword_10002ED98, sub_100017CF4);
    }
    uint64_t v8 = *(void *)(v0 + 120);
    uint64_t v10 = qword_1000302D8;
    unint64_t v9 = unk_1000302E0;
    swift_bridgeObjectRetain(unk_1000302E0);
    *(void *)(v0 + 56) = sub_10001BAA4(v10, v9, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64);
    swift_bridgeObjectRelease(v9);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain(v8);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError(v8);
    *(void *)(v0 + 64) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72);
    *uint64_t v7 = v11;
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s - Failed to attach SOS Status: %@", (uint8_t *)v6, 0x16u);
    uint64_t v12 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v7, 1LL, v12);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    swift_errorRelease(v8);
  }

  else
  {
    uint64_t v13 = *(void *)(v0 + 120);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
  }

  swift_task_dealloc(*(void *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10001AD48(void *a1)
{
  uint64_t v3 = sub_100005110(&qword_100030578);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = sub_100019A88();
  if (v7)
  {
    uint64_t v8 = v7;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))( v6,  v1 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__akAccountManager,  v3);
    Dependency.wrappedValue.getter(&v28, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    id v9 = v28;
    uint64_t v10 = (os_log_s *)[v28 adpCohortForAccount:v8];

    if (!v10)
    {
      if (qword_10002ED70 != -1) {
        swift_once(&qword_10002ED70, sub_10000B0D4);
      }
      uint64_t v18 = type metadata accessor for Logger(0LL);
      uint64_t v19 = sub_100004558(v18, (uint64_t)qword_1000327A8);
      uint64_t v10 = (os_log_s *)Logger.logObject.getter(v19);
      os_log_type_t v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v10, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v22 = (void *)swift_slowAlloc(32LL, -1LL);
        id v28 = v22;
        *(_DWORD *)uint64_t v21 = 136315138;
        if (qword_10002ED98 != -1) {
          swift_once(&qword_10002ED98, sub_100017CF4);
        }
        uint64_t v23 = qword_1000302D8;
        unint64_t v24 = unk_1000302E0;
        swift_bridgeObjectRetain(unk_1000302E0);
        uint64_t v27 = sub_10001BAA4(v23, v24, (uint64_t *)&v28);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
        swift_bridgeObjectRelease(v24);
        _os_log_impl( (void *)&_mh_execute_header,  v10,  v20,  "%s - Failed to attach ADP cohort type, cohort nil",  v21,  0xCu);
        swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v22, -1LL, -1LL);
        swift_slowDealloc(v21, -1LL, -1LL);
      }

      goto LABEL_17;
    }

    if (a1)
    {
      [a1 setObject:v10 forKeyedSubscript:kAAAnalyticsADPCohortType];
LABEL_17:

      return;
    }
  }

  else
  {
    if (qword_10002ED70 != -1) {
      swift_once(&qword_10002ED70, sub_10000B0D4);
    }
    uint64_t v11 = type metadata accessor for Logger(0LL);
    uint64_t v12 = sub_100004558(v11, (uint64_t)qword_1000327A8);
    uint64_t v26 = (os_log_s *)Logger.logObject.getter(v12);
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v15 = (void *)swift_slowAlloc(32LL, -1LL);
      id v28 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      if (qword_10002ED98 != -1) {
        swift_once(&qword_10002ED98, sub_100017CF4);
      }
      uint64_t v16 = qword_1000302D8;
      unint64_t v17 = unk_1000302E0;
      swift_bridgeObjectRetain(unk_1000302E0);
      uint64_t v27 = sub_10001BAA4(v16, v17, (uint64_t *)&v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
      swift_bridgeObjectRelease(v17);
      _os_log_impl( (void *)&_mh_execute_header,  v26,  v13,  "%s - Failed to attach ADP cohort type, account nil",  v14,  0xCu);
      swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1LL, -1LL);
      swift_slowDealloc(v14, -1LL, -1LL);
    }

    else
    {
    }
  }

void sub_10001B15C(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)sub_10001B564();
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = [v2 integerValue];

      sub_10000B2A0((unint64_t)v4);
    }

    Class isa = Int._bridgeToObjectiveC()().super.super.isa;
    [a1 setObject:isa forKeyedSubscript:kAAAnalyticsRecordViabilityState];
  }

uint64_t sub_10001B224()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__followUpController;
  uint64_t v2 = sub_100005110(&qword_100030598);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__cdpController;
  uint64_t v4 = sub_100005110(&qword_100030590);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__accountStore;
  uint64_t v6 = sub_100005110(&qword_10002FC28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__akAccountManager;
  uint64_t v8 = sub_100005110(&qword_100030578);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__deviceInfo;
  uint64_t v10 = sub_100005110(&qword_1000305B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  swift_release(*(void *)(v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck_reportEvent + 8));
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_10001B33C()
{
  return type metadata accessor for AppleIDAvailabilityHealthCheck(0LL);
}

uint64_t type metadata accessor for AppleIDAvailabilityHealthCheck(uint64_t a1)
{
  uint64_t result = qword_100030340;
  if (!qword_100030340) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AppleIDAvailabilityHealthCheck);
  }
  return result;
}

void sub_10001B380(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v12[0] = *(void *)(v2 - 8) + 64LL;
    sub_10001B4C4(319LL, &qword_100030368, &qword_10002F570);
    if (v5 <= 0x3F)
    {
      v12[1] = *(void *)(v4 - 8) + 64LL;
      sub_10001B4C4(319LL, (unint64_t *)&qword_10002FB40, &qword_10002F578);
      if (v7 <= 0x3F)
      {
        v12[2] = *(void *)(v6 - 8) + 64LL;
        sub_10001B510(319LL, &qword_100030370, &qword_10002F580, &OBJC_CLASS___AKAccountManager_ptr);
        if (v9 <= 0x3F)
        {
          v12[3] = *(void *)(v8 - 8) + 64LL;
          sub_10001B510(319LL, (unint64_t *)&unk_100030378, &qword_10002F588, &OBJC_CLASS___AADeviceInfo_ptr);
          if (v11 <= 0x3F)
          {
            v12[4] = *(void *)(v10 - 8) + 64LL;
            v12[5] = (char *)&value witness table for () + 64;
            swift_updateClassMetadata2(a1, 256LL, 6LL, v12, a1 + 80);
          }
        }
      }
    }
  }

void sub_10001B4C4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    uint64_t v5 = sub_100005B00(a3);
    unint64_t v6 = type metadata accessor for Dependency(a1, v5);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }

void sub_10001B510(uint64_t a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  if (!*a2)
  {
    uint64_t v6 = sub_100005B44(255LL, a3, a4);
    unint64_t v7 = type metadata accessor for Dependency(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }

uint64_t sub_10001B564()
{
  uint64_t v1 = sub_100005110(&qword_10002FC28);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))( v4,  v0 + OBJC_IVAR____TtC13appleaccountd30AppleIDAvailabilityHealthCheck__accountStore,  v1);
  Dependency.wrappedValue.getter(&v11, v1);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v5 = objc_msgSend(*(id *)(*sub_100005B7C(&v11, *((uint64_t *)&v12 + 1)) + 16), "aa_primaryAppleAccount");
  sub_100004538(&v11);
  if (!v5)
  {
    __int128 v11 = 0u;
    __int128 v12 = 0u;
LABEL_10:
    sub_10000BEA0((uint64_t)&v11);
    return 0LL;
  }

  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 accountPropertyForKey:v6];

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)(v10, v7);
    swift_unknownObjectRelease(v7);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
  }

  sub_10001C6C4((uint64_t)v10, (uint64_t)&v11, &qword_10002F9B0);
  if (!*((void *)&v12 + 1)) {
    goto LABEL_10;
  }
  uint64_t v8 = sub_100005B44(0LL, (unint64_t *)&qword_10002F9B8, &OBJC_CLASS___NSNumber_ptr);
  else {
    return 0LL;
  }
}

unint64_t sub_10001B724(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005110(&qword_1000305A0);
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
    sub_10001C168(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_10001B84C(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    __int128 v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_10000E6AC(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
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

unint64_t sub_10001B84C(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = Hasher._finalize()();
  return sub_10001B8B0(a1, a2, v4);
}

unint64_t sub_10001B8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * i);
    uint64_t v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      unint64_t i = (i + 1) & v13;
      if (((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
      {
        BOOL v14 = (void *)(v9 + 16 * i);
        uint64_t v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v13; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v13)
          {
            uint64_t v17 = (void *)(v9 + 16 * i);
            uint64_t v18 = v17[1];
            if (*v17 == a1 && v18 == a2) {
              break;
            }
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
              break;
            }
          }
        }
      }
    }
  }

  return i;
}

uint64_t sub_10001B9F4(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_10001BA14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001BA34(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_10001BAA4(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_10001BAA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001BB74(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001C0E4((uint64_t)v12, *a3);
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
      sub_10001C0E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100004538(v12);
  return v7;
}

uint64_t sub_10001BB74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001BD2C(a5, a6);
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

uint64_t sub_10001BD2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001BDC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001BF98(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001BF98(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001BDC0(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_10001BF34(v4, 0LL);
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

void *sub_10001BF34(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100005110(&qword_100030580);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  _OWORD v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10001BF98(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005110(&qword_100030580);
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

uint64_t sub_10001C0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10001C120()
{
  unint64_t result = qword_10002EF98;
  if (!qword_10002EF98)
  {
    type metadata accessor for AAError(255LL);
    unint64_t result = swift_getWitnessTable(&unk_100020B1C, v1);
    atomic_store(result, (unint64_t *)&qword_10002EF98);
  }

  return result;
}

uint64_t sub_10001C168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_1000305A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_100005110(&qword_10002F2D8);
  __chkstk_darwin();
  int64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10002ED70 != -1) {
    swift_once(&qword_10002ED70, sub_10000B0D4);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = sub_100004558(v9, (uint64_t)qword_1000327A8);
  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v21 = a1;
    uint64_t v22 = v6;
    uint64_t v13 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v14 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    if (qword_10002ED98 != -1) {
      swift_once(&qword_10002ED98, sub_100017CF4);
    }
    uint64_t v16 = qword_1000302D8;
    unint64_t v15 = unk_1000302E0;
    swift_bridgeObjectRetain(unk_1000302E0);
    uint64_t v23 = sub_10001BAA4(v16, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s - started.", v13, 0xCu);
    swift_arrayDestroy(v14, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1LL, -1LL);
    swift_slowDealloc(v13, -1LL, -1LL);

    a1 = v21;
    uint64_t v6 = v22;
  }

  else
  {
  }

  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v8, 1LL, 1LL, v17);
  uint64_t v18 = (void *)swift_allocObject(&unk_10002A190, 64LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = v3;
  void v18[5] = a1;
  v18[6] = a2;
  v18[7] = v6;
  swift_retain(v3);
  swift_retain(a2);
  uint64_t v19 = sub_100004D24((uint64_t)v8, (uint64_t)&unk_1000305C0, (uint64_t)v18);
  return swift_release(v19);
}

uint64_t sub_10001C41C()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_10001C450(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_1000305BC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_1000051F8;
  return sub_10001857C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10001C4DC(unsigned __int8 a1, void *a2)
{
  int v2 = a1;
  if (a1 == 2)
  {
    BOOL v3 = 0;
  }

  else
  {
    if (a2)
    {
      Class isa = Int._bridgeToObjectiveC()().super.super.isa;
      NSString v6 = String._bridgeToObjectiveC()();
      [a2 setObject:isa forKeyedSubscript:v6];
    }

    BOOL v3 = a2 == 0LL;
  }

  return v3 | ((v2 == 2) << 8);
}

void sub_10001C58C(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  if (a1 != (void *)1)
  {
  }

void *sub_10001C5E4(void *a1, void (*a2)(void, void, void, void, void, void))
{
  return a1;
}

id sub_10001C61C(id result, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  if (result != (id)1)
  {
    uint64_t v8 = result;
    id v9 = a6;
    id v10 = v8;
    id v11 = a2;
    id v12 = a3;
    return a5;
  }

  return result;
}

id *sub_10001C674(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_10001C69C(id *a1)
{
  return a1;
}

uint64_t sub_10001C6C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005110(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

unint64_t sub_10001C708(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005110(&qword_1000306D0);
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
  NSString v6 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *((void *)v6 - 2);
    uint64_t v8 = *((void *)v6 - 1);
    __int128 v16 = *v6;
    swift_bridgeObjectRetain(v8);
    id v9 = (id)v16;
    swift_retain(*((void *)&v16 + 1));
    unint64_t result = sub_10001CF20(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
    *(_OWORD *)(v4[7] + 16 * result) = v16;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
    v6 += 2;
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

unint64_t sub_10001C83C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005110(&qword_10002FC40);
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
  NSString v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v6 - 2);
    uint64_t v8 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_errorRetain(v9);
    unint64_t result = sub_10001CF20(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    id v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
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

unint64_t sub_10001C954(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005110(&qword_100030698);
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
    sub_10001D934(v7, (uint64_t)v16);
    unint64_t result = sub_10001CF84((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = v12;
    unint64_t result = (unint64_t)sub_10000E6AC(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
    v7 += 72LL;
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

char *sub_10001CA80()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v0);
  id v2 = objc_allocWithZone(&OBJC_CLASS___UNUserNotificationCenter);
  uint64_t v3 = v0;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 initWithBundleIdentifier:v4];

  *(void *)&v3[OBJC_IVAR____TtC13appleaccountd22NotificationController_notificationCenter] = v5;
  v31.receiver = v3;
  v31.super_class = ObjectType;
  uint64_t v6 = (char *)objc_msgSendSuper2(&v31, "init");
  NSString v7 = String._bridgeToObjectiveC()();
  sub_100005B44(0LL, &qword_1000306A8, &OBJC_CLASS___UNNotificationAction_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  Class v9 = Array._bridgeToObjectiveC()().super.isa;
  id v10 =  [(id)objc_opt_self(UNNotificationCategory) categoryWithIdentifier:v7 actions:isa intentIdentifiers:v9 options:1];

  uint64_t v11 = OBJC_IVAR____TtC13appleaccountd22NotificationController_notificationCenter;
  __int128 v12 = *(void **)&v6[OBJC_IVAR____TtC13appleaccountd22NotificationController_notificationCenter];
  uint64_t v13 = sub_100005110(&qword_1000306B0);
  uint64_t inited = swift_initStackObject(v13, v30);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_100021C20;
  *(void *)(inited + 32) = v10;
  uint64_t v29 = inited;
  specialized Array._endMutation()();
  if ((unint64_t)v29 >> 62)
  {
    if (v29 < 0) {
      uint64_t v20 = v29;
    }
    else {
      uint64_t v20 = v29 & 0xFFFFFFFFFFFFFF8LL;
    }
    id v21 = v12;
    id v22 = v10;
    __n128 v23 = swift_bridgeObjectRetain(v29);
    uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v20, v23);
    swift_bridgeObjectRelease(v29);
    if (v24) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v19 = &_swiftEmptySetSingleton;
    goto LABEL_9;
  }

  uint64_t v15 = *(void *)((v29 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  id v16 = v12;
  id v17 = v10;
  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  sub_10001D158(v29);
  uint64_t v19 = v18;
LABEL_9:
  swift_bridgeObjectRelease(v29);
  sub_100005B44(0LL, &qword_1000306B8, &OBJC_CLASS___UNNotificationCategory_ptr);
  sub_10001D9EC();
  Class v25 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  [v12 setNotificationCategories:v25];

  uint64_t v26 = *(void **)&v6[v11];
  [v26 setDelegate:v6];
  id v27 = v26;
  [v27 setWantsNotificationResponsesDelivered];

  return v6;
}

id sub_10001CD44()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationController()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd22NotificationController);
}

uint64_t sub_10001CE1C(uint64_t result, _BYTE **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10001CE2C( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_10001CE60(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  NSString v4 = *result;
  _BYTE *v4 = a4;
  *unint64_t result = v4 + 1;
  return result;
}

void sub_10001CE70(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  NSString v7 = (void *)v6;
  uint64_t v8 = *a1 + 8;
  if (v6) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0LL;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  Class v9 = *a2;
  if (*a2)
  {
    *Class v9 = v7;
    *a2 = v9 + 1;
  }

  else
  {
  }

unint64_t sub_10001CF20(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = Hasher._finalize()();
  return sub_10001CFB4(a1, a2, v4);
}

unint64_t sub_10001CF84(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10001D094(a1, v4);
}

unint64_t sub_10001CFB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
        BOOL v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_10001D094(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_10001D97C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10001D9B8((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

void sub_10001D158(uint64_t a1)
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
    __n128 v7 = swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6, v7);
    swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100005110(&qword_1000306C8);
      unint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v8 = v1;
      }
      else {
        uint64_t v8 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      __n128 v9 = swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v8, v9);
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

  unint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return;
  }
LABEL_15:
  uint64_t v10 = (char *)(v4 + 7);
  uint64_t v47 = v5;
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v11 = 0LL;
    uint64_t v45 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v1);
        BOOL v13 = __OFADD__(v11++, 1LL);
        if (v13)
        {
          __break(1u);
          goto LABEL_42;
        }

        uint64_t v14 = v12;
        Swift::Int v15 = NSObject._rawHashValue(seed:)(v4[5]);
        uint64_t v16 = -1LL << *((_BYTE *)v4 + 32);
        unint64_t v17 = v15 & ~v16;
        unint64_t v18 = v17 >> 6;
        uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
        uint64_t v20 = 1LL << v17;
        if (((1LL << v17) & v19) != 0) {
          break;
        }
LABEL_26:
        *(void *)&v10[8 * v18] = v20 | v19;
        *(void *)(v4[6] + 8 * v1sub_100004538(v0 + 7) = v14;
        uint64_t v26 = v4[2];
        BOOL v13 = __OFADD__(v26, 1LL);
        uint64_t v27 = v26 + 1;
        if (v13) {
          goto LABEL_43;
        }
        void v4[2] = v27;
        if (v11 == v5) {
          return;
        }
      }

      sub_100005B44(0LL, &qword_1000306B8, &OBJC_CLASS___UNNotificationCategory_ptr);
      id v21 = *(id *)(v4[6] + 8 * v17);
      char v22 = static NSObject.== infix(_:_:)(v21, v14);

      if ((v22 & 1) == 0)
      {
        uint64_t v23 = ~v16;
        while (1)
        {
          unint64_t v17 = (v17 + 1) & v23;
          unint64_t v18 = v17 >> 6;
          uint64_t v19 = *(void *)&v10[8 * (v17 >> 6)];
          uint64_t v20 = 1LL << v17;
          if ((v19 & (1LL << v17)) == 0) {
            break;
          }
          id v24 = *(id *)(v4[6] + 8 * v17);
          char v25 = static NSObject.== infix(_:_:)(v24, v14);

          if ((v25 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v1 = v45;
        uint64_t v5 = v47;
        goto LABEL_26;
      }

LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

uint64_t sub_10001D4B4(void *a1)
{
  uint64_t v2 = sub_100005110(&qword_100030680);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for URL(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  __n128 v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v36 - v10;
  if (qword_10002ED68 != -1) {
    swift_once(&qword_10002ED68, sub_10000B078);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  sub_100004558(v12, (uint64_t)qword_100032790);
  id v13 = a1;
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v17 = swift_slowAlloc(8LL, -1LL);
    uint64_t v39 = v6;
    uint64_t v40 = (uint64_t)v13;
    uint64_t v36 = (void *)v17;
    id v37 = v16;
    char v38 = v11;
    *(_DWORD *)uint64_t v16 = 138412290;
    id v18 = v13;
    uint64_t v11 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41);
    uint64_t v19 = v36;
    void *v36 = v13;

    uint64_t v20 = v37;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Received notification response: %@", v37, 0xCu);
    uint64_t v21 = sub_100005110(&qword_10002FAB0);
    swift_arrayDestroy(v19, 1LL, v21);
    char v22 = v19;
    uint64_t v6 = v39;
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {
  }

  id v23 = [v13 notification];
  id v24 = [v23 request];

  id v25 = [v24 content];
  id v26 = [v25 defaultActionURL];

  if (v26)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v26);

    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v27(v4, v9, v5);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0LL, 1LL, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) != 1)
    {
      v27(v11, v4, v5);
      uint64_t v28 = (void *)objc_opt_self(&OBJC_CLASS___AFUtilities);
      uint64_t v29 = sub_100005110((uint64_t *)&unk_100030688);
      uint64_t inited = swift_initStackObject(v29, v42);
      *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_100020E10;
      uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(AAFollowUpOpenPrefPaneActionKey);
      uint64_t v41 = v31;
      AnyHashable.init<A>(_:)(&v40, &type metadata for String, &protocol witness table for String);
      *(void *)(inited + 96) = v5;
      uint64_t v32 = sub_100013238((void *)(inited + 72));
      (*(void (**)(void *, char *, uint64_t))(v6 + 16))(v32, v11, v5);
      unint64_t v33 = sub_10001C954(inited);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v33);
      [v28 openAppleIDPrefWithLaunchParameters:isa];

      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    }
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1LL, 1LL, v5);
  }

  return sub_10001D8F4((uint64_t)v4);
}

uint64_t sub_10001D8F4(uint64_t a1)
{
  uint64_t v2 = sub_100005110(&qword_100030680);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10001D934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005110(&qword_1000306A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001D97C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001D9B8(uint64_t a1)
{
  return a1;
}

unint64_t sub_10001D9EC()
{
  unint64_t result = qword_1000306C0;
  if (!qword_1000306C0)
  {
    uint64_t v1 = sub_100005B44(255LL, &qword_1000306B8, &OBJC_CLASS___UNNotificationCategory_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000306C0);
  }

  return result;
}

uint64_t type metadata accessor for AccountStoreFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd19AccountStoreFactory);
}

id sub_10001DA64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DaemonAccountStore();
  uint64_t v3 = swift_allocObject(v2, 32LL, 7LL);
  id result = [(id)objc_opt_self(ACAccountStore) defaultStore];
  if (result)
  {
    *(void *)(v3 + swift_weakDestroy(v0 + 16) = result;
    id result = [(id)objc_opt_self(AKAccountManager) sharedInstance];
    *(void *)(v3 + 24) = result;
    a1[3] = v2;
    *a1 = v3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t type metadata accessor for XPCActivitySchedulerFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd27XPCActivitySchedulerFactory);
}

uint64_t sub_10001DB1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DaemonActivityScheduler();
  uint64_t result = swift_allocObject(v2, 24LL, 7LL);
  *(void *)(result + swift_weakDestroy(v0 + 16) = 0LL;
  a1[3] = v2;
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for CDPFollowUpHandlerFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd25CDPFollowUpHandlerFactory);
}

uint64_t sub_10001DB7C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001DBB4((uint64_t (*)(void))type metadata accessor for DaemonCDPFollowUpHandler, a1);
}

uint64_t type metadata accessor for WalrusPCSSignatureValidatorFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd34WalrusPCSSignatureValidatorFactory);
}

uint64_t sub_10001DBA8@<X0>(uint64_t *a1@<X8>)
{
  return sub_10001DBB4((uint64_t (*)(void))type metadata accessor for WalrusPCSSignatureValidator, a1);
}

uint64_t sub_10001DBB4@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v3 = a1(0LL);
  uint64_t result = swift_allocObject(v3, 16LL, 7LL);
  a2[3] = v3;
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for TapToRadarHelperFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC13appleaccountd23TapToRadarHelperFactory);
}

unint64_t sub_10001DC10@<X0>(void *a1@<X8>)
{
  id v2 = [objc_allocWithZone(AAFTapToRadarHelper) init];
  unint64_t result = sub_10001DC58();
  a1[3] = result;
  *a1 = v2;
  return result;
}

unint64_t sub_10001DC58()
{
  unint64_t result = qword_1000309F8;
  if (!qword_1000309F8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___AAFTapToRadarHelper);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000309F8);
  }

  return result;
}

BOOL static DeviceLockState.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void DeviceLockState.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int DeviceLockState.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

unint64_t sub_10001DD14()
{
  unint64_t result = qword_100030A00;
  if (!qword_100030A00)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for DeviceLockState,  &type metadata for DeviceLockState);
    atomic_store(result, (unint64_t *)&qword_100030A00);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for DeviceLockState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_10001DDA4 + 4 * byte_100021E15[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10001DDD8 + 4 * byte_100021E10[v4]))();
}

uint64_t sub_10001DDD8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001DDE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10001DDE8LL);
  }
  return result;
}

uint64_t sub_10001DDF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10001DDFCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_10001DE00(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001DE08(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceLockState()
{
  return &type metadata for DeviceLockState;
}