@interface IdsMutation
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)getOptIn;
- (BOOL)hasOptInExtension;
- (BOOL)isEqual:(id)a3;
- (IdsDeviceMutation)idsDeviceMutation;
- (IdsMutation)init;
- (NSData)uriVRFOutput;
- (NSMutableArray)extensions;
- (OptInOut)optInOut;
- (OptInOutMutation)optInOutMutation;
- (id)accountKeyHash;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)diagnosticsJsonDictionary;
- (id)getOptInOutWithExt;
- (int)getSimpleMutationType;
- (unint64_t)mutationMs;
- (unsigned)mutationType;
- (unsigned)mutationVersion;
- (void)setExtensions:(id)a3;
- (void)setIdsDeviceMutation:(id)a3;
- (void)setMutationMs:(unint64_t)a3;
- (void)setMutationType:(unsigned __int8)a3;
- (void)setMutationVersion:(unsigned __int8)a3;
- (void)setOptInOut:(id)a3;
- (void)setOptInOutMutation:(id)a3;
- (void)setUriVRFOutput:(id)a3;
@end

@implementation IdsMutation

- (int)getSimpleMutationType
{
  unsigned int v2 = -[IdsMutation mutationType](self, "mutationType");
  if (v2 > 6) {
    return 1;
  }
  else {
    return dword_10024C130[(char)v2];
  }
}

- (BOOL)getOptIn
{
  unsigned int v3 = -[IdsMutation mutationType](self, "mutationType");
  switch(v3)
  {
    case 6u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_6;
    case 4u:
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutationWithExt, v11);
        char isKindOfClass = objc_opt_isKindOfClass(v10, v12);

        if ((isKindOfClass & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "extensions", 0));
          id v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v25;
            while (2)
            {
              for (i = 0LL; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v25 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
                if ([v20 extensionType] == 3)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 extensionData]);
                  v23 = (void *)objc_claimAutoreleasedReturnValue( +[OptInOutWithExt parseFromData:error:]( &OBJC_CLASS___OptInOutWithExt,  "parseFromData:error:",  v22,  0LL));

                  unsigned __int8 v21 = [v23 optIn];
                  return v21;
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
        }
      }

      break;
    case 3u:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
LABEL_6:
      v5 = v4;
      unsigned __int8 v6 = [v4 optIn];

      return v6;
  }

  return 0;
}

- (id)getOptInOutWithExt
{
  if (-[IdsMutation mutationType](self, "mutationType") == 4
    && (uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"))) != 0
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation")),
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutationWithExt, v6),
        char isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "extensions", 0));
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if ([v14 extensionType] == 3)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 extensionData]);
            id v11 = (id)objc_claimAutoreleasedReturnValue( +[OptInOutWithExt parseFromData:error:]( &OBJC_CLASS___OptInOutWithExt,  "parseFromData:error:",  v16,  0LL));

            goto LABEL_16;
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

- (BOOL)hasOptInExtension
{
  if (-[IdsMutation mutationType](self, "mutationType") == 4
    && (uint64_t v3 = objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"))) != 0
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation")),
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___IdsDeviceMutationWithExt, v6),
        char isKindOfClass = objc_opt_isKindOfClass(v5, v7),
        v5,
        v4,
        (isKindOfClass & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "extensions", 0));
    id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * (void)i) extensionType] == 3)
          {
            LOBYTE(v11) = 1;
            goto LABEL_16;
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

- (id)accountKeyHash
{
  unsigned int v3 = -[IdsMutation mutationType](self, "mutationType");
  v4 = 0LL;
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_6:
      uint64_t v6 = v5;
      v4 = (void *)objc_claimAutoreleasedReturnValue([v5 accountKeyHash]);

      return v4;
    }

    if (v3 == 6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_6;
    }
  }

  return v4;
}

- (IdsMutation)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IdsMutation;
  unsigned int v2 = -[IdsMutation init](&v6, "init");
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
  if (-[TLSMessageClass encodeByte:buffer:]( self,  "encodeByte:buffer:",  -[IdsMutation mutationVersion](self, "mutationVersion"),  v3))
  {
    if (-[TLSMessageClass encodeByte:buffer:]( self,  "encodeByte:buffer:",  -[IdsMutation mutationType](self, "mutationType"),  v3))
    {
      if (-[TLSMessageClass encodeUint64:buffer:]( self,  "encodeUint64:buffer:",  -[IdsMutation mutationMs](self, "mutationMs"),  v3))
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation uriVRFOutput](self, "uriVRFOutput"));
        unsigned int v5 = -[TLSMessageClass encodeVRFOutput:buffer:](self, "encodeVRFOutput:buffer:", v4, v3);

        if (v5)
        {
          unsigned int v6 = -[IdsMutation mutationType](self, "mutationType");
          uint64_t v7 = 0LL;
          if (v6 > 6)
          {
            v10 = 0LL;
          }

          else
          {
            if (((1 << v6) & 0x36) != 0)
            {
              uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_14:
              id v11 = v8;
              v10 = (void *)objc_claimAutoreleasedReturnValue([v8 data]);

              if (v10
                && ([v3 appendData:v10],
                    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation extensions](self, "extensions")),
                    unsigned int v13 = -[TLSMessageClass encodeExtensions:buffer:](self, "encodeExtensions:buffer:", v12, v3),
                    v12,
                    v13))
              {
                uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v3));
              }

              else
              {
                uint64_t v7 = 0LL;
              }

              goto LABEL_18;
            }

            if (v6 == 3)
            {
              uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
              goto LABEL_14;
            }

            v10 = 0LL;
            if (v6 == 6)
            {
              uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
              goto LABEL_14;
            }
          }

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 bytes];
  id v7 = v5;
  id v8 = [v7 bytes];
  v9 = (char *)[v7 length];

  v10 = &v9[(void)v8];
  id v11 = objc_alloc_init(&OBJC_CLASS___IdsMutation);
  char v42 = 0;
  uint64_t v12 = -[TLSMessageClass parseByte:end:result:](v11, "parseByte:end:result:", v6, v10, &v42);
  if (v12) {
    BOOL v13 = v42 == 2;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    if (a4)
    {
      uint64_t v14 = kTransparencyErrorDecode;
      __int128 v15 = @"failed to parse mutation version from Mutation";
      uint64_t v16 = -265LL;
LABEL_16:
      __int128 v27 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v14,  v16,  v15));
      goto LABEL_42;
    }

    goto LABEL_17;
  }

  __int128 v17 = v12;
  -[IdsMutation setMutationVersion:](v11, "setMutationVersion:", 2LL);
  unsigned __int8 v41 = 0;
  __int128 v18 = -[TLSMessageClass parseByte:end:result:](v11, "parseByte:end:result:", v17, v10, &v41);
  if (!v18)
  {
    if (a4)
    {
      uint64_t v14 = kTransparencyErrorDecode;
      __int128 v15 = @"failed to parse mutation type from Mutation";
      uint64_t v16 = -239LL;
      goto LABEL_16;
    }

- (id)debugDescription
{
  unsigned int v3 = -[IdsMutation mutationType](self, "mutationType");
  v4 = @"unknown";
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_8:
      id v6 = v5;
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 debugDescription]);

      goto LABEL_9;
    }

    if (v3 == 3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
      goto LABEL_8;
    }

    if (v3 == 6)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_8;
    }
  }

- (id)description
{
  unsigned int v3 = -[IdsMutation mutationType](self, "mutationType");
  v4 = @"unknown";
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x36) != 0)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
LABEL_8:
      id v6 = v5;
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 description]);

      goto LABEL_9;
    }

    if (v3 == 3)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
      goto LABEL_8;
    }

    if (v3 == 6)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOutMutation](self, "optInOutMutation"));
      goto LABEL_8;
    }
  }

- (BOOL)isEqual:(id)a3
{
  id v5 = (IdsMutation *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IdsMutation, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unsigned)mutationVersion
{
  return self->_mutationVersion;
}

- (void)setMutationVersion:(unsigned __int8)a3
{
  self->_mutationVersion = a3;
}

- (unsigned)mutationType
{
  return self->_mutationType;
}

- (void)setMutationType:(unsigned __int8)a3
{
  self->_uint64_t mutationType = a3;
}

- (unint64_t)mutationMs
{
  return self->_mutationMs;
}

- (void)setMutationMs:(unint64_t)a3
{
  self->_unint64_t mutationMs = a3;
}

- (NSData)uriVRFOutput
{
  return (NSData *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUriVRFOutput:(id)a3
{
}

- (OptInOut)optInOut
{
  return (OptInOut *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setOptInOut:(id)a3
{
}

- (OptInOutMutation)optInOutMutation
{
  return (OptInOutMutation *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOptInOutMutation:(id)a3
{
}

- (IdsDeviceMutation)idsDeviceMutation
{
  return (IdsDeviceMutation *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIdsDeviceMutation:(id)a3
{
}

- (NSMutableArray)extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setExtensions:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)diagnosticsJsonDictionary
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IdsMutation mutationVersion](self, "mutationVersion")));
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IdsMutation mutationType](self, "mutationType")));
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IdsMutation mutationMs](self, "mutationMs")));
  [v3 setObject:v6 forKeyedSubscript:@"mutationMs"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(-[IdsMutation mutationMs](self, "mutationMs") / 0x3E8)));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_toISO_8601_UTCString"));
  [v3 setObject:v8 forKeyedSubscript:@"mutationDateReadable"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation uriVRFOutput](self, "uriVRFOutput"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
  [v3 setObject:v10 forKeyedSubscript:@"uriVrfOutput"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation optInOut](self, "optInOut"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diagnosticsJsonDictionary]);
    [v3 setObject:v13 forKeyedSubscript:@"optInOut"];
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));

  if (v14)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IdsMutation idsDeviceMutation](self, "idsDeviceMutation"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 diagnosticsJsonDictionary]);
    [v3 setObject:v16 forKeyedSubscript:@"idsDeviceMutation"];
  }

  return v3;
}

@end