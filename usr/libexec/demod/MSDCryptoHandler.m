@interface MSDCryptoHandler
+ (id)sharedInstance;
- (BOOL)deleteSecretKeyInKeychain;
- (BOOL)preserveAndEncryptKeychainItemsForKey:(id)a3 toFile:(id)a4;
- (BOOL)restoreAndDecryptKeychainItemsForKey:(id)a3 fromFile:(id)a4;
- (BOOL)saveSecretKeyInKeychain:(id)a3;
- (id)archiveAndEncryptKeychainItems:(id)a3;
- (id)copySecretKeyFromKeychain;
- (id)decryptAndUnarchiveKeychainItems:(id)a3;
- (id)generateRandomBytesWithFixedLength;
- (id)performCryptoWithSecretKeyOnData:(id)a3 isDecipher:(BOOL)a4;
- (void)createSecretKeyIfNeeded;
- (void)deleteSecretKey;
@end

@implementation MSDCryptoHandler

+ (id)sharedInstance
{
  if (qword_1001254E8 != -1) {
    dispatch_once(&qword_1001254E8, &stru_1000FA4C8);
  }
  return (id)qword_1001254E0;
}

- (void)createSecretKeyIfNeeded
{
  id v3 = -[MSDCryptoHandler copySecretKeyFromKeychain](self, "copySecretKeyFromKeychain");

  if (!v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[MSDCryptoHandler generateRandomBytesWithFixedLength](self, "generateRandomBytesWithFixedLength"));
    if (v4)
    {
      v5 = (os_log_s *)v4;
      unsigned __int8 v6 = -[MSDCryptoHandler saveSecretKeyInKeychain:](self, "saveSecretKeyInKeychain:", v4);
      id v7 = sub_10003A95C();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      v9 = v8;
      if ((v6 & 1) != 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Secret key for encryption is created.",  v11,  2u);
        }
      }

      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_10009B498();
      }
    }

    else
    {
      id v10 = sub_10003A95C();
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10009B46C();
      }
    }
  }

- (void)deleteSecretKey
{
  id v3 = -[MSDCryptoHandler copySecretKeyFromKeychain](self, "copySecretKeyFromKeychain");

  if (v3 && -[MSDCryptoHandler deleteSecretKeyInKeychain](self, "deleteSecretKeyInKeychain"))
  {
    id v4 = sub_10003A95C();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Secret key for encryption is deleted.",  v6,  2u);
    }
  }

- (id)performCryptoWithSecretKeyOnData:(id)a3 isDecipher:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  size_t v45 = 0LL;
  CCOperation op = v4;
  if (v4)
  {
    v8 = (char *)[v6 length] - 32;
    id v9 = v7;
    id v44 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  [v9 bytes],  32,  0));
    id v10 = objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)[v9 bytes] + 32, v8, 0));
  }

  else
  {
    id v44 = (id)objc_claimAutoreleasedReturnValue(-[MSDCryptoHandler generateRandomBytesWithFixedLength](self, "generateRandomBytesWithFixedLength"));
    id v10 = v7;
  }

  v11 = v10;
  if (!v10)
  {
    id v39 = sub_10003A95C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10009B4C4();
    }
    goto LABEL_35;
  }

  if (!v44)
  {
    id v40 = sub_10003A95C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10009B4F0();
    }
LABEL_35:
    v23 = 0LL;
    v29 = 0LL;
    id v43 = 0LL;
    goto LABEL_29;
  }

  id v43 = -[MSDCryptoHandler copySecretKeyFromKeychain](self, "copySecretKeyFromKeychain");
  if (!v43)
  {
    v23 = 0LL;
    v29 = 0LL;
    id v43 = 0LL;
    goto LABEL_30;
  }

  v41 = v7;
  v12 = -[NSMutableData initWithLength:]( [NSMutableData alloc],  "initWithLength:",  (char *)[v11 length] + 32);
  if (v12)
  {
    v13 = v12;
    while (1)
    {
      id v14 = v43;
      id v15 = [v14 bytes];
      id v16 = [v14 length];
      id v17 = v44;
      id v18 = [v17 bytes];
      v19 = v11;
      id v20 = v11;
      id v21 = [v20 bytes];
      id v22 = [v20 length];
      v23 = v13;
      CCCryptorStatus v24 = CCCrypt( op,  0,  1u,  v15,  (size_t)v16,  v18,  v21,  (size_t)v22,  -[NSMutableData mutableBytes](v23, "mutableBytes"),  -[NSMutableData length](v23, "length"),  &v45);
      if (v24 != -4301) {
        break;
      }
      id v25 = sub_10003A95C();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        size_t v47 = v45;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Output data buffer too small. Retry with larger buffer = %tu bytes.",  buf,  0xCu);
      }

      v13 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v45);
      v11 = v19;
      if (!v13) {
        goto LABEL_13;
      }
    }

    int v30 = v24;
    if (v24)
    {
      id v32 = sub_10003A95C();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      v11 = v19;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10009B548(op, v30, v28);
      }
      v29 = 0LL;
    }

    else
    {
      v11 = v19;
      if ((op & 1) != 0)
      {
        id v31 = -[NSMutableData mutableBytes](v23, "mutableBytes");
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  v31,  v45));
      }

      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](&OBJC_CLASS___NSMutableData, "dataWithData:", v17));
        id v33 = -[NSMutableData mutableBytes](v23, "mutableBytes");
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v33, v45));
        [v29 appendData:v34];
      }

      id v35 = sub_10003A95C();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v36 = "encrypted";
        if (op) {
          v36 = "decrypted";
        }
        *(_DWORD *)buf = 136446210;
        size_t v47 = (size_t)v36;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Input data is %{public}s.", buf, 0xCu);
      }
    }

    id v43 = v14;
  }

  else
  {
LABEL_13:
    id v27 = sub_10003A95C();
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10009B51C();
    }
    v23 = 0LL;
    v29 = 0LL;
  }

  id v7 = v41;
LABEL_29:

LABEL_30:
  id v37 = v29;

  return v37;
}

- (BOOL)preserveAndEncryptKeychainItemsForKey:(id)a3 toFile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getAllItemsForKey:v6 withAttributes:1]);

  if (!v9)
  {
    id v16 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009B5E0();
    }
    goto LABEL_10;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCryptoHandler archiveAndEncryptKeychainItems:](self, "archiveAndEncryptKeychainItems:", v9));
  if (!v10)
  {
    id v18 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009B640();
    }
LABEL_10:
    id v13 = 0LL;
    v11 = 0LL;
LABEL_13:

    BOOL v14 = 0;
    goto LABEL_5;
  }

  v11 = v10;
  id v20 = 0LL;
  unsigned __int8 v12 = [v10 writeToFile:v7 options:0 error:&v20];
  id v13 = v20;
  if ((v12 & 1) == 0)
  {
    id v19 = sub_10003A95C();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10009B66C();
    }
    goto LABEL_13;
  }

  BOOL v14 = 1;
LABEL_5:

  return v14;
}

- (BOOL)restoreAndDecryptKeychainItemsForKey:(id)a3 fromFile:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v34 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v6,  0LL,  &v34));
  id v8 = v34;
  if (!v7)
  {
    id v24 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009B6CC();
    }
    goto LABEL_21;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCryptoHandler decryptAndUnarchiveKeychainItems:](self, "decryptAndUnarchiveKeychainItems:", v7));
  if (!v9)
  {
    id v25 = sub_10003A95C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10009B72C();
    }
LABEL_21:
    BOOL v20 = 0;
    goto LABEL_16;
  }

  id v26 = v8;
  id v27 = v7;
  id v28 = v6;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v10 = v9;
  id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", kSecValueData, v26, v27, v28));
        id v17 = [v15 mutableCopy];
        [v17 removeObjectForKey:kSecValueData];
        id v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
        unsigned __int8 v19 = [v18 saveItem:v16 forKey:v29 withAttributes:v17];

        if ((v19 & 1) == 0)
        {
          id v21 = sub_10003A95C();
          id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_10009B758();
          }

          BOOL v20 = 0;
          goto LABEL_15;
        }
      }

      id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 1;
LABEL_15:
  id v7 = v27;
  id v6 = v28;
  id v8 = v26;
LABEL_16:

  return v20;
}

- (id)generateRandomBytesWithFixedLength
{
  v2 = (NSData *)malloc(0x20uLL);
  if (v2)
  {
    id v3 = v2;
    *(_OWORD *)&v2->super.isa = 0u;
    *(_OWORD *)&v2[2].super.isa = 0u;
    uint64_t v4 = SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, v2);
    if ((_DWORD)v4)
    {
      uint64_t v6 = v4;
      id v7 = sub_10003A95C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10009B7B8(v6, v8, v9, v10, v11, v12, v13, v14);
      }

      v2 = 0LL;
    }

    else
    {
      v2 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v3,  32LL,  1LL);
    }
  }

  return v2;
}

- (BOOL)saveSecretKeyInKeychain:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  unsigned __int8 v5 = [v4 saveItem:v3 forKey:@"com.apple.mobilestoredemo.wifi.key"];

  id v6 = sub_10003A95C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Secret key saved in keychain.", v17, 2u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10009B81C(v8, v10, v11, v12, v13, v14, v15, v16);
  }

  return v5;
}

- (id)copySecretKeyFromKeychain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 getItemForKey:@"com.apple.mobilestoredemo.wifi.key"]);

  return v3;
}

- (BOOL)deleteSecretKeyInKeychain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](&OBJC_CLASS___MSDKeychainManager, "sharedInstance"));
  unsigned __int8 v3 = [v2 deleteItemForKey:@"com.apple.mobilestoredemo.wifi.key"];

  id v4 = sub_10003A95C();
  unsigned __int8 v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Secret key deleted in keychain.", v15, 2u);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_10009B884(v6, v8, v9, v10, v11, v12, v13, v14);
  }

  return v3;
}

- (id)archiveAndEncryptKeychainItems:(id)a3
{
  id v24 = self;
  id v3 = a3;
  v38[0] = kSecAttrService;
  v38[1] = kSecAttrAccount;
  v38[2] = kSecAttrLabel;
  v38[3] = kSecValueData;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 4LL));
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        id v10 = objc_msgSend(v9, "mutableCopy", v24);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v11 = v9;
        id v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (j = 0LL; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)j);
            }

            id v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }

          while (v13);
        }

        -[NSMutableArray addObject:](v26, "addObject:", v10);
      }

      id v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }

    while (v6);
  }

  id v27 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v26,  200LL,  0LL,  &v27));
  id v18 = v27;
  if (!v17)
  {
    id v21 = sub_10003A95C();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10009B8EC();
    }
    goto LABEL_24;
  }

  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( -[MSDCryptoHandler performCryptoWithSecretKeyOnData:isDecipher:]( v24,  "performCryptoWithSecretKeyOnData:isDecipher:",  v17,  0LL));
  if (!v19)
  {
    id v23 = sub_10003A95C();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10009B94C();
    }
LABEL_24:

    unsigned __int8 v19 = 0LL;
  }

  return v19;
}

- (id)decryptAndUnarchiveKeychainItems:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](&OBJC_CLASS___MSDCryptoHandler, "sharedInstance"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 performCryptoWithSecretKeyOnData:v3 isDecipher:1]);

  if (!v5)
  {
    id v10 = sub_10003A95C();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10009B978();
    }
    goto LABEL_10;
  }

  id v13 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v13));
  uint64_t v7 = (os_log_s *)v13;
  if (!v6)
  {
    id v11 = sub_10003A95C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009B9A4();
    }

LABEL_10:
    uint64_t v8 = 0LL;
    goto LABEL_4;
  }

  uint64_t v8 = v6;

  uint64_t v7 = v8;
LABEL_4:

  return v8;
}

@end