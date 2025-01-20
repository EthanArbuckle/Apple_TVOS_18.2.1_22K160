@interface JSUserObject
- (BOOL)isManagedAppleID;
- (BOOL)isUnderThirteen;
- (NSNumber)userAgeIfAvailable;
- (NSString)accountIdentifier;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)lastName;
- (_TtC19appstorecomponentsd12JSUserObject)init;
- (id)cookieForUrlWithName:(id)a3 :(id)a4;
- (id)cookiesForUrl:(id)a3;
@end

@implementation JSUserObject

- (NSString)firstName
{
  return (NSString *)sub_1000B886C(self, (uint64_t)a2, (uint64_t)&unk_1000F06E8);
}

- (NSString)lastName
{
  return (NSString *)sub_1000B886C(self, (uint64_t)a2, (uint64_t)&unk_1000F06B0);
}

- (NSString)accountIdentifier
{
  return (NSString *)sub_1000B886C(self, (uint64_t)a2, (uint64_t)&unk_1000F0678);
}

- (NSString)dsid
{
  v2 = self;
  sub_1000B89F8();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    NSString v5 = 0LL;
  }

  return (NSString *)v5;
}

- (BOOL)isManagedAppleID
{
  uint64_t v3 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v3);
  NSString v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)&self->accounts[OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 16];
  uint64_t v7 = *(void *)&self->accounts[OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 24];
  sub_100029EE0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts), v6);
  v8 = self;
  dispatch thunk of AccountProvider.activeAccount.getter(v6, v7);
  uint64_t v9 = type metadata accessor for Account(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1LL, v9) == 1)
  {
    sub_10002E92C((uint64_t)v5, &qword_10013C6D0);

    return 0;
  }

  else
  {
    uint64_t KeyPath = swift_getKeyPath(&unk_1000F0608);
    Account.subscript.getter(&v15);
    swift_release(KeyPath);
    BOOL v11 = v15;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }

  return v11;
}

- (BOOL)isUnderThirteen
{
  v2 = self;
  char v3 = sub_1000B8CB0();

  return v3 & 1;
}

- (NSNumber)userAgeIfAvailable
{
  return (NSNumber *)0LL;
}

- (id)cookiesForUrl:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8 = sub_1000B8E40(v4, v6);

  swift_bridgeObjectRelease(v6);
  if (v8)
  {
    sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    v9.super.isa = 0LL;
  }

  return v9.super.isa;
}

- (id)cookieForUrlWithName:(id)a3 :(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  v12 = self;
  Class v13 = sub_1000B9124(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
  return v13;
}

- (_TtC19appstorecomponentsd12JSUserObject)init
{
  result = (_TtC19appstorecomponentsd12JSUserObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSUserObject",  32LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end