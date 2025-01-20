@interface JSPersonalizationStoreObject
- (_TtC19appstorecomponentsd28JSPersonalizationStoreObject)init;
- (id)getTasteProfileToken;
@end

@implementation JSPersonalizationStoreObject

- (_TtC19appstorecomponentsd28JSPersonalizationStoreObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[JSPersonalizationStoreObject init](&v3, "init");
}

- (id)getTasteProfileToken
{
  objc_super v3 = self;
  v4 = (void *)static JSContext.requiredCurrent.getter();
  v5 = (void *)JSContext.propagateErrorsToExceptions(_:)(sub_1000AFBB8, 0LL);

  return v5;
}

@end