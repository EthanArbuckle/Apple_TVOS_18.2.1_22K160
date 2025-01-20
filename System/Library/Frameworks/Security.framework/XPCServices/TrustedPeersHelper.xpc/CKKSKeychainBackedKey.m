@interface CKKSKeychainBackedKey
+ (BOOL)supportsSecureCoding;
+ (id)fetchKeyMaterialItemFromKeychain:(id)a3 resave:(BOOL *)a4 error:(id *)a5;
+ (id)key:(id)a3 wrappedByKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8 error:(id *)a9;
+ (id)keyWrappedBySelf:(id)a3 uuid:(id)a4 keyclass:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)loadFromProtobuf:(id)a3 error:(id *)a4;
+ (id)queryKeyMaterialInKeychain:(id)a3 error:(id *)a4;
+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4;
+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5;
+ (id)randomKeyWrappedBySelf:(id)a3 error:(id *)a4;
+ (id)setKeyMaterialInKeychain:(id)a3 error:(id *)a4;
- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadKeyMaterialFromKeychain:(id *)a3;
- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4;
- (BOOL)saveKeyMaterialToKeychain:(id *)a3;
- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4;
- (BOOL)unwrapSelfWithAESKey:(id)a3 error:(id *)a4;
- (BOOL)wrapUnder:(id)a3 error:(id *)a4;
- (BOOL)wrapsSelf;
- (CKKSAESSIVKey)aessivkey;
- (CKKSKeychainBackedKey)initWithAESKey:(id)a3 wrappedAESKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8;
- (CKKSKeychainBackedKey)initWithCoder:(id)a3;
- (CKKSKeychainBackedKey)initWithWrappedAESKey:(id)a3 uuid:(id)a4 parentKeyUUID:(id)a5 keyclass:(id)a6 zoneID:(id)a7;
- (CKKSWrappedAESSIVKey)wrappedkey;
- (CKRecordZoneID)zoneID;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (SecCKKSKeyClass)keyclass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)description;
- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)ensureKeyLoadedFromKeychain:(id *)a3;
- (id)serializeAsProtobuf:(id *)a3;
- (id)unwrapAESKey:(id)a3 error:(id *)a4;
- (id)wrapAESKey:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAessivkey:(id)a3;
- (void)setKeyclass:(id)a3;
- (void)setParentKeyUUID:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappedkey:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSKeychainBackedKey

- (CKKSKeychainBackedKey)initWithWrappedAESKey:(id)a3 uuid:(id)a4 parentKeyUUID:(id)a5 keyclass:(id)a6 zoneID:(id)a7
{
  return -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:]( self,  "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:",  0LL,  a3,  a4,  a5,  a6,  a7);
}

- (CKKSKeychainBackedKey)initWithAESKey:(id)a3 wrappedAESKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CKKSKeychainBackedKey;
  v18 = -[CKKSKeychainBackedKey init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v19->_parentKeyUUID, a6);
    objc_storeStrong((id *)&v19->_zoneID, a8);
    objc_storeStrong((id *)&v19->_wrappedkey, a4);
    objc_storeStrong((id *)&v19->_keyclass, a7);
    objc_storeStrong((id *)&v19->_aessivkey, a3);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CKKSKeychainBackedKey allocWithZone:](&OBJC_CLASS___CKKSKeychainBackedKey, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  id v6 = [v5 copy];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  v12 = -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:]( v4,  "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:",  v6,  v7,  v8,  v9,  v10,  v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKKSKeychainBackedKey);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    if ([v7 isEqual:v8])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 parentKeyUUID]);
      if ([v9 isEqual:v10])
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
        if ([v11 isEqual:v12])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
          v19 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappedkey]);
          if (objc_msgSend(v13, "isEqual:"))
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
            v18 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue([v6 keyclass]);
            unsigned __int8 v15 = [v17 isEqual:v14];

            v13 = v18;
          }

          else
          {
            unsigned __int8 v15 = 0;
          }
        }

        else
        {
          unsigned __int8 v15 = 0;
        }
      }

      else
      {
        unsigned __int8 v15 = 0;
      }
    }

    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  else
  {
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (BOOL)wrapsSelf
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  unsigned __int8 v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)wrapUnder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  id v14 = 0LL;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 wrapAESKey:v7 error:&v14]);
  id v9 = v14;

  if (v8)
  {
    -[CKKSKeychainBackedKey setWrappedkey:](self, "setWrappedkey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    -[CKKSKeychainBackedKey setParentKeyUUID:](self, "setParentKeyUUID:", v10);
  }

  else
  {
    id v11 = sub_1001CF4C0(@"ckkskey", 0LL);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "couldn't wrap key: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v8 != 0LL;
}

- (BOOL)unwrapSelfWithAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
  v8 = (CKKSAESSIVKey *)objc_claimAutoreleasedReturnValue([v6 unwrapAESKey:v7 error:a4]);

  aessivkey = self->_aessivkey;
  self->_aessivkey = v8;

  return self->_aessivkey != 0LL;
}

- (id)ensureKeyLoadedFromKeychain:(id *)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));

  if (v5 || -[CKKSKeychainBackedKey loadKeyMaterialFromKeychain:](self, "loadKeyMaterialFromKeychain:", a3)) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  }
  else {
    id v6 = 0LL;
  }
  return v6;
}

- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[CKKSKeychainBackedKey wrapsSelf](self, "wrapsSelf"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 unwrapAESKey:v7 error:a4]);

    if (v8 && [v8 isEqual:v6])
    {
      objc_storeStrong((id *)&self->_aessivkey, v8);
      BOOL v9 = 1;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    if (a4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not self-wrapped",  self,  NSLocalizedDescriptionKey));
      id v14 = v10;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  18LL,  v11));
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 wrapAESKey:v6 error:a4]);

  return v8;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 unwrapAESKey:v6 error:a4]);

  return v8;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a5));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 encryptData:v9 authenticatedData:v8 error:a5]);

  return v11;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a5));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 decryptData:v9 authenticatedData:v8 error:a5]);

  return v11;
}

- (BOOL)saveKeyMaterialToKeychain:(id *)a3
{
  return -[CKKSKeychainBackedKey saveKeyMaterialToKeychain:error:](self, "saveKeyMaterialToKeychain:error:", 1LL, a3);
}

- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a4));

  if (!v7) {
    return 0;
  }
  BOOL v44 = v5;
  id v8 = objc_alloc(&OBJC_CLASS___NSData);
  id v9 = (char *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  id v11 = -[NSData initWithBytes:length:](v8, "initWithBytes:length:", v9 + 8, v10[11]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSData base64EncodedDataWithOptions:](v11, "base64EncodedDataWithOptions:", 0LL));

  v52[0] = kSecClass;
  v52[1] = kSecAttrAccessible;
  v53[0] = kSecClassInternetPassword;
  v53[1] = kSecAttrAccessibleWhenUnlocked;
  v52[2] = kSecUseDataProtectionKeychain;
  v52[3] = kSecAttrAccessGroup;
  v53[2] = &__kCFBooleanTrue;
  v53[3] = @"com.apple.security.ckks";
  v52[4] = kSecAttrDescription;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v53[4] = v13;
  v52[5] = kSecAttrServer;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
  v53[5] = v15;
  v52[6] = kSecAttrAccount;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v53[6] = v16;
  v52[7] = kSecAttrPath;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  v53[7] = v17;
  v53[8] = &__kCFBooleanTrue;
  v52[8] = kSecAttrIsInvisible;
  v52[9] = kSecValueData;
  v45 = (void *)v12;
  v53[9] = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  10LL));
  id v19 = [v18 mutableCopy];

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  LODWORD(v18) = [v20 isEqualToString:@"tlk"];

  if ((_DWORD)v18)
  {
    [v19 setObject:kSecAttrViewHintPCSMasterKey forKeyedSubscript:kSecAttrSyncViewHint];
    [v19 setObject:kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  unsigned int v22 = [v21 isEqualToString:@"classC"];

  if (v22) {
    CFStringRef v23 = kSecAttrAccessibleAfterFirstUnlock;
  }
  else {
    CFStringRef v23 = kSecAttrAccessibleWhenUnlocked;
  }
  [v19 setObject:v23 forKeyedSubscript:kSecAttrAccessible];
  id v47 = 0LL;
  id v24 =  +[CKKSKeychainBackedKey setKeyMaterialInKeychain:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "setKeyMaterialInKeychain:error:",  v19,  &v47);
  id v25 = v47;
  v26 = v25;
  if (a4 && v25)
  {
    id v27 = [v25 code];
    v50[0] = NSLocalizedDescriptionKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Couldn't save %@ to keychain: %d",  self,  [v26 code]));
    v50[1] = NSUnderlyingErrorKey;
    v51[0] = v28;
    v51[1] = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v51,  v50,  2LL));
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  v27,  v29));
  }

  if (v44)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
    unsigned int v31 = [v30 isEqualToString:@"tlk"];

    if (v31)
    {
      v48[0] = kSecClass;
      v48[1] = kSecAttrAccessible;
      v49[0] = kSecClassInternetPassword;
      v49[1] = kSecAttrAccessibleWhenUnlocked;
      v48[2] = kSecUseDataProtectionKeychain;
      v48[3] = kSecAttrAccessGroup;
      v49[2] = &__kCFBooleanTrue;
      v49[3] = @"com.apple.security.ckks";
      v48[4] = kSecAttrDescription;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 stringByAppendingString:@"-nonsync"]);
      v49[4] = v33;
      v48[5] = kSecAttrServer;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneName]);
      v49[5] = v35;
      v48[6] = kSecAttrAccount;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
      v49[6] = v36;
      v48[7] = kSecAttrPath;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
      v49[7] = v37;
      v49[8] = &__kCFBooleanTrue;
      v48[8] = kSecAttrIsInvisible;
      v48[9] = kSecValueData;
      v49[9] = v45;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  10LL));
      id v39 = [v38 mutableCopy];

      [v39 setObject:kCFBooleanFalse forKeyedSubscript:kSecAttrSynchronizable];
      id v46 = v26;
      id v40 =  +[CKKSKeychainBackedKey setKeyMaterialInKeychain:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "setKeyMaterialInKeychain:error:",  v39,  &v46);
      id v41 = v46;

      id v19 = v39;
      v26 = v41;
    }
  }

  BOOL v42 = v26 == 0LL;

  return v42;
}

- (BOOL)loadKeyMaterialFromKeychain:(id *)a3
{
  char v24 = 0;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey fetchKeyMaterialItemFromKeychain:resave:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "fetchKeyMaterialItemFromKeychain:resave:error:",  self,  &v24,  a3));
  id v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kSecValueData]);
    id v8 = -[NSMutableData initWithBase64EncodedData:options:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBase64EncodedData:options:",  v7,  0LL);
    if (v8)
    {
      id v9 = objc_alloc(&OBJC_CLASS___CKKSAESSIVKey);
      v10 = v8;
      id v11 = -[CKKSAESSIVKey initWithBytes:len:]( v9,  "initWithBytes:len:",  -[NSMutableData bytes](v10, "bytes"),  -[NSMutableData length](v10, "length"));
      uint64_t v12 = v10;
      memset_s( -[NSMutableData mutableBytes](v12, "mutableBytes"),  -[NSMutableData length](v12, "length"),  0,  -[NSMutableData length](v12, "length"));
      -[CKKSKeychainBackedKey setAessivkey:](self, "setAessivkey:", v11);
      if (v24)
      {
        id v13 = sub_1001CF4C0(@"ckkskey", 0LL);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resaving %@ as per request", buf, 0xCu);
        }

        id v23 = 0LL;
        -[CKKSKeychainBackedKey saveKeyMaterialToKeychain:](self, "saveKeyMaterialToKeychain:", &v23);
        id v15 = v23;
        if (v15)
        {
          id v16 = sub_1001CF4C0(@"ckkskey", 0LL);
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = self;
            __int16 v27 = 2112;
            id v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Resaving %@ failed: %@", buf, 0x16u);
          }
        }
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
      BOOL v19 = v18 != 0LL;
    }

    else
    {
      id v20 = sub_1001CF4C0(@"ckkskey", 0LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to unbase64 key: %@", buf, 0xCu);
      }

      if (!a3)
      {
        BOOL v19 = 0;
        goto LABEL_18;
      }

      id v11 = (CKKSAESSIVKey *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unable to unbase64 key: %@",  self));
      BOOL v19 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  36LL,  v11));
    }

LABEL_18:
    goto LABEL_19;
  }

  BOOL v19 = 0;
LABEL_19:

  return v19;
}

- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3
{
  v19[0] = kSecClass;
  v19[1] = kSecUseDataProtectionKeychain;
  v20[0] = kSecClassInternetPassword;
  v20[1] = &__kCFBooleanTrue;
  v20[2] = @"com.apple.security.ckks";
  v19[2] = kSecAttrAccessGroup;
  v19[3] = kSecAttrDescription;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v20[3] = v5;
  v19[4] = kSecAttrAccount;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v20[4] = v6;
  v19[5] = kSecAttrServer;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  v19[6] = kSecReturnData;
  v20[5] = v8;
  v20[6] = &__kCFBooleanTrue;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  7LL));
  id v10 = [v9 mutableCopy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  LODWORD(v6) = [v11 isEqualToString:@"tlk"];

  if ((_DWORD)v6) {
    [v10 setObject:kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  }
  uint64_t v12 = SecItemDelete((CFDictionaryRef)v10);
  int v13 = v12;
  if (a3 && (_DWORD)v12)
  {
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Couldn't delete %@ from keychain: %d",  self,  v12));
    v18 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  v13,  v15));
  }

  return v13 == 0;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@(%@): %@ (%@)>",  v5,  v7,  v8,  v9));

  return v10;
}

- (id)serializeAsProtobuf:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a3));

  if (v4)
  {
    BOOL v5 = objc_alloc_init(&OBJC_CLASS___CKKSSerializedKey);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
    -[CKKSSerializedKey setUuid:](v5, "setUuid:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    -[CKKSSerializedKey setZoneName:](v5, "setZoneName:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
    -[CKKSSerializedKey setKeyclass:](v5, "setKeyclass:", v9);

    id v10 = objc_alloc(&OBJC_CLASS___NSData);
    id v11 = (char *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
    int v13 = -[NSData initWithBytes:length:](v10, "initWithBytes:length:", v11 + 8, v12[11]);
    -[CKKSSerializedKey setKey:](v5, "setKey:", v13);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey data](v5, "data"));
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  [v4 encodeObject:v5 forKey:@"uuid"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  [v4 encodeObject:v6 forKey:@"parentKeyUUID"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  [v4 encodeObject:v7 forKey:@"keyclass"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  [v4 encodeObject:v8 forKey:@"zoneID"];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
  [v4 encodeObject:v9 forKey:@"wrappedkey"];
}

- (CKKSKeychainBackedKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CKKSKeychainBackedKey;
  BOOL v5 = -[CKKSKeychainBackedKey init](&v22, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"uuid"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"parentKeyUUID"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    parentKeyUUID = v5->_parentKeyUUID;
    v5->_parentKeyUUID = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"keyclass"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    keyclass = v5->_keyclass;
    v5->_keyclass = (SecCKKSKeyClass *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(CKRecordZoneID) forKey:@"zoneID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(CKKSWrappedAESSIVKey) forKey:@"wrappedkey"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    wrappedkey = v5->_wrappedkey;
    v5->_wrappedkey = (CKKSWrappedAESSIVKey *)v19;
  }

  return v5;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setParentKeyUUID:(id)a3
{
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setKeyclass:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (CKKSWrappedAESSIVKey)wrappedkey
{
  return (CKKSWrappedAESSIVKey *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setWrappedkey:(id)a3
{
}

- (CKKSAESSIVKey)aessivkey
{
  return (CKKSAESSIVKey *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAessivkey:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyclass]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 randomKeyWrappedByParent:v6 keyclass:v7 error:a4]);

  return v8;
}

+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAESSIVKey randomKey:](&OBJC_CLASS___CKKSAESSIVKey, "randomKey:", a5));
  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 wrapAESKey:v9 error:a5]);
    if (v10)
    {
      id v11 = objc_alloc(&OBJC_CLASS___CKKSKeychainBackedKey);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      uint64_t v16 = -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:]( v11,  "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:",  v9,  v10,  v13,  v14,  v8,  v15);
    }

    else
    {
      uint64_t v16 = 0LL;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  return v16;
}

+ (id)randomKeyWrappedBySelf:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAESSIVKey randomKey:](&OBJC_CLASS___CKKSAESSIVKey, "randomKey:", a4));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([a1 keyWrappedBySelf:v7 uuid:v9 keyclass:@"tlk" zoneID:v6 error:a4]);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

+ (id)keyWrappedBySelf:(id)a3 uuid:(id)a4 keyclass:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  return [a1 key:a3 wrappedByKey:a3 uuid:a4 parentKeyUUID:a4 keyclass:a5 zoneID:a6 error:a7];
}

+ (id)key:(id)a3 wrappedByKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v25 = 0LL;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([a4 wrapAESKey:v14 error:&v25]);
  id v20 = v25;
  if (v19)
  {
    id v21 = -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:]( objc_alloc(&OBJC_CLASS___CKKSKeychainBackedKey),  "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:",  v14,  v19,  v15,  v16,  v17,  v18);
  }

  else
  {
    id v22 = sub_1001CF4C0(@"ckkskey", 0LL);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "couldn't wrap key: %@", buf, 0xCu);
    }

    id v21 = 0LL;
    if (a9) {
      *a9 = v20;
    }
  }

  return v21;
}

+ (id)setKeyMaterialInKeychain:(id)a3 error:(id *)a4
{
  BOOL v5 = (const __CFDictionary *)a3;
  CFTypeRef result = 0LL;
  uint64_t v6 = SecItemAdd(v5, &result);
  if ((_DWORD)v6 == -25299)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecClass));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, kSecClass);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrSynchronizable));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, kSecAttrSynchronizable);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrSyncViewHint));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, kSecAttrSyncViewHint);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrAccessGroup));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v11, kSecAttrAccessGroup);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrAccount));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, kSecAttrAccount);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrServer));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, kSecAttrServer);

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrPath));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, kSecAttrPath);

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  kSecUseDataProtectionKeychain));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v15,  kSecUseDataProtectionKeychain);

    id v16 = -[__CFDictionary mutableCopy](v5, "mutableCopy");
    [v16 setObject:0 forKeyedSubscript:kSecClass];
    uint64_t v17 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)v16);
    if ((_DWORD)v17)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemUpdate: %d",  v17));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"securityd",  (int)v17,  v18));
    }

    else
    {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    LODWORD(v17) = v6;
    uint64_t v20 = (int)v6;
    id v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemAdd: %d",  v6));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"securityd",  v20,  v7));
  }

  id v21 = (void *)result;
  if ((_DWORD)v17)
  {
    if (result)
    {
      CFTypeRef result = 0LL;
      CFRelease(v21);
    }

    id v21 = 0LL;
    if (a4) {
      *a4 = v19;
    }
  }

  return v21;
}

+ (id)queryKeyMaterialInKeychain:(id)a3 error:(id *)a4
{
  CFTypeRef result = 0LL;
  uint64_t v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  uint64_t v6 = (void *)result;
  if ((_DWORD)v5)
  {
    if (result)
    {
      CFTypeRef result = 0LL;
      CFRelease(v6);
    }

    if (a4)
    {
      uint64_t v7 = (int)v5;
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemCopyMatching: %d",  v5));
      uint64_t v13 = v8;
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"securityd",  v7,  v9));
    }

    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (id)fetchKeyMaterialItemFromKeychain:(id)a3 resave:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  v80[0] = kSecClass;
  v80[1] = kSecUseDataProtectionKeychain;
  v81[0] = kSecClassInternetPassword;
  v81[1] = &__kCFBooleanTrue;
  v81[2] = @"com.apple.security.ckks";
  v80[2] = kSecAttrAccessGroup;
  v80[3] = kSecAttrDescription;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 keyclass]);
  v81[3] = v8;
  v80[4] = kSecAttrAccount;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  v81[4] = v9;
  v80[5] = kSecAttrServer;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  v81[5] = v11;
  v80[6] = kSecAttrPath;
  NSErrorUserInfoKey v12 = (void *)objc_claimAutoreleasedReturnValue([v7 parentKeyUUID]);
  v81[6] = v12;
  v81[7] = &__kCFBooleanTrue;
  v80[7] = kSecReturnAttributes;
  v80[8] = kSecReturnData;
  v81[8] = &__kCFBooleanTrue;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  9LL));
  id v14 = [v13 mutableCopy];

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 keyclass]);
  LODWORD(v10) = [v15 isEqualToString:@"tlk"];

  if ((_DWORD)v10) {
    [v14 setObject:kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  }
  id v67 = 0LL;
  id v16 = a1;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([a1 queryKeyMaterialInKeychain:v14 error:&v67]);
  id v18 = v67;
  uint64_t v19 = v18;
  if (v17)
  {
    uint64_t v20 = v17;
    id v21 = v20;
    id v22 = v14;
    id v23 = v19;
LABEL_5:
    char v24 = v20;
    goto LABEL_6;
  }

  if (!v18 || [v18 code] == (id)-25300)
  {
    v61 = a5;

    v26 = (void *)objc_claimAutoreleasedReturnValue([v7 keyclass]);
    unsigned int v27 = [v26 isEqualToString:@"tlk"];

    if (v27)
    {
      v76[0] = kSecClass;
      v76[1] = kSecUseDataProtectionKeychain;
      v77[0] = kSecClassInternetPassword;
      v77[1] = &__kCFBooleanTrue;
      v77[2] = @"com.apple.security.ckks";
      v76[2] = kSecAttrAccessGroup;
      v76[3] = kSecAttrDescription;
      v60 = (void *)objc_claimAutoreleasedReturnValue([v7 keyclass]);
      v59 = (void *)objc_claimAutoreleasedReturnValue([v60 stringByAppendingString:@"-piggy"]);
      v77[3] = v59;
      v77[4] = kSecAttrSynchronizableAny;
      v76[4] = kSecAttrSynchronizable;
      v76[5] = kSecAttrAccount;
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-piggy", v28));
      v77[5] = v29;
      v76[6] = kSecAttrServer;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 zoneName]);
      v77[6] = v31;
      v77[7] = &__kCFBooleanTrue;
      v76[7] = kSecReturnAttributes;
      v76[8] = kSecReturnData;
      v76[9] = kSecMatchLimit;
      v77[8] = &__kCFBooleanTrue;
      v77[9] = kSecMatchLimitOne;
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v77,  v76,  10LL));
      id v22 = [v32 mutableCopy];

      id v16 = a1;
      id v66 = 0LL;
      char v24 = (id *)objc_claimAutoreleasedReturnValue([a1 queryKeyMaterialInKeychain:v22 error:&v66]);
      id v33 = v66;
      if (!v33)
      {
        id v47 = sub_1001CF4C0(@"ckkskey", 0LL);
        v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
          *(_DWORD *)buf = 138412290;
          v75 = v49;
          v50 = "loaded a piggy TLK (%@)";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
        }

+ (id)loadFromProtobuf:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = -[CKKSSerializedKey initWithData:](objc_alloc(&OBJC_CLASS___CKKSSerializedKey), "initWithData:", v5);

  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v6, "uuid"));
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  uint64_t v9 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v6, "zoneName"));
  if (!v9)
  {
LABEL_8:

    goto LABEL_9;
  }

  uint64_t v10 = (void *)v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v6, "keyclass"));
  if (!v11)
  {

    goto LABEL_8;
  }

  NSErrorUserInfoKey v12 = (void *)v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v6, "key"));

  if (v13)
  {
    id v14 = objc_alloc(&OBJC_CLASS___CKKSAESSIVKey);
    id v15 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v6, "key"));
    id v16 = [v15 bytes];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v6, "key"));
    id v18 = -[CKKSAESSIVKey initWithBytes:len:](v14, "initWithBytes:len:", v16, [v17 length]);

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v6, "uuid"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v6, "keyclass"));
    id v21 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v6, "zoneName"));
    id v23 = -[CKRecordZoneID initWithZoneName:ownerName:]( v21,  "initWithZoneName:ownerName:",  v22,  CKCurrentUserDefaultName);
    char v24 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey keyWrappedBySelf:uuid:keyclass:zoneID:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "keyWrappedBySelf:uuid:keyclass:zoneID:error:",  v18,  v19,  v20,  v23,  a4));

    goto LABEL_11;
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end