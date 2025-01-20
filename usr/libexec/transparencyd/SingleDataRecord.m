@interface SingleDataRecord
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)accountMismatch;
- (BOOL)isEqual:(id)a3;
- (NSData)clientDataHash;
- (NSMutableArray)extensions;
- (SingleDataRecord)init;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (unint64_t)addedMs;
- (unint64_t)appVersion;
- (unint64_t)escrowExpiryMs;
- (unint64_t)expiryMs;
- (unint64_t)markedForDeletionMs;
- (unint64_t)parsedLength;
- (void)setAccountMismatch:(BOOL)a3;
- (void)setAddedMs:(unint64_t)a3;
- (void)setAppVersion:(unint64_t)a3;
- (void)setClientDataHash:(id)a3;
- (void)setEscrowExpiryMs:(unint64_t)a3;
- (void)setExpiryMs:(unint64_t)a3;
- (void)setExtensions:(id)a3;
- (void)setMarkedForDeletionMs:(unint64_t)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation SingleDataRecord

- (SingleDataRecord)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SingleDataRecord;
  v2 = -[SingleDataRecord init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v3;
  }

  return v2;
}

- (id)data
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if (-[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[SingleDataRecord appVersion](self, "appVersion"),  v3)
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord clientDataHash](self, "clientDataHash")),
        unsigned int v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3),
        v4,
        v5)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs"),  v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[SingleDataRecord addedMs](self, "addedMs"),  v3)
    && -[TLSMessageClass encodeBool:buffer:]( self,  "encodeBool:buffer:",  -[SingleDataRecord accountMismatch](self, "accountMismatch"),  v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[SingleDataRecord expiryMs](self, "expiryMs"),  v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs"),  v3)
    && (objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord extensions](self, "extensions")),
        unsigned int v7 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v6, v3),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v3));
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  v10 = objc_alloc_init(&OBJC_CLASS___SingleDataRecord);
  uint64_t v40 = 0LL;
  v11 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v6, v9, &v40);
  if (v11)
  {
    v12 = v11;
    -[SingleDataRecord setAppVersion:](v10, "setAppVersion:", v40);
    id v39 = 0LL;
    v13 = -[TLSMessageClass parseHashValue:end:result:](v10, "parseHashValue:end:result:", v12, v9, &v39);
    id v14 = v39;
    if (v13)
    {
      -[SingleDataRecord setClientDataHash:](v10, "setClientDataHash:", v14);
      uint64_t v38 = 0LL;
      v15 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v13, v9, &v38);
      if (v15)
      {
        v16 = v15;
        -[SingleDataRecord setMarkedForDeletionMs:](v10, "setMarkedForDeletionMs:", v38);
        uint64_t v37 = 0LL;
        v17 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v16, v9, &v37);
        if (v17)
        {
          v18 = v17;
          -[SingleDataRecord setAddedMs:](v10, "setAddedMs:", v37);
          unsigned __int8 v36 = 0;
          v19 = -[TLSMessageClass parseBool:end:result:](v10, "parseBool:end:result:", v18, v9, &v36);
          if (v19)
          {
            v20 = v19;
            -[SingleDataRecord setAccountMismatch:](v10, "setAccountMismatch:", v36);
            uint64_t v35 = 0LL;
            v21 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v20, v9, &v35);
            if (v21)
            {
              v22 = v21;
              -[SingleDataRecord setExpiryMs:](v10, "setExpiryMs:", v35);
              uint64_t v34 = 0LL;
              v23 = -[TLSMessageClass parseUint64:end:result:](v10, "parseUint64:end:result:", v22, v9, &v34);
              if (v23)
              {
                v24 = v23;
                -[SingleDataRecord setEscrowExpiryMs:](v10, "setEscrowExpiryMs:", v34);
                id v33 = 0LL;
                v25 = -[TLSMessageClass parseExtensions:end:result:](v10, "parseExtensions:end:result:", v24, v9, &v33);
                id v26 = v33;
                if (v25)
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithArray:]( &OBJC_CLASS___NSMutableArray,  "arrayWithArray:",  v26));
                  -[SingleDataRecord setExtensions:](v10, "setExtensions:", v27);

                  -[SingleDataRecord setParsedLength:]( v10,  "setParsedLength:",  v25 - (_BYTE *)[objc_retainAutorelease(v7) bytes]);
                  v28 = v10;
                }

                else
                {
                  v28 = 0LL;
                  if (a4) {
                    *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -256LL,  @"failed to parse extensions from SingleDataRecord"));
                  }
                }

                goto LABEL_27;
              }

              if (a4)
              {
                uint64_t v29 = kTransparencyErrorDecode;
                v30 = @"failed to parse escrow expiry timestamp from SingleDataRecord";
                uint64_t v31 = -255LL;
                goto LABEL_25;
              }

- (id)debugDescription
{
  unint64_t appVersion = self->_appVersion;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\tapplicationVersion:%llu\n\tclientDataHash:%@\n\taccountMismatch:%d\n\tmarkedMs:%llu\n\taddedMs:%llu\n\texpiryMs:%llu\n\tescrowExpiryMs:%llu\n}",  appVersion,  v4,  self->_accountMismatch,  self->_markedForDeletionMs,  self->_addedMs,  self->_expiryMs,  self->_escrowExpiryMs));

  return v5;
}

- (id)description
{
  unint64_t appVersion = self->_appVersion;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"applicationVersion:%llu; clientDataHash:%@; accountMismatch:%d; markedMs:%llu; addedMs:%llu; expiryMs:%llu; escrowExpiryMs:%llu;",
                   appVersion,
                   v4,
                   self->_accountMismatch,
                   self->_markedForDeletionMs,
                   self->_addedMs,
                   self->_expiryMs,
                   self->_escrowExpiryMs));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SingleDataRecord *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___SingleDataRecord, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_unint64_t appVersion = a3;
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (unint64_t)markedForDeletionMs
{
  return self->_markedForDeletionMs;
}

- (void)setMarkedForDeletionMs:(unint64_t)a3
{
  self->_markedForDeletionMs = a3;
}

- (unint64_t)addedMs
{
  return self->_addedMs;
}

- (void)setAddedMs:(unint64_t)a3
{
  self->_addedMs = a3;
}

- (BOOL)accountMismatch
{
  return self->_accountMismatch;
}

- (void)setAccountMismatch:(BOOL)a3
{
  self->_accountMismatch = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
}

- (unint64_t)escrowExpiryMs
{
  return self->_escrowExpiryMs;
}

- (void)setEscrowExpiryMs:(unint64_t)a3
{
  self->_escrowExpiryMs = a3;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setExtensions:(id)a3
{
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
}

- (id)diagnosticsJsonDictionary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SingleDataRecord appVersion](self, "appVersion")));
  [v3 setObject:v4 forKeyedSubscript:@"appVersion"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SingleDataRecord clientDataHash](self, "clientDataHash"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  [v3 setObject:v6 forKeyedSubscript:@"clientDataHash"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SingleDataRecord addedMs](self, "addedMs")));
  [v3 setObject:v7 forKeyedSubscript:@"addedMs"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[SingleDataRecord addedMs](self, "addedMs") / 0x3E8)));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_toISO_8601_UTCString"));
  [v3 setObject:v9 forKeyedSubscript:@"addedDateReadable"];

  if (-[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs"))
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs")));
    [v3 setObject:v10 forKeyedSubscript:@"markedForDeltionMs"];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[SingleDataRecord markedForDeletionMs](self, "markedForDeletionMs") / 0x3E8)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_toISO_8601_UTCString"));
    [v3 setObject:v12 forKeyedSubscript:@"markedDateReadable"];
  }

  if (-[SingleDataRecord expiryMs](self, "expiryMs"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SingleDataRecord expiryMs](self, "expiryMs")));
    [v3 setObject:v13 forKeyedSubscript:@"expiryMs"];

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[SingleDataRecord expiryMs](self, "expiryMs") / 0x3E8)));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_toISO_8601_UTCString"));
    [v3 setObject:v15 forKeyedSubscript:@"expiryDateReadable"];
  }

  if (-[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs")));
    [v3 setObject:v16 forKeyedSubscript:@"escrowExpiryMs"];

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[SingleDataRecord escrowExpiryMs](self, "escrowExpiryMs") / 0x3E8)));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_toISO_8601_UTCString"));
    [v3 setObject:v18 forKeyedSubscript:@"escrowExpiryDateReadable"];
  }

  return v3;
}

@end