@interface OptInOutMutation
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)optIn;
- (IdsMutation)idsMutation;
- (NSData)accountKeyHash;
- (NSMutableArray)devicesArray;
- (NSMutableArray)extensions;
- (OptInOutMutation)init;
- (id)data;
- (id)description;
- (unint64_t)parsedLength;
- (unint64_t)timestampMs;
- (void)setAccountKeyHash:(id)a3;
- (void)setDevicesArray:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setIdsMutation:(id)a3;
- (void)setOptIn:(BOOL)a3;
- (void)setParsedLength:(unint64_t)a3;
- (void)setTimestampMs:(unint64_t)a3;
@end

@implementation OptInOutMutation

- (OptInOutMutation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___OptInOutMutation;
  v2 = -[OptInOutMutation init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[OptInOutMutation setExtensions:](v2, "setExtensions:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[OptInOutMutation setDevicesArray:](v2, "setDevicesArray:", v4);
  }

  return v2;
}

- (id)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation accountKeyHash](self, "accountKeyHash"));
  unsigned int v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && -[TLSMessageClass encodeBool:buffer:](self, "encodeBool:buffer:", -[OptInOutMutation optIn](self, "optIn"), v3)
    && -[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[OptInOutMutation timestampMs](self, "timestampMs"),  v3))
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation devicesArray](self, "devicesArray", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) data]);
          if (!v12)
          {

            goto LABEL_18;
          }

          v13 = (void *)v12;
          [v6 appendData:v12];

          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v14 = 0LL;
    if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  v6,  0LL,  0xFFFFLL,  v3))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation extensions](self, "extensions"));
      unsigned int v16 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v15, v3);

      if (v16) {
        id v14 = v3;
      }
      else {
LABEL_18:
      }
        id v14 = 0LL;
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 bytes];
  id v8 = v6;
  id v9 = [v8 bytes];
  uint64_t v10 = (char *)[v8 length] + (void)v9;
  id v12 = objc_alloc_init((Class)objc_opt_class(a1, v11));
  id v45 = 0LL;
  id v13 = [v12 parseHashValue:v7 end:v10 result:&v45];
  id v14 = v45;
  if (v13)
  {
    [v12 setAccountKeyHash:v14];
    unsigned __int8 v44 = 0;
    id v15 = [v12 parseBool:v13 end:v10 result:&v44];
    if (v15)
    {
      id v16 = v15;
      [v12 setOptIn:v44];
      uint64_t v43 = 0LL;
      id v17 = [v12 parseUint64:v16 end:v10 result:&v43];
      if (v17)
      {
        id v18 = v17;
        [v12 setTimestampMs:v43];
        id v42 = 0LL;
        id v19 = [v12 parseByteArray:v18 end:v10 minLength:0 maxLength:0xFFFFLL result:&v42];
        id v20 = v42;
        id v21 = v20;
        if (!v19)
        {
          id v30 = 0LL;
          if (a4) {
            *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -360LL,  @"failed to parse devices from OptInOut"));
          }
          goto LABEL_29;
        }

        v36 = a4;
        id v37 = v19;
        if ([v20 length])
        {
          while (1)
          {
            id v41 = 0LL;
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[IdsDeviceState parseFromData:error:]( &OBJC_CLASS___IdsDeviceState,  "parseFromData:error:",  v21,  &v41));
            id v23 = v41;
            v24 = v23;
            if (!v22) {
              break;
            }
            v25 = (void *)objc_claimAutoreleasedReturnValue([v12 devicesArray]);
            [v25 addObject:v22];

            id v26 = v21;
            id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  (char *)[v22 parsedLength] + (void)objc_msgSend(v26, "bytes"),  (_BYTE *)objc_msgSend(v26, "length") - (_BYTE *)objc_msgSend(v22, "parsedLength")));

            if (![v21 length]) {
              goto LABEL_8;
            }
          }

          if (a4 && v23) {
            *a4 = v23;
          }

          id v30 = 0LL;
          goto LABEL_29;
        }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation accountKeyHash](self, "accountKeyHash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kt_hexString"));
  if (-[OptInOutMutation optIn](self, "optIn")) {
    unsigned int v5 = @"YES";
  }
  else {
    unsigned int v5 = @"NO";
  }
  unint64_t v6 = -[OptInOutMutation timestampMs](self, "timestampMs");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation devicesArray](self, "devicesArray"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"accountKeyHash:%@, optIn:%@; timestampMs:%llu, devices: %@",
                   v4,
                   v5,
                   v6,
                   v7));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = (OptInOutMutation *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___OptInOutMutation, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation data](self, "data"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OptInOutMutation data](v7, "data"));

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

- (BOOL)optIn
{
  return self->_optIn;
}

- (void)setOptIn:(BOOL)a3
{
  self->_optIn = a3;
}

- (unint64_t)timestampMs
{
  return self->_timestampMs;
}

- (void)setTimestampMs:(unint64_t)a3
{
  self->_timestampMs = a3;
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSMutableArray)devicesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDevicesArray:(id)a3
{
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