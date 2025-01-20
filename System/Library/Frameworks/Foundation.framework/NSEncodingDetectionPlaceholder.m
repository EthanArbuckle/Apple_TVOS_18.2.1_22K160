@interface NSEncodingDetectionPlaceholder
+ (id)placeholderForDetector:(id)a3;
- (NSString)string;
- (char)bytes;
- (id)debugDescription;
- (unint64_t)bytesLength;
- (unint64_t)nsEncoding;
- (unsigned)cfEncoding;
- (void)dealloc;
@end

@implementation NSEncodingDetectionPlaceholder

- (unint64_t)nsEncoding
{
  return self->nsEncoding;
}

- (unsigned)cfEncoding
{
  return self->cfEncoding;
}

- (NSString)string
{
  return self->string;
}

- (char)bytes
{
  return self->bytesStart;
}

- (unint64_t)bytesLength
{
  return self->bytesLength;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];

  bytes = self->bytes;
  if (bytes)
  {
    free(bytes);
    self->bytes = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSEncodingDetectionPlaceholder;
  -[NSEncodingDetectionPlaceholder dealloc](&v4, sel_dealloc);
}

+ (id)placeholderForDetector:(id)a3
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (qword_18C496518 != -1) {
    dispatch_once(&qword_18C496518, &__block_literal_global);
  }
  uint64_t v4 = [a3 nsEncoding];
  unsigned int v5 = [a3 cfEncoding];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_88);
  id v6 = (id)[(id)qword_18C496520 objectForKey:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_88);
  if (v6) {
    return v6;
  }
  size_t v8 = [@"#<^_NSEDR_^#<" lengthOfBytesUsingEncoding:v4];
  p_isa = (void *)v8;
  if (v8)
  {
    v20[0] = 0LL;
    if (v5 - 2080 <= 2)
    {
      v10 = (unsigned __int16 *)malloc(v8 + 3);
      if (!v10) {
        return 0LL;
      }
      v11 = v10;
      unsigned __int16 *v10 = 10267;
      *((_BYTE *)v10 + 2) = 66;
      if (objc_msgSend( @"#<^_NSEDR_^#<",  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  (char *)v10 + 3,  p_isa,  v20,  v4,  0,  0,  objc_msgSend(@"#<^_NSEDR_^#<", "length"),  0))
      {
        v20[0] += 3LL;
        v12 = v11;
LABEL_33:
        p_isa = 0LL;
        if (v12 && v11)
        {
          v18 = objc_alloc_init(&OBJC_CLASS___NSEncodingDetectionPlaceholder);
          p_isa = &v18->super.isa;
          if (v18)
          {
            v18->nsEncoding = v4;
            v18->cfEncoding = v5;
            v18->string = (NSString *)@"#<^_NSEDR_^#<";
            p_isa[4] = v12;
            p_isa[5] = v20[0];
            p_isa[6] = v11;
            v19 = p_isa;
            os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_88);
            [(id)qword_18C496520 setObject:p_isa forKey:v5];
            os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_88);
          }
        }

        return p_isa;
      }

      v16 = v11;
LABEL_19:
      free(v16);
      return 0LL;
    }

    v12 = (unsigned __int16 *)malloc(v8);
    if (!objc_msgSend( @"#<^_NSEDR_^#<",  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  v12,  p_isa,  v20,  v4,  0,  0,  objc_msgSend(@"#<^_NSEDR_^#<", "length"),  0))
    {
      v16 = v12;
      goto LABEL_19;
    }

    HIDWORD(v14) = v5 - 256;
    LODWORD(v14) = v5 - 256;
    unsigned int v13 = v14 >> 26;
    if (v13 <= 7)
    {
      if (((1 << v13) & 0x31) != 0)
      {
        int v17 = *v12;
        if (v17 == 65534 || v17 == 65279)
        {
          v11 = v12 + 1;
          uint64_t v15 = v20[0] - 2LL;
          goto LABEL_25;
        }
      }

      else if (((1 << v13) & 0xC8) != 0)
      {
        if (*(_DWORD *)v12 == 65534 || *(_DWORD *)v12 == 65279)
        {
          v11 = v12 + 2;
          uint64_t v15 = v20[0] - 4LL;
LABEL_25:
          v20[0] = v15;
          goto LABEL_33;
        }
      }

      else if (v13 == 2)
      {
        uint64_t v15 = v20[0] - 3LL;
        if (v20[0] >= 3uLL
          && *(unsigned __int8 *)v12 == 239
          && *((unsigned __int8 *)v12 + 1) == 187
          && *((unsigned __int8 *)v12 + 2) == 191)
        {
          v11 = (unsigned __int16 *)((char *)v12 + 3);
          goto LABEL_25;
        }
      }
    }

    v11 = v12;
    goto LABEL_33;
  }

  return p_isa;
}

NSMapTable *__57__NSEncodingDetectionPlaceholder_placeholderForDetector___block_invoke()
{
  result = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  1282LL,  0LL,  16LL);
  qword_18C496520 = (uint64_t)result;
  return result;
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSEncodingDetectionPlaceholder;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ string:%@ nsEncoding:%lu cfEncoding:%u bytes:%p bytesLength:%lu bytesStart:%p",  -[NSEncodingDetectionPlaceholder debugDescription](&v3, sel_debugDescription),  self->string,  self->nsEncoding,  self->cfEncoding,  self->bytes,  self->bytesLength,  self->bytesStart);
}

@end