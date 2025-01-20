@interface RouteRecommendationLocalOutputContextSuppressor
- (id)suppressionPolicyWithContext:(id)a3;
@end

@implementation RouteRecommendationLocalOutputContextSuppressor

- (id)suppressionPolicyWithContext:(id)a3
{
  v4 = a3;
  swift_retain(self);
  id v5 = sub_10021659C(v4);

  swift_release(self);
  return v5;
}

@end