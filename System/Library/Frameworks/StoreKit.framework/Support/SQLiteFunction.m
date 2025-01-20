@interface SQLiteFunction
+ (_TtC9storekitd14SQLiteFunction)extractJWSPayload;
+ (_TtC9storekitd14SQLiteFunction)unarchiveRenewalInfoAsJSON;
- (BOOL)canCallIndirectly;
- (BOOL)isPure;
- (NSString)name;
- (_TtC9storekitd14SQLiteFunction)init;
- (id)transformSQLWithRoot:(id)a3;
- (int)flags;
- (int64_t)argumentCount;
- (void)withUnsafePropertyPointers:(id)a3;
@end

@implementation SQLiteFunction

- (NSString)name
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (int64_t)argumentCount
{
  return sub_10007DA5C();
}

- (BOOL)isPure
{
  return sub_10007DE08() & 1;
}

- (BOOL)canCallIndirectly
{
  return sub_10007DE44();
}

- (int)flags
{
  return sub_10007DE80();
}

- (void)withUnsafePropertyPointers:(id)a3
{
  NSString v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10007E19C((uint64_t)v5, v4);
  _Block_release(v4);
}

- (_TtC9storekitd14SQLiteFunction)init
{
}

- (void).cxx_destruct
{
}

- (id)transformSQLWithRoot:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_10007EC04(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

+ (_TtC9storekitd14SQLiteFunction)extractJWSPayload
{
  return (_TtC9storekitd14SQLiteFunction *)sub_10011DD6C(&qword_100328B48, (id *)&qword_10033E1C0);
}

+ (_TtC9storekitd14SQLiteFunction)unarchiveRenewalInfoAsJSON
{
  return (_TtC9storekitd14SQLiteFunction *)sub_10011DD6C(&qword_100328B50, (id *)&qword_10033E1C8);
}

@end