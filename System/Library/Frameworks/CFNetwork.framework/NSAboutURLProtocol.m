@interface NSAboutURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation NSAboutURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  if (!a3 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }

  return [a3 _URLHasScheme:@"about"];
}

+ (id)canonicalRequestForRequest:(id)a3
{
  if (!a3 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_18298D000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }

  return a3;
}

- (void)startLoading
{
  id v3 = -[NSURLProtocol client](self, "client");
  v4 = -[NSURLResponse initWithURL:MIMEType:expectedContentLength:textEncodingName:]( objc_alloc(&OBJC_CLASS___NSURLResponse),  "initWithURL:MIMEType:expectedContentLength:textEncodingName:",  -[NSURLRequest URL](-[NSURLProtocol request](self, "request"), "URL"),  @"text/html",  0LL,  0LL);
  [v3 URLProtocol:self didReceiveResponse:v4 cacheStoragePolicy:2];

  [v3 URLProtocolDidFinishLoading:self];
}

@end