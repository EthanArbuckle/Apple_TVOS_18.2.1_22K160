@interface MessageServiceReachabilityDelegate
- (BOOL)isUsableForSending;
- (_TtC8iMessage34MessageServiceReachabilityDelegate)init;
- (_TtC8iMessage34MessageServiceReachabilityDelegate)initWithServiceSession:(id)a3;
- (uint64_t)maxChatParticipantsForContext:;
@end

@implementation MessageServiceReachabilityDelegate

- (BOOL)isUsableForSending
{
  uint64_t v3 = sub_8448C(0LL, &qword_E2F60, &off_D4F88);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v3);
  v5 = self;
  id v6 = [ObjCClassFromMetadata idsAccounts];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = sub_8448C(0LL, &qword_E2F68, &OBJC_CLASS___IDSAccount_ptr);
    unint64_t v9 = sub_844C4();
    uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9);

    sub_83A80(v10);
    LOBYTE(v7) = v11;

    swift_bridgeObjectRelease(v10);
    LOBYTE(v6) = v7 & 1;
  }

  else
  {
    __break(1u);
  }

  return (char)v6;
}

- (_TtC8iMessage34MessageServiceReachabilityDelegate)init
{
  result = (_TtC8iMessage34MessageServiceReachabilityDelegate *)_swift_stdlib_reportUnimplementedInitializer( "iMessage.MessageServiceReachabilityDelegate",  43LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (_TtC8iMessage34MessageServiceReachabilityDelegate)initWithServiceSession:(id)a3
{
  id v3 = a3;
  result = (_TtC8iMessage34MessageServiceReachabilityDelegate *)_swift_stdlib_reportUnimplementedInitializer( "iMessage.MessageServiceReachabilityDelegate",  43LL,  "init(serviceSession:)",  21LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (uint64_t)maxChatParticipantsForContext:
{
  id v0 = [(id)objc_opt_self(IDSServerBag) sharedInstanceForBagType:1];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);

    swift_unknownObjectRelease(v2);
  }

  else
  {

    memset(v5, 0, sizeof(v5));
  }

  sub_84588((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_845D0((uint64_t)v6);
    return -1LL;
  }

  if (v4 <= 10) {
    return -1LL;
  }
  else {
    return v4;
  }
}

@end