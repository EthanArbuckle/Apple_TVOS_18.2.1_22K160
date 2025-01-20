@interface _NSJSONReader
+ (BOOL)validForJSON:(id)a3 depth:(unint64_t)a4 allowFragments:(BOOL)a5;
- (id)parseData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)parseStream:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation _NSJSONReader

- (id)parseData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v59 = *MEMORY[0x1895F89C0];
  if (![a3 length])
  {
    if ((a4 & 0x10) != 0)
    {
      if ((a4 & 1) != 0) {
        v18 = (objc_class *)MEMORY[0x189603FC8];
      }
      else {
        v18 = (objc_class *)MEMORY[0x189603F68];
      }
      return objc_alloc_init(v18);
    }

    if (!a5) {
      return 0LL;
    }
    v53 = @"NSDebugDescription";
    v54 = @"Unable to parse empty data.";
    v13 = (void *)MEMORY[0x189603F68];
    v14 = &v54;
    v15 = &v53;
    goto LABEL_54;
  }

  if (!self)
  {
    uint64_t v17 = 0LL;
    goto LABEL_49;
  }

  v10 = (unsigned __int8 *)[v8 bytes];
  unint64_t v11 = [v8 length];
  if (v11 >= 5)
  {
    int v12 = *v10;
    if (v12 == 254)
    {
      int v19 = v10[1];
      if (v19 != 255) {
        goto LABEL_58;
      }
      if (v10[2] || v10[3] != 255)
      {
        uint64_t v5 = 2LL;
        goto LABEL_25;
      }

      uint64_t v17 = 2617245952LL;
    }

    else
    {
      if (*v10) {
        goto LABEL_15;
      }
      int v16 = v10[2];
      if (v10[1])
      {
LABEL_12:
        if (v16) {
          goto LABEL_59;
        }
        uint64_t v5 = 0LL;
        if (!v10[3]) {
          goto LABEL_60;
        }
LABEL_25:
        uint64_t v17 = 2415919360LL;
LABEL_49:
        v22 =  -[NSString initWithBytes:length:encoding:]( [NSString alloc],  "initWithBytes:length:encoding:",  [v8 bytes] + v5,  objc_msgSend(v8, "length") - v5,  v17);
        if (v22)
        {
          uint64_t v23 = -[NSString dataUsingEncoding:](v22, "dataUsingEncoding:", 4LL);
          if (self)
          {
            id v8 = (id)v23;
            goto LABEL_59;
          }

          return 0LL;
        }

        if (!a5) {
          return 0LL;
        }
        v51 = @"NSDebugDescription";
        v52 = @"Unable to convert data to a string using the detected encoding. The data may be corrupt.";
        v13 = (void *)MEMORY[0x189603F68];
        v14 = &v52;
        v15 = &v51;
LABEL_54:
        v24 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840,  [v13 dictionaryWithObjects:v14 forKeys:v15 count:1]);
        id result = 0LL;
        *a5 = v24;
        return result;
      }

      if (!v10[2])
      {
LABEL_99:
        uint64_t v5 = 0LL;
        if (!v10[3]) {
          goto LABEL_60;
        }
        uint64_t v17 = 2550137088LL;
        goto LABEL_49;
      }

      if (v16 != 254 || v10[3] != 255) {
        goto LABEL_59;
      }
      uint64_t v17 = 2550137088LL;
    }

    uint64_t v5 = 4LL;
    goto LABEL_49;
  }

  if (v11 < 3) {
    goto LABEL_59;
  }
  int v12 = *v10;
LABEL_15:
  if (v12 == 254)
  {
    if (v10[1] == 255)
    {
      uint64_t v17 = 2415919360LL;
      goto LABEL_48;
    }
  }

  else if (v12 == 255 && v10[1] == 254)
  {
    uint64_t v17 = 2483028224LL;
LABEL_48:
    uint64_t v5 = 2LL;
    goto LABEL_49;
  }

  if (v11 < 4) {
    goto LABEL_59;
  }
  if (v12 == 239)
  {
    if (v10[1] == 187)
    {
      int v21 = v10[2];
      if (v21 == 191) {
        uint64_t v5 = 3LL;
      }
      else {
        uint64_t v5 = 0LL;
      }
      if (v11 < 5 || v21 == 191) {
        goto LABEL_60;
      }
    }

    else if (v11 < 5)
    {
      goto LABEL_59;
    }

    goto LABEL_57;
  }

  if (v11 < 5) {
    goto LABEL_59;
  }
  if (!v12)
  {
    int v16 = v10[2];
    if (!v10[1])
    {
      if (!v10[2]) {
        goto LABEL_99;
      }
LABEL_59:
      uint64_t v5 = 0LL;
      goto LABEL_60;
    }

    goto LABEL_12;
  }

+ (BOOL)validForJSON:(id)a3 depth:(unint64_t)a4 allowFragments:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4 > 0x1FF) {
    return 0;
  }
  BOOL v6 = a5;
  if (_NSIsNSDictionary())
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    char v19 = 1;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke;
    v15[3] = &unk_189CA2110;
    v15[4] = &v16;
    v15[5] = a4;
    [a3 enumerateKeysAndObjectsUsingBlock:v15];
LABEL_7:
    BOOL v5 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
    return v5;
  }

  if (_NSIsNSArray())
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    char v19 = 1;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __51___NSJSONReader_validForJSON_depth_allowFragments___block_invoke_2;
    v14[3] = &unk_189CA2138;
    v14[4] = &v16;
    v14[5] = a4;
    [a3 enumerateObjectsUsingBlock:v14];
    goto LABEL_7;
  }

  if (!v6) {
    return 0;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return 1;
  }
  if (_NSIsNSString())
  {
    BOOL v10 = [a3 dataUsingEncoding:4 allowLossyConversion:0] == 0;
    return !v10;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (_NSIsNSNumber())
    {
      int v11 = *(char *)[a3 objCType];
      if (v11 == 100)
      {
        [a3 doubleValue];
        [a3 doubleValue];
        if (fabs(v13) != INFINITY) {
          return 1;
        }
      }

      else
      {
        if (v11 != 102) {
          return 1;
        }
        [a3 floatValue];
        [a3 floatValue];
        if (fabsf(v12) != INFINITY) {
          return 1;
        }
      }
    }

    return 0;
  }

  if (!a3) {
    return 1;
  }
  [a3 decimalValue];
  BOOL v10 = (v16 & 0x1F00) == 4096;
  return !v10;
}

- (id)parseStream:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1895F89C0];
  v9 = (void *)[MEMORY[0x189603FB8] data];
  BOOL v10 = malloc(0x1000uLL);
  while (1)
  {
    do
    {
      if ([a3 streamStatus] != 2 && objc_msgSend(a3, "streamStatus") != 3)
      {
        free(v10);
        return -[_NSJSONReader parseData:options:error:](self, "parseData:options:error:", v9, a4, a5);
      }
    }

    while (![a3 hasBytesAvailable]);
    uint64_t v11 = [a3 read:v10 maxLength:4096];
    if (v11 < 0) {
      break;
    }
    if (v11) {
      [v9 appendBytes:v10 length:v11];
    }
  }

  if (a5)
  {
    double v13 = @"NSUnderlyingError";
    v14[0] = [a3 streamError];
    *a5 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840,  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1]);
  }

  free(v10);
  return 0LL;
}

@end