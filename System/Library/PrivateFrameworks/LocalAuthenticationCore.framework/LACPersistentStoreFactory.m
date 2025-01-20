@interface LACPersistentStoreFactory
+ (id)makePersistentStoreWithSuiteName:(id)a3;
@end

@implementation LACPersistentStoreFactory

+ (id)makePersistentStoreWithSuiteName:(id)a3
{
  id v3 = a3;
  v4 = -[LACUserDefaultsPersistentStore initWithSuiteName:]( objc_alloc(&OBJC_CLASS____TtC23LocalAuthenticationCore30LACUserDefaultsPersistentStore),  "initWithSuiteName:",  v3);

  return v4;
}

@end