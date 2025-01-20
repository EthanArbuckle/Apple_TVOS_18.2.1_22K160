@interface CLDaemonClientAdapter
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLDaemonClientAdapter)initWithDaemonClient:(void *)a3;
- (void)client;
- (void)setClient:(void *)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonClientAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

- (CLDaemonClientAdapter)initWithDaemonClient:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLDaemonClientAdapter;
  result = -[CLDaemonClientAdapter init](&v5, "init");
  if (result) {
    result->_client = a3;
  }
  return result;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)client
{
  return self->_client;
}

- (void)setClient:(void *)a3
{
  self->_client = a3;
}

@end