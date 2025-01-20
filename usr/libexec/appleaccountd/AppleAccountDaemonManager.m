@interface AppleAccountDaemonManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (_TtC13appleaccountd25AppleAccountDaemonManager)init;
- (void)cacheLoginResponse:(AALoginAccountResponse *)a3 forAccount:(ACAccount *)a4 completion:(id)a5;
- (void)configureExportedInterface:(id)a3;
- (void)fetchCachedLoginResponseForAccount:(ACAccount *)a3 completion:(id)a4;
- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4;
- (void)urlConfigurationWithCompletion:(id)a3;
@end

@implementation AppleAccountDaemonManager

- (_TtC13appleaccountd25AppleAccountDaemonManager)init
{
  result = (_TtC13appleaccountd25AppleAccountDaemonManager *)_swift_stdlib_reportUnimplementedInitializer( "appleaccountd.AppleAccountDaemonManager",  39LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_10000DEAC((uint64_t)v7);

  return v9 & 1;
}

- (NSString)serviceName
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AADaemonProtocol;
}

- (void)configureExportedInterface:(id)a3
{
  uint64_t v5 = sub_10000DD78();
  uint64_t inited = swift_initStackObject(v5, v9);
  *(_OWORD *)(inited + 16) = xmmword_100020E10;
  *(void *)(inited + 32) = sub_100005B44(0LL, &qword_10002FAE0, &OBJC_CLASS___ACAccount_ptr);
  id v7 = a3;
  v8 = self;
  NSXPCInterface.aa_setClasses(_:for:argumentIndex:ofReply:)( inited,  (uint64_t)"handleAppleAccountDeleteForAccount:completion:",  0LL,  0);
  swift_setDeallocating(inited);
}

- (void)handleAppleAccountDeleteForAccount:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10000E150(v7, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)cacheLoginResponse:(AALoginAccountResponse *)a3 forAccount:(ACAccount *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100005110(&qword_10002F2D8);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject(&unk_100029B10, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  v15 = (void *)swift_allocObject(&unk_100029B38, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10002FAC0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_100029B60, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10002FAC8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  uint64_t v20 = sub_10000DBA0((uint64_t)v11, (uint64_t)&unk_10002FAD0, (uint64_t)v16);
  swift_release(v20);
}

- (void)fetchCachedLoginResponseForAccount:(ACAccount *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100005110(&qword_10002F2D8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_100029A70, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_100029A98, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10002FA68;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject(&unk_100029AC0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10002FA78;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_10000DBA0((uint64_t)v9, (uint64_t)&unk_10002FA88, (uint64_t)v14);
  swift_release(v17);
}

- (void)urlConfigurationWithCompletion:(id)a3
{
  NSString v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100029A48, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_10000D7A4((uint64_t)sub_10000D9A0, v5);

  swift_release(v5);
}

@end