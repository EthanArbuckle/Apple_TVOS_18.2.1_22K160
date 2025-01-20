@interface CLActivityLoggerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLActivityLoggerAdapter)init;
- (void)beginService;
- (void)endService;
- (void)logData:(id)a3;
- (void)logger;
- (void)setLogger:(void *)a3;
@end

@implementation CLActivityLoggerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993E48 != -1) {
    dispatch_once(&qword_101993E48, &stru_10182D178);
  }
  return (id)qword_101993E40;
}

- (CLActivityLoggerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLActivityLoggerAdapter;
  return -[CLActivityLoggerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLActivityLoggerProtocol,  &OBJC_PROTOCOL___CLActivityLoggerClientProtocol);
}

+ (BOOL)isSupported
{
  return sub_1004F7000();
}

- (void)beginService
{
  self->_logger = (void *)sub_100278280((uint64_t)-[CLActivityLoggerAdapter universe](self, "universe"));
}

- (void)endService
{
  logger = self->_logger;
  if (logger)
  {
    v4 = (void *)sub_100278B40((uint64_t)logger);
    operator delete(v4);
  }

  self->_logger = 0LL;
}

- (void)logData:(id)a3
{
  logger = (id *)self->_logger;
  if (logger)
  {
    [*logger silo];
    if (*((_BYTE *)logger + 72)) {
      sub_100265508(logger + 3, a3);
    }
  }

- (void)logger
{
  return self->_logger;
}

- (void)setLogger:(void *)a3
{
  self->_logger = a3;
}

@end