@interface GKRecommendationEntryCacheObject
+ (id)entityName;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKRecommendationEntryCacheObject

+ (id)entityName
{
  return @"RecommendationEntry";
}

- (void)updateWithServerRepresentation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKRecommendationEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v4, "updateWithServerRepresentation:", a3);
  -[GKRecommendationEntryCacheObject setViewed:](self, "setViewed:", 0LL);
  -[GKRecommendationEntryCacheObject setDisplayedToUser:](self, "setDisplayedToUser:", 0LL);
}

@end