@interface KTClientDataRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)active:(id)a3;
- (BOOL)expired:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)marked:(id)a3;
- (BOOL)shouldRemove;
- (BOOL)synced;
- (BOOL)verified;
- (KTClientDataRecord)initWithCoder:(id)a3;
- (KTClientDataRecord)initWithMutation:(id)a3;
- (KTClientDataRecord)initWithSingleDataRecord:(id)a3;
- (NSData)clientData;
- (NSData)clientDataHash;
- (NSDate)addedDate;
- (NSDate)escrowExpiry;
- (NSDate)expiry;
- (NSDate)markedForDeletion;
- (NSDictionary)diagnosticsJsonDictionary;
- (id)debugDescription;
- (id)description;
- (unint64_t)applicationVersion;
- (void)encodeWithCoder:(id)a3;
- (void)markWithMutationMs:(unint64_t)a3;
- (void)setAddedDate:(id)a3;
- (void)setApplicationVersion:(unint64_t)a3;
- (void)setClientData:(id)a3;
- (void)setClientDataHash:(id)a3;
- (void)setEscrowExpiry:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setMarkedForDeletion:(id)a3;
- (void)setSynced:(BOOL)a3;
- (void)setVerified:(BOOL)a3;
- (void)updateWithAddMutation:(id)a3 error:(id *)a4;
- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4;
@end

@implementation KTClientDataRecord

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientData, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\tclientData:%@\n\tclientDataHash:%@\n\tapplicationVersion:%lu\n\taddedDate:%@\n\tmarkedForDeletion:%@\n\texpiry:%@\n\tescrowExpiry:%@\n}",  v3,  v4,  self->_applicationVersion,  self->_addedDate,  self->_markedForDeletion,  self->_expiry,  self->_escrowExpiry));

  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientData, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"clientData:%@; clientDataHash:%@; applicationVersion:%lu; addedDate:%@; markedForDeletion:%@; expiry:%@; escrowExpiry:%@",
                   v3,
                   v4,
                   self->_applicationVersion,
                   self->_addedDate,
                   self->_markedForDeletion,
                   self->_expiry,
                   self->_escrowExpiry));

  return v5;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    [v3 setObject:v6 forKeyedSubscript:@"clientData"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  [v3 setObject:v8 forKeyedSubscript:@"clientDataHash"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[KTClientDataRecord applicationVersion](self, "applicationVersion")));
  [v3 setObject:v9 forKeyedSubscript:@"appVersion"];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_dateToString"));
  [v3 setObject:v11 forKeyedSubscript:@"addedDate"];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_toISO_8601_UTCString"));
  [v3 setObject:v13 forKeyedSubscript:@"addedDateReadable"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_dateToString"));
    [v3 setObject:v16 forKeyedSubscript:@"markedDate"];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_toISO_8601_UTCString"));
    [v3 setObject:v18 forKeyedSubscript:@"markedDateReadable"];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_dateToString"));
  [v3 setObject:v20 forKeyedSubscript:@"expiry"];

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "kt_toISO_8601_UTCString"));
  [v3 setObject:v22 forKeyedSubscript:@"expiryReadable"];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "kt_dateToString"));
    [v3 setObject:v25 forKeyedSubscript:@"escrowExpiry"];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "kt_toISO_8601_UTCString"));
    [v3 setObject:v27 forKeyedSubscript:@"escrowExpiryReadable"];
  }

  if (-[KTClientDataRecord verified](self, "verified"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[KTClientDataRecord verified](self, "verified")));
    [v3 setObject:v28 forKeyedSubscript:@"matchesServerData"];
  }

  if (-[KTClientDataRecord synced](self, "synced"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[KTClientDataRecord synced](self, "synced")));
    [v3 setObject:v29 forKeyedSubscript:@"matchesSyncedData"];
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  unint64_t v4 = -[KTClientDataRecord applicationVersion](self, "applicationVersion");
  if (v4 > 0xFFFFFFFE) {
    abort();
  }
  unint64_t v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
  [v12 encodeObject:v6 forKey:@"clientData"];

  [v12 encodeInteger:v5 forKey:@"applicationVersion"];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
  [v12 encodeObject:v7 forKey:@"clientDataHash"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  [v8 timeIntervalSince1970];
  objc_msgSend(v12, "encodeDouble:forKey:", @"markedForDeletion");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
  [v9 timeIntervalSince1970];
  objc_msgSend(v12, "encodeDouble:forKey:", @"addedDate");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
  [v10 timeIntervalSince1970];
  objc_msgSend(v12, "encodeDouble:forKey:", @"expiry");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
  [v11 timeIntervalSince1970];
  objc_msgSend(v12, "encodeDouble:forKey:", @"escrowExpiry");

  objc_msgSend(v12, "encodeBool:forKey:", -[KTClientDataRecord verified](self, "verified"), @"verified");
  objc_msgSend(v12, "encodeBool:forKey:", -[KTClientDataRecord synced](self, "synced"), @"synced");
}

- (KTClientDataRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"clientData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  unint64_t v8 = (unint64_t)[v4 decodeIntegerForKey:@"applicationVersion"];
  if ((v8 & 0x8000000000000000LL) != 0) {
    abort();
  }
  unint64_t v10 = v8;
  id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v9),  @"clientDataHash");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned int v25 = [v4 decodeBoolForKey:@"verified"];
  unsigned int v24 = [v4 decodeBoolForKey:@"synced"];
  [v4 decodeDoubleForKey:@"markedForDeletion"];
  if (v13 <= 0.0) {
    v14 = 0LL;
  }
  else {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }
  [v4 decodeDoubleForKey:@"addedDate"];
  if (v15 <= 0.0) {
    v16 = 0LL;
  }
  else {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }
  [v4 decodeDoubleForKey:@"expiry"];
  if (v17 <= 0.0) {
    v18 = 0LL;
  }
  else {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }
  [v4 decodeDoubleForKey:@"escrowExpiry"];
  if (v19 <= 0.0) {
    v20 = 0LL;
  }
  else {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  }
  v21 = objc_alloc_init(&OBJC_CLASS___KTClientDataRecord);
  v22 = v21;
  if (v21)
  {
    -[KTClientDataRecord setClientData:](v21, "setClientData:", v7);
    -[KTClientDataRecord setApplicationVersion:](v22, "setApplicationVersion:", v10);
    -[KTClientDataRecord setClientDataHash:](v22, "setClientDataHash:", v12);
    -[KTClientDataRecord setMarkedForDeletion:](v22, "setMarkedForDeletion:", v14);
    -[KTClientDataRecord setAddedDate:](v22, "setAddedDate:", v16);
    -[KTClientDataRecord setExpiry:](v22, "setExpiry:", v18);
    -[KTClientDataRecord setEscrowExpiry:](v22, "setEscrowExpiry:", v20);
    -[KTClientDataRecord setVerified:](v22, "setVerified:", v25);
    -[KTClientDataRecord setSynced:](v22, "setSynced:", v24);
  }

  return v22;
}

- (KTClientDataRecord)initWithMutation:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___KTClientDataRecord;
  uint64_t v5 = -[KTClientDataRecord init](&v22, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 clientDataHash]);
    clientDataHash = v5->_clientDataHash;
    v5->_clientDataHash = (NSData *)v6;

    v5->_applicationVersion = (unint64_t)[v4 appVersion];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 idsMutation]);
    if ([v8 mutationType] == 1)
    {
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 idsMutation]);
      unsigned int v10 = [v9 mutationType];

      if (v10 != 4)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v4 idsMutation]);
        if ([v16 mutationType] == 2)
        {
        }

        else
        {
          double v17 = (void *)objc_claimAutoreleasedReturnValue([v4 idsMutation]);
          unsigned int v18 = [v17 mutationType];

          if (v18 != 5) {
            goto LABEL_12;
          }
        }

        expiry = (NSDate *)objc_claimAutoreleasedReturnValue([v4 idsMutation]);
        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)-[NSDate mutationMs](expiry, "mutationMs") / 1000.0));
        markedForDeletion = v5->_markedForDeletion;
        v5->_markedForDeletion = (NSDate *)v19;

        goto LABEL_11;
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 idsMutation]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v11 mutationMs] / 1000.0));
    addedDate = v5->_addedDate;
    v5->_addedDate = (NSDate *)v12;

    if ([v4 expiryMs])
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 expiryMs] / 1000.0));
      expiry = v5->_expiry;
      v5->_expiry = (NSDate *)v14;
LABEL_11:
    }
  }

- (KTClientDataRecord)initWithSingleDataRecord:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KTClientDataRecord;
  uint64_t v5 = -[KTClientDataRecord init](&v17, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 clientDataHash]);
    clientDataHash = v5->_clientDataHash;
    v5->_clientDataHash = (NSData *)v6;

    v5->_applicationVersion = (unint64_t)[v4 appVersion];
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 addedMs] / 1000.0));
    addedDate = v5->_addedDate;
    v5->_addedDate = (NSDate *)v8;

    if ([v4 markedForDeletionMs])
    {
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 markedForDeletionMs] / 1000.0));
      markedForDeletion = v5->_markedForDeletion;
      v5->_markedForDeletion = (NSDate *)v10;
    }

    else
    {
      markedForDeletion = v5->_markedForDeletion;
      v5->_markedForDeletion = 0LL;
    }

    if ([v4 expiryMs])
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 expiryMs] / 1000.0));
      expiry = v5->_expiry;
      v5->_expiry = (NSDate *)v12;
    }

    if ([v4 escrowExpiryMs])
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v4 escrowExpiryMs] / 1000.0));
      escrowExpiry = v5->_escrowExpiry;
      v5->_escrowExpiry = (NSDate *)v14;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (KTClientDataRecord *)a3;
  if (self == v5)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___KTClientDataRecord, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](v7, "clientData"));
      if (v8 == (void *)v9)
      {
      }

      else
      {
        uint64_t v10 = (void *)v9;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](self, "clientData"));
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientData](v7, "clientData"));
        unsigned int v13 = [v11 isEqualToData:v12];

        if (!v13) {
          goto LABEL_32;
        }
      }

      id v15 = -[KTClientDataRecord applicationVersion](self, "applicationVersion");
      if (v15 == (id)-[KTClientDataRecord applicationVersion](v7, "applicationVersion"))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
        uint64_t v17 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](v7, "clientDataHash"));
        if (v16 == (void *)v17)
        {
        }

        else
        {
          unsigned int v18 = (void *)v17;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](self, "clientDataHash"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord clientDataHash](v7, "clientDataHash"));
          unsigned int v21 = [v19 isEqualToData:v20];

          if (!v21) {
            goto LABEL_32;
          }
        }

        objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
        uint64_t v23 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](v7, "addedDate"));
        if (v22 == (void *)v23)
        {
        }

        else
        {
          unsigned int v24 = (void *)v23;
          unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](self, "addedDate"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord addedDate](v7, "addedDate"));
          unsigned int v27 = objc_msgSend(v25, "kt_isEqualWithinOneMillisecond:", v26);

          if (!v27) {
            goto LABEL_32;
          }
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
        uint64_t v29 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](v7, "markedForDeletion"));
        if (v28 == (void *)v29)
        {
        }

        else
        {
          v30 = (void *)v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](v7, "markedForDeletion"));
          unsigned int v33 = objc_msgSend(v31, "kt_isEqualWithinOneMillisecond:", v32);

          if (!v33) {
            goto LABEL_32;
          }
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
        uint64_t v35 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](v7, "expiry"));
        if (v34 == (void *)v35)
        {
        }

        else
        {
          v36 = (void *)v35;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](v7, "expiry"));
          unsigned int v39 = objc_msgSend(v37, "kt_isEqualWithinOneMillisecond:", v38);

          if (!v39) {
            goto LABEL_32;
          }
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
        uint64_t v41 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](v7, "escrowExpiry"));
        if (v40 == (void *)v41)
        {
        }

        else
        {
          v42 = (void *)v41;
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](v7, "escrowExpiry"));
          unsigned int v45 = objc_msgSend(v43, "kt_isEqualWithinOneMillisecond:", v44);

          if (!v45) {
            goto LABEL_32;
          }
        }

        unsigned int v46 = -[KTClientDataRecord verified](self, "verified");
        if (v46 == -[KTClientDataRecord verified](v7, "verified"))
        {
          unsigned int v47 = -[KTClientDataRecord synced](self, "synced");
          if (v47 == -[KTClientDataRecord synced](v7, "synced"))
          {
            BOOL v14 = 1;
            goto LABEL_33;
          }
        }
      }

- (BOOL)marked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
    BOOL v7 = [v6 compare:v4] == (id)-1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)expired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
    BOOL v7 = [v6 compare:v4] == (id)-1;
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)active:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  if (v5
    && (uint64_t v6 = (void *)v5,
        BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion")),
        id v8 = [v7 compare:v4],
        v7,
        v6,
        v8 == (id)-1LL))
  {
    BOOL v12 = 0;
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
      BOOL v12 = [v11 compare:v4] != (id)-1;
    }

    else
    {
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (void)markWithMutationMs:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));

  if (!v5)
  {
    double v6 = (double)a3 / 1000.0;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:", v6));
    -[KTClientDataRecord setMarkedForDeletion:](self, "setMarkedForDeletion:", v7);

    -[KTClientDataRecord setExpiry:](self, "setExpiry:", 0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  v6 + (double)kKTEscrowExpiryPeriod));
    -[KTClientDataRecord setEscrowExpiry:](self, "setEscrowExpiry:", v8);
  }

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v16 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v16 idsMutation]);
  id v6 = [v5 mutationMs];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)v6 / 1000.0));
  if (-[KTClientDataRecord marked:](self, "marked:", v7) || -[KTClientDataRecord expired:](self, "expired:", v7))
  {
    -[KTClientDataRecord setMarkedForDeletion:](self, "setMarkedForDeletion:", 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)v6 / 1000.0));
    -[KTClientDataRecord setAddedDate:](self, "setAddedDate:", v8);

    if ([v16 expiryMs])
    {
LABEL_4:
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)[v16 expiryMs] / 1000.0));
      -[KTClientDataRecord setExpiry:](self, "setExpiry:", v9);

      id v10 = [v16 expiryMs];
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)v10 / 1000.0 + (double)kKTEscrowExpiryPeriod));
      -[KTClientDataRecord setEscrowExpiry:](self, "setEscrowExpiry:", v11);
    }
  }

  else if ([v16 expiryMs])
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord expiry](self, "expiry"));
    [v12 timeIntervalSince1970];
    double v14 = vabdd_f64(v13, (double)((unint64_t)[v16 expiryMs] / 0x3E8));
    double v15 = (double)kKTExpiryGracePeriod;

    if (v14 > v15) {
      goto LABEL_4;
    }
  }
}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 idsMutation]);
  id v6 = [v5 mutationMs];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord markedForDeletion](self, "markedForDeletion"));
  if (v7)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(unint64_t)v6 / 1000.0 + (double)kKTEscrowExpiryPeriod));
    -[KTClientDataRecord setEscrowExpiry:](self, "setEscrowExpiry:", v8);
  }

  else
  {
    -[KTClientDataRecord markWithMutationMs:](self, "markWithMutationMs:", v6);
  }

- (BOOL)shouldRemove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTClientDataRecord escrowExpiry](self, "escrowExpiry"));
  BOOL v5 = [v3 compare:v4] == (id)1;

  return v5;
}

- (NSData)clientData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClientData:(id)a3
{
}

- (unint64_t)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(unint64_t)a3
{
  self->_applicationVersion = a3;
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (NSDate)markedForDeletion
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setMarkedForDeletion:(id)a3
{
}

- (NSDate)addedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setAddedDate:(id)a3
{
}

- (NSDate)expiry
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setExpiry:(id)a3
{
}

- (NSDate)escrowExpiry
{
  return (NSDate *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setEscrowExpiry:(id)a3
{
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (BOOL)synced
{
  return self->_synced;
}

- (void)setSynced:(BOOL)a3
{
  self->_synced = a3;
}

- (void).cxx_destruct
{
}

@end