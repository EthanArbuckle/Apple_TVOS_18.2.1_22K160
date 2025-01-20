@interface TYATypologyAccessSession
+ (id)_safeFilenameWithName:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (NSDirectoryEnumerator)directoryEnumerator;
- (TITypologyPreferences)typologyPreferences;
- (TYATypologyAccessSession)initWithAuditToken:(id *)a3;
- (id)_issueSandboxExtensionForURL:(id)a3;
- (unint64_t)accessMode;
- (void)_initializeEnumerator;
- (void)nextTypologyURL:(id)a3;
- (void)removeTypologyFileWithName:(id)a3 completion:(id)a4;
- (void)setAccessMode:(unint64_t)a3;
- (void)setAuditToken:(id *)a3;
- (void)setDirectoryEnumerator:(id)a3;
- (void)setTypologyAccessMode:(unint64_t)a3;
- (void)setTypologyPreferences:(id)a3;
- (void)startEnumeration;
- (void)writeData:(id)a3 toTypologyFileWithName:(id)a4 completion:(id)a5;
@end

@implementation TYATypologyAccessSession

- (TYATypologyAccessSession)initWithAuditToken:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TYATypologyAccessSession;
  v4 = -[TYATypologyAccessSession init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    __int128 v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    -[TYATypologyAccessSession setAccessMode:](v4, "setAccessMode:", 0LL);
  }

  return v5;
}

- (void)setAccessMode:(unint64_t)a3
{
  if (self->_accessMode != a3)
  {
    self->_accessMode = a3;
    switch(a3)
    {
      case 2uLL:
        v4 = &OBJC_CLASS___TITypologyProfilePreferences;
        goto LABEL_9;
      case 1uLL:
        v4 = &OBJC_CLASS___TITypologyInternalPreferences;
        goto LABEL_9;
      case 0uLL:
        v4 = (__objc2_class *)&OBJC_CLASS___TITypologyPreferences;
LABEL_9:
        v5 = (TITypologyPreferences *)objc_alloc_init(v4);
        typologyPreferences = self->_typologyPreferences;
        self->_typologyPreferences = v5;

        break;
    }
  }

- (void)_initializeEnumerator
{
  directoryEnumerator = self->_directoryEnumerator;
  self->_directoryEnumerator = 0LL;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession typologyPreferences](self, "typologyPreferences"));
  unsigned int v5 = [v4 typologyLoggingEnabledByProfile];

  if (v5)
  {
    __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession typologyPreferences](self, "typologyPreferences"));
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 typologyDirectoryURL]);

    v20[0] = NSURLNameKey;
    v20[1] = NSURLIsDirectoryKey;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
    id v9 = [&stru_100014680 copy];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:5 errorHandler:v9]);
    -[TYATypologyAccessSession setDirectoryEnumerator:](self, "setDirectoryEnumerator:", v11);
  }

  else
  {
    id v12 = TYALog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000AAE4(v7, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (id)_issueSandboxExtensionForURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 path]);
  uint64_t v6 = APP_SANDBOX_READ_WRITE;
  id v7 = [v5 fileSystemRepresentation];
  uint64_t v8 = SANDBOX_EXTENSION_DEFAULT;
  -[TYATypologyAccessSession auditToken](self, "auditToken");
  uint64_t v9 = sandbox_extension_issue_file_to_process(v6, v7, v8, &v28);
  if (!v9)
  {
    id v18 = TYALog();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10000ABC0(v4, v19);
    }

    goto LABEL_12;
  }

  v10 = (char *)v9;
  v11 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v10,  strlen(v10),  4LL,  1LL);
  id v12 = TYALog();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000AC58(v14, v20, v21, v22, v23, v24, v25, v26);
    }

    free(v10);
LABEL_12:
    v11 = 0LL;
    goto LABEL_13;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = -[NSString UTF8String](v11, "UTF8String");
    id v16 = objc_claimAutoreleasedReturnValue([v4 lastPathComponent]);
    id v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136380931;
    v30 = v15;
    __int16 v31 = 2081;
    id v32 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Issued sandbox extension (%{private}s) for typology url with name %{private}s",  buf,  0x16u);
  }

LABEL_13:
  return v11;
}

- (void)startEnumeration
{
  id v3 = TYALog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Start enumeration.", v5, 2u);
  }

  -[TYATypologyAccessSession _initializeEnumerator](self, "_initializeEnumerator");
}

+ (id)_safeFilenameWithName:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lastPathComponent]);
  unsigned int v5 = v4;
  if (!v4
    || ![v4 length]
    || ([v5 isEqualToString:@"/"] & 1) != 0
    || ([v5 isEqualToString:@"~"] & 1) != 0
    || ([v5 isEqualToString:@"."] & 1) != 0
    || ([v5 isEqualToString:@".."] & 1) != 0)
  {
    goto LABEL_14;
  }

  if (([v5 isEqualToString:v3] & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 pathComponents]);
    if ([v7 count] == (id)2
      && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]),
          unsigned int v9 = [v8 isEqualToString:@"."],
          v8,
          v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
      unsigned int v11 = [v10 isEqualToString:v5];

      if (v11) {
        goto LABEL_8;
      }
    }

    else
    {
    }

- (void)nextTypologyURL:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  unsigned int v5 = 0LL;
  while (1)
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession directoryEnumerator](self, "directoryEnumerator"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v7 nextObject]);

    if (!v5) {
      break;
    }
    if (_isTypologyURL(v5))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession typologyPreferences](self, "typologyPreferences"));
      unsigned int v9 = [v8 isTypologyInDatavault];

      if (v9) {
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[TYATypologyAccessSession _issueSandboxExtensionForURL:]( self,  "_issueSandboxExtensionForURL:",  v5));
      }
      else {
        v10 = 0LL;
      }
      id v13 = TYALog();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
        int v16 = 136380931;
        id v17 = [v15 UTF8String];
        __int16 v18 = 2081;
        id v19 = [v10 UTF8String];
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "-nextTypologyURL: -> (%{private}s, %{private}s)",  (uint8_t *)&v16,  0x16u);
      }

      v4[2](v4, v5, v10);
      goto LABEL_13;
    }
  }

  id v11 = TYALog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "-nextTypologyURL: -> ((null), (null))",  (uint8_t *)&v16,  2u);
  }

  v4[2](v4, 0LL, 0LL);
LABEL_13:
}

- (void)removeTypologyFileWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  id v8 = TYALog();
  unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v24 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Removing typology file with name: %{private}@",  buf,  0xCu);
  }

  id v10 = [(id)objc_opt_class(self) _safeFilenameWithName:v6];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession typologyPreferences](self, "typologyPreferences"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 typologyDirectoryURL]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 URLByAppendingPathComponent:v11 isDirectory:0]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v22 = 0LL;
    id v16 = [v15 removeItemAtURL:v14 error:&v22];
    id v17 = v22;

    if ((v16 & 1) == 0)
    {
      id v18 = TYALog();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10000ACEC();
      }
    }
  }

  else
  {
    id v20 = TYALog();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10000AC8C();
    }

    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  514LL,  0LL));
    id v16 = 0LL;
  }

  v7[2](v7, v16, v17);
}

- (void)setTypologyAccessMode:(unint64_t)a3
{
  id v5 = TYALog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    unint64_t v8 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Set typology access mode %lu.",  (uint8_t *)&v7,  0xCu);
  }

  -[TYATypologyAccessSession setAccessMode:](self, "setAccessMode:", a3);
}

- (void)writeData:(id)a3 toTypologyFileWithName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, BOOL, id))a5;
  if (TI_IS_INTERNAL_INSTALL())
  {
    id v11 = [(id)objc_opt_class(self) _safeFilenameWithName:v9];
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (!v12)
    {
      id v27 = TYALog();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10000AC8C();
      }

      id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  514LL,  0LL));
      int v25 = 0;
      goto LABEL_17;
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession typologyPreferences](self, "typologyPreferences"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 typologyDirectoryURL]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 URLByAppendingPathComponent:v12]);

    id v16 = TYALog();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Write data to typology file at url: %{private}@",  buf,  0xCu);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[TYATypologyAccessSession typologyPreferences](self, "typologyPreferences"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 typologyDirectoryURL]);
    id v32 = 0LL;
    unsigned int v21 = [v18 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v32];
    id v22 = v32;

    if (v21)
    {
      id v31 = v22;
      unsigned __int8 v23 = [v8 writeToURL:v15 options:2 error:&v31];
      id v24 = v31;

      if ((v23 & 1) != 0)
      {
        int v25 = 1;
LABEL_16:

LABEL_17:
        BOOL v26 = v25 != 0;
        goto LABEL_18;
      }
    }

    else
    {
      id v24 = v22;
    }

    id v29 = TYALog();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10000AD4C();
    }

    int v25 = 0;
    goto LABEL_16;
  }

  id v24 = 0LL;
  BOOL v26 = 0LL;
LABEL_18:
  v10[2](v10, v26, v24);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (TITypologyPreferences)typologyPreferences
{
  return self->_typologyPreferences;
}

- (void)setTypologyPreferences:(id)a3
{
}

- (NSDirectoryEnumerator)directoryEnumerator
{
  return self->_directoryEnumerator;
}

- (void)setDirectoryEnumerator:(id)a3
{
}

- (unint64_t)accessMode
{
  return self->_accessMode;
}

- (void).cxx_destruct
{
}

@end