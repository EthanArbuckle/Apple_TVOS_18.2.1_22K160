@interface SRBundleUtilities
+ (id)getSiriAppBundle;
- (_TtC4Siri17SRBundleUtilities)init;
@end

@implementation SRBundleUtilities

+ (id)getSiriAppBundle
{
  id v2 = [objc_allocWithZone((Class)type metadata accessor for SRBundleLookupClass()) init];
  uint64_t ObjectType = swift_getObjectType(v2);

  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
  return [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
}

- (_TtC4Siri17SRBundleUtilities)init
{
  return (_TtC4Siri17SRBundleUtilities *)sub_10004E5C4( self,  (uint64_t)a2,  v2,  (uint64_t (*)(uint64_t))type metadata accessor for SRBundleUtilities);
}

@end