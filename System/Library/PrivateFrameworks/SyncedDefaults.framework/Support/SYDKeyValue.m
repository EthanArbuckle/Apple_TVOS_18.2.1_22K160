@interface SYDKeyValue
+ (BOOL)keyValueRecordHasAssetWithoutFile:(id)a3;
+ (id)keyFromKeyValueRecord:(id)a3;
+ (id)keyFromUnencryptedKeyValueRecordName:(id)a3;
+ (id)recordFieldKeyForValueModificationDateInStoreType:(int64_t)a3;
+ (id)recordNameForUnencryptedKey:(id)a3;
+ (void)deleteFilesForAssetsInKeyValueRecord:(id)a3;
- (BOOL)isNewKeyValue;
- (BOOL)setServerSystemFieldsRecordIfNewer:(id)a3;
- (CKRecord)serverSystemFieldsRecord;
- (CKRecordID)recordID;
- (NSData)serverSystemFieldsRecordData;
- (NSDate)valueModificationDate;
- (NSString)key;
- (NSString)recordName;
- (NSString)storeIdentifier;
- (SYDKeyValue)initWithKey:(id)a3 storeIdentifier:(id)a4;
- (_TtC13syncdefaultsd8SYDKeyID)keyID;
- (id)description;
- (id)recordRepresentationForStoreType:(int64_t)a3;
- (id)redactedDescription;
- (id)value;
- (void)markForDeletion;
- (void)mergeDataFromRecord:(id)a3;
- (void)setIsNewKeyValue:(BOOL)a3;
- (void)setKeyID:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setServerSystemFieldsRecord:(id)a3;
- (void)setServerSystemFieldsRecordData:(id)a3;
- (void)setValue:(id)a3;
- (void)setValue:(id)a3 withModificationDate:(id)a4;
- (void)setValueModificationDate:(id)a3;
@end

@implementation SYDKeyValue

- (SYDKeyValue)initWithKey:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SYDKeyValue;
  v8 = -[SYDKeyValue init](&v16, "init");
  if (v8)
  {
    if (![v6 length]) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to init a keyValue without a key: %@",  v6);
    }
    if (![v7 length]) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to init a keyValue without a store identifier: %@",  v7);
    }
    v9 = -[SYDKeyID initWithKey:storeIdentifier:]( objc_alloc(&OBJC_CLASS____TtC13syncdefaultsd8SYDKeyID),  "initWithKey:storeIdentifier:",  v6,  v7);
    keyID = v8->_keyID;
    v8->_keyID = v9;

    v11 = v8->_keyID;
    if (!v11)
    {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to init a keyValue without a keyID: %@",  0LL);
      v11 = v8->_keyID;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyID key](v11, "key"));
    id v13 = [v12 length];

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyID key](v8->_keyID, "key"));
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to init a keyValue without a keyID.key: %@",  v14);
    }
  }

  return v8;
}

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue key](self, "key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue storeIdentifier](self, "storeIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue recordName](self, "recordName"));
  if (v9) {
    v10 = @" recordName=";
  }
  else {
    v10 = &stru_10004DCD0;
  }
  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[SYDKeyValue recordName](self, "recordName"));
  v12 = (void *)v11;
  if (v11) {
    id v13 = (const __CFString *)v11;
  }
  else {
    id v13 = &stru_10004DCD0;
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"<%@: %p; key=%@ storeIdentifier=%@%@%@>",
    v6,
    self,
    v7,
    v8,
    v10,
    v13);

  return v3;
}

- (id)redactedDescription
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue storeIdentifier](self, "storeIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue recordName](self, "recordName"));
  if (v8) {
    v9 = @" recordName=";
  }
  else {
    v9 = &stru_10004DCD0;
  }
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SYDKeyValue recordName](self, "recordName"));
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = (const __CFString *)v10;
  }
  else {
    v12 = &stru_10004DCD0;
  }
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"<%@: %p; storeIdentifier=%@%@%@>",
    v6,
    self,
    v7,
    v9,
    v12);

  return v3;
}

- (NSString)key
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue keyID](self, "keyID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 key]);

  return (NSString *)v3;
}

- (NSString)storeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue keyID](self, "keyID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 storeIdentifier]);

  return (NSString *)v3;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_value != v4)
  {
    id v11 = v4;
    if (v4
      && (unsigned __int8 v6 = +[NSPropertyListSerialization propertyList:isValidForFormat:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyList:isValidForFormat:",  v4,  200LL),  v5 = v11,  (v6 & 1) == 0))
    {
      v9 = (objc_class *)objc_opt_class(v11);
      uint64_t v10 = NSStringFromClass(v9);
      id value = (id)objc_claimAutoreleasedReturnValue(v10);
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"Tried to set invalid value '%@' of class '%@'",  v11,  value);
    }

    else
    {
      id v7 = v5;
      id value = self->_value;
      self->_id value = v7;
    }

    v5 = v11;
  }
}

- (void)setValue:(id)a3 withModificationDate:(id)a4
{
  id v6 = a4;
  -[SYDKeyValue setValue:](self, "setValue:", a3);
  -[SYDKeyValue setValueModificationDate:](self, "setValueModificationDate:", v6);
}

- (void)markForDeletion
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[SYDKeyValue setValueModificationDate:](self, "setValueModificationDate:", v3);
}

- (CKRecord)serverSystemFieldsRecord
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue serverSystemFieldsRecordData](self, "serverSystemFieldsRecordData"));
  if (v2)
  {
    id v9 = 0LL;
    id v3 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v2,  &v9);
    id v4 = v9;
    v5 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v3);
    if (v4)
    {
      id v6 = SYDGetCloudKitLog();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10002BD08();
      }
    }
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (void)setServerSystemFieldsRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    [v4 encodeSystemFieldsWithCoder:v5];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v5, "encodedData"));
    if (v6)
    {
      -[SYDKeyValue setServerSystemFieldsRecordData:](self, "setServerSystemFieldsRecordData:", v6);
    }

    else
    {
      id v7 = SYDGetCloudKitLog();
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10002BD6C(v4);
      }
    }
  }

  else
  {
    -[SYDKeyValue setServerSystemFieldsRecordData:](self, "setServerSystemFieldsRecordData:", 0LL);
  }
}

- (CKRecordID)recordID
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue recordName](self, "recordName"));
  if (!v3) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to get a record ID for a keyValue that has not been assigned a record name yet: %@",  self);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue storeIdentifier](self, "storeIdentifier"));
  v5 = sub_10000CE94(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (!v6) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Trying to get a record ID for a keyValue that does not have an associated zoneID: %@",  self);
  }
  id v7 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  v3,  v6);

  return v7;
}

- (BOOL)setServerSystemFieldsRecordIfNewer:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v16 = SYDGetCloudKitLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Trying to set server record if newer, but no other record",  (uint8_t *)&v31,  2u);
    }

    id v6 = 0LL;
    goto LABEL_11;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue serverSystemFieldsRecord](self, "serverSystemFieldsRecord"));
  id v6 = v5;
  if (!v5)
  {
    id v21 = SYDGetCloudKitLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10002BF9C(v4);
    }
    goto LABEL_19;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 modificationDate]);

  if (!v7)
  {
    id v22 = SYDGetCloudKitLog();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10002C028(v4);
    }
    goto LABEL_19;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v26 = SYDGetCloudKitLog();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "syd_shortDescription"));
      v29 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "syd_shortDescription"));
      int v31 = 138412546;
      v32 = v28;
      __int16 v33 = 2112;
      v34 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Trying to set server record using record with a different ID. current=%@ other=%@",  (uint8_t *)&v31,  0x16u);
    }

- (void)mergeDataFromRecord:(id)a3
{
  id v4 = a3;
  id v5 = SYDGetCloudKitLog();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002C458(self);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v8 = [v7 isEqualToString:@"KVSRecord"];

  if ((v8 & 1) != 0)
  {
    uint64_t v9 = 0LL;
LABEL_7:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue serverSystemFieldsRecord](self, "serverSystemFieldsRecord"));
    id v13 = v12;
    if (v12)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 recordType]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) == 0)
      {
        id v31 = SYDGetCloudKitLog();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10002C330(v4, v13, v19);
        }
        goto LABEL_69;
      }
    }

    unsigned int v17 = -[SYDKeyValue setServerSystemFieldsRecordIfNewer:](self, "setServerSystemFieldsRecordIfNewer:", v4);
    id v18 = [(id)objc_opt_class(self) recordFieldKeyForValueModificationDateInStoreType:v9];
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v19]);
    if (v8)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"value"]);
      id v22 = @"assetValue";
    }

    else
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 encryptedValues]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"valueData"]);

      id v22 = @"valueDataAsset";
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v22]);
    if (v20)
    {
      objc_opt_class(&OBJC_CLASS___NSDate);
      if ((objc_opt_isKindOfClass(v20) & 1) != 0)
      {
LABEL_24:
        if (!v21 && v24)
        {
          __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v24 fileURL]);

          if (!v33)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue([v24 assetContent]);

            if (v43)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v24 assetContent]);
              if (v21) {
                goto LABEL_33;
              }
            }

            else
            {
              id v44 = SYDGetCloudKitLog();
              v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
                sub_10002C254(v4);
              }
            }

            goto LABEL_43;
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue([v24 fileURL]);
          id v61 = 0LL;
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v34,  0LL,  &v61));
          id v35 = v61;

          if (v35)
          {
            id v36 = SYDGetCloudKitLog();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              sub_10002C2CC();
            }
          }
        }

        if (v21)
        {
LABEL_33:
          objc_opt_class(&OBJC_CLASS___NSData);
          if ((objc_opt_isKindOfClass(v21) & 1) != 0) {
            goto LABEL_46;
          }
          id v38 = SYDGetCloudKitLog();
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = (objc_class *)objc_opt_class(v21);
            v41 = NSStringFromClass(v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            *(_DWORD *)buf = 138412290;
            v63 = v42;
            _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_INFO,  "Record's value data was of the wrong class (%@). Expected NSData.",  buf,  0xCu);
          }

LABEL_45:
          id v21 = 0LL;
LABEL_46:
          if (!v20) {
            goto LABEL_68;
          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue valueModificationDate](self, "valueModificationDate"));
          v48 = v47;
          if (v47)
          {
            id v49 = [v47 compare:v20];
            if (v49)
            {
              if (v49 == (id)-1LL)
              {
                id v50 = SYDGetCloudKitLog();
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
                  sub_10002C1FC();
                }
                goto LABEL_57;
              }

- (id)recordRepresentationForStoreType:(int64_t)a3
{
  id v5 = (CKRecord *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue serverSystemFieldsRecord](self, "serverSystemFieldsRecord"));
  id v6 = v5;
  if ((unint64_t)a3 <= 3)
  {
    id v7 = off_10004CC28[a3];
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    id v13 = objc_alloc(&OBJC_CLASS___CKRecord);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue recordID](self, "recordID"));
    id v6 = -[CKRecord initWithRecordType:recordID:](v13, "initWithRecordType:recordID:", v7, v14);

    goto LABEL_9;
  }

  id v7 = 0LL;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](v5, "recordType"));
  unsigned __int8 v9 = [v8 isEqualToString:v7];

  if ((v9 & 1) != 0)
  {
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue value](self, "value"));
    id v36 = 0LL;
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v15,  200LL,  0LL,  &v36));
    unsigned __int8 v11 = (os_log_s *)v36;

    if (!v16 || v11)
    {
      id v17 = SYDGetCloudKitLog();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002C5F0();
      }
    }

    if ((unint64_t)[v16 length] <= 0x19000)
    {
      unint64_t v23 = 0LL;
    }

    else
    {
      id v19 = SYDGetCloudKitLog();
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_10002C548(v6, v16, v20);
      }

      id v21 = objc_alloc(&OBJC_CLASS___CKAsset);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([UTTypePropertyList identifier]);
      unint64_t v23 = -[CKAsset initWithAssetContent:itemTypeHint:](v21, "initWithAssetContent:itemTypeHint:", v16, v22);
    }

    if (v23) {
      v24 = 0LL;
    }
    else {
      v24 = v16;
    }
    unint64_t v25 = v24;
    if (!(v23 | v25))
    {
      id v32 = SYDGetCloudKitLog();
      __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        sub_10002C4D0(v6);
      }

      v12 = 0LL;
      goto LABEL_36;
    }

    if ((unint64_t)(a3 - 1) >= 3)
    {
      if (a3) {
        goto LABEL_35;
      }
      -[CKRecord setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v25, @"value");
      -[CKRecord setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v23, @"assetValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue valueModificationDate](self, "valueModificationDate"));

      if (!v34) {
        goto LABEL_35;
      }
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue valueModificationDate](self, "valueModificationDate"));
      -[CKRecord setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v30, @"localModificationDate");
    }

    else
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v6, "encryptedValues"));
      [v26 setObject:v25 forKeyedSubscript:@"valueData"];

      -[CKRecord setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v23, @"valueDataAsset");
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue valueModificationDate](self, "valueModificationDate"));

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue valueModificationDate](self, "valueModificationDate"));
        -[CKRecord setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v28,  @"valueModificationDate");
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue key](self, "key"));

      if (!v29) {
        goto LABEL_35;
      }
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[SYDKeyValue key](self, "key"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](v6, "encryptedValues"));
      [v31 setObject:v30 forKeyedSubscript:@"key"];
    }

LABEL_35:
    v12 = v6;
LABEL_36:

    goto LABEL_37;
  }

  id v10 = SYDGetCloudKitLog();
  unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    sub_10002C654((uint64_t)v7, v6, v11);
  }
  v12 = 0LL;
LABEL_37:

  return v12;
}

+ (id)keyFromKeyValueRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v6 = [v5 isEqualToString:@"KVSRecord"];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([a1 keyFromUnencryptedKeyValueRecordName:v8]);

    goto LABEL_5;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 recordType]);
  unsigned int v11 = [v10 isEqualToString:@"EncryptedKeyValue"];

  if (v11)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 encryptedValues]);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"key"]);
LABEL_5:

    if (v9) {
      goto LABEL_9;
    }
  }

  id v12 = SYDGetCloudKitLog();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10002C720(v4, v13);
  }

  unsigned __int8 v9 = 0LL;
LABEL_9:

  return v9;
}

+ (id)keyFromUnencryptedKeyValueRecordName:(id)a3
{
  id v3 = a3;
  id v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);

  id v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v4, 4LL);
  return v5;
}

+ (id)recordNameForUnencryptedKey:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  return v4;
}

+ (void)deleteFilesForAssetsInKeyValueRecord:(id)a3
{
  id v3 = a3;
  if (qword_100057978 != -1) {
    dispatch_once(&qword_100057978, &stru_10004CC08);
  }
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v4 = (id)qword_100057970;
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&__int128 v6 = 138412290LL;
    __int128 v23 = v6;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v10, v23));
        id v12 = v11;
        if (v11)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 fileURL]);

          if (v13)
          {
            id v14 = SYDGetCloudKitLog();
            v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 recordID]);
              *(_DWORD *)buf = 138412546;
              id v30 = v10;
              __int16 v31 = 2112;
              id v32 = v22;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Deleting file for asset (%@) in key value record %@",  buf,  0x16u);
            }

            unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 fileURL]);
            id v24 = 0LL;
            unsigned __int8 v18 = [v16 removeItemAtURL:v17 error:&v24];
            id v19 = v24;

            if ((v18 & 1) == 0)
            {
              id v20 = SYDGetCloudKitLog();
              id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v23;
                id v30 = v19;
                _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to delete asset file: %@",  buf,  0xCu);
              }
            }
          }
        }
      }

      id v7 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v7);
  }
}

+ (BOOL)keyValueRecordHasAssetWithoutFile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"assetValue"]);
  if (v4
    || (id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"valueDataAsset"])) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fileURL]);
    BOOL v6 = v5 == 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)recordFieldKeyForValueModificationDateInStoreType:(int64_t)a3
{
  else {
    return @"valueModificationDate";
  }
}

- (_TtC13syncdefaultsd8SYDKeyID)keyID
{
  return self->_keyID;
}

- (void)setKeyID:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (NSDate)valueModificationDate
{
  return self->_valueModificationDate;
}

- (void)setValueModificationDate:(id)a3
{
}

- (NSData)serverSystemFieldsRecordData
{
  return self->_serverSystemFieldsRecordData;
}

- (void)setServerSystemFieldsRecordData:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (BOOL)isNewKeyValue
{
  return self->_isNewKeyValue;
}

- (void)setIsNewKeyValue:(BOOL)a3
{
  self->_isNewKeyValue = a3;
}

- (void).cxx_destruct
{
}

@end