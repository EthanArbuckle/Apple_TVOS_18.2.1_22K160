@interface IntentHandler
- (_TtC23IdentityIntentExtension13IntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation IntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003740((uint64_t)v4, v10);

  uint64_t v6 = v11;
  v7 = sub_100003ADC(v10, v11);
  v8 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  sub_100003B00(v10);
  return v8;
}

- (_TtC23IdentityIntentExtension13IntentHandler)init
{
  return (_TtC23IdentityIntentExtension13IntentHandler *)sub_100003A38();
}

@end