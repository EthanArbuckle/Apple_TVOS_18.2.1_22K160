@interface MRDBundleMediaRecommendationEligibility
- (BOOL)isEligible;
- (BOOL)isEligibleForAutoRoute;
- (BOOL)isEligibleForCallToAction;
- (BOOL)isEligibleForOneTapSuggestion;
- (BOOL)isVideoApp;
- (MRDBundleMediaRecommendationEligibility)init;
- (NSString)bundleIdentifier;
- (NSString)description;
@end

@implementation MRDBundleMediaRecommendationEligibility

- (NSString)bundleIdentifier
{
  uint64_t v2 = *(void *)&self->bundleIdentifier[OBJC_IVAR___MRDBundleMediaRecommendationEligibility_bundleIdentifier];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isEligibleForOneTapSuggestion
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForOneTapSuggestion);
}

- (BOOL)isEligibleForAutoRoute
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForAutoRoute);
}

- (BOOL)isEligibleForCallToAction
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForCallToAction);
}

- (BOOL)isEligible
{
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForCallToAction) & 1) != 0
    || *((_BYTE *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForAutoRoute) == 1)
  {
    return 1;
  }

  else
  {
    return *((_BYTE *)&self->super.isa
           + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_isEligibleForOneTapSuggestion);
  }

- (BOOL)isVideoApp
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDBundleMediaRecommendationEligibility_mediaType) == (Class)2;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_1002228B8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (MRDBundleMediaRecommendationEligibility)init
{
  result = (MRDBundleMediaRecommendationEligibility *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.MRDBundleMediaRecommendationEligibility",  52LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end