@interface FairPlayDecryptSession
- (void)dealloc;
@end

@implementation FairPlayDecryptSession

- (void)dealloc
{
  session = self->_session;
  if (session)
  {
    sub_1001802D4((uint64_t)session);
    self->_session = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FairPlayDecryptSession;
  -[FairPlayDecryptSession dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end