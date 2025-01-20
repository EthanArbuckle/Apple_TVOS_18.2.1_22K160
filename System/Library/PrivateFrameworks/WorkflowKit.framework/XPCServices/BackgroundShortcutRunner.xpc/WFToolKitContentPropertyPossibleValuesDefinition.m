@interface WFToolKitContentPropertyPossibleValuesDefinition
- (Class)contentItemClass;
- (NSString)propertyName;
- (WFToolKitContentPropertyPossibleValuesDefinition)init;
- (void)setContentItemClass:(Class)a3;
- (void)setPropertyName:(id)a3;
@end

@implementation WFToolKitContentPropertyPossibleValuesDefinition

- (Class)contentItemClass
{
  Class result = (Class)ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.getter();
  if (result) {
    return (Class)swift_getObjCClassFromMetadata(result);
  }
  return result;
}

- (void)setContentItemClass:(Class)a3
{
  if (a3) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a3);
  }
  else {
    uint64_t ObjCClassMetadata = 0LL;
  }
  ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.setter(ObjCClassMetadata);
}

- (NSString)propertyName
{
  uint64_t v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setPropertyName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  v7 = self;
  ToolKitHelper.ContentPropertyPossibleValuesDefinition.propertyName.setter(v4, v6);
}

- (WFToolKitContentPropertyPossibleValuesDefinition)init
{
}

- (void).cxx_destruct
{
}

@end