@interface APSBAAClientIdentityProvider
- (APSBAAClientIdentityProvider)init;
- (BOOL)hasUnderlyingIdentityChanged;
- (BOOL)isIdentityAvailable;
- (BOOL)refreshIdentityNextFetch;
- (id)_parseDERCertificatesFromChain:(id)a3;
- (id)baaIdentityRefreshedBlock;
- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4;
- (id)identityAvailabilityDidChangeBlock;
- (void)_processPotentialIdentityChanged;
- (void)dealloc;
- (void)deleteClientIdentityRequestingReplacement;
- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4;
- (void)setBaaIdentityRefreshedBlock:(id)a3;
- (void)setIdentityAvailabilityDidChangeBlock:(id)a3;
- (void)setRefreshIdentityNextFetch:(BOOL)a3;
@end

@implementation APSBAAClientIdentityProvider

- (APSBAAClientIdentityProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___APSBAAClientIdentityProvider;
  v2 = -[APSBAAClientIdentityProvider init](&v5, "init");
  -[APSBAAClientIdentityProvider setRefreshIdentityNextFetch:](v2, "setRefreshIdentityNextFetch:", 0LL);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100067D74,  kNotificationActivationStateChanged,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kNotificationActivationStateChanged, 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___APSBAAClientIdentityProvider;
  -[APSBAAClientIdentityProvider dealloc](&v4, "dealloc");
}

- (void)_processPotentialIdentityChanged
{
  if (sub_100078424() && -[APSBAAClientIdentityProvider isIdentityAvailable](self, "isIdentityAvailable"))
  {
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Ignoring activation signal on VMs, VMs post an activation signal on every boot since they are hacktivated.",  buf,  2u);
    }
  }

  else
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( -[APSBAAClientIdentityProvider identityAvailabilityDidChangeBlock]( self,  "identityAvailabilityDidChangeBlock"));

    if (v4)
    {
      objc_super v5 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue( -[APSBAAClientIdentityProvider identityAvailabilityDidChangeBlock]( self,  "identityAvailabilityDidChangeBlock"));
      v5[2](v5, -[APSBAAClientIdentityProvider isIdentityAvailable](self, "isIdentityAvailable"));
    }
  }

- (BOOL)isIdentityAvailable
{
  v2 = (void *)MAEGetActivationStateWithError(0LL, a2);
  unsigned __int8 v3 = [v2 isEqualToString:kMAActivationStateUnactivated];
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      __int16 v9 = 0;
      v6 = "Device is not activated, can't fetch a BAA identity.";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Device is activated, should be able to obtain an identity";
    v7 = buf;
    goto LABEL_6;
  }

  return v3 ^ 1;
}

- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "APSBAAClientIdentityProvider attempting to fetch BAA certs",  (uint8_t *)&buf,  2u);
  }

  if ((DeviceIdentityIsSupported() & 1) == 0)
  {
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LOWORD(buf) = 0;
    v13 = "Device Identity is not supported, can't fetch a BAA cert";
    p_CFErrorRef buf = (uint8_t *)&buf;
    goto LABEL_14;
  }

  SecAccessControlRef v8 = SecAccessControlCreateWithFlags(0LL, kSecAttrAccessibleAlways, 0x40000000uLL, &buf);
  if (v8)
  {
    SecAccessControlRef v9 = v8;
    if (a3 || -[APSBAAClientIdentityProvider refreshIdentityNextFetch](self, "refreshIdentityNextFetch"))
    {
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "APSBAAClientIdentityProvider requesting to refresh BAA certs",  v34,  2u);
      }

      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    -[APSBAAClientIdentityProvider setRefreshIdentityNextFetch:](self, "setRefreshIdentityNextFetch:", 0LL, self);
    if ((sub_100078424() & 1) != 0 || (DeviceIdentityUCRTAttestationSupported() & 1) == 0)
    {
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "UCRT not supported, using SCRT/vSCRT",  v34,  2u);
      }

      uint64_t v15 = 1LL;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    double v17 = (double)(1440 * arc4random_uniform(0xFu) + 1555200);
    else {
      char v18 = 1;
    }
    char v33 = v18;
    v38[0] = kMAOptionsBAAKeychainLabel;
    v38[1] = kMAOptionsBAAKeychainAccessGroup;
    v39[0] = @"apsd";
    v39[1] = @"com.apple.apsd";
    v38[2] = kMAOptionsBAAIgnoreExistingKeychainItems;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
    v39[2] = v19;
    v39[3] = &__kCFBooleanTrue;
    v38[3] = kMAOptionsResuseExistingKey;
    v38[4] = kMAOptionsBAANetworkTimeoutInterval;
    v39[4] = &off_10012B8E8;
    v38[5] = kMAOptionsBAAValidity;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
    v39[5] = v20;
    v38[6] = kMAOptionsBAASCRTAttestation;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v15));
    v39[6] = v21;
    v39[7] = v9;
    v38[7] = kMAOptionsBAAAccessControls;
    v38[8] = kMAOptionsBAAAppSpecificData;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v33, 1LL));
    v39[8] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  9LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v23));

    if (sub_100078424())
    {
      v37[0] = kMAOptionsBAAOIDDeviceIdentifiers;
      v37[1] = kMAOptionsBAAOIDProductType;
      v37[2] = kMAOptionsBAAOIDKeyUsageProperties;
      v37[3] = kMAOptionsBAAOIDNonce;
      v25 = v37;
      uint64_t v26 = 4LL;
    }

    else
    {
      v36[0] = kMAOptionsBAAOIDProductType;
      v36[1] = kMAOptionsBAAOIDKeyUsageProperties;
      v36[2] = kMAOptionsBAAOIDNonce;
      v25 = v36;
      uint64_t v26 = 3LL;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, v26));
    [v24 setObject:v27 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];

    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "APSBAAClientIdentityProvider fetching BAA cert",  v34,  2u);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1000685B8;
    v30[3] = &unk_10011F768;
    char v32 = v11;
    v30[4] = v29;
    id v31 = v6;
    DeviceIdentityIssueClientCertificateWithCompletion(&_dispatch_main_q, v24, v30);

    goto LABEL_33;
  }

  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v34 = 0;
    v13 = "Failed to get security access control ref for fetching BAA cert";
    p_CFErrorRef buf = v34;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, p_buf, 2u);
  }

- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((sub_100078424() & 1) != 0)
  {
    if (v6)
    {
      __int16 v21 = 769;
      id v20 = 0LL;
      uint64_t v7 = DeviceIdentityCreateHostSignature(v6, 0LL, &v20, a4);
      SecAccessControlRef v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      SecAccessControlRef v9 = (os_log_s *)v20;
      if (a4 && *a4)
      {
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = *a4;
          *(_DWORD *)CFErrorRef buf = 138412290;
          id v23 = v11;
          v12 = "APSBAAClientIdenittyProvider failed to sign nonce with host VM identity, error: %@";
          v13 = v10;
          uint32_t v14 = 12;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }

      else
      {
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
        BOOL v16 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        if (v8 && v9)
        {
          if (v16)
          {
            *(_WORD *)CFErrorRef buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "APSBAAClientIdentityProvider signed nonce data with host VM identity!",  buf,  2u);
          }

          double v17 = objc_alloc_init(&OBJC_CLASS___APSDProtoHostCertificateInfo);
          char v18 = (void *)objc_claimAutoreleasedReturnValue( -[APSBAAClientIdentityProvider _parseDERCertificatesFromChain:]( self,  "_parseDERCertificatesFromChain:",  v9));
          -[APSDProtoHostCertificateInfo setCertificates:](v17, "setCertificates:", v18);

          -[APSDProtoHostCertificateInfo setNonce:](v17, "setNonce:", v6);
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v21,  2LL));
          -[os_log_s appendData:](v10, "appendData:", v8);
          -[APSDProtoHostCertificateInfo setSignature:](v17, "setSignature:", v10);
          goto LABEL_22;
        }

        if (v16)
        {
          *(_WORD *)CFErrorRef buf = 0;
          v12 = "APSBAAClientIdentityProvider failed to sign nonce data with host VM identity with no error?";
          v13 = v10;
          uint32_t v14 = 2;
          goto LABEL_20;
        }
      }

      double v17 = 0LL;
LABEL_22:

      goto LABEL_23;
    }

    SecAccessControlRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFErrorRef buf = 0;
      uint64_t v15 = "APSBAAClientIdentityProvider no nonce provided to sign";
      goto LABEL_16;
    }
  }

  else
  {
    SecAccessControlRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFErrorRef buf = 0;
      uint64_t v15 = "APSBAAClientIdentityProvider not a virtual machine, can't request host VM certs!";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
  }

  double v17 = 0LL;
LABEL_23:

  return v17;
}

- (void)deleteClientIdentityRequestingReplacement
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "APSBAAClientIdentityProvider requested to delete identity. Doing nothing.",  v3,  2u);
  }
}

- (BOOL)hasUnderlyingIdentityChanged
{
  return 0;
}

- (id)_parseDERCertificatesFromChain:(id)a3
{
  unint64_t v16 = 0LL;
  id v3 = a3;
  id v4 = [v3 bytes];
  int v5 = CTParseCertificateSet( (unint64_t)v4,  (unint64_t)[v3 length] + (void)v4,  v21,  3,  &v16);
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v16 == 0;
  }
  if (v6)
  {
    int v7 = v5;
    SecAccessControlRef v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog courier](&OBJC_CLASS___APSLog, "courier"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CFErrorRef buf = 67109376;
      int v18 = v7;
      __int16 v19 = 2048;
      unint64_t v20 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to parse certificate set. rc=%d, numCerts=%zu",  buf,  0x12u);
    }

- (id)identityAvailabilityDidChangeBlock
{
  return self->identityAvailabilityDidChangeBlock;
}

- (void)setIdentityAvailabilityDidChangeBlock:(id)a3
{
}

- (id)baaIdentityRefreshedBlock
{
  return self->_baaIdentityRefreshedBlock;
}

- (void)setBaaIdentityRefreshedBlock:(id)a3
{
}

- (BOOL)refreshIdentityNextFetch
{
  return self->_refreshIdentityNextFetch;
}

- (void)setRefreshIdentityNextFetch:(BOOL)a3
{
  self->_refreshIdentityNextFetch = a3;
}

- (void).cxx_destruct
{
}

@end