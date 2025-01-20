@interface PBTextReader
- (PBTextReader)init;
- (id)_readString;
- (id)readMessageType:(Class)a3 fromString:(id)a4;
- (objc_class)_readObject:(uint64_t)a1;
- (uint64_t)_rangeOfCharactersInSetAtCurrentPosition:(uint64_t)a1;
- (uint64_t)_readTag:(uint64_t *)a3 andType:;
- (uint64_t)_readValue;
- (void)_parseNumber:(void *)a1 maxValue:(unint64_t)a2 isSigned:(int)a3;
- (void)dealloc;
@end

@implementation PBTextReader

- (PBTextReader)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBTextReader;
  v2 = -[PBTextReader init](&v6, sel_init);
  if (v2)
  {
    v2->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x189607810] whitespaceAndNewlineCharacterSet];
    id v3 = objc_alloc_init(MEMORY[0x189607930]);
    objc_msgSend(v3, "addCharactersInRange:", 97, 26);
    objc_msgSend(v3, "addCharactersInRange:", 65, 26);
    objc_msgSend(v3, "addCharactersInRange:", 48, 10);
    [v3 addCharactersInString:@"_:"];
    v2->_tagNameCharacterSet = (NSCharacterSet *)[v3 copy];
    id v4 = (id)objc_msgSend( (id)objc_msgSend(MEMORY[0x189607810], "decimalDigitCharacterSet"),  "mutableCopy");
    [v4 addCharactersInString:@"."];
    v2->_nonHexDigitCharacterSet = (NSCharacterSet *)[v4 copy];
    v2->_objects = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v2->_cachedObjectTypes = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBTextReader;
  -[PBTextReader dealloc](&v3, sel_dealloc);
}

- (id)readMessageType:(Class)a3 fromString:(id)a4
{
  id result = (id)[a4 length];
  if (result)
  {
    v8 = (NSString *)[a4 copy];
    self->_string = v8;
    self->_pos = 0LL;
    self->_length = -[NSString length](v8, "length");
    v9 = -[PBTextReader _readObject:]((uint64_t)self, a3);

    self->_pos = 0LL;
    self->_length = 0LL;
    self->_string = 0LL;
    return v9;
  }

  return result;
}

- (objc_class)_readObject:(uint64_t)a1
{
  v127[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v2 = a2;
  uint64_t v3 = a1;
  if (!a2)
  {
    id v5 = 0LL;
    while (1)
    {
      while (1)
      {
LABEL_19:
        if (*(void *)(v3 + 32) >= *(void *)(v3 + 40)) {
          return v2;
        }
        uint64_t v114 = 0LL;
        v115 = 0LL;
        -[PBTextReader _readTag:andType:](v3, (uint64_t *)&v115, &v114);
        v15 = v115;
        if ([v115 length]) {
          break;
        }
        uint64_t v17 = 0LL;
LABEL_26:
        switch(v114)
        {
          case 0LL:
            uint64_t v19 = *(void *)(v3 + 32);
            uint64_t v20 = *(void *)(a1 + 40);
            uint64_t v21 = 20LL;
            if (v19 > 20) {
              uint64_t v21 = v19;
            }
            else {
              uint64_t v22 = v20 - v19;
            }
            uint64_t v23 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v21 - 20, v22);
            v24 = v115;
            id v108 = -[NSString camelCase](v115);
            uint64_t v112 = v17;
            uint64_t v106 = v23;
            v107 = v24;
            uint64_t v101 = v19;
            uint64_t v102 = v20;
            uint64_t v3 = a1;
            v25 = @"read unknown tag";
            goto LABEL_33;
          case 1LL:
            if (!v17) {
              goto LABEL_131;
            }
            if (*(void *)(v17 + 16))
            {
              if (*(void *)(v17 + 24)) {
                uint64_t v26 = *(void *)(v17 + 24);
              }
              else {
                uint64_t v26 = *(void *)(v17 + 16);
              }
              v27 = (void *)-[PBTextReader _readObject:](v3, v26);
              if (!v27)
              {
                uint64_t v69 = *(void *)(v3 + 32);
                uint64_t v70 = *(void *)(a1 + 40);
                uint64_t v71 = 20LL;
                if (v69 > 20) {
                  uint64_t v71 = v69;
                }
                else {
                  uint64_t v72 = v70 - v69;
                }
                uint64_t v73 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v71 - 20, v72);
                v74 = v115;
                id v108 = -[NSString camelCase](v115);
                uint64_t v112 = v17;
                uint64_t v106 = v73;
                v107 = v74;
                uint64_t v101 = v69;
                uint64_t v102 = v70;
                uint64_t v3 = a1;
                v25 = @"unable to parse object";
LABEL_33:
                NSLog( @"%@ (at %i/%i %@) tag: %@ / %@ for property: %@",  v25,  v101,  v102,  v106,  v107,  v108,  v112);
                continue;
              }

              v126[0] = v27;
LABEL_43:
              [*(id *)(v17 + 40) setArgument:v126 atIndex:2];
              [*(id *)(v17 + 40) invokeWithTarget:v2];
            }

            else
            {
              if (!*(void *)(v17 + 120))
              {
LABEL_131:
                uint64_t v87 = *(void *)(v3 + 32);
                uint64_t v88 = *(void *)(a1 + 40);
                uint64_t v89 = 20LL;
                if (v87 > 20) {
                  uint64_t v89 = v87;
                }
                else {
                  uint64_t v90 = v88 - v87;
                }
                uint64_t v91 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v89 - 20, v90);
                v92 = v115;
                id v108 = -[NSString camelCase](v115);
                uint64_t v112 = v17;
                uint64_t v106 = v91;
                v107 = v92;
                uint64_t v101 = v87;
                uint64_t v102 = v88;
                uint64_t v3 = a1;
                v25 = @"expected object/struct type";
                goto LABEL_33;
              }

              id v48 = objc_alloc_init(MEMORY[0x189603FC8]);
              while (*(void *)(v3 + 32) < *(void *)(v3 + 40))
              {
                v126[0] = 0LL;
                *(void *)&__int128 v121 = 0LL;
                -[PBTextReader _readTag:andType:](v3, (uint64_t *)v126, (uint64_t *)&v121);
                switch((uint64_t)v121)
                {
                  case 0LL:
                    uint64_t v49 = *(void *)(v3 + 32);
                    uint64_t v50 = *(void *)(a1 + 40);
                    uint64_t v51 = 20LL;
                    if (v49 > 20) {
                      uint64_t v51 = v49;
                    }
                    else {
                      uint64_t v52 = v50 - v49;
                    }
                    uint64_t v53 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v51 - 20, v52);
                    v54 = v126[0];
                    id v110 = -[NSString camelCase](v126[0]);
                    uint64_t v104 = v50;
                    uint64_t v3 = a1;
                    NSLog( @"%@ (at %i/%i %@) tag: %@ / %@ for property: %@",  @"read unrecoginzed struct tag",  v49,  v104,  v53,  v54,  v110,  v17);
                    continue;
                  case 1LL:
                    uint64_t v55 = *(void *)(v3 + 32);
                    uint64_t v56 = *(void *)(a1 + 40);
                    uint64_t v57 = 20LL;
                    if (v55 > 20) {
                      uint64_t v57 = v55;
                    }
                    else {
                      uint64_t v58 = v56 - v55;
                    }
                    uint64_t v59 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v57 - 20, v58);
                    v60 = v126[0];
                    id v111 = -[NSString camelCase](v126[0]);
                    uint64_t v105 = v56;
                    uint64_t v3 = a1;
                    NSLog( @"%@ (at %i/%i %@) tag: %@ / %@ for property: %@",  @"unexpected nested tag",  v55,  v105,  v59,  v60,  v111,  v17);
                    continue;
                  case 2LL:
                  case 5LL:
                    goto LABEL_108;
                  case 3LL:
                    v61 = -[PBTextReader _readString](v3);
                    goto LABEL_89;
                  case 4LL:
                    v61 = (void *)-[PBTextReader _readValue](v3);
                    v62 = -[PBTextReader _parseNumber:maxValue:isSigned:](v61, 0xFFFFFFFFFFFFFFFFLL, 0);
                    if (!v62) {
                      v62 = -[PBTextReader _parseNumber:maxValue:isSigned:](v61, 0x7FFFFFFFFFFFFFFFuLL, 1);
                    }
                    if (v62) {
                      v61 = v62;
                    }
LABEL_89:
                    v63 = v126[0];
                    if (v126[0] && v61)
                    {
                      uint64_t v64 = [v48 objectForKeyedSubscript:v126[0]];
                      if (v64
                        && ((v65 = (void *)v64, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                         || (id v66 = objc_alloc_init(MEMORY[0x189603FA8]),
                             [v66 addObject:v65],
                             [v48 setObject:v66 forKeyedSubscript:v63],
                             (v65 = v66) != 0LL)))
                      {
                        [v65 addObject:v61];
                      }

                      else
                      {
                        [v48 setObject:v61 forKeyedSubscript:v63];
                      }
                    }

                    break;
                  default:
                    continue;
                }
              }

- (uint64_t)_readTag:(uint64_t *)a3 andType:
{
  uint64_t v6 = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 8));
  if (v6 == *(void *)(a1 + 32)) {
    *(void *)(a1 + 32) = v6 + v7;
  }
  uint64_t result = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 16));
  uint64_t v10 = result;
  if (result == *(void *)(a1 + 32) && v9 != 0)
  {
    *(void *)(a1 + 32) = result + v9;
    uint64_t result = objc_msgSend( *(id *)(a1 + 48),  "substringWithRange:",  result,  v9 - (objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:", result + v9 - 1) == 58));
    *a2 = result;
  }

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t result = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:](a1, *(void **)(a1 + 8));
    if (result == 0x7FFFFFFFFFFFFFFFLL || result == *(void *)(a1 + 32))
    {
      if (v12) {
        *(void *)(a1 + 32) = result + v12;
      }
    }
  }

  if (*(void *)(a1 + 32) >= *(void *)(a1 + 40))
  {
    uint64_t v14 = 5LL;
  }

  else
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 48), "characterAtIndex:");
    switch((_DWORD)result)
    {
      case '""':
        uint64_t v14 = 3LL;
        break;
      case '}':
        uint64_t v13 = 2LL;
        goto LABEL_21;
      case '{':
        uint64_t v13 = 1LL;
LABEL_21:
        *a3 = v13;
        ++*(void *)(a1 + 32);
        return result;
      default:
        uint64_t v14 = 4LL;
        break;
    }
  }

  *a3 = v14;
  return result;
}

- (id)_readString
{
  unint64_t v2 = *(void *)(a1 + 32) + 1LL;
  *(void *)(a1 + 32) = v2;
  uint64_t v3 = (void *)[MEMORY[0x189607938] indexSet];
  while (1)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v2 >= v4) {
      break;
    }
    int v5 = [*(id *)(a1 + 48) characterAtIndex:v2];
    if (v5 == 92)
    {
      if (v2 + 3 >= *(void *)(a1 + 40))
      {
        unint64_t v6 = v2 + 1;
      }

      else
      {
        unint64_t v6 = v2 + 1;
      }
    }

    else
    {
      if (v5 == 34)
      {
        ++v2;
        unint64_t v4 = *(void *)(a1 + 40);
        break;
      }

      unint64_t v6 = v2;
    }

    unint64_t v2 = v6 + 1;
  }

  if (v2 >= v4) {
    return 0LL;
  }
  *(void *)(a1 + 32) = v2 + 1;
  uint64_t v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "substringWithRange:");
  if ([v3 count])
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __27__PBTextReader__readString__block_invoke;
    v10[3] = &unk_189D323E0;
    v10[4] = v8;
    [v3 enumerateRangesWithOptions:2 usingBlock:v10];
    return (id)[v8 copy];
  }

  return v7;
}

- (uint64_t)_readValue
{
  uint64_t v2 = -[PBTextReader _rangeOfCharactersInSetAtCurrentPosition:]( a1,  (void *)[*(id *)(a1 + 8) invertedSet]);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40) - v4;
  }

  else
  {
    uint64_t v4 = v2;
  }

  *(void *)(a1 + 32) = v3 + v4;
  return objc_msgSend(*(id *)(a1 + 48), "substringWithRange:");
}

- (void)_parseNumber:(void *)a1 maxValue:(unint64_t)a2 isSigned:(int)a3
{
  unint64_t v6 = (void *)[MEMORY[0x189607A08] scannerWithString:a1];
  if ([a1 characterAtIndex:0] == 48)
  {
    if ([a1 length] == 1) {
      return &unk_189D35968;
    }
    int v8 = [a1 characterAtIndex:1];
    if (v8 != 46)
    {
      if (v8 == 120 || v8 == 88)
      {
        uint64_t v9 = (void *)MEMORY[0x189607968];
        unint64_t v10 = *(void *)&v13;
      }

      else
      {
        unint64_t v10 = strtoull((const char *)[a1 UTF8String], 0, 8);
        uint64_t v9 = (void *)MEMORY[0x189607968];
      }

      uint64_t v7 = (void *)[v9 numberWithUnsignedLongLong:v10];
      if (v7) {
        goto LABEL_26;
      }
    }
  }

- (uint64_t)_rangeOfCharactersInSetAtCurrentPosition:(uint64_t)a1
{
  uint64_t v4 = objc_msgSend( *(id *)(a1 + 48),  "rangeOfCharacterFromSet:options:range:",  a2,  0,  *(void *)(a1 + 32),  *(void *)(a1 + 40) - *(void *)(a1 + 32));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend( *(id *)(a1 + 48),  "rangeOfCharacterFromSet:options:range:",  objc_msgSend(a2, "invertedSet"),  0,  v4,  *(void *)(a1 + 40) - v4);
  }
  return v4;
}

uint64_t __27__PBTextReader__readString__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 2;
  uint64_t v7 = (void *)[MEMORY[0x189603FB8] dataWithCapacity:a3 >> 2];
  if (a3 >= 4)
  {
    uint64_t v8 = a2 + 1;
    if (v6 <= 1) {
      unint64_t v6 = 1LL;
    }
    do
    {
      char v10 = strtol( (const char *)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v8, 3),  "UTF8String"),  0,  8);
      [v7 appendBytes:&v10 length:1];
      v8 += 4LL;
      --v6;
    }

    while (v6);
  }

  return objc_msgSend( *(id *)(a1 + 32),  "replaceCharactersInRange:withString:",  a2,  a3,  (id)objc_msgSend(objc_alloc(NSString), "initWithData:encoding:", v7, 4));
}

@end