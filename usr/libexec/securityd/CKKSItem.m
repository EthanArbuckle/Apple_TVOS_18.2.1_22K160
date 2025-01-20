@interface CKKSItem
+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6;
+ (id)fromDatabaseRow:(id)a3;
+ (id)sqlColumns;
+ (void)setOSVersionInRecord:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesCKRecord:(id)a3;
- (CKKSItem)initWithCKRecord:(id)a3 contextID:(id)a4;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encItem:(id)a7 wrappedkey:(id)a8 generationCount:(unint64_t)a9 encver:(unint64_t)a10;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11;
- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11 plaintextPCSServiceIdentifier:(id)a12 plaintextPCSPublicKey:(id)a13 plaintextPCSPublicIdentity:(id)a14;
- (CKKSWrappedAESSIVKey)wrappedkey;
- (NSData)encitem;
- (NSData)plaintextPCSPublicIdentity;
- (NSData)plaintextPCSPublicKey;
- (NSNumber)plaintextPCSServiceIdentifier;
- (NSString)base64Item;
- (NSString)parentKeyUUID;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)initCopyingCKKSItem:(id)a3;
- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItem:(id)a3 encryptionVersion:(unint64_t)a4;
- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1;
- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:(id)a3;
- (id)sqlValues;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (id)whereClauseToFindSelf;
- (unint64_t)encver;
- (unint64_t)generationCount;
- (void)setBase64Item:(id)a3;
- (void)setEncitem:(id)a3;
- (void)setEncver:(unint64_t)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setGenerationCount:(unint64_t)a3;
- (void)setParentKeyUUID:(id)a3;
- (void)setPlaintextPCSPublicIdentity:(id)a3;
- (void)setPlaintextPCSPublicKey:(id)a3;
- (void)setPlaintextPCSServiceIdentifier:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWrappedkey:(id)a3;
@end

@implementation CKKSItem

- (CKKSItem)initWithCKRecord:(id)a3 contextID:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CKKSItem;
  return -[CKKSCKRecordHolder initWithCKRecord:contextID:](&v5, "initWithCKRecord:contextID:", a3, a4);
}

- (id)initCopyingCKKSItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ckRecordType]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 encodedCKRecord]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 contextID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CKKSItem;
  v9 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v25,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  v5,  v6,  v7,  v8);

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 uuid]);
    uuid = v9->_uuid;
    v9->_uuid = (NSString *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 parentKeyUUID]);
    parentKeyUUID = v9->_parentKeyUUID;
    v9->_parentKeyUUID = (NSString *)v12;

    v9->_generationCount = (unint64_t)[v4 generationCount];
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 encitem]);
    encitem = v9->_encitem;
    v9->_encitem = (NSData *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 wrappedkey]);
    wrappedkey = v9->_wrappedkey;
    v9->_wrappedkey = (CKKSWrappedAESSIVKey *)v16;

    v9->_encver = (unint64_t)[v4 encver];
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v4 plaintextPCSServiceIdentifier]);
    plaintextPCSServiceIdentifier = v9->_plaintextPCSServiceIdentifier;
    v9->_plaintextPCSServiceIdentifier = (NSNumber *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 plaintextPCSPublicKey]);
    plaintextPCSPublicKey = v9->_plaintextPCSPublicKey;
    v9->_plaintextPCSPublicKey = (NSData *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 plaintextPCSPublicIdentity]);
    plaintextPCSPublicIdentity = v9->_plaintextPCSPublicIdentity;
    v9->_plaintextPCSPublicIdentity = (NSData *)v22;
  }

  return v9;
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6
{
  return -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:]( self,  "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:",  a3,  a4,  a5,  a6,  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encItem:(id)a7 wrappedkey:(id)a8 generationCount:(unint64_t)a9 encver:(unint64_t)a10
{
  return -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:]( self,  "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:",  a3,  a4,  a5,  a6,  0LL,  a7,  a8,  a9,  a10);
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11
{
  return -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:]( self,  "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plainte xtPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  0LL,  0LL,  0LL);
}

- (CKKSItem)initWithUUID:(id)a3 parentKeyUUID:(id)a4 contextID:(id)a5 zoneID:(id)a6 encodedCKRecord:(id)a7 encItem:(id)a8 wrappedkey:(id)a9 generationCount:(unint64_t)a10 encver:(unint64_t)a11 plaintextPCSServiceIdentifier:(id)a12 plaintextPCSPublicKey:(id)a13 plaintextPCSPublicIdentity:(id)a14
{
  id v30 = a3;
  id v29 = a4;
  id v19 = a8;
  id v28 = a9;
  id v27 = a12;
  id v20 = a13;
  id v21 = a14;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___CKKSItem;
  uint64_t v22 = -[CKKSCKRecordHolder initWithCKRecordType:encodedCKRecord:contextID:zoneID:]( &v31,  "initWithCKRecordType:encodedCKRecord:contextID:zoneID:",  @"item",  a7,  a5,  a6);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_uuid, a3);
    objc_storeStrong((id *)&v23->_parentKeyUUID, a4);
    v23->_generationCount = a10;
    -[CKKSItem setEncitem:](v23, "setEncitem:", v19);
    objc_storeStrong((id *)&v23->_wrappedkey, a9);
    v23->_encver = a11;
    objc_storeStrong((id *)&v23->_plaintextPCSServiceIdentifier, a12);
    objc_storeStrong((id *)&v23->_plaintextPCSPublicKey, a13);
    objc_storeStrong((id *)&v23->_plaintextPCSPublicIdentity, a14);
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKKSItem, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
    if (![v8 isEqual:v9])
    {
      BOOL v16 = 0;
LABEL_41:

      goto LABEL_42;
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 parentKeyUUID]);
    if (![v10 isEqual:v11])
    {
      BOOL v16 = 0;
LABEL_40:

      goto LABEL_41;
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
    v35 = v12;
    if (![v12 isEqual:v13])
    {
      BOOL v16 = 0;
LABEL_39:

      goto LABEL_40;
    }

    uint64_t v34 = objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
    if (v34 || (uint64_t v14 = 0, (v27 = (void *)objc_claimAutoreleasedReturnValue([v7 contextID])) != 0))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
      uint64_t v32 = objc_claimAutoreleasedReturnValue([v7 contextID]);
      v33 = v15;
      if (!objc_msgSend(v15, "isEqualToString:"))
      {
        BOOL v16 = 0;
        v17 = (void *)v32;
        uint64_t v14 = (void *)v34;
LABEL_35:

        goto LABEL_36;
      }

      int v30 = 1;
      uint64_t v14 = (void *)v34;
    }

    else
    {
      id v27 = 0LL;
      int v30 = 0;
    }

    objc_super v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
    if (v31 || (objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v7 encitem])) != 0)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 encitem]);
      id v29 = v18;
      if (![v18 isEqual:v28])
      {
        BOOL v16 = 0;
        goto LABEL_28;
      }

      int v26 = 1;
    }

    else
    {
      objc_super v25 = 0LL;
      int v26 = 0;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 wrappedkey]);
    if ([v19 isEqual:v20]
      && (id v24 = -[CKKSItem generationCount](self, "generationCount"), v24 == [v7 generationCount]))
    {
      id v21 = -[CKKSItem encver](self, "encver");
      BOOL v16 = v21 == [v7 encver];

      if ((v26 & 1) == 0) {
        goto LABEL_24;
      }
    }

    else
    {

      BOOL v16 = 0;
      if (!v26)
      {
LABEL_24:
        uint64_t v14 = (void *)v34;
        if (v31) {

        }
        else {
        if ((v30 & 1) == 0)
        {
LABEL_36:
          if (!v14) {

          }
          goto LABEL_39;
        }

        goto LABEL_34;
      }
    }

    uint64_t v14 = (void *)v34;
LABEL_28:

    uint64_t v22 = v31;
    if (!v31)
    {

      uint64_t v22 = 0LL;
    }

    if (!v30) {
      goto LABEL_36;
    }
LABEL_34:
    v17 = (void *)v32;
    goto LABEL_35;
  }

  BOOL v16 = 0;
LABEL_42:

  return v16;
}

- (void)setFromCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned __int8 v6 = [v5 isEqual:@"item"];

  if ((v6 & 1) != 0)
  {
    -[CKKSCKRecordHolder setStoredCKRecord:](self, "setStoredCKRecord:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    uuid = self->_uuid;
    self->_uuid = v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"parentkeyref"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordID]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordName]);
    -[CKKSItem setParentKeyUUID:](self, "setParentKeyUUID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"data"]);
    -[CKKSItem setEncitem:](self, "setEncitem:", v13);

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wrappedkey"]);
    if (v14)
    {
      v15 = -[CKKSWrappedAESSIVKey initWithBase64:]( objc_alloc(&OBJC_CLASS___CKKSWrappedAESSIVKey),  "initWithBase64:",  v14);
    }

    else
    {
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
      id v19 = sub_1000AA6AC(@"ckksitem", v18);
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Corrupt item recieved with no wrapped key",  buf,  2u);
      }

      v15 = (CKKSWrappedAESSIVKey *)objc_claimAutoreleasedReturnValue(+[CKKSWrappedAESSIVKey zeroedKey](&OBJC_CLASS___CKKSWrappedAESSIVKey, "zeroedKey"));
    }

    id v21 = v15;
    -[CKKSItem setWrappedkey:](self, "setWrappedkey:", v15);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"gen"]);
    -[CKKSItem setGenerationCount:](self, "setGenerationCount:", [v22 unsignedIntegerValue]);

    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"encver"]);
    -[CKKSItem setEncver:](self, "setEncver:", [v23 unsignedIntegerValue]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pcsservice"]);
    -[CKKSItem setPlaintextPCSServiceIdentifier:](self, "setPlaintextPCSServiceIdentifier:", v24);

    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pcspublickey"]);
    -[CKKSItem setPlaintextPCSPublicKey:](self, "setPlaintextPCSPublicKey:", v25);

    int v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pcspublicidentity"]);
    -[CKKSItem setPlaintextPCSPublicIdentity:](self, "setPlaintextPCSPublicIdentity:", v26);
  }

  else
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v27,  @"item"));
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v28,  0LL));

    objc_exception_throw(v29);
    -[CKKSItem updateCKRecord:zoneID:](v30, v31, v32, v33);
  }

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned __int8 v9 = [v8 isEqual:@"item"];

  if ((v9 & 1) != 0)
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___CKReference);
    v11 = objc_alloc(&OBJC_CLASS___CKRecordID);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
    v13 = -[CKRecordID initWithRecordName:zoneID:](v11, "initWithRecordName:zoneID:", v12, v7);
    uint64_t v14 = -[CKReference initWithRecordID:action:](v10, "initWithRecordID:action:", v13, CKReferenceActionValidate);
    [v6 setObject:v14 forKeyedSubscript:@"parentkeyref"];

    +[CKKSItem setOSVersionInRecord:](&OBJC_CLASS___CKKSItem, "setOSVersionInRecord:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
    [v6 setObject:v15 forKeyedSubscript:@"data"];

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64WrappedKey]);
    [v6 setObject:v17 forKeyedSubscript:@"wrappedkey"];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CKKSItem generationCount](self, "generationCount")));
    [v6 setObject:v18 forKeyedSubscript:@"gen"];

    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CKKSItem encver](self, "encver")));
    [v6 setObject:v19 forKeyedSubscript:@"encver"];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
    [v6 setObject:v20 forKeyedSubscript:@"pcsservice"];

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
    [v6 setObject:v21 forKeyedSubscript:@"pcspublickey"];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
    [v6 setObject:v22 forKeyedSubscript:@"pcspublicidentity"];

    return v6;
  }

  else
  {
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    objc_super v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKRecordType (%@) was not %@",  v24,  @"item"));
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongCKRecordTypeException",  v25,  0LL));

    objc_exception_throw(v26);
    return (id)-[CKKSItem matchesCKRecord:](v27, v28, v29);
  }

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqual:@"item"];

  if (!v6) {
    goto LABEL_41;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v39 = sub_1000AA6AC(@"ckksitem", 0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v50 = 0;
    v41 = "UUID does not match";
    goto LABEL_39;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"parentkeyref"]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 recordID]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 recordName]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  unsigned __int8 v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    id v42 = sub_1000AA6AC(@"ckksitem", 0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v50 = 0;
    v41 = "wrapping key reference does not match";
    goto LABEL_39;
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"gen"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CKKSItem generationCount](self, "generationCount")));
  unsigned __int8 v18 = [v16 isEqual:v17];

  if ((v18 & 1) == 0)
  {
    id v43 = sub_1000AA6AC(@"ckksitem", 0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordGenerationCountKey does not match";
    goto LABEL_39;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"wrappedkey"]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 base64WrappedKey]);
  unsigned __int8 v22 = [v19 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    id v44 = sub_1000AA6AC(@"ckksitem", 0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordWrappedKeyKey does not match";
    goto LABEL_39;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"data"]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
  unsigned __int8 v25 = [v23 isEqual:v24];

  if ((v25 & 1) == 0)
  {
    id v45 = sub_1000AA6AC(@"ckksitem", 0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordDataKey does not match";
    goto LABEL_39;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pcsservice"]);
  if (v26
    || (id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"))) != 0LL)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"pcsservice"]);
    SEL v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
    unsigned __int8 v29 = [v27 isEqual:v28];

    if (v26)
    {

      if ((v29 & 1) != 0) {
        goto LABEL_11;
      }
    }

    else
    {

      if ((v29 & 1) != 0) {
        goto LABEL_11;
      }
    }

    id v46 = sub_1000AA6AC(@"ckksitem", 0LL);
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_40;
    }
    *(_WORD *)v50 = 0;
    v41 = "SecCKRecordPCSServiceIdentifier does not match";
    goto LABEL_39;
  }

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItem:(id)a3 encryptionVersion:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[CKKSItem makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:]( self,  "makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:",  v6));
    goto LABEL_5;
  }

  if (a4 == 1)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[CKKSItem makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1]( self,  "makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1"));
LABEL_5:
    v8 = (void *)v7;

    return v8;
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d is not a known encryption version",  a4));
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongEncryptionVersionException",  v10,  0LL));

  objc_exception_throw(v11);
  return -[CKKSItem makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1](v12, v13);
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer1
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"UUID");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"wrappedkey");

  unint64_t v12 = -[CKKSItem generationCount](self, "generationCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v12, 8LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, @"gen");

  unint64_t v11 = -[CKKSItem encver](self, "encver");
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v11, 8LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"encver");

  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", 0LL, @"pcsservice");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", 0LL, @"pcspublickey");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  0LL,  @"pcspublicidentity");
  return v3;
}

- (id)makeAuthenticatedDataDictionaryUpdatingCKKSItemEncVer2:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, @"UUID");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, @"wrappedkey");

  unint64_t v49 = -[CKKSItem generationCount](self, "generationCount");
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v49, 8LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, @"gen");

  unint64_t v48 = -[CKKSItem encver](self, "encver");
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v48, 8LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, @"encver");

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
  if (v12)
  {
    SEL v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
    id v14 = [v13 unsignedLongValue];

    id v47 = v14;
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v47, 8LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v15, @"pcsservice");
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, @"pcspublickey");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  v17,  @"pcspublicidentity");

  if (!v4) {
    goto LABEL_36;
  }
  unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue([v4 storedCKRecord]);
  if (!v18) {
    goto LABEL_35;
  }
  v40 = v5;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v41 = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
  id v20 = [v19 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (!v20) {
    goto LABEL_34;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v44;
  do
  {
    v23 = 0LL;
    do
    {
      if (*(void *)v44 != v22) {
        objc_enumerationMutation(v19);
      }
      id v24 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v23);
      if (([v24 isEqualToString:@"UUID"] & 1) == 0
        && ([v24 isEqualToString:@"uploadver"] & 1) == 0
        && ([v24 isEqualToString:@"data"] & 1) == 0
        && ([v24 isEqualToString:@"wrappedkey"] & 1) == 0
        && ([v24 isEqualToString:@"gen"] & 1) == 0
        && ([v24 isEqualToString:@"encver"] & 1) == 0
        && ([v24 isEqualToString:@"pcsservice"] & 1) == 0
        && ([v24 isEqualToString:@"pcspublickey"] & 1) == 0
        && ([v24 isEqualToString:@"pcspublicidentity"] & 1) == 0
        && ([v24 hasPrefix:@"server_"] & 1) == 0)
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectForKeyedSubscript:v24]);
        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSString, v25);
        if ((objc_opt_isKindOfClass(v42, v26) & 1) != 0)
        {
          id v28 = (id)objc_claimAutoreleasedReturnValue([v42 dataUsingEncoding:4]);
LABEL_24:
          BOOL v38 = v28;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v28, v24);
        }

        else
        {
          uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSData, v27);
          if ((objc_opt_isKindOfClass(v42, v29) & 1) != 0)
          {
            id v28 = [v42 copy];
            goto LABEL_24;
          }

          uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDate, v30);
          if ((objc_opt_isKindOfClass(v42, v31) & 1) != 0)
          {
            id v39 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
            unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringForObjectValue:](v39, "stringForObjectValue:", v42));
            v36 = (void *)objc_claimAutoreleasedReturnValue([v37 dataUsingEncoding:4]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v36, v24);
          }

          else
          {
            uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNumber, v32);
            if ((objc_opt_isKindOfClass(v42, v33) & 1) != 0)
            {
              id v47 = (id)0xAAAAAAAAAAAAAAAALL;
              id v47 = [v42 unsignedLongLongValue];
              id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v47, 8LL));
              goto LABEL_24;
            }
          }
        }
      }

      v23 = (char *)v23 + 1;
    }

    while (v21 != v23);
    id v34 = [v19 countByEnumeratingWithState:&v43 objects:v50 count:16];
    id v21 = v34;
  }

  while (v34);
LABEL_34:

  uint64_t v5 = v40;
  unsigned __int8 v18 = v41;
LABEL_35:

LABEL_36:
  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@: %@>", v5, v6));

  return v7;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %@ %p>",  v5,  v6,  self));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CKKSItem;
  id v4 = -[CKKSCKRecordHolder copyWithZone:](&v6, "copyWithZone:", a3);
  objc_storeStrong(v4 + 7, self->_uuid);
  objc_storeStrong(v4 + 8, self->_parentKeyUUID);
  objc_storeStrong(v4 + 9, self->_encitem);
  objc_storeStrong(v4 + 10, self->_wrappedkey);
  v4[11] = (id)self->_generationCount;
  v4[12] = (id)self->_encver;
  return v4;
}

- (NSString)base64Item
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem encitem](self, "encitem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 base64EncodedStringWithOptions:0]);

  return (NSString *)v3;
}

- (void)setBase64Item:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v4,  0LL);

  encitem = self->_encitem;
  self->_encitem = v5;
}

- (id)whereClauseToFindSelf
{
  v12[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  objc_super v6 = v5;

  v13[0] = v6;
  v12[1] = @"UUID";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v13[1] = v7;
  v12[2] = @"ckzone";
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
  v13[2] = v9;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  3LL));

  return v10;
}

- (id)sqlValues
{
  v40[0] = @"contextID";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder contextID](self, "contextID"));
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v6 = v5;

  id v39 = v6;
  v41[0] = v6;
  v40[1] = @"UUID";
  BOOL v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem uuid](self, "uuid"));
  v41[1] = v38;
  v40[2] = @"parentKeyUUID";
  unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem parentKeyUUID](self, "parentKeyUUID"));
  v41[2] = v37;
  v40[3] = @"ckzone";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v10 = v9;

  v36 = v10;
  v41[3] = v10;
  v40[4] = @"encitem";
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem base64Item](self, "base64Item"));
  v41[4] = v35;
  v40[5] = @"wrappedkey";
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem wrappedkey](self, "wrappedkey"));
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v34 base64WrappedKey]);
  v41[5] = v11;
  v40[6] = @"gencount";
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CKKSItem generationCount](self, "generationCount")));
  SEL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stringValue]);
  v41[6] = v13;
  v40[7] = @"encver";
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[CKKSItem encver](self, "encver")));
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);
  v41[7] = v15;
  v40[8] = @"ckrecord";
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64EncodedStringWithOptions:0]);

  if (v17) {
    id v18 = v17;
  }
  else {
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v19 = v18;

  v41[8] = v19;
  v40[9] = @"pcss";
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSServiceIdentifier](self, "plaintextPCSServiceIdentifier"));
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v23 = v22;

  v41[9] = v23;
  v40[10] = @"pcsk";
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicKey](self, "plaintextPCSPublicKey"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 base64EncodedStringWithOptions:0]);

  if (v25) {
    id v26 = v25;
  }
  else {
    id v26 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v27 = v26;

  v41[10] = v27;
  v40[11] = @"pcsi";
  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSItem plaintextPCSPublicIdentity](self, "plaintextPCSPublicIdentity"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 base64EncodedStringWithOptions:0]);

  if (v29) {
    id v30 = v29;
  }
  else {
    id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  uint64_t v31 = v30;

  v41[11] = v31;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  12LL));

  return v32;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setUuid:(id)a3
{
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setParentKeyUUID:(id)a3
{
}

- (NSData)encitem
{
  return (NSData *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setEncitem:(id)a3
{
}

- (CKKSWrappedAESSIVKey)wrappedkey
{
  return (CKKSWrappedAESSIVKey *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setWrappedkey:(id)a3
{
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (void)setGenerationCount:(unint64_t)a3
{
  self->_generationCount = a3;
}

- (unint64_t)encver
{
  return self->_encver;
}

- (void)setEncver:(unint64_t)a3
{
  self->_encver = a3;
}

- (NSNumber)plaintextPCSServiceIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setPlaintextPCSServiceIdentifier:(id)a3
{
}

- (NSData)plaintextPCSPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setPlaintextPCSPublicKey:(id)a3
{
}

- (NSData)plaintextPCSPublicIdentity
{
  return (NSData *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPlaintextPCSPublicIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)setOSVersionInRecord:(id)a3
{
  id v3 = a3;
  id v4 = -[OTDeviceInformationActualAdapter osVersion]_0();
  id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
  [v3 setObject:v5 forKeyedSubscript:@"uploadver"];
}

+ (id)sqlColumns
{
  return &off_1002AE418;
}

+ (id)fromDatabaseRow:(id)a3
{
  id v3 = a3;
  id v24 = objc_alloc(&OBJC_CLASS___CKKSItem);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"UUID"]);
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v31 asString]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"parentKeyUUID"]);
  unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v29 asString]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"contextID"]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v28 asString]);
  id v5 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckzone"]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v27 asString]);
  v35 = -[CKRecordZoneID initWithZoneName:ownerName:](v5, "initWithZoneName:ownerName:");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"ckrecord"]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v25 asBase64DecodedData]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"encitem"]);
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v23 asBase64DecodedData]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"wrappedkey"]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v22 asString]);
  id v30 = (void *)v4;
  if (v21)
  {
    id v6 = objc_alloc(&OBJC_CLASS___CKKSWrappedAESSIVKey);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"wrappedkey"]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v19 asString]);
    uint64_t v32 = -[CKKSWrappedAESSIVKey initWithBase64:](v6, "initWithBase64:");
  }

  else
  {
    uint64_t v32 = 0LL;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"gencount"]);
  id v7 = [v20 asNSInteger];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"encver"]);
  id v9 = [v8 asNSInteger];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"pcss"]);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 asNSNumberInteger]);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"pcsk"]);
  SEL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 asBase64DecodedData]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"pcsi"]);
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 asBase64DecodedData]);
  BOOL v16 = -[CKKSItem initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintextPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:]( v24,  "initWithUUID:parentKeyUUID:contextID:zoneID:encodedCKRecord:encItem:wrappedkey:generationCount:encver:plaintex tPCSServiceIdentifier:plaintextPCSPublicKey:plaintextPCSPublicIdentity:",  v30,  v37,  v36,  v35,  v34,  v33,  v32,  v7,  v9,  v11,  v13,  v15);

  if (v21)
  {
  }

  return v16;
}

+ (BOOL)intransactionRecordChanged:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  v8 = (CKKSMirrorEntry *)a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  SEL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneID]);
  id v143 = 0LL;
  id v14 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue( +[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSMirrorEntry,  "tryFromDatabase:contextID:zoneID:error:",  v11,  v9,  v13,  &v143));
  unsigned __int8 v15 = (CKKSMirrorEntry *)v143;

  if (v15)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
    id v19 = sub_1000AA6AC(@"ckks", v18);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v147 = v15;
    id v21 = "error loading a CKKSMirrorEntry from database: %@";
    id v22 = v20;
    uint32_t v23 = 12;
    goto LABEL_4;
  }

  if (v6)
  {
    if (v14)
    {
      unsigned __int8 v25 = -[CKKSMirrorEntry matchesCKRecord:](v14, "matchesCKRecord:", v8);
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 zoneID]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneName]);
      id v29 = sub_1000AA6AC(@"ckksresync", v28);
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);

      if ((v25 & 1) != 0)
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
          *(_DWORD *)buf = 138412290;
          v147 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Already know about this item record, updating anyway: %@",  buf,  0xCu);
        }
      }

      else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v147 = v14;
        __int16 v148 = 2112;
        v149 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "BUG: Local item doesn't match resynced CloudKit record: %@ %@",  buf,  0x16u);
      }

      goto LABEL_21;
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneID]);
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
    id v35 = sub_1000AA6AC(@"ckksresync", v34);
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v147 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "BUG: No local item matching resynced CloudKit record: %@",  buf,  0xCu);
    }

LABEL_17:
    id v14 = -[CKKSMirrorEntry initWithCKRecord:contextID:]( objc_alloc(&OBJC_CLASS___CKKSMirrorEntry),  "initWithCKRecord:contextID:",  v8,  v9);
    unsigned __int8 v37 = @"add";
    goto LABEL_35;
  }

  if (!v14) {
    goto LABEL_17;
  }
LABEL_21:
  uint64_t v38 = objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
  if (v38)
  {
    id v39 = (void *)v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
    id v41 = [v40 generationCount];
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"gen"));
    id v43 = [v42 unsignedLongLongValue];

    if (v41 > v43)
    {
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v44 zoneID]);
      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 zoneName]);
      id v47 = sub_1000AA6AC(@"ckks", v46);
      unint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);

      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        unint64_t v49 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry uuid](v14, "uuid"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
        v51 = (CKKSMirrorEntry *)[v50 generationCount];
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"gen"));
        *(_DWORD *)buf = 138412802;
        v147 = v49;
        __int16 v148 = 2048;
        v149 = v51;
        __int16 v150 = 2112;
        v151 = v52;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "received a record from CloudKit with a bad generation count: %@ (%ld > %@)",  buf,  0x20u);
      }

      if (a6)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry uuid](v14, "uuid"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry item](v14, "item"));
        id v55 = [v54 generationCount];
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"gen"));
        v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Received a record(%@) with a bad generation count (%ld > %@)",  v53,  v55,  v56));
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  58LL,  v57));
      }

      unsigned __int8 v15 = 0LL;
      goto LABEL_28;
    }
  }

  if (-[CKKSMirrorEntry matchesCKRecord:](v14, "matchesCKRecord:", v8) && !v6)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 zoneID]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 zoneName]);
    id v61 = sub_1000AA6AC(@"ckks", v60);
    v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);

    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = (CKKSMirrorEntry *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry uuid](v14, "uuid"));
      *(_DWORD *)buf = 138412290;
      v147 = v63;
      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "CloudKit has told us of record we already know about for %@; skipping update",
        buf,
        0xCu);
    }

    unsigned __int8 v15 = 0LL;
    BOOL v24 = 1;
    goto LABEL_85;
  }

  -[CKKSMirrorEntry setFromCKRecord:](v14, "setFromCKRecord:", v8);
  unsigned __int8 v37 = @"modify";
LABEL_35:
  id v142 = 0LL;
  unsigned int v64 = -[CKKSSQLDatabaseObject saveToDatabase:](v14, "saveToDatabase:", &v142);
  unsigned __int8 v15 = (CKKSMirrorEntry *)v142;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSMirrorEntry recordID](v8, "recordID"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v65 zoneID]);
  v67 = (void *)objc_claimAutoreleasedReturnValue([v66 zoneName]);
  id v68 = sub_1000AA6AC(@"ckks", v67);
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);

  if (!v64 || v15)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      if (a6)
      {
        unsigned __int8 v15 = v15;
        BOOL v24 = 0;
        *a6 = v15;
        goto LABEL_85;
      }

+ (BOOL)intransactionRecordDeleted:(id)a3 contextID:(id)a4 resync:(BOOL)a5 error:(id *)a6
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"ckks", v11);
  SEL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v70 = @"item";
    __int16 v71 = 2112;
    v72 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CloudKit notification: deleted record(%@): %@",  buf,  0x16u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString recordName](v8, "recordName"));
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneID](v8, "zoneID"));
  BOOL v16 = (__CFString *)objc_claimAutoreleasedReturnValue( +[CKKSMirrorEntry tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSMirrorEntry,  "tryFromDatabase:contextID:zoneID:error:",  v14,  v9,  v15,  a6));

  if (!v16) {
    goto LABEL_38;
  }
  id v68 = 0LL;
  unsigned __int8 v17 = -[__CFString deleteFromDatabase:](v16, "deleteFromDatabase:", &v68);
  id v18 = v68;
  id v19 = v18;
  if ((v17 & 1) == 0)
  {
    if (a6)
    {
      id v19 = v18;
      BOOL v29 = 0;
      BOOL v24 = 0LL;
      *a6 = v19;
    }

    else
    {
      BOOL v29 = 0;
      BOOL v24 = 0LL;
    }

@end