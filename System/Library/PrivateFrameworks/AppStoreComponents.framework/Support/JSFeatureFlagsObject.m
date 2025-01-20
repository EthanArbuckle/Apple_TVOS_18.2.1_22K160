@interface JSFeatureFlagsObject
- (_TtC19appstorecomponentsd20JSFeatureFlagsObject)init;
- (id)isEnabled:(id)a3;
@end

@implementation JSFeatureFlagsObject

- (_TtC19appstorecomponentsd20JSFeatureFlagsObject)init
{
  return (_TtC19appstorecomponentsd20JSFeatureFlagsObject *)sub_1000A0CE0();
}

- (id)isEnabled:(id)a3
{
  id v5 = a3;
  v6 = self;
  v7 = (void *)static JSContext.requiredCurrent.getter();
  v10[2] = v5;
  v10[3] = v6;
  v8 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000A1004, v10);

  return v8;
}

- (void).cxx_destruct
{
}

@end