@interface CCDDeviceIdentitySupport
+ (id)_signPayloadData:(id)a3 withPrivateKey:(id)a4 outError:(id *)a5;
+ (id)requestWithPayload:(id)a3 URL:(id)a4 privateKey:(id)a5 clientCertificates:(id)a6 outError:(id *)a7;
+ (void)retrieveClientCertificateWithCompletion:(id)a3;
@end

@implementation CCDDeviceIdentitySupport

+ (void)retrieveClientCertificateWithCompletion:(id)a3
{
  id v3 = a3;
  v6 = *(os_log_s **)(DEPLogObjects(v3, v4, v5) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Retrieve Client Certificate.\n", buf, 2u);
  }

  v26[0] = &__kCFBooleanTrue;
  uint64_t v7 = kMAOptionsBAAOIDSToInclude;
  v25[0] = @"AllowInvalidNetworkCertificates";
  v25[1] = kMAOptionsBAAOIDSToInclude;
  v24[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  v24[1] = kMAOptionsBAAOIDIMG4Manifest;
  v24[2] = kMAOptionsBAAOIDDeviceIdentifiers;
  v24[3] = kMAOptionsBAAOIDHardwareProperties;
  v24[4] = kMAOptionsBAAOIDKeyUsageProperties;
  v24[5] = kMAOptionsBAAOIDDeviceOSInformation;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 6LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v8));
  v26[1] = v9;
  v26[2] = @"DEP-client-cert";
  v25[2] = kMAOptionsBAAKeychainLabel;
  v25[3] = kMAOptionsBAAKeychainAccessGroup;
  v26[3] = @"com.apple.cloudconfigd";
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  4LL));
  id v11 = [v10 mutableCopy];

  if (+[CCDDeviceUtilities isInternalBuild](&OBJC_CLASS___CCDDeviceUtilities, "isInternalBuild")
    && !+[CCDDeviceUtilities isRunningInRootLaunchdContext]( &OBJC_CLASS___CCDDeviceUtilities,  "isRunningInRootLaunchdContext")
    && !+[CCDDeviceUtilities isRunningInRecovery](&OBJC_CLASS___CCDDeviceUtilities, "isRunningInRecovery")
    && !+[CCDDeviceUtilities isRunningInDiagnosticsMode](&OBJC_CLASS___CCDDeviceUtilities, "isRunningInDiagnosticsMode"))
  {
    SecAccessControlRef v12 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, 0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v7]);
    [v13 addObject:kMAOptionsBAAOIDAccessControls];

    [v11 setObject:v12 forKeyedSubscript:kMAOptionsBAAAccessControls];
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100002190;
  v20[3] = &unk_100018818;
  id v21 = v11;
  id v22 = v3;
  id v14 = v3;
  id v15 = v11;
  v16 = objc_retainBlock(v20);
  ((void (*)(void *, uint64_t, uint64_t, uint64_t))v16[2])(v16, v17, v18, v19);
}

+ (id)_signPayloadData:(id)a3 withPrivateKey:(id)a4 outError:(id *)a5
{
  uint64_t v7 = (const __CFData *)a3;
  v8 = (__SecKey *)a4;
  uint64_t v11 = DEPLogObjects(v8, v9, v10);
  SecAccessControlRef v12 = *(os_log_s **)(v11 + 8);
  if (v7 && v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(v11 + 8), OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Signing the payload with the private key...",  buf,  2u);
    }

    CFErrorRef error = 0LL;
    CFDataRef v13 = SecKeyCreateSignature(v8, kSecKeyAlgorithmECDSASignatureMessageX962SHA256, v7, &error);
    if (!v13)
    {
      id v14 = error;
      uint64_t v17 = *(void **)(DEPLogObjects(v14, v15, v16) + 8);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = v17;
        id v19 = objc_claimAutoreleasedReturnValue(-[__CFError description](v14, "description"));
        id v20 = [v19 UTF8String];
        *(_DWORD *)buf = 136446210;
        id v24 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to create signature: %{public}s\n",  buf,  0xCu);
      }

      if (a5) {
        *a5 = (id)objc_claimAutoreleasedReturnValue( +[CCDError internalErrorWithCode:]( &OBJC_CLASS___CCDError,  "internalErrorWithCode:",  33010LL));
      }
    }
  }

  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v11 + 8), OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "No private key, can't sign the payload",  buf,  2u);
    }

    CFDataRef v13 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[CCDError internalErrorWithCode:]( &OBJC_CLASS___CCDError,  "internalErrorWithCode:",  33011LL));
    }
  }

  return v13;
}

+ (id)requestWithPayload:(id)a3 URL:(id)a4 privateKey:(id)a5 clientCertificates:(id)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v18 = v15;
  if (v15 && (id v15 = [v15 count], v15 == (id)2))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 dictionary]);
    id v68 = 0LL;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v19,  0LL,  &v68));
    id v21 = v68;
    if (v20)
    {
      id v67 = 0LL;
      id v22 = (void *)objc_claimAutoreleasedReturnValue([a1 _signPayloadData:v20 withPrivateKey:v14 outError:&v67]);
      id v23 = v67;
      id v66 = v23;
      if (!v22 || v23)
      {
        v45 = *(os_log_s **)(DEPLogObjects(v23, v24, v25) + 8);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "Error while signing the request payload",  buf,  2u);
        }

        v41 = 0LL;
        if (a7) {
          *a7 = v66;
        }
      }

      else
      {
        v57 = v19;
        id v58 = v13;
        v63 = v22;
        uint64_t v56 = objc_claimAutoreleasedReturnValue([v22 base64EncodedDataWithOptions:0]);
        v65 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v56, 4LL);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:0]);
        uint64_t v27 = objc_claimAutoreleasedReturnValue( +[CCDCertificateSupport base64Encodedx509CertificateStringFromCertificate:]( &OBJC_CLASS___CCDCertificateSupport,  "base64Encodedx509CertificateStringFromCertificate:",  v26));

        v28 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:1]);
        uint64_t v29 = objc_claimAutoreleasedReturnValue( +[CCDCertificateSupport base64Encodedx509CertificateStringFromCertificate:]( &OBJC_CLASS___CCDCertificateSupport,  "base64Encodedx509CertificateStringFromCertificate:",  v28));

        v30 = objc_alloc(&OBJC_CLASS___NSString);
        v62 = v20;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedDataWithOptions:0]);
        v32 = -[NSString initWithData:encoding:](v30, "initWithData:encoding:", v31, 4LL);

        v34 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v33);
        [v34 setObject:v32 forKeyedSubscript:@"payload"];
        [v34 setObject:v65 forKeyedSubscript:@"payload_signature"];
        v55 = (void *)v27;
        [v34 setObject:v27 forKeyedSubscript:@"sign_cert"];
        [v34 setObject:v29 forKeyedSubscript:@"intermediate_cert"];
        v59 = v34;
        v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v34));
        v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:"));
        id v64 = v21;

        v61 = (void *)v29;
        if (v35)
        {
          v39 = *(os_log_s **)(DEPLogObjects(v36, v37, v38) + 8);
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          id v13 = v58;
          if (v58)
          {
            id v19 = v57;
            if (v40)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting up the request.", buf, 2u);
            }

            v41 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( objc_alloc(&OBJC_CLASS___NSMutableURLRequest),  "initWithURL:cachePolicy:timeoutInterval:",  v58,  0LL,  30.0);
            -[NSMutableURLRequest setHTTPMethod:](v41, "setHTTPMethod:", @"POST");
            -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v41,  "setValue:forHTTPHeaderField:",  @"3",  @"X-Profile-Protocol-Version");
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[CCDRequestSupport userAgentString](&OBJC_CLASS___CCDRequestSupport, "userAgentString"));
            -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v41,  "setValue:forHTTPHeaderField:",  v42,  @"User-Agent");

            v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%lu",  [v35 length]));
            -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v41,  "setValue:forHTTPHeaderField:",  v43,  @"Content-Length");

            -[NSMutableURLRequest setHTTPBody:](v41, "setHTTPBody:", v35);
          }

          else
          {
            id v19 = v57;
            if (v40)
            {
              v52 = v39;
              v53 = (void *)objc_claimAutoreleasedReturnValue([0 description]);
              *(_DWORD *)buf = 138543362;
              v70 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "Couldn't build up the URL from string: %{public}@",  buf,  0xCu);
            }

            v41 = 0LL;
            if (a7) {
              *a7 = (id)objc_claimAutoreleasedReturnValue( +[CCDError internalErrorWithCode:]( &OBJC_CLASS___CCDError,  "internalErrorWithCode:",  33012LL));
            }
          }

          v50 = (void *)v56;
        }

        else
        {
          v46 = *(os_log_s **)(DEPLogObjects(v36, v37, v38) + 8);
          BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
          id v13 = v58;
          if (v47)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "No serial request data", buf, 2u);
          }

          v50 = (void *)v56;
          id v19 = v57;
          if (a7 && v64) {
            goto LABEL_31;
          }
          v51 = *(os_log_s **)(DEPLogObjects(v47, v48, v49) + 8);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Unknown error while serializing the request dictionary",  buf,  2u);
          }

          if (a7)
          {
LABEL_31:
            v41 = 0LL;
            *a7 = (id)objc_claimAutoreleasedReturnValue( +[CCDError internalErrorWithCode:]( &OBJC_CLASS___CCDError,  "internalErrorWithCode:",  33009LL));
          }

          else
          {
            v41 = 0LL;
          }
        }

        id v20 = v62;
        id v22 = v63;
        id v21 = v64;
      }
    }

    else
    {
      v41 = 0LL;
      if (a7) {
        *a7 = (id)objc_claimAutoreleasedReturnValue( +[CCDError internalErrorWithCode:]( &OBJC_CLASS___CCDError,  "internalErrorWithCode:",  33009LL));
      }
    }
  }

  else
  {
    v44 = *(os_log_s **)(DEPLogObjects(v15, v16, v17) + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "No certificate, can't do the request", buf, 2u);
    }

    v41 = 0LL;
    if (a7) {
      *a7 = (id)objc_claimAutoreleasedReturnValue( +[CCDError internalErrorWithCode:]( &OBJC_CLASS___CCDError,  "internalErrorWithCode:",  33013LL));
    }
  }

  return v41;
}

@end