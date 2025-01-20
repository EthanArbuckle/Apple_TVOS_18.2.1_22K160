@interface IdsDeviceMutation
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)accountMismatch;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceMutation)init;
- (IdsMutation)idsMutation;
- (NSData)accountKeyHash;
- (NSData)clientDataHash;
- (NSData)deviceIdHash;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (unint64_t)appVersion;
- (unint64_t)expiryMs;
- (unint64_t)parsedLength;
- (void)setAccountKeyHash:(id)a3;
- (void)setAccountMismatch:(BOOL)a3;
- (void)setAppVersion:(unint64_t)a3;
- (void)setClientDataHash:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setExpiryMs:(unint64_t)a3;
- (void)setIdsMutation:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsDeviceMutation

- (IdsDeviceMutation)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IdsDeviceMutation;
  return -[IdsDeviceMutation init](&v3, "init");
}

- (id)data
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation accountKeyHash](self, "accountKeyHash"));
  unsigned int v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (!v5) {
    goto LABEL_14;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation deviceIdHash](self, "deviceIdHash"));
  unsigned int v7 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v6, v3);

  if (!v7) {
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation clientDataHash](self, "clientDataHash"));
  unsigned int v9 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v8, v3);

  if (!v9
    || !-[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[IdsDeviceMutation appVersion](self, "appVersion"),  v3))
  {
    goto LABEL_14;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation idsMutation](self, "idsMutation"));
  unsigned int v11 = [v10 mutationType];

  BOOL v12 = v11 == 1 && -[IdsDeviceMutation accountMismatch](self, "accountMismatch");
  if (-[TLSMessageClass encodeBool:buffer:](self, "encodeBool:buffer:", v12, v3)
    && ((v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation idsMutation](self, "idsMutation")),
         unsigned int v14 = [v13 mutationType],
         v13,
         v14 != 1)
      ? (unint64_t v15 = 0LL)
      : (unint64_t v15 = -[IdsDeviceMutation expiryMs](self, "expiryMs")),
        -[TLSMessageClass encodeUint64:buffer:](self, "encodeUint64:buffer:", v15, v3)))
  {
    id v16 = v3;
  }

  else
  {
LABEL_14:
    id v16 = 0LL;
  }

  return v16;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  id v8 = v6;
  id v9 = [v8 bytes];
  v10 = (char *)[v8 length] + (void)v9;
  id v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  id v35 = 0LL;
  id v13 = [v12 parseHashValue:v7 end:v10 result:&v35];
  id v14 = v35;
  if (v13)
  {
    [v12 setAccountKeyHash:v14];
    id v34 = 0LL;
    id v15 = [v12 parseHashValue:v13 end:v10 result:&v34];
    id v16 = v34;
    if (!v15)
    {
      id v25 = 0LL;
      if (a4) {
        *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -243LL,  @"failed to parse device ID from Mutation"));
      }
      goto LABEL_25;
    }

    [v12 setDeviceIdHash:v16];
    id v33 = 0LL;
    id v17 = [v12 parseHashValue:v15 end:v10 result:&v33];
    id v18 = v33;
    if (v17)
    {
      [v12 setClientDataHash:v18];
      uint64_t v32 = 0LL;
      id v19 = [v12 parseUint64:v17 end:v10 result:&v32];
      if (v19)
      {
        id v20 = v19;
        [v12 setAppVersion:v32];
        unsigned __int8 v31 = 0;
        [v12 setAccountMismatch:0];
        id v21 = [v12 parseBool:v20 end:v10 result:&v31];
        if (v21)
        {
          id v22 = v21;
          [v12 setAccountMismatch:v31];
          uint64_t v30 = 0LL;
          v23 = [v12 parseUint64:v22 end:v10 result:&v30];
          if (v23)
          {
            v24 = v23;
            [v12 setExpiryMs:v30];
            objc_msgSend(v12, "setParsedLength:", v24 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "bytes"));
            id v25 = v12;
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }

          if (a4)
          {
            uint64_t v26 = kTransparencyErrorDecode;
            v27 = @"failed to parse expiry timestamp from Mutation";
            uint64_t v28 = -247LL;
            goto LABEL_22;
          }

- (id)debugDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_accountKeyHash, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_deviceIdHash, "kt_hexString"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\t\taccountKeyHash:%@\n\t\tdeviceIdHash:%@\n\t\tclientDataHash:%@\n\t\tapplicationVersion:%llu\n\t\taccountMismatch:%lu\n\t\texpiryMs:%llu\n}",  v3,  v4,  v5,  self->_appVersion,  self->_accountMismatch,  self->_expiryMs));

  return v6;
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_accountKeyHash, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_deviceIdHash, "kt_hexString"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"accountKeyHash:%@; deviceIdHash::%@; clientDataHash:%@; applicationVersion:%llu; accountMismatch:%lu; expiryMs:%llu",
                   v3,
                   v4,
                   v5,
                   self->_appVersion,
                   self->_accountMismatch,
                   self->_expiryMs));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = (IdsDeviceMutation *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutation, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation data](self, "data"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (IdsMutation)idsMutation
{
  return (IdsMutation *)objc_loadWeakRetained((id *)&self->_idsMutation);
}

- (void)setIdsMutation:(id)a3
{
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDeviceIdHash:(id)a3
{
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setClientDataHash:(id)a3
{
}

- (unint64_t)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(unint64_t)a3
{
  self->_appVersion = a3;
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
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation accountKeyHash](self, "accountKeyHash"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  [v3 setObject:v5 forKeyedSubscript:@"accountKeyHash"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation deviceIdHash](self, "deviceIdHash"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
  [v3 setObject:v7 forKeyedSubscript:@"deviceIdHash"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceMutation clientDataHash](self, "clientDataHash"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
  [v3 setObject:v9 forKeyedSubscript:@"clientDataHash"];

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IdsDeviceMutation appVersion](self, "appVersion")));
  [v3 setObject:v10 forKeyedSubscript:@"appVersion"];

  if (-[IdsDeviceMutation expiryMs](self, "expiryMs"))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IdsDeviceMutation expiryMs](self, "expiryMs")));
    [v3 setObject:v11 forKeyedSubscript:@"expiryMs"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[IdsDeviceMutation expiryMs](self, "expiryMs") / 0x3E8)));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_toISO_8601_UTCString"));
    [v3 setObject:v13 forKeyedSubscript:@"expiryDateReadable"];
  }

  return v3;
}

@end