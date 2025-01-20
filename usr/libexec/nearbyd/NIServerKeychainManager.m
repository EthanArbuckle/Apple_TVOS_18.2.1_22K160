@interface NIServerKeychainManager
+ (id)sharedInstance;
- (BOOL)_shouldLog;
- (BOOL)deleteAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5;
- (BOOL)deleteItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6;
- (BOOL)writeItem:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5;
- (id)_initInternal;
- (id)_internalReadItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6;
- (id)readAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5;
- (id)readItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6;
- (void)_unitTest1;
- (void)_unitTest2;
- (void)_unitTest3;
@end

@implementation NIServerKeychainManager

+ (id)sharedInstance
{
  if (qword_1007FBF88 != -1) {
    dispatch_once(&qword_1007FBF88, &stru_1007B8BB0);
  }
  return (id)qword_1007FBF80;
}

- (BOOL)writeItem:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100255280;
  v13[3] = &unk_1007B8BD8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  BOOL v17 = a5;
  v15 = &v18;
  id v10 = v8;
  dispatch_sync(queue, v13);
  char v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)readItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100255874;
  v27 = sub_100255884;
  id v28 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025588C;
  block[3] = &unk_1007B8C00;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  uint64_t v20 = &v23;
  BOOL v21 = a5;
  BOOL v22 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(queue, block);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (id)readAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  BOOL v21 = sub_100255874;
  BOOL v22 = sub_100255884;
  uint64_t v23 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002559E4;
  v13[3] = &unk_1007B8BD8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v15 = &v18;
  id v10 = v8;
  dispatch_sync(queue, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)deleteItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100255F48;
  block[3] = &unk_1007B8C50;
  block[4] = self;
  id v17 = v10;
  BOOL v20 = a5;
  BOOL v21 = a6;
  id v18 = v11;
  id v19 = &v22;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)queue;
}

- (BOOL)deleteAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100256278;
  v13[3] = &unk_1007B8BD8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v15 = &v18;
  id v10 = v8;
  dispatch_sync(queue, v13);
  char v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)_initInternal
{
  if (-[NIServerKeychainManager _shouldLog](self, "_shouldLog"))
  {
    v3 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,_initInternal", buf, 2u);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIServerKeychainManager;
  v4 = -[NIServerKeychainManager init](&v8, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nearbyd.km", 0LL);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;
  }

  return v4;
}

- (id)_internalReadItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NIServerKeychainManager _shouldLog](self, "_shouldLog"))
  {
    v12 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478595;
      *(void *)id v28 = v10;
      *(_WORD *)&v28[8] = 2113;
      *(void *)&v28[10] = v11;
      __int16 v29 = 1024;
      BOOL v30 = v7;
      __int16 v31 = 1024;
      BOOL v32 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#ni-km,Read: %{private}@, %{private}@, %d, %d",  buf,  0x22u);
    }
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  id v14 = (__CFDictionary *)CFAutorelease(Mutable);
  id v15 = v14;
  CFTypeRef result = 0LL;
  if (v6) {
    CFBooleanRef v16 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v16 = kCFBooleanFalse;
  }
  CFDictionaryAddValue(v14, kSecUseSystemKeychain, v16);
  CFDictionaryAddValue(v15, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(v15, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFDictionaryAddValue(v15, kSecAttrAccount, v11);
  CFDictionaryAddValue(v15, kSecAttrService, v10);
  CFDictionaryAddValue(v15, kSecAttrAccessGroup, @"com.apple.nearbyd");
  if (v7) {
    CFBooleanRef v17 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v17 = kCFBooleanFalse;
  }
  CFDictionaryAddValue(v15, kSecAttrSynchronizable, v17);
  CFDictionaryAddValue(v15, kSecReturnData, kCFBooleanTrue);
  CFDictionaryAddValue(v15, kSecReturnAttributes, kCFBooleanTrue);
  OSStatus v18 = SecItemCopyMatching(v15, &result);
  if (result)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFTypeID v20 = CFGetTypeID(result);
    char v21 = (void *)result;
    if (TypeID != v20)
    {
      char v21 = 0LL;
      CFRelease(result);
    }
  }

  else
  {
    char v21 = 0LL;
  }

  if (-[NIServerKeychainManager _shouldLog](self, "_shouldLog"))
  {
    uint64_t v22 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174915;
      *(_DWORD *)id v28 = v18;
      *(_WORD *)&v28[4] = 2113;
      *(void *)&v28[6] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ni-km,Read status: %{private}d. Result: %{private}@",  buf,  0x12u);
    }
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kSecValueData]);
  if (v23) {
    uint64_t v24 = -[NIServerKeychainItem initWithService:account:data:]( objc_alloc(&OBJC_CLASS___NIServerKeychainItem),  "initWithService:account:data:",  v10,  v11,  v23);
  }
  else {
    uint64_t v24 = 0LL;
  }

  return v24;
}

- (void)_unitTest1
{
  v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ni-km,======================================================================",  buf,  2u);
  }

  v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 1", buf, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    char v76 = 0;
    dispatch_queue_t v5 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction1",  @"UnitTest1",  0LL,  0LL));
    BOOL v6 = v5;
    if (v5) {
      unsigned int v7 = -[NIServerKeychainItem isEqual:](v5, "isEqual:", 0LL);
    }
    else {
      unsigned int v7 = 1;
    }
    objc_super v8 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v9 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    id v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    id v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  buf,  0xCu);
    }

    v12 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = "FAILED";
      if (v7) {
        id v13 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    id v14 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    ++v76;
    id v15 = objc_alloc(&OBJC_CLASS___NIServerKeychainItem);
    CFBooleanRef v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v76, 1LL));
    CFBooleanRef v17 = -[NIServerKeychainItem initWithService:account:data:]( v15,  "initWithService:account:data:",  @"UnitTestFunction1",  @"UnitTest1",  v16);

    unsigned int v18 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:]( self,  "writeItem:synchronizable:systemKeychain:",  v17,  0LL,  0LL);
    id v19 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    CFTypeID v20 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 2;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: WRITE", buf, 8u);
    }

    char v21 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", buf, 0xCu);
    }

    uint64_t v22 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = "FAILED";
      if (v18) {
        uint64_t v23 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    uint64_t v24 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    unint64_t v25 = (unint64_t)-[NIServerKeychainItem copy](v17, "copy");
    uint64_t v26 = objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction1",  @"UnitTest1",  0LL,  0LL));

    if (v26 | v25) {
      unsigned int v27 = [(id)v26 isEqual:v25];
    }
    else {
      unsigned int v27 = 1;
    }
    id v28 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    __int16 v29 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    BOOL v30 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    __int16 v31 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v25;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  buf,  0xCu);
    }

    BOOL v32 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "FAILED";
      if (v27) {
        v33 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v34 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    ++v76;
    v35 = objc_alloc(&OBJC_CLASS___NIServerKeychainItem);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v76, 1LL));
    v37 = -[NIServerKeychainItem initWithService:account:data:]( v35,  "initWithService:account:data:",  @"UnitTestFunction1",  @"UnitTest1",  v36);

    unsigned int v38 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:]( self,  "writeItem:synchronizable:systemKeychain:",  v37,  0LL,  0LL);
    v39 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v40 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: WRITE", buf, 8u);
    }

    v41 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v37;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", buf, 0xCu);
    }

    v42 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = "FAILED";
      if (v38) {
        v43 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v44 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    unint64_t v45 = (unint64_t)-[NIServerKeychainItem copy](v37, "copy");
    uint64_t v46 = objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction1",  @"UnitTest1",  0LL,  0LL));

    if (v46 | v45) {
      unsigned int v47 = [(id)v46 isEqual:v45];
    }
    else {
      unsigned int v47 = 1;
    }
    v48 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v49 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 5;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v50 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v46;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v51 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v45;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  buf,  0xCu);
    }

    v52 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = "FAILED";
      if (v47) {
        v53 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v54 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    unsigned int v55 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:]( self,  "deleteItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction1",  @"UnitTest1",  0LL,  0LL);
    v56 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v57 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 6;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: DELETE", buf, 8u);
    }

    v58 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = "FAILED";
      if (v55) {
        v59 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v60 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    unsigned int v61 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:]( self,  "deleteItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction1",  @"UnitTest1",  0LL,  0LL);
    v62 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v63 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 7;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: DELETE", buf, 8u);
    }

    v64 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = "FAILED";
      if (v61) {
        v65 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v66 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v67 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction1",  @"UnitTest1",  0LL,  0LL));
    if (v67) {
      unsigned int v68 = -[NIServerKeychainItem isEqual:](v67, "isEqual:", 0LL);
    }
    else {
      unsigned int v68 = 1;
    }
    v69 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }

    v70 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 8;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v71 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v67;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v72 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  buf,  0xCu);
    }

    v73 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = "FAILED";
      if (v68) {
        v74 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v74;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v75 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  buf,  2u);
    }
  }

- (void)_unitTest2
{
  v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ni-km,======================================================================",  buf,  2u);
  }

  v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 2", buf, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    *(void *)buf = 0LL;
    v110 = buf;
    uint64_t v111 = 0x2020000000LL;
    char v112 = 0;
    uint64_t v108 = 0LL;
    v91 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:]( self,  "readAllItemsWithService:synchronizable:systemKeychain:",  @"UnitTestFunction2",  0LL,  0LL));
    id v6 = [v5 count];
    id v7 = -[NSMutableSet count](v91, "count");
    v110[24] = v6 == v7;
    if (v6 == v7)
    {
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472LL;
      v105[2] = sub_100258F50;
      v105[3] = &unk_1007B8C78;
      v106 = v91;
      v107 = buf;
      [v5 enumerateObjectsUsingBlock:v105];
    }

    objc_super v8 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    v9 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    id v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    id v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected stored: %@",  v113,  0xCu);
    }

    v12 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        id v13 = "PASSED";
      }
      else {
        id v13 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    id v14 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    id v15 = 0LL;
    CFBooleanRef v16 = 0LL;
    CFBooleanRef v17 = 0LL;
    uint64_t v18 = 1LL;
    do
    {
      ++v108;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UnitTest2-%d",  v18));

      CFTypeID v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v108, 8LL));
      v92 = -[NIServerKeychainItem initWithService:account:data:]( objc_alloc(&OBJC_CLASS___NIServerKeychainItem),  "initWithService:account:data:",  @"UnitTestFunction2",  v19,  v20);

      if (!-[NIServerKeychainManager writeItem:synchronizable:systemKeychain:]( self,  "writeItem:synchronizable:systemKeychain:"))
      {
        v69 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_1003A24E0((uint64_t)v92, v69, v70, v71, v72, v73, v74, v75);
        }
        goto LABEL_108;
      }

      -[NSMutableSet addObject:](v91, "addObject:");
      uint64_t v18 = (v18 + 1);
      id v15 = v92;
      CFBooleanRef v16 = v19;
      CFBooleanRef v17 = v20;
    }

    while ((_DWORD)v18 != 8);
    char v21 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:]( self,  "readAllItemsWithService:synchronizable:systemKeychain:",  @"UnitTestFunction2",  0LL,  0LL));

    id v22 = [v21 count];
    id v23 = -[NSMutableSet count](v91, "count");
    v110[24] = v22 == v23;
    if (v22 == v23)
    {
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472LL;
      v102[2] = sub_100258F94;
      v102[3] = &unk_1007B8C78;
      v103 = v91;
      v104 = buf;
      [v21 enumerateObjectsUsingBlock:v102];
    }

    uint64_t v24 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    unint64_t v25 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 2;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    uint64_t v26 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    unsigned int v27 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected stored: %@",  v113,  0xCu);
    }

    id v28 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        __int16 v29 = "PASSED";
      }
      else {
        __int16 v29 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    BOOL v30 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    char v31 = 1;
    do
    {
      char v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v91, "allObjects"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 firstObject]);

      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 service]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v34 account]);
      unsigned __int8 v37 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:]( self,  "deleteItemWithService:account:synchronizable:systemKeychain:",  v35,  v36,  0LL,  0LL);

      if ((v37 & 1) == 0)
      {
        char v76 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_1003A2544((uint64_t)v34, v76, v77, v78, v79, v80, v81, v82);
        }

        goto LABEL_107;
      }

      -[NSMutableSet removeObject:](v91, "removeObject:", v34);

      char v31 = 0;
    }

    while ((v32 & 1) != 0);
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:]( self,  "readAllItemsWithService:synchronizable:systemKeychain:",  @"UnitTestFunction2",  0LL,  0LL));

    id v38 = [v5 count];
    id v39 = -[NSMutableSet count](v91, "count");
    v110[24] = v38 == v39;
    if (v38 == v39)
    {
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472LL;
      v99[2] = sub_100258FD8;
      v99[3] = &unk_1007B8C78;
      v100 = v91;
      v101 = buf;
      [v5 enumerateObjectsUsingBlock:v99];
    }

    v40 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    v41 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 3;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    v42 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v5;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v43 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected stored: %@",  v113,  0xCu);
    }

    v44 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        unint64_t v45 = "PASSED";
      }
      else {
        unint64_t v45 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    uint64_t v46 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    uint64_t v47 = 8LL;
    v48 = v92;
    v49 = v19;
    v50 = v20;
    do
    {
      ++v108;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"UnitTest2-%d",  v47));

      CFTypeID v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v108, 8LL));
      v92 = -[NIServerKeychainItem initWithService:account:data:]( objc_alloc(&OBJC_CLASS___NIServerKeychainItem),  "initWithService:account:data:",  @"UnitTestFunction2",  v19,  v20);

      if (!-[NIServerKeychainManager writeItem:synchronizable:systemKeychain:]( self,  "writeItem:synchronizable:systemKeychain:"))
      {
        v83 = (os_log_s *)qword_1008000A0;
        if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
          sub_1003A24E0((uint64_t)v92, v83, v84, v85, v86, v87, v88, v89);
        }
        goto LABEL_108;
      }

      -[NSMutableSet addObject:](v91, "addObject:");
      uint64_t v47 = (v47 + 1);
      v48 = v92;
      v49 = v19;
      v50 = v20;
    }

    while ((_DWORD)v47 != 108);
    char v21 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:]( self,  "readAllItemsWithService:synchronizable:systemKeychain:",  @"UnitTestFunction2",  0LL,  0LL));

    id v51 = [v21 count];
    id v52 = -[NSMutableSet count](v91, "count");
    v110[24] = v51 == v52;
    if (v51 == v52)
    {
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_10025901C;
      v96[3] = &unk_1007B8C78;
      v97 = v91;
      v98 = buf;
      [v21 enumerateObjectsUsingBlock:v96];
    }

    v53 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    v54 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 4;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    unsigned int v55 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v21;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v56 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = v91;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected stored: %@",  v113,  0xCu);
    }

    v57 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        v58 = "PASSED";
      }
      else {
        v58 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = (void *)v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    v59 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
    }

    if (-[NIServerKeychainManager deleteAllItemsWithService:synchronizable:systemKeychain:]( self,  "deleteAllItemsWithService:synchronizable:systemKeychain:",  @"UnitTestFunction2",  0LL,  0LL))
    {
      -[NSMutableSet removeAllObjects](v91, "removeAllObjects");
      dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readAllItemsWithService:synchronizable:systemKeychain:]( self,  "readAllItemsWithService:synchronizable:systemKeychain:",  @"UnitTestFunction2",  0LL,  0LL));

      id v60 = [v5 count];
      id v61 = -[NSMutableSet count](v91, "count");
      v110[24] = v60 == v61;
      if (v60 == v61)
      {
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472LL;
        v93[2] = sub_100259060;
        v93[3] = &unk_1007B8C78;
        v94 = v91;
        v95 = buf;
        [v5 enumerateObjectsUsingBlock:v93];
      }

      v62 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
      }

      v63 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 67109120;
        LODWORD(v114) = 5;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
      }

      v64 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 138412290;
        v114 = v5;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
      }

      v65 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 138412290;
        v114 = v91;
        _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected stored: %@",  v113,  0xCu);
      }

      v66 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        if (v110[24]) {
          v67 = "PASSED";
        }
        else {
          v67 = "FAILED";
        }
        *(_DWORD *)v113 = 136315138;
        v114 = (void *)v67;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
      }

      unsigned int v68 = (os_log_s *)(id)qword_1008000A0;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  v113,  2u);
      }

      goto LABEL_108;
    }

    v90 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003A24A0(v90);
    }
LABEL_107:
    dispatch_queue_t v5 = v21;
LABEL_108:

    _Block_object_dispose(buf, 8);
  }

- (void)_unitTest3
{
  v3 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v72) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ni-km,======================================================================",  (uint8_t *)&v72,  2u);
  }

  v4 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v72) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 3", (uint8_t *)&v72, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild"))
  {
    dispatch_queue_t v5 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction3",  @"UnitTest3",  0LL,  0LL));
    id v6 = v5;
    if (v5) {
      unsigned int v7 = -[NIServerKeychainItem isEqual:](v5, "isEqual:", 0LL);
    }
    else {
      unsigned int v7 = 1;
    }
    objc_super v8 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    v9 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: READ",  (uint8_t *)&v72,  8u);
    }

    id v10 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Read result: %@.",  (uint8_t *)&v72,  0xCu);
    }

    id v11 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  (uint8_t *)&v72,  0xCu);
    }

    v12 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = "FAILED";
      if (v7) {
        id v13 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    id v14 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    id v15 = objc_alloc(&OBJC_CLASS___NIServerKeychainItem);
    uint64_t v16 = NSRandomData(800LL, 0LL);
    CFBooleanRef v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    uint64_t v18 = -[NIServerKeychainItem initWithService:account:data:]( v15,  "initWithService:account:data:",  @"UnitTestFunction3",  @"UnitTest3",  v17);

    unsigned int v19 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:]( self,  "writeItem:synchronizable:systemKeychain:",  v18,  0LL,  0LL);
    CFTypeID v20 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    char v21 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 2;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: WRITE",  (uint8_t *)&v72,  8u);
    }

    id v22 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Write: %@.",  (uint8_t *)&v72,  0xCu);
    }

    id v23 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = "FAILED";
      if (v19) {
        uint64_t v24 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    unint64_t v25 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    unint64_t v26 = (unint64_t)-[NIServerKeychainItem copy](v18, "copy");
    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction3",  @"UnitTest3",  0LL,  0LL));

    if (v27 | v26) {
      unsigned int v28 = [(id)v27 isEqual:v26];
    }
    else {
      unsigned int v28 = 1;
    }
    __int16 v29 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    BOOL v30 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 3;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: READ",  (uint8_t *)&v72,  8u);
    }

    char v31 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = (NIServerKeychainItem *)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Read result: %@.",  (uint8_t *)&v72,  0xCu);
    }

    char v32 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = (NIServerKeychainItem *)v26;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  (uint8_t *)&v72,  0xCu);
    }

    v33 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = "FAILED";
      if (v28) {
        v34 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    v35 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    v36 = objc_alloc(&OBJC_CLASS___NIServerKeychainItem);
    uint64_t v37 = NSRandomData(1680LL, 0LL);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v39 = -[NIServerKeychainItem initWithService:account:data:]( v36,  "initWithService:account:data:",  @"UnitTestFunction3",  @"UnitTest3",  v38);

    unsigned int v40 = -[NIServerKeychainManager writeItem:synchronizable:systemKeychain:]( self,  "writeItem:synchronizable:systemKeychain:",  v39,  0LL,  0LL);
    v41 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    v42 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 4;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: WRITE",  (uint8_t *)&v72,  8u);
    }

    v43 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Write: %@.",  (uint8_t *)&v72,  0xCu);
    }

    v44 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v45 = "FAILED";
      if (v40) {
        unint64_t v45 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v45;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    uint64_t v46 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    unint64_t v47 = (unint64_t)-[NIServerKeychainItem copy](v39, "copy");
    uint64_t v48 = objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction3",  @"UnitTest3",  0LL,  0LL));

    if (v48 | v47) {
      unsigned int v49 = [(id)v48 isEqual:v47];
    }
    else {
      unsigned int v49 = 1;
    }
    v50 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    id v51 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 5;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: READ",  (uint8_t *)&v72,  8u);
    }

    id v52 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = (NIServerKeychainItem *)v48;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Read result: %@.",  (uint8_t *)&v72,  0xCu);
    }

    v53 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = (NIServerKeychainItem *)v47;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  (uint8_t *)&v72,  0xCu);
    }

    v54 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v55 = "FAILED";
      if (v49) {
        unsigned int v55 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v55;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    v56 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    unsigned int v57 = -[NIServerKeychainManager deleteItemWithService:account:synchronizable:systemKeychain:]( self,  "deleteItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction3",  @"UnitTest3",  0LL,  0LL);
    v58 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    v59 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 6;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: DELETE",  (uint8_t *)&v72,  8u);
    }

    id v60 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      id v61 = "FAILED";
      if (v57) {
        id v61 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v61;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    v62 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    v63 = (NIServerKeychainItem *)objc_claimAutoreleasedReturnValue( -[NIServerKeychainManager readItemWithService:account:synchronizable:systemKeychain:]( self,  "readItemWithService:account:synchronizable:systemKeychain:",  @"UnitTestFunction3",  @"UnitTest3",  0LL,  0LL));
    if (v63) {
      unsigned int v64 = -[NIServerKeychainItem isEqual:](v63, "isEqual:", 0LL);
    }
    else {
      unsigned int v64 = 1;
    }
    v65 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }

    v66 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 67109120;
      LODWORD(v73) = 7;
      _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "#ni-km,| Test 3-%d: READ",  (uint8_t *)&v72,  8u);
    }

    v67 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Read result: %@.",  (uint8_t *)&v72,  0xCu);
    }

    unsigned int v68 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      int v72 = 138412290;
      uint64_t v73 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Expected read result: %@",  (uint8_t *)&v72,  0xCu);
    }

    v69 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v70 = "FAILED";
      if (v64) {
        uint64_t v70 = "PASSED";
      }
      int v72 = 136315138;
      uint64_t v73 = (NIServerKeychainItem *)v70;
      _os_log_impl( (void *)&_mh_execute_header,  v69,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|     Test result: %s",  (uint8_t *)&v72,  0xCu);
    }

    uint64_t v71 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v72) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "#ni-km,|------------------------------------------------------------",  (uint8_t *)&v72,  2u);
    }
  }

- (BOOL)_shouldLog
{
  if (!+[NIPlatformInfo isInternalBuild](&OBJC_CLASS___NIPlatformInfo, "isInternalBuild")) {
    return 0;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned __int8 v3 = [v2 BOOLForKey:@"KMOutputLogs"];

  return v3;
}

- (void).cxx_destruct
{
}

@end