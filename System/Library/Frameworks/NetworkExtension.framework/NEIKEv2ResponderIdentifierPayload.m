@interface NEIKEv2ResponderIdentifierPayload
+ (id)copyTypeDescription;
- (unint64_t)type;
@end

@implementation NEIKEv2ResponderIdentifierPayload

- (unint64_t)type
{
  return 36LL;
}

+ (id)copyTypeDescription
{
  return @"IDr";
}

@end