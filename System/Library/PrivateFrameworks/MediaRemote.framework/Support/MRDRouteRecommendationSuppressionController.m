@interface MRDRouteRecommendationSuppressionController
+ (MRDRouteRecommendationSuppressionController)controller;
- (MRDRouteRecommendationSuppressionController)init;
- (id)suppressionPolicyWithContext:(id)a3;
@end

@implementation MRDRouteRecommendationSuppressionController

+ (MRDRouteRecommendationSuppressionController)controller
{
  return (MRDRouteRecommendationSuppressionController *)(id)sub_100174E10();
}

- (id)suppressionPolicyWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100216AD0((uint64_t)v4);

  return v6;
}

- (MRDRouteRecommendationSuppressionController)init
{
  result = (MRDRouteRecommendationSuppressionController *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationSuppressionController",  53LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___MRDRouteRecommendationSuppressionController_suppressors));
}

@end