@interface StreamContext
- (OS_dispatch_source)readSource;
- (StreamContext)init;
- (unsigned)streamFlags;
- (void)setReadSource:(id)a3;
- (void)setStreamFlags:(unsigned int)a3;
@end

@implementation StreamContext

- (StreamContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StreamContext;
  return -[StreamContext init](&v3, "init");
}

- (OS_dispatch_source)readSource
{
  return self->_readSource;
}

- (void)setReadSource:(id)a3
{
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_streamFlags = a3;
}

- (void).cxx_destruct
{
}

@end