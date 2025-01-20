@interface MRDRouteRecommendationDemotionPolicy
- (BOOL)shouldDemote;
- (MRDRouteRecommendationDemotionPolicy)init;
- (NSString)reason;
@end

@implementation MRDRouteRecommendationDemotionPolicy

- (BOOL)shouldDemote
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDRouteRecommendationDemotionPolicy_shouldDemote);
}

- (NSString)reason
{
  uint64_t v2 = *(void *)&self->shouldDemote[OBJC_IVAR___MRDRouteRecommendationDemotionPolicy_reason];
  if (v2)
  {
    swift_bridgeObjectRetain(*(void *)&self->shouldDemote[OBJC_IVAR___MRDRouteRecommendationDemotionPolicy_reason]);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    NSString v3 = 0LL;
  }

  return (NSString *)v3;
}

- (MRDRouteRecommendationDemotionPolicy)init
{
  result = (MRDRouteRecommendationDemotionPolicy *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationDemotionPolicy",  46LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end