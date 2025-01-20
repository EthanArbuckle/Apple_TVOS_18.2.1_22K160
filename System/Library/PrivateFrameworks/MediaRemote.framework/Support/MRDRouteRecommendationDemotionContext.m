@interface MRDRouteRecommendationDemotionContext
- (BOOL)isASELocal;
- (BOOL)isSourceEndpointPlaying;
- (BOOL)isTargetEndpointPlaying;
- (BOOL)localOutputContextHasAirPlay;
- (MRDRouteRecommendationDemotionContext)init;
- (MRDRouteRecommendationDemotionContext)initWithPrimaryBundleIdentifier:(id)a3 recommendationType:(int64_t)a4 isASELocal:(BOOL)a5 localOutputContextHasAirPlay:(BOOL)a6 isSourceEndpointPlaying:(BOOL)a7 isTargetEndpointPlaying:(BOOL)a8 targetNowPlayingBundleIdentifier:(id)a9 targetEndpointContainsDiscoverableGroupLeader:(BOOL)a10;
- (NSString)primaryBundleIdentifier;
- (NSString)targetNowPlayingBundleIdentifier;
- (int64_t)recommendationType;
- (void)setIsASELocal:(BOOL)a3;
- (void)setIsSourceEndpointPlaying:(BOOL)a3;
- (void)setIsTargetEndpointPlaying:(BOOL)a3;
- (void)setLocalOutputContextHasAirPlay:(BOOL)a3;
- (void)setPrimaryBundleIdentifier:(id)a3;
- (void)setRecommendationType:(int64_t)a3;
- (void)setTargetNowPlayingBundleIdentifier:(id)a3;
@end

@implementation MRDRouteRecommendationDemotionContext

- (NSString)primaryBundleIdentifier
{
  v2 = (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_primaryBundleIdentifier;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_primaryBundleIdentifier,  v6,  0LL,  0LL);
  uint64_t v3 = *((void *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setPrimaryBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_primaryBundleIdentifier);
  swift_beginAccess(v7, v9, 1LL, 0LL);
  uint64_t v8 = v7[1];
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (int64_t)recommendationType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_recommendationType);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_recommendationType, v4, 0LL, 0LL);
  return *v2;
}

- (void)setRecommendationType:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_recommendationType);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_recommendationType, v5, 1LL, 0LL);
  *uint64_t v4 = a3;
}

- (BOOL)isASELocal
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isASELocal;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isASELocal, v4, 0LL, 0LL);
  return *v2;
}

- (void)setIsASELocal:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isASELocal;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isASELocal, v5, 1LL, 0LL);
  *uint64_t v4 = a3;
}

- (BOOL)localOutputContextHasAirPlay
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_localOutputContextHasAirPlay;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_localOutputContextHasAirPlay,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setLocalOutputContextHasAirPlay:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_localOutputContextHasAirPlay;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_localOutputContextHasAirPlay,  v5,  1LL,  0LL);
  *uint64_t v4 = a3;
}

- (BOOL)isSourceEndpointPlaying
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isSourceEndpointPlaying;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isSourceEndpointPlaying,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setIsSourceEndpointPlaying:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isSourceEndpointPlaying;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isSourceEndpointPlaying,  v5,  1LL,  0LL);
  *uint64_t v4 = a3;
}

- (BOOL)isTargetEndpointPlaying
{
  v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isTargetEndpointPlaying;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isTargetEndpointPlaying,  v4,  0LL,  0LL);
  return *v2;
}

- (void)setIsTargetEndpointPlaying:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isTargetEndpointPlaying;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isTargetEndpointPlaying,  v5,  1LL,  0LL);
  *uint64_t v4 = a3;
}

- (NSString)targetNowPlayingBundleIdentifier
{
  v2 = (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_targetNowPlayingBundleIdentifier;
  swift_beginAccess( (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_targetNowPlayingBundleIdentifier,  v6,  0LL,  0LL);
  uint64_t v3 = *((void *)v2 + 1);
  if (!v3) {
    return (NSString *)0LL;
  }
  swift_bridgeObjectRetain(v3);
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setTargetNowPlayingBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_targetNowPlayingBundleIdentifier);
  swift_beginAccess(v7, v9, 1LL, 0LL);
  uint64_t v8 = v7[1];
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (MRDRouteRecommendationDemotionContext)initWithPrimaryBundleIdentifier:(id)a3 recommendationType:(int64_t)a4 isASELocal:(BOOL)a5 localOutputContextHasAirPlay:(BOOL)a6 isSourceEndpointPlaying:(BOOL)a7 isTargetEndpointPlaying:(BOOL)a8 targetNowPlayingBundleIdentifier:(id)a9 targetEndpointContainsDiscoverableGroupLeader:(BOOL)a10
{
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v17 = v16;
  if (a9)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  }

  else
  {
    uint64_t v19 = 0LL;
    uint64_t v18 = 0LL;
  }

  return (MRDRouteRecommendationDemotionContext *)sub_1002A1CB8(v15, v17, a4, a5, a6, a7, a8, v19, v18, a10);
}

- (MRDRouteRecommendationDemotionContext)init
{
  result = (MRDRouteRecommendationDemotionContext *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.RouteRecommendationDemotionContext",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end