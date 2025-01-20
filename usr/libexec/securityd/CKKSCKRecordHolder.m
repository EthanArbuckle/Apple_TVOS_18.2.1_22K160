@interface CKKSCKRecordHolder
- (BOOL)matchesCKRecord:(id)a3;
- (CKKSCKRecordHolder)initWithCKRecord:(id)a3 contextID:(id)a4;
- (CKKSCKRecordHolder)initWithCKRecordType:(id)a3 encodedCKRecord:(id)a4 contextID:(id)a5 zoneID:(id)a6;
- (CKRecord)storedCKRecord;
- (CKRecordZoneID)zoneID;
- (NSData)encodedCKRecord;
- (NSString)ckRecordType;
- (NSString)contextID;
- (id)CKRecordName;
- (id)CKRecordWithZoneID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (void)setCkRecordType:(id)a3;
- (void)setEncodedCKRecord:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setStoredCKRecord:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCKRecordHolder

- (CKKSCKRecordHolder)initWithCKRecord:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CKKSCKRecordHolder;
  v8 = -[CKKSCKRecordHolder init](&v13, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 zoneID]);
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v10;

    objc_storeStrong((id *)&v8->_contextID, a4);
    -[CKKSCKRecordHolder setFromCKRecord:](v8, "setFromCKRecord:", v6);
  }

  return v8;
}

- (CKKSCKRecordHolder)initWithCKRecordType:(id)a3 encodedCKRecord:(id)a4 contextID:(id)a5 zoneID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CKKSCKRecordHolder;
  v15 = -[CKKSCKRecordHolder init](&v19, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contextID, a5);
    objc_storeStrong((id *)&v16->_zoneID, a6);
    objc_storeStrong((id *)&v16->_ckRecordType, a3);
    objc_storeStrong((id *)&v16->_encodedCKRecord, a4);
    storedCKRecord = v16->_storedCKRecord;
    v16->_storedCKRecord = 0LL;
  }

  return v16;
}

- (CKRecord)storedCKRecord
{
  storedCKRecord = self->_storedCKRecord;
  if (storedCKRecord) {
    return (CKRecord *)-[CKRecord copy](storedCKRecord, "copy");
  }
  if (!self->_encodedCKRecord) {
    return (CKRecord *)0LL;
  }
  v5 = objc_autoreleasePoolPush();
  id v6 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  self->_encodedCKRecord,  0LL);
  id v7 = -[CKRecord initWithCoder:](objc_alloc(&OBJC_CLASS___CKRecord), "initWithCoder:", v6);
  -[NSKeyedUnarchiver finishDecoding](v6, "finishDecoding");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v7, "recordID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
    unsigned __int8 v11 = [v9 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
      id v14 = sub_1000AA6AC(@"ckks", v13);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder zoneID](self, "zoneID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordID](v7, "recordID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneID]);
        int v22 = 138412546;
        v23 = v16;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "mismatching zone ids in a single record: %@ and %@",  (uint8_t *)&v22,  0x16u);
      }
    }
  }

  objc_super v19 = self->_storedCKRecord;
  self->_storedCKRecord = v7;
  v20 = v7;

  id v21 = -[CKRecord copy](v20, "copy");
  objc_autoreleasePoolPop(v5);
  return (CKRecord *)v21;
}

- (void)setStoredCKRecord:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    -[CKKSCKRecordHolder setZoneID:](self, "setZoneID:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v16 recordType]);
    -[CKKSCKRecordHolder setCkRecordType:](self, "setCkRecordType:", v7);

    v8 = objc_autoreleasePoolPush();
    v9 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    [v16 encodeWithCoder:v9];
    uint64_t v10 = (NSData *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v9, "encodedData"));
    encodedCKRecord = self->_encodedCKRecord;
    self->_encodedCKRecord = v10;

    id v12 = (CKRecord *)[v16 copy];
    storedCKRecord = self->_storedCKRecord;
    self->_storedCKRecord = v12;

    objc_autoreleasePoolPop(v8);
  }

  else
  {
    id v14 = self->_encodedCKRecord;
    self->_encodedCKRecord = 0LL;

    v15 = self->_storedCKRecord;
    self->_storedCKRecord = 0LL;
  }
}

- (NSData)encodedCKRecord
{
  return self->_encodedCKRecord;
}

- (void)setEncodedCKRecord:(id)a3
{
  id v6 = a3;
  storedCKRecord = self->_storedCKRecord;
  self->_storedCKRecord = 0LL;
}

- (id)CKRecordWithZoneID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___CKRecordID);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder CKRecordName](self, "CKRecordName"));
  id v7 = -[CKRecordID initWithRecordName:zoneID:](v5, "initWithRecordName:zoneID:", v6, v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder encodedCKRecord](self, "encodedCKRecord"));
  if (v8)
  {
    v9 = (CKRecord *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder storedCKRecord](self, "storedCKRecord"));
  }

  else
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___CKRecord);
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCKRecordHolder ckRecordType](self, "ckRecordType"));
    v9 = -[CKRecord initWithRecordType:recordID:](v10, "initWithRecordType:recordID:", v11, v7);
  }

  id v12 = -[CKRecord copy](v9, "copy");
  id v13 = -[CKKSCKRecordHolder updateCKRecord:zoneID:](self, "updateCKRecord:zoneID:", v9, v4);

  return v9;
}

- (id)CKRecordName
{
  v3 = (objc_class *)objc_opt_class(self);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = NSStringFromSelector(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ must override %@",  v5,  v7));
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v8,  0LL));

  objc_exception_throw(v9);
  return -[CKKSCKRecordHolder updateCKRecord:zoneID:](v10, v11, v12, v13);
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (objc_class *)objc_opt_class(self);
  uint64_t v10 = NSStringFromClass(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = NSStringFromSelector(a2);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ must override %@",  v11,  v13));
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v14,  0LL));

  objc_exception_throw(v15);
  -[CKKSCKRecordHolder setFromCKRecord:](v16, v17, v18);
  return result;
}

- (void)setFromCKRecord:(id)a3
{
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class(self);
  id v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = NSStringFromSelector(a2);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ must override %@",  v8,  v10));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v11,  0LL));

  objc_exception_throw(v12);
  -[CKKSCKRecordHolder matchesCKRecord:](v13, v14, v15);
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class(self);
  id v7 = NSStringFromClass(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = NSStringFromSelector(a2);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  SEL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ must override %@",  v8,  v10));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v11,  0LL));

  objc_exception_throw(v12);
  return -[CKKSCKRecordHolder copyWithZone:](v13, v14, v15);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CKKSCKRecordHolder;
  id v4 = -[CKKSSQLDatabaseObject copyWithZone:](&v10, "copyWithZone:", a3);
  objc_storeStrong(v4 + 4, self->_contextID);
  objc_storeStrong(v4 + 5, self->_zoneID);
  objc_storeStrong(v4 + 6, self->_ckRecordType);
  id v5 = -[NSData copy](self->_encodedCKRecord, "copy");
  id v6 = v4[2];
  v4[2] = v5;

  id v7 = -[CKRecord copy](self->_storedCKRecord, "copy");
  id v8 = v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)ckRecordType
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCkRecordType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end