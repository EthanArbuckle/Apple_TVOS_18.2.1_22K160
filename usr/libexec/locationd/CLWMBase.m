@interface CLWMBase
- (CLWMBase)init;
- (double)makeSafeCFAbsoluteTime:(double)a3;
- (id)metadata;
- (int)getSampleCount;
- (void)dealloc;
- (void)setPrivacyTimeOffset:(double)a3;
@end

@implementation CLWMBase

- (CLWMBase)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWMBase;
  return -[CLWMBase init](&v3, "init");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLWMBase;
  -[CLWMBase dealloc](&v2, "dealloc");
}

- (id)metadata
{
  return 0LL;
}

- (void)setPrivacyTimeOffset:(double)a3
{
  self->_privacyTimeOffset = a3;
}

- (double)makeSafeCFAbsoluteTime:(double)a3
{
  if (a3 == 0.0) {
    return 0.0;
  }
  else {
    return self->_privacyTimeOffset + a3;
  }
}

- (int)getSampleCount
{
  return 0;
}

@end