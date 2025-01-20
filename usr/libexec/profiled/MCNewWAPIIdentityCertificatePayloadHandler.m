@interface MCNewWAPIIdentityCertificatePayloadHandler
- (BOOL)_storePEMDataInKeychain:(id)a3 UUID:(id)a4 outError:(id *)a5;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)_cannotStoreCertificateError;
- (id)_cannotStorePEMDataError;
- (id)_malformedCertificateError;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNewWAPIIdentityCertificatePayloadHandler

- (id)_malformedCertificateError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 friendlyName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_MALFORMED_P_FILE");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9005LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_cannotStorePEMDataError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 friendlyName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE_PEM_DATA_P_FILE");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9003LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (id)_cannotStoreCertificateError
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = MCCertificateErrorDomain;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 friendlyName]);
  uint64_t v5 = MCErrorArray(@"ERROR_CERTIFICATE_CANNOT_STORE_P_FILE");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v3,  9002LL,  v6,  MCErrorTypeFatal,  v4,  0LL));

  return v7;
}

- (BOOL)_storePEMDataInKeychain:(id)a3 UUID:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (__SecCertificate *)+[MCCrypto copyCertificateRefFromPEMData:]( &OBJC_CLASS___MCCrypto,  "copyCertificateRefFromPEMData:",  v8);
  if (!v10)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue( -[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError]( self,  "_malformedCertificateError"));
    if (!a5) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }

  v11 = v10;
  CFDataRef v12 = SecCertificateCopyData(v10);
  CFRelease(v11);
  if (v12)
  {
    v23[0] = @"pemData";
    v23[1] = @"certData";
    v24[0] = v8;
    v24[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v13,  200LL,  0LL,  0LL));
    if (v14)
    {
      v21 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 profile]);
      id v22 = 0LL;
      unsigned __int8 v17 = +[MCKeychain setData:forService:account:label:description:useSystemKeychain:outError:]( MCKeychain,  "setData:forService:account:label:description:useSystemKeychain:outError:",  v14,  @"com.apple.managedconfiguration.wapi-identity",  v9,  0,  0,  [v16 isInstalledForSystem],  &v22);
      id v18 = v22;

      if ((v17 & 1) == 0)
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue(-[MCNewWAPIIdentityCertificatePayloadHandler _cannotStorePEMDataError](self, "_cannotStorePEMDataError"));

        id v18 = (id)v19;
      }

      v13 = v21;
    }

    else
    {
      id v18 = (id)objc_claimAutoreleasedReturnValue( -[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError]( self,  "_malformedCertificateError"));
    }
  }

  else
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue( -[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError]( self,  "_malformedCertificateError"));
  }

  if (a5)
  {
LABEL_13:
    if (v18) {
      *a5 = v18;
    }
  }

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 pemData]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
  id v26 = 0LL;
  -[MCNewWAPIIdentityCertificatePayloadHandler _storePEMDataInKeychain:UUID:outError:]( self,  "_storePEMDataInKeychain:UUID:outError:",  v9,  v10,  &v26);
  id v11 = v26;

  if (!v11)
  {
    CFDataRef v12 = (void *)objc_claimAutoreleasedReturnValue([v8 pemData]);
    id v13 = +[MCCrypto copyCertificateRefFromPEMData:](&OBJC_CLASS___MCCrypto, "copyCertificateRefFromPEMData:", v12);

    if (v13)
    {
      v14 = -[MCNewCertificatePayloadHandler accessibility](self, "accessibility");
      v15 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Storing WAPI certificate, storing with accessibility %@",  buf,  0xCu);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
      uint64_t v17 = kMCAppleIdentitiesKeychainGroup;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 profile]);
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[MCKeychain saveItem:withLabel:group:useSystemKeychain:accessibility:]( MCKeychain,  "saveItem:withLabel:group:useSystemKeychain:accessibility:",  v13,  v16,  v17,  [v19 isInstalledForSystem],  -[MCNewCertificatePayloadHandler accessibility](self, "accessibility")));

      CFRelease(v13);
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
        -[MCNewPayloadHandler _retainDependencyBetweenPersistentID:andUUID:]( self,  "_retainDependencyBetweenPersistentID:andUUID:",  v20,  v21);

        [v8 setCertificatePersistentID:v20];
        id v11 = 0LL;
      }

      else
      {
        id v11 = (id)objc_claimAutoreleasedReturnValue( -[MCNewWAPIIdentityCertificatePayloadHandler _cannotStoreCertificateError]( self,  "_cannotStoreCertificateError"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v8 UUID]);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 profile]);
        +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  @"com.apple.managedconfiguration.wapi-identity",  v22,  0,  0,  [v24 isInstalledForSystem],  0);
      }
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue( -[MCNewWAPIIdentityCertificatePayloadHandler _malformedCertificateError]( self,  "_malformedCertificateError"));
    }
  }

  if (a6 && v11) {
    *a6 = [v11 MCCopyAsPrimaryError];
  }

  return v11 == 0LL;
}

- (void)setAside
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
  +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  @"com.apple.managedconfiguration.wapi-identity",  v4,  0,  0,  [v6 isInstalledForSystem],  0);

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCNewWAPIIdentityCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler setAside](&v7, "setAside");
}

- (void)unsetAside
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v5 pemData]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v5 UUID]);
  -[MCNewWAPIIdentityCertificatePayloadHandler _storePEMDataInKeychain:UUID:outError:]( self,  "_storePEMDataInKeychain:UUID:outError:",  v3,  v4,  0LL);
}

- (void)remove
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCNewWAPIIdentityCertificatePayloadHandler;
  if (!-[MCNewCertificatePayloadHandler isSetAside](&v8, "isSetAside"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 UUID]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 profile]);
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  @"com.apple.managedconfiguration.wapi-identity",  v4,  0,  0,  [v6 isInstalledForSystem],  0);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MCNewWAPIIdentityCertificatePayloadHandler;
  -[MCNewCertificatePayloadHandler remove](&v7, "remove");
}

@end