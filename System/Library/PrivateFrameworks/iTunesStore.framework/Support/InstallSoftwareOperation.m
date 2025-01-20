@interface InstallSoftwareOperation
- (BOOL)_installPackage:(id *)a3;
- (BOOL)_verifyApplication:(id)a3 error:(id *)a4;
- (InstallSoftwareOperation)initWithSoftwareProperties:(id)a3;
- (SoftwareProperties)softwareProperties;
- (id)_newInstallationOptions;
- (void)dealloc;
- (void)main;
- (void)run;
@end

@implementation InstallSoftwareOperation

- (InstallSoftwareOperation)initWithSoftwareProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___InstallSoftwareOperation;
  v4 = -[InstallSoftwareOperation init](&v6, "init");
  if (v4) {
    v4->_softwareProperties = (SoftwareProperties *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___InstallSoftwareOperation;
  -[InstallSoftwareOperation dealloc](&v3, "dealloc");
}

- (SoftwareProperties)softwareProperties
{
  return (SoftwareProperties *)-[SoftwareProperties copy](self->_softwareProperties, "copy");
}

- (void)main
{
  if (objc_msgSend( +[ApplicationWorkspace defaultWorkspace](ApplicationWorkspace, "defaultWorkspace"),  "isMultiUser"))
  {
    objc_super v3 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.install_software.%@",  -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"));
    IOPMAssertionID AssertionID = 0;
    IOReturn v4 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  v3,  0LL,  @"itunesstored install software",  0LL,  180.0,  @"TimeoutActionRelease",  &AssertionID);
    id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    id v6 = v5;
    if (v4)
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v7 = [v6 shouldLog];
      else {
        LODWORD(v8) = v7;
      }
      v9 = (os_log_s *)[v6 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        uint64_t v8 = v8;
      }
      else {
        v8 &= 2u;
      }
      if ((_DWORD)v8)
      {
        uint64_t v10 = objc_opt_class(self);
        int v26 = 138412546;
        uint64_t v27 = v10;
        __int16 v28 = 1024;
        LODWORD(v29) = v4;
        uint64_t v11 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Power assertion failed with error: %d",  &v26,  18);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
          free(v12);
          v21 = v13;
          SSFileLog(v6, @"%@");
        }
      }

      v23.receiver = self;
      v23.super_class = (Class)&OBJC_CLASS___InstallSoftwareOperation;
      -[InstallSoftwareOperation main](&v23, "main", v21);
    }

    else
    {
      if (!v5) {
        id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v14 = [v6 shouldLog];
      else {
        LODWORD(v15) = v14;
      }
      v16 = (os_log_s *)[v6 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        uint64_t v15 = v15;
      }
      else {
        v15 &= 2u;
      }
      if ((_DWORD)v15)
      {
        uint64_t v17 = objc_opt_class(self);
        int v26 = 138412546;
        uint64_t v27 = v17;
        __int16 v28 = 2112;
        v29 = v3;
        uint64_t v18 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Took power assertion: %@",  &v26,  22);
        if (v18)
        {
          v19 = (void *)v18;
          v20 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
          free(v19);
          v21 = v20;
          SSFileLog(v6, @"%@");
        }
      }

      v24.receiver = self;
      v24.super_class = (Class)&OBJC_CLASS___InstallSoftwareOperation;
      -[InstallSoftwareOperation main](&v24, "main", v21);
      IOPMAssertionRelease(AssertionID);
    }
  }

  else
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___InstallSoftwareOperation;
    -[InstallSoftwareOperation main](&v22, "main");
  }

- (void)run
{
  objc_super v3 = objc_autoreleasePoolPush();
  uint64_t v4 = OBJC_IVAR___ISOperation__progress;
  [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:100];
  [*(id *)&self->ISOperation_opaque[v4] setOperationType:1];
  -[InstallSoftwareOperation sendProgressToDelegate](self, "sendProgressToDelegate");
  uint64_t v6 = 0LL;
  if (-[InstallSoftwareOperation _installPackage:](self, "_installPackage:", &v6))
  {
    id v5 = +[DistributedNotificationCenter defaultCenter](&OBJC_CLASS___DistributedNotificationCenter, "defaultCenter");
    [v5 postNotificationName:kISSoftwareMapInvalidatedNotification];
    -[InstallSoftwareOperation setSuccess:](self, "setSuccess:", 1LL);
  }

  else
  {
    if (!v6) {
      ISError(10LL, 0LL, 0LL);
    }
    -[InstallSoftwareOperation setError:](self, "setError:");
  }

  objc_autoreleasePoolPop(v3);
}

- (BOOL)_installPackage:(id *)a3
{
  if (a3) {
    *a3 = (id)SSError(SSErrorDomain, 106LL, 0LL, 0LL);
  }
  return 0;
}

- (id)_newInstallationOptions
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = -[SoftwareProperties artworkData](self->_softwareProperties, "artworkData");
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, LSiTunesArtworkKey);
  }
  id v5 = -[SoftwareProperties newsstandArtworkData](self->_softwareProperties, "newsstandArtworkData");
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, LSNewsstandArtworkKey);
  }
  uint64_t v6 = -[SoftwareProperties transitMapData](self->_softwareProperties, "transitMapData");
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, LSGeoJSONKey);
  }
  unsigned int v7 = -[SoftwareProperties ITunesMetadata](self->_softwareProperties, "ITunesMetadata");
  if (v7)
  {
    uint64_t v31 = 0LL;
    uint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v7,  200LL,  0LL,  &v31);
    BOOL v9 = v8 != 0LL;
    if (v8)
    {
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v8, LSiTunesMetadataKey);
    }

    else
    {
      id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v22) {
        id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v23 = [v22 shouldLog];
      else {
        LODWORD(v24) = v23;
      }
      v25 = (os_log_s *)[v22 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v24 = v24;
      }
      else {
        v24 &= 2u;
      }
      if ((_DWORD)v24)
      {
        uint64_t v26 = objc_opt_class(self);
        int v32 = 138412546;
        uint64_t v33 = v26;
        __int16 v34 = 2112;
        uint64_t v35 = v31;
        uint64_t v27 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Could not serialize metadata: %@",  &v32,  22);
        if (v27)
        {
          __int16 v28 = (void *)v27;
          v29 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v27, 4LL);
          free(v28);
          v30 = v29;
          SSFileLog(v22, @"%@");
        }
      }
    }
  }

  else
  {
    id v10 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v10) {
      id v10 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v11 = [v10 shouldLog];
    else {
      LODWORD(v12) = v11;
    }
    v13 = (os_log_s *)[v10 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v12 = v12;
    }
    else {
      v12 &= 2u;
    }
    if ((_DWORD)v12)
    {
      int v32 = 138412290;
      uint64_t v33 = objc_opt_class(self);
      uint64_t v14 = _os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  0LL,  "%@: Could not create writable metadata",  &v32,  12);
      if (v14)
      {
        uint64_t v15 = (void *)v14;
        v16 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v14, 4LL);
        free(v15);
        v30 = v16;
        SSFileLog(v10, @"%@");
      }
    }

    BOOL v9 = 0;
  }

  uint64_t v17 = -[SoftwareProperties sinfData](self->_softwareProperties, "sinfData", v30);
  if (v17) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v17, LSApplicationSINFKey);
  }
  uint64_t v18 = -[SoftwareProperties installType](self->_softwareProperties, "installType");
  if (v18) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v18, LSInstallTypeKey);
  }
  v19 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v19, LSSupressNotificationKey);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", LSPackageTypeCustomer, LSPackageTypeKey);
  v20 = -[SoftwareProperties bundleIdentifier](self->_softwareProperties, "bundleIdentifier");
  if (-[NSString length](v20, "length")) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v20, @"CFBundleIdentifier");
  }
  if (!v9)
  {

    return 0LL;
  }

  return v3;
}

- (BOOL)_verifyApplication:(id)a3 error:(id *)a4
{
  unsigned int v7 = objc_opt_new(&OBJC_CLASS___BundleValidator);
  -[BundleValidator setSourceURL:](v7, "setSourceURL:", a3);
  -[BundleValidator setBundleIdentifier:]( v7,  "setBundleIdentifier:",  -[SoftwareProperties bundleIdentifier](self->_softwareProperties, "bundleIdentifier"));
  -[BundleValidator setBundleVersion:]( v7,  "setBundleVersion:",  -[SoftwareProperties bundleVersion](self->_softwareProperties, "bundleVersion"));
  id v10 = 0LL;
  unsigned __int8 v8 = -[BundleValidator validate:](v7, "validate:", &v10);

  if (a4) {
    *a4 = v10;
  }
  return v8;
}

@end