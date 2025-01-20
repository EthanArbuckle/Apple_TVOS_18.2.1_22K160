@interface ShowClockIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (ShowClockIntent)init;
- (ShowClockIntent)initWithCoder:(id)a3;
- (ShowClockIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ShowClockIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ShowClockIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (ShowClockIntent)init
{
  return (ShowClockIntent *)ShowClockIntent.init()();
}

- (ShowClockIntent)initWithCoder:(id)a3
{
  id v3 = a3;
  ShowClockIntent.init(coder:)();
  return result;
}

- (ShowClockIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    uint64_t v7 = v6;
  }

  else
  {
    uint64_t v5 = 0LL;
    uint64_t v7 = 0LL;
  }

  id v8 = a4;
  ShowClockIntent.init(identifier:backingStore:)(v5, v7, a4);
  return result;
}

- (ShowClockIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  return (ShowClockIntent *)ShowClockIntent.init(domain:verb:parametersByName:)();
}

@end