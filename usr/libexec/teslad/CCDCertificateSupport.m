@interface CCDCertificateSupport
+ (BOOL)verifySignature:(id)a3 payload:(id)a4 clientCertificate:(id)a5;
+ (id)base64Encodedx509CertificateStringFromCertificate:(id)a3;
+ (id)decodeCertificateFromBase64String:(id)a3;
@end

@implementation CCDCertificateSupport

+ (BOOL)verifySignature:(id)a3 payload:(id)a4 clientCertificate:(id)a5
{
  v7 = (const __CFData *)a3;
  v8 = (const __CFData *)a4;
  v9 = (__SecCertificate *)a5;
  v12 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Create signature", buf, 2u);
  }

  v13 = SecCertificateCopyKey(v9);

  v17 = *(os_log_s **)(DEPLogObjects(v14, v15, v16) + 8);
  if (v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Verify signature", buf, 2u);
    }

    CFErrorRef error = 0LL;
    int v18 = SecKeyVerifySignature(v13, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v8, v7, &error);
    BOOL v19 = v18 != 0;
    CFRelease(v13);
    v23 = *(os_log_s **)(DEPLogObjects(v20, v21, v22) + 8);
    if (v18)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Signature verified", buf, 2u);
      }
    }

    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CFErrorRef v24 = error;
      v25 = v23;
      id v26 = objc_claimAutoreleasedReturnValue(-[__CFError description](v24, "description"));
      id v27 = [v26 UTF8String];
      *(_DWORD *)buf = 136446210;
      id v31 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to verify signature: %{public}s\n",  buf,  0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to copy public key.\n", buf, 2u);
    }

    BOOL v19 = 0;
  }

  return v19;
}

+ (id)base64Encodedx509CertificateStringFromCertificate:(id)a3
{
  if (a3)
  {
    CFDataRef v3 = SecCertificateCopyData((SecCertificateRef)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedDataWithOptions:](v3, "base64EncodedDataWithOptions:", 0LL));
    v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

+ (id)decodeCertificateFromBase64String:(id)a3
{
  id v3 = a3;
  v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  1LL);

  if (v4 && (SecCertificateRef v5 = SecCertificateCreateWithData(0LL, (CFDataRef)v4)) != 0LL)
  {
    CFRelease(v5);
    v6 = v4;
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end