@interface LegacyProfilesApplicator
+ (id)supportedConfigurationTypes;
- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)init;
- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation LegacyProfilesApplicator

- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)init
{
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  id v4 = [objc_allocWithZone((Class)type metadata accessor for LegacyProfilesAdapter()) init];
  v7.receiver = self;
  v7.super_class = ObjectType;
  v5 = -[LegacyProfilesApplicator initWithAdapter:inPlaceUpdates:](&v7, "initWithAdapter:inPlaceUpdates:", v4, 1LL);

  return v5;
}

- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  return -[LegacyProfilesApplicator initWithAdapter:inPlaceUpdates:](&v7, "initWithAdapter:inPlaceUpdates:", a3, v4);
}

+ (id)supportedConfigurationTypes
{
  uint64_t v2 = sub_100003610(&qword_100010D28);
  uint64_t inited = swift_initStackObject(v2, &v11);
  *(_OWORD *)(inited + 16) = xmmword_100009D90;
  id v4 = [(id)objc_opt_self(RMModelLegacyProfileDeclaration) registeredIdentifier];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v7 = v6;

  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v7;
  v8 = sub_1000094F0(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

@end