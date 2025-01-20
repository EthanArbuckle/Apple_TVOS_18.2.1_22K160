@interface AKSurrogateAuthenticationIDGenerator
- (id)generateCheckinID;
@end

@implementation AKSurrogateAuthenticationIDGenerator

- (id)generateCheckinID
{
  return +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
}

@end