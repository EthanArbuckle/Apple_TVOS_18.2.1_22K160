@interface AMSupportOSURLSession
- (AMSupportOSURLSession)initWithOptions:(id)a3;
- (BOOL)sslEvalFailed;
- (NSDictionary)options;
- (NSURLSession)session;
- (OS_dispatch_queue)queue;
- (double)timeout;
- (float)priority;
- (id)_defaultSessionConfigurationWithIdentifier:(id)a3;
- (id)_newSession;
- (id)_urlRequestForHTTPMessage:(__CFHTTPMessage *)a3;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)invalidateAndCancel;
- (void)sendRequest:(__CFHTTPMessage *)a3 completion:(id)a4;
- (void)setOptions:(id)a3;
- (void)setPriority:(float)a3;
- (void)setQueue:(id)a3;
- (void)setSession:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation AMSupportOSURLSession

- (id)_defaultSessionConfigurationWithIdentifier:(id)a3
{
  v4 = (void *)objc_msgSend(MEMORY[0x189601F00], "ephemeralSessionConfiguration", a3);
  id v5 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"SocksProxySettings");
  if (v5)
  {
    v6 = v5;
    id v7 = v5;
LABEL_3:
    [v4 setConnectionProxyDictionary:v6];

    goto LABEL_4;
  }

  if (objc_msgSend( -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"UsePurpleReverseProxy"),  "BOOLValue"))
  {
    v6 = (void *)AMSupportHttpCopyProxySettings(0LL, 0LL);
    if (v6) {
      goto LABEL_3;
    }
  }

- (id)_newSession
{
  return (id)objc_msgSend( MEMORY[0x189601EF8],  "sessionWithConfiguration:delegate:delegateQueue:",  -[AMSupportOSURLSession _defaultSessionConfigurationWithIdentifier:]( self,  "_defaultSessionConfigurationWithIdentifier:",  @"com.apple.libamsupport.http-traffic"),  self,  0);
}

- (AMSupportOSURLSession)initWithOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___AMSupportOSURLSession;
  v4 = -[AMSupportOSURLSession init](&v10, sel_init);
  if (v4)
  {
    id v5 = (void *)[a3 objectForKey:@"Timeout"];
    if (v5) {
      [v5 doubleValue];
    }
    else {
      uint64_t v6 = 0x4072C00000000000LL;
    }
    *(void *)&v4->_timeout = v6;
    id v7 = (void *)[a3 objectForKey:@"Priority"];
    if (v7) {
      [v7 floatValue];
    }
    else {
      float v8 = 0.5;
    }
    v4->_priority = v8;
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.libamsupport.http-session", 0LL);
    v4->_options = (NSDictionary *)a3;
    v4->_session = (NSURLSession *)-[AMSupportOSURLSession _newSession](v4, "_newSession");
    v4->_sslEvalFailed = 0;
  }

  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  queue = self->_queue;
  if (queue)
  {
    dispatch_release((dispatch_object_t)queue);
    self->_queue = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AMSupportOSURLSession;
  -[AMSupportOSURLSession dealloc](&v4, sel_dealloc);
}

- (void)invalidateAndCancel
{
}

- (id)_urlRequestForHTTPMessage:(__CFHTTPMessage *)a3
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = CFHTTPMessageCopyRequestURL(a3);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = (void *)[MEMORY[0x189601EB0] requestWithURL:v5 cachePolicy:1 timeoutInterval:self->_timeout];
  if (!v6) {
    return v6;
  }
  id v7 = (id)CFHTTPMessageCopyRequestMethod(a3);
  if (!v7) {
    return 0LL;
  }
  [v6 setHTTPMethod:v7];
  float v8 = CFHTTPMessageCopyAllHeaderFields(a3);
  if (v8) {
    [v6 setAllHTTPHeaderFields:v8];
  }
  v9 = CFHTTPMessageCopyBody(a3);
  if (v9) {
    [v6 setHTTPBody:v9];
  }
  return v6;
}

- (void)sendRequest:(__CFHTTPMessage *)a3 completion:(id)a4
{
  v5[7] = *MEMORY[0x1895F89C0];
  queue = self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __48__AMSupportOSURLSession_sendRequest_completion___block_invoke;
  v5[3] = &unk_18A0D1910;
  v5[5] = a4;
  v5[6] = a3;
  v5[4] = self;
  dispatch_sync((dispatch_queue_t)queue, v5);
}

void __48__AMSupportOSURLSession_sendRequest_completion___block_invoke(uint64_t a1)
{
  block[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = [*(id *)(a1 + 32) _urlRequestForHTTPMessage:*(void *)(a1 + 48)];
  if (v2)
  {
    float v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) dataTaskWithRequest:v2 completionHandler:*(void *)(a1 + 40)];
    LODWORD(v9) = *(_DWORD *)(*(void *)(a1 + 32) + 24LL);
    [v8 setPriority:v9];
    [v8 resume];
  }

  else
  {
    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLSession sendRequest:completion:]_block_invoke",  (uint64_t)"Could not construct NSURLRequest from message %@",  v3,  v4,  v5,  v6,  v7,  *(void *)(a1 + 48));
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __48__AMSupportOSURLSession_sendRequest_completion___block_invoke_2;
    block[3] = &unk_18A0D18E8;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(global_queue, block);
  }

uint64_t __48__AMSupportOSURLSession_sendRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 32) + 16))( *(void *)(a1 + 32),  0,  0,  [MEMORY[0x189607870] errorWithDomain:@"AMSupportError" code:3 userInfo:0]);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  if (a4) {
    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didBecomeInvalidWithError:]",  (uint64_t)"Session %@ became invalid: %@",  (uint64_t)a4,  v4,  v5,  v6,  v7,  (char)a3);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  float v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"Authentication challenge received.  Method: %@",  v9,  v10,  v11,  v12,  v13,  (char)v8);
  if ([a4 previousFailureCount] >= 1)
  {
    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"Multiple challenge failures. Request failed.",  v14,  v15,  v16,  v17,  v18,  v67);
    v19 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);
    id v20 = a5;
    uint64_t v21 = 2LL;
LABEL_3:
    v19(v20, v21, 0LL);
    return;
  }

  if ([v8 isEqual:*MEMORY[0x189601E40]]
    && -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"ClientIdentity"))
  {
    AMSupportLogInternal( 6LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"Received client certificate challenge. Client SSL authentication failed.",  v22,  v23,  v24,  v25,  v26,  v67);
LABEL_32:
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 2LL, 0LL);
    return;
  }

  if (([v8 isEqual:*MEMORY[0x189601E58]] & 1) == 0)
  {
    v19 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);
    id v20 = a5;
    uint64_t v21 = 1LL;
    goto LABEL_3;
  }

  id v27 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"DisableSSLValidation");
  if (objc_msgSend(v27, "isEqual:", objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1)))
  {
    AMSupportLogInternal( 6LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"SSL validation disabled.  Attempting to continue without authentication.",  v28,  v29,  v30,  v31,  v32,  v67);
    (*((void (**)(id, void, uint64_t))a5 + 2))( a5,  0,  objc_msgSend( MEMORY[0x189601EC8],  "credentialForTrust:",  objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")));
    return;
  }

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"TrustedServerCAs");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"TrustedServerCAs");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      (*((void (**)(id, uint64_t, uint64_t))a5 + 2))( a5,  1,  objc_msgSend( MEMORY[0x189601EC8],  "credentialForTrust:",  objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")));
      return;
    }
  }

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"TrustedServerCAs");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v34 = -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"TrustedServerCAs");
  v69 = self;
  id v70 = a5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v34 = (id)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  -[NSDictionary objectForKey:](self->_options, "objectForKey:", @"TrustedServerCAs"));
    }
    else {
      id v34 = 0LL;
    }
  }

  v35 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  uint64_t v36 = [v34 countByEnumeratingWithState:&v73 objects:v72 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v74;
    v39 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      for (uint64_t i = 0LL; i != v37; ++i)
      {
        if (*(void *)v74 != v38) {
          objc_enumerationMutation(v34);
        }
        v41 = *(const __CFData **)(*((void *)&v73 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          SecCertificateRef v42 = SecCertificateCreateWithData(v39, v41);
          if (v42)
          {
            SecCertificateRef v48 = v42;
            [v35 addObject:v42];
            CFRelease(v48);
          }

          else
          {
            AMSupportLogInternal( 4LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"trusted certificate could not be loaded %@",  v43,  v44,  v45,  v46,  v47,  (char)v41);
          }
        }
      }

      uint64_t v37 = [v34 countByEnumeratingWithState:&v73 objects:v72 count:16];
    }

    while (v37);
  }

  v49 = (__SecTrust *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust");
  int v71 = 0;
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"Attempting trust evaluate",  v50,  v51,  v52,  v53,  v54,  v67);
  int v60 = AMSupportX509ChainEvaluateTrust(v49, (CFArrayRef)v35, &v71, v55, v56, v57, v58, v59);
  if (v60)
  {
    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"trust evaluation failed (OSStatus=%d)",  v61,  v62,  v63,  v64,  v65,  v60);
    v66 = v69;
    a5 = v70;
LABEL_31:
    v66->_sslEvalFailed = 1;
    goto LABEL_32;
  }

  v66 = v69;
  a5 = v70;
  if (v71 != 4 && v71 != 1)
  {
    AMSupportLogInternal( 4LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"trust evaluation did not result in okay to proceed (result=%d)",  v61,  v62,  v63,  v64,  v65,  v71);
    goto LABEL_31;
  }

  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLSession URLSession:didReceiveChallenge:completionHandler:]",  (uint64_t)"Trust evaluation succeeded, proceeding..",  v61,  v62,  v63,  v64,  v65,  v68);
  (*((void (**)(id, void, uint64_t))v70 + 2))( v70,  0,  [MEMORY[0x189601EC8] credentialForTrust:v49]);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)sslEvalFailed
{
  return self->_sslEvalFailed;
}

@end