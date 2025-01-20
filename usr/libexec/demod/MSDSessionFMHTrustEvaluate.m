@interface MSDSessionFMHTrustEvaluate
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionFMHTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v5 = CFDataCreate(kCFAllocatorDefault, byte_100124868, dword_100124BF0);
  if (!v5)
  {
    id v16 = sub_10003A95C();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009B38C(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    return 0;
  }

  v6 = v5;
  SecCertificateRef v7 = SecCertificateCreateWithData(kCFAllocatorDefault, v5);
  if (!v7)
  {
    id v25 = sub_10003A95C();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10009B3FC(v26, v27, v28, v29, v30, v31, v32, v33);
    }

    CFRelease(v6);
    return 0;
  }

  SecCertificateRef v8 = v7;
  v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v7, 0LL));
  OSStatus v10 = SecTrustSetAnchorCertificates(a3, v9);
  if (v10)
  {
    OSStatus v34 = v10;
    id v35 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[MSDSessionFMHTrustEvaluate trustServer:isRedirect:]";
      __int16 v47 = 2048;
      uint64_t v48 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Cannot set demounit anchor certificates: %ld",  buf,  0x16u);
    }

    goto LABEL_25;
  }

  SecTrustResultType result = kSecTrustResultInvalid;
  uint64_t v11 = SecTrustEvaluate(a3, &result);
  if ((_DWORD)v11)
  {
    uint64_t v36 = v11;
    id v37 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100091DD8(v36, v13, v38, v39, v40, v41, v42, v43);
    }
LABEL_25:
    BOOL v14 = 0;
    goto LABEL_10;
  }

  if (result != kSecTrustResultUnspecified && result != kSecTrustResultProceed)
  {
    BOOL v14 = 0;
    goto LABEL_12;
  }

  id v12 = sub_10003A95C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Demounit server certificate is valid.",  buf,  2u);
  }

  BOOL v14 = 1;
LABEL_10:

LABEL_12:
  CFRelease(v6);
  CFRelease(v8);

  return v14;
}

@end