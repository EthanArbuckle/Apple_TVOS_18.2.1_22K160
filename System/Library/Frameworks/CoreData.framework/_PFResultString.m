@interface _PFResultString
+ (unint64_t)bufferOffset;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (_PFResultString)retain;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation _PFResultString

+ (unint64_t)bufferOffset
{
  return 0LL;
}

- (_PFResultString)retain
{
  id v3 = self->_parentObject;
  return self;
}

- (void)release
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc(NSString) initWithString:self];
}

- (id)copy
{
  return (id)[objc_alloc(NSString) initWithString:self];
}

- (unint64_t)retainCount
{
  return [self->_parentObject retainCount];
}

- (BOOL)_isDeallocating
{
  return [self->_parentObject _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [self->_parentObject _tryRetain];
}

@end