@interface RouteRecommendationPlayingStateSuppressor
- (id)suppressionPolicyWithContext:(id)a3;
@end

@implementation RouteRecommendationPlayingStateSuppressor

- (id)suppressionPolicyWithContext:(id)a3
{
  v4 = a3;
  swift_retain(self);
  id v5 = sub_10022816C(v4);

  swift_release(self);
  return v5;
}

@end