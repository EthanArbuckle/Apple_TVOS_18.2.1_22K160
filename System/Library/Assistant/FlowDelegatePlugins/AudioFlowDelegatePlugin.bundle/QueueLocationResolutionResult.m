@interface QueueLocationResolutionResult
+ (id)confirmationRequiredWithQueueLocationToConfirm:(int64_t)a3;
+ (id)successWithResolvedQueueLocation:(int64_t)a3;
- (QueueLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation QueueLocationResolutionResult

+ (id)successWithResolvedQueueLocation:(int64_t)a3
{
  return static QueueLocationResolutionResult.success(with:)(a3);
}

+ (id)confirmationRequiredWithQueueLocationToConfirm:(int64_t)a3
{
  return static QueueLocationResolutionResult.confirmationRequired(with:)(a3);
}

- (QueueLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  id v7 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for QueueLocationResolutionResult();
  v9 = -[QueueLocationResolutionResult initWithJSONDictionary:forIntent:]( &v12,  "initWithJSONDictionary:forIntent:",  isa,  v7);

  v10 = v9;
  if (v10) {

  }
  return v10;
}

@end