@interface IdsDevice
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsDevice)init;
- (NSData)deviceIdHash;
- (NSMutableArray)clientDataArray;
- (NSMutableArray)extensions;
- (id)data;
- (id)debugDescription;
- (id)diagnosticsJsonDictionary;
- (unint64_t)parsedLength;
- (void)setClientDataArray:(id)a3;
- (void)setDeviceIdHash:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsDevice

- (IdsDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IdsDevice;
  v2 = -[IdsDevice init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clientDataArray = v2->_clientDataArray;
    v2->_clientDataArray = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;
  }

  return v2;
}

- (id)data
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice deviceIdHash](self, "deviceIdHash"));
  unsigned int v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](self, "clientDataArray")),
        id v7 = [v6 count],
        v6,
        v7))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](self, "clientDataArray", 0LL));
    id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) data]);
          if (!v14)
          {

            goto LABEL_16;
          }

          v15 = (void *)v14;
          [v8 appendData:v14];

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  v8,  1LL,  0xFFFFLL,  v3)
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice extensions](self, "extensions")),
          unsigned int v17 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v16, v3),
          v16,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v3));
    }

    else
    {
LABEL_16:
      v18 = 0LL;
    }
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  id v10 = objc_alloc_init(&OBJC_CLASS___IdsDevice);
  id v30 = 0LL;
  id v11 = -[TLSMessageClass parseHashValue:end:result:](v10, "parseHashValue:end:result:", v6, v9, &v30);
  id v12 = v30;
  if (v11)
  {
    -[IdsDevice setDeviceIdHash:](v10, "setDeviceIdHash:", v12);
    id v29 = 0LL;
    v13 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:]( v10,  "parseByteArray:end:minLength:maxLength:result:",  v11,  v9,  1LL,  0xFFFFLL,  &v29);
    id v14 = v29;
    v15 = v14;
    if (v13)
    {
      id v26 = v12;
      if (![v14 length])
      {
LABEL_6:
        id v27 = 0LL;
        __int128 v21 = -[TLSMessageClass parseExtensions:end:result:](v10, "parseExtensions:end:result:", v13, v9, &v27);
        id v22 = v27;
        if (v21)
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v22));
          -[IdsDevice setExtensions:](v10, "setExtensions:", v23);

          -[IdsDevice setParsedLength:]( v10,  "setParsedLength:",  v21 - (_BYTE *)[objc_retainAutorelease(v7) bytes]);
          v24 = v10;
        }

        else
        {
          v24 = 0LL;
          if (a4) {
            *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -259LL,  @"failed to parse extensions from IdsDevice"));
          }
        }

        id v12 = v26;

        goto LABEL_21;
      }

      while (1)
      {
        id v28 = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue( +[SingleDataRecord parseFromData:error:]( &OBJC_CLASS___SingleDataRecord,  "parseFromData:error:",  v15,  &v28));
        id v17 = v28;
        v18 = v17;
        if (!v16) {
          break;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](v10, "clientDataArray"));
        [v19 addObject:v16];

        id v20 = v15;
        v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  (char *)[v16 parsedLength] + (void)objc_msgSend(v20, "bytes"),  (_BYTE *)objc_msgSend(v20, "length") - (_BYTE *)objc_msgSend(v16, "parsedLength")));

        if (![v15 length]) {
          goto LABEL_6;
        }
      }

      if (a4 && v17) {
        *a4 = v17;
      }
    }

    else if (a4)
    {
      v24 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -258LL,  @"failed to parse client datas from IdsDevice"));
LABEL_21:

      goto LABEL_22;
    }

    v24 = 0LL;
    goto LABEL_21;
  }

  v24 = 0LL;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -257LL,  @"failed to parse device ID from IdsDevice"));
  }
LABEL_22:

  return v24;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"[\n"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v14 = self;
  obj = self->_clientDataArray;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v7);
        [v3 appendFormat:@"   {\n"];
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientDataHash]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
        [v3 appendFormat:@"    clientDataHash:%@\n", v10];

        objc_msgSend(v3, "appendFormat:", @"    appVersion:%lu\n", objc_msgSend(v8, "appVersion"));
        objc_msgSend( v3,  "appendFormat:",  @"        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n",
          [v8 addedMs],
          [v8 markedForDeletionMs],
          [v8 expiryMs],
          [v8 escrowExpiryMs]);
        [v3 appendFormat:@"   },\n"];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v5);
  }

  [v3 appendFormat:@"  ]"];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v14->_deviceIdHash, "kt_hexString"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n  deviceIdHash:%@\n  clientDatas: %@\n}",  v11,  v3));

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (IdsDevice *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsDevice, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice data](v7, "data"));

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

- (NSMutableArray)clientDataArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClientDataArray:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24LL, 1);
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
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice deviceIdHash](self, "deviceIdHash"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  [v3 setObject:v5 forKeyedSubscript:@"deviceIdHash"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IdsDevice clientDataArray](self, "clientDataArray", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) diagnosticsJsonDictionary]);
        [v6 addObject:v12];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:@"clientDatas"];
  }

  return v3;
}

@end