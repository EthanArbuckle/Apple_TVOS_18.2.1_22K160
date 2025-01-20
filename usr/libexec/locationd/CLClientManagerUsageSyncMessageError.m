@interface CLClientManagerUsageSyncMessageError
- (BOOL)recoverable;
- (CLClientManagerUsageSyncMessage)message;
- (NSError)error;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setMessage:(id)a3;
- (void)setRecoverable:(BOOL)a3;
@end

@implementation CLClientManagerUsageSyncMessageError

- (void)dealloc
{
  self->_message = 0LL;
  self->_error = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLClientManagerUsageSyncMessageError;
  -[CLClientManagerUsageSyncMessageError dealloc](&v3, "dealloc");
}

- (CLClientManagerUsageSyncMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)recoverable
{
  return self->_recoverable;
}

- (void)setRecoverable:(BOOL)a3
{
  self->_recoverable = a3;
}

@end