@interface __NSCFConstantString
- (BOOL)isNSCFConstantString__;
- (unint64_t)retainCount;
@end

@implementation __NSCFConstantString

- (unint64_t)retainCount
{
  return -1LL;
}

- (BOOL)isNSCFConstantString__
{
  return 1;
}

@end