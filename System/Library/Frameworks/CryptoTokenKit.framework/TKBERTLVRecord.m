@interface TKBERTLVRecord
+ (NSData)dataForTag:(TKTLVTag)tag;
+ (id)parseFromDataSource:(id)a3;
+ (id)zuluDateFormatter;
+ (unint64_t)encodeNumber:(unint64_t)a3 into:(char *)a4;
- (TKBERTLVRecord)initWithPropertyList:(id)a3;
- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag records:(NSArray *)records;
- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag value:(NSData *)value;
- (id)propertyList;
@end

@implementation TKBERTLVRecord

+ (unint64_t)encodeNumber:(unint64_t)a3 into:(char *)a4
{
  if (!a3) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60] format:@"BER-TLV tag number must not be 0"];
  }
  unint64_t result = 0LL;
  int v7 = 0;
  for (uint64_t i = 56LL; i != -8; i -= 8LL)
  {
    v7 |= ((255LL << i) & a3) != 0;
    if ((v7 & 1) != 0)
    {
      *a4++ = ((255LL << i) & a3) >> i;
      ++result;
    }
  }

  return result;
}

+ (NSData)dataForTag:(TKTLVTag)tag
{
  v5[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = [a1 encodeNumber:tag into:v5];
  [MEMORY[0x189603F48] dataWithBytes:v5 length:v3];
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag value:(NSData *)value
{
  v15[1] = *MEMORY[0x1895F89C0];
  v6 = value;
  objc_msgSend( MEMORY[0x189603FB8],  "dataWithBytes:length:",  &v14,  objc_msgSend((id)objc_opt_class(), "encodeNumber:into:", tag, &v14));
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = -[NSData length](v6, "length");
  if (v8 > 0x7F)
  {
    uint64_t v10 = [(id)objc_opt_class() encodeNumber:v8 into:v15];
    uint64_t v9 = v10 + 1;
    LOBYTE(v8) = v10 ^ 0x80;
  }

  else
  {
    uint64_t v9 = 1LL;
  }

  char v14 = v8;
  [v7 appendBytes:&v14 length:v9];
  [v7 appendData:v6];
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TKBERTLVRecord;
  v11 = -[TKTLVRecord initWithTag:value:data:](&v13, sel_initWithTag_value_data_, tag, v6, v7);

  return v11;
}

- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag records:(NSArray *)records
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v6 = records;
  [MEMORY[0x189603FB8] data];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unint64_t v8 = v6;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "data", (void)v16);
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 appendData:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v10);
  }

  char v14 = -[TKBERTLVRecord initWithTag:value:](self, "initWithTag:value:", tag, v7);
  return v14;
}

+ (id)parseFromDataSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 ptr];
  unsigned int v6 = [v4 fetchByte];
  unint64_t v7 = v6;
  if ((~v6 & 0x1FLL) == 0)
  {
    while (!HIBYTE(v7) && [v4 bytesSafeToRead:1])
    {
      unsigned int v8 = [v4 fetchByte];
      unint64_t v7 = v8 | (v7 << 8);
      if ((v8 & 0x80) == 0) {
        goto LABEL_6;
      }
    }

    goto LABEL_17;
  }

+ (id)zuluDateFormatter
{
  if (zuluDateFormatter_onceToken != -1) {
    dispatch_once(&zuluDateFormatter_onceToken, &__block_literal_global_0);
  }
  return (id)zuluDateFormatter_formatter;
}

uint64_t __51__TKBERTLVRecord_TKPropertyList__zuluDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  v1 = (void *)zuluDateFormatter_formatter;
  zuluDateFormatter_formatter = (uint64_t)v0;

  [MEMORY[0x189604020] timeZoneForSecondsFromGMT:0];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)zuluDateFormatter_formatter setTimeZone:v2];

  [MEMORY[0x189603F90] systemLocale];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)zuluDateFormatter_formatter setLocale:v3];

  return [(id)zuluDateFormatter_formatter setDateFormat:@"yyyyMMddHHmmss.SSSS'Z'"];
}

- (TKBERTLVRecord)initWithPropertyList:(id)a3
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((id)*MEMORY[0x189604DE8] != v4 && *MEMORY[0x189604DE0] != (void)v4)
    {
      uint64_t v11 = [v4 longLongValue];
      uint64_t v12 = v11;
      uint64_t v13 = -9LL;
      uint64_t v14 = 56LL;
      do
      {
        unint64_t v15 = v11 >> v14;
        ++v13;
        if (!v14) {
          break;
        }
        v14 -= 8LL;
      }

      while (v15 - 1 > 0xFD);
      uint64_t v16 = ((v15 >> 7) & 1 ^ ((unint64_t)v11 >> 63)) - v13;
      [MEMORY[0x189603FB8] dataWithLength:v16];
      objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 >= 1)
      {
        uint64_t v18 = 0LL;
        char v19 = 8 * v16 - 8;
        do
        {
          *(_BYTE *)([v17 mutableBytes] + v18++) = v12 >> v19;
          v19 -= 8;
        }

        while (v16 != v18);
      }

      uint64_t v10 = -[TKBERTLVRecord initWithTag:value:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithTag:value:",  2LL,  v17);

      goto LABEL_16;
    }

    LOBYTE(v48) = [v4 BOOLValue];
    unsigned int v6 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
    [MEMORY[0x189603F48] dataWithBytes:&v48 length:1];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v8 = -[TKBERTLVRecord initWithTag:value:](v6, "initWithTag:value:", 1LL, v7);

LABEL_22:
    self = v8;
    goto LABEL_23;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = v4;
    uint64_t v10 = -[TKBERTLVRecord initWithTag:value:](objc_alloc(&OBJC_CLASS___TKBERTLVRecord), "initWithTag:value:", 4LL, v9);

LABEL_16:
    self = v10;
    goto LABEL_23;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)MEMORY[0x189603F48];
    id v21 = v4;
    uint64_t v22 = [v21 UTF8String];
    uint64_t v23 = [v21 lengthOfBytesUsingEncoding:4];

    [v20 dataWithBytes:v22 length:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
    uint64_t v26 = 12LL;
LABEL_21:
    unsigned int v8 = -[TKBERTLVRecord initWithTag:value:](v25, "initWithTag:value:", v26, v24);

    goto LABEL_22;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
    [MEMORY[0x189603F48] data];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v27;
    uint64_t v26 = 5LL;
    goto LABEL_21;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [(id)objc_opt_class() zuluDateFormatter];
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 stringFromDate:v4];
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x189603F48];
    id v33 = v31;
    objc_msgSend( v32,  "dataWithBytes:length:",  objc_msgSend(v33, "UTF8String"),  objc_msgSend(v33, "lengthOfBytesUsingEncoding:", 4));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TKBERTLVRecord initWithTag:value:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithTag:value:",  24LL,  v34);

LABEL_27:
    self = v35;
    goto LABEL_23;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v36 = v4;
    [MEMORY[0x189603FA8] array];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v38 = v36;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0LL; i != v39; ++i)
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = -[TKBERTLVRecord initWithPropertyList:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithPropertyList:",  *(void *)(*((void *)&v54 + 1) + 8 * i));
          if (!v42)
          {

            goto LABEL_44;
          }

          [v37 addObject:v42];
        }

        uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    v35 = -[TKBERTLVRecord initWithTag:records:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithTag:records:",  48LL,  v37);
    goto LABEL_27;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_44;
  }
  id v43 = v4;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  [MEMORY[0x189603FA8] array];
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1895F87A8];
  v47[1] = 3221225472LL;
  v47[2] = __55__TKBERTLVRecord_TKPropertyList__initWithPropertyList___block_invoke;
  v47[3] = &unk_189F8A268;
  v47[4] = &v48;
  [v43 enumerateKeysAndObjectsUsingBlock:v47];
  uint64_t v44 = v49[5];
  if (v44)
  {
    v45 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
    v46 = -[TKBERTLVRecord initWithTag:records:](v45, "initWithTag:records:", 49LL, v49[5]);

    self = v46;
  }

  _Block_object_dispose(&v48, 8);

  if (!v44)
  {
LABEL_44:
    v28 = 0LL;
    goto LABEL_24;
  }

void __55__TKBERTLVRecord_TKPropertyList__initWithPropertyList___block_invoke( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  v17[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a2;
  id v9 = -[TKBERTLVRecord initWithPropertyList:](objc_alloc(&OBJC_CLASS___TKBERTLVRecord), "initWithPropertyList:", v8);

  uint64_t v10 = -[TKBERTLVRecord initWithPropertyList:](objc_alloc(&OBJC_CLASS___TKBERTLVRecord), "initWithPropertyList:", v7);
  if (v9) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0LL;

    *a4 = 1;
  }

  else
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
    v17[0] = v9;
    v17[1] = v10;
    [MEMORY[0x189603F18] arrayWithObjects:v17 count:2];
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[TKBERTLVRecord initWithTag:records:](v14, "initWithTag:records:", 48LL, v15);

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v16];
  }
}

- (id)propertyList
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  uint64_t v3 = -[TKTLVRecord tag](self, "tag");
  id v4 = 0LL;
  if (v3 > 23)
  {
    switch(v3)
    {
      case 24LL:
        id v32 = objc_alloc(NSString);
        id v33 = -[TKTLVRecord value](self, "value");
        uint64_t v34 = [v33 bytes];
        v35 = -[TKTLVRecord value](self, "value");
        id v9 = (void *)objc_msgSend(v32, "initWithBytes:length:encoding:", v34, objc_msgSend(v35, "length"), 4);

        if (!v9)
        {
          id v4 = 0LL;
          goto LABEL_46;
        }

        [(id)objc_opt_class() zuluDateFormatter];
        id v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 dateFromString:v9];
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 48LL:
        [MEMORY[0x189603FA8] array];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        v37 = -[TKTLVRecord value](self, "value");
        +[TKTLVRecord sequenceOfRecordsFromData:](&OBJC_CLASS___TKBERTLVRecord, "sequenceOfRecordsFromData:", v37);
        id v36 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v59 count:16];
        if (!v38)
        {
LABEL_37:

          [MEMORY[0x189603F18] arrayWithArray:v9];
          id v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_46;
        }

        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v55;
LABEL_31:
        uint64_t v41 = 0LL;
        while (1)
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v54 + 1) + 8 * v41) propertyList];
          id v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v4) {
            break;
          }
          [v9 addObject:v4];

          if (v39 == ++v41)
          {
            uint64_t v39 = [v36 countByEnumeratingWithState:&v54 objects:v59 count:16];
            if (v39) {
              goto LABEL_31;
            }
            goto LABEL_37;
          }
        }

        break;
      case 49LL:
        [MEMORY[0x189603FA8] array];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603FA8] array];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        -[TKTLVRecord value](self, "value", 0LL);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[TKTLVRecord sequenceOfRecordsFromData:](&OBJC_CLASS___TKBERTLVRecord, "sequenceOfRecordsFromData:", v11);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v51;
          while (2)
          {
            for (uint64_t i = 0LL; i != v14; ++i)
            {
              if (*(void *)v51 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v50 + 1) + 8 * i) value];
              objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();
              +[TKTLVRecord sequenceOfRecordsFromData:](&OBJC_CLASS___TKBERTLVRecord, "sequenceOfRecordsFromData:", v17);
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

              [v18 objectAtIndexedSubscript:0];
              char v19 = (void *)objc_claimAutoreleasedReturnValue();
              [v19 propertyList];
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              [v18 objectAtIndexedSubscript:1];
              id v21 = (void *)objc_claimAutoreleasedReturnValue();
              [v21 propertyList];
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20) {
                BOOL v23 = v22 == 0LL;
              }
              else {
                BOOL v23 = 1;
              }
              if (v23)
              {

                id v4 = 0LL;
                goto LABEL_39;
              }

              [v9 addObject:v20];
              [v10 addObject:v22];
            }

            uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v58 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9];
        id v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

LABEL_46:
        return v4;
      default:
        return v4;
    }

    goto LABEL_46;
  }

  switch(v3)
  {
    case 1LL:
      id v5 = -[TKTLVRecord value](self, "value");
      unsigned int v6 = (_BYTE *)[v5 bytes];

      id v7 = (id *)MEMORY[0x189604DE8];
      if (!*v6) {
        id v7 = (id *)MEMORY[0x189604DE0];
      }
      id v8 = *v7;
      goto LABEL_44;
    case 2LL:
      v24 = -[TKTLVRecord value](self, "value");
      unint64_t v25 = [v24 length];

      if (v25 <= 8)
      {
        id v42 = -[TKTLVRecord value](self, "value");
        id v43 = (unsigned __int8 *)[v42 bytes];

        for (uint64_t j = (uint64_t)(char)*v43 >> 7; ; uint64_t j = v49 | (unint64_t)(j << 8))
        {
          id v45 = -[TKTLVRecord value](self, "value");
          uint64_t v46 = [v45 bytes];
          v47 = -[TKTLVRecord value](self, "value");
          unint64_t v48 = v46 + [v47 length];

          unsigned int v49 = *v43++;
        }

        [MEMORY[0x189607968] numberWithLongLong:j];
        id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
        id result = v8;
      }

      else
      {
        id result = 0LL;
      }

      break;
    case 4LL:
      -[TKTLVRecord value](self, "value");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    case 5LL:
      [MEMORY[0x189603FE8] null];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    case 12LL:
      id v27 = objc_alloc(NSString);
      id v28 = -[TKTLVRecord value](self, "value");
      uint64_t v29 = [v28 bytes];
      v30 = -[TKTLVRecord value](self, "value");
      v31 = (void *)objc_msgSend(v27, "initWithBytes:length:encoding:", v29, objc_msgSend(v30, "length"), 4);

      return v31;
    default:
      return v4;
  }

  return result;
}

@end