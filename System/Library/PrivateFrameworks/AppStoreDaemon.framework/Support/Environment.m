@interface Environment
- (Environment)init;
@end

@implementation Environment

- (Environment)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___Environment;
  result = -[Environment init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end