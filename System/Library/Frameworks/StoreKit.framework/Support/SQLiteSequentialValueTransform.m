@interface SQLiteSequentialValueTransform
+ (id)composingTransforms:(id)a3;
- (_TtC9storekitd30SQLiteSequentialValueTransform)init;
- (id)transformSQLWithRoot:(id)a3;
- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteSequentialValueTransform

+ (id)composingTransforms:(id)a3
{
  uint64_t v5 = sub_10007B1FC((uint64_t *)&unk_10032B5E0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  id v7 = sub_1000EB2B8(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (_TtC9storekitd30SQLiteSequentialValueTransform)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC9storekitd30SQLiteSequentialValueTransform_components));
}

- (id)transformSQLWithRoot:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  id v7 = self;
  sub_1000EB3D4(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4
{
  id v7 = self;
  sub_1000EB590((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease(a3);
}

@end