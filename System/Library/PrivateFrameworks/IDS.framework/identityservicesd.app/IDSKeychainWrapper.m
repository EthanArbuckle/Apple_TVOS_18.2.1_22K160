@interface IDSKeychainWrapper
+ (BOOL)_isKeychainError:(id)a3 withOSStatus:(int)a4;
+ (BOOL)isInteractionNotAllowedError:(id)a3;
+ (BOOL)isItemNotFoundError:(id)a3;
+ (BOOL)isUpgradePendingError:(id)a3;
+ (id)descriptionForDataProtectionClass:(int64_t)a3;
+ (id)shortDescriptionForDataProtectionClass:(int64_t)a3;
+ (int64_t)idsKeychainWrapperDataProtectionClassFromIMDataProtectionClass:(unsigned int)a3;
+ (unsigned)imDataProtectionClassFromDataProtectionClass:(int64_t)a3;
- (BOOL)removeDataForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5;
- (BOOL)saveData:(id)a3 forIdentifier:(id)a4 allowSync:(BOOL)a5 allowBackup:(BOOL)a6 dataProtectionClass:(int64_t)a7 error:(id *)a8;
- (BOOL)saveData:(id)a3 forIdentifier:(id)a4 allowSync:(BOOL)a5 dataProtectionClass:(int64_t)a6 error:(id *)a7;
- (id)_keychainAccountFromBaseIdentifier:(id)a3;
- (id)dataForIdentifier:(id)a3;
- (id)dataForIdentifier:(id)a3 error:(id *)a4;
- (void)saveData:(id)a3 forIdentifier:(id)a4 dataProtectionClass:(int64_t)a5 withCompletion:(id)a6;
@end

@implementation IDSKeychainWrapper

+ (BOOL)_isKeychainError:(id)a3 withOSStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if ([v6 isEqualToString:@"IDSKeychainWrapperErrorDomain"]
    && [v5 code] == (id)-2000)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"IDSKeychainWrapperErrorOSStatus"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v4));
    unsigned __int8 v10 = [v8 isEqual:v9];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (BOOL)isItemNotFoundError:(id)a3
{
  return _[a1 _isKeychainError:a3 withOSStatus:4294941996];
}

+ (BOOL)isUpgradePendingError:(id)a3
{
  return _[a1 _isKeychainError:a3 withOSStatus:4294933277];
}

+ (BOOL)isInteractionNotAllowedError:(id)a3
{
  return _[a1 _isKeychainError:a3 withOSStatus:4294941988];
}

+ (id)shortDescriptionForDataProtectionClass:(int64_t)a3
{
  v3 = @"A";
  if (!a3) {
    v3 = @"C";
  }
  if (a3 == 2) {
    return @"D";
  }
  else {
    return (id)v3;
  }
}

+ (id)descriptionForDataProtectionClass:(int64_t)a3
{
  v3 = @"Class D";
  if (!a3) {
    v3 = @"Class C";
  }
  if (a3 == 1) {
    return @"Class A";
  }
  else {
    return (id)v3;
  }
}

+ (unsigned)imDataProtectionClassFromDataProtectionClass:(int64_t)a3
{
  return a3;
}

+ (int64_t)idsKeychainWrapperDataProtectionClassFromIMDataProtectionClass:(unsigned int)a3
{
  return a3;
}

- (id)dataForIdentifier:(id)a3
{
  return -[IDSKeychainWrapper dataForIdentifier:error:](self, "dataForIdentifier:error:", a3, 0LL);
}

- (id)dataForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeychainWrapper _keychainAccountFromBaseIdentifier:]( self,  "_keychainAccountFromBaseIdentifier:",  v6));
  uint64_t v8 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Loading IDS keychain data with account %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v10)
    && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSKeychainWrapper",  @"Loading IDS keychain data with account %@");
  }

  unsigned int v24 = 0;
  id v23 = 0LL;
  char v11 = IMGetKeychainData(&v23, IDSKeychainServiceName, v7, 0LL, &v24);
  id v12 = v23;
  if ((v11 & 1) != 0)
  {
    uint64_t v13 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v12 length];
      *(_DWORD *)buf = 134217984;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "  => Done loading IDS keychain data (loaded %ld bytes)",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v16)
      && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
    {
      [v12 length];
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSKeychainWrapper",  @"  => Done loading IDS keychain data (loaded %ld bytes)");
    }

    a4 = (id *)v12;
  }

  else
  {
    uint64_t v17 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 1024;
      unsigned int v30 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "  => Unable to load keychain data for account %@ (error: %d)",  buf,  0x12u);
    }

    if (os_log_shim_legacy_logging_enabled(v19)
      && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
    {
      _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSKeychainWrapper",  @"  => Unable to load keychain data for account %@ (error: %d)");
    }

    if (a4)
    {
      v25 = @"IDSKeychainWrapperErrorOSStatus";
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v24));
      v26 = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeychainWrapperErrorDomain",  -2000LL,  v21));

      a4 = 0LL;
    }
  }

  return a4;
}

- (BOOL)saveData:(id)a3 forIdentifier:(id)a4 allowSync:(BOOL)a5 dataProtectionClass:(int64_t)a6 error:(id *)a7
{
  return -[IDSKeychainWrapper saveData:forIdentifier:allowSync:allowBackup:dataProtectionClass:error:]( self,  "saveData:forIdentifier:allowSync:allowBackup:dataProtectionClass:error:",  a3,  a4,  a5,  1LL,  a6,  a7);
}

- (BOOL)saveData:(id)a3 forIdentifier:(id)a4 allowSync:(BOOL)a5 allowBackup:(BOOL)a6 dataProtectionClass:(int64_t)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeychainWrapper _keychainAccountFromBaseIdentifier:]( self,  "_keychainAccountFromBaseIdentifier:",  v15));
  uint64_t v17 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Saving IDS keychain data with account %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v19)
    && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
  {
    v40 = v16;
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSKeychainWrapper",  @"Saving IDS keychain data with account %@");
  }

  unsigned int v42 = 0;
  if (objc_msgSend(v14, "length", v40))
  {
    uint64_t v20 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v14 length];
      *(_DWORD *)buf = 134217984;
      id v48 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "  => Will save %ld bytes", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v23)
      && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
    {
      id v41 = [v14 length];
      _IDSLogV(0LL, @"IDSFoundation", @"IDSKeychainWrapper", @"  => Will save %ld bytes");
    }

    if ((IMSetKeychainDataWithProtection(v14, IDSKeychainServiceName, v16, 0LL, v11, v10, a7, &v42, v41) & 1) == 0)
    {
      uint64_t v24 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v48 = v16;
        __int16 v49 = 1024;
        unsigned int v50 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  " => Failed setting keychain data for account %@ (error: %d)",  buf,  0x12u);
      }

      if (os_log_shim_legacy_logging_enabled(v26)
        && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
      {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSKeychainWrapper",  @" => Failed setting keychain data for account %@ (error: %d)");
      }

      if (a8)
      {
        v45 = @"IDSKeychainWrapperErrorOSStatus";
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v42));
        v46 = v27;
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"IDSKeychainWrapperErrorDomain",  -2000LL,  v28));
LABEL_34:
        *a8 = v29;

        LOBYTE(a8) = 0;
        goto LABEL_35;
      }

      goto LABEL_35;
    }

- (void)saveData:(id)a3 forIdentifier:(id)a4 dataProtectionClass:(int64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSKeychainWrapper _keychainAccountFromBaseIdentifier:]( self,  "_keychainAccountFromBaseIdentifier:",  v11));
  uint64_t v14 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Saving IDS keychain data with account %@",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v16)
    && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSKeychainWrapper",  @"Saving IDS keychain data with account %@");
  }

  uint64_t v17 = OSLogHandleForIDSCategory("IDSKeychainWrapper");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v10 length];
    *(_DWORD *)buf = 134217984;
    id v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "  => Will save %ld bytes", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v20)
    && _IDSShouldLog(0LL, @"IDSKeychainWrapper"))
  {
    [v10 length];
    _IDSLogV(0LL, @"IDSFoundation", @"IDSKeychainWrapper", @"  => Will save %ld bytes");
  }

  uint64_t v21 = IDSKeychainServiceName;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005D6E0;
  v23[3] = &unk_1008F8148;
  id v24 = v12;
  id v22 = v12;
  IMSetKeychainDataWithProtectionWithCompletion(v10, v21, v13, 0LL, a5, v23);
}

- (BOOL)removeDataForIdentifier:(id)a3 dataProtectionClass:(int64_t)a4 error:(id *)a5
{
  id v12 = 0LL;
  unsigned __int8 v7 = -[IDSKeychainWrapper saveData:forIdentifier:allowSync:dataProtectionClass:error:]( self,  "saveData:forIdentifier:allowSync:dataProtectionClass:error:",  0LL,  a3,  0LL,  a4,  &v12);
  id v9 = v12;
  if (v7 & 1) != 0 || (objc_msgSend((id)objc_opt_class(self, v8), "isItemNotFoundError:", v9))
  {
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
    if (a5) {
      *a5 = v9;
    }
  }

  return v10;
}

- (id)_keychainAccountFromBaseIdentifier:(id)a3
{
  return (id)_IDSRegistrationKeychainItemNameForIdentifierAndName(0LL, a3);
}

@end