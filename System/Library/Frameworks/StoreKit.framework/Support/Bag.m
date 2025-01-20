@interface Bag
+ (AMSBagProtocol)defaultBag;
+ (AMSBagProtocol)sandboxBag;
+ (id)xcodeBagWithBundleId:(id)a3;
+ (void)setDefaultBag:(id)a3;
+ (void)setSandboxBag:(id)a3;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (_TtC9storekitd3Bag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation Bag

- (NSString)profile
{
  v2 = self;
  sub_10012CF34();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)profileVersion
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE100000000000000LL);
  return (NSString *)v2;
}

- (BOOL)isExpired
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_10012CFBC();

  return v3 & 1;
}

- (NSDate)expirationDate
{
  uint64_t v3 = sub_10007B1FC((uint64_t *)&unk_10032C410);
  __chkstk_darwin(v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v6 = self;
  sub_10012D0A4((uint64_t)v5);

  uint64_t v7 = type metadata accessor for Date(0LL);
  Class isa = 0LL;
  if (sub_10007D824((uint64_t)v5, 1LL, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v5, v7);
  }

  return (NSDate *)isa;
}

+ (AMSBagProtocol)defaultBag
{
  return (AMSBagProtocol *)(id)sub_10012D224(&qword_100328D48, &qword_10033E3D0);
}

+ (void)setDefaultBag:(id)a3
{
  uint64_t v3 = swift_unknownObjectRetain(a3);
  sub_10012D2A4(v3, &qword_100328D48, &qword_10033E3D0, (uint64_t)sub_10012D118);
}

+ (AMSBagProtocol)sandboxBag
{
  return (AMSBagProtocol *)(id)sub_10012D224(&qword_100328D50, &qword_10033E3D8);
}

+ (void)setSandboxBag:(id)a3
{
  uint64_t v3 = swift_unknownObjectRetain(a3);
  sub_10012D2A4(v3, &qword_100328D50, &qword_10033E3D8, (uint64_t)sub_10012D1C0);
}

+ (id)xcodeBagWithBundleId:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_10012D31C(v3, v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10012D518((uint64_t)v4);

  return v6;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10012D594((uint64_t)v4);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1002EF360, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_10012D610((uint64_t)sub_100134124, v5);

  swift_release(v5);
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012D770((uint64_t)v4);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012D7EC((uint64_t)v4);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012D868((uint64_t)v4);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012D8E4((uint64_t)v4);

  return v6;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10012D960((uint64_t)v6, (uint64_t)a4);
  uint64_t v10 = v9;

  return v10;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012DA50((uint64_t)v4);

  return v6;
}

- (_TtC9storekitd3Bag)init
{
}

- (void).cxx_destruct
{
}

@end