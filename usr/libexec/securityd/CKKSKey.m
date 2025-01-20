@interface CKKSKey
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)allKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsByClassWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)currentKeysForClass:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7;
+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)isItemKeyForKeychainView:(SecDbItem *)a3;
+ (id)loadFromProtobuf:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)loadKeyWithUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)localKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4;
+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5;
+ (id)randomKeyWrappedBySelf:(id)a3 contextID:(id)a4 error:(id *)a5;
+ (id)remoteKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)selfWrappedKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5;
+ (id)sqlColumns;
+ (id)sqlTable;
+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
+ (id)tryFromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (BOOL)currentkey;
- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadKeyMaterialFromKeychain:(id *)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4;
- (BOOL)saveKeyMaterialToKeychain:(id *)a3;
- (BOOL)saveToDatabaseAsOnlyCurrentKeyForClassAndState:(id *)a3;
- (BOOL)tlkMaterialPresentOrRecoverableViaTLKShareForContextID:(id)a3 forTrustStates:(id)a4 error:(id *)a5;
- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4;
- (BOOL)unwrapViaTLKSharesTrustedBy:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)validTLK:(id *)a3;
- (BOOL)wrapUnder:(id)a3 error:(id *)a4;
- (BOOL)wrapsSelf;
- (CKKSKey)init;
- (CKKSKey)initWithKeyCore:(id)a3 contextID:(id)a4 state:(id)a5 currentkey:(BOOL)a6;
- (CKKSKey)initWithWrappedKeyData:(id)a3 contextID:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 state:(id)a8 zoneID:(id)a9 encodedCKRecord:(id)a10 currentkey:(int64_t)a11;
- (CKKSKeychainBackedKey)keycore;
- (NSData)wrappedKeyData;
- (NSData)wrappedKeyDataBackingStore;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (NSString)zoneName;
- (SecCKKSKeyClass)keyclass;
- (SecCKKSProcessedState)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)description;
- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5;
- (id)ensureKeyLoadedForContextID:(id)a3 cache:(id)a4 error:(id *)a5;
- (id)getKeychainBackedKey:(id *)a3;
- (id)initSelfWrappedWithAESKey:(id)a3 contextID:(id)a4 uuid:(id)a5 keyclass:(id)a6 state:(id)a7 zoneID:(id)a8 encodedCKRecord:(id)a9 currentkey:(int64_t)a10;
- (id)serializeAsProtobuf:(id *)a3;
- (id)sqlValues;
- (id)topKeyInAnyState:(id *)a3;
- (id)unwrapAESKey:(id)a3 error:(id *)a4;
- (id)unwrapViaKeyHierarchy:(id *)a3;
- (id)unwrapViaKeyHierarchy:(id)a3 error:(id *)a4;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (id)wrapAESKey:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setCurrentkey:(BOOL)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setKeyclass:(id)a3;
- (void)setKeycore:(id)a3;
- (void)setParentKeyUUID:(id)a3;
- (void)setState:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappedKeyDataBackingStore:(id)a3;
@end

@implementation CKKSKey

- (CKKSKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSKey;
  return -[CKKSKey init](&v3, "init");
}

- (id)initSelfWrappedWithAESKey:(id)a3 contextID:(id)a4 uuid:(id)a5 keyclass:(id)a6 state:(id)a7 zoneID:(id)a8 encodedCKRecord:(id)a9 currentkey:(int64_t)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id obj = a7;
  id v32 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___CKKSKey;
  v20 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v34,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"synckey",  a9,  a4,  v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v21->_parentKeyUUID, a5);
    objc_storeStrong((id *)&v21->_keyclass, a6);
    id v33 = 0LL;
    uint64_t v22 = objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey keyWrappedBySelf:uuid:keyclass:zoneID:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "keyWrappedBySelf:uuid:keyclass:zoneID:error:",  v16,  v17,  v18,  v19,  &v33));
    id v23 = v33;
    keycore = v21->_keycore;
    v21->_keycore = (CKKSKeychainBackedKey *)v22;

    v25 = v21->_keycore;
    if (!v25)
    {

      v29 = 0LL;
      goto LABEL_6;
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](v25, "wrappedkey"));
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 wrappedData]);
    wrappedKeyDataBackingStore = v21->_wrappedKeyDataBackingStore;
    v21->_wrappedKeyDataBackingStore = (NSData *)v27;

    v21->_currentkey = a10 != 0;
    objc_storeStrong((id *)&v21->_state, obj);
  }

  v29 = v21;
LABEL_6:

  return v29;
}

- (CKKSKey)initWithWrappedKeyData:(id)a3 contextID:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 state:(id)a8 zoneID:(id)a9 encodedCKRecord:(id)a10 currentkey:(int64_t)a11
{
  id v25 = a3;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CKKSKey;
  id v19 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v26,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"synckey",  a10,  a4,  a9);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_wrappedKeyDataBackingStore, a3);
    objc_storeStrong((id *)&v20->_uuid, a5);
    objc_storeStrong((id *)&v20->_parentKeyUUID, a6);
    objc_storeStrong((id *)&v20->_keyclass, a7);
    v20->_currentkey = a11 != 0;
    objc_storeStrong((id *)&v20->_state, a8);
  }

  return v20;
}

- (CKKSKey)initWithKeyCore:(id)a3 contextID:(id)a4 state:(id)a5 currentkey:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CKKSKey;
  v15 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v26,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"synckey",  0LL,  v13,  v14);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_keycore, a3);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](v15->_keycore, "wrappedkey"));
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 wrappedData]);
    wrappedKeyDataBackingStore = v15->_wrappedKeyDataBackingStore;
    v15->_wrappedKeyDataBackingStore = (NSData *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue([v11 uuid]);
    uuid = v15->_uuid;
    v15->_uuid = (NSString *)v19;

    uint64_t v21 = objc_claimAutoreleasedReturnValue([v11 parentKeyUUID]);
    parentKeyUUID = v15->_parentKeyUUID;
    v15->_parentKeyUUID = (NSString *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue([v11 keyclass]);
    keyclass = v15->_keyclass;
    v15->_keyclass = (SecCKKSKeyClass *)v23;

    v15->_currentkey = a6;
    objc_storeStrong((id *)&v15->_state, a5);
  }

  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CKKSKey;
  -[CKKSKey dealloc](&v2, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKKSKey);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    if ([v7 isEqualToString:v8])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 parentKeyUUID]);
      if ([v9 isEqualToString:v10])
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 wrappedKeyData]);
        if ([v11 isEqualToData:v12])
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
          if (objc_msgSend(v13, "isEqual:"))
          {
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
            id v18 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue([v6 keyclass]);
            unsigned __int8 v15 = [v17 isEqual:v14];

            id v13 = v18;
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

- (id)getKeychainBackedKey:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
    id v8 = [v7 length];

    if (v8 == (id)80)
    {
      v9 = objc_alloc(&OBJC_CLASS___CKKSWrappedAESSIVKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
      id v11 = -[CKKSWrappedAESSIVKey initWithData:](v9, "initWithData:", v10);

      id v12 = objc_alloc(&OBJC_CLASS___CKKSKeychainBackedKey);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
      uint64_t v17 = -[CKKSKeychainBackedKey initWithWrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:]( v12,  "initWithWrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:",  v11,  v13,  v14,  v15,  v16);
      -[CKKSKey setKeycore:](self, "setKeycore:", v17);

      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    }

    else
    {
      id v6 = 0LL;
      if (a3) {
        *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -50LL,  @"Wrong key size"));
      }
    }
  }

  return v6;
}

- (NSData)wrappedKeyData
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));

  if (!v3) {
    return (NSData *)(id)objc_claimAutoreleasedReturnValue( -[CKKSKey wrappedKeyDataBackingStore]( self,  "wrappedKeyDataBackingStore"));
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 wrappedkey]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 wrappedData]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyDataBackingStore](self, "wrappedKeyDataBackingStore"));
  unsigned __int8 v8 = [v6 isEqualToData:v7];

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    id v11 = sub_1000AA6AC(@"ckkskey", v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Probable bug: wrapped key data does not match cached version",  v20,  2u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 wrappedkey]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 wrappedData]);
    -[CKKSKey setWrappedKeyDataBackingStore:](self, "setWrappedKeyDataBackingStore:", v15);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 wrappedkey]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 wrappedData]);

  return (NSData *)v18;
}

- (NSString)zoneName
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 zoneName]);

  return (NSString *)v3;
}

- (BOOL)wrapsSelf
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  unsigned __int8 v5 = [v3 isEqual:v4];

  return v5;
}

- (BOOL)wrapUnder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7
    && (unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore")),
        v9 = (void *)objc_claimAutoreleasedReturnValue([v6 keycore]),
        unsigned int v10 = [v8 wrapUnder:v9 error:a4],
        v9,
        v8,
        v10))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 parentKeyUUID]);
    -[CKKSKey setParentKeyUUID:](self, "setParentKeyUUID:", v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 wrappedkey]);
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 wrappedData]);
    -[CKKSKey setWrappedKeyDataBackingStore:](self, "setWrappedKeyDataBackingStore:", v15);

    BOOL v16 = 1;
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)topKeyInAnyState:(id *)a3
{
  unsigned __int8 v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v6 = self;
  if (!v6) {
    goto LABEL_11;
  }
  do
  {
    if (-[CKKSKey wrapsSelf](v6, "wrapsSelf"))
    {
      id v6 = v6;
      id v12 = v6;
      goto LABEL_12;
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v6, "uuid"));
    unsigned int v8 = -[NSMutableSet containsObject:](v5, "containsObject:", v7);

    if (v8) {
      break;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v6, "uuid"));
    -[NSMutableSet addObject:](v5, "addObject:", v9);

    v18[0] = @"UUID";
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](v6, "parentKeyUUID"));
    v18[1] = @"state";
    v19[0] = v10;
    v19[1] = @"remote";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
    id v12 = (CKKSKey *)objc_claimAutoreleasedReturnValue( +[CKKSSQLDatabaseObject tryFromDatabaseWhere:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabaseWhere:error:",  v11,  a3));

    if (!v12)
    {
      BOOL v16 = @"UUID";
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](v6, "parentKeyUUID"));
      uint64_t v17 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      id v12 = (CKKSKey *)objc_claimAutoreleasedReturnValue( +[CKKSSQLDatabaseObject fromDatabaseWhere:error:]( &OBJC_CLASS___CKKSKey,  "fromDatabaseWhere:error:",  v14,  a3));
    }

    id v6 = v12;
  }

  while (v12);
  if (a3)
  {
    id v12 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  54LL,  @"Circular reference in key hierarchy"));
  }

  else
  {
LABEL_11:
    id v12 = 0LL;
  }

- (id)ensureKeyLoadedForContextID:(id)a3 cache:(id)a4 error:(id *)a5
{
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    id v26 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ensureKeyLoadedFromKeychain:&v26]);
    id v11 = v26;

    if (v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    }

    else
    {
      id v25 = 0LL;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey unwrapViaKeyHierarchy:error:](self, "unwrapViaKeyHierarchy:error:", v7, &v25));
      id v14 = v25;

      if (v13)
      {
        id v24 = 0LL;
        unsigned int v15 = -[CKKSKey saveKeyMaterialToKeychain:](self, "saveKeyMaterialToKeychain:", &v24);
        id v16 = v24;
        uint64_t v17 = v16;
        if (!v15 || v16)
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneName]);
          id v20 = sub_1000AA6AC(@"ckkskey", v19);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Resaving missing key failed, continuing: %@",  buf,  0xCu);
          }
        }

        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
      }

      else if (a5)
      {
        if (v14) {
          id v22 = v14;
        }
        else {
          id v22 = v11;
        }
        id v12 = 0LL;
        *a5 = v22;
      }

      else
      {
        id v12 = 0LL;
      }
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)unwrapViaKeyHierarchy:(id *)a3
{
  return -[CKKSKey unwrapViaKeyHierarchy:error:](self, "unwrapViaKeyHierarchy:error:", 0LL, a3);
}

- (id)unwrapViaKeyHierarchy:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 aessivkey]);

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    id v11 = v10;
    if (v9)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 aessivkey]);
    }

    else
    {
      id v41 = 0LL;
      unsigned int v13 = [v10 loadKeyMaterialFromKeychain:&v41];
      id v14 = v41;

      if (v13)
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v15 aessivkey]);
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
        unsigned int v17 = [v16 isEqual:@"tlk"];

        if (!v17) {
          goto LABEL_12;
        }
        uint64_t v18 = objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
        if (!v18
          || (uint64_t v19 = (void *)v18,
              id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID")),
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid")),
              unsigned int v22 = [v20 isEqualToString:v21],
              v21,
              v20,
              v19,
              v22))
        {
          id v12 = 0LL;
          if (a4) {
            *a4 = v14;
          }
        }

        else
        {
LABEL_12:
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
          if (v6)
          {
            uint64_t v40 = 0LL;
            id v26 = (id *)&v40;
            uint64_t v27 = objc_claimAutoreleasedReturnValue([v6 loadKeyForUUID:v23 contextID:v24 zoneID:v25 error:&v40]);
          }

          else
          {
            uint64_t v39 = 0LL;
            id v26 = (id *)&v39;
            uint64_t v27 = objc_claimAutoreleasedReturnValue( +[CKKSKey fromDatabaseAnyState:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "fromDatabaseAnyState:contextID:zoneID:error:",  v23,  v24,  v25,  &v39));
          }

          v28 = (void *)v27;
          id v29 = *v26;

          if (v29 || !v28)
          {
            id v30 = sub_1000AA6AC(@"ckks", 0LL);
            v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Errored fetching parent key: %@",  buf,  0xCu);
            }

            if (a4) {
              *a4 = v29;
            }
          }

          id v32 = (void *)objc_claimAutoreleasedReturnValue([v28 unwrapViaKeyHierarchy:v6 error:a4]);

          if (v32)
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
            objc_super v34 = (void *)objc_claimAutoreleasedReturnValue([v33 wrappedkey]);
            v35 = (void *)objc_claimAutoreleasedReturnValue([v28 unwrapAESKey:v34 error:a4]);
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
            [v36 setAessivkey:v35];

            v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v37 aessivkey]);
          }

          else
          {
            id v12 = 0LL;
          }
        }
      }
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)unwrapViaTLKSharesTrustedBy:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    id v44 = 0LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[CKKSTLKShareRecord allForUUID:contextID:zoneID:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "allForUUID:contextID:zoneID:error:",  v10,  v9,  v11,  &v44));
    id v13 = v44;

    v38 = (void *)v12;
    if (!v12 || v13)
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
      id v30 = sub_1000AA6AC(@"ckksshare", v29);
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v46 = self;
        __int16 v47 = 2112;
        id v48 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Unable to load TLK shares for TLK(%@): %@",  buf,  0x16u);
      }

      if (a5)
      {
        id v13 = v13;
        BOOL v28 = 0;
        *a5 = v13;
      }

      else
      {
        BOOL v28 = 0;
      }
    }

    else
    {
      objc_super v34 = a5;
      id v35 = v9;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      id v36 = v8;
      id obj = v8;
      id v14 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (v14)
      {
        id v15 = v14;
        id v16 = 0LL;
        uint64_t v17 = *(void *)v41;
        while (2)
        {
          uint64_t v18 = 0LL;
          id v19 = v16;
          do
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v18);
            id v39 = 0LL;
            unsigned int v21 = [v20 unwrapKey:self fromShares:v38 error:&v39];
            id v16 = v39;
            unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
            id v23 = sub_1000AA6AC(@"ckksshare", v22);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            if (v21) {
              BOOL v26 = v16 == 0LL;
            }
            else {
              BOOL v26 = 0;
            }
            if (v26)
            {
              if (v25)
              {
                id v32 = (CKKSKey *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
                *(_DWORD *)buf = 138412546;
                v46 = v32;
                __int16 v47 = 2112;
                id v48 = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Recovered tlk (%@) from trust state (%@)",  buf,  0x16u);
              }

              BOOL v28 = 1;
              goto LABEL_33;
            }

            if (v25)
            {
              uint64_t v27 = (CKKSKey *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
              *(_DWORD *)buf = 138412802;
              v46 = v27;
              __int16 v47 = 2112;
              id v48 = v20;
              __int16 v49 = 2112;
              id v50 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Failed to recover tlk (%@) from trust state (%@): %@",  buf,  0x20u);
            }

            uint64_t v18 = (char *)v18 + 1;
            id v19 = v16;
          }

          while (v15 != v18);
          id v15 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      else
      {
        id v16 = 0LL;
      }

      if (v34)
      {
        id v19 = v16;
        BOOL v28 = 0;
        *objc_super v34 = v19;
      }

      else
      {
        BOOL v28 = 0;
        id v19 = v16;
      }

- (BOOL)validTLK:(id *)a3
{
  BOOL v5 = -[CKKSKey wrapsSelf](self, "wrapsSelf");
  if (!v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Potential TLK %@ doesn't wrap itself: %@",  self,  v6));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  18LL,  v7,  0LL));

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
    id v10 = sub_1000AA6AC(@"ckksshare", v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error with TLK: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v5;
}

- (BOOL)tlkMaterialPresentOrRecoverableViaTLKShareForContextID:(id)a3 forTrustStates:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v10)
  {
    id v42 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKey ensureKeyLoadedForContextID:cache:error:]( self,  "ensureKeyLoadedForContextID:cache:error:",  v8,  0LL,  &v42));
    id v12 = v42;

    if (v11)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
      id v41 = v12;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 ensureKeyLoadedFromKeychain:&v41]);
      id v14 = v41;

      if (v11 && !v14)
      {
        id v40 = 0LL;
        uint64_t v15 = -[CKKSKey trySelfWrappedKeyCandidate:error:](self, "trySelfWrappedKeyCandidate:error:", v11, &v40);
        id v12 = v40;
        if ((v15 & 1) != 0)
        {
          BOOL v16 = 1;
LABEL_34:

          goto LABEL_35;
        }

        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
        id v24 = sub_1000AA6AC(@"ckksshare", v23);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v12;
          unsigned int v22 = "Some key is present, but the key is not self-wrapped: %@";
          goto LABEL_18;
        }

        goto LABEL_19;
      }

      id v12 = v14;
    }

    id v17 = [v12 code];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey zoneName](self, "zoneName"));
    id v19 = sub_1000AA6AC(@"ckksshare", v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v17 == (id)-25308LL)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Unable to load key due to lock state: %@",  buf,  0xCu);
      }

      if (a5)
      {
        id v12 = v12;
        BOOL v16 = 0;
        *a5 = v12;
      }

      else
      {
        BOOL v16 = 0;
      }

      goto LABEL_34;
    }

    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v12;
      unsigned int v22 = "Do not yet have this key in the keychain: %@";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    }

- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    unsigned __int8 v9 = [v8 trySelfWrappedKeyCandidate:v6 error:a4];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 wrapAESKey:v6 error:a4]);
  }

  else
  {
    unsigned __int8 v9 = 0LL;
  }

  return v9;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 unwrapAESKey:v6 error:a4]);
  }

  else
  {
    unsigned __int8 v9 = 0LL;
  }

  return v9;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 encryptData:v8 authenticatedData:v9 error:a5]);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a5));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 decryptData:v8 authenticatedData:v9 error:a5]);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (BOOL)saveKeyMaterialToKeychain:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5) {
    return 0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  unsigned __int8 v7 = [v6 saveKeyMaterialToKeychain:1 error:a3];

  return v7;
}

- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:", a4));

  if (!v7) {
    return 0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  unsigned __int8 v9 = [v8 saveKeyMaterialToKeychain:v5 error:a4];

  return v9;
}

- (BOOL)loadKeyMaterialFromKeychain:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5) {
    return 0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  unsigned __int8 v7 = [v6 loadKeyMaterialFromKeychain:a3];

  return v7;
}

- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey getKeychainBackedKey:](self, "getKeychainBackedKey:"));

  if (!v5) {
    return 0;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
  unsigned __int8 v7 = [v6 deleteKeyMaterialFromKeychain:a3];

  return v7;
}

- (BOOL)saveToDatabaseAsOnlyCurrentKeyForClassAndState:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey currentKeysForClass:contextID:state:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "currentKeysForClass:contextID:state:zoneID:error:",  v5,  v6,  v7,  v8,  a3));

  if (v9)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          objc_msgSend(v15, "setCurrentkey:", 0, (void)v18);
          if (![v15 saveToDatabase:a3])
          {

            goto LABEL_12;
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    BOOL v16 = -[CKKSSQLDatabaseObject saveToDatabase:](self, "saveToDatabase:", a3);
  }

  else
  {
LABEL_12:
    BOOL v16 = 0;
  }

  return v16;
}

- (void)setFromCKRecord:(id)a3
{
  id v23 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v23 recordType]);
  unsigned __int8 v5 = [v4 isEqual:@"synckey"];

  if ((v5 & 1) != 0)
  {
    -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v23);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v23 recordID]);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
    -[CKKSKey setUuid:](self, "setUuid:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"parentkeyref"]);
    if (v8)
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"parentkeyref"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordID]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
      -[CKKSKey setParentKeyUUID:](self, "setParentKeyUUID:", v11);
    }

    else
    {
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
      -[CKKSKey setParentKeyUUID:](self, "setParentKeyUUID:", v9);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"class"]);
    -[CKKSKey setKeyclass:](self, "setKeyclass:", v12);

    uint64_t v13 = objc_alloc(&OBJC_CLASS___NSData);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"wrappedkey"]);
    uint64_t v15 = -[NSData initWithBase64EncodedString:options:](v13, "initWithBase64EncodedString:options:", v14, 0LL);
    -[CKKSKey setWrappedKeyDataBackingStore:](self, "setWrappedKeyDataBackingStore:", v15);

    -[CKKSKey setKeycore:](self, "setKeycore:", 0LL);
    -[CKKSKey setState:](self, "setState:", @"remote");
  }

  else
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v23 recordType]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v16,  @"synckey"));
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v17,  0LL));

    objc_exception_throw(v18);
    -[CKKSKey updateCKRecord:zoneID:](v19, v20, v21, v22);
  }

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned __int8 v9 = [v8 isEqual:@"synckey"];

  if ((v9 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    unsigned int v12 = [v10 isEqual:v11];

    if (v12)
    {
      [v6 setObject:0 forKeyedSubscript:@"parentkeyref"];
    }

    else
    {
      uint64_t v13 = objc_alloc(&OBJC_CLASS___CKReference);
      id v14 = objc_alloc(&OBJC_CLASS___CKRecordID);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
      BOOL v16 = -[CKRecordID initWithRecordName:zoneID:](v14, "initWithRecordName:zoneID:", v15, v7);
      id v17 = -[CKReference initWithRecordID:action:](v13, "initWithRecordID:action:", v16, CKReferenceActionValidate);
      [v6 setObject:v17 forKeyedSubscript:@"parentkeyref"];
    }

    +[CKKSItem setOSVersionInRecord:](&OBJC_CLASS___CKKSItem, "setOSVersionInRecord:", v6);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
    [v6 setObject:v18 forKeyedSubscript:@"class"];

    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
    SEL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 base64EncodedStringWithOptions:0]);
    [v6 setObject:v20 forKeyedSubscript:@"wrappedkey"];

    return v6;
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v22,  @"synckey"));
    id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v23,  0LL));

    objc_exception_throw(v24);
    return (id)-[CKKSKey matchesCKRecord:](v25, v26, v27);
  }

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqual:@"synckey"];

  if (!v6) {
    goto LABEL_20;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v21 = sub_1000AA6AC(@"ckkskey", 0LL);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      __int128 v19 = "UUID does not match";
      SEL v20 = buf;
      goto LABEL_9;
    }

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@[%@](%@): %@ (%@,%@:%d)>",  v5,  v6,  v8,  v9,  v10,  v11,  -[CKKSKey currentkey](self, "currentkey")));

  return v12;
}

- (id)whereClauseToFindSelf
{
  v10[0] = @"contextID";
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v11[0] = v3;
  v10[1] = @"UUID";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v11[1] = v4;
  v10[2] = @"state";
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  v11[2] = v5;
  v10[3] = @"ckzone";
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);
  v11[3] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  4LL));

  return v8;
}

- (id)sqlValues
{
  v32[0] = @"contextID";
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  v33[0] = v31;
  v32[1] = @"UUID";
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  v33[1] = v3;
  v32[2] = @"parentKeyUUID";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  if (v4) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CKKSKey parentKeyUUID](self, "parentKeyUUID"));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
  }
  unsigned int v6 = (void *)v5;
  v33[2] = v5;
  v32[3] = @"ckzone";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  unsigned __int8 v10 = v9;

  v33[3] = v10;
  v32[4] = @"ckrecord";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 base64EncodedStringWithOptions:0]);

  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v14 = v13;

  v33[4] = v14;
  v32[5] = @"keyclass";
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
  unsigned __int8 v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v18 = v17;

  v33[5] = v18;
  v32[6] = @"state";
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey state](self, "state"));
  SEL v20 = v19;
  if (v19) {
    id v21 = v19;
  }
  else {
    id v21 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v22 = v21;

  v33[6] = v22;
  v32[7] = @"wrappedkey";
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey wrappedKeyData](self, "wrappedKeyData"));
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 base64EncodedDataWithOptions:0]);

  if (v24) {
    id v25 = v24;
  }
  else {
    id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  SEL v26 = v25;

  v33[7] = v26;
  v32[8] = @"currentkey";
  unsigned int v27 = -[CKKSKey currentkey](self, "currentkey");
  unsigned __int8 v28 = @"0";
  if (v27) {
    unsigned __int8 v28 = @"1";
  }
  v33[8] = v28;
  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  9LL));

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSKey;
  id v5 = -[CKKSCKRecordHolder copyWithZone:](&v9, "copyWithZone:");
  id v6 = -[CKKSKeychainBackedKey copyWithZone:](self->_keycore, "copyWithZone:", a3);
  id v7 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v6;

  objc_storeStrong((id *)v5 + 11, self->_state);
  *((_BYTE *)v5 + 56) = self->_currentkey;
  return v5;
}

- (id)serializeAsProtobuf:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKey ensureKeyLoadedForContextID:cache:error:]( self,  "ensureKeyLoadedForContextID:cache:error:",  v5,  0LL,  a3));

  if (v6)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___CKKSSerializedKey);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](self, "uuid"));
    -[CKKSSerializedKey setUuid:](v7, "setUuid:", v8);

    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    -[CKKSSerializedKey setZoneName:](v7, "setZoneName:", v10);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keyclass](self, "keyclass"));
    -[CKKSSerializedKey setKeyclass:](v7, "setKeyclass:", v11);

    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    id v13 = (char *)objc_claimAutoreleasedReturnValue([v12 aessivkey]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey keycore](self, "keycore"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 aessivkey]);
    id v16 = +[NSData _newZeroingDataWithBytes:length:]( &OBJC_CLASS___NSData,  "_newZeroingDataWithBytes:length:",  v13 + 8,  v15[11]);
    -[CKKSSerializedKey setKey:](v7, "setKey:", v16);

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey data](v7, "data"));
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setParentKeyUUID:(id)a3
{
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setKeyclass:(id)a3
{
}

- (SecCKKSProcessedState)state
{
  return (SecCKKSProcessedState *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setState:(id)a3
{
}

- (BOOL)currentkey
{
  return self->_currentkey;
}

- (void)setCurrentkey:(BOOL)a3
{
  self->_currentkey = a3;
}

- (CKKSKeychainBackedKey)keycore
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setKeycore:(id)a3
{
}

- (NSData)wrappedKeyDataBackingStore
{
  return (NSData *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setWrappedKeyDataBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)loadKeyWithUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v9 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey fromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "fromDatabase:contextID:zoneID:error:",  a3,  v9,  a5,  a6));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 ensureKeyLoadedForContextID:v9 cache:0 error:a6]);

  if (v11) {
    id v11 = v10;
  }

  return v11;
}

+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 keyclass]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 randomKeyWrappedByParent:v6 keyclass:v7 error:a4]);

  return v8;
}

+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getKeychainBackedKey:a5]);
  if (v9)
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey randomKeyWrappedByParent:keyclass:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "randomKeyWrappedByParent:keyclass:error:",  v9,  v8,  a5));
    if (v10)
    {
      id v11 = objc_alloc(&OBJC_CLASS___CKKSKey);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v7 contextID]);
      id v13 = -[CKKSKey initWithKeyCore:contextID:state:currentkey:]( v11,  "initWithKeyCore:contextID:state:currentkey:",  v10,  v12,  @"local",  0LL);
    }

    else
    {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)randomKeyWrappedBySelf:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKeychainBackedKey randomKeyWrappedBySelf:error:]( &OBJC_CLASS___CKKSKeychainBackedKey,  "randomKeyWrappedBySelf:error:",  a3,  a5));
  if (v8) {
    id v9 = -[CKKSKey initWithKeyCore:contextID:state:currentkey:]( objc_alloc(&OBJC_CLASS___CKKSKey),  "initWithKeyCore:contextID:state:currentkey:",  v8,  v7,  @"local",  0LL);
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)isItemKeyForKeychainView:(SecDbItem *)a3
{
  id v4 = sub_1000E7EC0(a3, kSecAttrAccessGroup);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = sub_1000E7EC0(a3, kSecAttrDescription);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = sub_1000E7EC0(a3, kSecAttrServer);
  uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
  unsigned __int8 v10 = (void *)v9;
  if (v5) {
    BOOL v11 = v7 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v9 == 0) {
    goto LABEL_23;
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  if ([v7 isEqual:v14])
  {
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  if (([v10 isEqual:v15] & 1) != 0
    || ![v5 isEqualToString:@"com.apple.security.ckks"])
  {

    goto LABEL_21;
  }

  if (([v7 isEqualToString:@"tlk"] & 1) == 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-nonsync",  @"tlk"));
    if ([v7 isEqualToString:v16])
    {
LABEL_17:

      goto LABEL_18;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-piggy",  @"tlk"));
    if (([v7 isEqualToString:v17] & 1) != 0
      || ([v7 isEqualToString:@"classA"] & 1) != 0)
    {

      goto LABEL_17;
    }

    unsigned __int8 v20 = [v7 isEqualToString:@"classC"];

    if ((v20 & 1) != 0) {
      goto LABEL_19;
    }
LABEL_23:
    id v18 = 0LL;
    goto LABEL_24;
  }

+ (id)fromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"state";
  v22[2] = @"local";
  v21[3] = @"ckzone";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  v22[3] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v18 error:a6]);

  return v19;
}

+ (id)fromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"ckzone";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  v22[2] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabaseWhere:v18 error:a6]);

  return v19;
}

+ (id)tryFromDatabase:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"state";
  v22[2] = @"local";
  void v21[3] = @"ckzone";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  void v22[3] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v18 error:a6]);

  return v19;
}

+ (id)tryFromDatabaseAnyState:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21[0] = @"contextID";
  id v13 = v11;
  id v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v16 = v15;

  v22[0] = v16;
  v22[1] = v10;
  v21[1] = @"UUID";
  v21[2] = @"ckzone";
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  v22[2] = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  3LL));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([a1 tryFromDatabaseWhere:v18 error:a6]);

  return v19;
}

+ (id)selfWrappedKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v19[0] = @"UUID";
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSSQLWhereColumn op:column:](&OBJC_CLASS___CKKSSQLWhereColumn, "op:column:", 1LL, 2LL));
  v20[0] = v10;
  v19[1] = @"contextID";
  id v11 = v8;
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v14 = v13;

  v20[1] = v14;
  v20[2] = @"local";
  void v19[2] = @"state";
  v19[3] = @"ckzone";
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  v20[3] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v16 error:a5]);

  return v17;
}

+ (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer fromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "fromDatabase:contextID:zoneID:error:",  a3,  v10,  v11,  a6));
  id v13 = v12;
  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 currentKeyUUID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 fromDatabase:v14 contextID:v10 zoneID:v11 error:a6]);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

+ (id)currentKeysForClass:(id)a3 contextID:(id)a4 state:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = a6;
  v26[0] = v12;
  v25[0] = @"keyclass";
  v25[1] = @"contextID";
  id v16 = v13;
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  __int128 v19 = v18;

  v26[1] = v19;
  v26[2] = @"1";
  v25[2] = @"currentkey";
  v25[3] = @"state";
  unsigned __int8 v20 = @"local";
  if (v14) {
    unsigned __int8 v20 = v14;
  }
  v26[3] = v20;
  v25[4] = @"ckzone";
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
  v26[4] = v21;
  id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  5LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v22 error:a7]);

  return v23;
}

+ (id)allKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v13 = v12;

  v18[1] = @"ckzone";
  v19[0] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  v19[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v15 error:a5]);

  return v16;
}

+ (id)remoteKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v13 = v12;

  v19[0] = v13;
  v19[1] = @"remote";
  v18[1] = @"state";
  void v18[2] = @"ckzone";
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  void v19[2] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v15 error:a5]);

  return v16;
}

+ (id)localKeysForContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v18[0] = @"contextID";
  id v10 = v8;
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v13 = v12;

  v19[0] = v13;
  v19[1] = @"local";
  v18[1] = @"state";
  void v18[2] = @"ckzone";
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  void v19[2] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 allWhere:v15 error:a5]);

  return v16;
}

+ (id)sqlTable
{
  return @"synckeys";
}

+ (id)sqlColumns
{
  return &off_1002AE6A0;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___CKKSKey);
  unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"wrappedkey"]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 asBase64DecodedData]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v23 asString]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"UUID"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v22 asString]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"parentKeyUUID"]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v21 asString]);
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"keyclass"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v20 asString]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"state"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v19 asString]);
  id v7 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 asString]);
  id v9 = -[CKRecordZoneID initWithZoneName:ownerName:](v7, "initWithZoneName:ownerName:", v8, CKCurrentUserDefaultName);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckrecord"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 asBase64DecodedData]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"currentkey"]);

  id v15 = -[CKKSKey initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:]( v4,  "initWithWrappedKeyData:contextID:uuid:parentKeyUUID:keyclass:state:zoneID:encodedCKRecord:currentkey:",  v25,  v5,  v6,  v18,  v17,  v14,  v9,  v11,  [v12 asNSInteger]);
  return v15;
}

+ (id)countsWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = sub_1000DB4C0;
  unsigned __int8 v24 = sub_1000DB4D0;
  id v25 = 0LL;
  id v10 = [(id)objc_opt_class(a1) sqlTable];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v27[0] = v8;
  v26[0] = @"contextID";
  v26[1] = @"ckzone";
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v15 = v14;

  v27[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  2LL));
  v19[1] = 3221225472LL;
  void v19[2] = sub_1000DB4D8;
  void v19[3] = &unk_100290E08;
  void v19[4] = &v20;
  v19[0] = _NSConcreteStackBlock;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v11,  v16,  &off_1002AE6B8,  0LL,  0LL,  -1LL,  v19,  a5);

  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

+ (id)countsByClassWithContextID:(id)a3 zoneID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = [(id)objc_opt_class(a1) sqlTable];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v21[0] = @"contextID";
  v21[1] = @"ckzone";
  v22[0] = v8;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);

  if (v13) {
    id v14 = v13;
  }
  else {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v15 = v14;

  v22[1] = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  void v19[2] = sub_1000DB3B8;
  void v19[3] = &unk_100285C40;
  id v17 = v10;
  uint64_t v20 = v17;
  +[CKKSSQLDatabaseObject queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:]( &OBJC_CLASS___CKKSSQLDatabaseObject,  "queryDatabaseTable:where:columns:groupBy:orderBy:limit:processRow:error:",  v12,  v16,  &off_1002AE6D0,  &off_1002AE6E8,  0LL,  -1LL,  v19,  a5);

  return v17;
}

+ (id)loadFromProtobuf:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[CKKSSerializedKey initWithData:](objc_alloc(&OBJC_CLASS___CKKSSerializedKey), "initWithData:", v8);

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v9, "uuid"));
  if (!v10) {
    goto LABEL_9;
  }
  id v11 = (void *)v10;
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v9, "zoneName"));
  if (!v12)
  {
LABEL_8:

    goto LABEL_9;
  }

  id v13 = (void *)v12;
  uint64_t v14 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v9, "keyclass"));
  if (!v14)
  {

    goto LABEL_8;
  }

  id v15 = (void *)v14;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v9, "key"));

  if (v16)
  {
    id v17 = objc_alloc(&OBJC_CLASS___CKKSKey);
    id v18 = objc_alloc(&OBJC_CLASS___CKKSAESSIVKey);
    id v19 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v9, "key"));
    id v20 = [v19 bytes];
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v9, "key"));
    uint64_t v22 = -[CKKSAESSIVKey initWithBytes:len:](v18, "initWithBytes:len:", v20, [v21 length]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v9, "uuid"));
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v9, "keyclass"));
    id v25 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
    SEL v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v9, "zoneName"));
    unsigned int v27 = -[CKRecordZoneID initWithZoneName:ownerName:]( v25,  "initWithZoneName:ownerName:",  v26,  CKCurrentUserDefaultName);
    id v28 = -[CKKSKey initSelfWrappedWithAESKey:contextID:uuid:keyclass:state:zoneID:encodedCKRecord:currentkey:]( v17,  "initSelfWrappedWithAESKey:contextID:uuid:keyclass:state:zoneID:encodedCKRecord:currentkey:",  v22,  v7,  v23,  v24,  @"remote",  v27,  0LL,  0LL);

    goto LABEL_11;
  }

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 flagHandler:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  uint64_t v10 = (CKKSKey *)a3;
  id v11 = a4;
  id v68 = a6;
  if (!v8)
  {
LABEL_17:
    id v16 = -[CKKSCKRecordHolder initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSKey),  "initWithCKRecord:contextID:",  v10,  v11);
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey uuid](v16, "uuid"));
    id v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 zoneID]);
    id v71 = 0LL;
    id v28 = (CKKSKey *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v38,  v11,  v40,  &v71));
    id v41 = (CKKSKey *)v71;

    if (v41)
    {
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneID]);
      id v44 = (void *)objc_claimAutoreleasedReturnValue([v43 zoneName]);
      id v45 = sub_1000AA6AC(@"ckkskey", v44);
      id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);

      id v30 = v68;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v74 = v16;
        __int16 v75 = 2112;
        v76 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "Error finding existing local key for %@: %@",  buf,  0x16u);
      }
    }

    else
    {
      id v30 = v68;
      if (v28 && -[CKKSKey matchesCKRecord:](v28, "matchesCKRecord:", v10))
      {
        -[CKKSCKRecordHolder setStoredCKRecord:](v28, "setStoredCKRecord:", v10);
        id v70 = 0LL;
        unsigned int v59 = -[CKKSSQLDatabaseObject saveToDatabase:](v28, "saveToDatabase:", &v70);
        v60 = (CKKSKey *)v70;
        id v17 = v60;
        if (v59 && !v60) {
          goto LABEL_24;
        }
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID", a7));
        v62 = (void *)objc_claimAutoreleasedReturnValue([v61 zoneID]);
        v63 = (void *)objc_claimAutoreleasedReturnValue([v62 zoneName]);
        id v64 = sub_1000AA6AC(@"ckkskey", v63);
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);

        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v74 = v28;
          __int16 v75 = 2112;
          v76 = v17;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "Couldn't update existing key: %@: %@",  buf,  0x16u);
        }

        goto LABEL_29;
      }
    }

    -[CKKSKey setState:](v16, "setState:", @"remote", a7);
    -[CKKSKey setCurrentkey:](v16, "setCurrentkey:", 0LL);
    id v69 = 0LL;
    unsigned int v47 = -[CKKSSQLDatabaseObject saveToDatabase:](v16, "saveToDatabase:", &v69);
    id v48 = (CKKSKey *)v69;
    id v17 = v48;
    if (v47 && !v48)
    {
      [v30 _onqueueHandleFlag:@"key_process_requested"];
LABEL_24:
      BOOL v29 = 1;
      goto LABEL_38;
    }

    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v49 zoneID]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 zoneName]);
    id v52 = sub_1000AA6AC(@"ckkskey", v51);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);

    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v16;
      __int16 v75 = 2112;
      v76 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "Couldn't save key record to database: %@: %@",  buf,  0x16u);
    }

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKey recordID](v10, "recordID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v54 zoneID]);
    v56 = (void *)objc_claimAutoreleasedReturnValue([v55 zoneName]);
    id v57 = sub_1000AA6AC(@"ckkskey", v56);
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);

    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "CKRecord was %@", buf, 0xCu);
    }

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  while (1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    id v26 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabaseAnyState:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabaseAnyState:contextID:zoneID:error:",  v9,  v8,  v10,  &v26));
    id v12 = v26;

    if (!v11) {
      break;
    }
    id v25 = 0LL;
    [v11 deleteFromDatabase:&v25];
    id v13 = v25;
    if (v13)
    {
      id v19 = v13;
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneName]);
      id v22 = sub_1000AA6AC(@"ckkskey", v21);
      unsigned __int8 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Couldn't delete key record from database: %@: %@",  buf,  0x16u);
      }

LABEL_13:
      BOOL v18 = 0;
      goto LABEL_15;
    }
  }

  if (v12)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
    id v16 = sub_1000AA6AC(@"ckkskey", v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Couldn't load key record from database: %@: %@",  buf,  0x16u);
    }

    if (a5)
    {
      id v12 = v12;
      BOOL v18 = 0;
      *a5 = v12;
      goto LABEL_15;
    }

    goto LABEL_13;
  }

  BOOL v18 = 1;
LABEL_15:

  return v18;
}

@end