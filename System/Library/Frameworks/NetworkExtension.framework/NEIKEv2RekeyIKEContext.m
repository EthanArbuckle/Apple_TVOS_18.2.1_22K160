@interface NEIKEv2RekeyIKEContext
- (id)description;
@end

@implementation NEIKEv2RekeyIKEContext

- (id)description
{
  return (id)[objc_alloc(NSString) initWithFormat:@"rekey IKE"];
}

@end