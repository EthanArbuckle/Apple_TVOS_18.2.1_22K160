@interface NSURLResponseInternal
- (NSURLResponseInternal)init;
- (URLResponse)_inner;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NSURLResponseInternal

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSURLResponseInternal;
  -[NSURLResponseInternal dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  self->_response._vptr$CoreLoggable = (void **)off_189C07248;
  self->_response.fMIMEType = 0LL;
  self->_response.fPeerAddress = 0LL;
  self->_response.fHTTP = 0LL;
  self->_response.fExpectedContentLength = -1LL;
  self->_response.fCreationTime = CFAbsoluteTimeGetCurrent();
  self->_response.fExpiration = 1.79769313e308;
  self->_response.fRecommendedPolicy = 0;
  *(_WORD *)&self->_response.fConnectionDidFallback = 0;
  return self;
}

- (NSURLResponseInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSURLResponseInternal;
  return -[NSURLResponseInternal init](&v3, sel_init);
}

- (URLResponse)_inner
{
  return &self->_response;
}

@end