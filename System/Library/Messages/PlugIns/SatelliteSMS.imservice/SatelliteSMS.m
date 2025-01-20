uint64_t sub_2D20()
{
  uint64_t v0;
  id v1;
  v0 = type metadata accessor for Logger(0LL);
  sub_350C(v0, qword_82C8);
  sub_2DD4(v0, (uint64_t)qword_82C8);
  v1 = [(id)objc_opt_self(SatelliteSMSUtilities) logger];
  return Logger.init(_:)(v1);
}

uint64_t sub_2D8C()
{
  if (qword_8288 != -1) {
    swift_once(&qword_8288, sub_2D20);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_2DD4(v0, (uint64_t)qword_82C8);
}

uint64_t sub_2DD4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2DEC@<X0>(uint64_t a1@<X8>)
{
  if (qword_8288 != -1) {
    swift_once(&qword_8288, sub_2D20);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_2DD4(v2, (uint64_t)qword_82C8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16LL))(a1, v3, v2);
}

uint64_t sub_2E5C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_350C(v0, qword_8298);
  uint64_t v1 = sub_2DD4(v0, (uint64_t)qword_8298);
  if (qword_8288 != -1) {
    swift_once(&qword_8288, sub_2D20);
  }
  uint64_t v2 = sub_2DD4(v0, (uint64_t)qword_82C8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16LL))(v1, v2, v0);
}

id SatelliteSMSServiceSession.init(account:service:replicatingFor:)(void *a1, void *a2, void *a3)
{
  id v7 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3)) initWithAccount:a1 service:a2 replicatingForSession:a3];

  return v7;
}

{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  os_log_s *v11;
  os_log_type_t v12;
  uint8_t *v13;
  objc_super v15;
  v15.super_class = (Class)&OBJC_CLASS___SatelliteSMSServiceSession;
  v6 = objc_msgSendSuper2(&v15, "initWithAccount:service:replicatingForSession:", a1, a2, a3);
  id v7 = (void *)objc_opt_self(&OBJC_CLASS___IMDRelayPushHandler);
  v8 = v6;
  v9 = [v7 sharedInstance];
  [v9 addListener:v8];

  if (qword_8290 != -1) {
    swift_once(&qword_8290, sub_2E5C);
  }
  v10 = type metadata accessor for Logger(0LL);
  sub_2DD4(v10, (uint64_t)qword_8298);
  v11 = (os_log_s *)Logger.logObject.getter();
  v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_0, v11, v12, "SatelliteSMSServiceSession is ready to go!", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  return v8;
}

void SatelliteSMSServiceSession.calculateReachability(with:responseHandler:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (qword_8290 != -1) {
    swift_once(&qword_8290, sub_2E5C);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_2DD4(v6, (uint64_t)qword_8298);
  id v7 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "Can't send over SatelliteSMS, unsupported platform", v9, 2u);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  id v10 = [v3 service];
  NSString v11 = [v10 internalName];

  if (!v11)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL, v12);
    uint64_t v14 = v13;
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v14);
  }

  Class isa = (Class)[a1 handleIDs];
  if (!isa)
  {
    uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0LL, &type metadata for String);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v16);
  }

  id v17 =  [(id)objc_opt_self(IMServiceReachabilityResult) finalResultForService:v11 handleIDs:isa allAreReachable:0 checkedServer:0 error:3];

  [a2 reachabilityRequest:a1 updatedWithResult:v17];
}

uint64_t SatelliteSMSServiceSession.shouldExcludeChat(fromRelay:)()
{
  return 1LL;
}

Swift::Int __swiftcall SatelliteSMSServiceSession.maxRecipients(forPhoneNumber:simID:)( Swift::String forPhoneNumber, Swift::String simID)
{
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___IMCTSMSUtilities);
  NSString v3 = String._bridgeToObjectiveC()();
  NSString v4 = String._bridgeToObjectiveC()();
  signed int v5 = [v2 IMMMSMaxRecipientsForPhoneNumber:v3 simID:v4];

  return v5;
}

unint64_t type metadata accessor for SatelliteSMSServiceSession()
{
  unint64_t result = qword_82B0;
  if (!qword_82B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SatelliteSMSServiceSession);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_82B0);
  }

  return result;
}

uint64_t *sub_350C(uint64_t a1, uint64_t *a2)
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

void sub_354C()
{
  id v0 = [(id)objc_opt_self(IMLockdownManager) sharedInstance];
  if (v0)
  {
    uint64_t v1 = v0;
    unsigned int v2 = [v0 isInternalInstall];

    if (v2)
    {
      NSString v3 = String._bridgeToObjectiveC()();
      NSString v4 = String._bridgeToObjectiveC()();
      id v5 = (id)IMGetDomainValueForKey(v3, v4);

      if (v5)
      {
        _bridgeAnyObjectToAny(_:)(&v13, v5);
        swift_unknownObjectRelease(v5);
      }

      else
      {
        __int128 v13 = 0u;
        __int128 v14 = 0u;
      }

      sub_379C((uint64_t)&v13, (uint64_t)v15);
      if (v16)
      {
        unint64_t v6 = sub_3864();
      }

      else
      {
        sub_3824((uint64_t)v15);
      }
    }

    id v7 = [(id)objc_opt_self(IDSServerBag) sharedInstanceForBagType:1];
    NSString v8 = String._bridgeToObjectiveC()();
    id v9 = [v7 objectForKey:v8];

    if (v9)
    {
      _bridgeAnyObjectToAny(_:)(&v13, v9);
      swift_unknownObjectRelease(v9);
    }

    else
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
    }

    sub_379C((uint64_t)&v13, (uint64_t)v15);
    if (v16)
    {
      unint64_t v10 = sub_3864();
      if ((swift_dynamicCast(&v12, v15, (char *)&type metadata for Any + 8, v10, 6LL) & 1) != 0)
      {
LABEL_15:
        id v11 = v12;
        [v12 doubleValue];
      }
    }

    else
    {
      sub_3824((uint64_t)v15);
    }
  }

  else
  {
    __break(1u);
  }
}

uint64_t sub_379C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_37E4(&qword_8278);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_37E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_3824(uint64_t a1)
{
  uint64_t v2 = sub_37E4(&qword_8278);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_3864()
{
  unint64_t result = qword_8280;
  if (!qword_8280)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_8280);
  }

  return result;
}

void sub_38E0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Messages", "SatelliteSMS");
  uint64_t v2 = (void *)qword_82B8;
  qword_82B8 = (uint64_t)v1;
}