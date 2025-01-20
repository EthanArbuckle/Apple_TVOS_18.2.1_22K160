@interface IdsAccount
+ (id)encodeOptInOutExtensionData:(id)a3;
+ (id)parseFromData:(id)a3 error:(id *)a4;
+ (id)parseOptInOutExtension:(id)a3 error:(id *)a4;
- (BOOL)hasOptInAfter:(unint64_t)a3;
- (BOOL)isActive:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (IdsAccount)init;
- (NSData)accountKeyHash;
- (NSMutableArray)devicesArray;
- (NSMutableArray)extensions;
- (id)data;
- (id)debugDescription;
- (id)diagnosticsJsonDictionary;
- (id)sortedOptInOutHistory:(id *)a3;
- (unint64_t)parsedLength;
- (void)setAccountKeyHash:(id)a3;
- (void)setDevicesArray:(id)a3;
- (void)setExtensions:(id)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation IdsAccount

- (IdsAccount)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IdsAccount;
  v2 = -[IdsAccount init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    devicesArray = v2->_devicesArray;
    v2->_devicesArray = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;
  }

  return v2;
}

- (id)data
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount accountKeyHash](self, "accountKeyHash"));
  unsigned int v5 = -[TLSMessageClass encodeHashValue:buffer:](self, "encodeHashValue:buffer:", v4, v3);

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray")),
        id v7 = [v6 count],
        v6,
        v7))
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray", 0LL));
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
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount extensions](self, "extensions")),
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
  id v10 = objc_alloc_init(&OBJC_CLASS___IdsAccount);
  id v30 = 0LL;
  id v11 = -[TLSMessageClass parseHashValue:end:result:](v10, "parseHashValue:end:result:", v6, v9, &v30);
  id v12 = v30;
  if (v11)
  {
    -[IdsAccount setAccountKeyHash:](v10, "setAccountKeyHash:", v12);
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
          -[IdsAccount setExtensions:](v10, "setExtensions:", v23);

          -[IdsAccount setParsedLength:]( v10,  "setParsedLength:",  v21 - (_BYTE *)[objc_retainAutorelease(v7) bytes]);
          v24 = v10;
        }

        else
        {
          v24 = 0LL;
          if (a4) {
            *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -262LL,  @"failed to parse extensions from IdsAccount"));
          }
        }

        id v12 = v26;

        goto LABEL_21;
      }

      while (1)
      {
        id v28 = 0LL;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[IdsDevice parseFromData:error:](&OBJC_CLASS___IdsDevice, "parseFromData:error:", v15, &v28));
        id v17 = v28;
        v18 = v17;
        if (!v16) {
          break;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](v10, "devicesArray"));
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
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -261LL,  @"failed to parse devices from IdsAccount"));
LABEL_21:

      goto LABEL_22;
    }

    v24 = 0LL;
    goto LABEL_21;
  }

  v24 = 0LL;
  if (a4) {
    *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -260LL,  @"failed to parse account key from IdsAccount"));
  }
LABEL_22:

  return v24;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"[\n"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v21 = self;
  obj = self->_devicesArray;
  id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    v24 = v3;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v4;
        id v5 = *(void **)(*((void *)&v31 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdHash]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        [v3 appendFormat:@"    deviceIdHash: %@\n", v7];

        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[\n"));
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue([v5 clientDataArray]);
        id v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            v13 = 0LL;
            do
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)v13);
              [v8 appendFormat:@"     {\n"];
              v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientDataHash]);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
              [v8 appendFormat:@"      clientDataHash:%@\n", v16];

              objc_msgSend(v8, "appendFormat:", @"      appVersion:%lu\n", objc_msgSend(v14, "appVersion"));
              objc_msgSend( v8,  "appendFormat:",  @"        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n",
                [v14 addedMs],
                [v14 markedForDeletionMs],
                [v14 expiryMs],
                [v14 escrowExpiryMs]);
              [v8 appendFormat:@"     },\n"];
              v13 = (char *)v13 + 1;
            }

            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }

          while (v11);
        }

        [v8 appendFormat:@"    ]"];
        uint64_t v3 = v24;
        [v24 appendFormat:@"    clientDatas: %@\n", v8];
        [v24 appendFormat:@"   },\n"];

        uint64_t v4 = v26 + 1;
      }

      while ((id)(v26 + 1) != v25);
      id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v31,  v36,  16LL);
    }

    while (v25);
  }

  [v3 appendFormat:@"  ]"];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount accountKeyHash](v21, "accountKeyHash"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n  accountKeyHash:%@\n  devices: %@\n}",  v18,  v3));

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (IdsAccount *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsAccount, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

+ (id)parseOptInOutExtension:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = v5;
  id v8 = v7;
  if ([v7 length])
  {
    id v8 = v7;
    while (1)
    {
      id v15 = 0LL;
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[OptInOutWithExt parseFromData:error:]( &OBJC_CLASS___OptInOutWithExt,  "parseFromData:error:",  v8,  &v15));
      id v10 = v15;
      id v11 = v10;
      if (!v9) {
        break;
      }
      [v6 addObject:v9];
      id v12 = v8;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  (char *)[v9 parsedLength] + (void)objc_msgSend(v12, "bytes"),  (_BYTE *)objc_msgSend(v12, "length") - (_BYTE *)objc_msgSend(v9, "parsedLength")));

      if (![v8 length]) {
        goto LABEL_5;
      }
    }

    if (a4 && v10) {
      *a4 = v10;
    }

    v13 = 0LL;
  }

  else
  {
LABEL_5:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v6));
  }

  return v13;
}

+ (id)encodeOptInOutExtensionData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "data", (void)v13));
        [v4 appendData:v10];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v4));
  return v11;
}

- (NSData)accountKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccountKeyHash:(id)a3
{
}

- (NSMutableArray)devicesArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDevicesArray:(id)a3
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
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount accountKeyHash](self, "accountKeyHash"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  [v3 setObject:v5 forKeyedSubscript:@"accountKeyHash"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray"));
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v26 + 1) + 8 * (void)v11) diagnosticsJsonDictionary]);
        [v6 addObject:v12];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }

    while (v9);
  }

  if ([v6 count]) {
    [v3 setObject:v6 forKeyedSubscript:@"devices"];
  }
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount sortedOptInOutHistory:](self, "sortedOptInOutHistory:", 0LL));
  if (v13)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v22 + 1) + 8 * (void)v19),  "diagnosticsJsonDictionary",  (void)v22));
          [v14 addObject:v20];

          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }

      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"optInOutHistory"];
  }

  return v3;
}

- (id)sortedOptInOutHistory:(id *)a3
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount extensions](self, "extensions", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if ([v9 extensionType] == 2)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 extensionData]);
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IdsAccount parseOptInOutExtension:error:]( &OBJC_CLASS___IdsAccount,  "parseOptInOutExtension:error:",  v11,  a3));

          goto LABEL_11;
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v10 = 0LL;
LABEL_11:

  if ([v10 count]) {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 sortedArrayUsingComparator:&stru_100285CA8]);
  }
  else {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }
  __int128 v13 = (void *)v12;

  return v13;
}

- (BOOL)isActive:(unint64_t)a3
{
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount devicesArray](self, "devicesArray"));
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientDataArray", 0));
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              __int128 v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
              if (![v15 markedForDeletionMs]
                && (![v15 expiryMs] || (unint64_t)objc_msgSend(v15, "expiryMs") > a3)
                || (unint64_t)[v15 markedForDeletionMs] > a3
                && (![v15 expiryMs] || (unint64_t)objc_msgSend(v15, "expiryMs") > a3))
              {

                BOOL v16 = 1;
                goto LABEL_24;
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 0;
    }

    while (v6);
  }

  else
  {
    BOOL v16 = 0;
  }

- (BOOL)hasOptInAfter:(unint64_t)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsAccount sortedOptInOutHistory:](self, "sortedOptInOutHistory:", 0LL));
  id v5 = v4;
  if (v4 && [v4 count])
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator", 0));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          if ([v12 optIn] && (unint64_t)objc_msgSend(v12, "timestampMs") > a3)
          {
            BOOL v13 = 1;
            goto LABEL_15;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    BOOL v13 = 0;
LABEL_15:
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

@end