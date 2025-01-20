@interface CLDaemonInUseAssertionAdapter
- (BOOL)valid;
- (CLDaemonInUseAssertionAdapter)init;
- (void)dealloc;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonInUseAssertionAdapter

- (CLDaemonInUseAssertionAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonInUseAssertionAdapter;
  result = -[CLDaemonInUseAssertionAdapter init](&v3, "init");
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_valid) {
    sub_10125E1C8();
  }
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLDaemonInUseAssertionAdapter;
  -[CLDaemonInUseAssertionAdapter dealloc](&v2, "dealloc");
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end