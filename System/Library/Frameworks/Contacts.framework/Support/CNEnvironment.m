@interface CNEnvironment
+ (id)makeDefaultContactStore;
- (CNContactStore)contactStore;
@end

@implementation CNEnvironment

- (CNContactStore)contactStore
{
  return (CNContactStore *)-[CNEnvironment valueForKey:onCacheMiss:]( self,  "valueForKey:onCacheMiss:",  @"contact-store",  &stru_1000189B0);
}

+ (id)makeDefaultContactStore
{
  return objc_alloc_init(&OBJC_CLASS___CNContactStore);
}

@end