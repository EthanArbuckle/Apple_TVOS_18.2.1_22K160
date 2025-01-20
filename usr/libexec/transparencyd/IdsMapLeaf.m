@interface IdsMapLeaf
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (IdsMapLeaf)init;
- (NSMutableArray)accountsArray;
- (NSMutableArray)extensions;
- (id)accountForAccountKeyHash:(id)a3;
- (id)data;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (id)recordForAccountKeyHash:(id)a3 deviceIdHash:(id)a4 appVersion:(unint64_t)a5 clientDataHash:(id)a6;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setAccountsArray:(id)a3;
- (void)setExtensions:(id)a3;
@end

@implementation IdsMapLeaf

- (IdsMapLeaf)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IdsMapLeaf;
  v2 = -[IdsMapLeaf init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    accountsArray = v2->_accountsArray;
    v2->_accountsArray = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableArray *)v5;
  }

  return v2;
}

- (id)data
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v9) data]);
        if (!v10)
        {

          goto LABEL_13;
        }

        v11 = (void *)v10;
        [v4 appendData:v10];

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v12 = 0LL;
  if (-[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  v4,  0LL,  0xFFFFFFLL,  v3))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf extensions](self, "extensions"));
    unsigned int v14 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v13, v3);

    if (v14) {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v3));
    }
    else {
LABEL_13:
    }
      v12 = 0LL;
  }

  return v12;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length] + (void)v8;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___IdsMapLeaf);
  id v26 = 0LL;
  v11 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:]( v10,  "parseByteArray:end:minLength:maxLength:result:",  v6,  v9,  0LL,  0xFFFFFFLL,  &v26);
  id v12 = v26;
  v13 = v12;
  if (v11)
  {
    if ([v12 length])
    {
      while (1)
      {
        id v25 = 0LL;
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(+[IdsAccount parseFromData:error:](&OBJC_CLASS___IdsAccount, "parseFromData:error:", v13, &v25));
        id v15 = v25;
        __int128 v16 = v15;
        if (!v14) {
          break;
        }
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](v10, "accountsArray"));
        [v17 addObject:v14];

        id v18 = v13;
        v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( NSData,  "dataWithBytes:length:",  (char *)[v14 parsedLength] + (void)objc_msgSend(v18, "bytes"),  (_BYTE *)objc_msgSend(v18, "length") - (_BYTE *)objc_msgSend(v14, "parsedLength")));

        if (![v13 length]) {
          goto LABEL_5;
        }
      }

      if (a4 && v15) {
        *a4 = v15;
      }

      v22 = 0LL;
    }

    else
    {
LABEL_5:
      id v24 = 0LL;
      __int128 v19 = -[TLSMessageClass parseExtensions:end:result:](v10, "parseExtensions:end:result:", v11, v9, &v24);
      id v20 = v24;
      if (v19)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v20));
        -[IdsMapLeaf setExtensions:](v10, "setExtensions:", v21);

        v22 = v10;
      }

      else
      {
        v22 = 0LL;
        if (a4) {
          *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -264LL,  @"failed to parse extensions from IdsMapLeaf"));
        }
      }
    }
  }

  else
  {
    v22 = 0LL;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -263LL,  @"failed to parse accounts from IdsMapLeaf"));
    }
  }

  return v22;
}

- (id)description
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](&OBJC_CLASS___NSMutableString, "stringWithFormat:", @"[\n"));
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  obj = self->_accountsArray;
  id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v48,  16LL);
  if (v27)
  {
    uint64_t v25 = *(void *)v43;
    id v26 = v3;
    do
    {
      uint64_t v4 = 0LL;
      do
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v4;
        id v5 = *(void **)(*((void *)&v42 + 1) + 8 * v4);
        [v3 appendFormat:@"   {\n"];
        id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKeyHash]);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
        [v3 appendFormat:@"    accountKeyHash:%@\n", v7];

        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[\n"));
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        id v29 = (id)objc_claimAutoreleasedReturnValue([v5 devicesArray]);
        id v32 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v32)
        {
          uint64_t v30 = *(void *)v39;
          v31 = v8;
          do
          {
            uint64_t v9 = 0LL;
            do
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v29);
              }
              uint64_t v33 = v9;
              uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
              [v8 appendFormat:@"     {\n"];
              v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdHash]);
              id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
              [v8 appendFormat:@"      deviceIdHash: %@\n", v12];

              v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"[\n"));
              __int128 v34 = 0u;
              __int128 v35 = 0u;
              __int128 v36 = 0u;
              __int128 v37 = 0u;
              unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 clientDataArray]);
              id v15 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v15)
              {
                id v16 = v15;
                uint64_t v17 = *(void *)v35;
                do
                {
                  id v18 = 0LL;
                  do
                  {
                    if (*(void *)v35 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    __int128 v19 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v18);
                    [v13 appendFormat:@"       {\n"];
                    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientDataHash]);
                    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "kt_hexString"));
                    [v13 appendFormat:@"        clientDataHash:%@\n", v21];

                    objc_msgSend( v13,  "appendFormat:",  @"        appVersion:%lu\n",  objc_msgSend(v19, "appVersion"));
                    objc_msgSend( v13,  "appendFormat:",  @"        addedMs:%llu markMs:%llu; expiryMs:%llu; escrowMs:%llu\n",
                      [v19 addedMs],
                      [v19 markedForDeletionMs],
                      [v19 expiryMs],
                      [v19 escrowExpiryMs]);
                    [v13 appendFormat:@"       },\n"];
                    id v18 = (char *)v18 + 1;
                  }

                  while (v16 != v18);
                  id v16 = [v14 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }

                while (v16);
              }

              [v13 appendFormat:@"      ]"];
              id v8 = v31;
              [v31 appendFormat:@"      clientDatas: %@\n", v13];
              [v31 appendFormat:@"     },\n"];

              uint64_t v9 = v33 + 1;
            }

            while ((id)(v33 + 1) != v32);
            id v32 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }

          while (v32);
        }

        [v8 appendFormat:@"    ]"];
        uint64_t v3 = v26;
        [v26 appendFormat:@"    devices: %@\n", v8];
        [v26 appendFormat:@"   },\n"];

        uint64_t v4 = v28 + 1;
      }

      while ((id)(v28 + 1) != v27);
      id v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v48,  16LL);
    }

    while (v27);
  }

  [v3 appendFormat:@"  ]"];
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{\n  accounts: %@\n}",  v3));

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (IdsMapLeaf *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsMapLeaf, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf data](self, "data"));
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (NSMutableArray)accountsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAccountsArray:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)diagnosticsJsonDictionary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) diagnosticsJsonDictionary]);
        [v4 addObject:v10];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  if ([v4 count]) {
    [v3 setObject:v4 forKeyedSubscript:@"accounts"];
  }

  return v3;
}

- (id)recordForAccountKeyHash:(id)a3 deviceIdHash:(id)a4 appVersion:(unint64_t)a5 clientDataHash:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray"));
  id v14 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v55;
    __int128 v39 = v13;
    id v40 = v10;
    id v43 = v11;
    uint64_t v37 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountKeyHash]);
        unsigned int v20 = [v19 isEqualToData:v10];

        if (v20)
        {
          __int128 v41 = i;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          v21 = (void *)objc_claimAutoreleasedReturnValue([v18 devicesArray]);
          id v44 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
          if (v44)
          {
            uint64_t v45 = *(void *)v51;
            id v38 = v15;
            __int128 v42 = v21;
            do
            {
              v22 = 0LL;
              id v23 = v43;
              do
              {
                if (*(void *)v51 != v45) {
                  objc_enumerationMutation(v21);
                }
                id v24 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v22);
                uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceIdHash]);
                unsigned int v26 = [v25 isEqualToData:v23];

                if (v26)
                {
                  __int128 v48 = 0u;
                  __int128 v49 = 0u;
                  __int128 v46 = 0u;
                  __int128 v47 = 0u;
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v24 clientDataArray]);
                  id v28 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
                  if (v28)
                  {
                    id v29 = v28;
                    uint64_t v30 = *(void *)v47;
                    while (2)
                    {
                      for (j = 0LL; j != v29; j = (char *)j + 1)
                      {
                        if (*(void *)v47 != v30) {
                          objc_enumerationMutation(v27);
                        }
                        id v32 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)j);
                        if ([v32 appVersion] == (id)a5)
                        {
                          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 clientDataHash]);
                          unsigned __int8 v34 = [v33 isEqualToData:v12];

                          if ((v34 & 1) != 0)
                          {
                            id v35 = v32;

                            __int128 v13 = v39;
                            id v10 = v40;
                            id v11 = v43;
                            goto LABEL_31;
                          }
                        }
                      }

                      id v29 = [v27 countByEnumeratingWithState:&v46 objects:v58 count:16];
                      if (v29) {
                        continue;
                      }
                      break;
                    }
                  }

                  v21 = v42;
                  id v23 = v43;
                }

                v22 = (char *)v22 + 1;
              }

              while (v22 != v44);
              __int128 v13 = v39;
              id v10 = v40;
              uint64_t v16 = v37;
              id v15 = v38;
              id v44 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
            }

            while (v44);
          }

          i = v41;
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v54 objects:v60 count:16];
      id v35 = 0LL;
      id v11 = v43;
    }

    while (v15);
  }

  else
  {
    id v35 = 0LL;
  }

- (id)accountForAccountKeyHash:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accountKeyHash]);
        unsigned __int8 v11 = [v10 isEqual:v4];

        if ((v11 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (unint64_t)verifyWithError:(id *)a3
{
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMapLeaf accountsArray](self, "accountsArray"));
  id v5 = [v4 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (!v5)
  {
LABEL_35:

    return 1LL;
  }

  id v6 = v5;
  uint64_t v7 = *(void *)v55;
LABEL_3:
  uint64_t v8 = 0LL;
LABEL_4:
  if (*(void *)v55 != v7) {
    objc_enumerationMutation(v4);
  }
  uint64_t v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 accountKeyHash]);
  if (!v10
    || (unsigned __int8 v11 = (void *)v10,
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 accountKeyHash]),
        id v13 = [v12 length],
        v12,
        v11,
        !v13))
  {
    uint64_t v37 = -81LL;
    goto LABEL_41;
  }

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 devicesArray]);
  id v15 = [v14 count];

  if (!v15)
  {
    uint64_t v37 = -82LL;
    goto LABEL_41;
  }

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 devicesArray]);
  id v17 = [v16 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (!v17) {
    goto LABEL_33;
  }
  uint64_t v18 = *(void *)v51;
  id v43 = v4;
  id v44 = a3;
  uint64_t v40 = *(void *)v51;
  id v41 = v6;
LABEL_11:
  __int128 v19 = 0LL;
  id v42 = v17;
LABEL_12:
  if (*(void *)v51 != v18) {
    objc_enumerationMutation(v16);
  }
  unsigned int v20 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 clientDataArray]);
  id v22 = [v21 count];

  if (v22)
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v20 clientDataArray]);
    id v24 = [v23 countByEnumeratingWithState:&v46 objects:v60 count:16];
    if (!v24) {
      goto LABEL_31;
    }
    id v25 = v24;
    uint64_t v26 = *(void *)v47;
    uint64_t v39 = v7;
    uint64_t v45 = v16;
LABEL_17:
    uint64_t v27 = 0LL;
    while (1)
    {
      if (*(void *)v47 != v26) {
        objc_enumerationMutation(v23);
      }
      id v28 = *(void **)(*((void *)&v46 + 1) + 8 * v27);
      uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 clientDataHash]);
      if (!v29) {
        break;
      }
      uint64_t v30 = (void *)v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue([v28 clientDataHash]);
      id v32 = [v31 length];

      if (!v32) {
        break;
      }
      if ([v28 markedForDeletionMs])
      {
        id v33 = [v28 escrowExpiryMs];
        if (v33 <= [v28 markedForDeletionMs])
        {
          uint64_t v37 = -85LL;
          goto LABEL_39;
        }
      }

      if (![v28 markedForDeletionMs]
        && (BOOL v34 = [v28 expiryMs] != 0, ((v34 ^ (objc_msgSend(v28, "escrowExpiryMs") != 0)) & 1) != 0)
        || ![v28 markedForDeletionMs]
        && [v28 expiryMs]
        && (id v35 = [v28 escrowExpiryMs], v35 <= objc_msgSend(v28, "expiryMs")))
      {
        uint64_t v37 = -237LL;
        goto LABEL_39;
      }

      if (v25 == (id)++v27)
      {
        id v25 = [v23 countByEnumeratingWithState:&v46 objects:v60 count:16];
        uint64_t v7 = v39;
        __int128 v16 = v45;
        if (v25) {
          goto LABEL_17;
        }
LABEL_31:

        __int128 v19 = (char *)v19 + 1;
        id v6 = v41;
        uint64_t v18 = v40;
        if (v19 == v42)
        {
          id v17 = [v16 countByEnumeratingWithState:&v50 objects:v61 count:16];
          id v4 = v43;
          a3 = v44;
          if (!v17)
          {
LABEL_33:

            if ((id)++v8 == v6)
            {
              id v6 = [v4 countByEnumeratingWithState:&v54 objects:v62 count:16];
              if (!v6) {
                goto LABEL_35;
              }
              goto LABEL_3;
            }

            goto LABEL_4;
          }

          goto LABEL_11;
        }

        goto LABEL_12;
      }
    }

    uint64_t v37 = -84LL;
LABEL_39:

    id v4 = v43;
    a3 = v44;
    __int128 v16 = v45;
    goto LABEL_40;
  }

  uint64_t v37 = -83LL;
  id v4 = v43;
  a3 = v44;
LABEL_40:

LABEL_41:
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  v37,  @"MapLeaf missing required fields or inconsistent"));
  }
  if (qword_1002EEB30 != -1) {
    dispatch_once(&qword_1002EEB30, &stru_100285CC8);
  }
  id v38 = (os_log_s *)qword_1002EEB38;
  if (os_log_type_enabled((os_log_t)qword_1002EEB38, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v59 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "MapLeaf missing required fields or inconsistent: %ld",  buf,  0xCu);
  }

  return 0LL;
}

@end