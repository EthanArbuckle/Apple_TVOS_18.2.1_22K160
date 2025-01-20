@interface MRDRouteRecommendationSuppressionPolicy
- (BOOL)shouldSuppress;
- (MRDRouteRecommendationSuppressionPolicy)init;
- (NSString)reason;
@end

@implementation MRDRouteRecommendationSuppressionPolicy

- (BOOL)shouldSuppress
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDRouteRecommendationSuppressionPolicy_shouldSuppress);
}

- (NSString)reason
{
  uint64_t v2 = *(void *)&self->shouldSuppress[OBJC_IVAR___MRDRouteRecommendationSuppressionPolicy_reason];
  if (v2)
  {
    swift_bridgeObjectRetain(*(void *)&self->shouldSuppress[OBJC_IVAR___MRDRouteRecommendationSuppressionPolicy_reason]);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    NSString v3 = 0LL;
  }

  return (NSString *)v3;
}

- (MRDRouteRecommendationSuppressionPolicy)init
{
  result = (MRDRouteRecommendationSuppressionPolicy *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationSuppressionPolicy",  49LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end