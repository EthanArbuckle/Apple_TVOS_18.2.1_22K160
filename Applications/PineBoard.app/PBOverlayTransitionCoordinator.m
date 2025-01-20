@interface PBOverlayTransitionCoordinator
+ (BOOL)isCoordinatedTransitionsEnabled;
+ (PBOverlayTransitionCoordinator)sharedInstance;
- (PBOverlayTransitionCoordinator)init;
- (id)activePersistentTokens;
- (void)registerTransition:(id)a3;
- (void)setActivePersistentTokens:(id)a3;
@end

@implementation PBOverlayTransitionCoordinator

+ (PBOverlayTransitionCoordinator)sharedInstance
{
  if (qword_10046E320 != -1) {
    swift_once(&qword_10046E320, sub_100214A34);
  }
  return (PBOverlayTransitionCoordinator *)(id)qword_100473070;
}

+ (BOOL)isCoordinatedTransitionsEnabled
{
  v4[3] = &type metadata for OverlayTransitionCoordinator.FeatureFlags;
  v4[4] = sub_100215AA8();
  char v2 = isFeatureEnabled(_:)(v4);
  sub_100215AEC(v4);
  return v2 & 1;
}

- (id)activePersistentTokens
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___PBOverlayTransitionCoordinator_activePersistentTokens));
}

- (void)setActivePersistentTokens:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBOverlayTransitionCoordinator_activePersistentTokens);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBOverlayTransitionCoordinator_activePersistentTokens) = (Class)a3;
  id v3 = a3;
}

- (PBOverlayTransitionCoordinator)init
{
  uint64_t v3 = OBJC_IVAR___PBOverlayTransitionCoordinator_activePersistentTokens;
  id v4 = (void *)objc_opt_self(&OBJC_CLASS___NSHashTable, a2);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 weakObjectsHashTable];

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for OverlayTransitionCoordinator(v6, v7);
  return -[PBOverlayTransitionCoordinator init](&v9, "init");
}

- (void)registerTransition:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100214BB4(v4);
}

- (void).cxx_destruct
{
}

@end