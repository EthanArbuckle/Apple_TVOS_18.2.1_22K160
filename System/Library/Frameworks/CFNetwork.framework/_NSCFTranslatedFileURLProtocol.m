@interface _NSCFTranslatedFileURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (const)pimpl;
+ (id)canonicalRequestForRequest:(id)a3;
- (_NSCFTranslatedFileURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation _NSCFTranslatedFileURLProtocol

- (_NSCFTranslatedFileURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSCFTranslatedFileURLProtocol;
  v5 = -[NSURLProtocol initWithRequest:cachedResponse:client:]( &v10,  sel_initWithRequest_cachedResponse_client_,  a3,  a4,  a5);
  if (v5)
  {
    v6 = *(uint64_t (**)(_NSCFTranslatedFileURLProtocol *, const CFURLProtocolInstanceCallbacks **, void))([(id)objc_opt_class() pimpl] + 64);
    uint64_t v7 = [(id)objc_opt_class() pimpl];
    v5->_info = (const void *)v6(v5, &v5->_callbacks, *(void *)(v7 + 8));
    if (!v5->_callbacks->var6) {
      __assert_rtn( "-[_NSCFTranslatedFileURLProtocol initWithRequest:cachedResponse:client:]",  "CFURLProtocol.mm",  32,  "_callbacks->start != NULL");
    }
    var1 = (void (*)(void))v5->_callbacks->var1;
    if (var1) {
      var1();
    }
    v5->_cfurlClient.didReceiveResponse = _CFURLProtocolSendDidReceiveResponseCallback;
    v5->_cfurlClient.didLoadData = _CFURLProtocolSendDidLoadDataCallback;
    v5->_cfurlClient.didFinishLoading = _CFURLProtocolSendDidFinishLoadingCallback;
    v5->_cfurlClient.didFail = _CFURLProtocolSendDidFailCallback;
  }

  return v5;
}

- (void)dealloc
{
  callbacks = self->_callbacks;
  if (callbacks)
  {
    if (self->_info)
    {
      var2 = (void (*)(void))callbacks->var2;
      if (var2)
      {
        var2();
        self->_info = 0LL;
      }
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSCFTranslatedFileURLProtocol;
  -[NSURLProtocol dealloc](&v5, sel_dealloc);
}

- (void)startLoading
{
  callbacks = self->_callbacks;
  if (callbacks)
  {
    var6 = (void (*)(_NSCFTranslatedFileURLProtocol *, const void *))callbacks->var6;
    if (var6) {
      var6(self, self->_info);
    }
  }

- (void)stopLoading
{
  callbacks = self->_callbacks;
  if (callbacks)
  {
    var7 = (void (*)(_NSCFTranslatedFileURLProtocol *, const void *))callbacks->var7;
    if (var7) {
      var7(self, self->_info);
    }
  }

+ (const)pimpl
{
  return 0LL;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  v4 = *(unsigned int (**)(id, void))([(id)objc_opt_class() pimpl] + 40);
  uint64_t v5 = [(id)objc_opt_class() pimpl];
  return v4(a3, *(void *)(v5 + 8)) != 0;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

@end