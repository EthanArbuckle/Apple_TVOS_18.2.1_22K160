@interface JSClientOrderingObject
- (_TtC19appstorecomponentsd22JSClientOrderingObject)init;
- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7;
- (void)visibilityForIAPs:(id)a3 :(id)a4;
@end

@implementation JSClientOrderingObject

- (_TtC19appstorecomponentsd22JSClientOrderingObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[JSClientOrderingObject init](&v3, "init");
}

- (void)orderedVisibleIAPs:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v10 = a4;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v13 = v12;
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v13 = 0LL;
  if (a4) {
LABEL_3:
  }
    id v10 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, &type metadata for String);
LABEL_4:
  if (a5) {
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  }
  if (a6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v14;
  }

  id v15 = a7;
  v16 = self;
  sub_10009BB78();
  id v18 = (id)static JSContext.requiredCurrent.getter();
  v17 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_10009F34C, 0LL);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a6);
}

- (void)visibilityForIAPs:(id)a3 :(id)a4
{
  id v6 = a4;
  v7 = self;
  id v9 = (id)static JSContext.requiredCurrent.getter();
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_10009F490, 0LL);
}

@end