@interface PBApplication
+ (id)sharedApplication;
- (BOOL)isFaceTime;
- (BOOL)isHeadBoardApplication;
- (BOOL)isIdleScreen;
- (BOOL)isKioskApplication;
- (BOOL)isSystemApplication;
- (BOOL)isTVSearchApplication;
- (BOOL)isTVSystemMenuServiceApplication;
- (BOOL)isTVWatchList;
- (BOOL)isUninstalled;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (PBAppInfo)appInfo;
- (PBApplication)init;
- (PBApplicationInfo)applicationInfo;
- (RBSProcessIdentity)processIdentity;
- (UIApplicationSceneSpecification)defaultSceneSpecification;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)fbs_sceneClientIdentity;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAppInfo:(id)a3;
- (void)setIsUninstalled:(BOOL)a3;
@end

@implementation PBApplication

+ (id)sharedApplication
{
  if (qword_100470040 != -1) {
    dispatch_once(&qword_100470040, &stru_1003D14B0);
  }
  return (id)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
}

- (NSString)bundleIdentifier
{
  uint64_t v2 = *(void *)&self->bundleIdentifier[OBJC_IVAR___PBApplication_bundleIdentifier];
  swift_bridgeObjectRetain(v2);
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isSystemApplication
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PBApplication_isSystemApplication);
}

- (PBAppInfo)appInfo
{
  return (PBAppInfo *)sub_100229118( (char *)self,  (uint64_t)a2,  (void (*)(void **__return_ptr, os_unfair_lock_s *))sub_1002290E0);
}

- (void)setAppInfo:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBApplication_state);
  v5 = (id *)(v4 + 16);
  v6 = (os_unfair_lock_s *)(v4 + 28);
  id v8 = a3;
  v7 = self;
  os_unfair_lock_lock(v6);
  sub_100229590(v5);
  os_unfair_lock_unlock(v6);
}

- (PBApplicationInfo)applicationInfo
{
  return (PBApplicationInfo *)sub_100229118( (char *)self,  (uint64_t)a2,  (void (*)(void **__return_ptr, os_unfair_lock_s *))sub_100229198);
}

- (BOOL)isUninstalled
{
  uint64_t v2 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___PBApplication_state);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 7;
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1002292C4(v3, &v7);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v7;

  return v3;
}

- (void)setIsUninstalled:(BOOL)a3
{
  uint64_t v3 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___PBApplication_state);
  uint64_t v4 = (uint64_t)&v3[4];
  v5 = v3 + 7;
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_100229584(v4);
  os_unfair_lock_unlock(v5);
}

- (PBApplication)init
{
  result = (PBApplication *)_swift_stdlib_reportUnimplementedInitializer( "PineBoard.Application",  21LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (UIApplicationSceneSpecification)defaultSceneSpecification
{
  return (UIApplicationSceneSpecification *)sub_10022BAD0( (uint64_t)self,  (uint64_t)a2,  (Class *)&OBJC_CLASS___UIApplicationSceneSpecification_ptr);
}

- (id)descriptionWithMultilinePrefix:(id)a3
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

  char v7 = self;
  sub_10022B340(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease(v6);
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }

  else
  {
    NSString v10 = 0LL;
  }

  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v5 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  uint64_t v6 = self;
  id v7 = -[PBApplication succinctDescriptionBuilder](v6, "succinctDescriptionBuilder");

  swift_bridgeObjectRelease(v5);
  return v7;
}

- (id)succinctDescription
{
  uint64_t v2 = self;
  id result = -[PBApplication succinctDescriptionBuilder](v2, "succinctDescriptionBuilder");
  if (result)
  {
    id v4 = result;
    id v5 = [result build];

    if (v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      uint64_t v7 = v6;

      NSString v8 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v7);
    }

    else
    {

      NSString v8 = 0LL;
    }

    return v8;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v2 = self;
  id v3 = sub_10022B59C();

  return v3;
}

- (NSString)description
{
  uint64_t v2 = self;
  id result = (NSString *)-[PBApplication succinctDescription](v2, "succinctDescription");
  if (result)
  {
    id v4 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    uint64_t v6 = v5;

    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (NSString)debugDescription
{
  uint64_t v2 = self;
  id result = (NSString *)-[PBApplication descriptionWithMultilinePrefix:](v2, "descriptionWithMultilinePrefix:", 0LL);
  if (result)
  {
    id v4 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    uint64_t v6 = v5;

    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (RBSProcessIdentity)processIdentity
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBApplication_state);
  id v3 = (id *)(v2 + 16);
  id v4 = (os_unfair_lock_s *)(v2 + 28);
  uint64_t v5 = self;
  os_unfair_lock_lock(v4);
  sub_100229198(v3, &v9);
  os_unfair_lock_unlock(v4);
  id v6 = v9;
  id v7 = [v9 processIdentity];

  if (v7)
  {

    return (RBSProcessIdentity *)v7;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (id)fbs_sceneClientIdentity
{
  uint64_t v2 = self;
  id v3 = -[PBApplication processIdentity](v2, "processIdentity");
  id v4 = -[RBSProcessIdentity fbs_sceneClientIdentity](v3, "fbs_sceneClientIdentity");

  return v4;
}

- (BOOL)isKioskApplication
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBApplication_bundleIdentifier);
  uint64_t v3 = *(void *)&self->bundleIdentifier[OBJC_IVAR___PBApplication_bundleIdentifier];
  uint64_t v5 = (void *)objc_opt_self(&OBJC_CLASS___PineBoard, a2);
  id v6 = self;
  id v7 = [v5 sharedApplication];
  id v8 = [v7 kioskAppBundleIdentifier];

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  uint64_t v11 = v10;

  if (v4 == v9 && v3 == v11)
  {
    char v13 = 1;
  }

  else
  {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v3, v9, v11, 0LL);
    uint64_t v3 = v11;
  }

  swift_bridgeObjectRelease(v3);
  return v13 & 1;
}

- (BOOL)isHeadBoardApplication
{
  return sub_10022BA30((uint64_t)self, (uint64_t)a2, &off_1003D7538);
}

- (BOOL)isTVSearchApplication
{
  return sub_10022BA30((uint64_t)self, (uint64_t)a2, &off_1003D7510);
}

- (BOOL)isTVSystemMenuServiceApplication
{
  return sub_10022BA30((uint64_t)self, (uint64_t)a2, &off_1003D7580);
}

- (BOOL)isTVWatchList
{
  return sub_10022BA30((uint64_t)self, (uint64_t)a2, &off_1003D7528);
}

- (BOOL)isIdleScreen
{
  return 0;
}

- (BOOL)isFaceTime
{
  return sub_10022BA30((uint64_t)self, (uint64_t)a2, &off_1003D7530);
}

@end