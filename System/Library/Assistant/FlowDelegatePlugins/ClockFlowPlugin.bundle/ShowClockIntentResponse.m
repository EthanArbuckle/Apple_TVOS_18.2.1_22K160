@interface ShowClockIntentResponse
- (ShowClockIntentResponse)init;
- (ShowClockIntentResponse)initWithBackingStore:(id)a3;
- (ShowClockIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ShowClockIntentResponse)initWithCoder:(id)a3;
- (ShowClockIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ShowClockIntentResponse

- (int64_t)code
{
  return ShowClockIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (ShowClockIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (ShowClockIntentResponse *)ShowClockIntentResponse.init(code:userActivity:)(a3, a4);
}

- (ShowClockIntentResponse)init
{
  return (ShowClockIntentResponse *)ShowClockIntentResponse.init()();
}

- (ShowClockIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  ShowClockIntentResponse.init(coder:)();
  return result;
}

- (ShowClockIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  ShowClockIntentResponse.init(backingStore:)();
  return result;
}

- (ShowClockIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  else {
    uint64_t v3 = 0LL;
  }
  ShowClockIntentResponse.init(propertiesByName:)(v3);
  return result;
}

@end