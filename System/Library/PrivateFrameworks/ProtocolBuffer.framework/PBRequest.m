@interface PBRequest
- (Class)responseClass;
- (unsigned)requestTypeCode;
@end

@implementation PBRequest

- (unsigned)requestTypeCode
{
  return 0;
}

- (Class)responseClass
{
  return 0LL;
}

@end