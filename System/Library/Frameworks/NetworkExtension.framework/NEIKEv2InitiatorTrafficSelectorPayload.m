@interface NEIKEv2InitiatorTrafficSelectorPayload
+ (id)copyTypeDescription;
- (unint64_t)type;
@end

@implementation NEIKEv2InitiatorTrafficSelectorPayload

- (unint64_t)type
{
  return 44LL;
}

+ (id)copyTypeDescription
{
  return @"TSi";
}

@end