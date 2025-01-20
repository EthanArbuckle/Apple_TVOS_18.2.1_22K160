@interface SecDbKeychainMetadataKeyStore
+ (BOOL)cachingEnabled;
+ (id)sharedStore;
+ (void)resetSharedStore;
- (BOOL)readKeyDataForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 actualKeyclass:(int *)a5 wrappedKey:(id *)a6 error:(id *)a7;
- (NSMutableDictionary)keysDict;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)fetchKeyForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 keybag:(int)a5 specifier:(id)a6 allowWrites:(BOOL)a7 error:(id *)a8;
- (id)keyForKeyclass:(int)a3 keybag:(int)a4 keySpecifier:(id)a5 allowWrites:(BOOL)a6 error:(id *)a7;
- (id)newKeyForKeyclass:(int)a3 withKeybag:(int)a4 keySpecifier:(id)a5 database:(__OpaqueSecDbConnection *)a6 error:(id *)a7;
- (id)validateWrappedKey:(id)a3 forKeyClass:(int)a4 actualKeyClass:(int *)a5 keybag:(int)a6 keySpecifier:(id)a7 error:(id *)a8;
- (id)writeKey:(id)a3 ForKeyclass:(int)a4 withKeybag:(int)a5 keySpecifier:(id)a6 database:(__OpaqueSecDbConnection *)a7 error:(id *)a8;
- (int)keybagNotificationToken;
- (void)_onQueueDropAllKeys;
- (void)_onQueueDropClassAKeys;
- (void)dealloc;
- (void)dropAllKeys;
- (void)dropClassAKeys;
- (void)setKeybagNotificationToken:(int)a3;
- (void)setKeysDict:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SecDbKeychainMetadataKeyStore

- (id)_init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SecDbKeychainMetadataKeyStore;
  v2 = -[SecDbKeychainMetadataKeyStore init](&v14, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    keysDict = v2->_keysDict;
    v2->_keysDict = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("SecDbKeychainMetadataKeyStore", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v2->_keybagNotificationToken = -1;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v9 = (dispatch_queue_s *)v2->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100181904;
    v11[3] = &unk_1002913A0;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_keybagNotificationToken, v9, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  int keybagNotificationToken = self->_keybagNotificationToken;
  if (keybagNotificationToken != -1)
  {
    notify_cancel(keybagNotificationToken);
    self->_int keybagNotificationToken = -1;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SecDbKeychainMetadataKeyStore;
  -[SecDbKeychainMetadataKeyStore dealloc](&v4, "dealloc");
}

- (void)dropClassAKeys
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001818FC;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueueDropClassAKeys
{
  v3 = sub_10001267C("SecDbKeychainMetadataKeyStore");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_attr_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dropping class A metadata keys", v5, 2u);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_keysDict,  "setObject:forKeyedSubscript:",  0LL,  &off_1002ADF38);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_keysDict,  "setObject:forKeyedSubscript:",  0LL,  &off_1002ADF50);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_keysDict,  "setObject:forKeyedSubscript:",  0LL,  &off_1002ADF68);
}

- (void)dropAllKeys
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001818F4;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueueDropAllKeys
{
  v3 = sub_10001267C("SecDbKeychainMetadataKeyStore");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_attr_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dropping all metadata keys", v5, 2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_keysDict, "removeAllObjects");
}

- (id)validateWrappedKey:(id)a3 forKeyClass:(int)a4 actualKeyClass:(int *)a5 keybag:(int)a6 keySpecifier:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  id v13 = a3;
  id v14 = a7;
  unsigned int v15 = *a5;
  if (*a5 == a4 || v15 == 0) {
    uint64_t v17 = a4;
  }
  else {
    uint64_t v17 = v15;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 32LL));
  id v36 = 0LL;
  unsigned int v19 = +[SecAKSObjCWrappers aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:]( &OBJC_CLASS___SecAKSObjCWrappers,  "aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:",  v10,  v17,  v13,  0LL,  v18,  0LL,  0LL,  &v36);
  id v20 = v36;
  v21 = v20;
  if (v19)
  {
    id v35 = v20;
    id v22 = [[_SFAESKey alloc] initWithData:v18 specifier:v14 error:&v35];
    id v23 = v35;

    if (!v22)
    {
      v24 = sub_10001267C("SecError");
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v38[0]) = v17;
        WORD2(v38[0]) = 2112;
        *(void *)((char *)v38 + 6) = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "SecDbKeychainItemV7: AKS decrypted metadata blob for class %d but could not turn it into a key: %@",  buf,  0x12u);
      }

      goto LABEL_15;
    }
  }

  else
  {
    if ((int)v17 > 30 || *a5)
    {
      id v23 = v20;
      goto LABEL_15;
    }

    *a5 = v17 | 0x20;
    id v34 = v20;
    unsigned int v31 = +[SecAKSObjCWrappers aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:]( &OBJC_CLASS___SecAKSObjCWrappers,  "aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:",  v10,  0LL,  &v34);
    id v23 = v34;

    if (!v31
      || (id v33 = v23,
          id v22 = [[_SFAESKey alloc] initWithData:v18 specifier:v14 error:&v33],
          id v32 = v33,
          v23,
          id v23 = v32,
          !v22))
    {
LABEL_15:
      v26 = (void *)objc_claimAutoreleasedReturnValue([v23 domain]);
      if ([v26 isEqualToString:kCFErrorDomainOSStatus])
      {
        id v27 = [v23 code];

        if (v27 == (id)-25308LL)
        {
          if (a8)
          {
LABEL_18:
            id v23 = v23;
            id v22 = 0LL;
            *a8 = v23;
            goto LABEL_24;
          }

- (id)newKeyForKeyclass:(int)a3 withKeybag:(int)a4 keySpecifier:(id)a5 database:(__OpaqueSecDbConnection *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v18 = 0LL;
  id v13 = [[_SFAESKey alloc] initRandomKeyWithSpecifier:v12 error:&v18];
  id v14 = v18;
  unsigned int v15 = v14;
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainMetadataKeyStore writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:]( self,  "writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:",  v13,  v10,  v9,  v12,  a6,  a7));
  }

  else
  {
    v16 = 0LL;
    if (a7) {
      *a7 = v14;
    }
  }

  return v16;
}

- (id)writeKey:(id)a3 ForKeyclass:(int)a4 withKeybag:(int)a5 keySpecifier:(id)a6 database:(__OpaqueSecDbConnection *)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 40LL));
  int v42 = v12;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v14 keyData]);
  id v41 = 0LL;
  unsigned __int8 v18 = +[SecAKSObjCWrappers aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:]( &OBJC_CLASS___SecAKSObjCWrappers,  "aksEncryptWithKeybag:keyclass:plaintext:outKeyclass:ciphertext:personaId:personaIdLength:error:",  v11,  v12,  v17,  &v42,  v16,  0LL,  0LL,  &v41);
  id v19 = v41;

  if ((v18 & 1) != 0)
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x2020000000LL;
    char v49 = 1;
    uint64_t v37 = 0LL;
    v38 = &v37;
    uint64_t v39 = 0x2020000000LL;
    CFTypeRef v40 = 0LL;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_1001817C8;
    v30[3] = &unk_1002913C8;
    p___int128 buf = &buf;
    id v33 = &v37;
    int v35 = v12;
    int v36 = v42;
    id v31 = v16;
    id v34 = a7;
    unsigned __int8 v20 = sub_100015B70( (uint64_t)a7,  @"INSERT OR REPLACE INTO metadatakeys (keyclass, actualKeyclass, data) VALUES (?,?,?)",  &v40,  (uint64_t)v30);
    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL)) {
      unsigned __int8 v21 = v20;
    }
    else {
      unsigned __int8 v21 = 0;
    }
    *(_BYTE *)(*((void *)&buf + 1) + 24LL) = v21;
    if ((v21 & 1) != 0)
    {
      id v22 = v14;
    }

    else
    {
      v25 = sub_10001267C("SecError");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = v38[3];
        *(_DWORD *)v43 = 67109378;
        int v44 = v12;
        __int16 v45 = 2112;
        uint64_t v46 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Failed to write new metadata key for %d: %@",  v43,  0x12u);
      }

      v28 = (void *)v38[3];
      if (a8)
      {
        id v22 = 0LL;
        *a8 = v28;
        v38[3] = 0LL;
      }

      else
      {
        if (v28)
        {
          v38[3] = 0LL;
          CFRelease(v28);
        }

        id v22 = 0LL;
      }
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    id v23 = sub_10001267C("SecError");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "SecDbMetadataKeyStore: Unable to encrypt new metadata key to keybag: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v22 = 0LL;
    if (a8) {
      *a8 = v19;
    }
  }

  return v22;
}

- (BOOL)readKeyDataForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 actualKeyclass:(int *)a5 wrappedKey:(id *)a6 error:(id *)a7
{
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = sub_100180EA0;
  int v35 = sub_100180EB0;
  id v36 = 0LL;
  uint64_t v27 = 0LL;
  v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 1;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v19 = 0LL;
  unsigned __int8 v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  CFTypeRef v22 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100181658;
  v17[3] = &unk_100291418;
  int v18 = a3;
  v17[4] = &v27;
  v17[5] = &v19;
  v17[8] = a4;
  v17[9] = a5;
  v17[6] = &v31;
  v17[7] = &v23;
  unsigned int v12 = sub_100015B70( (uint64_t)a4,  @"SELECT data, actualKeyclass FROM metadatakeys WHERE keyclass = ?",  &v22,  (uint64_t)v17);
  if (*((_BYTE *)v28 + 24)) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  *((_BYTE *)v28 + 24) = v13;
  if (v13 == 1 && *((_BYTE *)v24 + 24))
  {
    *a6 = (id) v32[5];
    BOOL v14 = 1;
  }

  else
  {
    id v15 = (void *)v20[3];
    if (a7)
    {
      *a7 = v15;
      v20[3] = 0LL;
    }

    else if (v15)
    {
      v20[3] = 0LL;
      CFRelease(v15);
    }

    BOOL v14 = 0;
    *a5 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

- (id)fetchKeyForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 keybag:(int)a5 specifier:(id)a6 allowWrites:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v28 = 0;
  id v27 = 0LL;
  unsigned int v15 = -[SecDbKeychainMetadataKeyStore readKeyDataForClass:fromDb:actualKeyclass:wrappedKey:error:]( self,  "readKeyDataForClass:fromDb:actualKeyclass:wrappedKey:error:",  v12,  a4,  &v28,  &v27,  a8);
  id v16 = v27;
  uint64_t v17 = v16;
  int v18 = 0LL;
  if (v15)
  {
    if (![v16 length])
    {
      v24 = sub_10001267C("SecDbMetadataKeyStore");
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No metadata key found on disk despite existing row. That's odd.",  buf,  2u);
      }

      int v18 = 0LL;
      goto LABEL_13;
    }

    int v19 = v28;
    int v18 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainMetadataKeyStore validateWrappedKey:forKeyClass:actualKeyClass:keybag:keySpecifier:error:]( self,  "validateWrappedKey:forKeyClass:actualKeyClass:keybag:keySpecifier:error:",  v17,  v12,  &v28,  v10,  v14,  a8));
    if (v18 && v9 && v19 != v28)
    {
      id v26 = 0LL;
      unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue( -[SecDbKeychainMetadataKeyStore writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:]( self,  "writeKey:ForKeyclass:withKeybag:keySpecifier:database:error:",  v18,  v12,  v10,  v14,  a4,  &v26));
      uint64_t v21 = (os_log_s *)v26;

      if (!v20)
      {
        CFTypeRef v22 = sub_10001267C("SecWarning");
        uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 67109378;
          int v30 = v12;
          __int16 v31 = 2112;
          id v32 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "SecDbMetadataKeyStore: Unable to rewrite metadata key for %d to new format: %@",  buf,  0x12u);
        }

        uint64_t v21 = 0LL;
      }

- (id)keyForKeyclass:(int)a3 keybag:(int)a4 keySpecifier:(id)a5 allowWrites:(BOOL)a6 error:(id *)a7
{
  id v13 = a5;
  if (a7)
  {
    off_1002DE648();
    unsigned int v15 = v14;
    if (*v14)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      id v27 = (objc_class *)objc_opt_class(self);
      int v28 = NSStringFromClass(v27);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      int v30 = NSStringFromSelector(a2);
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      [v32 handleFailureInMethod:a2, self, @"SecDbKeychainMetadataKeyStore.m", 335, @"re-entering -[%@ %@] - that shouldn't happen!", v29, v31 object file lineNumber description];
    }

    *unsigned int v15 = 1;
    if (a3 < 32)
    {
      int v16 = a3;
    }

    else
    {
      int v16 = a3 & 0x1F;
      uint64_t v17 = (os_log_s *)sub_10001267C("SanitizeKeyclass");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = a3;
        LOWORD(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 2) = a3 & 0x1F;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "sanitizing request for keyclass %d to keyclass %d",  buf,  0xEu);
      }
    }

    *(void *)__int128 buf = 0LL;
    v57 = buf;
    uint64_t v58 = 0x3032000000LL;
    v59 = sub_100180EA0;
    v60 = sub_100180EB0;
    id v61 = 0LL;
    uint64_t v50 = 0LL;
    v51 = &v50;
    uint64_t v52 = 0x3032000000LL;
    v53 = sub_100180EA0;
    v54 = sub_100180EB0;
    id v55 = 0LL;
    uint64_t v46 = 0LL;
    v47 = &v46;
    uint64_t v48 = 0x2020000000LL;
    uint64_t v49 = 0LL;
    uint64_t v42 = 0LL;
    v43 = &v42;
    uint64_t v44 = 0x2020000000LL;
    char v45 = 1;
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100180EB8;
    block[3] = &unk_100291468;
    int v35 = buf;
    id v36 = &v42;
    block[4] = self;
    uint64_t v37 = &v46;
    int v39 = v16;
    int v40 = a4;
    BOOL v41 = a6;
    id v34 = v13;
    v38 = &v50;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v43 + 24))
    {
      CFTypeRef v22 = v57;
      if (*((void *)v57 + 5)) {
        goto LABEL_20;
      }
    }

    uint64_t v23 = (void *)v51[5];
    if (v23)
    {
      *a7 = v23;
      v24 = (const void *)v47[3];
      if (!v24)
      {
LABEL_19:
        uint64_t v25 = (void *)*((void *)v57 + 5);
        *((void *)v57 + 5) = 0LL;

        CFTypeRef v22 = v57;
LABEL_20:
        *unsigned int v15 = 0;
        id v20 = *((id *)v22 + 5);

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_21;
      }

      v47[3] = 0LL;
      CFRelease(v24);
    }

    else
    {
      *a7 = (id)v47[3];
      v47[3] = 0LL;
    }

    if (!*a7) {
      sub_10001BB24(@"Execution has encountered an unexpected state", 0x53C0000Eu);
    }
    goto LABEL_19;
  }

  int v18 = sub_10001267C("SecError");
  int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "keyForKeyclass called without error param, this is a bug",  buf,  2u);
  }

  id v20 = 0LL;
LABEL_21:

  return v20;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)keysDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setKeysDict:(id)a3
{
}

- (int)keybagNotificationToken
{
  return self->_keybagNotificationToken;
}

- (void)setKeybagNotificationToken:(int)a3
{
  self->_int keybagNotificationToken = a3;
}

- (void).cxx_destruct
{
}

+ (void)resetSharedStore
{
  if (qword_1002DED38 != -1) {
    dispatch_once(&qword_1002DED38, &stru_100291488);
  }
  dispatch_sync((dispatch_queue_t)qword_1002DED20, &stru_100291350);
}

+ (id)sharedStore
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  BOOL v9 = sub_100180EA0;
  uint64_t v10 = sub_100180EB0;
  id v11 = 0LL;
  if (qword_1002DED38 != -1) {
    dispatch_once(&qword_1002DED38, &stru_100291488);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100181B44;
  v5[3] = &unk_100291378;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_1002DED20, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)cachingEnabled
{
  return 1;
}

@end