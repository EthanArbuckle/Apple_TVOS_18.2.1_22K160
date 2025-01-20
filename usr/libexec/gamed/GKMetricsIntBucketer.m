@interface GKMetricsIntBucketer
- (GKMetricsIntBucketer)init;
- (GKMetricsIntBucketer)initWithBuckets:(id)a3;
- (int64_t)clamp:(int64_t)a3;
@end

@implementation GKMetricsIntBucketer

- (GKMetricsIntBucketer)initWithBuckets:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Int);
  return (GKMetricsIntBucketer *)MetricsIntBucketer.init(buckets:)(v3);
}

- (int64_t)clamp:(int64_t)a3
{
  return MetricsIntBucketer.clamp(_:)(a3);
}

- (GKMetricsIntBucketer)init
{
}

- (void).cxx_destruct
{
}

@end