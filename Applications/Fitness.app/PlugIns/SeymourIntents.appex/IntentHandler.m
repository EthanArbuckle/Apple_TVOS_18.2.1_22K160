@interface IntentHandler
- (_TtC14SeymourIntents13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for IntentDispatcher(0LL, a2));
  id v6 = a3;
  v7 = self;
  id v8 = [v5 init];
  id v9 = [v8 handlerForIntent:v6];

  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(v17, v9);
    swift_unknownObjectRelease(v9);
  }

  else
  {
    memset(v17, 0, sizeof(v17));
  }

  sub_100003CDC((uint64_t)v17, (uint64_t)v18);

  uint64_t v10 = v19;
  if (!v19) {
    return 0LL;
  }
  v11 = sub_100003D64(v18, v19);
  uint64_t v12 = *(void *)(v10 - 8);
  __chkstk_darwin(v11, v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v12 + 16))(v14);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  sub_100003D88(v18);
  return v15;
}

- (_TtC14SeymourIntents13IntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IntentHandler();
  return -[IntentHandler init](&v3, "init");
}

@end