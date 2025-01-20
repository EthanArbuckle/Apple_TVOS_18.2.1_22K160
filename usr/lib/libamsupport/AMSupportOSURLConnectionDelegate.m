@interface AMSupportOSURLConnectionDelegate
- (AMSupportOSURLConnectionDelegate)init;
- (AMSupportOSURLConnectionDelegate)initWithData:(id)a3 Options:(id)a4;
- (NSData)data;
- (NSError)error;
- (id)waitForResponseOrError:(id *)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
@end

@implementation AMSupportOSURLConnectionDelegate

- (AMSupportOSURLConnectionDelegate)init
{
  return -[AMSupportOSURLConnectionDelegate initWithData:Options:]( self,  "initWithData:Options:",  [MEMORY[0x189603FB8] dataWithCapacity:0],  0);
}

- (AMSupportOSURLConnectionDelegate)initWithData:(id)a3 Options:(id)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate initWithData:Options:]",  (uint64_t)"init-ing delegate with data=%@ options=%@",  (uint64_t)a4,  v4,  v5,  v6,  v7,  (char)a3);
  if (!libSecurity)
  {
    strcpy(__path, "Security.framework/Versions/Current/Security");
    strcpy(__symbol, "kSecImportExportPassphrase");
    strcpy(v34, "kSecImportItemIdentity");
    strcpy(v33, "SecPKCS12Import");
    v11 = dlopen(__path, 261);
    v12 = v11;
    if (v11)
    {
      dlhandle_kSecImportExportPassphrase = (uint64_t)dlsym(v11, __symbol);
      dlhandle_kSecImportItemIdentity = (uint64_t)dlsym(v12, v34);
      v13 = dlsym(v12, v33);
      dlhandle_SecPKCS12Import = v13;
      if (dlhandle_kSecImportExportPassphrase && dlhandle_kSecImportItemIdentity && v13)
      {
LABEL_6:
        libSecurity = (uint64_t)v12;
        goto LABEL_7;
      }

      AMSupportLogInternal( 3LL,  (uint64_t)"libAMSupportLoadLibrary",  (uint64_t)"Missing symbols.",  v14,  v15,  v16,  v17,  v18,  v31);
    }

    else
    {
      v23 = (FILE *)*MEMORY[0x1895F89D0];
      v24 = dlerror();
      fprintf(v23, "failed to load %s: %s\n", __path, v24);
    }

    char v25 = dlerror();
    AMSupportLogInternal( 3LL,  (uint64_t)"libAMSupportLoadLibrary",  (uint64_t)"Security Framework does not have expected symbols, aborting. %s",  v26,  v27,  v28,  v29,  v30,  v25);
    if (v12)
    {
      dlclose(v12);
      v12 = 0LL;
    }

    goto LABEL_6;
  }

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate dealloc]",  (uint64_t)"dealloc-ing delegate",  v2,  v3,  v4,  v5,  v6,  v8);
  if (libSecurity)
  {
    dlclose((void *)libSecurity);
    libSecurity = 0LL;
  }

  self->response = 0LL;
  self->_data = 0LL;

  self->_error = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AMSupportOSURLConnectionDelegate;
  -[AMSupportOSURLConnectionDelegate dealloc](&v9, sel_dealloc);
}

- (id)waitForResponseOrError:(id *)a3
{
  uint64_t v5 = *MEMORY[0x189603A40];
  do
  {
    if (self->requestComplete) {
      break;
    }
    uint64_t v6 = (void *)[MEMORY[0x189604008] currentRunLoop];
  }

  while ((objc_msgSend(v6, "runMode:beforeDate:", v5, objc_msgSend(MEMORY[0x189603F50], "distantFuture")) & 1) != 0);
  error = self->_error;
  if (!error) {
    return self->response;
  }
  if (!a3) {
    return 0LL;
  }
  char v8 = error;
  id result = 0LL;
  *a3 = v8;
  return result;
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  keys[1] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)objc_msgSend((id)objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Authentication challenge received.  Method: %@",  v7,  v8,  v9,  v10,  v11,  (char)v6);
  if ([a4 previousFailureCount] >= 1)
  {
    objc_msgSend((id)objc_msgSend(a4, "sender"), "cancelAuthenticationChallenge:", a4);
    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Multiple challenge failures.  Aborting.",  v12,  v13,  v14,  v15,  v16,  v112);
    return;
  }

  if ([v6 isEqual:*MEMORY[0x189601E40]]
    && -[NSDictionary objectForKey:](self->options, "objectForKey:", @"ClientIdentity"))
  {
    AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Received client certificate challenge.",  v17,  v18,  v19,  v20,  v21,  v96);
    if (!libSecurity)
    {
      AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Security framework (10.6?) unsupported in libamsupport.",  v22,  v23,  v24,  v25,  v26,  v97);
      objc_msgSend((id)objc_msgSend(a4, "sender"), "cancelAuthenticationChallenge:", a4);
      return;
    }

    uint64_t v27 = -[NSDictionary objectForKey:](self->options, "objectForKey:", @"ClientIdentity");
    CFArrayRef theArray = 0LL;
    uint64_t v28 = -[NSDictionary objectForKey:](self->options, "objectForKey:", @"ClientIdentityPassphrase");
    uint64_t v29 = &stru_18A0D1FC8;
    uint64_t v30 = *(void **)dlhandle_kSecImportExportPassphrase;
    if (v28) {
      uint64_t v29 = v28;
    }
    values = v29;
    keys[0] = v30;
    CFDictionaryRef v31 = CFDictionaryCreate(0LL, (const void **)keys, (const void **)&values, 1LL, 0LL, 0LL);
    char Length = CFDataGetLength(v27);
    AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"P12 Identity data length=%d",  v33,  v34,  v35,  v36,  v37,  Length);
    int v38 = dlhandle_SecPKCS12Import(v27, v31, &theArray);
    CFRelease(v31);
    if (!v38)
    {
      AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Successfully imported PKCS12 identity",  v39,  v40,  v41,  v42,  v43,  v98);
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, 0LL);
      Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, *(const void **)dlhandle_kSecImportItemIdentity);
      SecCertificateRef certificateRef = 0LL;
      SecIdentityCopyCertificate(Value, &certificateRef);
      v109 = certificateRef;
      CFArrayRef v57 = CFArrayCreate(0LL, (const void **)&v109, 1LL, 0LL);
      CFRelease(certificateRef);
      uint64_t v58 = [MEMORY[0x189601EC8] credentialWithIdentity:Value certificates:v57 persistence:2];
      CFRelease(v57);
      objc_msgSend((id)objc_msgSend(a4, "sender"), "useCredential:forAuthenticationChallenge:", v58, a4);
      AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Returned credentials for challenge.",  v59,  v60,  v61,  v62,  v63,  v99);
      return;
    }

    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Unable to import client identity, aborting challenge.",  v39,  v40,  v41,  v42,  v43,  v98);
    v44 = (void *)[a4 sender];
    id v45 = a4;
    goto LABEL_36;
  }

  if (([v6 isEqual:*MEMORY[0x189601E58]] & 1) == 0) {
    goto LABEL_18;
  }
  id v46 = -[NSDictionary objectForKey:](self->options, "objectForKey:", @"DisableSSLValidation");
  if (objc_msgSend(v46, "isEqual:", objc_msgSend(MEMORY[0x189607968], "numberWithBool:", 1)))
  {
    AMSupportLogInternal( 6LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"SSL validation disabled.  Attempting to continue without authentication.",  v47,  v48,  v49,  v50,  v51,  v96);
    v52 = (void *)[a4 sender];
    objc_msgSend( v52,  "useCredential:forAuthenticationChallenge:",  objc_msgSend( MEMORY[0x189601EC8],  "credentialForTrust:",  objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")),  a4);
    return;
  }

  -[NSDictionary objectForKey:](self->options, "objectForKey:", @"TrustedServerCAs");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[NSDictionary objectForKey:](self->options, "objectForKey:", @"TrustedServerCAs");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:
      objc_msgSend((id)objc_msgSend(a4, "sender"), "performDefaultHandlingForAuthenticationChallenge:", a4);
      return;
    }
  }

  -[NSDictionary objectForKey:](self->options, "objectForKey:", @"TrustedServerCAs");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v54 = -[NSDictionary objectForKey:](self->options, "objectForKey:", @"TrustedServerCAs");
  id v101 = a4;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v54 = (id)objc_msgSend( MEMORY[0x189603F18],  "arrayWithObject:",  -[NSDictionary objectForKey:](self->options, "objectForKey:", @"TrustedServerCAs"));
    }
    else {
      id v54 = 0LL;
    }
  }

  v64 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v54, "count"));
  __int128 v105 = 0u;
  __int128 v106 = 0u;
  __int128 v107 = 0u;
  __int128 v108 = 0u;
  uint64_t v65 = [v54 countByEnumeratingWithState:&v105 objects:v104 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v106;
    v68 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      for (uint64_t i = 0LL; i != v66; ++i)
      {
        if (*(void *)v106 != v67) {
          objc_enumerationMutation(v54);
        }
        v70 = *(const __CFData **)(*((void *)&v105 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          SecCertificateRef v71 = SecCertificateCreateWithData(v68, v70);
          if (v71)
          {
            SecCertificateRef v77 = v71;
            [v64 addObject:v71];
            CFRelease(v77);
          }

          else
          {
            AMSupportLogInternal( 4LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"trusted certificate could not be loaded %@",  v72,  v73,  v74,  v75,  v76,  (char)v70);
          }
        }
      }

      uint64_t v66 = [v54 countByEnumeratingWithState:&v105 objects:v104 count:16];
    }

    while (v66);
  }

  v78 = (__SecTrust *)objc_msgSend((id)objc_msgSend(v101, "protectionSpace"), "serverTrust");
  LODWORD(theArray) = 0;
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Attempting trust evaluate",  v79,  v80,  v81,  v82,  v83,  v96);
  int v89 = AMSupportX509ChainEvaluateTrust(v78, (CFArrayRef)v64, &theArray, v84, v85, v86, v87, v88);
  if (v89)
  {
    AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"trust evaluation failed (OSStatus=%d)",  v90,  v91,  v92,  v93,  v94,  v89);
LABEL_35:
    v44 = (void *)[v101 sender];
    id v45 = v101;
LABEL_36:
    [v44 cancelAuthenticationChallenge:v45];
    return;
  }

  if ((_DWORD)theArray != 4 && (_DWORD)theArray != 1)
  {
    AMSupportLogInternal( 4LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"trust evaluation did not result in okay to proceed (result=%d)",  v90,  v91,  v92,  v93,  v94,  (char)theArray);
    goto LABEL_35;
  }

  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]",  (uint64_t)"Trust evaluation succeeded, proceeding..",  v90,  v91,  v92,  v93,  v94,  v100);
  v95 = (void *)[v101 sender];
  objc_msgSend( v95,  "useCredential:forAuthenticationChallenge:",  objc_msgSend(MEMORY[0x189601EC8], "credentialForTrust:", v78),  v101);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v5 = (NSURLResponse *)a4;
  self->response = v5;
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didReceiveResponse:]",  (uint64_t)"Received response from URL: %@",  v6,  v7,  v8,  v9,  v10,  (char)v5);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  char v6 = objc_msgSend(a4, "length", a3);
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didReceiveData:]",  (uint64_t)"Receiving %d bytes of data from URL",  v7,  v8,  v9,  v10,  v11,  v6);
  -[NSMutableData appendData:](self->_data, "appendData:", a4);
}

- (void)connectionDidFinishLoading:(id)a3
{
  char v4 = -[NSMutableData length](self->_data, "length", a3);
  AMSupportLogInternal( 7LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connectionDidFinishLoading:]",  (uint64_t)"Finished loading URL.  Total bytes: %d",  v5,  v6,  v7,  v8,  v9,  v4);
  self->requestComplete = 1;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  char v4 = (char)a4;
  self->_error = (NSError *)a4;
  AMSupportLogInternal( 3LL,  (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didFailWithError:]",  (uint64_t)"Connection error %@ for URL",  v6,  v7,  v8,  v9,  v10,  v4);
  self->requestComplete = 1;
}

- (NSData)data
{
  return &self->_data->super;
}

- (NSError)error
{
  return self->_error;
}

@end