@interface IntentHandler
- (_TtC21TimerIntentsExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100002C88(v4, v10);

  uint64_t v6 = v11;
  v7 = sub_100002F84(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  sub_100002FA8(v10);
  return v8;
}

- (_TtC21TimerIntentsExtension13IntentHandler)init
{
  return (_TtC21TimerIntentsExtension13IntentHandler *)sub_100002EE4();
}

@end