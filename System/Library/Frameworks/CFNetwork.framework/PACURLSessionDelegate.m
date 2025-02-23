@interface PACURLSessionDelegate
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
@end

@implementation PACURLSessionDelegate

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_atomic(self, a2, 0LL, 8LL);
    objc_setProperty_atomic(self, v3, 0LL, 16LL);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PACURLSessionDelegate;
  -[PACURLSessionDelegate dealloc](&v4, "dealloc");
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = objc_msgSend(objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC received challenge for %@",  (uint8_t *)&v16,  0xCu);
  }

  if (self
    && objc_getProperty(self, v9, 8LL, 1)
    && objc_getProperty(self, v10, 16LL, 1)
    && (([v8 isEqualToString:NSURLAuthenticationMethodNegotiate] & 1) != 0
     || [v8 isEqualToString:NSURLAuthenticationMethodNTLM]))
  {
    v11 = objc_alloc(&OBJC_CLASS___NSURLCredential);
    id Property = objc_getProperty(self, v12, 8LL, 1);
    v15 =  -[NSURLCredential initWithUser:password:persistence:]( v11,  "initWithUser:password:persistence:",  Property,  objc_getProperty(self, v14, 16LL, 1),  1LL);
    (*((void (**)(id, void, NSURLCredential *))a5 + 2))(a5, 0LL, v15);
  }

  else
  {
    (*((void (**)(id, uint64_t, id))a5 + 2))(a5, 1, [a4 proposedCredential]);
  }

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9 = objc_msgSend(objc_msgSend(a5, "protectionSpace", a3, a4), "authenticationMethod");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PAC received challenge for %@",  (uint8_t *)&v17,  0xCu);
  }

  if (self
    && objc_getProperty(self, v10, 8LL, 1)
    && objc_getProperty(self, v11, 16LL, 1)
    && (([v9 isEqualToString:NSURLAuthenticationMethodHTTPDigest] & 1) != 0
     || [v9 isEqualToString:NSURLAuthenticationMethodHTTPBasic]))
  {
    SEL v12 = objc_alloc(&OBJC_CLASS___NSURLCredential);
    id Property = objc_getProperty(self, v13, 8LL, 1);
    int v16 =  -[NSURLCredential initWithUser:password:persistence:]( v12,  "initWithUser:password:persistence:",  Property,  objc_getProperty(self, v15, 16LL, 1),  1LL);
    (*((void (**)(id, void, NSURLCredential *))a6 + 2))(a6, 0LL, v16);
  }

  else
  {
    (*((void (**)(id, uint64_t, id))a6 + 2))(a6, 1, [a5 proposedCredential]);
  }

@end