@interface AKDeviceIdentityWrapper
- (AKDeviceIdentityWrapper)init;
- (BOOL)_isCachedAttestation:(id)a3;
- (BOOL)requiredOIDPresentInCertificates:(id)a3;
- (NSData)baaAttestationHash;
- (__SecKey)_retrieveDAK:(id)a3 error:(id *)a4;
- (id)_attestationWithDataCerts:(id)a3;
- (id)_attestationWithSecCertRefs:(id)a3;
- (id)_baaCertOptions;
- (id)_getAttestationData:(id)a3 rk:(__SecKey *)a4 dak:(__SecKey *)a5 error:(id *)a6;
- (id)_signatureForDataFields:(id)a3 withRefKey:(__SecKey *)a4 error:(id *)a5;
- (id)_splitStringIntoChunks:(id)a3;
- (unint64_t)_generateTTL;
- (void)_getDCRTWithContext:(id)a3 renewDCRT:(BOOL)a4 completion:(id)a5;
- (void)_issueDCRT:(BOOL)a3 completion:(id)a4;
- (void)_renewDCRTWithContext:(id)a3 completion:(id)a4;
- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4;
- (void)_updateRefKeyWithNonce:(id)a3 context:(id)a4 refkey:(__SecKey *)a5 error:(id *)a6;
- (void)createBAASignatureForDataFields:(id)a3 completion:(id)a4;
- (void)createHostSignatureForData:(id)a3 completion:(id)a4;
- (void)createOSAttestationDataWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5;
- (void)resetDeviceIdentityWithCompletion:(id)a3;
- (void)setBaaAttestationHash:(id)a3;
@end

@implementation AKDeviceIdentityWrapper

- (AKDeviceIdentityWrapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AKDeviceIdentityWrapper;
  v2 = -[AKDeviceIdentityWrapper init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AKConfiguration sharedConfiguration](&OBJC_CLASS___AKConfiguration, "sharedConfiguration"));
    uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 strongDeviceIdentityMarker]);
    baaAttestationHash = v2->_baaAttestationHash;
    v2->_baaAttestationHash = (NSData *)v4;
  }

  return v2;
}

- (id)_splitStringIntoChunks:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (char *)[v3 length];
  if (v5)
  {
    v6 = v5;
    unint64_t v7 = 0LL;
    do
    {
      else {
        uint64_t v8 = (uint64_t)&v6[-v7];
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringWithRange:", v7, v8));
      [v4 addObject:v9];
      v7 += v8;
    }

    while (v7 < (unint64_t)v6);
  }

  return v4;
}

- (void)createBAASignatureForDataFields:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v9 = [v8 isStrongDeviceIdentitySupported];

  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AKDeviceIdentityWrapper _baaCertOptions](self, "_baaCertOptions"));
    uint64_t v12 = _AKLogSystem(v11);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100140AA0();
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000AE504;
    v16[3] = &unk_1001CA9E0;
    id v18 = v7;
    v16[4] = self;
    id v17 = v6;
    sub_1000AE440(v11, v16);
  }

  else
  {
    uint64_t v14 = _AKLogSystem(v10);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100140ACC();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAttestationErrorDomain,  -10000LL,  0LL));
    if (v7) {
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0LL, 0LL, 0LL, v11);
    }
  }
}

- (id)_signatureForDataFields:(id)a3 withRefKey:(__SecKey *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v13);
        id v20 = 0LL;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKSecurityHelper signData:withKey:error:]( &OBJC_CLASS___AKSecurityHelper,  "signData:withKey:error:",  v14,  a4,  &v20));
        id v16 = v20;
        if (v16)
        {
          id v18 = v16;
          if (a5) {
            *a5 = v16;
          }

          id v17 = 0LL;
          goto LABEL_13;
        }

        [v8 addObject:v15];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v17 = [v8 copy];
LABEL_13:

  return v17;
}

- (void)createHostSignatureForData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned __int8 v9 = [v8 isStrongDeviceIdentitySupported];

  if ((v9 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned __int8 v12 = [v11 isVirtualMachine];

    if ((v12 & 1) != 0)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000AEAAC;
      v23[3] = &unk_1001CAA08;
      v23[4] = self;
      id v24 = v7;
      id v14 = v6;
      v15 = v23;
      uint64_t v25 = 0LL;
      v26 = &v25;
      uint64_t v27 = 0x2020000000LL;
      id v16 = off_10020F660;
      v28 = off_10020F660;
      if (!off_10020F660)
      {
        id v17 = (void *)sub_1000B0754();
        id v16 = dlsym(v17, "DeviceIdentityCreateHostSignatureWithCompletion");
        v26[3] = (uint64_t)v16;
        off_10020F660 = v16;
      }

      _Block_object_dispose(&v25, 8);
      if (!v16)
      {
        __int128 v22 = (_Unwind_Exception *)sub_10012D194();
        _Block_object_dispose(&v25, 8);
        _Unwind_Resume(v22);
      }

      ((void (*)(void, id, void, void *))v16)(0LL, v14, 0LL, v15);

      id v18 = v24;
      goto LABEL_13;
    }

    uint64_t v21 = _AKLogSystem(v13);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100140C60();
    }
  }

  else
  {
    uint64_t v19 = _AKLogSystem(v10);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100140ACC();
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAttestationErrorDomain,  -10000LL,  0LL));
  if (v7) {
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v18);
  }
LABEL_13:
}

- (BOOL)_isCachedAttestation:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ak_SHA256Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKDeviceIdentityWrapper baaAttestationHash](self, "baaAttestationHash"));
  unsigned __int8 v6 = [v4 isEqualToData:v5];

  if ((v6 & 1) == 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000AECF8;
    v8[3] = &unk_1001C6538;
    v8[4] = self;
    id v9 = v4;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_10020F648);
    sub_1000AECF8((uint64_t)v8);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10020F648);
  }

  return v6;
}

- (void)resetDeviceIdentityWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000AEF08();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v19[0] = v5;
  v21[0] = @"com.apple.akd";
  id v6 = sub_1000AEF9C();
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v19[1] = v7;
  v21[1] = @"com.apple.AuthKit";
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v8 = (id *)qword_10020F678;
  uint64_t v18 = qword_10020F678;
  if (!qword_10020F678)
  {
    id v9 = (void *)sub_1000B0754();
    uint64_t v8 = (id *)dlsym(v9, "kMAOptionsBAADeleteExistingKeysAndCerts");
    v16[3] = (uint64_t)v8;
    qword_10020F678 = (uint64_t)v8;
  }

  _Block_object_dispose(&v15, 8);
  if (!v8)
  {
    sub_10012D194();
    __break(1u);
  }

  id v20 = *v8;
  v21[2] = &off_1001D8F38;
  id v10 = v20;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v19,  3LL));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000AF030;
  v13[3] = &unk_1001CAA30;
  id v14 = v3;
  id v12 = v3;
  sub_1000AE440(v11, v13);
}

- (void)_sendAnalyticsEvent:(id)a3 withError:(id)a4
{
  uint64_t v6 = kAAFDidSucceed;
  id v7 = a4;
  id v8 = a3;
  id v9 = v8;
  if (a4) {
    id v10 = &__kCFBooleanFalse;
  }
  else {
    id v10 = &__kCFBooleanTrue;
  }
  [v8 setObject:v10 forKeyedSubscript:v6];
  [v9 populateUnderlyingErrorsStartingWithRootError:v7];

  id v11 = (id)objc_claimAutoreleasedReturnValue( +[AKAnalyticsReporterRTC rtcAnalyticsReporter]( &OBJC_CLASS___AKAnalyticsReporterRTC,  "rtcAnalyticsReporter"));
  [v11 sendEvent:v9];
}

- (BOOL)requiredOIDPresentInCertificates:(id)a3
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        id v9 = sub_1000AF304();
        uint64_t v10 = SecCertificateCopyExtensionValue(v8, v9, 0LL);
        if (v10)
        {
          uint64_t v13 = (os_log_s *)v10;
          uint64_t v15 = _AKLogSystem(v10);
          id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            sub_100140E0C(v16);
          }

          BOOL v14 = 1;
          goto LABEL_15;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = _AKLogSystem(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100140D8C(v13);
  }
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (void)_issueDCRT:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    uint64_t v14 = 0LL;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    uint64_t v6 = (id *)qword_10020F688;
    uint64_t v17 = (void *)qword_10020F688;
    if (!qword_10020F688)
    {
      id v7 = (void *)sub_1000B0804();
      uint64_t v6 = (id *)dlsym(v7, "kMAOptionsIgnoreExistingDCRT");
      v15[3] = (uint64_t)v6;
      qword_10020F688 = (uint64_t)v6;
    }

    _Block_object_dispose(&v14, 8);
    if (!v6)
    {
LABEL_11:
      sub_10012D194();
      __break(1u);
    }

    id v18 = *v6;
    __int128 v19 = &__kCFBooleanTrue;
    id v8 = v18;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = v9;
  id v11 = v5;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v12 = off_10020F698;
  uint64_t v17 = off_10020F698;
  if (!off_10020F698)
  {
    uint64_t v13 = (void *)sub_1000B0804();
    uint64_t v12 = dlsym(v13, "MAEIssueDCRTWithCompletion");
    v15[3] = (uint64_t)v12;
    off_10020F698 = v12;
  }

  _Block_object_dispose(&v14, 8);
  if (!v12) {
    goto LABEL_11;
  }
  ((void (*)(void, id, id))v12)(0LL, v10, v11);
}

- (void)_renewDCRTWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 primaryiCloudAccount]);
  unsigned __int8 v11 = [v8 dcrtRenewalAttempted:v10];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 primaryiCloudAccount]);
  [v12 setDCRTRenewalAttempted:1 forAccount:v14];

  uint64_t v16 = _AKLogSystem(v15);
  uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if ((v11 & 1) != 0)
  {
    if (v18) {
      sub_100140E8C();
    }

    if (v7)
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  AKAttestationErrorDomain,  -10012LL,  0LL));
      v7[2](v7, 0LL, v19);
    }
  }

  else
  {
    if (v18) {
      sub_100140F14(v17);
    }

    -[AKDeviceIdentityWrapper _getDCRTWithContext:renewDCRT:completion:]( self,  "_getDCRTWithContext:renewDCRT:completion:",  v6,  1LL,  v7);
  }
}

- (void)_getDCRTWithContext:(id)a3 renewDCRT:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000AF7C4;
  v13[3] = &unk_1001CAA58;
  void v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  v8,  @"com.apple.authkit.generateDCRT",  0LL));
  id v15 = v8;
  id v16 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v14;
  -[AKDeviceIdentityWrapper _issueDCRT:completion:](self, "_issueDCRT:completion:", v6, v13);
}

- (void)_updateRefKeyWithNonce:(id)a3 context:(id)a4 refkey:(__SecKey *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  a4,  @"com.apple.authkit.updateRefkeyWithNonce",  0LL));
  id v16 = 0LL;
  uint64_t v12 = SecKeySetParameter(a5, kSecKeyParameterSETokenAttestationNonce, v10, &v16);
  uint64_t v13 = _AKLogSystem(v12);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100141118();
  }

  if (a6 && v16)
  {
    id v15 = v16;
    *a6 = v15;
    id v16 = 0LL;
  }

  else
  {
    id v15 = *a6;
  }

  -[AKDeviceIdentityWrapper _sendAnalyticsEvent:withError:](self, "_sendAnalyticsEvent:withError:", v11, v15);
}

- (__SecKey)_retrieveDAK:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  a3,  @"com.apple.authkit.retrieveDAK",  0LL));
  id v13 = 0LL;
  id v7 = (__SecKey *)SecKeyCopySystemKey(7LL, &v13);
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100141188((uint64_t *)&v13, v9, v10);
  }

  if (a4 && v13)
  {
    id v11 = v13;
    *a4 = v11;
    id v13 = 0LL;
  }

  else
  {
    id v11 = *a4;
  }

  -[AKDeviceIdentityWrapper _sendAnalyticsEvent:withError:](self, "_sendAnalyticsEvent:withError:", v6, v11);

  return v7;
}

- (id)_getAttestationData:(id)a3 rk:(__SecKey *)a4 dak:(__SecKey *)a5 error:(id *)a6
{
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[AAFAnalyticsEvent ak_analyticsEventWithContext:eventName:error:]( &OBJC_CLASS___AAFAnalyticsEvent,  "ak_analyticsEventWithContext:eventName:error:",  a3,  @"com.apple.authkit.generateOSVersionAttestationData",  0LL));
  id v17 = 0LL;
  id v11 = (void *)SecKeyCreateAttestation(a5, a4, &v17);
  uint64_t v12 = _AKLogSystem(v11);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1001411F4((uint64_t *)&v17, v13, v14);
  }

  if (a6 && v17)
  {
    id v15 = v17;
    *a6 = v15;
    id v17 = 0LL;
  }

  else
  {
    id v15 = *a6;
  }

  -[AKDeviceIdentityWrapper _sendAnalyticsEvent:withError:](self, "_sendAnalyticsEvent:withError:", v10, v15);

  return v11;
}

- (void)createOSAttestationDataWithContext:(id)a3 attestationNonce:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000AFD38;
  v10[3] = &unk_1001CAA58;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v14;
  id v9 = v12;
  -[AKDeviceIdentityWrapper _getDCRTWithContext:renewDCRT:completion:]( v11,  "_getDCRTWithContext:renewDCRT:completion:",  v9,  0LL,  v10);
}

- (id)_baaCertOptions
{
  uint64_t v2 = -[AKDeviceIdentityWrapper _generateTTL](self, "_generateTTL");
  uint64_t v3 = _AKLogSystem(v2);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100141394(v2, v4);
  }

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  id v5 = (id *)qword_10020F6A0;
  uint64_t v35 = qword_10020F6A0;
  if (!qword_10020F6A0)
  {
    BOOL v6 = (void *)sub_1000B0754();
    id v5 = (id *)dlsym(v6, "kMAOptionsBAAOIDDeviceOSInformation");
    v33[3] = (uint64_t)v5;
    qword_10020F6A0 = (uint64_t)v5;
  }

  _Block_object_dispose(&v32, 8);
  if (!v5) {
    goto LABEL_24;
  }
  id v39 = *v5;
  id v7 = v39;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL, v32));

  id v9 = [v8 mutableCopy];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
  unsigned int v11 = [v10 isVirtualMachine];

  if (!v11)
  {
    uint64_t v32 = 0LL;
    v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    id v12 = (void *)qword_10020F6B0;
    uint64_t v35 = qword_10020F6B0;
    if (!qword_10020F6B0)
    {
      id v14 = (void *)sub_1000B0754();
      id v12 = dlsym(v14, "kMAOptionsBAAOIDUCRTDeviceIdentifiers");
      v33[3] = (uint64_t)v12;
      qword_10020F6B0 = (uint64_t)v12;
    }

    _Block_object_dispose(&v32, 8);
    if (v12) {
      goto LABEL_14;
    }
LABEL_24:
    sub_10012D194();
    __break(1u);
  }

  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  id v12 = (void *)qword_10020F6A8;
  uint64_t v35 = qword_10020F6A8;
  if (!qword_10020F6A8)
  {
    id v13 = (void *)sub_1000B0754();
    id v12 = dlsym(v13, "kMAOptionsBAAOIDDeviceIdentifiers");
    v33[3] = (uint64_t)v12;
    qword_10020F6A8 = (uint64_t)v12;
  }

  _Block_object_dispose(&v32, 8);
  if (!v12) {
    goto LABEL_24;
  }
LABEL_14:
  objc_msgSend(v9, "addObject:", *v12, v32);
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  id v15 = (id *)qword_10020F6B8;
  uint64_t v35 = qword_10020F6B8;
  if (!qword_10020F6B8)
  {
    id v16 = (void *)sub_1000B0754();
    id v15 = (id *)dlsym(v16, "kMAOptionsBAAIgnoreExistingKeychainItems");
    v33[3] = (uint64_t)v15;
    qword_10020F6B8 = (uint64_t)v15;
  }

  _Block_object_dispose(&v32, 8);
  if (!v15) {
    goto LABEL_24;
  }
  id v17 = *v15;
  v36[0] = v17;
  v38[0] = &__kCFBooleanFalse;
  id v18 = sub_1000AEF08();
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v36[1] = v19;
  v38[1] = @"com.apple.akd";
  id v20 = sub_1000AEF9C();
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v36[2] = v21;
  v38[2] = @"com.apple.AuthKit";
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  __int128 v22 = (id *)qword_10020F6C0;
  uint64_t v35 = qword_10020F6C0;
  if (!qword_10020F6C0)
  {
    __int128 v23 = (void *)sub_1000B0754();
    __int128 v22 = (id *)dlsym(v23, "kMAOptionsBAAValidity");
    v33[3] = (uint64_t)v22;
    qword_10020F6C0 = (uint64_t)v22;
  }

  _Block_object_dispose(&v32, 8);
  if (!v22) {
    goto LABEL_24;
  }
  id v24 = *v22;
  v36[3] = v24;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v2, v32));
  v38[3] = v25;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  v26 = (id *)qword_10020F6C8;
  uint64_t v35 = qword_10020F6C8;
  if (!qword_10020F6C8)
  {
    uint64_t v27 = (void *)sub_1000B0754();
    v26 = (id *)dlsym(v27, "kMAOptionsBAAOIDSToInclude");
    v33[3] = (uint64_t)v26;
    qword_10020F6C8 = (uint64_t)v26;
  }

  _Block_object_dispose(&v32, 8);
  if (!v26) {
    goto LABEL_24;
  }
  id v37 = *v26;
  v38[4] = v9;
  id v28 = v37;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v36,  5LL,  v32));

  id v30 = [v29 copy];
  return v30;
}

- (unint64_t)_generateTTL
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
  id v3 = [v2 baaValidity];

  unint64_t v4 = 262080LL;
  if (v4 >= 0x80520) {
    return 525600LL;
  }
  else {
    return v4;
  }
}

- (id)_attestationWithSecCertRefs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CFDataRef v11 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v14 + 1) + 8LL * (void)v10));
        -[NSMutableArray addObject:](v5, "addObject:", v11, (void)v14);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AKDeviceIdentityWrapper _attestationWithDataCerts:](self, "_attestationWithDataCerts:", v5));
  return v12;
}

- (id)_attestationWithDataCerts:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        CFDataRef v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v10);
        -[NSMutableArray addObject:](v5, "addObject:", @"-----BEGIN CERTIFICATE-----", (void)v18);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[AKDeviceIdentityWrapper _splitStringIntoChunks:](self, "_splitStringIntoChunks:", v12));
        -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v13);
        -[NSMutableArray addObject:](v5, "addObject:", @"-----END CERTIFICATE-----");

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v8);
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", @"\n"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dataUsingEncoding:4]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "aaf_toCompressedData:", 517));

  return v16;
}

- (NSData)baaAttestationHash
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBaaAttestationHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end