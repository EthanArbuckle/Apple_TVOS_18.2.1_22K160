@interface SecEscrowPendingRecord
+ (id)loadAllFromKeychain:(id *)a3;
+ (id)loadFromKeychain:(id)a3 error:(id *)a4;
- (BOOL)certCached;
- (BOOL)deleteFromKeychain:(id *)a3;
- (BOOL)escrowAttemptedWithinLastSeconds:(double)a3;
- (BOOL)hasAltDSID;
- (BOOL)hasCertCached;
- (BOOL)hasLastCloudServicesTriggerTime;
- (BOOL)hasLastEscrowAttemptTime;
- (BOOL)hasSerializedPrerecord;
- (BOOL)hasSerializedReason;
- (BOOL)hasTriggerRequestTime;
- (BOOL)hasUploadCompleted;
- (BOOL)hasUploadRetries;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)saveToKeychain:(id *)a3;
- (BOOL)uploadCompleted;
- (NSData)serializedPrerecord;
- (NSData)serializedReason;
- (NSString)altDSID;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)lastCloudServicesTriggerTime;
- (unint64_t)lastEscrowAttemptTime;
- (unint64_t)triggerRequestTime;
- (unint64_t)uploadRetries;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setCertCached:(BOOL)a3;
- (void)setHasCertCached:(BOOL)a3;
- (void)setHasLastCloudServicesTriggerTime:(BOOL)a3;
- (void)setHasLastEscrowAttemptTime:(BOOL)a3;
- (void)setHasTriggerRequestTime:(BOOL)a3;
- (void)setHasUploadCompleted:(BOOL)a3;
- (void)setHasUploadRetries:(BOOL)a3;
- (void)setLastCloudServicesTriggerTime:(unint64_t)a3;
- (void)setLastEscrowAttemptTime:(unint64_t)a3;
- (void)setSerializedPrerecord:(id)a3;
- (void)setSerializedReason:(id)a3;
- (void)setTriggerRequestTime:(unint64_t)a3;
- (void)setUploadCompleted:(BOOL)a3;
- (void)setUploadRetries:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecEscrowPendingRecord

- (BOOL)saveToKeychain:(id *)a3
{
  v31[0] = kSecClass;
  v31[1] = kSecAttrAccessible;
  v32[0] = kSecClassInternetPassword;
  v32[1] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly;
  v31[2] = kSecAttrAccessGroup;
  v31[3] = kSecAttrServer;
  v32[2] = @"com.apple.sbd";
  v32[3] = @"escrow-prerecord";
  v31[4] = kSecAttrDescription;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](self, "uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Escrow Prerecord: %@",  v4));
  v32[4] = v5;
  v31[5] = kSecAttrAccount;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](self, "uuid"));
  v32[5] = v6;
  v31[6] = kSecValueData;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord data](self, "data"));
  v32[6] = v7;
  v32[7] = &__kCFBooleanTrue;
  v31[7] = kSecAttrIsInvisible;
  v31[8] = kSecUseDataProtectionKeychain;
  v31[9] = kSecAttrSynchronizable;
  v32[8] = &__kCFBooleanTrue;
  v32[9] = &__kCFBooleanFalse;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v32,  v31,  10LL));
  v9 = (const __CFDictionary *)[v8 mutableCopy];

  CFTypeRef result = 0LL;
  uint64_t v10 = SecItemAdd(v9, &result);
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == -25299)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecClass));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v12, kSecClass);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrSynchronizable));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v13,  kSecAttrSynchronizable);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrSyncViewHint));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v14,  kSecAttrSyncViewHint);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrAccessGroup));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v15, kSecAttrAccessGroup);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrAccount));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v16, kSecAttrAccount);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrServer));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, kSecAttrServer);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", kSecAttrPath));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v18, kSecAttrPath);

      v19 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v9,  "objectForKeyedSubscript:",  kSecUseDataProtectionKeychain));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v19,  kSecUseDataProtectionKeychain);

      id v20 = -[__CFDictionary mutableCopy](v9, "mutableCopy");
      [v20 setObject:0 forKeyedSubscript:kSecClass];
      uint64_t v21 = SecItemUpdate((CFDictionaryRef)v11, (CFDictionaryRef)v20);
      if ((_DWORD)v21)
      {
        uint64_t v22 = (int)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemUpdate: %d",  v21));
        id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  v22,  v23));
      }

      else
      {
        id v24 = 0LL;
      }

      v27 = a3;
    }

    else
    {
      uint64_t v26 = (int)v10;
      v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemAdd: %d",  v10));
      id v24 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  v26,  v11));
      v27 = a3;
    }

    BOOL v25 = v24 == 0LL;
    if (v27 && v24)
    {
      id v24 = v24;
      BOOL v25 = 0;
      id *v27 = v24;
    }
  }

  else
  {
    id v24 = 0LL;
    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)deleteFromKeychain:(id *)a3
{
  v11[0] = kSecClass;
  v11[1] = kSecAttrAccessGroup;
  v12[0] = kSecClassInternetPassword;
  v12[1] = @"com.apple.sbd";
  v12[2] = @"escrow-prerecord";
  v11[2] = kSecAttrServer;
  v11[3] = kSecAttrAccount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord uuid](self, "uuid"));
  v12[3] = v4;
  v12[4] = &__kCFBooleanTrue;
  v11[4] = kSecUseDataProtectionKeychain;
  v11[5] = kSecAttrSynchronizable;
  v12[5] = &__kCFBooleanFalse;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  6LL));
  v6 = (const __CFDictionary *)[v5 mutableCopy];

  uint64_t v7 = SecItemDelete(v6);
  int v8 = v7;
  if (a3 && (_DWORD)v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemAdd: %d",  v7));
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  v8,  v9));
  }

  return v8 == 0;
}

- (BOOL)escrowAttemptedWithinLastSeconds:(double)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  [v4 timeIntervalSince1970];
  double v6 = v5;
  BOOL v7 = -[SecEscrowPendingRecord hasLastEscrowAttemptTime](self, "hasLastEscrowAttemptTime")
    && -[SecEscrowPendingRecord lastEscrowAttemptTime](self, "lastEscrowAttemptTime") >= (unint64_t)(v6 * 1000.0);

  return v7;
}

+ (id)loadFromKeychain:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v19[0] = kSecClass;
  v19[1] = kSecAttrAccessGroup;
  v20[0] = kSecClassInternetPassword;
  v20[1] = @"com.apple.sbd";
  v19[2] = kSecAttrServer;
  v19[3] = kSecAttrAccount;
  v20[2] = @"escrow-prerecord";
  v20[3] = v5;
  v19[4] = kSecMatchLimit;
  v19[5] = kSecAttrSynchronizable;
  v20[4] = kSecMatchLimitOne;
  v20[5] = &__kCFBooleanFalse;
  v19[6] = kSecUseDataProtectionKeychain;
  v19[7] = kSecReturnAttributes;
  v20[6] = &__kCFBooleanTrue;
  v20[7] = &__kCFBooleanTrue;
  v19[8] = kSecReturnData;
  v20[8] = &__kCFBooleanTrue;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  9LL));
  BOOL v7 = (const __CFDictionary *)[v6 mutableCopy];

  CFTypeRef result = 0LL;
  uint64_t v8 = SecItemCopyMatching(v7, &result);
  v9 = (void *)result;
  if ((_DWORD)v8)
  {
    uint64_t v10 = v8;
    if (result)
    {
      CFTypeRef result = 0LL;
      CFRelease(v9);
    }

    if (!a4)
    {
      v13 = 0LL;
      goto LABEL_9;
    }

    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemCopyMatching: %d",  v10));
    v18 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  (int)v10,  v11));
    v13 = 0LL;
    *a4 = v12;
  }

  else
  {
    v14 = objc_alloc(&OBJC_CLASS___SecEscrowPendingRecord);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kSecValueData]);
    v13 = -[SecEscrowPendingRecord initWithData:](v14, "initWithData:", v11);
  }

LABEL_9:
  return v13;
}

+ (id)loadAllFromKeychain:(id *)a3
{
  v34[0] = kSecClass;
  v34[1] = kSecAttrAccessGroup;
  v35[0] = kSecClassInternetPassword;
  v35[1] = @"com.apple.sbd";
  v34[2] = kSecAttrServer;
  v34[3] = kSecMatchLimit;
  v35[2] = @"escrow-prerecord";
  v35[3] = kSecMatchLimitAll;
  v34[4] = kSecAttrSynchronizable;
  v34[5] = kSecUseDataProtectionKeychain;
  v35[4] = &__kCFBooleanFalse;
  v35[5] = &__kCFBooleanTrue;
  v34[6] = kSecReturnAttributes;
  v34[7] = kSecReturnData;
  v35[6] = &__kCFBooleanTrue;
  v35[7] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  8LL));
  id v5 = (const __CFDictionary *)[v4 mutableCopy];

  CFTypeRef result = 0LL;
  uint64_t v6 = SecItemCopyMatching(v5, &result);
  if (!(_DWORD)v6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v10 = (id)result;
    id v13 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      id v24 = v5;
      uint64_t v15 = *(void *)v27;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v10);
          }
          NSErrorUserInfoKey v17 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v16);
          v18 = objc_alloc(&OBJC_CLASS___SecEscrowPendingRecord);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:kSecValueData]);
          id v20 = -[SecEscrowPendingRecord initWithData:](v18, "initWithData:", v19);

          if (v20)
          {
            [v12 addObject:v20];
          }

          else
          {
            uint64_t v21 = sub_10001267C("SecError");
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "escrowrequest: Unable to deserialize keychain item",  buf,  2u);
            }
          }

          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }

      while (v14);
      v9 = v10;
      id v5 = v24;
    }

    else
    {
      v9 = v10;
    }

    goto LABEL_21;
  }

  uint64_t v7 = v6;
  CFTypeRef v8 = result;
  if (result)
  {
    CFTypeRef result = 0LL;
    CFRelease(v8);
  }

  if (a3)
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SecItemCopyMatching: %d",  v7));
    v33 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  (int)v7,  v10));
    id v12 = 0LL;
    *a3 = v11;
LABEL_21:

    goto LABEL_22;
  }

  id v12 = 0LL;
LABEL_22:

  return v12;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0LL;
}

- (void)setCertCached:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_certCached = a3;
}

- (void)setHasCertCached:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCertCached
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasSerializedPrerecord
{
  return self->_serializedPrerecord != 0LL;
}

- (void)setLastCloudServicesTriggerTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastCloudServicesTriggerTime = a3;
}

- (void)setHasLastCloudServicesTriggerTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastCloudServicesTriggerTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLastEscrowAttemptTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastEscrowAttemptTime = a3;
}

- (void)setHasLastEscrowAttemptTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastEscrowAttemptTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setUploadCompleted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_uploadCompleted = a3;
}

- (void)setHasUploadCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUploadCompleted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUploadRetries:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_uploadRetries = a3;
}

- (void)setHasUploadRetries:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUploadRetries
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasAltDSID
{
  return self->_altDSID != 0LL;
}

- (void)setTriggerRequestTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_triggerRequestTime = a3;
}

- (void)setHasTriggerRequestTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggerRequestTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSerializedReason
{
  return self->_serializedReason != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SecEscrowPendingRecord;
  id v3 = -[SecEscrowPendingRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SecEscrowPendingRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_certCached));
    [v4 setObject:v6 forKey:@"certCached"];
  }

  serializedPrerecord = self->_serializedPrerecord;
  if (serializedPrerecord) {
    [v4 setObject:serializedPrerecord forKey:@"serializedPrerecord"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_lastCloudServicesTriggerTime));
    [v4 setObject:v14 forKey:@"lastCloudServicesTriggerTime"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_lastEscrowAttemptTime));
  [v4 setObject:v15 forKey:@"lastEscrowAttemptTime"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0LL;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0LL;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0LL;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t String = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(String);
        uint64_t v15 = 64LL;
        goto LABEL_66;
      case 2u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)&self->_has |= 0x10u;
        while (2)
        {
          unint64_t v20 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1LL || v20 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v21 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v19 |= (unint64_t)(v21 & 0x7F) << v17;
            if (v21 < 0)
            {
              v17 += 7;
              BOOL v10 = v18++ >= 9;
              if (v10)
              {
                uint64_t v19 = 0LL;
                goto LABEL_70;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0LL;
        }
LABEL_70:
        BOOL v48 = v19 != 0;
        uint64_t v49 = 72LL;
        goto LABEL_83;
      case 3u:
        uint64_t Data = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(Data);
        uint64_t v15 = 48LL;
        goto LABEL_66;
      case 4u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)&self->_has |= 1u;
        while (2)
        {
          unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1LL || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v27 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v25 |= (unint64_t)(v27 & 0x7F) << v23;
            if (v27 < 0)
            {
              v23 += 7;
              BOOL v10 = v24++ >= 9;
              if (v10)
              {
                uint64_t v25 = 0LL;
                goto LABEL_74;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v25 = 0LL;
        }
LABEL_74:
        uint64_t v50 = 8LL;
        goto LABEL_92;
      case 5u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v30 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1LL || v30 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v31 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v25 |= (unint64_t)(v31 & 0x7F) << v28;
            if (v31 < 0)
            {
              v28 += 7;
              BOOL v10 = v29++ >= 9;
              if (v10)
              {
                uint64_t v25 = 0LL;
                goto LABEL_78;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v25 = 0LL;
        }
LABEL_78:
        uint64_t v50 = 16LL;
        goto LABEL_92;
      case 6u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v34 = 0LL;
        *(_BYTE *)&self->_has |= 0x20u;
        while (2)
        {
          unint64_t v35 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v35 == -1LL || v35 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v36 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v35);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v35 + 1;
            v34 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v10 = v33++ >= 9;
              if (v10)
              {
                uint64_t v34 = 0LL;
                goto LABEL_82;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v34 = 0LL;
        }
LABEL_82:
        BOOL v48 = v34 != 0;
        uint64_t v49 = 73LL;
LABEL_83:
        self->PBCodable_opaque[v49] = v48;
        continue;
      case 7u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v39 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v39 == -1LL || v39 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }

          else
          {
            char v40 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v39);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v39 + 1;
            v25 |= (unint64_t)(v40 & 0x7F) << v37;
            if (v40 < 0)
            {
              v37 += 7;
              BOOL v10 = v38++ >= 9;
              if (v10)
              {
                uint64_t v25 = 0LL;
                goto LABEL_87;
              }

              continue;
            }
          }

          break;
        }

        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v25 = 0LL;
        }
LABEL_87:
        uint64_t v50 = 32LL;
        goto LABEL_92;
      case 8u:
        uint64_t v41 = PBReaderReadString(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v41);
        uint64_t v15 = 40LL;
        goto LABEL_66;
      case 9u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v25 = 0LL;
        *(_BYTE *)&self->_has |= 4u;
        break;
      case 0xAu:
        uint64_t v46 = PBReaderReadData(a3);
        uint64_t v14 = objc_claimAutoreleasedReturnValue(v46);
        uint64_t v15 = 56LL;
LABEL_66:
        v47 = *(void **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;

        continue;
      default:
        int v16 = PBReaderSkipValueWithTag(a3);
        if (!v16) {
          return v16;
        }
        continue;
    }

    while (1)
    {
      unint64_t v44 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v45 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v44);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v44 + 1;
      v25 |= (unint64_t)(v45 & 0x7F) << v42;
      if ((v45 & 0x80) == 0) {
        goto LABEL_89;
      }
      v42 += 7;
      BOOL v10 = v43++ >= 9;
      if (v10)
      {
        uint64_t v25 = 0LL;
        goto LABEL_91;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_89:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v25 = 0LL;
    }
LABEL_91:
    uint64_t v50 = 24LL;
LABEL_92:
    *(void *)&self->PBCodable_opaque[v50] = v25;
  }

  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  uuid = self->_uuid;
  id v10 = v4;
  if (uuid)
  {
    PBDataWriterWriteStringField(v4, uuid, 1LL);
    id v4 = v10;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField(v10, self->_certCached, 2LL);
    id v4 = v10;
  }

  serializedPrerecord = self->_serializedPrerecord;
  if (serializedPrerecord)
  {
    PBDataWriterWriteDataField(v10, serializedPrerecord, 3LL);
    id v4 = v10;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v10, self->_lastCloudServicesTriggerTime, 4LL);
    id v4 = v10;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  PBDataWriterWriteUint64Field(v10, self->_lastEscrowAttemptTime, 5LL);
  id v4 = v10;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_certCached;
    *((_BYTE *)v4 + 76) |= 0x10u;
  }

  if (self->_serializedPrerecord)
  {
    objc_msgSend(v6, "setSerializedPrerecord:");
    id v4 = v6;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((void *)v4 + 1) = self->_lastCloudServicesTriggerTime;
    *((_BYTE *)v4 + 76) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }

  *((void *)v4 + 2) = self->_lastEscrowAttemptTime;
  *((_BYTE *)v4 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[8];
  v5[8] = v6;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v5 + 72) = self->_certCached;
    *((_BYTE *)v5 + 76) |= 0x10u;
  }

  id v8 = -[NSData copyWithZone:](self->_serializedPrerecord, "copyWithZone:", a3);
  char v9 = (void *)v5[6];
  v5[6] = v8;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_lastCloudServicesTriggerTime;
    *((_BYTE *)v5 + 76) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x20) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }

  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }

  v5[2] = self->_lastEscrowAttemptTime;
  *((_BYTE *)v5 + 76) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 8))
  {
  }

  char has = (char)self->_has;
  char v7 = *((_BYTE *)v4 + 76);
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0) {
      goto LABEL_48;
    }
    if (self->_certCached)
    {
      if (!*((_BYTE *)v4 + 72)) {
        goto LABEL_48;
      }
    }

    else if (*((_BYTE *)v4 + 72))
    {
      goto LABEL_48;
    }
  }

  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_48;
  }

  serializedPrerecord = self->_serializedPrerecord;
  if ((unint64_t)serializedPrerecord | *((void *)v4 + 6))
  {
    char has = (char)self->_has;
    char v7 = *((_BYTE *)v4 + 76);
  }

  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_lastCloudServicesTriggerTime != *((void *)v4 + 1)) {
      goto LABEL_48;
    }
  }

  else if ((v7 & 1) != 0)
  {
    goto LABEL_48;
  }

  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_lastEscrowAttemptTime != *((void *)v4 + 2)) {
      goto LABEL_48;
    }
  }

  else if ((v7 & 2) != 0)
  {
    goto LABEL_48;
  }

  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_48;
    }
    if (self->_uploadCompleted)
    {
      if (!*((_BYTE *)v4 + 73)) {
        goto LABEL_48;
      }
    }

    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_48;
    }
  }

  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_48;
  }

  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_uploadRetries != *((void *)v4 + 4)) {
      goto LABEL_48;
    }
  }

  else if ((v7 & 8) != 0)
  {
    goto LABEL_48;
  }

  altDSID = self->_altDSID;
  if ((unint64_t)altDSID | *((void *)v4 + 5))
  {
    if (-[NSString isEqual:](altDSID, "isEqual:"))
    {
      char has = (char)self->_has;
      char v7 = *((_BYTE *)v4 + 76);
      goto LABEL_41;
    }

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    uint64_t v4 = 2654435761LL * self->_certCached;
  }
  else {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = (unint64_t)-[NSData hash](self->_serializedPrerecord, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    unint64_t v6 = 2654435761u * self->_lastCloudServicesTriggerTime;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_6:
      unint64_t v7 = 2654435761u * self->_lastEscrowAttemptTime;
      if ((*(_BYTE *)&self->_has & 0x20) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v8 = 0LL;
      if ((*(_BYTE *)&self->_has & 8) != 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }

  else
  {
    unint64_t v6 = 0LL;
    if ((*(_BYTE *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }

  unint64_t v7 = 0LL;
  if ((*(_BYTE *)&self->_has & 0x20) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = 2654435761LL * self->_uploadCompleted;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_uploadRetries;
    goto LABEL_13;
  }

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 8))
  {
    -[SecEscrowPendingRecord setUuid:](self, "setUuid:");
    id v4 = v6;
  }

  if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    self->_certCached = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 0x10u;
  }

  if (*((void *)v4 + 6))
  {
    -[SecEscrowPendingRecord setSerializedPrerecord:](self, "setSerializedPrerecord:");
    id v4 = v6;
  }

  char v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 1) != 0)
  {
    self->_lastCloudServicesTriggerTime = *((void *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    char v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }

  else if ((*((_BYTE *)v4 + 76) & 2) == 0)
  {
    goto LABEL_9;
  }

  self->_lastEscrowAttemptTime = *((void *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  char v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)certCached
{
  return self->_certCached;
}

- (NSData)serializedPrerecord
{
  return self->_serializedPrerecord;
}

- (void)setSerializedPrerecord:(id)a3
{
}

- (unint64_t)lastCloudServicesTriggerTime
{
  return self->_lastCloudServicesTriggerTime;
}

- (unint64_t)lastEscrowAttemptTime
{
  return self->_lastEscrowAttemptTime;
}

- (BOOL)uploadCompleted
{
  return self->_uploadCompleted;
}

- (unint64_t)uploadRetries
{
  return self->_uploadRetries;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (unint64_t)triggerRequestTime
{
  return self->_triggerRequestTime;
}

- (NSData)serializedReason
{
  return self->_serializedReason;
}

- (void)setSerializedReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end