@interface MRDRouteRecommendationDemotionController
+ (id)controller;
- (MRDRouteRecommendationDemotionController)init;
- (id)demotionPolicyWithContext:(id)a3;
@end

@implementation MRDRouteRecommendationDemotionController

+ (id)controller
{
  uint64_t v4 = type metadata accessor for MediaAppInFocusMonitor();
  v5 = &off_1003A7658;
  v3[0] = swift_allocObject(v4, 16LL, 7LL);
  return sub_1002A209C(v3);
}

- (id)demotionPolicyWithContext:(id)a3
{
  uint64_t v4 = a3;
  v5 = self;
  id v6 = sub_1002A212C(v4);

  return v6;
}

- (MRDRouteRecommendationDemotionController)init
{
  result = (MRDRouteRecommendationDemotionController *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationDemotionController",  50LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001607E0((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___MRDRouteRecommendationDemotionController_appInFocusMonitor));
}

@end