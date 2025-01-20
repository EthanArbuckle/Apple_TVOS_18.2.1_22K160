@interface Bag.XcodeBag
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (_TtCC9storekitd3BagP33_548B24E65CA9FE1CAECE2177332C57EA8XcodeBag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpired:(BOOL)a3;
@end

@implementation Bag.XcodeBag

- (BOOL)isExpired
{
  return sub_10012EAC8() & 1;
}

- (void)setExpired:(BOOL)a3
{
}

- (NSDate)expirationDate
{
  uint64_t v2 = sub_10007B1FC((uint64_t *)&unk_10032C410);
  __chkstk_darwin(v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10012EBC0((uint64_t)v4);
  uint64_t v5 = type metadata accessor for Date(0LL);
  Class isa = 0LL;
  if (sub_10007D824((uint64_t)v4, 1LL, v5) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }

  return (NSDate *)isa;
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v5 = sub_10007B1FC((uint64_t *)&unk_10032C410);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = type metadata accessor for Date(0LL);
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v8 = type metadata accessor for Date(0LL);
    uint64_t v9 = 1LL;
  }

  sub_10007D0AC((uint64_t)v7, v9, 1LL, v8);
  v10 = self;
  sub_10012ECD4((uint64_t)v7);
}

- (NSString)profile
{
  uint64_t v2 = self;
  sub_10012CF34();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)profileVersion
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012FD28(v4);

  return v6;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10012FD7C(v4);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10012FDD0((uint64_t)v5, (void (**)(const void *, unint64_t, void *))v4);
  _Block_release(v4);
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1001305EC(v4);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100130640(v4);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100130694(v4);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1001306E8(v4);

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10013073C(v4);

  return v6;
}

- (_TtCC9storekitd3BagP33_548B24E65CA9FE1CAECE2177332C57EA8XcodeBag)init
{
}

  ;
}

- (void).cxx_destruct
{
}

@end