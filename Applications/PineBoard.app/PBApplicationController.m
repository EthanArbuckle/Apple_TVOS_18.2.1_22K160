@interface PBApplicationController
- (PBApplication)airPlayApplication;
- (PBApplication)headBoardApplication;
- (PBApplication)kioskApplication;
- (PBApplication)purpleBuddyApplication;
- (PBApplication)setupApplication;
- (PBApplication)systemMenuServiceApplication;
- (PBApplication)systemUIServiceApplication;
- (PBApplication)watchListApplication;
- (PBApplicationController)init;
- (PBApplicationController)initWithAppInfoStore:(id)a3;
- (PBIdleScreenApplication)idleScreenApplication;
- (PBSystemHomeUIServiceApplication)systemHomeUIServiceApplication;
- (id)__initWithAppInfoController:(id)a3;
- (id)applicationForBundleIdentifier:(id)a3;
- (id)applications;
- (id)systemApplications;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
@end

@implementation PBApplicationController

- (id)__initWithAppInfoController:(id)a3
{
  return sub_100227B44(a3);
}

- (PBApplicationController)initWithAppInfoStore:(id)a3
{
  return (PBApplicationController *)sub_100227FB4(a3);
}

- (id)applications
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PBApplicationController__applications);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1002280E4(v3, &v11);
  os_unfair_lock_unlock(v4);
  uint64_t v6 = v11;

  type metadata accessor for Application(v7, v8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (id)systemApplications
{
  uint64_t v2 = self;
  sub_1002281C8();
  uint64_t v4 = v3;

  type metadata accessor for Application(v5, v6);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10022A370(v7);
}

- (PBApplicationController)init
{
  result = (PBApplicationController *)_swift_stdlib_reportUnimplementedInitializer( "PineBoard.ApplicationController",  31LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (id)applicationForBundleIdentifier:(id)a3
{
  uint64_t v5 = v4;
  id v6 = *(os_unfair_lock_s **)((char *)&self->super.isa + OBJC_IVAR___PBApplicationController__applications);
  uint64_t v7 = (uint64_t)&v6[4];
  uint64_t v8 = v6 + 6;
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_100229598(v7, &v12);
  os_unfair_lock_unlock(v8);
  v10 = v12;

  swift_bridgeObjectRelease(v5);
  return v10;
}

- (PBApplication)kioskApplication
{
  uint64_t v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PBApplicationController_appInfoController);
  uint64_t v3 = self;
  id v4 = [v2 configuration];
  id v5 = [v4 kioskAppBundleIdentifier];

  if (!v5
    || (id v6 = (PBApplication *) -[PBApplicationController applicationForBundleIdentifier:]( v3,  "applicationForBundleIdentifier:",  v5),  v5,  !v6))
  {
    id v6 = -[PBApplicationController headBoardApplication](v3, "headBoardApplication");
  }

  return v6;
}

- (PBApplication)headBoardApplication
{
  return (PBApplication *)  -[PBApplicationController applicationForBundleIdentifier:]( self,  "applicationForBundleIdentifier:",  @"com.apple.HeadBoard");
}

- (PBApplication)purpleBuddyApplication
{
  return (PBApplication *)  -[PBApplicationController applicationForBundleIdentifier:]( self,  "applicationForBundleIdentifier:",  @"com.apple.purplebuddy");
}

- (PBApplication)setupApplication
{
  return -[PBApplicationController purpleBuddyApplication](self, "purpleBuddyApplication");
}

- (PBApplication)watchListApplication
{
  return (PBApplication *)  -[PBApplicationController applicationForBundleIdentifier:]( self,  "applicationForBundleIdentifier:",  @"com.apple.TVWatchList");
}

- (PBApplication)airPlayApplication
{
  return (PBApplication *)  -[PBApplicationController applicationForBundleIdentifier:]( self,  "applicationForBundleIdentifier:",  @"com.apple.TVAirPlay");
}

- (PBIdleScreenApplication)idleScreenApplication
{
  return (PBIdleScreenApplication *)sub_100228F28( self,  (uint64_t)a2,  (uint64_t *)&off_1003D7540,  (uint64_t (*)(void))type metadata accessor for IdleScreenApplication);
}

- (PBSystemHomeUIServiceApplication)systemHomeUIServiceApplication
{
  return (PBSystemHomeUIServiceApplication *)sub_100228F28( self,  (uint64_t)a2,  (uint64_t *)&off_1003D7578,  (uint64_t (*)(void))type metadata accessor for SystemHomeUIServiceApplication);
}

- (PBApplication)systemMenuServiceApplication
{
  return (PBApplication *)  -[PBApplicationController applicationForBundleIdentifier:]( self,  "applicationForBundleIdentifier:",  @"com.apple.TVSystemMenuService");
}

- (PBApplication)systemUIServiceApplication
{
  return (PBApplication *)  -[PBApplicationController applicationForBundleIdentifier:]( self,  "applicationForBundleIdentifier:",  @"com.apple.TVSystemUIService");
}

@end