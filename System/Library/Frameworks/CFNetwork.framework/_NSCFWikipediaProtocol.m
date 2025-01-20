@interface _NSCFWikipediaProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
- (_NSCFWikipediaProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5;
- (void)dealloc;
- (void)startLoading;
- (void)stopLoading;
@end

@implementation _NSCFWikipediaProtocol

- (_NSCFWikipediaProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSCFWikipediaProtocol;
  v5 = -[NSURLProtocol initWithRequest:cachedResponse:client:]( &v9,  sel_initWithRequest_cachedResponse_client_,  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    p_callbacks = &v5->_callbacks;
    v5->_instance = (const void *)off_18C5B2F38(v5, &v5->_callbacks, qword_18C5B2F00);
    if ((*p_callbacks)->var0 != 2) {
      __assert_rtn( "-[_NSCFWikipediaProtocol initWithRequest:cachedResponse:client:]",  "CFURLProtocol.mm",  122,  "_callbacks->version == 2");
    }
    if (!(*p_callbacks)->var6) {
      __assert_rtn( "-[_NSCFWikipediaProtocol initWithRequest:cachedResponse:client:]",  "CFURLProtocol.mm",  123,  "_callbacks->start != NULL");
    }
  }

  return v6;
}

- (void)dealloc
{
  if (self->_instance)
  {
    var2 = (void (*)(void))self->_callbacks->var2;
    if (var2) {
      var2();
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSCFWikipediaProtocol;
  -[NSURLProtocol dealloc](&v4, sel_dealloc);
}

- (void)startLoading
{
}

- (void)stopLoading
{
}

+ (BOOL)canInitWithRequest:(id)a3
{
  return off_18C5B2F20(a3, qword_18C5B2F00) != 0;
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