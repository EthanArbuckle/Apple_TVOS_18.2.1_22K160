@interface SQLiteExtractJSONTransform
+ (id)extractJSONAtKey:(id)a3;
- (_TtC9storekitd26SQLiteExtractJSONTransform)init;
- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithIndex:(int64_t)a3;
- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKey:(id)a3;
- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKeyPath:(id)a3;
- (id)appending:(id)a3;
- (id)appendingWithIndex:(int64_t)a3;
- (id)appendingWithKey:(id)a3;
- (id)transformSQLWithRoot:(id)a3;
- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteExtractJSONTransform

- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_1000F80E4(v3, v4);
  return result;
}

- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithIndex:(int64_t)a3
{
  return (_TtC9storekitd26SQLiteExtractJSONTransform *)sub_1000F818C(a3);
}

- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKeyPath:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  return (_TtC9storekitd26SQLiteExtractJSONTransform *)sub_1000F8254(v3);
}

+ (id)extractJSONAtKey:(id)a3
{
  uint64_t v5 = v4;
  swift_getObjCClassMetadata(a1);
  sub_1000F83C4();
  v7 = v6;
  swift_bridgeObjectRelease(v5);
  return v7;
}

- (id)appendingWithKey:(id)a3
{
  uint64_t v5 = v4;
  v6 = self;
  id v7 = sub_1000F845C();

  swift_bridgeObjectRelease(v5);
  return v7;
}

- (id)appendingWithIndex:(int64_t)a3
{
  uint64_t v4 = self;
  sub_1000F8544(a3);
  v6 = v5;

  return v6;
}

- (id)appending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000F85DC((uint64_t)v4);
  id v7 = v6;

  return v7;
}

- (_TtC9storekitd26SQLiteExtractJSONTransform)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9storekitd26SQLiteExtractJSONTransform_keyPath));
}

- (id)transformSQLWithRoot:(id)a3
{
  uint64_t v5 = v4;
  v6 = self;
  sub_1000F86F0();
  uint64_t v8 = v7;

  swift_bridgeObjectRelease(v5);
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return v9;
}

- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4
{
  uint64_t v7 = self;
  sub_1000F893C(a3, (unsigned int *)a4);
  swift_unknownObjectRelease(a3);
}

@end