@interface _NSCFURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)canInitWithTask:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (const)_cf_internalImpl;
+ (id)canonicalRequestForRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4;
- (_NSCFURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation _NSCFURLProtocol

+ (BOOL)canInitWithTask:(id)a3
{
  uint64_t v4 = objc_msgSend(a1, "_cf_internalImpl");
  v5 = *(uint64_t (**)(id, void))(v4 + 72);
  if (v5) {
    int v6 = v5(a3, 0LL);
  }
  else {
    int v6 = (*(uint64_t (**)(uint64_t, void))(v4 + 40))([a3 currentRequest], 0);
  }
  return v6 != 0;
}

+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4
{
  uint64_t v6 = objc_msgSend(a1, "_cf_internalImpl");
  v7 = (const void *)(*(uint64_t (**)(void, id, id, void))(v6 + 48))(*MEMORY[0x189604DB0], a3, a4, 0LL);
  id v8 = -[NSURLRequest _initWithCFURLRequest:](objc_alloc(&OBJC_CLASS___NSURLRequest), "_initWithCFURLRequest:", v7);
  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  return (*(unsigned int (**)(id, void))(objc_msgSend(a1, "_cf_internalImpl") + 40))(a3, 0) != 0;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( [NSURLSessionTask alloc],  "initWithOriginalRequest:ident:taskGroup:",  a3,  0,  [(id)+[NSURLSession _sharedSessionForConnection]() defaultTaskGroup]);
  uint64_t v6 = (void *)[a1 canonicalRequestForRequest:a3 task:v5];

  return v6;
}

- (_NSCFURLProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____NSCFURLProtocol;
  v7 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v12, sel_initWithRequest_cachedResponse_client_, a3, a4);
  if (v7)
  {
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "_cf_internalImpl");
    v9 = (NSCFURLProtocolClient *)operator new(0x20uLL);
    v9->var0 = (void **)off_189C05478;
    v9->var1 = (void **)&unk_189C05538;
    v9->var2 = a5;
    v9->var3 = v7;
    v7->_client = v9;
    v10 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]( [NSURLSessionTask alloc],  "initWithOriginalRequest:ident:taskGroup:",  a3,  0,  [(id)+[NSURLSession _sharedSessionForConnection]() defaultTaskGroup]);
    v7->_prot = (_CFURLProtocol *)(*(uint64_t (**)(void, NSURLSessionTask *, NSCFURLProtocolClient *, uint64_t))(v8 + 64))( *MEMORY[0x189604DB0],  v10,  v7->_client,  v8);
  }

  return v7;
}

- (void)dealloc
{
  prot = self->_prot;
  if (prot) {
    CFRelease(prot);
  }
  client = self->_client;
  if (client) {
    (*((void (**)(NSCFURLProtocolClient *, SEL))client->var0 + 1))(client, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSCFURLProtocol;
  -[NSURLProtocol dealloc](&v5, sel_dealloc);
}

- (void)startLoading
{
  prot = self->_prot;
  if (prot)
  {
    prot = (_CFURLProtocol *)((char *)prot + 16);
  }

  (*(void (**)(_CFURLProtocol *, _CFCachedURLResponse *))(*(void *)prot + 88LL))( prot,  -[NSCachedURLResponse _CFCachedURLResponse]( -[NSURLProtocol cachedResponse](self, "cachedResponse"),  "_CFCachedURLResponse"));
}

- (void)stopLoading
{
  prot = self->_prot;
  (*(void (**)(uint64_t))(*((void *)prot + 2) + 96LL))((uint64_t)prot + 16);
}

+ (const)_cf_internalImpl
{
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return (*(unsigned int (**)(id, id, void))(objc_msgSend(a1, "_cf_internalImpl") + 56))(a3, a4, 0) != 0;
}

@end