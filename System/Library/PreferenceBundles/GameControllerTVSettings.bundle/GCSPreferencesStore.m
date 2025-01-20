@interface GCSPreferencesStore
+ (Class)keyPathsForValuesAffectingHiddenControllers;
+ (id)keyPathsForValuesAffectingActiveProfiles;
+ (id)keyPathsForValuesAffectingControllers;
+ (id)keyPathsForValuesAffectingFusableControllers;
+ (id)keyPathsForValuesAffectingInactiveProfiles;
+ (id)keyPathsForValuesAffectingSortedProfiles;
+ (id)keyPathsForValuesAffectingUnfusedFusableControllers;
- (BOOL)controllerIsConnected:(id)a3;
- (BOOL)controllerIsFusedController:(id)a3;
- (BOOL)fusedControllerIsConnectedWithPilotOrCopilotController:(id)a3;
- (BOOL)longPressMenuOpensLaunchPad;
- (BOOL)naturalThumbstickScrollDirection;
- (GCSGame)defaultGame;
- (GCSProfile)defaultProfile;
- (NSArray)activeProfiles;
- (NSArray)allControllers;
- (NSArray)connectedControllerIdentifiers;
- (NSArray)controllers;
- (NSArray)copilotFusedControllers;
- (NSArray)fusableControllers;
- (NSArray)fusedControllers;
- (NSArray)games;
- (NSArray)hiddenControllers;
- (NSArray)inactiveProfiles;
- (NSArray)mouseProfiles;
- (NSArray)profiles;
- (NSArray)sortedProfiles;
- (NSArray)unfusedFusableControllers;
- (NSDictionary)profileUsageStats;
- (NSDictionary)tombstones;
- (_TtC24GameControllerTVSettings19GCSPreferencesStore)init;
- (double)thumbstickScrollingSpeed;
- (id)controllerConnectionFor:(id)a3;
- (id)controllerFor:(id)a3;
- (id)copilotFusedControllerWithController:(id)a3;
- (id)copilotFusedControllerWithFusedController:(id)a3;
- (id)copilotFusedControllerWithPilotOrCopilotController:(id)a3;
- (id)gameWithBundleIdentifier:(id)a3;
- (id)gameWithBundleIdentifier:(id)a3 controller:(id)a4;
- (id)mouseProfileWithBundleIdentifier:(id)a3;
- (void)addController:(id)a3 saveToDisk:(BOOL)a4;
- (void)addCopilotFusedController:(id)a3 saveToDisk:(BOOL)a4;
- (void)addGame:(id)a3 saveToDisk:(BOOL)a4;
- (void)addMouseProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)addProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)calculateProfileUsageStats;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeController:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeControllers:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeGame:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeMouseProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)setAllControllers:(id)a3;
- (void)setConnectedControllerIdentifiers:(id)a3;
- (void)setCopilotFusedControllers:(id)a3;
- (void)setGames:(id)a3;
- (void)setLongPressMenuOpensLaunchPad:(BOOL)a3;
- (void)setMouseProfiles:(id)a3;
- (void)setNaturalThumbstickScrollDirection:(BOOL)a3;
- (void)setProfileUsageStats:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setThumbstickScrollingSpeed:(double)a3;
- (void)setTombstones:(id)a3;
- (void)updateControllerFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
- (void)updateControllers;
- (void)updateGameFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
- (void)updateMouseProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
- (void)updateProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
@end

@implementation GCSPreferencesStore

- (NSArray)connectedControllerIdentifiers
{
  uint64_t KeyPath = swift_getKeyPath(&unk_47C50, a2);
  uint64_t v5 = swift_getKeyPath(&off_47C78, v4);
  v6 = self;
  static Published.subscript.getter(&v10);

  swift_release(KeyPath);
  swift_release(v5);
  uint64_t v7 = v10;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (void)setConnectedControllerIdentifiers:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  uint64_t KeyPath = swift_getKeyPath(&unk_47C50, v5);
  uint64_t v8 = swift_getKeyPath(&off_47C78, v7);
  uint64_t v9 = v4;
  static Published.subscript.setter(&v9, self, KeyPath, v8);
}

- (NSArray)allControllers
{
  return (NSArray *)sub_1E048( self,  (uint64_t)a2,  (uint64_t)&off_47CA8,  (uint64_t)&unk_47CD0,  (unint64_t *)&qword_564D0,  &classRef_GCSController);
}

- (void)setAllControllers:(id)a3
{
}

- (NSDictionary)tombstones
{
  uint64_t KeyPath = swift_getKeyPath(&off_47D00, a2);
  uint64_t v5 = swift_getKeyPath(&unk_47D28, v4);
  v6 = self;
  static Published.subscript.getter(&v10);

  swift_release(KeyPath);
  swift_release(v5);
  uint64_t v7 = v10;
  sub_18140(&qword_56620);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSDictionary *)isa;
}

- (void)setTombstones:(id)a3
{
  uint64_t v5 = sub_18140(&qword_56620);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  v5,  &protocol witness table for String);
  uint64_t KeyPath = swift_getKeyPath(&off_47D00, v7);
  uint64_t v10 = swift_getKeyPath(&unk_47D28, v9);
  uint64_t v11 = v6;
  static Published.subscript.setter(&v11, self, KeyPath, v10);
}

- (NSArray)profiles
{
  return (NSArray *)sub_1E048( self,  (uint64_t)a2,  (uint64_t)&unk_47D58,  (uint64_t)&unk_47D80,  (unint64_t *)&qword_564F0,  &classRef_GCSProfile);
}

- (void)setProfiles:(id)a3
{
}

- (NSArray)mouseProfiles
{
  return (NSArray *)sub_1E048( self,  (uint64_t)a2,  (uint64_t)&unk_47DB0,  (uint64_t)&unk_47DD8,  &qword_56530,  &classRef_GCSMouseProfile);
}

- (void)setMouseProfiles:(id)a3
{
}

- (NSArray)games
{
  return (NSArray *)sub_1E048( self,  (uint64_t)a2,  (uint64_t)&unk_47E00,  (uint64_t)&unk_47E28,  &qword_564E8,  &classRef_GCSGame);
}

- (void)setGames:(id)a3
{
}

- (NSArray)copilotFusedControllers
{
  return (NSArray *)sub_1E048( self,  (uint64_t)a2,  (uint64_t)&unk_47E68,  (uint64_t)&unk_47E90,  &qword_564E0,  &classRef_GCSCopilotFusedController);
}

- (void)setCopilotFusedControllers:(id)a3
{
}

- (NSDictionary)profileUsageStats
{
  uint64_t KeyPath = swift_getKeyPath(&unk_47EC8, a2);
  uint64_t v5 = swift_getKeyPath(&unk_47EF0, v4);
  uint64_t v6 = self;
  static Published.subscript.getter(&v10);

  swift_release(KeyPath);
  swift_release(v5);
  uint64_t v7 = v10;
  type metadata accessor for UUID(0LL);
  type metadata accessor for GCSProfileUsageStats();
  sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSDictionary *)isa;
}

- (void)setProfileUsageStats:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = type metadata accessor for GCSProfileUsageStats();
  uint64_t v7 = sub_336DC( &qword_56508,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6, v7);
  uint64_t KeyPath = swift_getKeyPath(&unk_47EC8, v9);
  uint64_t v12 = swift_getKeyPath(&unk_47EF0, v11);
  uint64_t v13 = v8;
  static Published.subscript.setter(&v13, self, KeyPath, v12);
}

- (BOOL)longPressMenuOpensLaunchPad
{
  return sub_1F220(self, (uint64_t)a2, (uint64_t)&unk_47F30, (uint64_t)&unk_47F58);
}

- (void)setLongPressMenuOpensLaunchPad:(BOOL)a3
{
  uint64_t KeyPath = swift_getKeyPath(&unk_47F30, a2);
  uint64_t v7 = swift_getKeyPath(&unk_47F58, v6);
  BOOL v10 = a3;
  uint64_t v8 = self;
  static Published.subscript.setter(&v10, v8, KeyPath, v7);
  id v9 = objc_retain(*(id *)((char *)&v8->super.isa
                         + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults));
  objc_msgSend( v9,  "setBool:forKey:",  -[GCSPreferencesStore longPressMenuOpensLaunchPad](v8, "longPressMenuOpensLaunchPad"),  @"bluetoothPrefsMenuLongPressAction");
}

- (BOOL)naturalThumbstickScrollDirection
{
  return sub_1F220(self, (uint64_t)a2, (uint64_t)&unk_47FA8, (uint64_t)&unk_47FD0);
}

- (void)setNaturalThumbstickScrollDirection:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1F360(a3, (uint64_t)v4);
}

- (double)thumbstickScrollingSpeed
{
  uint64_t KeyPath = swift_getKeyPath(&unk_48010, a2);
  uint64_t v5 = swift_getKeyPath(&unk_48038, v4);
  uint64_t v6 = self;
  static Published.subscript.getter(&v8);

  swift_release(KeyPath);
  swift_release(v5);
  return v8;
}

- (void)setThumbstickScrollingSpeed:(double)a3
{
  uint64_t v5 = self;
  sub_1F6FC(a3, (uint64_t)v5, v4);
}

- (id)controllerFor:(id)a3
{
  return sub_23920( self,  (uint64_t)a2,  (uint64_t)a3,  (SEL *)&selRef_allControllers,  (unint64_t *)&qword_564D0,  &classRef_GCSController,  (SEL *)&selRef_persistentIdentifier);
}

- (NSArray)controllers
{
  v2 = self;
  v3 = -[GCSPreferencesStore hiddenControllers](v2, "hiddenControllers");
  uint64_t v4 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  uint64_t v6 = -[GCSPreferencesStore allControllers](v2, "allControllers");
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v4);

  double v8 = sub_310C4(v7, v5);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v5);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSArray *)isa;
}

+ (id)keyPathsForValuesAffectingControllers
{
  return sub_21A44((uint64_t)a1, (uint64_t)a2, 0x72746E6F436C6C61LL, 0xEE007372656C6C6FLL);
}

- (NSArray)hiddenControllers
{
  return (NSArray *)sub_212EC( self,  (uint64_t)a2,  (SEL *)&selRef_allControllers,  (unint64_t *)&qword_564D0,  &classRef_GCSController,  (uint64_t (*)(uint64_t, id))sub_3137C);
}

- (NSArray)fusedControllers
{
  return (NSArray *)sub_20480(self, (uint64_t)a2, sub_20088, (unint64_t *)&qword_564D0, &classRef_GCSController);
}

+ (Class)keyPathsForValuesAffectingHiddenControllers
{
  uint64_t v0 = sub_18140((uint64_t *)&unk_561E0);
  uint64_t inited = swift_initStackObject(v0, &v5);
  *(_OWORD *)(inited + 16) = xmmword_47C00;
  strcpy((char *)(inited + 32), "allControllers");
  *(_BYTE *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0xD000000000000017LL;
  *(void *)(inited + 56) = 0x8000000000047E30LL;
  Swift::Int v2 = sub_323D0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 2LL, &type metadata for String);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

- (NSArray)unfusedFusableControllers
{
  return (NSArray *)sub_20480(self, (uint64_t)a2, sub_204EC, (unint64_t *)&qword_564D0, &classRef_GCSController);
}

+ (id)keyPathsForValuesAffectingUnfusedFusableControllers
{
  uint64_t v2 = sub_18140((uint64_t *)&unk_561E0);
  uint64_t inited = swift_initStackObject(v2, &v7);
  *(_OWORD *)(inited + 16) = xmmword_47C10;
  strcpy((char *)(inited + 32), "allControllers");
  *(_BYTE *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0xD000000000000017LL;
  *(void *)(inited + 56) = 0x8000000000047E30LL;
  *(void *)(inited + 64) = 0xD00000000000001ALL;
  *(void *)(inited + 72) = 0x80000000000418A0LL;
  Swift::Int v4 = sub_323D0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 3LL, &type metadata for String);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return isa;
}

- (NSArray)fusableControllers
{
  return (NSArray *)sub_20480( self,  (uint64_t)a2,  (uint64_t (*)(void))sub_20C00,  (unint64_t *)&qword_564D0,  &classRef_GCSController);
}

+ (id)keyPathsForValuesAffectingFusableControllers
{
  return sub_21A44((uint64_t)a1, (uint64_t)a2, 0x72746E6F436C6C61LL, 0xEE007372656C6C6FLL);
}

- (GCSGame)defaultGame
{
  uint64_t v2 = self;
  v3 = (void *)sub_20DF8();

  return (GCSGame *)v3;
}

- (GCSProfile)defaultProfile
{
  uint64_t v2 = self;
  sub_210D0();
  Swift::Int v4 = v3;

  return (GCSProfile *)v4;
}

- (NSArray)activeProfiles
{
  return (NSArray *)sub_212EC( self,  (uint64_t)a2,  (SEL *)&selRef_profiles,  (unint64_t *)&qword_564F0,  &classRef_GCSProfile,  (uint64_t (*)(uint64_t, id))sub_31CB0);
}

+ (id)keyPathsForValuesAffectingActiveProfiles
{
  return sub_21A44((uint64_t)a1, (uint64_t)a2, 0x73656C69666F7270LL, 0xE800000000000000LL);
}

- (NSArray)inactiveProfiles
{
  return (NSArray *)sub_212EC( self,  (uint64_t)a2,  (SEL *)&selRef_profiles,  (unint64_t *)&qword_564F0,  &classRef_GCSProfile,  (uint64_t (*)(uint64_t, id))sub_31F30);
}

+ (id)keyPathsForValuesAffectingInactiveProfiles
{
  return sub_21A44((uint64_t)a1, (uint64_t)a2, 0x73656C69666F7270LL, 0xE800000000000000LL);
}

- (NSArray)sortedProfiles
{
  return (NSArray *)sub_20480(self, (uint64_t)a2, sub_21538, (unint64_t *)&qword_564F0, &classRef_GCSProfile);
}

+ (id)keyPathsForValuesAffectingSortedProfiles
{
  return sub_21A44((uint64_t)a1, (uint64_t)a2, 0x73656C69666F7270LL, 0xE800000000000000LL);
}

- (BOOL)controllerIsConnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_21AF0(v4);

  return self & 1;
}

- (BOOL)fusedControllerIsConnectedWithPilotOrCopilotController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_21CA4();

  return self & 1;
}

- (BOOL)controllerIsFusedController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = -[GCSPreferencesStore fusedControllers](v5, "fusedControllers");
  uint64_t v7 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

  LOBYTE(v6) = sub_1FD8C((uint64_t)v4, v8);
  swift_bridgeObjectRelease(v8);
  return v6 & 1;
}

- (id)copilotFusedControllerWithController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_21EF0(v4);

  return v6;
}

- (id)copilotFusedControllerWithPilotOrCopilotController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_22254(v4);

  return v6;
}

- (id)copilotFusedControllerWithFusedController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_22520(v4);

  return v6;
}

- (id)controllerConnectionFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_33400(v4);

  return v6;
}

- (void)calculateProfileUsageStats
{
  uint64_t v2 = self;
  sub_227A4();
}

- (id)gameWithBundleIdentifier:(id)a3
{
  return sub_23920( self,  (uint64_t)a2,  (uint64_t)a3,  (SEL *)&selRef_games,  &qword_564E8,  &classRef_GCSGame,  (SEL *)&selRef_bundleIdentifier);
}

- (id)gameWithBundleIdentifier:(id)a3 controller:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  id v9 = a4;
  BOOL v10 = self;
  uint64_t v11 = -[GCSPreferencesStore games](v10, "games");
  uint64_t v12 = sub_34D00(0LL, &qword_564E8, &classRef_GCSGame);
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

  swift_bridgeObjectRetain(v8);
  v14 = sub_30F30(v13, v6, v8, (SEL *)&selRef_bundleIdentifier);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v8);
  if (v14)
  {
    unsigned __int8 v15 = [v14 profileExistsFor:v9 with:v10];

    swift_bridgeObjectRelease(v8);
    if ((v15 & 1) == 0)
    {

      v14 = 0LL;
    }
  }

  else
  {

    swift_bridgeObjectRelease(v8);
  }

  return v14;
}

- (void)updateGameFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = self;
  sub_23C10(v8, v9, a5);
}

- (void)addGame:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_23CAC(v6, a4);
}

- (void)removeGame:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_23D2C(v6, a4);
}

- (void)updateProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = self;
  sub_24658(v8, v9, a5);
}

- (void)addCopilotFusedController:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_246F4(v6, a4);
}

- (void)addProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24BAC(v6, a4);
}

- (void)removeProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24C2C(v6, a4);
}

- (id)mouseProfileWithBundleIdentifier:(id)a3
{
  return sub_23920( self,  (uint64_t)a2,  (uint64_t)a3,  (SEL *)&selRef_mouseProfiles,  &qword_56530,  &classRef_GCSMouseProfile,  (SEL *)&selRef_bundleIdentifier);
}

- (void)addMouseProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_255FC(v6, a4);
}

- (void)removeMouseProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2567C(v6, a4);
}

- (void)updateMouseProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = self;
  sub_259F0(v8, v9, a5);
}

- (void)addController:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_25A8C(v6, a4);
}

- (void)updateControllerFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = self;
  sub_2600C(v8, v9, a5);
}

- (void)removeController:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_262D0(v6, a4);
}

- (void)removeControllers:(id)a3 saveToDisk:(BOOL)a4
{
  uint64_t v7 = sub_34D00(0LL, (unint64_t *)&qword_564D0, &classRef_GCSController);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  id v9 = self;
  sub_264D0(v8, a4);

  swift_bridgeObjectRelease(v8);
}

- (_TtC24GameControllerTVSettings19GCSPreferencesStore)init
{
  return (_TtC24GameControllerTVSettings19GCSPreferencesStore *)sub_276D4();
}

- (void)dealloc
{
  uint64_t v2 = self;
  sub_28170();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore_userDefaults));
  v3 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__connectedControllerIdentifiers[0];
  uint64_t v4 = sub_18140(&qword_563E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__allControllers[0];
  uint64_t v6 = sub_18140(&qword_56400);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__tombstones[0];
  uint64_t v8 = sub_18140(&qword_56418);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);
  id v9 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profiles;
  uint64_t v10 = sub_18140(&qword_56438);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  uint64_t v11 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__mouseProfiles[0];
  uint64_t v12 = sub_18140(&qword_56450);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8LL))(v11, v12);
  uint64_t v13 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__games[0];
  uint64_t v14 = sub_18140(&qword_56468);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8LL))(v13, v14);
  unsigned __int8 v15 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__copilotFusedControllers[0];
  uint64_t v16 = sub_18140(&qword_56480);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8LL))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__profileUsageStats;
  uint64_t v18 = sub_18140(&qword_56498);
  (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8LL))(v17, v18);
  v19 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__longPressMenuOpensLaunchPad[0];
  uint64_t v20 = sub_18140(&qword_564B0);
  v21 = *(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8LL);
  v21(v19, v20);
  v21( (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__naturalThumbstickScrollDirection[0],  v20);
  v22 = (char *)self + OBJC_IVAR____TtC24GameControllerTVSettings19GCSPreferencesStore__thumbstickScrollingSpeed[0];
  uint64_t v23 = sub_18140(&qword_564C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8LL))(v22, v23);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v21, 0, sizeof(v21));
    id v19 = a5;
    uint64_t v20 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v18 = 0LL;
    goto LABEL_8;
  }

  uint64_t v10 = 0LL;
  uint64_t v12 = 0LL;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain(a4);
  id v13 = a5;
  uint64_t v14 = self;
  _bridgeAnyObjectToAny(_:)(v21, a4);
  swift_unknownObjectRelease(a4);
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0LL);
  uint64_t v16 = v15;
  uint64_t v17 = sub_336DC( &qword_56548,  (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey,  (uint64_t)&unk_48248);
  uint64_t v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  v16,  (char *)&type metadata for Any + 8,  v17);

LABEL_8:
  sub_284A0(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_34D38((uint64_t)v21, &qword_561F0);
}

- (void)updateControllers
{
  uint64_t v2 = self;
  sub_28B1C();
}

@end