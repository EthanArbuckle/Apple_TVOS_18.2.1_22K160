@interface NRDTestServer
- (void)dealloc;
@end

@implementation NRDTestServer

- (void)dealloc
{
  if (qword_1001DC788 != -1) {
    dispatch_once(&qword_1001DC788, &stru_1001AE940);
  }
  if (_NRLogIsLevelEnabled(qword_1001DC780, 1LL))
  {
    if (qword_1001DC788 != -1) {
      dispatch_once(&qword_1001DC788, &stru_1001AE940);
    }
    _NRLogWithArgs(qword_1001DC780, 1LL, "%s%.30s:%-4d Dealloc: %@", ", "-[NRDTestServer dealloc]"", 236LL, self);
  }

  if (self)
  {
    udpInputSource = self->_udpInputSource;
    if (udpInputSource)
    {
      dispatch_source_cancel((dispatch_source_t)udpInputSource);
      v4 = self->_udpInputSource;
      self->_udpInputSource = 0LL;
    }

    udpInputSourceCloud = self->_udpInputSourceCloud;
    if (udpInputSourceCloud)
    {
      dispatch_source_cancel((dispatch_source_t)udpInputSourceCloud);
      v6 = self->_udpInputSourceCloud;
      self->_udpInputSourceCloud = 0LL;
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NRDTestServer;
  -[NRDTestServer dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
}

@end