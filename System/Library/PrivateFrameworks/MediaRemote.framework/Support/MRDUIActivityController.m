@interface MRDUIActivityController
+ (BOOL)deviceSupportsActivities;
- (MRDUIActivityController)init;
- (MRDUIActivityControllerDelegate)delegate;
- (NSDictionary)currentActivitiesInfo;
- (NSString)nowPlayingActivityIdentifier;
- (id)contextForActivityIdentifier:(id)a3;
- (id)startRouteRecommendationActivityFor:(id)a3 relevanceScore:(double)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MRDUIActivityController

- (MRDUIActivityControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___MRDUIActivityController_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDUIActivityController_delegate, v4, 0LL, 0LL);
  return (MRDUIActivityControllerDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___MRDUIActivityController_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDUIActivityController_delegate, v5, 1LL, 0LL);
  swift_unknownObjectWeakAssign(v4, a3);
}

+ (BOOL)deviceSupportsActivities
{
  return 0;
}

- (NSDictionary)currentActivitiesInfo
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (NSString)nowPlayingActivityIdentifier
{
  return (NSString *)0LL;
}

- (id)startRouteRecommendationActivityFor:(id)a3 relevanceScore:(double)a4
{
  return 0LL;
}

- (id)contextForActivityIdentifier:(id)a3
{
  return MRUIContextUnknown;
}

- (MRDUIActivityController)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityController();
  return -[MRDUIActivityController init](&v4, "init");
}

- (void).cxx_destruct
{
}

@end