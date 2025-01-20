@interface _NSMainThread
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (unint64_t)retainCount;
@end

@implementation _NSMainThread

- (unint64_t)retainCount
{
  return -1LL;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

@end