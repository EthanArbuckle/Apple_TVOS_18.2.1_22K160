@interface IdsDeviceState
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceState)init;
- (NSData)clientDataHash;
- (NSData)deviceIdHash;
- (NSMutableArray)extensions;
- (id)data;
- (id)description;
- (unint64_t)addedMs;
- (unint64_t)appVersion;
- (unint64_t)expiryMs;
- (unint64_t)parsedLength;
- (void)setAddedMs:(unint64_t)a3;
- (void)setAppVersion:(unint64_t)a3;
- (void)setClientDataHash:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setExpiryMs:(unint64_t)a3;
- (void)setExtensions:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsDeviceState

- (IdsDeviceState)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IdsDeviceState;
  v2 = -[IdsDeviceState init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[IdsDeviceState setExtensions:](v2, "setExtensions:", v3);
  }

  return v2;
}

- (id)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState deviceIdHash](self, "deviceIdHash"));
  unsigned int v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState clientDataHash](self, "clientDataHash")),
        unsigned int v7 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v6, v3),
        v6,
        v7)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[IdsDeviceState appVersion](self, "appVersion"),  v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[IdsDeviceState addedMs](self, "addedMs"),  v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[IdsDeviceState expiryMs](self, "expiryMs"),  v3)
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState extensions](self, "extensions")),
        unsigned int v9 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v8, v3),
        v8,
        v9))
  {
    id v10 = v3;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  id v8 = v6;
  id v9 = [v8 bytes];
  id v10 = (char *)[v8 length] + (void)v9;
  id v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  id v36 = 0LL;
  id v13 = [v12 parseHashValue:v7 end:v10 result:&v36];
  id v14 = v36;
  if (v13)
  {
    [v12 setDeviceIdHash:v14];
    id v35 = 0LL;
    id v15 = [v12 parseHashValue:v13 end:v10 result:&v35];
    id v16 = v35;
    if (v15)
    {
      [v12 setClientDataHash:v16];
      uint64_t v34 = 0LL;
      id v17 = [v12 parseUint64:v15 end:v10 result:&v34];
      if (v17)
      {
        id v18 = v17;
        [v12 setAppVersion:v34];
        uint64_t v33 = 0LL;
        id v19 = [v12 parseUint64:v18 end:v10 result:&v33];
        if (v19)
        {
          id v20 = v19;
          [v12 setAddedMs:v33];
          uint64_t v32 = 0LL;
          id v21 = [v12 parseUint64:v20 end:v10 result:&v32];
          if (v21)
          {
            id v22 = v21;
            [v12 setExpiryMs:v32];
            id v31 = 0LL;
            v23 = [v12 parseExtensions:v22 end:v10 result:&v31];
            id v24 = v31;
            if (v23)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v24));
              [v12 setExtensions:v25];

              objc_msgSend(v12, "setParsedLength:", v23 - (_BYTE *)objc_msgSend(objc_retainAutorelease(v8), "bytes"));
              id v26 = v12;
            }

            else
            {
              id v26 = 0LL;
              if (a4) {
                *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -359LL,  @"failed to parse extensions from SingleDataRecord"));
              }
            }

            goto LABEL_24;
          }

          if (a4)
          {
            uint64_t v27 = kTransparencyErrorDecode;
            v28 = @"failed to parse expiry timestamp from DeviceState";
            uint64_t v29 = -358LL;
            goto LABEL_19;
          }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_deviceIdHash, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](self->_clientDataHash, "kt_hexString"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"deviceIdHash:%@; clientDataHash:%@; applicationVersion:%llu; addedMs:%llu; expiryMs:%llu",
                   v3,
                   v4,
                   self->_appVersion,
                   self->_addedMs,
                   self->_expiryMs));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = (IdsDeviceState *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsDeviceState, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState data](self, "data"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDeviceState data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (NSData)deviceIdHash
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDeviceIdHash:(id)a3
{
}

- (NSData)clientDataHash
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
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

- (unint64_t)addedMs
{
  return self->_addedMs;
}

- (void)setAddedMs:(unint64_t)a3
{
  self->_addedMs = a3;
}

- (unint64_t)expiryMs
{
  return self->_expiryMs;
}

- (void)setExpiryMs:(unint64_t)a3
{
  self->_expiryMs = a3;
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48LL, 1);
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

@end