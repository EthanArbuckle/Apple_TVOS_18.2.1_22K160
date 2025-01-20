@interface CLCertificatePinningHelper
+ (id)knownHosts;
+ (int)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
+ (void)initialize;
@end

@implementation CLCertificatePinningHelper

+ (void)initialize
{
  if (qword_100011420 != -1) {
    dispatch_once(&qword_100011420, &stru_10000C5F8);
  }
}

+ (id)knownHosts
{
  return [(id)qword_100011428 allKeys];
}

+ (int)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  if (!objc_msgSend( objc_msgSend(objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod"),  "isEqualToString:",  NSURLAuthenticationMethodServerTrust)) {
    goto LABEL_18;
  }
  id v7 = objc_msgSend(objc_msgSend(a4, "protectionSpace"), "host");
  v8 = (__SecTrust *)objc_msgSend(objc_msgSend(a4, "protectionSpace"), "serverTrust");
  v9 = (NSNull *)[(id)qword_100011428 objectForKeyedSubscript:v7];
  if (v9)
  {
    v10 = v9;
    if (v9 == +[NSNull null](&OBJC_CLASS___NSNull, "null"))
    {
      if (qword_100011280 != -1) {
        dispatch_once(&qword_100011280, &stru_10000C618);
      }
      v20 = (os_log_s *)qword_100011288;
      if (!os_log_type_enabled((os_log_t)qword_100011288, OS_LOG_TYPE_INFO))
      {
        unsigned int v16 = 3;
        goto LABEL_21;
      }

      *(_DWORD *)buf = 68289283;
      int v37 = 0;
      __int16 v38 = 2082;
      v39 = "";
      __int16 v40 = 2081;
      id v41 = [v7 UTF8String];
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:#Warning Empty pinning rule for host, host:%{private, location:escape_only}s}",  buf,  0x1Cu);
      unsigned int v16 = 3;
      goto LABEL_19;
    }

    AppleSSLPinned = (const void *)SecPolicyCreateAppleSSLPinned(v7, v7, 0LL, v10);
    if (AppleSSLPinned)
    {
      v12 = AppleSSLPinned;
      OSStatus v13 = SecTrustSetPolicies(v8, AppleSSLPinned);
      CFRelease(v12);
      SecTrustResultType v14 = kSecTrustResultInvalid;
      SecTrustResultType result = kSecTrustResultInvalid;
      if (v13)
      {
LABEL_8:
        if (v14 == kSecTrustResultProceed || v14 == kSecTrustResultUnspecified) {
          unsigned int v16 = 1;
        }
        else {
          unsigned int v16 = 2;
        }
LABEL_19:
        if (qword_100011280 != -1) {
          dispatch_once(&qword_100011280, &stru_10000C618);
        }
        goto LABEL_21;
      }

      CFErrorRef err = 0LL;
      if (SecTrustEvaluateWithError(v8, &err))
      {
        SecTrustGetTrustResult(v8, &result);
        SecTrustResultType v14 = result;
        goto LABEL_8;
      }

      if (qword_100011280 != -1) {
        dispatch_once(&qword_100011280, &stru_10000C618);
      }
      v28 = (os_log_s *)qword_100011288;
      if (os_log_type_enabled((os_log_t)qword_100011288, OS_LOG_TYPE_ERROR))
      {
        CFIndex Code = CFErrorGetCode(err);
        CFErrorDomain Domain = CFErrorGetDomain(err);
        *(_DWORD *)buf = 68289539;
        int v37 = 0;
        __int16 v38 = 2082;
        v39 = "";
        __int16 v40 = 2049;
        id v41 = (id)Code;
        __int16 v42 = 2113;
        CFErrorDomain v43 = Domain;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:Can't SecTrustEvaluate returned the error, errorCode:%{private}ld, error:%{pr ivate, location:escape_only}@}",  buf,  0x26u);
        if (qword_100011280 != -1) {
          dispatch_once(&qword_100011280, &stru_10000C618);
        }
      }

      uint64_t v31 = qword_100011288;
      if (!os_signpost_enabled((os_log_t)qword_100011288))
      {
LABEL_50:
        unsigned int v16 = 2;
        goto LABEL_19;
      }

      CFIndex v32 = CFErrorGetCode(err);
      CFErrorDomain v33 = CFErrorGetDomain(err);
      *(_DWORD *)buf = 68289539;
      int v37 = 0;
      __int16 v38 = 2082;
      v39 = "";
      __int16 v40 = 2049;
      id v41 = (id)v32;
      __int16 v42 = 2113;
      CFErrorDomain v43 = v33;
      v25 = "Can't SecTrustEvaluate returned the error";
      v26 = "{msg%{public}.0s:Can't SecTrustEvaluate returned the error, errorCode:%{private}ld, error:%{"
            "private, location:escape_only}@}";
      v27 = (os_log_s *)v31;
    }

    else
    {
      if (qword_100011280 != -1) {
        dispatch_once(&qword_100011280, &stru_10000C618);
      }
      v21 = (os_log_s *)qword_100011288;
      if (os_log_type_enabled((os_log_t)qword_100011288, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289538;
        int v37 = 0;
        __int16 v38 = 2082;
        v39 = "";
        __int16 v40 = 2082;
        id v41 = [v7 UTF8String];
        __int16 v42 = 2082;
        CFErrorDomain v43 = (CFErrorDomain)-[NSNull UTF8String](v10, "UTF8String");
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Unable to create a security policy, host:%{public, location:escape_only}s, leaf OID:%{public, location:escape_only}s}",  buf,  0x26u);
        if (qword_100011280 != -1) {
          dispatch_once(&qword_100011280, &stru_10000C618);
        }
      }

      uint64_t v22 = qword_100011288;
      if (!os_signpost_enabled((os_log_t)qword_100011288))
      {
        unsigned int v16 = 2;
        goto LABEL_21;
      }

      id v23 = [v7 UTF8String];
      v24 = (const __CFString *)-[NSNull UTF8String](v10, "UTF8String");
      *(_DWORD *)buf = 68289538;
      int v37 = 0;
      __int16 v38 = 2082;
      v39 = "";
      __int16 v40 = 2082;
      id v41 = v23;
      __int16 v42 = 2082;
      CFErrorDomain v43 = v24;
      v25 = "Unable to create a security policy";
      v26 = "{msg%{public}.0s:Unable to create a security policy, host:%{public, location:escape_only}s, le"
            "afOID:%{public, location:escape_only}s}";
      v27 = (os_log_s *)v22;
    }

    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v27,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v25,  v26,  buf,  0x26u);
    goto LABEL_50;
  }

  if (qword_100011280 != -1) {
    dispatch_once(&qword_100011280, &stru_10000C618);
  }
  v17 = (os_log_s *)qword_100011288;
  unsigned int v16 = 0;
  if (os_log_type_enabled((os_log_t)qword_100011288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289283;
    int v37 = 0;
    __int16 v38 = 2082;
    v39 = "";
    __int16 v40 = 2081;
    id v41 = [v7 UTF8String];
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning No pinning rule for host, host:%{private, location:escape_only}s}",  buf,  0x1Cu);
LABEL_18:
    unsigned int v16 = 0;
    goto LABEL_19;
  }

@end