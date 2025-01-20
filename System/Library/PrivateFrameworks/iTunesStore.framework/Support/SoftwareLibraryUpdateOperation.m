@interface SoftwareLibraryUpdateOperation
- (NSDictionary)changeset;
- (NSString)bundleIdentifier;
- (SoftwareLibraryUpdateOperation)initWithBundleIdentifier:(id)a3 changeset:(id)a4;
- (void)dealloc;
- (void)run;
@end

@implementation SoftwareLibraryUpdateOperation

- (SoftwareLibraryUpdateOperation)initWithBundleIdentifier:(id)a3 changeset:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SoftwareLibraryUpdateOperation;
  v6 = -[SoftwareLibraryUpdateOperation init](&v8, "init");
  if (v6)
  {
    v6->_bundleID = (NSString *)[a3 copy];
    v6->_changeset = (NSDictionary *)[a4 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SoftwareLibraryUpdateOperation;
  -[SoftwareLibraryUpdateOperation dealloc](&v3, "dealloc");
}

- (NSString)bundleIdentifier
{
  return self->_bundleID;
}

- (NSDictionary)changeset
{
  return self->_changeset;
}

- (void)run
{
  NSUInteger v32 = 0LL;
  if (!self->_bundleID) {
    goto LABEL_39;
  }
  id v3 = objc_msgSend( objc_msgSend( objc_msgSend( +[LSApplicationProxy applicationProxyForIdentifier:]( LSApplicationProxy,  "applicationProxyForIdentifier:"),  "bundleContainerURL"),  "path"),  "stringByAppendingPathComponent:",  @"iTunesMetadata.plist");
  if (!v3) {
    goto LABEL_39;
  }
  id v4 = v3;
  uint64_t v5 = -[NSMutableDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithContentsOfFile:",  v3);
  if (v5)
  {
    id v6 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v6) {
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
      NSUInteger v11 = -[NSDictionary count](self->_changeset, "count");
      bundleID = self->_bundleID;
      int v33 = 138413058;
      uint64_t v34 = v10;
      __int16 v35 = 2048;
      NSUInteger v36 = v11;
      __int16 v37 = 2112;
      v38 = bundleID;
      __int16 v39 = 2112;
      id v40 = v4;
      uint64_t v13 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Changing %lu keys for %@ at %@",  &v33,  42);
      if (v13)
      {
        v14 = (void *)v13;
        v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v29 = v15;
        SSFileLog(v6, @"%@");
      }
    }

    changeset = self->_changeset;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10014B148;
    v31[3] = &unk_10034FB40;
    v31[4] = v5;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](changeset, "enumerateKeysAndObjectsUsingBlock:", v31, v29);
    v17 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v5,  200LL,  0LL,  &v32);
    if (v17)
    {
      uint64_t v5 = 1LL;
      if (-[NSData writeToFile:options:error:](v17, "writeToFile:options:error:", v4, 1LL, &v32)) {
        goto LABEL_40;
      }
      id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v18) {
        id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v19 = [v18 shouldLog];
      else {
        LODWORD(v20) = v19;
      }
      v21 = (os_log_s *)[v18 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v20 = v20;
      }
      else {
        v20 &= 2u;
      }
      if (!(_DWORD)v20) {
        goto LABEL_39;
      }
      uint64_t v22 = objc_opt_class(self);
      int v33 = 138412546;
      uint64_t v34 = v22;
      __int16 v35 = 2112;
      NSUInteger v36 = v32;
      LODWORD(v30) = 22;
      uint64_t v23 = _os_log_send_and_compose_impl( v20,  0LL,  0LL,  0LL,  &_mh_execute_header,  v21,  0LL,  "%@: Could not write property list: %@",  &v33,  v30);
    }

    else
    {
      id v18 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v18) {
        id v18 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v24 = [v18 shouldLog];
      else {
        LODWORD(v25) = v24;
      }
      v26 = (os_log_s *)[v18 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v25 = v25;
      }
      else {
        v25 &= 2u;
      }
      if (!(_DWORD)v25) {
        goto LABEL_39;
      }
      uint64_t v27 = objc_opt_class(self);
      int v33 = 138412546;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      NSUInteger v36 = v32;
      LODWORD(v30) = 22;
      uint64_t v23 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%@: Could not serialize property list: %@",  &v33,  v30);
    }

    uint64_t v5 = v23;
    if (v23)
    {
      v28 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
      free((void *)v5);
      v29 = v28;
      SSFileLog(v18, @"%@");
LABEL_39:
      uint64_t v5 = 0LL;
    }
  }

@end