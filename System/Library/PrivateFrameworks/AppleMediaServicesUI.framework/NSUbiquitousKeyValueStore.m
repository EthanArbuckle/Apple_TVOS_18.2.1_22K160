@interface NSUbiquitousKeyValueStore
+ (id)ams_encryptedAllPlatformsStoreWithIdentifier:(id)a3;
@end

@implementation NSUbiquitousKeyValueStore

+ (id)ams_encryptedAllPlatformsStoreWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = -[NSUbiquitousKeyValueStore initWithStoreIdentifier:type:]( objc_alloc(&OBJC_CLASS___NSUbiquitousKeyValueStore),  "initWithStoreIdentifier:type:",  v3,  2LL);

  return v4;
}

@end