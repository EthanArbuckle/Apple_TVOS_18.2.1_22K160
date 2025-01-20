CFStringRef __CFBasicHashCopyDescription(void *a1)
{
  CFAllocatorRef v2;
  __CFString *Mutable;
  uint64_t v4;
  const char *v5;
  const char *v6;
  unint64_t Count;
  CFAllocatorRef v8;
  CFStringRef v9;
  void v11[7];
  char v12;
  uint64_t v13;
  v13 = *MEMORY[0x1895F89C0];
  v2 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL);
  v4 = a1[2];
  if ((v4 & 0x380) != 0) {
    v5 = "multi";
  }
  else {
    v5 = "";
  }
  if ((v4 & 0x18) != 0) {
    v6 = "dict";
  }
  else {
    v6 = "set";
  }
  Count = CFBasicHashGetCount(a1);
  CFStringAppendFormat( Mutable,  0LL,  @"%@{type = %s %s%s, count = %ld,\n",  &stru_189CA6A28,  "mutable",  v5,  v6,  Count);
  CFStringAppendFormat(Mutable, 0LL, @"%@entries =>\n", &stru_189CA6A28);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __CFBasicHashCopyDescription_block_invoke;
  v11[3] = &__block_descriptor_57_e18_C64__0___qQQQQQQ_8l;
  v12 = 1;
  v11[4] = a1;
  v11[5] = Mutable;
  v11[6] = @"\t";
  CFBasicHashApply(a1, (uint64_t)v11);
  CFStringAppendFormat(Mutable, 0LL, @"%@}\n", &stru_189CA6A28);
  v8 = CFGetAllocator(a1);
  v9 = CFStringCreateWithFormat(v2, 0LL, @"<CFBasicHash %p [%p]>%@", a1, v8, Mutable);
  CFRelease(Mutable);
  return v9;
}

void __CFBasicHashDeallocate(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if ((v1 & 4) != 0)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a1 + 16) = *(void *)(a1 + 16);
    *(void *)(a1 + 24) = v1 | 4;
    __CFBasicHashDrain(a1, 1);
  }

void *CFBasicHashCreate(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (!__kCFBasicHashTypeID) {
    __kCFBasicHashTypeID = _CFRuntimeRegisterClass();
  }
  result = (void *)_CFRuntimeCreateInstance();
  if (result)
  {
    unint64_t v6 = result[2] & 0xFFFFFFFFFFFFFFFCLL | (a2 >> 13) & 3;
    unint64_t v7 = ((a2 & 0xA00) >> 5) | ((unint64_t)((unsigned __int16)a2 & 0x8000) >> 12) | result[3] & 0xFFFFFFFFFFFFLL | 0x1000000000000LL;
    if ((a2 & 8) != 0) {
      unint64_t v6 = result[2] & 0xFFFFFFFFFFFFFFE4LL | (a2 >> 13) & 3 | 8;
    }
    uint64_t v8 = 1LL;
    if ((a2 & 8) != 0) {
      uint64_t v8 = 2LL;
    }
    if ((a2 & 0x20) != 0)
    {
      unint64_t v6 = v6 & 0xFFFFFFFFFFFFFC7FLL | (v8 << 7);
      LOBYTE(v8) = v8 + 1;
    }

    if ((a2 & 0x80) != 0) {
      unint64_t v6 = v6 & 0xFFFFFFFFFFFF1FFFLL | ((unint64_t)(v8 & 7) << 13);
    }
    result[2] = v6;
    result[3] = v7;
    result[4] = a3;
  }

  else
  {
    __break(1u);
  }

  return result;
}

unint64_t ___CFBasicHashFindBucket2@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t result = (**(uint64_t (***)(void))(a1 + 32))();
  unint64_t v8 = *(void *)(a1 + 16);
  if ((v8 & 0x18) != 0)
  {
    uint64_t v9 = (v8 >> 3) & 3;
    if (!v9) {
      goto LABEL_55;
    }
    v10 = (uint64_t *)(a1 + 8 * v9 + 40);
  }

  else
  {
    v10 = (uint64_t *)(a1 + 40);
  }

  uint64_t v11 = *v10;
  if ((v8 & 0xE000) == 0)
  {
    uint64_t v12 = 0LL;
    goto LABEL_9;
  }

  if (!((unsigned __int16)v8 >> 13))
  {
LABEL_55:
    __break(1u);
    return result;
  }

  uint64_t v12 = *(void *)(a1 + 8LL * ((unsigned __int16)v8 >> 13) + 40);
LABEL_9:
  unint64_t v13 = (*(__int128 *)(a1 + 16) >> 32) & 0xFFFFFF0000000000LL;
  uint64_t v14 = ~v13;
  uint64_t v15 = (v8 >> 16) & 0x3F;
  unint64_t v16 = __CFBasicHashTableSizes[v15];
  *a4 = -1LL;
  a4[1] = ~v13;
  a4[2] = 0LL;
  a4[3] = ~v13;
  a4[5] = 0LL;
  a4[6] = 0LL;
  if (result / v16 % v16) {
    unint64_t v17 = result / v16 % v16;
  }
  else {
    unint64_t v17 = v16 - 1;
  }
  a4[4] = 0LL;
  if (!v15 || v15 == 63) {
    return result;
  }
  unint64_t v18 = result % v16;
  if (v16 <= 1) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = v16;
  }
  uint64_t v20 = -1LL;
  while (1)
  {
    unint64_t v21 = *(void *)(v11 + 8 * v18);
    if (v21 == v13)
    {
      if (v20 == -1)
      {
        a4[3] = v13;
        *a4 = v18;
        a4[1] = v13;
      }

      return result;
    }

    if (a3) {
      goto LABEL_20;
    }
    if (v21 == v14)
    {
      if (v20 == -1)
      {
        *a4 = v18;
        uint64_t v20 = v18;
      }

      goto LABEL_20;
    }

    if (v21 == a2) {
      break;
    }
    if (!v12 || *(void *)(v12 + 8 * v18) == result)
    {
      uint64_t v36 = v12;
      unint64_t v37 = result;
      uint64_t v34 = v20;
      uint64_t v35 = v14;
      char v23 = (**(uint64_t (***)(uint64_t, uint64_t, unint64_t, uint64_t))(a1 + 32))(a1, 20LL, v21, a2);
      uint64_t v20 = v34;
      uint64_t v14 = v35;
      BOOL v24 = v23 == 0LL;
      uint64_t v12 = v36;
      unint64_t result = v37;
      if (!v24) {
        goto LABEL_37;
      }
    }

unint64_t ___CFBasicHashFindBucket3@<X0>( uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t result = (**(uint64_t (***)(void))(a1 + 32))();
  uint64_t v7 = a1;
  unint64_t v8 = *(void *)(a1 + 16);
  if ((v8 & 0x18) != 0)
  {
    uint64_t v9 = (v8 >> 3) & 3;
    if (!v9) {
      goto LABEL_56;
    }
    v10 = (uint64_t *)(a1 + 8 * v9 + 40);
  }

  else
  {
    v10 = (uint64_t *)(a1 + 40);
  }

  uint64_t v11 = *v10;
  if ((v8 & 0xE000) == 0)
  {
    uint64_t v12 = 0LL;
    goto LABEL_9;
  }

  if (!((unsigned __int16)v8 >> 13))
  {
LABEL_56:
    __break(1u);
    return result;
  }

  uint64_t v12 = *(void *)(a1 + 8LL * ((unsigned __int16)v8 >> 13) + 40);
LABEL_9:
  unint64_t v13 = (*(__int128 *)(a1 + 16) >> 32) & 0xFFFFFF0000000000LL;
  uint64_t v14 = ~v13;
  uint64_t v15 = (v8 >> 16) & 0x3F;
  unint64_t v16 = __CFBasicHashTableSizes[v15];
  *a4 = -1LL;
  a4[1] = ~v13;
  a4[2] = 0LL;
  a4[3] = ~v13;
  a4[5] = 0LL;
  a4[6] = 0LL;
  if (result / v16 % v16) {
    unint64_t v17 = result / v16 % v16;
  }
  else {
    unint64_t v17 = v16 - 1;
  }
  a4[4] = 0LL;
  v43 = a4;
  int v18 = a3;
  if (!v15 || v15 == 63) {
    return result;
  }
  uint64_t v19 = __CFBasicHashPrimitiveRoots[v15];
  unint64_t v20 = result % v16;
  if (v16 <= 1) {
    uint64_t v21 = 1LL;
  }
  else {
    uint64_t v21 = v16;
  }
  uint64_t v22 = -1LL;
  unint64_t v23 = __CFBasicHashPrimitiveRoots[v15];
  unint64_t v24 = result % v16;
  while (1)
  {
    unint64_t v25 = *(void *)(v11 + 8 * v24);
    if (v25 == v13)
    {
      if (v22 == -1)
      {
        v43[3] = v13;
        unint64_t *v43 = v24;
        v43[1] = v13;
      }

      return result;
    }

    if (v18) {
      goto LABEL_20;
    }
    if (v25 == v14)
    {
      if (v22 == -1)
      {
        unint64_t *v43 = v24;
        uint64_t v22 = v24;
      }

      goto LABEL_20;
    }

    if (v25 == a2) {
      break;
    }
    if (!v12 || *(void *)(v12 + 8 * v24) == result)
    {
      unint64_t v40 = result;
      uint64_t v41 = v7;
      uint64_t v38 = v14;
      uint64_t v39 = v12;
      uint64_t v37 = v22;
      char v26 = (**(uint64_t (***)(uint64_t, uint64_t, unint64_t, uint64_t))(v7 + 32))(v7, 20LL, v25, a2);
      uint64_t v22 = v37;
      uint64_t v14 = v38;
      int v18 = a3;
      BOOL v27 = v26 == 0LL;
      uint64_t v12 = v39;
      unint64_t result = v40;
      uint64_t v7 = v41;
      if (!v27) {
        goto LABEL_38;
      }
    }

uint64_t __CFBasicHashFindNewMarker(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v12 = *(void *)(result + 16);
  unint64_t v11 = *(void *)(result + 24);
  if ((v12 & 0x18) != 0)
  {
    uint64_t v13 = (v12 >> 3) & 3;
    if (!v13)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }

    uint64_t v14 = (uint64_t **)(result + 8 * v13 + 40);
    char v15 = 70;
  }

  else
  {
    uint64_t v14 = (uint64_t **)(result + 40);
    char v15 = 68;
  }

  unint64_t v4 = v11 >> 8 << 40;
  uint64_t v5 = ~v4;
  unint64_t v6 = *v14;
  a4 = (v12 >> 16) & 0x3F;
  uint64_t v16 = __CFBasicHashTableSizes[a4];
  uint64_t v13 = 4097LL;
  uint64_t v7 = (1LL << v15) & v11;
  uint64_t v8 = 0LL;
  if (v16 <= 1) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = __CFBasicHashTableSizes[a4];
  }
  while (1)
  {
    uint64_t v10 = v13 << 40;
    if (v13 << 40 != a2)
    {
      a3 = ~(v13 << 40);
      if (a3 != a2)
      {
        if (!a4 || a4 == 63) {
          goto LABEL_34;
        }
        uint64_t v17 = 0LL;
        BOOL v18 = 1;
        uint64_t v19 = v6;
        while (*v19 != v10 && *v19 != a3)
        {
          BOOL v18 = ++v17 < v16;
          ++v19;
          if (v9 == v17) {
            goto LABEL_24;
          }
        }

        if (!v18) {
          break;
        }
      }
    }

    if (++v13 == 0x4000000) {
      goto LABEL_23;
    }
  }

void *initUAUserActivity()
{
  if (qword_18C496E70
    || (unint64_t result = dlopen("/System/Library/PrivateFrameworks/UserActivity.framework/UserActivity", 2),
        (qword_18C496E70 = (uint64_t)result) != 0))
  {
    unint64_t result = objc_getClass("UAUserActivity");
    qword_18C496E68 = (uint64_t)result;
    getUAUserActivityClass = UAUserActivityFunction;
  }

  return result;
}

uint64_t UAUserActivityFunction()
{
  return qword_18C496E68;
}

uint64_t __supportsUserActivityAppLinks_block_invoke()
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t result = [getUAUserActivityClass() supportsUserActivityAppLinks];
  }
  else {
    uint64_t result = 0LL;
  }
  _MergedGlobals_140 = result;
  return result;
}

void *initUAContinuityErrorDomain()
{
  uint64_t result = (void *)qword_18C496E70;
  if (qword_18C496E70
    || (uint64_t result = dlopen("/System/Library/PrivateFrameworks/UserActivity.framework/UserActivity", 2),
        (qword_18C496E70 = (uint64_t)result) != 0))
  {
    uint64_t result = *(void **)dlsym(result, "UAContinuityErrorDomain");
    qword_18C496E80 = (uint64_t)result;
    getUAContinuityErrorDomain = UAContinuityErrorDomainFunction;
  }

  return result;
}

uint64_t UAContinuityErrorDomainFunction()
{
  return qword_18C496E80;
}

uint64_t ___writeJSONObject_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v3 + 8 * a2);
  uint64_t v5 = *(void *)(v3 + 8 * a3);
  uint64_t v6 = [v4 length];
  return objc_msgSend( v4,  "compare:options:range:locale:",  v5,  577,  0,  v6,  objc_msgSend(MEMORY[0x189603F90], "systemLocale"));
}

uint64_t skipJSON5Comment(uint64_t *a1, char a2, void *a3)
{
  v20[2] = *MEMORY[0x1895F89C0];
  unint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  if ((a2 & 1) != 0)
  {
    if (v4 > v5)
    {
      uint64_t v6 = *a1;
      while (1)
      {
        int v7 = *(unsigned __int8 *)(v6 + v5);
        if (v7 == 13) {
          break;
        }
        if (v7 == 10)
        {
          a1[3] = v5 + 1;
          ++a1[5];
          a1[6] = v5 + 1;
          return 1LL;
        }

        a1[3] = ++v5;
        if (v4 == v5) {
          goto LABEL_20;
        }
      }

      unint64_t v18 = v5 + 1;
      a1[3] = v5 + 1;
      if (v4 > v5 + 1 && *(_BYTE *)(v6 + v5 + 1) == 10)
      {
        unint64_t v18 = v5 + 2;
        a1[3] = v5 + 2;
      }

      ++a1[5];
      a1[6] = v18;
      return 1LL;
    }

uint64_t __newJSONString_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  objc_msgSend( @"[[:Lu:][:Ll:][:Lt:][:Lm:][:Lo:][:Nl:]]",  "getCharacters:",  (char *)&v1 - ((2 * objc_msgSend(@"[[:Lu:][:Ll:][:Lt:][:Lm:][:Lo:][:Nl:]]", "length") + 17) & 0xFFFFFFFFFFFFFFF0));
  HIDWORD(v1) = 0;
  [@"[[:Lu:][:Ll:][:Lt:][:Lm:][:Lo:][:Nl:]]" length];
  uint64_t result = uset_openPattern();
  qword_18C496E90 = result;
  if (SHIDWORD(v1) >= 1)
  {
    qword_18C5D6210 = (uint64_t)"Unable to open unicode pattern";
    __break(1u);
  }

  return result;
}

void __newJSONString_block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  *a3 = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
}

uint64_t parseJSONUnicodePointAtLocation( void *a1, unint64_t a2, unint64_t a3, _WORD *a4, void *a5)
{
  v23[2] = *MEMORY[0x1895F89C0];
  if (a2 + 3 > a3)
  {
    a1[3] = a2;
    if (a5)
    {
      unint64_t v7 = a1[6];
      BOOL v8 = a2 >= v7;
      uint64_t v9 = a2 - v7;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0LL;
      }
      unint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Early end of unicode escape sequence",  a1[5],  v10);
      goto LABEL_7;
    }

    return 0LL;
  }

  int v15 = 0;
  uint64_t v16 = 16LL;
  while (1)
  {
    int v17 = *(unsigned __int8 *)(*a1 + a2);
    unsigned __int8 v18 = v17 - 48;
LABEL_15:
    ++a2;
    v16 -= 4LL;
    v15 += v18 << v16;
    if (!v16)
    {
      *a4 = v15;
      return 1LL;
    }
  }

  if ((v17 - 65) <= 5)
  {
    unsigned __int8 v18 = v17 - 55;
    goto LABEL_15;
  }

  if ((v17 - 97) <= 5)
  {
    unsigned __int8 v18 = v17 - 87;
    goto LABEL_15;
  }

  a1[3] = a2;
  if (a5)
  {
    unint64_t v19 = a1[6];
    BOOL v8 = a2 >= v19;
    uint64_t v20 = a2 - v19;
    if (v8) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0LL;
    }
    unint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Invalid hex digit in unicode escape sequence",  a1[5],  v21);
LABEL_7:
    BOOL v12 = v11;
    unint64_t v13 = -[NSNumber initWithUnsignedInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithUnsignedInteger:", a1[3]);
    v22[0] = @"NSDebugDescription";
    v22[1] = @"NSJSONSerializationErrorIndex";
    v23[0] = v12;
    v23[1] = v13;
    *a5 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840,  [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:2]);
  }

  return 0LL;
}

NSString *newJSON5HexNumber(NSString *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v81 = *MEMORY[0x1895F89C0];
  unint64_t isa = (unint64_t)result[3].super.isa;
  Class v5 = result->super.isa;
  uint64_t v6 = (unsigned __int8 *)result->super.isa + isa;
  int v7 = *v6;
  int v8 = v7;
  uint64_t v9 = (objc_class *)isa;
  if (v7 == 45)
  {
    uint64_t v9 = (objc_class *)(isa + 1);
    if (result[2].super.isa <= (Class)(isa + 1))
    {
      if (a2)
      {
        Class v42 = result[6].super.isa;
        BOOL v35 = isa >= (unint64_t)v42;
        unint64_t v43 = isa - (void)v42;
        if (v35) {
          unint64_t v44 = v43;
        }
        else {
          unint64_t v44 = 0LL;
        }
        uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Number with minus sign but no digits",  result[5].super.isa,  v44);
        goto LABEL_77;
      }

      return 0LL;
    }

    result[3].super.unint64_t isa = v9;
    int v8 = *((unsigned __int8 *)&v9->isa + (void)v5);
  }

  if (v8 != 48)
  {
    if (a2)
    {
      Class v39 = result[6].super.isa;
      BOOL v35 = v9 >= v39;
      int64_t v40 = (char *)v9 - (char *)v39;
      if (v35) {
        int64_t v41 = v40;
      }
      else {
        int64_t v41 = 0LL;
      }
      uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number without leading zero",  result[5].super.isa,  v41);
      goto LABEL_77;
    }

    return 0LL;
  }

  uint64_t v10 = (objc_class *)((char *)&v9->isa + 1);
  unint64_t v11 = (unint64_t)result[2].super.isa;
  if (v11 <= (unint64_t)&v9->isa + 1)
  {
    if (!a2) {
      return 0LL;
    }
    Class v45 = result[6].super.isa;
    BOOL v35 = v9 >= v45;
    int64_t v46 = (char *)v9 - (char *)v45;
    if (v35) {
      int64_t v47 = v46;
    }
    else {
      int64_t v47 = 0LL;
    }
    v48 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Unexpected end of file during JSON parse.",  result[5].super.isa,  v47);
    v49 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  v3[3].super.isa);
    v77 = @"NSDebugDescription";
    v78 = @"NSJSONSerializationErrorIndex";
    v79 = v48;
    v80 = v49;
    *a2 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840,  [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v77 count:2]);

    Class v50 = v3[3].super.isa;
    Class v51 = v3[6].super.isa;
    BOOL v35 = v50 >= v51;
    int64_t v52 = (char *)v50 - (char *)v51;
    if (v35) {
      uint64_t v53 = v52;
    }
    else {
      uint64_t v53 = 0LL;
    }
    v54 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number without next 'x'",  v3[5].super.isa,  v53);
    goto LABEL_86;
  }

  result[3].super.unint64_t isa = v10;
  if ((*((unsigned __int8 *)&v10->isa + (void)v5) | 0x20) != 0x78)
  {
    if (a2)
    {
      Class v55 = result[6].super.isa;
      BOOL v35 = v10 >= v55;
      int64_t v56 = (char *)v10 - (char *)v55;
      if (v35) {
        int64_t v57 = v56;
      }
      else {
        int64_t v57 = 0LL;
      }
      uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number without 'x'",  result[5].super.isa,  v57);
      goto LABEL_77;
    }

    return 0LL;
  }

  BOOL v12 = (objc_class *)((char *)&v9->isa + 2);
  if (v11 <= (unint64_t)&v9->isa + 2)
  {
    if (!a2) {
      return 0LL;
    }
    Class v61 = result[6].super.isa;
    BOOL v35 = v10 >= v61;
    int64_t v62 = (char *)v10 - (char *)v61;
    if (v35) {
      int64_t v63 = v62;
    }
    else {
      int64_t v63 = 0LL;
    }
    v64 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Unexpected end of file during JSON parse.",  result[5].super.isa,  v63);
    v65 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  v3[3].super.isa);
    v77 = @"NSDebugDescription";
    v78 = @"NSJSONSerializationErrorIndex";
    v79 = v64;
    v80 = v65;
    *a2 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840,  [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v77 count:2]);

    Class v66 = v3[3].super.isa;
    Class v67 = v3[6].super.isa;
    BOOL v35 = v66 >= v67;
    int64_t v68 = (char *)v66 - (char *)v67;
    if (v35) {
      uint64_t v69 = v68;
    }
    else {
      uint64_t v69 = 0LL;
    }
    v54 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number without next digit (EoF)",  v3[5].super.isa,  v69);
LABEL_86:
    v58 = v54;
    v59 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  v3[3].super.isa);
    v77 = @"NSDebugDescription";
    v78 = @"NSJSONSerializationErrorIndex";
    v79 = v58;
    v80 = v59;
    uint64_t v60 = [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v77 count:2];
    goto LABEL_87;
  }

  result[3].super.unint64_t isa = v12;
  if ((*((_BYTE *)&v12->isa + (void)v5) - 48) >= 0xAu
    && ((unsigned int v13 = *((unsigned __int8 *)&v12->isa + (void)v5) - 65,
         BOOL v14 = v13 > 0x25,
         uint64_t v15 = (1LL << v13) & 0x3F0000003FLL,
         !v14)
      ? (BOOL v16 = v15 == 0)
      : (BOOL v16 = 1),
        v16))
  {
    if (a2)
    {
      Class v74 = result[6].super.isa;
      BOOL v35 = v12 >= v74;
      int64_t v75 = (char *)v12 - (char *)v74;
      if (v35) {
        int64_t v76 = v75;
      }
      else {
        int64_t v76 = 0LL;
      }
      uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number without next digit",  result[5].super.isa,  v76);
      goto LABEL_77;
    }
  }

  else
  {
    int v17 = (objc_class *)((char *)&v9->isa + 3);
    if (v11 <= (unint64_t)v17)
    {
LABEL_21:
      result[3].super.unint64_t isa = v17;
    }

    else
    {
      while (1)
      {
        result[3].super.unint64_t isa = v17;
        if ((*((_BYTE *)&v17->isa + (void)v5) - 48) > 9u)
        {
          unsigned int v18 = *((unsigned __int8 *)&v17->isa + (void)v5) - 65;
          BOOL v14 = v18 > 0x25;
          uint64_t v19 = (1LL << v18) & 0x3F0000003FLL;
          if (v14 || v19 == 0) {
            break;
          }
        }

        int v17 = (objc_class *)((char *)v17 + 1);
        if ((objc_class *)v11 == v17)
        {
          int v17 = (objc_class *)v11;
          goto LABEL_21;
        }
      }
    }

    unint64_t v21 = 0LL;
    uint64_t v22 = (unsigned __int8 *)v17 + (void)v5 - 1;
    if (v7 == 45) {
      ++v6;
    }
    unint64_t v23 = v6 + 2;
    unint64_t v24 = 1LL;
    do
    {
      if (v22 < v23)
      {
        if (v7 == 45)
        {
          if (v21 > 0x8000000000000000LL)
          {
            if (a2)
            {
              Class v71 = result[6].super.isa;
              BOOL v35 = v17 >= v71;
              int64_t v72 = (char *)v17 - (char *)v71;
              if (v35) {
                int64_t v73 = v72;
              }
              else {
                int64_t v73 = 0LL;
              }
              uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number with underflow",  result[5].super.isa,  v73);
              goto LABEL_77;
            }

            return 0LL;
          }

          v70 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", -(uint64_t)v21);
        }

        else
        {
          v70 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  v21);
        }

        return newJSONNumberCreateRoundTripping((uint64_t)v3, isa, v70);
      }

      int v25 = *v22;
      unsigned __int8 v26 = v25 - 48;
      if ((v25 - 48) >= 0xA)
      {
        if ((v25 - 65) > 5)
        {
          if ((v25 - 97) > 5)
          {
            __break(1u);
            return result;
          }

          unsigned __int8 v26 = v25 - 87;
        }

        else
        {
          unsigned __int8 v26 = v25 - 55;
        }
      }

      BOOL v27 = 0;
      unint64_t v28 = 0LL;
      if (v24 && v26)
      {
        unint64_t v28 = v24 * v26;
        BOOL v27 = __CFADD__(v21, v28) || (v26 * (unsigned __int128)v24) >> 64 != 0;
      }

      --v22;
      if (v24 >> 60) {
        int v30 = 1;
      }
      else {
        int v30 = v27;
      }
      uint64_t v31 = 16 * v24;
      if (v22 >= v23)
      {
        BOOL v32 = v24 == 0;
      }

      else
      {
        uint64_t v31 = v24;
        BOOL v32 = 1;
      }

      v21 += v28;
      if (v32) {
        int v33 = v27;
      }
      else {
        int v33 = v30;
      }
      unint64_t v24 = v31;
    }

    while (!v33);
    if (!a2) {
      return 0LL;
    }
    Class v34 = result[6].super.isa;
    BOOL v35 = v17 >= v34;
    int64_t v36 = (char *)v17 - (char *)v34;
    if (v35) {
      int64_t v37 = v36;
    }
    else {
      int64_t v37 = 0LL;
    }
    uint64_t v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Hex number with underflow or overflow",  result[5].super.isa,  v37);
LABEL_77:
    v58 = v38;
    v59 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  v3[3].super.isa);
    v77 = @"NSDebugDescription";
    v78 = @"NSJSONSerializationErrorIndex";
    v79 = v58;
    v80 = v59;
    uint64_t v60 = [MEMORY[0x189603F68] dictionaryWithObjects:&v79 forKeys:&v77 count:2];
LABEL_87:
    *a2 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840LL,  v60);
  }

  return 0LL;
}

NSNumber *newJSON5InfinityOrNaN(uint64_t *a1, void *a2)
{
  v36[2] = *MEMORY[0x1895F89C0];
  unint64_t v4 = a1[3];
  uint64_t v5 = *a1;
  int v6 = *(unsigned __int8 *)(*a1 + v4);
  if (v6 == 45 || v6 == 43)
  {
    unint64_t v7 = v4 + 1;
    if (a1[2] <= v4 + 1)
    {
      if (a2)
      {
        unint64_t v9 = a1[6];
        BOOL v10 = v4 >= v9;
        uint64_t v11 = v4 - v9;
        if (v10) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0LL;
        }
        unsigned int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Partial negative infinity or NaN around character %lu (EoF).",  a1[5],  v12);
        goto LABEL_42;
      }

      return 0LL;
    }

    a1[3] = v7;
    int v8 = *(unsigned __int8 *)(v5 + v7);
  }

  else
  {
    int v8 = *(unsigned __int8 *)(*a1 + v4);
    unint64_t v7 = a1[3];
  }

  BOOL v14 = (const char *)(v5 + v7);
  if (v8 == 78)
  {
    if (a1[2] <= v7 + 2)
    {
      a1[3] = v7;
      if (a2)
      {
        unint64_t v27 = a1[6];
        BOOL v10 = v7 >= v27;
        uint64_t v28 = v7 - v27;
        if (v10) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = 0LL;
        }
        unsigned int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Partial NaN around character %lu (EoF).",  a1[5],  v29);
        goto LABEL_42;
      }

      return 0LL;
    }

    a1[3] = v7 + 2;
    if (strncmp(v14, "NaN", 3uLL))
    {
      a1[3] = v7;
      if (a2)
      {
        unint64_t v18 = a1[6];
        BOOL v10 = v7 >= v18;
        uint64_t v19 = v7 - v18;
        if (v10) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = 0LL;
        }
        unsigned int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Invalid NaN around character %lu (EoF).",  a1[5],  v20);
        goto LABEL_42;
      }

      return 0LL;
    }

    if (v6 == 45) {
      double v33 = NAN;
    }
    else {
      double v33 = NAN;
    }
    unint64_t v34 = v7 + 3;
  }

  else
  {
    if (v8 != 73)
    {
      a1[3] = v7;
      if (a2)
      {
        unint64_t v21 = a1[6];
        BOOL v10 = v7 >= v21;
        uint64_t v22 = v7 - v21;
        if (v10) {
          uint64_t v23 = v22;
        }
        else {
          uint64_t v23 = 0LL;
        }
        unsigned int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Invalid Infinity or NaN",  a1[5],  v23);
        goto LABEL_42;
      }

      return 0LL;
    }

    if (a1[2] <= v7 + 7)
    {
      a1[3] = v7;
      if (a2)
      {
        unint64_t v24 = a1[6];
        BOOL v10 = v7 >= v24;
        uint64_t v25 = v7 - v24;
        if (v10) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = 0LL;
        }
        unsigned int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Partial infinity around character %lu (EoF).",  a1[5],  v26);
        goto LABEL_42;
      }

      return 0LL;
    }

    a1[3] = v7 + 7;
    if (strncmp(v14, "Infinity", 8uLL))
    {
      a1[3] = v7;
      if (a2)
      {
        unint64_t v15 = a1[6];
        BOOL v10 = v7 >= v15;
        uint64_t v16 = v7 - v15;
        if (v10) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 0LL;
        }
        unsigned int v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ around line %lu, column %lu.",  @"Invalid infinity around character %lu (EoF).",  a1[5],  v17);
LABEL_42:
        int v30 = v13;
        uint64_t v31 = -[NSNumber initWithUnsignedInteger:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInteger:",  a1[3]);
        v35[0] = @"NSDebugDescription";
        v35[1] = @"NSJSONSerializationErrorIndex";
        v36[0] = v30;
        v36[1] = v31;
        *a2 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3840,  [MEMORY[0x189603F68] dictionaryWithObjects:v36 forKeys:v35 count:2]);

        return 0LL;
      }

      return 0LL;
    }

    if (v6 == 45) {
      double v33 = -INFINITY;
    }
    else {
      double v33 = INFINITY;
    }
    unint64_t v34 = v7 + 8;
  }

  a1[3] = v34;
  return -[NSNumber initWithDouble:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithDouble:", v33);
}

uint64_t _NSLinguisticDataPath()
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t result = _NSLinguisticDataPath_dataPath;
  if (!_NSLinguisticDataPath_dataPath)
  {
    uint64_t v1 = (const __CFString *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "objectForKey:",  @"NSLinguisticDataPath");
    if (!v1 || (_NSIsNSString() & 1) == 0)
    {
      uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      uint64_t v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0LL; i != v4; ++i)
          {
            if (*(void *)v13 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = [*(id *)(*((void *)&v12 + 1) + 8 * i) stringByAppendingPathComponent:@"LinguisticData"];
            if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v7))
            {
              uint64_t v1 = (const __CFString *)v7;
              goto LABEL_14;
            }
          }

          uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
          if (v4) {
            continue;
          }
          break;
        }
      }

uint64_t joinTokensInRange(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result)
  {
    if (a3 >= 2)
    {
      unint64_t v3 = a2 + a3;
      unint64_t v4 = qword_18C496FA0;
      if (a2 + a3 <= qword_18C496FA0)
      {
        uint64_t v5 = (__int128 *)(result + 16 * v3);
        int v6 = (_BYTE *)(result + 16 * a2);
        v6[2] = *((_BYTE *)v5 - 14) + *((_BYTE *)v5 - 16) - *v6;
        if (v3 < v4)
        {
          uint64_t v7 = v6 + 16;
          do
          {
            __int128 v8 = *v5++;
            *v7++ = v8;
            ++v3;
          }

          while (v3 < v4);
        }

        qword_18C496FA0 = v4 - a3 + 1;
      }
    }
  }

  return result;
}

uint64_t sentenceRangeAtIndexInTokens( unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t *a6)
{
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (!a5)
  {
    unint64_t v19 = 0LL;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_68;
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  while (2)
  {
    unint64_t v11 = v9;
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = v8;
    __int128 v13 = (unsigned __int16 *)(a4 + 16 * v8);
    while (1)
    {
      if (v9) {
        uint64_t v14 = *v13;
      }
      else {
        uint64_t v14 = 0LL;
      }
      uint64_t v15 = v9 + 1;
      unint64_t v16 = a3;
      if (v9 + 1 < a5) {
        unint64_t v16 = v13[8];
      }
      unint64_t v17 = v14 + a2;
      if (v16 + a2 > a1 && v17 <= a1) {
        unint64_t v12 = v9;
      }
      if (*((_BYTE *)v13 + 3) == 2) {
        break;
      }
      v13 += 8;
      ++v9;
      if (a5 == v15)
      {
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v19 = 0LL;
LABEL_22:
          uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_68;
        }

        goto LABEL_24;
      }
    }

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v9 + 1;
      unint64_t v10 = v11;
      if (a5 - 1 != v9) {
        continue;
      }
      unint64_t v19 = 0LL;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_22;
    }

    break;
  }

id tagForNLTag(void *a1)
{
  if (qword_18C496FE8 == -1)
  {
    if (a1) {
      goto LABEL_3;
    }
    return 0LL;
  }

  dispatch_once(&qword_18C496FE8, &__block_literal_global_441);
  if (!a1) {
    return 0LL;
  }
LABEL_3:
  id result = (id)[(id)qword_18C496FE0 objectForKey:a1];
  if (!result) {
    return a1;
  }
  return result;
}

void sub_18367ADB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void sub_18367DB28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void __loadNLTagger_block_invoke()
{
  v0 = (const char *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)_NSLinguisticDataPath(), "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  @"PrivateFrameworks/CoreNLP.framework/CoreNLP"),  "fileSystemRepresentation");
  uint64_t v1 = dlopen(v0, 256);
  if (v1)
  {
    uint64_t v2 = v1;
    off_18C496EB8 = (uint64_t (*)(void, void))dlsym(v1, "NLTaggerCreate");
    off_18C496F50 = (uint64_t (*)(void, void))dlsym(v2, "NLTaggerSetString");
    off_18C496F60 = (uint64_t (*)(void, void, void, void))dlsym(v2, "NLTaggerSetLocaleForRange");
    off_18C496F58 = (uint64_t (*)(void, void, void, void))dlsym(v2, "NLTaggerSetStringEditedInRange");
    off_18C496F80 = (uint64_t (*)(void, void, void, void, void, void))dlsym( v2,  "NLTaggerEnumerateTokens");
    off_18C496F88 = (uint64_t (*)(void, void))dlsym(v2, "NLTaggerCopyTagForCurrentToken");
    off_18C496F78 = (void *(*)(void *__return_ptr, void, void, void))dlsym( v2,  "NLTaggerGetTokenAtIndex");
    off_18C496F68 = (uint64_t (*)(void, void, void, void))dlsym(v2, "NLTaggerCopyTagAtIndex");
    off_18C496EA0 = (uint64_t (*)(void, void))dlsym(v2, "NLTaggerCopyAvailableTagSchemes");
    off_18C496F70 = (uint64_t (*)(void, void, void))dlsym(v2, "NLTaggerCopyLanguageMapAtIndex");
  }

  if (off_18C496EB8) {
    BOOL v3 = off_18C496F50 == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3
    || off_18C496F60 == 0LL
    || off_18C496F58 == 0LL
    || off_18C496F80 == 0LL
    || off_18C496F88 == 0LL
    || off_18C496F78 == 0LL
    || off_18C496F68 == 0LL
    || off_18C496EA0 == 0LL)
  {
    _MergedGlobals_142 = 0;
    unint64_t v11 = off_18C496F70;
  }

  else
  {
    _MergedGlobals_142 = off_18C496F70 != 0LL;
    if (off_18C496F70) {
      return;
    }
    unint64_t v11 = 0LL;
  }

  NSLog( (NSString *)@"NSLinguisticTagger failed to load NLTagger, results %p %p %p %p %p %p %p %p %p %p",  off_18C496EB8,  off_18C496F50,  off_18C496F60,  off_18C496F58,  off_18C496F80,  off_18C496F88,  off_18C496F78,  off_18C496F68,  off_18C496EA0,  v11);
}

id __tagForNLTag_block_invoke()
{
  v2[31] = *MEMORY[0x1895F89C0];
  v1[0] = @"Word";
  v1[1] = @"Punctuation";
  v2[0] = @"Word";
  v2[1] = @"Punctuation";
  v1[2] = @"Whitespace";
  v1[3] = @"Other";
  v2[2] = @"Whitespace";
  v2[3] = @"Other";
  v1[4] = @"Noun";
  v1[5] = @"Verb";
  v2[4] = @"Noun";
  v2[5] = @"Verb";
  v1[6] = @"Adjective";
  v1[7] = @"Adverb";
  v2[6] = @"Adjective";
  v2[7] = @"Adverb";
  v1[8] = @"Pronoun";
  v1[9] = @"Determiner";
  v2[8] = @"Pronoun";
  v2[9] = @"Determiner";
  v1[10] = @"Particle";
  v1[11] = @"Preposition";
  v2[10] = @"Particle";
  v2[11] = @"Preposition";
  v1[12] = @"Number";
  v1[13] = @"Conjunction";
  v2[12] = @"Number";
  v2[13] = @"Conjunction";
  v1[14] = @"Interjection";
  v1[15] = @"Classifier";
  v2[14] = @"Interjection";
  v2[15] = @"Classifier";
  v1[16] = @"Idiom";
  v1[17] = @"OtherWord";
  v2[16] = @"Idiom";
  v2[17] = @"OtherWord";
  v1[18] = @"SentenceTerminator";
  v1[19] = @"OpenQuote";
  v2[18] = @"SentenceTerminator";
  v2[19] = @"OpenQuote";
  v1[20] = @"CloseQuote";
  v1[21] = @"OpenParenthesis";
  v2[20] = @"CloseQuote";
  v2[21] = @"OpenParenthesis";
  v1[22] = @"CloseParenthesis";
  v1[23] = @"WordJoiner";
  v2[22] = @"CloseParenthesis";
  v2[23] = @"WordJoiner";
  v1[24] = @"Dash";
  v1[25] = @"Punctuation";
  v2[24] = @"Dash";
  v2[25] = @"Punctuation";
  v1[26] = @"ParagraphBreak";
  v1[27] = @"Whitespace";
  v2[26] = @"ParagraphBreak";
  v2[27] = @"Whitespace";
  v1[28] = @"PersonalName";
  v1[29] = @"PlaceName";
  v2[28] = @"PersonalName";
  v2[29] = @"PlaceName";
  v1[30] = @"OrganizationName";
  v2[30] = @"OrganizationName";
  id result = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v2 forKeys:v1 count:31];
  qword_18C496FE0 = (uint64_t)result;
  return result;
}

const void *getLXLemmatizer(__CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1;
  if (qword_18C496FF8 != -1) {
    dispatch_once(&qword_18C496FF8, &__block_literal_global_606);
  }
  Value = 0LL;
  if (off_18C497000 && off_18C497008)
  {
    [(id)qword_18C497010 lock];
    Mutable = (const __CFDictionary *)qword_18C496FF0;
    if (!qword_18C496FF0)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], 0LL);
      qword_18C496FF0 = (uint64_t)Mutable;
    }

    Value = CFDictionaryGetValue(Mutable, v1);
    if (!Value)
    {
      Value = (const void *)off_18C497000(v1, 0LL);
      if (Value)
      {
        unint64_t v4 = v1;
        uint64_t v5 = Value;
      }

      else
      {
        uint64_t v5 = (const void *)*MEMORY[0x189605018];
        unint64_t v4 = v1;
      }

      CFDictionaryAddValue((CFMutableDictionaryRef)qword_18C496FF0, v4, v5);
    }

    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFNullGetTypeID()) {
      Value = 0LL;
    }
    [(id)qword_18C497010 unlock];
  }

  return Value;
}

NSString *lemmatizerLemmaForStringWithCategory(uint64_t a1, void *a2, int a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [(id)qword_18C497010 lock];
  uint64_t v17 = 0LL;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  else {
    char v6 = byte_18399EA38[(char)(a3 - 16)];
  }
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __lemmatizerLemmaForStringWithCategory_block_invoke;
  v11[3] = &unk_189CA2548;
  v11[5] = &v17;
  v11[6] = a1;
  char v12 = v6;
  v11[4] = &v13;
  enumerateNormalizedStrings(a2, (uint64_t)v11);
  if (v18[3] || v14[3])
  {
    uint64_t v7 = +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:");
    uint64_t v8 = (const void *)v18[3];
    if (v8) {
      CFRelease(v8);
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v9 = (const void *)v14[3];
  if (v9) {
    CFRelease(v9);
  }
  [(id)qword_18C497010 unlock];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void sub_18367E2E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

uint64_t lemmatizerAddTagsForString(uint64_t a1, void *a2, uint64_t a3)
{
  v7[6] = *MEMORY[0x1895F89C0];
  [(id)qword_18C497010 lock];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __lemmatizerAddTagsForString_block_invoke;
  v7[3] = &unk_189CA25C0;
  v7[4] = a3;
  v7[5] = a1;
  enumerateNormalizedStrings(a2, (uint64_t)v7);
  return [(id)qword_18C497010 unlock];
}

uint64_t __tagForWordToken_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 integerValue];
  uint64_t v7 = [a2 integerValue];
  else {
    return 1LL;
  }
}

NSLock *__getLXLemmatizer_block_invoke()
{
  v0 = (const char *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend((id)_NSLinguisticDataPath(), "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  @"PrivateFrameworks/Lexicon.framework/Lexicon"),  "fileSystemRepresentation");
  uint64_t v1 = dlopen(v0, 256);
  if (v1)
  {
    uint64_t v2 = v1;
    off_18C497000 = (uint64_t (*)(void, void))dlsym(v1, "LXLemmatizerCreate");
    off_18C497008 = (uint64_t (*)(void, void, void))dlsym(v2, "LXLemmatizerEnumerateLemmasforString");
  }

  id result = objc_alloc_init(&OBJC_CLASS___NSLock);
  qword_18C497010 = (uint64_t)result;
  return result;
}

uint64_t enumerateNormalizedStrings(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((byte_18C496E99 & 1) == 0)
  {
    uint64_t v12 = 0x20182019201C201DLL;
    qword_18C497018 = -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  (char *)&v12 + 6,  1LL);
    qword_18C497020 = -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  (char *)&v12 + 4,  1LL);
    qword_18C497028 = -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  (char *)&v12 + 2,  1LL);
    qword_18C497030 = -[NSString initWithCharacters:length:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCharacters:length:",  &v12,  1LL);
    id v4 = objc_alloc(MEMORY[0x189603F68]);
    qword_18C497038 = objc_msgSend( v4,  "initWithObjectsAndKeys:",  @"not",  @"n't",  @"have",  @"'ve",  @"will",  @"'ll",  @"am",  @"'m",  @"are",  @"'re",  @"had",  @"'d",  0,  v12,  v13);
    byte_18C496E99 = 1;
  }

  [a1 rangeOfString:qword_18C497018];
  if (v5) {
    a1 = (void *)[a1 stringByReplacingOccurrencesOfString:qword_18C497018 withString:@"'"];
  }
  [a1 rangeOfString:qword_18C497020];
  if (v6) {
    a1 = (void *)[a1 stringByReplacingOccurrencesOfString:qword_18C497020 withString:@"'"];
  }
  [a1 rangeOfString:qword_18C497028];
  if (v7) {
    a1 = (void *)[a1 stringByReplacingOccurrencesOfString:qword_18C497028 withString:@""];
  }
  [a1 rangeOfString:qword_18C497030];
  if (v8) {
    a1 = (void *)[a1 stringByReplacingOccurrencesOfString:qword_18C497030 withString:@""];
  }
  BYTE6(v12) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, void *, char *))(a2 + 16))(a2, a1, (char *)&v12 + 6);
  if (!BYTE6(v12))
  {
    uint64_t v10 = (void *)[a1 lowercaseString];
    if (([v10 isEqualToString:a1] & 1) != 0
      || (uint64_t result = (*(uint64_t (**)(uint64_t, void *, char *))(a2 + 16))(a2, v10, (char *)&v12 + 6), !BYTE6(v12)))
    {
      unint64_t v11 = (void *)[v10 capitalizedString];
      if (([v11 isEqualToString:a1] & 1) != 0
        || (uint64_t result = (*(uint64_t (**)(uint64_t, void *, char *))(a2 + 16))(a2, v11, (char *)&v12 + 6),
            !BYTE6(v12)))
      {
        uint64_t result = [(id)qword_18C497038 objectForKey:v10];
        if (result) {
          return (*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, result, (char *)&v12 + 6);
        }
      }
    }
  }

  return result;
}

uint64_t __lemmatizerLemmaForStringWithCategory_block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __lemmatizerLemmaForStringWithCategory_block_invoke_2;
  v8[3] = &unk_189CA2520;
  char v10 = *(_BYTE *)(a1 + 56);
  __int128 v9 = *(_OWORD *)(a1 + 32);
  uint64_t result = off_18C497008(v5, a2, v8);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 0LL;
  }
  *a3 = v7;
  return result;
}

void *__lemmatizerLemmaForStringWithCategory_block_invoke_2( void *result, CFTypeRef cf, int a3, _BYTE *a4)
{
  BOOL v7 = result;
  if (!*(void *)(*(void *)(result[4] + 8LL) + 24LL))
  {
    uint64_t result = CFRetain(cf);
    *(void *)(*(void *)(v7[4] + 8LL) + 24LL) = result;
  }

  if (*((unsigned __int8 *)v7 + 48) == a3)
  {
    uint64_t result = CFRetain(cf);
    *(void *)(*(void *)(v7[5] + 8LL) + 24LL) = result;
    *a4 = 1;
  }

  return result;
}

void __lemmatizerAddTagsForString_block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  v15[4] = *MEMORY[0x1895F89C0];
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  v15[3] = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  uint64_t v6 = MEMORY[0x1895F87A8];
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __lemmatizerAddTagsForString_block_invoke_2;
  v10[3] = &unk_189CA2570;
  v10[4] = &v11;
  off_18C497008(v7, a2, v10);
  v9[0] = v6;
  v9[1] = 3221225472LL;
  v9[2] = __lemmatizerAddTagsForString_block_invoke_3;
  v9[3] = &unk_189CA2598;
  uint64_t v8 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  v9[5] = &v11;
  v9[6] = v15;
  off_18C497008(v8, a2, v9);
  *a3 = v12[3] > 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);
}

void sub_18367EA3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

uint64_t __lemmatizerAddTagsForString_block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __lemmatizerAddTagsForString_block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  else {
    id v4 = off_189CA2820[(char)(a3 - 1)];
  }
  uint64_t v5 = (void *)[*(id *)(a1 + 32) objectForKey:v4];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)
     - *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v5) {
    v6 += [v5 integerValue];
  }
  uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "setObject:forKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6),  v4);
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  return result;
}

uint64_t ___createRegexForPattern_block_invoke()
{
  qword_18C497068 = (uint64_t)objc_alloc_init(MEMORY[0x189603F30]);
  [(id)qword_18C497068 setName:@"NSRegularExpressionCache"];
  return [(id)qword_18C497068 setCountLimit:10];
}

uint64_t _validateFilename(void *a1)
{
  uint64_t v1 = (void *)[a1 pathComponents];
  uint64_t v2 = [v1 count];
  uint64_t v3 = v2;
  id v4 = (void *)[v1 firstObject];
  if (([v4 isEqualToString:@"/"] & 1) != 0
    || ([v4 isEqualToString:@".."] & 1) != 0
    || ([v4 isEqualToString:@"."] & 1) != 0)
  {
    return 0LL;
  }

  if (v3 == 1) {
    return 1LL;
  }
  return objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 1), "isEqualToString:", @"/");
}

BOOL _NSFileCompressionTypeIsSafeForMapping(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (qword_18C497078 != -1) {
    dispatch_once(&qword_18C497078, &__block_literal_global_70);
  }
  if (!_MergedGlobals_145) {
    return 0LL;
  }
  else {
    BOOL v2 = v4[0] == 5;
  }
  return !v2;
}

uint64_t NSFileWrapperChildNameIsEqual_CFDictionary(void *a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "lowercaseString"), "isEqualToString:", objc_msgSend(a2, "lowercaseString"));
}

uint64_t NSFileWrapperChildNameHash_CFDictionary(void *a1)
{
  return objc_msgSend((id)objc_msgSend(a1, "lowercaseString"), "hash");
}

uint64_t _NSDescribeFileContentsInstance(void *a1, id *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  char v10 = (void *)[a2 preferredFilename];
  uint64_t v11 = v10;
  if (!a3 || ([v10 isEqualToString:a3] & 1) != 0)
  {
    uint64_t v12 = (NSString *)&stru_189CA6A28;
    if ((_DWORD)a5) {
      goto LABEL_4;
    }
LABEL_12:
    uint64_t v14 = 0LL;
    goto LABEL_16;
  }

  uint64_t v12 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" (%@)", a3);
  if (!(_DWORD)a5) {
    goto LABEL_12;
  }
LABEL_4:
  else {
    size_t v13 = 4 * a4 + 4;
  }
  if (a2[1])
  {
    bzero(__b, 0x3E9uLL);
    if (v13) {
      memset(__b, 32, v13);
    }
    __b[v13] = 0;
    uint64_t v14 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%@",  +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", __b, 4),  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Type: %@, mode:0%ho, mod time: %@",  [a2[1] fileType],  (unsigned __int16)objc_msgSend(a2[1], "filePosixPermissions"),  objc_msgSend(a2[1], "fileModificationDate")));
  }

  else
  {
    bzero(__b, 0x3E9uLL);
    if (v13) {
      memset(__b, 32, v13);
    }
    __b[v13] = 0;
    uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(No file attribute information.)",  +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", __b, 4LL));
  }

NSString *_NXCurrentWorkingDir()
{
  return -[NSFileManager currentDirectoryPath]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "currentDirectoryPath");
}

uint64_t _NXRenameFile(uint64_t a1, uint64_t a2)
{
  return -[NSFileManager moveItemAtPath:toPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "moveItemAtPath:toPath:error:",  a1,  a2,  0LL)
       - 1LL;
}

uint64_t _NXAccessFile(uint64_t a1, uint64_t a2)
{
  id v4 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  uint64_t v5 = v4;
  if (!a2)
  {
    unsigned int v6 = -[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", a1);
    return v6 - 1LL;
  }

  if ((a2 & 4) == 0)
  {
    unsigned int v6 = 1;
    if ((a2 & 2) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    if (v6) {
      unsigned int v6 = -[NSFileManager isWritableFileAtPath:](v5, "isWritableFileAtPath:", a1);
    }
    goto LABEL_9;
  }

  unsigned int v6 = -[NSFileManager isReadableFileAtPath:](v4, "isReadableFileAtPath:", a1);
  if ((a2 & 2) != 0) {
    goto LABEL_7;
  }
LABEL_9:
  if ((a2 & 1) != 0 && v6) {
    unsigned int v6 = -[NSFileManager isExecutableFileAtPath:](v5, "isExecutableFileAtPath:", a1);
  }
  return v6 - 1LL;
}

uint64_t _NXChmodFile(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)NSNumber) initWithInt:a2];
  id v4 = (void *)objc_msgSend( objc_allocWithZone(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v3,  @"NSFilePosixPermissions",  0);
  LODWORD(a1) = -[NSFileManager changeFileAttributes:atPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "changeFileAttributes:atPath:",  v4,  a1);

  return a1 - 1LL;
}

uint64_t _NXStatFile(uint64_t a1, stat *a2)
{
  return stat( -[NSFileManager fileSystemRepresentationWithPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileSystemRepresentationWithPath:",  a1),  a2);
}

uint64_t _NXMakeDirs(void *a1, uint64_t a2)
{
  if (([a1 isEqualToString:&stru_189CA6A28] & 1) != 0
    || -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  a1))
  {
    return 0LL;
  }

  if (_NXMakeDirs([a1 stringByDeletingLastPathComponent], a2)) {
    return -1LL;
  }
  uint64_t v5 = (void *)[objc_allocWithZone((Class)NSNumber) initWithInt:a2];
  unsigned int v6 = (void *)objc_msgSend( objc_allocWithZone(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  v5,  @"NSFilePosixPermissions",  0);
  BOOL v7 = -[NSFileManager createDirectoryAtPath:attributes:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:attributes:",  a1,  v6);

  return v7 - 1LL;
}

uint64_t _NXRemoveDocument(uint64_t a1)
{
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  a1))
  {
    return -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  a1,  0LL)
         - 1LL;
  }

  else
  {
    return 0LL;
  }

NSDocInfo *_NSDocInfoFromFileAttributes(NSDocInfo *result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_alloc_init(&OBJC_CLASS___NSDocInfo);
    uint64_t v5 = (void *)-[NSDocInfo fileModificationDate](v3, "fileModificationDate");
    uint64_t v6 = 0LL;
    if (a2 && v5)
    {
      [v5 timeIntervalSince1970];
      uint64_t v6 = (uint64_t)v7;
    }

    v4->time = v6;
    v4->mode = -[NSDocInfo filePosixPermissions](v3, "filePosixPermissions");
    uint64_t v8 = (void *)-[NSDocInfo fileType](v3, "fileType");
    if (v8)
    {
      __int128 v9 = v8;
      *(&v4->mode + 1) = *(&v4->mode + 1) & 0xFFFE | [v8 isEqualToString:@"NSFileTypeDirectory"];
      else {
        __int16 v10 = 0;
      }
      *(&v4->mode + 1) = *(&v4->mode + 1) & 0xFFF9 | v10;
    }

    return v4;
  }

  return result;
}

unint64_t unallocate(mach_vm_address_t address, mach_vm_size_t size)
{
  unint64_t result = mach_vm_deallocate(*MEMORY[0x1895FBBE0], address, size);
  if ((_DWORD)result)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSOtherSerializationException" reason:@"can't deallocate" userInfo:0]);
    return -[NSAKSerializerStream writeInt:](v3, v4, v5);
  }

  return result;
}

vm_address_t extendStreamFor(vm_address_t result, uint64_t a2)
{
  mach_vm_size_t v2 = *(void *)(result + 24);
  mach_vm_size_t v3 = *(void *)(result + 16) + a2;
  if (v3 > v2)
  {
    vm_address_t v4 = result;
    if (v2) {
      uint64_t v5 = *(void *)(result + 24);
    }
    else {
      uint64_t v5 = 4LL;
    }
    do
    {
      vm_size_t v6 = v5;
      v5 *= 2LL;
    }

    while (v6 < v3);
    double v7 = (void *)MEMORY[0x1895FD590];
    uint64_t v8 = v6 + *MEMORY[0x1895FD590] - 1;
    else {
      vm_size_t v9 = v8 & -*MEMORY[0x1895FD590];
    }
    mach_vm_address_t v10 = *(void *)(result + 8);
    unint64_t result = allocate(v9);
    uint64_t v11 = (void *)result;
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v12 = (const void *)v10;
    size_t v13 = v2;
    if (v2 >= 0x80000)
    {
      size_t v13 = v2;
      uint64_t v12 = (const void *)v10;
      if (((*v7 - 1LL) & (result | v10)) != 0) {
        goto LABEL_15;
      }
      malloc_default_zone();
      int v14 = malloc_zone_claimed_address();
      unint64_t result = (vm_address_t)v11;
      size_t v13 = v2;
      uint64_t v12 = (const void *)v10;
      if (v14) {
        goto LABEL_15;
      }
      NSUInteger v15 = v2 & -*v7;
      NSCopyMemoryPages((const void *)v10, v11, v15);
      uint64_t v12 = (const void *)(v10 + v15);
      unint64_t result = (vm_address_t)v11 + v15;
      size_t v13 = v2 - v15;
    }

    if (!v13)
    {
LABEL_16:
      unint64_t result = unallocate(v10, v2);
LABEL_17:
      *(void *)(v4 + _Block_object_dispose((const void *)(v14 - 120), 8) = v11;
      if (v11)
      {
        *(void *)(v4 + 24) = v9;
      }

      else
      {
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSOtherSerializationException" reason:@"can't allocate" userInfo:0]);
        return -[NSAKSerializerStream writeAlignedDataSize:](v16, v17, v18);
      }

      return result;
    }

vm_address_t allocate(vm_size_t size)
{
  v2[1] = *MEMORY[0x1895F89C0];
  v2[0] = 0LL;
  if (vm_allocate(*MEMORY[0x1895FBBE0], v2, size, 1)) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSOtherSerializationException" reason:@"can't allocate" userInfo:0]);
  }
  return v2[0];
}

void sub_183685F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183686644( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    objc_opt_class();
    [v11 name];
    [v11 reason];
    NSLog((NSString *)@"*** %@: Deserialization error %@: %@\n");
    [v11 raise];
    objc_end_catch();
    JUMPOUT(0x1836865D0LL);
  }

  _Unwind_Resume(exception_object);
}

NSPageData *newLeafDocument(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 4) != 0) {
    return -[NSPageData initWithData:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", a3),  "initWithData:",  -[NSString dataUsingEncoding:allowLossyConversion:]( -[NSFileManager pathContentOfSymbolicLinkAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "pathContentOfSymbolicLinkAtPath:",  a1),  "dataUsingEncoding:allowLossyConversion:",  4LL,  1LL));
  }
  else {
    return -[NSPageData initWithContentsOfMappedFile:]( +[NSData allocWithZone:](&OBJC_CLASS___NSPageData, "allocWithZone:", a3),  "initWithContentsOfMappedFile:",  a1);
  }
}

BOOL _unitHasSpecifierAndIsDimensional(void *a1)
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_isKindOfClass() & 1) != 0
      && [a1 specifier] != -1;
}

NSUnitVolume *getDimensionUnitFromUnitSpecifier(unsigned int a1)
{
  if (a1 > 1)
  {
    if ((unint64_t)a1 - 256 > 4)
    {
      if ((unint64_t)a1 - 512 > 8)
      {
        if (a1 - 4609 <= 8 && ((1 << (a1 - 1)) & 0x103) != 0)
        {
          mach_vm_size_t v2 = &OBJC_CLASS___NSUnitConcentrationMass;
          return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
        }

        uint64_t v4 = a1 & 0xFFFFFFFC;
        if (v4 == 3328)
        {
          if (a1 == 3331)
          {
            return (NSUnitVolume *)+[NSUnitFuelEfficiency milesPerImperialGallon]( &OBJC_CLASS___NSUnitFuelEfficiency,  "milesPerImperialGallon");
          }

          else
          {
            if (a1 != 3329)
            {
              mach_vm_size_t v2 = &OBJC_CLASS___NSUnitFuelEfficiency;
              return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
            }

            return (NSUnitVolume *)+[NSUnitFuelEfficiency milesPerGallon]( &OBJC_CLASS___NSUnitFuelEfficiency,  "milesPerGallon");
          }
        }

        else
        {
          if (a1 == 4611)
          {
            mach_vm_size_t v2 = &OBJC_CLASS___NSUnitDispersion;
            return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
          }

          if ((unint64_t)a1 - 1024 > 9)
          {
            if ((a1 & 0xFFFFFFFE) == 0xF00LL)
            {
              uint64_t v1 = &OBJC_CLASS___NSUnitElectricCurrent;
              if (a1 != 3841) {
                goto LABEL_3;
              }
              return (NSUnitVolume *)+[NSUnitElectricCurrent milliamperes]( &OBJC_CLASS___NSUnitElectricCurrent,  "milliamperes");
            }

            else
            {
              if (a1 == 3842)
              {
                mach_vm_size_t v2 = &OBJC_CLASS___NSUnitElectricResistance;
                return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
              }

              if (a1 == 3843)
              {
                mach_vm_size_t v2 = &OBJC_CLASS___NSUnitElectricPotentialDifference;
                return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
              }

              if ((unint64_t)a1 - 3072 > 5)
              {
                if (v4 == 4096)
                {
                  switch(a1)
                  {
                    case 0x1001u:
                      return (NSUnitVolume *)+[NSUnitFrequency kilohertz](&OBJC_CLASS___NSUnitFrequency, "kilohertz");
                    case 0x1002u:
                      return (NSUnitVolume *)+[NSUnitFrequency megahertz](&OBJC_CLASS___NSUnitFrequency, "megahertz");
                    case 0x1003u:
                      return (NSUnitVolume *)+[NSUnitFrequency gigahertz](&OBJC_CLASS___NSUnitFrequency, "gigahertz");
                    default:
                      mach_vm_size_t v2 = &OBJC_CLASS___NSUnitFrequency;
                      return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                  }
                }

                else
                {
                  if (a1 == 4352)
                  {
                    mach_vm_size_t v2 = &OBJC_CLASS___NSUnitIlluminance;
                    return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                  }

                  if ((unint64_t)a1 - 3584 > 0xA)
                  {
                    if ((unint64_t)a1 - 1280 > 0x12)
                    {
                      if ((unint64_t)a1 - 1536 > 0xA)
                      {
                        if ((unint64_t)a1 - 1792 > 5)
                        {
                          switch(a1)
                          {
                            case 0x800u:
                              unint64_t result = +[NSUnitPressure hectopascals](&OBJC_CLASS___NSUnitPressure, "hectopascals");
                              break;
                            case 0x801u:
                              unint64_t result = +[NSUnitPressure inchesOfMercury]( &OBJC_CLASS___NSUnitPressure,  "inchesOfMercury");
                              break;
                            case 0x802u:
                              unint64_t result = +[NSUnitPressure millibars](&OBJC_CLASS___NSUnitPressure, "millibars");
                              break;
                            case 0x803u:
                              unint64_t result = +[NSUnitPressure millimetersOfMercury]( &OBJC_CLASS___NSUnitPressure,  "millimetersOfMercury");
                              break;
                            case 0x804u:
                              unint64_t result = +[NSUnitPressure poundsForcePerSquareInch]( &OBJC_CLASS___NSUnitPressure,  "poundsForcePerSquareInch");
                              break;
                            case 0x806u:
                              unint64_t result = +[NSUnitPressure kilopascals](&OBJC_CLASS___NSUnitPressure, "kilopascals");
                              break;
                            case 0x807u:
                              unint64_t result = +[NSUnitPressure megapascals](&OBJC_CLASS___NSUnitPressure, "megapascals");
                              break;
                            case 0x809u:
                              unint64_t result = +[NSUnitPressure bars](&OBJC_CLASS___NSUnitPressure, "bars");
                              break;
                            default:
                              if (v4 == 2304)
                              {
                                switch(a1)
                                {
                                  case 0x903u:
                                    unint64_t result = +[NSUnitSpeed knots](&OBJC_CLASS___NSUnitSpeed, "knots");
                                    break;
                                  case 0x902u:
                                    unint64_t result = +[NSUnitSpeed milesPerHour](&OBJC_CLASS___NSUnitSpeed, "milesPerHour");
                                    break;
                                  case 0x901u:
                                    unint64_t result = +[NSUnitSpeed kilometersPerHour]( &OBJC_CLASS___NSUnitSpeed,  "kilometersPerHour");
                                    break;
                                  default:
                                    mach_vm_size_t v2 = &OBJC_CLASS___NSUnitSpeed;
                                    return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                                }
                              }

                              else if ((unint64_t)a1 - 2560 > 2)
                              {
                                if (a1 - 2823 < 0x10 || a1 - 2816 <= 0x18 && ((1 << a1) & 0x100003F) != 0)
                                {
                                  switch(a1)
                                  {
                                    case 0xB01u:
                                      unint64_t result = +[NSUnitVolume cubicKilometers]( &OBJC_CLASS___NSUnitVolume,  "cubicKilometers");
                                      break;
                                    case 0xB02u:
                                      unint64_t result = +[NSUnitVolume cubicMiles](&OBJC_CLASS___NSUnitVolume, "cubicMiles");
                                      break;
                                    case 0xB03u:
                                      unint64_t result = +[NSUnitVolume milliliters](&OBJC_CLASS___NSUnitVolume, "milliliters");
                                      break;
                                    case 0xB04u:
                                      unint64_t result = +[NSUnitVolume centiliters](&OBJC_CLASS___NSUnitVolume, "centiliters");
                                      break;
                                    case 0xB05u:
                                      unint64_t result = +[NSUnitVolume deciliters](&OBJC_CLASS___NSUnitVolume, "deciliters");
                                      break;
                                    case 0xB07u:
                                      unint64_t result = +[NSUnitVolume megaliters](&OBJC_CLASS___NSUnitVolume, "megaliters");
                                      break;
                                    case 0xB08u:
                                      unint64_t result = +[NSUnitVolume cubicCentimeters]( &OBJC_CLASS___NSUnitVolume,  "cubicCentimeters");
                                      break;
                                    case 0xB09u:
                                      unint64_t result = +[NSUnitVolume cubicMeters](&OBJC_CLASS___NSUnitVolume, "cubicMeters");
                                      break;
                                    case 0xB0Au:
                                      unint64_t result = +[NSUnitVolume cubicInches](&OBJC_CLASS___NSUnitVolume, "cubicInches");
                                      break;
                                    case 0xB0Bu:
                                      unint64_t result = +[NSUnitVolume cubicFeet](&OBJC_CLASS___NSUnitVolume, "cubicFeet");
                                      break;
                                    case 0xB0Cu:
                                      unint64_t result = +[NSUnitVolume cubicYards](&OBJC_CLASS___NSUnitVolume, "cubicYards");
                                      break;
                                    case 0xB0Du:
                                      unint64_t result = +[NSUnitVolume acreFeet](&OBJC_CLASS___NSUnitVolume, "acreFeet");
                                      break;
                                    case 0xB0Eu:
                                      unint64_t result = +[NSUnitVolume bushels](&OBJC_CLASS___NSUnitVolume, "bushels");
                                      break;
                                    case 0xB0Fu:
                                      unint64_t result = +[NSUnitVolume teaspoons](&OBJC_CLASS___NSUnitVolume, "teaspoons");
                                      break;
                                    case 0xB10u:
                                      unint64_t result = +[NSUnitVolume tablespoons](&OBJC_CLASS___NSUnitVolume, "tablespoons");
                                      break;
                                    case 0xB11u:
                                      unint64_t result = +[NSUnitVolume fluidOunces](&OBJC_CLASS___NSUnitVolume, "fluidOunces");
                                      break;
                                    case 0xB12u:
                                      unint64_t result = +[NSUnitVolume cups](&OBJC_CLASS___NSUnitVolume, "cups");
                                      break;
                                    case 0xB13u:
                                      unint64_t result = +[NSUnitVolume pints](&OBJC_CLASS___NSUnitVolume, "pints");
                                      break;
                                    case 0xB14u:
                                      unint64_t result = +[NSUnitVolume quarts](&OBJC_CLASS___NSUnitVolume, "quarts");
                                      break;
                                    case 0xB15u:
                                      unint64_t result = +[NSUnitVolume gallons](&OBJC_CLASS___NSUnitVolume, "gallons");
                                      break;
                                    case 0xB16u:
                                      unint64_t result = +[NSUnitVolume metricCups](&OBJC_CLASS___NSUnitVolume, "metricCups");
                                      break;
                                    case 0xB18u:
                                      unint64_t result = +[NSUnitVolume imperialGallons]( &OBJC_CLASS___NSUnitVolume,  "imperialGallons");
                                      break;
                                    default:
                                      mach_vm_size_t v2 = &OBJC_CLASS___NSUnitVolume;
                                      return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                                  }
                                }

                                else
                                {
                                  unint64_t result = 0LL;
                                }
                              }

                              else if (a1 == 2561)
                              {
                                unint64_t result = +[NSUnitTemperature fahrenheit](&OBJC_CLASS___NSUnitTemperature, "fahrenheit");
                              }

                              else
                              {
                                if (a1 != 2560)
                                {
                                  mach_vm_size_t v2 = &OBJC_CLASS___NSUnitTemperature;
                                  return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                                }

                                unint64_t result = +[NSUnitTemperature celsius](&OBJC_CLASS___NSUnitTemperature, "celsius");
                              }

                              break;
                          }
                        }

                        else
                        {
                          switch(a1)
                          {
                            case 0x701u:
                              unint64_t result = +[NSUnitPower kilowatts](&OBJC_CLASS___NSUnitPower, "kilowatts");
                              break;
                            case 0x702u:
                              unint64_t result = +[NSUnitPower horsepower](&OBJC_CLASS___NSUnitPower, "horsepower");
                              break;
                            case 0x703u:
                              unint64_t result = +[NSUnitPower milliwatts](&OBJC_CLASS___NSUnitPower, "milliwatts");
                              break;
                            case 0x704u:
                              unint64_t result = +[NSUnitPower megawatts](&OBJC_CLASS___NSUnitPower, "megawatts");
                              break;
                            case 0x705u:
                              unint64_t result = +[NSUnitPower gigawatts](&OBJC_CLASS___NSUnitPower, "gigawatts");
                              break;
                            default:
                              mach_vm_size_t v2 = &OBJC_CLASS___NSUnitPower;
                              return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                          }
                        }
                      }

                      else
                      {
                        switch(a1)
                        {
                          case 0x600u:
                            unint64_t result = +[NSUnitMass grams](&OBJC_CLASS___NSUnitMass, "grams");
                            break;
                          case 0x602u:
                            unint64_t result = +[NSUnitMass ounces](&OBJC_CLASS___NSUnitMass, "ounces");
                            break;
                          case 0x603u:
                            unint64_t result = +[NSUnitMass poundsMass](&OBJC_CLASS___NSUnitMass, "poundsMass");
                            break;
                          case 0x604u:
                            unint64_t result = +[NSUnitMass stones](&OBJC_CLASS___NSUnitMass, "stones");
                            break;
                          case 0x605u:
                            unint64_t result = +[NSUnitMass micrograms](&OBJC_CLASS___NSUnitMass, "micrograms");
                            break;
                          case 0x606u:
                            unint64_t result = +[NSUnitMass milligrams](&OBJC_CLASS___NSUnitMass, "milligrams");
                            break;
                          case 0x607u:
                            unint64_t result = +[NSUnitMass metricTons](&OBJC_CLASS___NSUnitMass, "metricTons");
                            break;
                          case 0x608u:
                            unint64_t result = +[NSUnitMass shortTons](&OBJC_CLASS___NSUnitMass, "shortTons");
                            break;
                          case 0x609u:
                            unint64_t result = +[NSUnitMass carats](&OBJC_CLASS___NSUnitMass, "carats");
                            break;
                          case 0x60Au:
                            unint64_t result = +[NSUnitMass ouncesTroy](&OBJC_CLASS___NSUnitMass, "ouncesTroy");
                            break;
                          default:
                            mach_vm_size_t v2 = &OBJC_CLASS___NSUnitMass;
                            return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                        }
                      }
                    }

                    else
                    {
                      switch(a1)
                      {
                        case 0x501u:
                          unint64_t result = +[NSUnitLength centimeters](&OBJC_CLASS___NSUnitLength, "centimeters");
                          break;
                        case 0x502u:
                          unint64_t result = +[NSUnitLength kilometers](&OBJC_CLASS___NSUnitLength, "kilometers");
                          break;
                        case 0x503u:
                          unint64_t result = +[NSUnitLength millimeters](&OBJC_CLASS___NSUnitLength, "millimeters");
                          break;
                        case 0x504u:
                          unint64_t result = +[NSUnitLength picometers](&OBJC_CLASS___NSUnitLength, "picometers");
                          break;
                        case 0x505u:
                          unint64_t result = +[NSUnitLength feet](&OBJC_CLASS___NSUnitLength, "feet");
                          break;
                        case 0x506u:
                          unint64_t result = +[NSUnitLength inches](&OBJC_CLASS___NSUnitLength, "inches");
                          break;
                        case 0x507u:
                          unint64_t result = +[NSUnitLength miles](&OBJC_CLASS___NSUnitLength, "miles");
                          break;
                        case 0x508u:
                          unint64_t result = +[NSUnitLength yards](&OBJC_CLASS___NSUnitLength, "yards");
                          break;
                        case 0x509u:
                          unint64_t result = +[NSUnitLength lightyears](&OBJC_CLASS___NSUnitLength, "lightyears");
                          break;
                        case 0x50Au:
                          unint64_t result = +[NSUnitLength decimeters](&OBJC_CLASS___NSUnitLength, "decimeters");
                          break;
                        case 0x50Bu:
                          unint64_t result = +[NSUnitLength micrometers](&OBJC_CLASS___NSUnitLength, "micrometers");
                          break;
                        case 0x50Cu:
                          unint64_t result = +[NSUnitLength nanometers](&OBJC_CLASS___NSUnitLength, "nanometers");
                          break;
                        case 0x50Du:
                          unint64_t result = +[NSUnitLength nauticalMiles](&OBJC_CLASS___NSUnitLength, "nauticalMiles");
                          break;
                        case 0x50Eu:
                          unint64_t result = +[NSUnitLength fathoms](&OBJC_CLASS___NSUnitLength, "fathoms");
                          break;
                        case 0x50Fu:
                          unint64_t result = +[NSUnitLength furlongs](&OBJC_CLASS___NSUnitLength, "furlongs");
                          break;
                        case 0x510u:
                          unint64_t result = +[NSUnitLength astronomicalUnits](&OBJC_CLASS___NSUnitLength, "astronomicalUnits");
                          break;
                        case 0x511u:
                          unint64_t result = +[NSUnitLength parsecs](&OBJC_CLASS___NSUnitLength, "parsecs");
                          break;
                        case 0x512u:
                          unint64_t result = +[NSUnitLength scandinavianMiles](&OBJC_CLASS___NSUnitLength, "scandinavianMiles");
                          break;
                        default:
                          mach_vm_size_t v2 = &OBJC_CLASS___NSUnitLength;
                          return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                      }
                    }
                  }

                  else
                  {
                    switch(a1)
                    {
                      case 0xE00u:
                        unint64_t result = +[NSUnitInformationStorage bits](&OBJC_CLASS___NSUnitInformationStorage, "bits");
                        break;
                      case 0xE02u:
                        unint64_t result = +[NSUnitInformationStorage gigabits]( &OBJC_CLASS___NSUnitInformationStorage,  "gigabits");
                        break;
                      case 0xE03u:
                        unint64_t result = +[NSUnitInformationStorage gigabytes]( &OBJC_CLASS___NSUnitInformationStorage,  "gigabytes");
                        break;
                      case 0xE04u:
                        unint64_t result = +[NSUnitInformationStorage kilobits]( &OBJC_CLASS___NSUnitInformationStorage,  "kilobits");
                        break;
                      case 0xE05u:
                        unint64_t result = +[NSUnitInformationStorage kilobytes]( &OBJC_CLASS___NSUnitInformationStorage,  "kilobytes");
                        break;
                      case 0xE06u:
                        unint64_t result = +[NSUnitInformationStorage megabits]( &OBJC_CLASS___NSUnitInformationStorage,  "megabits");
                        break;
                      case 0xE07u:
                        unint64_t result = +[NSUnitInformationStorage megabytes]( &OBJC_CLASS___NSUnitInformationStorage,  "megabytes");
                        break;
                      case 0xE08u:
                        unint64_t result = +[NSUnitInformationStorage terabits]( &OBJC_CLASS___NSUnitInformationStorage,  "terabits");
                        break;
                      case 0xE09u:
                        unint64_t result = +[NSUnitInformationStorage terabytes]( &OBJC_CLASS___NSUnitInformationStorage,  "terabytes");
                        break;
                      case 0xE0Au:
                        unint64_t result = +[NSUnitInformationStorage petabytes]( &OBJC_CLASS___NSUnitInformationStorage,  "petabytes");
                        break;
                      default:
                        mach_vm_size_t v2 = &OBJC_CLASS___NSUnitInformationStorage;
                        return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                    }
                  }
                }
              }

              else
              {
                switch(a1)
                {
                  case 0xC00u:
                    unint64_t result = +[NSUnitEnergy calories](&OBJC_CLASS___NSUnitEnergy, "calories");
                    break;
                  case 0xC01u:
                    unint64_t result = +[NSUnitEnergy foodcalories](&OBJC_CLASS___NSUnitEnergy, "foodcalories");
                    break;
                  case 0xC03u:
                    unint64_t result = +[NSUnitEnergy kilocalories](&OBJC_CLASS___NSUnitEnergy, "kilocalories");
                    break;
                  case 0xC04u:
                    unint64_t result = +[NSUnitEnergy kilojoules](&OBJC_CLASS___NSUnitEnergy, "kilojoules");
                    break;
                  case 0xC05u:
                    unint64_t result = +[NSUnitEnergy kilowattHours](&OBJC_CLASS___NSUnitEnergy, "kilowattHours");
                    break;
                  default:
                    mach_vm_size_t v2 = &OBJC_CLASS___NSUnitEnergy;
                    return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
                }
              }
            }
          }

          else
          {
            switch(a1)
            {
              case 0x404u:
                unint64_t result = +[NSUnitDuration hours](&OBJC_CLASS___NSUnitDuration, "hours");
                break;
              case 0x405u:
                unint64_t result = +[NSUnitDuration minutes](&OBJC_CLASS___NSUnitDuration, "minutes");
                break;
              case 0x407u:
                unint64_t result = +[NSUnitDuration milliseconds](&OBJC_CLASS___NSUnitDuration, "milliseconds");
                break;
              case 0x408u:
                unint64_t result = +[NSUnitDuration microseconds](&OBJC_CLASS___NSUnitDuration, "microseconds");
                break;
              case 0x409u:
                unint64_t result = +[NSUnitDuration nanoseconds](&OBJC_CLASS___NSUnitDuration, "nanoseconds");
                break;
              default:
                mach_vm_size_t v2 = &OBJC_CLASS___NSUnitDuration;
                return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
            }
          }
        }
      }

      else
      {
        switch(a1)
        {
          case 0x201u:
            unint64_t result = +[NSUnitArea squareKilometers](&OBJC_CLASS___NSUnitArea, "squareKilometers");
            break;
          case 0x202u:
            unint64_t result = +[NSUnitArea squareFeet](&OBJC_CLASS___NSUnitArea, "squareFeet");
            break;
          case 0x203u:
            unint64_t result = +[NSUnitArea squareMiles](&OBJC_CLASS___NSUnitArea, "squareMiles");
            break;
          case 0x204u:
            unint64_t result = +[NSUnitArea acres](&OBJC_CLASS___NSUnitArea, "acres");
            break;
          case 0x205u:
            unint64_t result = +[NSUnitArea hectares](&OBJC_CLASS___NSUnitArea, "hectares");
            break;
          case 0x206u:
            unint64_t result = +[NSUnitArea squareCentimeters](&OBJC_CLASS___NSUnitArea, "squareCentimeters");
            break;
          case 0x207u:
            unint64_t result = +[NSUnitArea squareInches](&OBJC_CLASS___NSUnitArea, "squareInches");
            break;
          case 0x208u:
            unint64_t result = +[NSUnitArea squareYards](&OBJC_CLASS___NSUnitArea, "squareYards");
            break;
          default:
            mach_vm_size_t v2 = &OBJC_CLASS___NSUnitArea;
            return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
        }
      }
    }

    else
    {
      switch(a1)
      {
        case 0x101u:
          unint64_t result = +[NSUnitAngle arcMinutes](&OBJC_CLASS___NSUnitAngle, "arcMinutes");
          break;
        case 0x102u:
          unint64_t result = +[NSUnitAngle arcSeconds](&OBJC_CLASS___NSUnitAngle, "arcSeconds");
          break;
        case 0x103u:
          unint64_t result = +[NSUnitAngle radians](&OBJC_CLASS___NSUnitAngle, "radians");
          break;
        case 0x104u:
          unint64_t result = +[NSUnitAngle revolutions](&OBJC_CLASS___NSUnitAngle, "revolutions");
          break;
        default:
          mach_vm_size_t v2 = &OBJC_CLASS___NSUnitAngle;
          return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
      }
    }
  }

  else
  {
    uint64_t v1 = &OBJC_CLASS___NSUnitAcceleration;
    if (a1)
    {
LABEL_3:
      mach_vm_size_t v2 = v1;
      return (NSUnitVolume *)-[__objc2_class baseUnit](v2, "baseUnit");
    }

    return (NSUnitVolume *)+[NSUnitAcceleration gravity](&OBJC_CLASS___NSUnitAcceleration, "gravity");
  }

  return result;
}

void __initializeUnitDict_block_invoke()
{
  uint64_t v0 = [MEMORY[0x189603F68] sharedKeySetForKeys:&unk_189D1EEA0];
  _MergedGlobals_8 = (uint64_t)(id)[MEMORY[0x189603FC8] dictionaryWithSharedKeySet:v0];
  uint64_t v1 = [&unk_189D1EEA0 count];
  mach_vm_size_t v2 = (uint64_t *)malloc(8 * v1);
  mach_vm_size_t v3 = (uint64_t *)malloc(8 * v1);
  objc_msgSend(&unk_189D1EEA0, "getObjects:range:", v2, 0, v1);
  objc_msgSend(&unk_189D1EEB8, "getObjects:range:", v3, 0, v1);
  if (v1 >= 1)
  {
    uint64_t v4 = v3;
    uint64_t v5 = v2;
    do
    {
      uint64_t v7 = *v4++;
      uint64_t v6 = v7;
      uint64_t v8 = *v5++;
      [(id)_MergedGlobals_8 setObject:v6 forKey:v8];
      --v1;
    }

    while (v1);
  }

  free(v2);
  free(v3);
}

void *convertInvocationToMethodSignature(void *a1, void *a2, int a3)
{
  sizep[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)[a1 methodSignature];
  int v6 = *(__int16 *)([v5 _argInfo:0] + 34);
  uint64_t v7 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:a2];
  objc_msgSend(v7, "setTarget:", objc_msgSend(a1, "target"));
  if (v6 < 0)
  {
    unint64_t v8 = 1LL;
  }

  else
  {
    objc_msgSend(v7, "setSelector:", objc_msgSend(a1, "selector"));
    unint64_t v8 = 2LL;
  }

  if (a3)
  {
    vm_size_t v9 = (const char *)[v5 methodReturnType];
    mach_vm_address_t v10 = (char *)[a2 methodReturnType];
  }

  uint64_t v24 = a1;
  unint64_t v11 = [v5 numberOfArguments];
  if (v8 < v11)
  {
    unint64_t v12 = v11;
    while (1)
    {
      size_t v13 = (const char *)[v5 getArgumentTypeAtIndex:v8];
      int v14 = (char *)[a2 getArgumentTypeAtIndex:v8];
      size_t v15 = strspn(v14, "norNOR");
      int v16 = v14[v15];
      if (v16 == 94)
      {
        size_t v17 = v15;
        if (memchr(v14, 78, v15))
        {
          BOOL v18 = 1;
          BOOL v19 = 1;
        }

        else
        {
          BOOL v19 = memchr(v14, 110, v17) != 0LL;
          BOOL v18 = memchr(v14, 111, v17) != 0LL;
        }
      }

      else
      {
        BOOL v18 = 0;
        BOOL v19 = 0;
      }

      int v20 = !v19;
      if (a3) {
        break;
      }
      if ((v18 & v20 & 1) == 0) {
        goto LABEL_20;
      }
      size_t v21 = strspn(v14, "^norNOR");
      sizep[0] = 0LL;
      NSGetSizeAndAlignment(&v14[v21], sizep, 0LL);
      size_t v22 = (void *)[MEMORY[0x189603FB8] dataWithLength:sizep[0] + 32];
      uint64_t v26 = [v22 mutableBytes];
      [v7 setArgument:&v26 atIndex:v8];
      [v7 _addAttachedObject:v22];
LABEL_21:
      if (v12 == ++v8) {
        return v7;
      }
    }

    if (v16 != 94 || ((v20 | v18) & 1) == 0) {
      goto LABEL_21;
    }
LABEL_20:
    performInvocationTypeConversion(v24, v7, v13, v14, v8);
    goto LABEL_21;
  }

  return v7;
}

void performInvocationTypeConversion(void *a1, void *a2, const char *a3, char *__s, uint64_t a5)
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (__s[strspn(__s, "norNOR")] == 94)
  {
    v24[0] = 0LL;
    [a1 getArgument:v24 atIndex:a5];
    if (v24[0])
    {
      mach_vm_address_t v10 = &a3[strspn(a3, "^norNOR")];
      unint64_t v11 = &__s[strspn(__s, "^norNOR")];
      NSUInteger sizep = 0LL;
      NSGetSizeAndAlignment(v10, &sizep, 0LL);
      NSUInteger v22 = 0LL;
      NSGetSizeAndAlignment(v11, &v22, 0LL);
      NSUInteger v12 = sizep;
      if (sizep <= v22) {
        NSUInteger v12 = v22;
      }
      size_t v13 = (void *)[MEMORY[0x189603FB8] dataWithLength:v12 + 32];
      int v14 = (void *)[v13 mutableBytes];
      memmove(v14, (const void *)v24[0], sizep);
      convertDataByTypeEncodings((uint64_t)v10, (uint64_t)v11, (double *)v24[0], v14);
      size_t v21 = v14;
      [a2 setArgument:&v21 atIndex:a5];
      [a2 _addAttachedObject:v13];
    }

    else
    {
      [a2 setArgument:v24 atIndex:a5];
    }
  }

  else
  {
    v24[0] = 0LL;
    NSGetSizeAndAlignment(a3, v24, 0LL);
    NSUInteger sizep = 0LL;
    NSGetSizeAndAlignment(__s, &sizep, 0LL);
    NSUInteger v15 = v24[0];
    if (v24[0] <= sizep) {
      NSUInteger v15 = sizep;
    }
    size_t v16 = v15 + 32;
    size_t v17 = calloc(v15 + 32, 1uLL);
    BOOL v18 = calloc(v16, 1uLL);
    if (v17) {
      BOOL v19 = v18 == 0LL;
    }
    else {
      BOOL v19 = 1;
    }
    if (v19)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"Unable to allocate bytes" userInfo:0]);
      -[NSInvocation(NSInvocationDebugDescription) debugDescription]();
    }

    else
    {
      int v20 = v18;
      [a1 getArgument:v17 atIndex:a5];
      memmove(v20, v17, v16);
      convertDataByTypeEncodings((uint64_t)a3, (uint64_t)__s, (double *)v17, v20);
      [a2 setArgument:v20 atIndex:a5];
      free(v17);
      free(v20);
    }
  }

void appendArgumentInfoToDescription(void *a1, uint64_t a2, uint64_t *a3, int a4, void *a5)
{
  uint64_t v7 = a3;
  v19[1] = *MEMORY[0x1895F89C0];
  objc_msgSend(a5, "appendFormat:", @"{%s} ", (char *)a3 + 37);
  unsigned int v10 = *((_DWORD *)v7 + 4);
  if (!v10)
  {
LABEL_11:
    [a5 appendFormat:@"void\n"];
    return;
  }

  for (__int16 i = *((_WORD *)v7 + 17); (i & 0x80) != 0; __int16 i = *((_WORD *)v7 + 17))
  {
    uint64_t v7 = (uint64_t *)*v7;
    objc_msgSend(a5, "appendFormat:", @"{%s} ", (char *)v7 + 37);
    unsigned int v10 = *((_DWORD *)v7 + 4);
    if (!v10) {
      goto LABEL_11;
    }
  }

  if ((i & 0x2000) != 0)
  {
    v19[0] = 0LL;
    if (a4) {
      [a1 getReturnValue:v19];
    }
    else {
      [a1 getArgument:v19 atIndex:a2];
    }
    objc_msgSend(a5, "appendFormat:", @"%p", v19[0]);
    NSUInteger v12 = @"\n";
    goto LABEL_26;
  }

  if ((i & 0x1000) != 0)
  {
    v19[0] = 0LL;
    if (a4) {
      [a1 getReturnValue:v19];
    }
    else {
      [a1 getArgument:v19 atIndex:a2];
    }
    objc_msgSend(a5, "appendFormat:", @"%p\n", v19[0]);
  }

  else
  {
    if ((i & 0x4000) != 0 || *((_BYTE *)v7 + 36) == 58)
    {
      v19[0] = 0LL;
      if (a4) {
        [a1 getReturnValue:v19];
      }
      else {
        [a1 getArgument:v19 atIndex:a2];
      }
      size_t v13 = (const char *)v19[0];
      if (!v19[0]) {
        size_t v13 = "null";
      }
      size_t v17 = v13;
      NSUInteger v12 = @"%s\n";
LABEL_26:
      objc_msgSend(a5, "appendFormat:", v12, v17);
      return;
    }

    size_t v14 = v10;
    NSUInteger v15 = (char *)malloc(v10);
    bzero(v15, v14);
    if (a4) {
      [a1 getReturnValue:v15];
    }
    else {
      [a1 getArgument:v15 atIndex:a2];
    }
    int v16 = *((char *)v7 + 36);
    if (v16 <= 80)
    {
      if ((v16 - 66) < 2)
      {
LABEL_38:
        objc_msgSend(a5, "appendFormat:", @"%d '%c'", *v15, *v15);
      }

      else if (v16 == 73)
      {
        objc_msgSend(a5, "appendFormat:", @"%u", *v15, v18);
      }

      else if (v16 == 76)
      {
        objc_msgSend(a5, "appendFormat:", @"%lu", *v15, v18);
      }

      else
      {
LABEL_43:
        objc_msgSend( a5,  "appendString:",  objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v15, *((unsigned int *)v7 + 4)),  "debugDescription"));
      }
    }

    else
    {
      switch(*((_BYTE *)v7 + 36))
      {
        case 'c':
          goto LABEL_38;
        case 'd':
        case 'f':
          objc_msgSend(a5, "appendFormat:", @"%f", (double)*v15, v18);
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_43;
        case 'i':
          objc_msgSend(a5, "appendFormat:", @"%d", *v15, v18);
          break;
        case 'l':
          objc_msgSend(a5, "appendFormat:", @"%ld", *v15, v18);
          break;
        case 'q':
          objc_msgSend(a5, "appendFormat:", @"%lld", *v15, v18);
          break;
        case 's':
          objc_msgSend(a5, "appendFormat:", @"%hd", *v15, v18);
          break;
        default:
          if (v16 == 81)
          {
            objc_msgSend(a5, "appendFormat:", @"%llu", *v15, v18);
          }

          else
          {
            if (v16 != 83) {
              goto LABEL_43;
            }
            objc_msgSend(a5, "appendFormat:", @"%hu", (unsigned __int16)*v15, v18);
          }

          break;
      }
    }

    [a5 appendString:@"\n"];
    free(v15);
  }

void convertDataByTypeEncodings(uint64_t a1, uint64_t a2, double *a3, void *a4)
{
  uint64_t v7 = 0LL;
  sizep[1] = *MEMORY[0x1895F89C0];
  while (2)
  {
    int v8 = *(char *)(a1 + v7);
    switch(*(_BYTE *)(a1 + v7))
    {
      case 'I':
      case 'L':
      case 'i':
      case 'l':
        size_t v21 = memchr("ilq", v8, 4uLL);
        *(void *)&double v22 = *(int *)a3;
        if (!v21) {
          *(void *)&double v22 = *(unsigned int *)a3;
        }
        goto LABEL_34;
      case 'J':
      case 'K':
      case 'M':
      case 'P':
      case 'S':
      case 'T':
      case 'U':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '_':
      case 'a':
      case 'b':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'p':
        return;
      case 'N':
      case 'O':
      case 'R':
      case 'V':
      case 'n':
      case 'o':
      case 'r':
        goto LABEL_3;
      case 'Q':
      case 'q':
        *a4 = 0LL;
        double v23 = *a3;
        if (v8 == 113)
        {
          unsigned int v24 = 0x7FFFFFFF;
          if (*(uint64_t *)&v23 > 0x7FFFFFFF)
          {
LABEL_24:
            *(_DWORD *)a4 = v24;
            NSLog( (NSString *)@"Warning - conversion from 64 bit to 32 bit integral value requested within NSPortCoder, but the 64 bit value %lld cannot be represented by a 32 bit value",  *(void *)&v23);
            return;
          }

          if (*(uint64_t *)&v23 < (uint64_t)0xFFFFFFFF80000000LL)
          {
            unsigned int v24 = 0x80000000;
            goto LABEL_24;
          }
        }

        else if (HIDWORD(*(void *)&v23))
        {
          *(_DWORD *)a4 = -1;
          NSLog( (NSString *)@"Warning - conversion from 64 bit to 32 bit integral value requested within NSPortCoder, but the 64 bit value %llu cannot be represented by a 32 bit value",  *(void *)&v23);
          return;
        }

        *(_DWORD *)a4 = LODWORD(v23);
        return;
      case '^':
        return;
      case 'c':
        if (*(_BYTE *)(a2 + v7) == 66) {
          *(_BYTE *)a4 = *(_BYTE *)a3 != 0;
        }
        return;
      case 'd':
        if (*(_BYTE *)(a2 + v7) == 102)
        {
          double v25 = *a3;
          float v26 = *a3;
          if (fabs(*a3) == INFINITY)
          {
            *a4 = 0LL;
            *(float *)a4 = v26;
            return;
          }

          if (v25 >= -3.40282347e38)
          {
            if (v25 <= 3.40282347e38)
            {
              if (v25 <= 0.0 || v26 != 0.0)
              {
                *a4 = 0LL;
                *(float *)a4 = v26;
                if (v25 >= 0.0 || v26 != 0.0) {
                  return;
                }
LABEL_46:
                NSLog( (NSString *)@"Warning - conversion from double to float value requested within NSPortCoder, but the double value %g is outside the range of a float.",  *(void *)&v25);
                return;
              }

uint64_t encodingsAreCompatible(const char *a1, const char *a2)
{
  mach_vm_size_t v2 = a2;
  mach_vm_size_t v3 = a1;
  if (!strcmp(a1, a2)) {
    return 1LL;
  }
  size_t v4 = strlen(v3);
  size_t v5 = strlen(v2);
  uint64_t result = 1LL;
  if (v4 && v5)
  {
    size_t v7 = 0LL;
    uint64_t v8 = 0LL;
    NSUInteger v12 = v2;
    NSUInteger v13 = v3;
    while (1)
    {
      int v9 = v3[v7];
      int v10 = v2[v8];
      if (v9 == 123 && v10 == 123)
      {
        v7 += strcspn(&v3[v7], "=");
        v8 += strcspn(&v2[v8], "=");
        if ((v7 == v4) == (v8 != v5)) {
          return 0LL;
        }
      }

      else
      {
        int v11 = (char)v10;
        if (memchr("ilq", v9, 4uLL) && memchr("ilq", v11, 4uLL)) {
          goto LABEL_17;
        }
        if (memchr("ILQ", v9, 4uLL) && memchr("ILQ", v11, 4uLL) || memchr("fd", v9, 3uLL) && memchr("fd", v11, 3uLL))
        {
          mach_vm_size_t v2 = v12;
LABEL_17:
          mach_vm_size_t v3 = v13;
          goto LABEL_20;
        }

        uint64_t result = (uint64_t)memchr("Bc", v9, 3uLL);
        if (!result) {
          return result;
        }
        uint64_t result = (uint64_t)memchr("Bc", v11, 3uLL);
        mach_vm_size_t v2 = v12;
        mach_vm_size_t v3 = v13;
        if (!result) {
          return result;
        }
      }

NSMutableString *escapedString(NSMutableString *a1, uint64_t a2)
{
  mach_vm_size_t v3 = +[NSCharacterSet characterSetWithCharactersInString:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithCharactersInString:",  a2);
  uint64_t v4 = -[NSString rangeOfCharacterFromSet:](a1, "rangeOfCharacterFromSet:", v3);
  if (a1)
  {
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = v4;
      a1 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", a1);
      do
      {
        -[NSMutableString insertString:atIndex:](a1, "insertString:atIndex:", @"\\"", v7);
        if (v7 + v6 + 1 >= -[NSString length](a1, "length")) {
          break;
        }
        uint64_t v7 = -[NSString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v3, 0LL);
        uint64_t v6 = v8;
      }

      while (v8);
    }
  }

  return a1;
}

void sub_18368E58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_18368E694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void sub_18368E7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_1836900B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

uint64_t regexMatchCallback(_BYTE *a1)
{
  if (a1)
  {
    (*(void (**)(void))(*(void *)a1 + 16LL))();
    a1[16] = 0;
  }

  return 1LL;
}

uint64_t regexFindProgressCallback(uint64_t *a1, unint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  char v9 = 0;
  if (!a1) {
    return 1;
  }
  unint64_t v3 = a1[1];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 >= a2)
  {
    uint64_t v5 = *a1;
    if (*a1)
    {
      (*(void (**)(uint64_t, void, uint64_t, char *))(v5 + 16))(v5, 0LL, 1LL, &v9);
      char v6 = v9;
      *((_BYTE *)a1 + 16) = v9;
      return (v6 ^ 1);
    }

    return 1;
  }

  char v7 = 0;
  *((_BYTE *)a1 + 17) = 1;
  return v7;
}

NSLock *___loadDataDetectorsCore_block_invoke()
{
  return objc_alloc_init(&OBJC_CLASS___NSLock);
}

CFIndex addAddressResultsToComponents(uint64_t a1, void *a2)
{
  CFIndex result = off_18C4970E8();
  uint64_t v4 = (const __CFArray *)result;
  if (qword_18C497120)
  {
    if (!result) {
      return result;
    }
  }

  else
  {
    CFIndex result = objc_msgSend( objc_alloc(MEMORY[0x189603F68]),  "initWithObjectsAndKeys:",  @"Contact",  @"Name",  @"ContactName",  @"Name",  @"AddressBookContactName",  @"JobTitle",  @"JobTitle",  @"Organization",  @"CompanyName",  @"Street",  @"Street",  @"City",  @"City",  @"State",  @"State",  @"ZIP",  @"ZipCode",  @"Country",  @"Country",  @"Airline",  @"AirlineName",  @"Flight",  @"FlightNumber",  0);
    qword_18C497120 = result;
    if (!v4) {
      return result;
    }
  }

  CFIndex result = CFArrayGetCount(v4);
  if (result >= 1)
  {
    CFIndex v5 = result;
    for (CFIndex i = 0LL; i != v5; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
      uint64_t v8 = [(id)qword_18C497120 objectForKey:off_18C4970D8()];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = off_18C4970F0(ValueAtIndex);
        if (v10)
        {
          int v11 = (const void *)v10;
          CFTypeID TypeID = CFStringGetTypeID();
          if (TypeID == CFGetTypeID(v11)) {
            [a2 setObject:v11 forKey:v9];
          }
        }
      }

      CFIndex result = addAddressResultsToComponents(ValueAtIndex, a2);
    }
  }

  return result;
}

uint64_t _NSFCLog()
{
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  return qword_18C497138;
}

uint64_t _NSFCClaimsLog()
{
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  return qword_18C497140;
}

uint64_t _NSFCPresenterLog()
{
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  return qword_18C497148;
}

uint64_t _NSFCProviderLog()
{
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  return qword_18C497150;
}

uint64_t _NSFCProcessMonitorLog()
{
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  return qword_18C497158;
}

uint64_t _NSFCFSEventsLog()
{
  if (qword_18C4971D8 != -1) {
    dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
  }
  return qword_18C497160;
}

void NSFileCoordinationDestroyTSD(uint64_t a1)
{
  if (a1)
  {
    mach_vm_size_t v2 = *(const void **)(a1 + 32);
    if (v2) {
      CFRelease(v2);
    }

    free((void *)a1);
  }

uint64_t NSFileCoordinatorGetTSD()
{
  uint64_t v0 = _CFGetTSD();
  if (!v0)
  {
    uint64_t v0 = (uint64_t)calloc(1uLL, 0x40uLL);
    _CFSetTSD();
  }

  return v0;
}

NSFileAccessArbiterProxy *NSFileCoordinatorSharedAccessArbiter()
{
  v1[5] = *MEMORY[0x1895F89C0];
  CFIndex result = (NSFileAccessArbiterProxy *)qword_18C4971C0;
  if (!qword_18C4971C0)
  {
    if (qword_18C4971A8)
    {
      CFIndex result = __NSFileCoordinatorSharedAccessArbiter_block_invoke();
      qword_18C4971C0 = (uint64_t)result;
    }

    else
    {
      v1[0] = MEMORY[0x1895F87A8];
      v1[1] = 3221225472LL;
      v1[2] = __NSFileCoordinatorSharedAccessArbiter_block_invoke_2;
      v1[3] = &unk_189C9DCE8;
      v1[4] = &__block_literal_global_806;
      if (qword_18C4971E0 != -1) {
        dispatch_once(&qword_18C4971E0, v1);
      }
      return (NSFileAccessArbiterProxy *)qword_18C4971E8;
    }
  }

  return result;
}

void sub_183690B78(_Unwind_Exception *a1)
{
}

void sub_183690B94()
{
}

void sub_18369133C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

void __Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void -[NSFileCoordinator _blockOnAccessClaim:withAccessArbiter:](NSFileCoordinator *self, SEL a2, id a3, id a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a3 claimID];
  uint64_t v13 = 0LL;
  size_t v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  int v16 = __Block_byref_object_copy__24;
  size_t v17 = __Block_byref_object_dispose__24;
  uint64_t v18 = 0LL;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __70__NSFileCoordinator_NSPrivate___blockOnAccessClaim_withAccessArbiter___block_invoke;
  v12[3] = &unk_189CA1128;
  v12[5] = a3;
  v12[6] = &v13;
  v12[4] = a4;
  -[NSFileCoordinator _requestAccessClaim:withProcedure:](self, "_requestAccessClaim:withProcedure:", a3, v12);
  uint64_t v8 = v14;
  if (v14[5])
  {
    if (_NSFCIP)
    {
      char v9 = objc_msgSend( (id)objc_msgSend(a3, "purposeID"),  "isEqualToString:",  @"com.apple.filecoordination.crash_verifier");
      uint64_t v8 = v14;
      if ((v9 & 1) == 0)
      {
        uint64_t v10 = (dispatch_semaphore_s *)v14[5];
        dispatch_time_t v11 = dispatch_time(0LL, 10000000000LL);
        if (!dispatch_semaphore_wait(v10, v11))
        {
LABEL_7:
          dispatch_release((dispatch_object_t)v14[5]);
          goto LABEL_8;
        }

        NSLog((NSString *)@"Possible NSFileCoordinator deadlock detected. Requesting debug information...");
        +[NSFileCoordinator _getDebugInfoWithCompletionHandler:]( &OBJC_CLASS___NSFileCoordinator,  "_getDebugInfoWithCompletionHandler:",  &__block_literal_global_84_0);
        uint64_t v8 = v14;
      }
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)v8[5], 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_7;
  }

void sub_183692068( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t _NSSetThreadSpecificMaterializationState(int a1, int *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v4 = getiopolicy_np(3, 1);
  if (v4 == -1)
  {
    if (qword_18C4971D8 != -1) {
      dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
    }
    uint64_t v11 = qword_18C497138;
    if (!os_log_type_enabled((os_log_t)qword_18C497138, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    int v13 = *__error();
    int v14 = 67109120;
    int v15 = v13;
    uint64_t v8 = "Failed to get thread materialization iopolicy value: %{darwin.errno}d";
    char v9 = (os_log_s *)v11;
    uint32_t v10 = 8;
    goto LABEL_14;
  }

  *a2 = v4;
  uint64_t v5 = 1LL;
  if (v4 != a1 && setiopolicy_np(3, 1, a1))
  {
    if (qword_18C4971D8 != -1) {
      dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
    }
    uint64_t v6 = qword_18C497138;
    if (!os_log_type_enabled((os_log_t)qword_18C497138, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    int v7 = *__error();
    int v14 = 67109376;
    int v15 = a1;
    __int16 v16 = 1024;
    int v17 = v7;
    uint64_t v8 = "Failed to set thread materialization iopolicy value (%d): %{darwin.errno}d";
    char v9 = (os_log_s *)v6;
    uint32_t v10 = 14;
LABEL_14:
    _os_log_error_impl(&dword_182EB1000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v10);
    return 0LL;
  }

  return v5;
}

void sub_183692C90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_183693100( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_183693718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void sub_183693D5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_183697A74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_183697B9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t __NSFCShouldLog(int a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v1 = atomic_load(&_NSFCSubarbitrationCount);
  if (v1 < 1) {
    return 1LL;
  }
  unsigned __int8 v3 = atomic_load(_NSFCDisableLogSuppression);
  if ((v3 & 1) != 0) {
    return 1LL;
  }
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 == 2) {
    uint64_t v4 = 100LL;
  }
  if (a1 == 1) {
    uint64_t v5 = 200LL;
  }
  else {
    uint64_t v5 = v4;
  }
  do
    int64_t v6 = __ldaxr(&_NSFCSubarbitratedClaimCount);
  while (__stlxr(v6 + 1, &_NSFCSubarbitratedClaimCount));
  if (v6 == 200)
  {
    if (qword_18C4971D8 != -1) {
      dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
    }
    int v7 = (os_log_s *)qword_18C497140;
    if (!os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT)) {
      return v6 < v5;
    }
    __int16 v10 = 0;
    uint64_t v8 = "Further suppressing excessive logging";
    char v9 = (uint8_t *)&v10;
  }

  else
  {
    if (v6 != 100) {
      return v6 < v5;
    }
    if (qword_18C4971D8 != -1) {
      dispatch_once(&qword_18C4971D8, &__block_literal_global_797);
    }
    int v7 = (os_log_s *)qword_18C497140;
    if (!os_log_type_enabled((os_log_t)qword_18C497140, OS_LOG_TYPE_DEFAULT)) {
      return v6 < v5;
    }
    __int16 v11 = 0;
    uint64_t v8 = "Suppressing excessive logging";
    char v9 = (uint8_t *)&v11;
  }

  _os_log_impl(&dword_182EB1000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  return v6 < v5;
}

BOOL _NSFCShouldLog(int a1)
{
  uint64_t v1 = atomic_load(&_NSFCSubarbitrationCount);
  if (v1 < 1) {
    return 1LL;
  }
  unsigned __int8 v3 = atomic_load(_NSFCDisableLogSuppression);
  if ((v3 & 1) != 0) {
    return 1LL;
  }
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 == 2) {
    uint64_t v4 = 100LL;
  }
  if (a1 == 1) {
    uint64_t v4 = 200LL;
  }
  int64_t v5 = atomic_load(&_NSFCSubarbitratedClaimCount);
  return v5 < v4;
}

uint64_t _NSGetFSIDAndFileID(void *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t result = [a1 fileSystemRepresentation];
  if (result)
  {
    *(void *)&v7[16] = 0LL;
    *(_OWORD *)int v7 = __const__NSGetFSIDAndFileID_request;
    if (!getattrlist((const char *)result, v7, v8, 0x28uLL, 1u) && *(_OWORD *)&v7[4] == v9 && *(_DWORD *)&v7[20] == v10)
    {
      uint64_t v6 = v12;
      *a2 = v11;
      *a3 = v6;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

os_log_t ___initFCLoggers_block_invoke()
{
  qword_18C497138 = (uint64_t)os_log_create("com.apple.foundation.filecoordination", "general");
  qword_18C497140 = (uint64_t)os_log_create("com.apple.foundation.filecoordination", "claims");
  qword_18C497148 = (uint64_t)os_log_create("com.apple.foundation.filecoordination", "presenter");
  qword_18C497150 = (uint64_t)os_log_create("com.apple.foundation.filecoordination", "provider");
  qword_18C497158 = (uint64_t)os_log_create("com.apple.foundation.filecoordination", "process-monitor");
  os_log_t result = os_log_create("com.apple.foundation.filecoordination", "fsevents");
  qword_18C497160 = (uint64_t)result;
  return result;
}

NSFileAccessArbiterProxy *__NSFileCoordinatorSharedAccessArbiter_block_invoke()
{
  qos_class_t v0 = qos_class_main();
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(0LL, v0, 0);
  mach_vm_size_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(v1, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.FileCoordination.3", v2);
  id v4 = +[NSFileCoordinator _createConnectionToFileAccessArbiterForQueue:]( &OBJC_CLASS___NSFileCoordinator,  "_createConnectionToFileAccessArbiterForQueue:",  v3);
  objc_msgSend( v4,  "setRemoteObjectInterface:",  +[NSFileCoordinator _fileAccessArbiterInterface](NSFileCoordinator, "_fileAccessArbiterInterface"));
  [v4 setOptions:4096];
  int64_t v5 = -[NSFileAccessArbiterProxy initWithServer:queue:]( objc_alloc(&OBJC_CLASS___NSFileAccessArbiterProxy),  "initWithServer:queue:",  v4,  v3);
  [v4 resume];

  dispatch_release(v3);
  return v5;
}

uint64_t __NSFileCoordinatorSharedAccessArbiter_block_invoke_2(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  qword_18C4971E8 = result;
  return result;
}

CFStringRef __CFCreateUUIDString()
{
  qos_class_t v0 = CFUUIDCreate(0LL);
  CFStringRef v1 = CFUUIDCreateString(0LL, v0);
  CFRelease(v0);
  return v1;
}

void sub_18369AB10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

void sub_18369ADC8(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void sub_18369BC38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t initUTTypeCopyDescription_0(uint64_t a1)
{
  mach_vm_size_t v2 = (void *)MobileCoreServicesLibrary_frameworkLibrary_4;
  if (!MobileCoreServicesLibrary_frameworkLibrary_4)
  {
    mach_vm_size_t v2 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 2);
    MobileCoreServicesLibrary_frameworkLibrary_4 = (uint64_t)v2;
    if (!v2) {
      __assert_rtn("MobileCoreServicesLibrary", "NSItemProviderRepresentation.m", 19, "frameworkLibrary");
    }
  }

  dispatch_queue_t v3 = (uint64_t (*)())dlsym(v2, "UTTypeCopyDescription");
  softLinkUTTypeCopyDescription_0 = v3;
  if (!v3) {
    __assert_rtn("initUTTypeCopyDescription", "NSItemProviderRepresentation.m", 20, "softLinkUTTypeCopyDescription");
  }
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

uint64_t NSByteCountFormatterAssertValidMeasurement(void *a1)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    [a1 unit];
    dispatch_queue_t v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"NSByteCountFormatter only supports measurements of dimension NSUnitInformationStorage -- got invalid unit '%@'", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v3);
    return (uint64_t)-[NSByteCountFormatter stringFromMeasurement:](v4, v5, v6);
  }

  return result;
}

uint64_t isDimensional()
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

void sub_18369FC68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __Block_byref_object_copy__26(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void sub_1836A03D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

void sub_1836A0CE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47, uint64_t a48, uint64_t a49, uint64_t a50,char a51)
{
}

void sub_1836A17B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_1836A19FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1836A2124( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1836A37F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1836A437C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void __Block_byref_object_copy__140(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__141(uint64_t a1)
{
}

void *pairsForURLs(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  mach_vm_size_t v2 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v3 = [a1 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(a1);
        }
        int v7 = *(NSURLPromisePair **)(*((void *)&v10 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          int v7 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", v7);
        }
        [v2 addObject:v7];
        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [a1 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }

    while (v4);
  }

  return v2;
}

void sub_1836AC4E8(_Unwind_Exception *a1)
{
}

void sub_1836AC6C4(_Unwind_Exception *a1)
{
}

void sub_1836AD518( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1836AD8FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

void sub_1836AE4DC(_Unwind_Exception *a1)
{
}

void sub_1836AFB00(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

uint64_t _NSFCGetFileProviderUIDFOrURL(void *a1, uid_t *a2, uint64_t *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (qword_18C494AB0 != -1) {
    dispatch_once(&qword_18C494AB0, &__block_literal_global_756);
  }
  if (off_18C494AA8 && !off_18C494AA8(a1, a2, a3))
  {
    uint64_t v6 = (os_log_s *)_NSFCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *a3;
      *(_DWORD *)fileSec = 138412290;
      *(void *)&fileSec[4] = v8;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "Failure to acquire UID from fault xattrs: %@",  fileSec,  0xCu);
    }
  }

  if (*a2) {
    return 1LL;
  }
  *(void *)fileSec = 0LL;
  if ([a1 getResourceValue:fileSec forKey:*MEMORY[0x189603C10] error:a3])
  {
    if (CFFileSecurityGetOwner(*(CFFileSecurityRef *)fileSec, a2)) {
      return 1LL;
    }
    *a3 = (uint64_t)+[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256LL,  0LL);
  }

  return 0LL;
}

void sub_1836B3144( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1836B3388(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v4 = objc_begin_catch(exception_object);
    uint64_t v5 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [v4 callStackSymbols];
      uint64_t v7 = v3 - 144;
      *(_DWORD *)(v3 - 144) = 138412546;
      *(void *)(v7 + 4) = v4;
      *(_WORD *)(v3 - 132) = 2112;
      *(void *)(v7 + 14) = v6;
      _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "An exception occurred while attempting to gather debug information: %@\n%@",  (uint8_t *)(v3 - 144),  0x16u);
    }

    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0LL);
    objc_end_catch();
    JUMPOUT(0x1836B3348LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_1836B3EB0( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, __int128 a12, uint64_t a13)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(a1);
    uint64_t v14 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v13 callStackSymbols];
      buf = 138412802;
      WORD2(a12) = 2112;
      *(void *)((char *)&a12 + 6) = v13;
      HIWORD(a12) = 2112;
      a13 = v15;
      _os_log_error_impl( &dword_182EB1000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to write filecoordinationd dump file to %@. Received exception: %@\n%@",  (uint8_t *)&buf,  0x20u);
    }

    objc_end_catch();
    JUMPOUT(0x1836B3E1CLL);
  }

  _Unwind_Resume(a1);
}

void sub_1836B3FFC()
{
}

void sub_1836B5AE8(_Unwind_Exception *a1)
{
}

NSError *_secureCodingScreenedError(NSError *a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v28 = 0LL;
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  uint64_t v30 = ___secureCodingScreenedError_block_invoke;
  uint64_t v31 = &unk_189CA4D10;
  unint64_t v32 = v2;
  uint64_t v33 = v3;
  uint64_t v23 = 0LL;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  uint64_t v26 = __Block_byref_object_copy__27;
  int v27 = __Block_byref_object_dispose__27;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  size_t v20 = ___secureCodingScreenedError_block_invoke_2;
  size_t v21 = &unk_189CA4D38;
  double v22 = &v23;
  InstanceMethod = class_getInstanceMethod(v2, sel_localizedDescription);
  if (InstanceMethod == class_getInstanceMethod(v3, sel_localizedDescription)) {
    uint64_t v5 = -[NSDictionary objectForKey:]( -[NSError userInfo](a1, "userInfo", v18, v19),  "objectForKey:",  @"NSLocalizedDescription");
  }
  else {
    uint64_t v5 = -[NSError localizedDescription](a1, "localizedDescription", v18, v19);
  }
  uint64_t v6 = v5;
  if (v5) {
    v20((uint64_t)&v18, (uint64_t)@"NSLocalizedDescription", v5);
  }
  else {
    uint64_t v7 = -[NSDictionary objectForKey:]( -[NSError userInfo](a1, "userInfo"),  "objectForKey:",  @"NSLocalizedFailureReason");
  }
  uint64_t v8 = v7;
  if (v7) {
    v20((uint64_t)&v18, (uint64_t)@"NSLocalizedFailureReason", v7);
  }
  if (!-[NSError localizedRecoveryOptions](a1, "localizedRecoveryOptions", v8)
    && !-[NSError recoveryAttempter](a1, "recoveryAttempter"))
  {
    if (((unsigned int (*)(void *, char *))v30)(v29, sel_localizedRecoverySuggestion))
    {
      uint64_t v9 = -[NSError localizedRecoverySuggestion](a1, "localizedRecoverySuggestion");
      if (v9) {
        v20((uint64_t)&v18, (uint64_t)@"NSLocalizedRecoverySuggestion", v9);
      }
    }
  }

  if (-[NSDictionary objectForKey:]( -[NSError userInfo](a1, "userInfo", v9),  "objectForKey:",  @"NSUnderlyingError"))
  {
    uint64_t v10 = _secureCodingScreenedError();
    if (v10) {
      v20((uint64_t)&v18, (uint64_t)@"NSUnderlyingError", v10);
    }
  }

  uint64_t v11 = -[NSDictionary objectForKey:](-[NSError userInfo](a1, "userInfo", v10), "objectForKey:", @"NSHelpAnchor");
  if (v11) {
    v20((uint64_t)&v18, (uint64_t)@"NSHelpAnchor", v11);
  }
  uint64_t v12 = -[NSDictionary objectForKey:](-[NSError userInfo](a1, "userInfo", v11), "objectForKey:", @"NSURL");
  if (v12) {
    v20((uint64_t)&v18, (uint64_t)@"NSURL", v12);
  }
  uint64_t v13 = -[NSDictionary objectForKey:](-[NSError userInfo](a1, "userInfo", v12), "objectForKey:", @"NSFilePath");
  if (v13) {
    v20((uint64_t)&v18, (uint64_t)@"NSFilePath", v13);
  }
  if (-[NSDictionary objectForKey:]( -[NSError userInfo](a1, "userInfo", v13),  "objectForKey:",  @"NSRecoveryAttempter"))
  {
    v20((uint64_t)&v18, (uint64_t)@"NSRecoveryAttempter", 0LL);
  }

  if (-[NSDictionary objectForKey:]( -[NSError userInfo](a1, "userInfo"),  "objectForKey:",  @"NSLocalizedRecoveryOptions"))
  {
    v20((uint64_t)&v18, (uint64_t)@"NSLocalizedRecoveryOptions", 0LL);
  }

  uint64_t v14 = (void *)v24[5];
  if (v14 && (objc_msgSend(v14, "isEqualToDictionary:", -[NSError userInfo](a1, "userInfo")) & 1) == 0)
  {
    uint64_t v15 = -[NSError domain](a1, "domain");
    uint64_t v16 = -[NSError code](a1, "code");
    a1 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v15,  v16,  v24[5]);
  }

  _Block_object_dispose(&v23, 8);
  return a1;
}

void sub_1836B7100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_1836B836C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

NSUUID *_uniqueFileProviderID(void *a1)
{
  AssociatedObject = (NSUUID *)objc_getAssociatedObject(a1, "_fileProviderID");
  if (!AssociatedObject)
  {
    AssociatedObject = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
    objc_setAssociatedObject(a1, "_fileProviderID", AssociatedObject, (void *)0x301);
  }

  return AssociatedObject;
}

void sub_1836B8A08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1836B8B28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1836BE654(_Unwind_Exception *a1)
{
}

void sub_1836BEC40(_Unwind_Exception *a1)
{
}

BOOL ___secureCodingScreenedError_block_invoke(uint64_t a1, const char *a2)
{
  Method InstanceMethod = class_getInstanceMethod(*(Class *)(a1 + 32), a2);
  return InstanceMethod != class_getInstanceMethod(*(Class *)(a1 + 40), a2);
}

uint64_t ___secureCodingScreenedError_block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 40LL))
  {
    if (!a3) {
      return result;
    }
    return [*(id *)(*(void *)(*(void *)(v5 + 32) + 8) + 40) setObject:a3 forKey:a2];
  }

  uint64_t result = objc_opt_new();
  *(void *)(*(void *)(*(void *)(v5 + 32) + 8LL) + 40LL) = result;
  if (a3) {
    return [*(id *)(*(void *)(*(void *)(v5 + 32) + 8) + 40) setObject:a3 forKey:a2];
  }
  return result;
}

uint64_t _nearestPresenterInterestedInSubitemPresenters(void *a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = __Block_byref_object_copy__28;
  uint64_t v10 = __Block_byref_object_dispose__28;
  uint64_t v11 = 0LL;
  uint64_t v1 = (void *)[a1 parent];
  uint64_t v2 = MEMORY[0x1895F87A8];
  while (1)
  {
    uint64_t v3 = v7[5];
    if (!v1 || v3) {
      break;
    }
    v5[0] = v2;
    v5[1] = 3221225472LL;
    v5[2] = ___nearestPresenterInterestedInSubitemPresenters_block_invoke;
    v5[3] = &unk_189CA40F0;
    v5[4] = &v6;
    [v1 forEachPresenterOfItemPerformProcedure:v5];
    uint64_t v1 = (void *)[v1 parent];
  }

  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1836C4260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

uint64_t _nodeHasPresentersExcludingPresenter(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = ___nodeHasPresentersExcludingPresenter_block_invoke;
  v4[3] = &unk_189CA5130;
  v4[4] = a2;
  v4[5] = &v5;
  [a1 forEachPresenterOfItemPerformProcedure:v4];
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1836C4330( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1836C46DC(_Unwind_Exception *a1)
{
}

void sub_1836C6D10(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy__28(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

uint64_t ___nearestPresenterInterestedInSubitemPresenters_block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 112) >> 31) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 40LL) = a2;
  }
  return result;
}

uint64_t ___nodeHasPresentersExcludingPresenter_block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

id ___messageToResponsesTable_block_invoke()
{
  v3[5] = *MEMORY[0x1895F89C0];
  uint64_t v0 = objc_msgSend(MEMORY[0x189603F68], "sharedKeySetForKeys:", +[x allKeys](&unk_189D1F450, "allKeys"));
  uint64_t v1 = (void *)[MEMORY[0x189603FC8] dictionaryWithSharedKeySet:v0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = ___messageToResponsesTable_block_invoke_346;
  v3[3] = &unk_189C9A768;
  v3[4] = v1;
  +[x enumerateKeysAndObjectsUsingBlock:](&unk_189D1F450, "enumerateKeysAndObjectsUsingBlock:", v3);
  id result = v1;
  _MergedGlobals_3_0 = (uint64_t)result;
  return result;
}

uint64_t ___messageToResponsesTable_block_invoke_346(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

uint64_t _canonicalStringRepresentation(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (-[NSFileManager getFileSystemRepresentation:maxLength:withPath:]( v2,  "getFileSystemRepresentation:maxLength:withPath:",  __s,  1024LL,  a1))
  {
    return (uint64_t)-[NSFileManager stringWithFileSystemRepresentation:length:]( v2,  "stringWithFileSystemRepresentation:length:",  __s,  strlen(__s));
  }

  return a1;
}

void sub_1836CDC80( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_1836CEA98(_Unwind_Exception *a1)
{
}

void sub_1836CF610(_Unwind_Exception *a1)
{
}

void __Block_byref_object_copy__29(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

uint64_t gsDefaultStorageManager()
{
  if (qword_18C497250 != -1) {
    dispatch_once(&qword_18C497250, &__block_literal_global_81);
  }
  return [(id)qword_18C497248 manager];
}

void sub_1836D1B8C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void sub_1836D2D98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_1836D32B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *__initializeUbiquityStuff_block_invoke()
{
  uint64_t v0 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  uint64_t v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  uint64_t v2 = -[NSArray count](v1, "count");
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0LL;
    while (1)
    {
      id v5 = -[NSArray objectAtIndex:](v1, "objectAtIndex:", v4);
      uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend(v5, "stringByAppendingPathComponent:", @"Frameworks"),  "stringByAppendingPathComponent:",  @"GenerationalStorage.framework");
      if (-[NSFileManager fileExistsAtPath:](v0, "fileExistsAtPath:", v6)) {
        break;
      }
      uint64_t v6 = (void *)objc_msgSend( (id)objc_msgSend(v5, "stringByAppendingPathComponent:", @"PrivateFrameworks"),  "stringByAppendingPathComponent:",  @"GenerationalStorage.framework");
      if (-[NSFileManager fileExistsAtPath:](v0, "fileExistsAtPath:", v6)) {
        break;
      }
      if (v3 == ++v4) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_6:
    uint64_t v6 = 0LL;
  }

  id result = (void *)[v6 stringByAppendingString:@"/GenerationalStorage"];
  if (result)
  {
    id result = dlopen((const char *)[result fileSystemRepresentation], 256);
    if (result)
    {
      char v8 = result;
      _MergedGlobals_150 = *(void *)dlsym(result, "GSGenerationalStorageErrorDomain");
      qword_18C497230 = *(void *)dlsym(v8, "GSAdditionCreationNameSpaceKey");
      qword_18C497238 = *(void *)dlsym(v8, "GSAdditionCreationNameKey");
      qword_18C497240 = *(void *)dlsym(v8, "GSAdditionCreationUserInfoKey");
      id result = objc_lookUpClass("GSStorageManager");
      qword_18C497248 = (uint64_t)result;
    }
  }

  return result;
}

void sub_1836D5A10( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void __Block_byref_object_copy__31(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void __Block_byref_object_copy__66(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__67(uint64_t a1)
{
}

uint64_t eventStreamCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  void v7[7] = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __eventStreamCallback_block_invoke;
  v7[3] = &unk_189CA5A50;
  v7[5] = a5;
  v7[6] = a6;
  v7[4] = a2;
  return [a4 enumerateObjectsUsingBlock:v7];
}

void sub_1836D654C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void *__initializeFSEvents_block_invoke()
{
  id result = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (result)
  {
    uint64_t v1 = result;
    off_18C4972A0 = (uint64_t (*)(void, void, void, void, void, void, double))dlsym(result, "FSEventStreamCreate");
    off_18C497298 = (uint64_t (*)(void))dlsym(v1, "FSEventStreamInvalidate");
    off_18C497288 = (uint64_t (*)(void))dlsym(v1, "FSEventStreamRelease");
    off_18C4972A8 = (uint64_t (*)(void, void))dlsym(v1, "FSEventStreamSetDispatchQueue");
    off_18C4972B0 = (uint64_t (*)(void))dlsym(v1, "FSEventStreamStart");
    id result = dlsym(v1, "FSEventStreamStop");
    off_18C497290 = (uint64_t (*)(void))result;
  }

  return result;
}

uint64_t __eventStreamCallback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleFSEventPath:a2 flags:*(unsigned int *)(*(void *)(a1 + 40) + 4 * a3) id:*(void *)(*(void *)(a1 + 48) + 8 * a3)];
}

void clearAllObservers(uint64_t a1)
{
  uint64_t v1 = (unsigned int *)(a1 + 24);
  if (atomic_load((unsigned int *)(a1 + 24)))
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 28);
    os_unfair_lock_lock_with_options();
    unsigned int v5 = atomic_load(v1);
    if (v5 < 2) {
      id Weak = 0LL;
    }
    else {
      id Weak = objc_loadWeak((id *)(a1 + 16));
    }
    atomic_store(0, (unsigned int *)(a1 + 24));
    objc_storeWeak((id *)(a1 + 16), 0LL);
    os_unfair_lock_unlock(v4);
  }

void addObserver(uint64_t a1, void *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 28);
  os_unfair_lock_lock_with_options();
  unsigned int v5 = (unsigned int *)(a1 + 24);
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));
  if (v6 == 1)
  {
    char v8 = (id *)(a1 + 16);
    id Weak = objc_loadWeak((id *)(a1 + 16));
    uint64_t v10 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  517LL,  0LL);
    objc_storeWeak(v8, v10);
    -[NSHashTable addObject:](v10, "addObject:", Weak);
LABEL_8:
    -[NSHashTable addObject:](v10, "addObject:", a2);
    goto LABEL_9;
  }

  uint64_t v7 = (id *)(a1 + 16);
  if (v6)
  {
    uint64_t v10 = (NSHashTable *)objc_loadWeak(v7);
    goto LABEL_8;
  }

  objc_storeWeak(v7, a2);
LABEL_9:
  os_unfair_lock_unlock(v4);
}

void removeObservation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (unsigned int *)(a1 + 24);
  if (atomic_load((unsigned int *)(a1 + 24)))
  {
    unsigned int v6 = (os_unfair_lock_s *)(a1 + 28);
    os_unfair_lock_lock_with_options();
    do
    {
      unsigned int v7 = __ldaxr(v2);
      unsigned int v8 = v7 - 1;
    }

    while (__stlxr(v7 - 1, v2));
    uint64_t v9 = (id *)(a1 + 16);
    if (v7 == 1)
    {
      uint64_t v11 = 0LL;
      id Weak = 0LL;
    }

    else
    {
      id Weak = objc_loadWeak((id *)(a1 + 16));
      [Weak removeObject:a2];
      if (v8 != 1)
      {
        id Weak = 0LL;
        goto LABEL_11;
      }

      uint64_t v11 = (void *)[Weak anyObject];
    }

    objc_storeWeak(v9, v11);
LABEL_11:
    os_unfair_lock_unlock(v6);
  }

void withUnlockedObservers(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v4 = MEMORY[0x186E1FF60]();
  unsigned int v5 = (void *)v4;
  if (atomic_load((unsigned int *)(a1 + 24)))
  {
    uint64_t v18 = (void *)v4;
    os_unfair_lock_t v19 = (os_unfair_lock_t)(a1 + 28);
    os_unfair_lock_lock_with_options();
    v17[1] = v17;
    unint64_t v7 = atomic_load((unsigned int *)(a1 + 24));
    if ((_DWORD)v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 1LL;
    }
    MEMORY[0x1895F8858](v8);
    uint64_t v10 = (void *)((char *)v17 - v9);
    if (v7 >= 0x101)
    {
      uint64_t v10 = (void *)_CFCreateArrayStorage();
      size_t v20 = v10;
    }

    else
    {
      size_t v20 = 0LL;
      if (!(_DWORD)v7)
      {
LABEL_22:
        os_unfair_lock_unlock(v19);
        (*(void (**)(uint64_t, void *, unint64_t))(a2 + 16))(a2, v10, v7);
        free(v20);
        unsigned int v5 = v18;
        goto LABEL_23;
      }
    }

    if ((_DWORD)v7 == 1)
    {
      void *v10 = objc_loadWeak((id *)(a1 + 16));
    }

    else
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id Weak = objc_loadWeak((id *)(a1 + 16));
      uint64_t v12 = [Weak countByEnumeratingWithState:&v22 objects:v21 count:16];
      if (v12)
      {
        unint64_t v13 = 0LL;
        uint64_t v14 = *(void *)v23;
        do
        {
          uint64_t v15 = 0LL;
          if (v7 >= v13) {
            uint64_t v16 = v7 - v13;
          }
          else {
            uint64_t v16 = 0LL;
          }
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(Weak);
            }
            if (v16 == v15) {
              __assert_rtn("withUnlockedObservers", "_NSObserverList.m", 41, "idx < count");
            }
            v10[v13 + v15] = *(void *)(*((void *)&v22 + 1) + 8 * v15);
            ++v15;
          }

          while (v12 != v15);
          uint64_t v12 = [Weak countByEnumeratingWithState:&v22 objects:v21 count:16];
          v13 += v15;
        }

        while (v12);
      }
    }

    goto LABEL_22;
  }

  (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
LABEL_23:
  objc_autoreleasePoolPop(v5);
}

void sub_1836D7988(_Unwind_Exception *a1)
{
}

void sub_1836D7CA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
}

void _sendReplyArgumentsOnly( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v12 = -[NSXPCEncoder initWithStackSpace:size:]( objc_alloc(&OBJC_CLASS___NSXPCEncoder),  "initWithStackSpace:size:",  v17,  2048LL);
  -[NSXPCEncoder _setConnection:](v12, "_setConnection:", a1);
  -[NSXPCEncoder setDelegate:](v12, "setDelegate:", a1);
  if (*(void *)(a1 + 80)) {
    -[NSXPCCoder setUserInfo:](v12, "setUserInfo:");
  }
  -[NSXPCEncoder _encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:]( v12,  "_encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:",  a3,  a4,  a2,  0LL,  1LL,  a7);

  char v15 = atomic_load((unsigned int *)(a1 + 36));
  if ((v15 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(a1 + 152), "sendMessage:", a7, v13, v14);
  }

  else
  {
    uint64_t v16 = *(_xpc_connection_s **)(a1 + 8);
    if (v16) {
      xpc_connection_send_message(v16, a7);
    }
  }

void sub_1836D8038(_Unwind_Exception *a1)
{
}

id _replacedWithDistantObject(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a2) {
    return (id)a2;
  }
  uint64_t v8 = [a3 _interfaceForArgument:a5 ofSelector:a4 reply:1];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8) {
      return (id)a2;
    }
    uint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[NSXPCConnection sendInvocation]: A proxy object was passed as an argument to a reply block (argument %ld) but the interface does not specify a proxy object there.",  a5);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
  }

  if (v8) {
    return  -[_NSXPCDistantObject _initWithConnection:exportedObject:interface:]( objc_alloc(&OBJC_CLASS____NSXPCDistantObject),  "_initWithConnection:exportedObject:interface:",  a1,  a2,  v8);
  }
  return (id)a2;
}

id __NSXPCCONNECTION_IS_CALLING_OUT_TO_EXPORTED_OBJECT_S0__(void *a1, const char *a2)
{
  return [a1 a2];
}

void message_handler_0(unsigned __int8 *a1, id a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1895F9250])
  {
    xpc_object_t v6 = __NSXPCCONNECTION_IS_CREATING_REPLY__(a2);
    message_handler_message((uint64_t)a1, a2, (uint64_t)v6);
    if (v6) {
      xpc_release(v6);
    }
  }

  else if (Class == (Class)MEMORY[0x1895F9268])
  {
    message_handler_error(a1, (uint64_t)a2);
  }

  else
  {
    unsigned int v5 = (os_log_s *)_NSXPCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = a1;
      _os_log_fault_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_FAULT,  "%{public}@: Unexpected data on XPC connection, invalidating the connection.",  (uint8_t *)&v7,  0xCu);
    }

    [a1 invalidate];
  }

void message_handler_error(unsigned __int8 *a1, uint64_t a2)
{
  v13[5] = *MEMORY[0x1895F89C0];
  if (a2 == MEMORY[0x1895F9198])
  {
    ++*(void *)(*((void *)a1 + 9) + 8LL);
    uint64_t v3 = (void *)MEMORY[0x186E1FF60](a1);
    uint64_t v4 = [a1 interruptionHandler];
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
    objc_autoreleasePoolPop(v3);
  }

  else if (a2 != MEMORY[0x1895F91C8])
  {
    if (a2 == MEMORY[0x1895F91A0])
    {
      unsigned int v5 = (void *)MEMORY[0x186E1FF60](a1);
      -[_NSXPCConnectionRequestedReplies invalidate](*((void *)a1 + 8));
      uint64_t v6 = [a1 invalidationHandler];
      if (v6) {
        (*(void (**)(void))(v6 + 16))();
      }
      uint64_t v7 = [a1 _additionalInvalidationHandler];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
        dispatch_async(global_queue, v8);
        objc_msgSend(a1, "set_additionalInvalidationHandler:", 0);
      }

      [a1 setInvalidationHandler:0];
      [a1 setInterruptionHandler:0];
      [a1 setExportedObject:0];
      -[_NSXPCConnectionExportedObjectTable invalidate](*((void *)a1 + 7));
      -[_NSXPCConnectionClassCache clear](*((void *)a1 + 15));
      -[_NSXPCConnectionClassCache clear](*((void *)a1 + 16));
      objc_autoreleasePoolPop(v5);
      uint64_t v10 = a1 + 32;
      do
        unsigned __int8 v11 = __ldxr(v10);
      while (__stxr(v11 & 0xFB, v10));
      if ((v11 & 4) != 0)
      {
        uint64_t v12 = (dispatch_queue_s *)*((void *)a1 + 3);
        v13[0] = MEMORY[0x1895F87A8];
        v13[1] = 3221225472LL;
        v13[2] = __message_handler_error_block_invoke;
        v13[3] = &unk_189C9A030;
        v13[4] = a1;
        dispatch_async(v12, v13);
      }
    }

    else if (a2 == MEMORY[0x1895F91C0])
    {
      [a1 invalidate];
    }
  }

void sub_1836D9524(_Unwind_Exception *a1)
{
}

void sub_1836D9750(_Unwind_Exception *a1)
{
}

void __message_handler_error_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E1FF60]();
  CFRelease(*(CFTypeRef *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1836DB8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_1836DBFFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

void __Block_byref_object_copy__33(uint64_t a1, uint64_t a2)
{
}

void sub_1836DEEAC(_Unwind_Exception *a1)
{
}

void sub_1836DF0BC(_Unwind_Exception *a1)
{
}

void sub_1836DF25C(_Unwind_Exception *a1)
{
}

void sub_1836DF360( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t _NSPNCSettings(void *a1)
{
  uint64_t result = [a1 copy];
  _overriddenSettings = result;
  return result;
}

void sub_1836E0538( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_1836E075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void *initNPNameParser()
{
  if (qword_18C4964D0
    || (uint64_t result = dlopen("/System/Library/PrivateFrameworks/CoreNameParser.framework/CoreNameParser", 1),
        (qword_18C4964D0 = (uint64_t)result) != 0))
  {
    uint64_t result = objc_getClass("NPNameParser");
    qword_18C4964C8 = (uint64_t)result;
    getNPNameParserClass Class = NPNameParserFunction;
  }

  return result;
}

uint64_t NPNameParserFunction()
{
  return qword_18C4964C8;
}

void sub_1836E14B0(_Unwind_Exception *a1)
{
}

void sub_1836E14CC()
{
}

void sub_1836E163C(_Unwind_Exception *a1)
{
}

void sub_1836E385C(void *a1)
{
  *(void *)(v1 + v2) = 0LL;
  objc_exception_rethrow();
  __break(1u);
}

void sub_1836E386C(_Unwind_Exception *a1)
{
}

uint64_t ___initializeClasses_block_invoke()
{
  uint64_t result = [(id)xpc_get_class4NSXPC() superclass];
  _XPCObjectClass Class = result;
  return result;
}

void _removeAllowedClass(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 2264 + 8LL * *(void *)(a1 + 4440));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    unsigned int v5 = (void *)[v4 mutableCopy];
    [v5 removeObject:a2];
  }

  else
  {
    if (v4 != a2) {
      return;
    }
    unsigned int v5 = 0LL;
  }

  *(void *)(a1 + 2264 + 8LL * *(void *)(a1 + 4440)) = v5;
}

uint64_t compare_1(double *a1, double *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1LL;
  }
  else {
    return v2;
  }
}

void service_connection_handler_make_remote_connection(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E1FF60]();
  unsigned int v5 = (void *)-[NSXPCConnection _initWithRemotePeerConnection:name:options:]( [NSXPCConnection alloc],  a2,  (__CFString *)[a1 serviceName]);
  [a1 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)objc_msgSend(a1, "delegate"), "listener:shouldAcceptNewConnection:", a1, v5) & 1) == 0)
  {
    [v5 invalidate];
  }

  objc_autoreleasePoolPop(v4);
}

void service_connection_handler(_xpc_connection_s *a1)
{
}

void additional_service_handler(_xpc_connection_s *a1)
{
  unsigned int v2 = (void *)atomic_load(&_additionalListener);
  service_connection_handler_make_connection(v2, a1);
}

void ___setupListenerConnection_block_invoke(uint64_t a1, id a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1895F9238])
  {
    service_connection_handler_make_connection(*(void **)(a1 + 32), (_xpc_connection_s *)a2);
  }

  else if (Class != (Class)MEMORY[0x1895F9268])
  {
    unsigned int v5 = (void *)MEMORY[0x186E21CF4](a2);
    uint64_t v6 = (os_log_s *)_NSXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446210;
      uint64_t v8 = v5;
      _os_log_fault_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_FAULT,  "NSXPCListener: received error or other non-connection type in handler for listener: %{public}s",  (uint8_t *)&v7,  0xCu);
    }

    free(v5);
  }

void service_connection_handler_make_connection(void *a1, _xpc_connection_s *a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E1FF60]();
  unsigned int v5 = (void *)-[NSXPCConnection _initWithPeerConnection:name:options:]( [NSXPCConnection alloc],  a2,  (__CFString *)[a1 serviceName]);
  [a1 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)objc_msgSend(a1, "delegate"), "listener:shouldAcceptNewConnection:", a1, v5) & 1) == 0)
  {
    [v5 invalidate];
  }

  objc_autoreleasePoolPop(v4);
}

void ___setupRemoteListenerConnection_block_invoke(uint64_t a1, id a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  Class Class = object_getClass(a2);
  if (Class == (Class)_XPC_TYPE_REMOTE_CONNECTION)
  {
    service_connection_handler_make_remote_connection(*(void **)(a1 + 32), (uint64_t)a2);
  }

  else if (Class != (Class)MEMORY[0x1895F9268])
  {
    unsigned int v5 = (void *)MEMORY[0x186E21CF4](a2);
    uint64_t v6 = (os_log_s *)_NSXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446210;
      uint64_t v8 = v5;
      _os_log_fault_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_FAULT,  "NSXPCListener: received error or other non-connection type in handler for remote listener: %{public}s",  (uint8_t *)&v7,  0xCu);
    }

    free(v5);
  }

void _NSXPCInterfaceMethodInfoDealloc(uint64_t a1, id *a2)
{
  if (a2)
  {

    free(a2);
  }

const char *_NSXPCInterfaceDebugDescriptionHelper(const char *result, uint64_t a2, void *a3)
{
  if (a2)
  {
    Name = sel_getName(result);
    uint64_t v6 = [*(id *)(a2 + 16) count];
    int v7 = @">=1";
    uint64_t v8 = *(_BYTE *)(a2 + 44) ? @">=1" : @"0";
    [a3 appendFormat:@"SEL: %s (%ld arguments, %@ proxies)\n Classes: %@\n", Name, v6, v8, descriptionForClassArray(*(void **)(a2 + 16))];
    uint64_t v9 = *(unsigned int *)(a2 + 40);
    uint64_t result = (const char *)[*(id *)a2 _typeString];
    uint64_t v10 = result;
    if ((_DWORD)v9 || result)
    {
      uint64_t v11 = [*(id *)(a2 + 8) count];
      if (!*(_BYTE *)(a2 + 45)) {
        int v7 = @"0";
      }
      return (const char *)[a3 appendFormat:@" Reply block: (arg #%d, (%ld arguments, %@ proxies), signature '%@') %@\n", v9, v11, v7, v10, descriptionForClassArray(*(void **)(a2 + 8))];
    }
  }

  return result;
}

void setProtocolMetadata(Protocol *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unsigned int outCount = 0;
    uint64_t v4 = protocol_copyProtocolList(a1, &outCount);
    if (v4)
    {
      unsigned int v5 = v4;
      if (outCount)
      {
        unint64_t v6 = 0LL;
        uint64_t v7 = _MergedGlobals_156;
        do
        {
          if (v7 != -1) {
            dispatch_once(&_MergedGlobals_156, &__block_literal_global_88);
          }
          uint64_t v8 = v5[v6];
          if (v8 == (Protocol *)qword_18C497320)
          {
            uint64_t v7 = -1LL;
          }

          else
          {
            setProtocolMetadata(v8, a2);
            uint64_t v7 = _MergedGlobals_156;
          }

          ++v6;
        }

        while (v6 < outCount);
      }

      free(v5);
    }

    uint64_t v9 = protocol_copyMethodDescriptionList(a1, 1, 1, &outCount);
    if (v9)
    {
      uint64_t v10 = v9;
      setProtocolMetdataWithMethods(a1, a2, (uint64_t)v9, outCount);
      free(v10);
    }

    uint64_t v11 = protocol_copyMethodDescriptionList(a1, 0, 1, &outCount);
    if (v11)
    {
      uint64_t v12 = v11;
      setProtocolMetdataWithMethods(a1, a2, (uint64_t)v11, outCount);
      free(v12);
    }
  }

uint64_t setProtocolContextFlush(uint64_t result)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v1 = result;
    uint64_t result = class_addMethodsBulk();
    *(_DWORD *)(v1 + _Block_object_dispose(va, 8) = 0;
  }

  return result;
}

BOOL isMethodFromNSObjectProtocol(Protocol *a1, const char *a2, BOOL a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (&unk_18C64FAE8 == (_UNKNOWN *)a1) {
    return containsMethod(a1, a2, a3);
  }
  unsigned int outCount = 0;
  unint64_t v6 = protocol_copyProtocolList(a1, &outCount);
  if (!v6) {
    return 0LL;
  }
  unint64_t v7 = outCount;
  if (!outCount) {
    goto LABEL_11;
  }
  if (*v6 != (Protocol *)&unk_18C64FAE8)
  {
    uint64_t v8 = 1LL;
    while (outCount != v8)
    {
      uint64_t v9 = v6[v8++];
      if (v9 == (Protocol *)&unk_18C64FAE8)
      {
        unint64_t v10 = v8 - 1;
        free(v6);
        if (v10 < v7) {
          goto LABEL_13;
        }
        return 0LL;
      }
    }

void setProtocolMetadataWithSignature(const char *a1, uint64_t a2, void *a3, uint64_t a4, int a5)
{
  if (qword_18C497328 != -1) {
    dispatch_once(&qword_18C497328, &__block_literal_global_195);
  }
  if (a5) {
    unint64_t v10 = 1LL;
  }
  else {
    unint64_t v10 = 2LL;
  }
  unint64_t v11 = [a3 numberOfArguments];
  if (v11 < v10)
  {
    if (a5) {
      uint64_t v26 = @"reply block of method";
    }
    else {
      uint64_t v26 = @"method";
    }
    __int128 v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Too few arguments to %@ (%s / %s)",  v26,  a2,  sel_getName(a1));
LABEL_42:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v25 userInfo:0]);
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v27, v28, v29, v30, v31, v32);
  }

  else
  {
    unint64_t v12 = v11;
    if ((a5 & 1) == 0)
    {
      uint64_t v13 = (_WORD *)[a3 _argInfo:-1];
      __int16 v14 = v13[17];
      if ((v14 & 0x80) != 0) {
        __int16 v14 = *(_WORD *)(*(void *)v13 + 34LL);
      }
      if ((v14 & 0x2000) != 0) {
        *(void *)(a4 + 32) = [a3 _classForObjectAtArgumentIndex:-1];
      }
    }

    id v34 = objc_alloc_init(MEMORY[0x189603FA8]);
    if (v10 < v12)
    {
      char v15 = 0;
      while (1)
      {
        uint64_t v16 = (_WORD *)[a3 _argInfo:v10];
        __int16 v17 = v16[17];
        if ((v17 & 0x80) != 0) {
          __int16 v17 = *(_WORD *)(*(void *)v16 + 34LL);
        }
        if ((v17 & 0x2000) == 0) {
          goto LABEL_26;
        }
        if (v17 < 0) {
          break;
        }
        uint64_t v18 = [a3 _classForObjectAtArgumentIndex:v10];
        if (!v18)
        {
          if ([a3 _protocolsForObjectAtArgumentIndex:v10]) {
            goto LABEL_26;
          }
LABEL_30:
          uint64_t v21 = qword_18C497330;
          goto LABEL_27;
        }

        uint64_t v19 = v18;
        size_t v20 = v34;
        uint64_t v21 = v19;
LABEL_28:
        [v20 addObject:v21];
        if (v12 == ++v10) {
          goto LABEL_31;
        }
      }

      if (a5)
      {
        __int128 v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Blocks as arguments to the reply block of method (%s / %s) are not allowed",  a2,  sel_getName(a1),  v33);
        goto LABEL_42;
      }

      if ((v15 & 1) != 0)
      {
        __int128 v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Only one reply block is allowed per selector (%s / %s)",  a2,  sel_getName(a1),  v33);
        goto LABEL_42;
      }

      uint64_t v22 = [a3 _signatureForBlockAtArgumentIndex:v10];
      if (!v22)
      {
        __int128 v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Unable to get block signature from Protocol data (%s / %s). Use of clang is required for NSXPCInterface.",  a2,  sel_getName(a1),  v33);
        goto LABEL_42;
      }

      __int128 v23 = (void *)v22;
      *(_DWORD *)(a4 + 40) = v10;

      *(void *)a4 = v23;
      char v15 = 1;
      setProtocolMetadataWithSignature(a1, a2, v23, a4, 1LL);
LABEL_26:
      uint64_t v21 = [MEMORY[0x189604010] set];
LABEL_27:
      size_t v20 = v34;
      goto LABEL_28;
    }

void sub_1836E6A04(_Unwind_Exception *a1)
{
}

void sub_1836E6A10(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1836E6A1CLL);
}

void sub_1836E6D28(_Unwind_Exception *a1)
{
}

void sub_1836E7360(_Unwind_Exception *a1)
{
}

uint64_t methodSignatureForSelectorInProtocol(SEL aSel, Protocol *p)
{
  if (aSel
    && p
    && ((objc_method_description MethodDescription = protocol_getMethodDescription(p, aSel, 1, 1),
         types = MethodDescription.types,
         MethodDescription.name)
     || (objc_method_description v6 = protocol_getMethodDescription(p, aSel, 0, 1), types = v6.types, v6.name)))
  {
    return [MEMORY[0x189603FA0] signatureWithObjCTypes:types];
  }

  else
  {
    return 0LL;
  }

void sub_1836E768C(_Unwind_Exception *a1)
{
}

void sub_1836E798C(_Unwind_Exception *a1)
{
}

void sub_1836E7C60(_Unwind_Exception *a1)
{
}

void sub_1836E7EA4(_Unwind_Exception *a1)
{
}

void sub_1836E8000(_Unwind_Exception *a1)
{
}

void sub_1836E816C(_Unwind_Exception *a1)
{
}

void _maxVersionFinder(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (a2) {
    unint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    unint64_t v3 = 1LL;
  }
  if (v3 > *a3) {
    *a3 = v3;
  }
}

void sub_1836E82B8(void *a1)
{
}

void sub_1836E82CC(_Unwind_Exception *a1)
{
}

void sub_1836E8440(void *a1)
{
}

void sub_1836E8454(_Unwind_Exception *a1)
{
}

void sub_1836E853C(_Unwind_Exception *a1)
{
}

void sub_1836E8614(void *a1)
{
}

void sub_1836E8630(_Unwind_Exception *a1)
{
}

void sub_1836E86A4(void *a1)
{
}

void sub_1836E86B8(_Unwind_Exception *a1)
{
}

CFStringRef descriptionForClassArray(void *a1)
{
  if (![a1 count]) {
    return @"[]";
  }
  unsigned int v2 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"[");
  -[NSMutableString appendString:]( v2,  "appendString:",  descriptionForArgumentEntry((void *)[a1 objectAtIndex:0]));
  if ((unint64_t)[a1 count] >= 2 && (unint64_t)objc_msgSend(a1, "count") >= 2)
  {
    unint64_t v3 = 1LL;
    do
      -[NSMutableString appendFormat:]( v2,  "appendFormat:",  @", %@",  descriptionForArgumentEntry((void *)[a1 objectAtIndex:v3++]));
    while (v3 < [a1 count]);
  }

  -[NSMutableString appendFormat:](v2, "appendFormat:", @"]");
  return (const __CFString *)v2;
}

NSString *descriptionForArgumentEntry(void *a1)
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (![a1 count]) {
      return (NSString *)@"{}";
    }
    unsigned int v2 = +[NSString stringWithString:](&OBJC_CLASS___NSMutableString, "stringWithString:", @"{");
    unint64_t v3 = (void *)[a1 allObjects];
    -[NSMutableString appendFormat:]( v2,  "appendFormat:",  @"%s",  class_getName((Class)[v3 objectAtIndex:0]));
    if ((unint64_t)[v3 count] >= 2 && (unint64_t)objc_msgSend(v3, "count") >= 2)
    {
      unint64_t v4 = 1LL;
      do
        -[NSMutableString appendFormat:]( v2,  "appendFormat:",  @", %s",  class_getName((Class)[v3 objectAtIndex:v4++]));
      while (v4 < [v3 count]);
    }

    -[NSMutableString appendFormat:](v2, "appendFormat:", @"}");
    return (NSString *)v2;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    unsigned int v5 = (Protocol *)[a1 protocol];
    if (v5) {
      Name = protocol_getName(v5);
    }
    else {
      Name = "(none set)";
    }
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface (%p) / %s",  a1,  Name);
  }

  else
  {
    if (objc_msgSend(a1, "isEqual:", objc_msgSend(MEMORY[0x189603FE8], "null"))) {
      return (NSString *)@"{None}";
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a1) {
        uint64_t v8 = a1[1];
      }
      else {
        uint64_t v8 = 0LL;
      }
      return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"XPC Type: %@", v8, v9);
    }

    else
    {
      return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  objc_opt_class(),  v9);
    }
  }

Protocol *__setProtocolMetadata_block_invoke()
{
  uint64_t result = objc_getProtocol("NSObject");
  qword_18C497320 = (uint64_t)result;
  return result;
}

void setProtocolMetdataWithMethods(Protocol *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = a4;
    while (1)
    {
      uint64_t v8 = (void *)MEMORY[0x186E1FF60]();
      uint64_t v9 = *(const char **)(a3 + 16 * v6);
      uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
      if (!MethodTypeEncoding)
      {
        Name = protocol_getName(a1);
        uint64_t v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Unable to get extended method signature from Protocol data (%s / %s). Use of clang is required for NSXPCInterface.",  Name,  sel_getName(v9));
        goto LABEL_31;
      }

      uint64_t v11 = [MEMORY[0x189603FA0] signatureWithObjCTypes:MethodTypeEncoding];
      if (!v11) {
        break;
      }
      unint64_t v12 = (void *)v11;
      if (*(void *)a2)
      {
        Superclass = class_getSuperclass(*(Class *)a2);
        if (Superclass)
        {
          if (!class_getInstanceMethod(Superclass, v9))
          {
            uint64_t v14 = [v12 _argInfo:-1];
            if ((*(_WORD *)(v14 + 34) & 0x80) != 0) {
              uint64_t v14 = *(void *)v14;
            }
            if (*(_BYTE *)(v14 + 36) == 118)
            {
              uint64_t v15 = [v12 numberOfArguments];
              if (v15 == 2)
              {
                uint64_t v16 = *(int *)(a2 + 8);
                int v17 = v16 + 1;
                *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v16 + 1;
                uint64_t v18 = (void *)(a2 + 8 * v16);
                v18[2] = v9;
                v18[130] = _NSXPCDistantObjectSimpleMessageSend0;
                uint64_t v19 = "v@:";
LABEL_13:
                v18[258] = v19;
                if (v17 == 128) {
                  setProtocolContextFlush(a2);
                }
              }

              else
              {
                uint64_t v20 = v15;
                if ((unint64_t)(v15 - 3) <= 3)
                {
                  uint64_t v21 = 2LL;
                  while ((*(_WORD *)([v12 _argInfo:v21] + 34) & 0x2000) != 0)
                  {
                    if (v20 == ++v21)
                    {
                      if (v20 == 5)
                      {
                        uint64_t v23 = *(int *)(a2 + 8);
                        int v17 = v23 + 1;
                        *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v23 + 1;
                        uint64_t v18 = (void *)(a2 + 8 * v23);
                        v18[2] = v9;
                        v18[130] = _NSXPCDistantObjectSimpleMessageSend3;
                        uint64_t v19 = "v@:@@@";
                      }

                      else if (v20 == 4)
                      {
                        uint64_t v24 = *(int *)(a2 + 8);
                        int v17 = v24 + 1;
                        *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v24 + 1;
                        uint64_t v18 = (void *)(a2 + 8 * v24);
                        v18[2] = v9;
                        v18[130] = _NSXPCDistantObjectSimpleMessageSend2;
                        uint64_t v19 = "v@:@@";
                      }

                      else
                      {
                        uint64_t v22 = *(int *)(a2 + 8);
                        int v17 = v22 + 1;
                        *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v22 + 1;
                        uint64_t v18 = (void *)(a2 + 8 * v22);
                        v18[2] = v9;
                        if (v20 == 3)
                        {
                          v18[130] = _NSXPCDistantObjectSimpleMessageSend1;
                          uint64_t v19 = "v@:@";
                        }

                        else
                        {
                          v18[130] = _NSXPCDistantObjectSimpleMessageSend4;
                          uint64_t v19 = "v@:@@@@";
                        }
                      }

                      goto LABEL_13;
                    }
                  }
                }
              }
            }
          }
        }
      }

      objc_autoreleasePoolPop(v8);
      if (++v6 == v7) {
        return;
      }
    }

    uint64_t v27 = protocol_getName(a1);
    uint64_t v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSXPCInterface: Unable to get method signature from Protocol data (%s / %s)",  v27,  sel_getName(v9));
LABEL_31:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v26 userInfo:0]);
    _selKeyCallbackCopyDescription();
  }

CFStringRef _selKeyCallbackCopyDescription(const char *a1)
{
  uint64_t v1 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  Name = sel_getName(a1);
  return CFStringCreateWithCString(v1, Name, 0x8000100u);
}

BOOL containsMethod(Protocol *a1, const char *a2, BOOL isRequiredMethod)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unsigned int outCount = 0;
  unint64_t v4 = protocol_copyMethodDescriptionList(a1, isRequiredMethod, 1, &outCount);
  if (!v4) {
    return 0LL;
  }
  if (outCount)
  {
    if (v4->name == a2)
    {
      BOOL v9 = 1LL;
    }

    else
    {
      unsigned int v5 = v4 + 1;
      uint64_t v6 = 1LL;
      do
      {
        unint64_t v7 = v6;
        if (outCount == v6) {
          break;
        }
        name = v5->name;
        ++v5;
        ++v6;
      }

      while (name != a2);
      BOOL v9 = v7 < outCount;
    }
  }

  else
  {
    BOOL v9 = 0LL;
  }

  free(v4);
  return v9;
}

id __setProtocolMetadataWithSignature_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x189604010];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  qword_18C497330 = (uint64_t)(id)objc_msgSend( v0,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  objc_opt_class(),  0);
  BOOL v9 = (void *)MEMORY[0x189604010];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id result = (id)objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  qword_18C497338 = (uint64_t)result;
  return result;
}

BOOL selectorInProtocol(SEL aSel, Protocol *p)
{
  SEL name = protocol_getMethodDescription(p, aSel, 1, 1).name;
  if (!name) {
    SEL name = protocol_getMethodDescription(p, aSel, 0, 1).name;
  }
  return name != 0LL;
}

CFMutableDictionaryRef _createTablesIfNeeded_locked(CFMutableDictionaryRef result)
{
  uint64_t v1 = result;
  if (!*((void *)result + 3))
  {
    id result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 1LL, 0LL, MEMORY[0x189605250]);
    v1[3] = result;
  }

  if (!v1[4])
  {
    id result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 1LL, 0LL, MEMORY[0x189605250]);
    v1[4] = result;
  }

  if (!v1[5])
  {
    id result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 1LL, 0LL, 0LL);
    v1[5] = result;
  }

  return result;
}

void sub_1836E9E38(void *a1)
{
}

void sub_1836E9E44(_Unwind_Exception *a1)
{
}

xpc_object_t _xpcRetainCallback(int a1, xpc_object_t object)
{
  return xpc_retain(object);
}

void _xpcReleaseCallback(int a1, xpc_object_t object)
{
}

uint64_t _NSXPCDistantObjectSimpleMessageSend0(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  [v3[1] _sendSelector:a2 withProxy:v3];

  return 0LL;
}

void sub_1836EA940(_Unwind_Exception *a1)
{
}

void sub_1836EA95C()
{
}

uint64_t _NSXPCDistantObjectSimpleMessageSend1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = v5;
  if (v5) {
    [v5[1] _sendSelector:a2 withProxy:v5 arg1:a3];
  }

  return 0LL;
}

void sub_1836EA9CC(void *a1)
{
}

void sub_1836EA9D8(_Unwind_Exception *a1)
{
}

uint64_t _NSXPCDistantObjectSimpleMessageSend2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1;
  uint64_t v8 = v7;
  if (v7) {
    [v7[1] _sendSelector:a2 withProxy:v7 arg1:a3 arg2:a4];
  }

  return 0LL;
}

void sub_1836EAA60(void *a1)
{
}

void sub_1836EAA6C(_Unwind_Exception *a1)
{
}

uint64_t _NSXPCDistantObjectSimpleMessageSend3(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v9 = a1;
  [v9[1] _sendSelector:a2 withProxy:v9 arg1:a3 arg2:a4 arg3:a5];

  return 0LL;
}

void sub_1836EAB00(_Unwind_Exception *a1)
{
}

void sub_1836EAB1C()
{
}

uint64_t _NSXPCDistantObjectSimpleMessageSend4( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = a1;
  [v11[1] _sendSelector:a2 withProxy:v11 arg1:a3 arg2:a4 arg3:a5 arg4:a6];

  return 0LL;
}

void sub_1836EABA8(_Unwind_Exception *a1)
{
}

void sub_1836EABC4()
{
}

uint64_t _NSProgressIPCDebugLog()
{
  if (qword_18C496230 != -1) {
    dispatch_once(&qword_18C496230, &__block_literal_global_90);
  }
  return _MergedGlobals_25_1;
}

void NSProgressTSDDestroy(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8)) {
      NSProgressTSDDestroy();
    }

    free((void *)a1);
  }

void sub_1836ED5E8(_Unwind_Exception *a1)
{
}

void *keysChangedForFractionCompletedValues(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8 < 0)
  {
    BOOL v10 = 1;
  }

  else
  {
    uint64_t v9 = *(void *)(a1 + 24);
    BOOL v10 = (v9 | v8) == 0;
    if (v9 < 0) {
      BOOL v10 = 1;
    }
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if ((a3 | a2) < 0)
  {
    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  if (((a3 | a2) == 0) != v10) {
LABEL_8:
  }
    [v6 addObject:@"indeterminate"];
LABEL_9:
  __int128 v24 = *(_OWORD *)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 24);
  if (v12 != a3 && v12 >= 1)
  {
    uint64_t v21 = *(void *)(a1 + 24);
    uint64_t v22 = a3;
    LOBYTE(v23) = 0;
    _NSProgressFractionMultiplyByFraction((uint64_t *)&v24, &v21);
  }

  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = v11;
  _NSProgressFractionAddFraction((uint64_t)&v21, (uint64_t *)&v24);
  [(id)a1 overallFraction];
  if ((_NSProgressFractionIsFractionCompletedEqual(&v21, v20) & 1) == 0) {
    [v7 addObject:@"fractionCompleted"];
  }
  if (*(void *)(a1 + 24) != a3) {
    [v7 addObject:@"totalUnitCount"];
  }
  uint64_t v13 = a2;
  if (*(void *)(a1 + 16) != a2)
  {
    [v7 addObject:@"completedUnitCount"];
    uint64_t v13 = *(void *)(a1 + 16);
  }

  uint64_t v14 = *(void *)(a1 + 24);
  if (v13 < 1 || v13 < v14 || v14 <= 0)
  {
    int v15 = v13 > 0 && v14 == 0;
    if (a2 < 1 || a2 < a3 || a3 <= 0)
    {
      int v19 = a2 > 0 && a3 == 0;
      if (v19 != v15) {
        goto LABEL_37;
      }
      return v7;
    }
  }

  else
  {
    LOBYTE(v15) = a2 >= a3;
    if (a3 <= 0) {
      LOBYTE(v15) = 0;
    }
    if (!a3) {
      LOBYTE(v15) = 1;
    }
    if (a2 < 1) {
      goto LABEL_37;
    }
  }

  if ((v15 & 1) == 0) {
LABEL_37:
  }
    [v7 addObject:@"finished"];
  return v7;
}

void sub_1836EDA7C(_Unwind_Exception *a1)
{
}

void sub_1836EDC90(_Unwind_Exception *a1)
{
}

void sub_1836EDEB8(_Unwind_Exception *a1)
{
}

void sub_1836EE100(_Unwind_Exception *a1)
{
}

void sub_1836F0478( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void __Block_byref_object_copy__34(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

uint64_t ___lockedLocalizedDescriptionForNotFile_block_invoke()
{
  qword_18C4962A0 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [(id)qword_18C4962A0 setFormatterBehavior:1040];
  [(id)qword_18C4962A0 setNumberStyle:3];
  [(id)qword_18C4962A0 setMaximumFractionDigits:0];
  [(id)qword_18C4962A0 setMinimumFractionDigits:0];
  objc_msgSend((id)qword_18C4962A0, "setLocale:", objc_msgSend(MEMORY[0x189603F90], "currentLocale"));
  return [(id)qword_18C4962A0 setRoundingMode:1];
}

uint64_t _lockedLocalizedTimeRemaining(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 8) objectForKey:@"NSProgressEstimatedTimeRemainingKey"];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = [*(id *)(a1 + 8) objectForKey:@"NSProgressLocalizedDescriptionTimeRemainingFormatterKey"];
  if (!v4 || (uint64_t v5 = (void *)v4, (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (qword_18C4962B0 != -1) {
      dispatch_once(&qword_18C4962B0, &__block_literal_global_687);
    }
    uint64_t v5 = (void *)qword_18C4962A8;
  }

  [v3 doubleValue];
  return objc_msgSend(v5, "stringFromTimeInterval:");
}

NSString *_localizedAppendedTimeRemaining(NSString *result)
{
  if (result) {
    return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  [(id)_NSFoundationBundle() localizedStringForKey:@" — %@" value:&stru_189CA6A28 table:@"Progress"],  result);
  }
  return result;
}

uint64_t ___lockedLocalizedTimeRemaining_block_invoke()
{
  qword_18C4962A8 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
  [(id)qword_18C4962A8 setUnitsStyle:3];
  [(id)qword_18C4962A8 setIncludesTimeRemainingPhrase:1];
  return [(id)qword_18C4962A8 setIncludesApproximationPhrase:1];
}

uint64_t ___lockedLocalizedAdditionalDescriptionForNotFile_block_invoke()
{
  qword_18C4962C0 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  [(id)qword_18C4962C0 setFormatterBehavior:1040];
  [(id)qword_18C4962C0 setNumberStyle:1];
  [(id)qword_18C4962C0 setUsesGroupingSeparator:1];
  return objc_msgSend((id)qword_18C4962C0, "setLocale:", objc_msgSend(MEMORY[0x189603F90], "currentLocale"));
}

void sub_1836F413C(_Unwind_Exception *a1)
{
}

void sub_1836F4174(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1836F417CLL);
  }
  JUMPOUT(0x1836F415CLL);
}

void sub_1836F41EC(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1836F41FCLL);
  }

  JUMPOUT(0x1836F415CLL);
}

void sub_1836F435C( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v9 = objc_begin_catch(exc_buf);
      BOOL v10 = (os_log_s *)_NSOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v9 description];
        LODWORD(va_start(va, a9) = 138412290;
        *(void *)((char *)&a9 + 4) = v11;
        _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "NSProgress Exception caught: %@",  (uint8_t *)&a9,  0xCu);
      }

      objc_end_catch();
      JUMPOUT(0x1836F430CLL);
    }

    objc_begin_catch(exc_buf);
    JUMPOUT(0x1836F4310LL);
  }

  _Unwind_Resume(exc_buf);
}

double _NSOrderedChangesInit(uint64_t a1, Class a2, uint64_t a3, uint64_t a4)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = [[a2 alloc] initWithObjects:a3 count:a4];
  *(int64x2_t *)(a1 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(void *)(a1 + 16) = 0LL;
  double result = NAN;
  *(_OWORD *)(a1 + 24) = xmmword_183979640;
  *(void *)(a1 + 56) = 0LL;
  return result;
}

void _NSOrderedChangesRelease(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 40); i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = *(void *)(v3 + 32))
  {
    uint64_t v3 = *(void *)(a1 + 16) + 40 * i;
  }

  uint64_t v4 = *(void **)(a1 + 16);
  if (v4) {
    free(v4);
  }
}

uint64_t _NSOrderedChangesCopy(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t result = [*(id *)a1 copy];
  *(void *)a2 = result;
  *(_BYTE *)(a2 + _Block_object_dispose(va, 8) = 0;
  *(int64x2_t *)(a2 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(void *)(a2 + 16) = 0LL;
  *(_OWORD *)(a2 + 24) = xmmword_183979640;
  *(void *)(a2 + 56) = 0LL;
  char v12 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  id v9 = ___NSOrderedChangesCopy_block_invoke;
  BOOL v10 = &__block_descriptor_40_e21_v48__0Q8Q16Q24_32_B40l;
  uint64_t v11 = a2;
  if (*(void *)(a1 + 56))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = 0LL;
      do
      {
        if (v6 > *(void *)(a1 + 56)) {
          -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void __NSOrderedChangeListEnumerate(NSOrderedChangeList *, BOOL *, _NSOrderedChangeEnumerator)"),  @"NSOrderedChanges.m",  257LL,  @"overstepped bounds of enumeration");
        }
        uint64_t v7 = *(void *)(a1 + 16);
        uint64_t result = ((uint64_t (*)(void *, void, void, void, void, char *))v9)( v8,  *(void *)(v7 + 40 * v5),  *(void *)(v7 + 40 * v5 + 8),  *(void *)(v7 + 40 * v5 + 16),  *(void *)(v7 + 40 * v5 + 24),  &v12);
        if (v12) {
          break;
        }
        ++v6;
        uint64_t v5 = *(void *)(v7 + 40 * v5 + 32);
      }

      while (v5 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }

  return result;
}

uint64_t _NSOrderedChangesEnumerateChanges(uint64_t result, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  BOOL v10 = ___NSOrderedChangesEnumerateChanges_block_invoke;
  uint64_t v11 = &unk_189CA67A8;
  uint64_t v12 = a4;
  uint64_t v13 = a2;
  if (*(void *)(result + 56))
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(result + 40);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v7 = 0LL;
      do
      {
        if (v7 > *(void *)(v4 + 56)) {
          -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void __NSOrderedChangeListEnumerate(NSOrderedChangeList *, BOOL *, _NSOrderedChangeEnumerator)"),  @"NSOrderedChanges.m",  257LL,  @"overstepped bounds of enumeration");
        }
        uint64_t v8 = *(void *)(v4 + 16);
        uint64_t result = ((uint64_t (*)(void *, void, void, void, void, _BYTE *))v10)( v9,  *(void *)(v8 + 40 * v5),  *(void *)(v8 + 40 * v5 + 8),  *(void *)(v8 + 40 * v5 + 16),  *(void *)(v8 + 40 * v5 + 24),  a3);
        if (*a3) {
          break;
        }
        ++v7;
        uint64_t v5 = *(void *)(v8 + 40 * v5 + 32);
      }

      while (v5 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }

  return result;
}

id _NSOrderedChangesAddChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!*(_BYTE *)(a1 + 8))
  {
    uint64_t v10 = [*(id *)a1 mutableCopy];

    *(void *)a1 = v10;
    *(_BYTE *)(a1 + _Block_object_dispose(va, 8) = 1;
  }

  switch(a2)
  {
    case 2LL:
      [*(id *)a1 insertObject:a5 atIndex:a4];
      break;
    case 3LL:
      [*(id *)a1 removeObjectAtIndex:a4];
      break;
    case 4LL:
      [*(id *)a1 replaceObjectAtIndex:a4 withObject:a5];
      break;
    case 5LL:
      objc_msgSend( *(id *)a1,  "moveObjectsAtIndexes:toIndex:",  +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a3),  a4);
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_27;
      }
      break;
    default:
      goto LABEL_8;
  }

  while (1)
  {
LABEL_8:
    size_t v11 = *(void *)(a1 + 24);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = *(void *)(a1 + 16);
      goto LABEL_20;
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      size_t v13 = malloc_good_size(40 * v12 + 40) / 0x28;
      if (v13 <= *(void *)(a1 + 32)) {
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void __NSOrderedChangeListGrowIfNeeded(NSOrderedChangeList *)"),  @"NSOrderedChanges.m",  154LL,  @"capacity should be larger than previously requested");
      }
    }

    else
    {
      size_t v13 = 32LL;
    }

    if (!*(void *)(a1 + 16)) {
      break;
    }
    uint64_t v14 = __CFSafelyReallocate();
    if (v14) {
      goto LABEL_16;
    }
LABEL_26:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"Unable to allocate underlying buffer for change list" userInfo:0]);
LABEL_27:
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void __NSOrderedChangeListAppend(NSOrderedChanges *, NSKeyValueChange, NSUInteger, NSUInteger, id)"),  @"NSOrderedChanges.m",  187LL,  @"move sources not found");
  }

  uint64_t v14 = (uint64_t)malloc(40 * v13);
  if (!v14) {
    goto LABEL_26;
  }
LABEL_16:
  size_t v15 = *(void *)(a1 + 32);
  if (v15 < v13)
  {
    uint64_t v16 = (uint64_t *)(v14 + 40 * v15 + 32);
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      *(v16 - 1) = 0LL;
      *uint64_t v16 = v17;
      uint64_t v17 = v15++;
      v16 += 5;
    }

    while (v13 != v15);
  }

  size_t v11 = v13 - 1;
  *(void *)(a1 + 16) = v14;
  *(void *)(a1 + 24) = v13 - 1;
  *(void *)(a1 + 32) = v13;
LABEL_20:
  uint64_t v18 = (void *)(v14 + 40 * v11);
  v18[1] = a3;
  v18[2] = a4;
  id result = a5;
  *uint64_t v18 = a2;
  v18[3] = result;
  v18[4] = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  if (*(void *)(a1 + 40) == 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(a1 + 40) = v11;
  }
  uint64_t v20 = *(void *)(a1 + 48);
  if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(a1 + 16) + 40 * v20 + 32) = v11;
  }
  uint64_t v21 = *(void *)(a1 + 56) + 1LL;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v11;
  *(void *)(a1 + 56) = v21;
  return result;
}

void _NSOrderedChangesSort(id *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3 >= 2)
  {
    unint64_t v6 = v16;
    bzero(v16, 0x800uLL);
    if (2 * a3 >= 0x101) {
      unint64_t v6 = malloc(16 * a3);
    }
    CFSortIndexes();
    uint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = *(void *)&v6[8 * v7];
      if (v8 == v7)
      {
        uint64_t v9 = v7 + 1;
      }

      else
      {
        unint64_t v10 = v8 + a2;
        unint64_t v11 = v7 + a2;
        _NSOrderedChangesAddChange( (uint64_t)a1,  5,  v8 + a2,  v7 + a2,  (void *)[*a1 objectAtIndex:v8 + a2]);
        uint64_t v9 = v7 + 1;
        if (v7 + 1 < a3)
        {
          uint64_t v12 = a3 - 1 - v7;
          size_t v13 = (unint64_t *)&v6[8 * v7 + 8];
          do
          {
            unint64_t v14 = *v13 - (*v13 >= v10);
            if (*v13 >= v10 || v14 >= v11)
            {
              if (v14 >= v11) {
                ++v14;
              }
              *size_t v13 = v14;
            }

            ++v13;
            --v12;
          }

          while (v12);
        }
      }

      uint64_t v7 = v9;
    }

    while (v9 != a3);
    if (v6 != v16) {
      free(v6);
    }
  }

void _NSXPCSerializationStartDictionaryWrite(void *a1)
{
  if ((uint64_t)a1[1024] >= 1024)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Data structure has too many nested collections to encode" userInfo:0]);
    _NSXPCSerializationAddUnsignedInteger();
  }

  else
  {
    _reserveSpace((uint64_t)a1, 1LL);
    *(_BYTE *)(a1[1027] + a1[1025]) = -48;
    uint64_t v2 = a1[1025] + 1LL;
    a1[1025] = v2;
    uint64_t v3 = a1[1024];
    a1[1024] = v3 + 1;
    a1[v3] = v2;
    _appendZeroedBytes((uint64_t)a1);
  }

void _NSXPCSerializationAddUnsignedInteger(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = -8;
  _reserveSpace(a1, 8LL);
  *(void *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)) = a2;
  *(void *)(a1 + 8200) += 8LL;
}

void _NSXPCSerializationAddObjectRef(uint64_t a1, void *key)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(__CFDictionary **)(a1 + 8224);
  if (!v4)
  {
    keyCallBacks.version = 0LL;
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x189605250] + 8LL);
    memset(&keyCallBacks.copyDescription, 0, 24);
    uint64_t v4 = CFDictionaryCreateMutable(0LL, 0LL, &keyCallBacks, 0LL);
    *(void *)(a1 + 8224) = v4;
  }

  CFDictionaryAddValue(v4, key, *(const void **)(a1 + 8200));
}

void _NSXPCSerializationAddString(uint64_t a1, CFStringRef theString, int a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength(theString);
  if (Length >= 1)
  {
    Mutable = *(const __CFDictionary **)(a1 + 8232);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], 0LL);
      *(void *)(a1 + 8232) = Mutable;
    }

    Value = CFDictionaryGetValue(Mutable, theString);
    if (Value)
    {
      _NSXPCSerializationAddReference(a1, (unint64_t)Value);
      return;
    }

    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 8232), theString, *(const void **)(a1 + 8200));
  }

  if (a3 && (v11[0] = 0LL, (uint64_t v9 = (char *)_stringIsASCII(theString, v11)) != 0LL))
  {
    _NSXPCSerializationAddASCIIString(a1, v9, v11[0], 0);
  }

  else
  {
    _reserveSpace(a1, 1LL);
    char v10 = 15;
    if (Length < 15) {
      char v10 = Length;
    }
    *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = v10 | 0x60;
    if (Length >= 15) {
      _NSXPCSerializationAddInteger(a1, Length);
    }
    _reserveSpace(a1, 2 * Length);
    v12.location = 0LL;
    v12.length = Length;
    CFStringGetCharacters(theString, v12, (UniChar *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)));
    *(void *)(a1 + 8200) += 2 * Length;
  }

void *_NSXPCSerializationAddReference(uint64_t a1, unint64_t a2)
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = a2;
  if (HIDWORD(a2)) {
    int v3 = 8;
  }
  else {
    int v3 = 4;
  }
  if (a2 >= 0x10000) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 2;
  }
  if (a2 >= 0x100) {
    size_t v5 = v4;
  }
  else {
    size_t v5 = 1LL;
  }
  _reserveSpace(a1, 1LL);
  *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = v5 | 0x80;
  _reserveSpace(a1, v5);
  id result = memmove((void *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)), v7, v5);
  *(void *)(a1 + 8200) += v5;
  return result;
}

void *_NSXPCSerializationAddData(uint64_t a1, CFDataRef theData)
{
  CFIndex Length = CFDataGetLength(theData);
  unint64_t v5 = Length;
  if (Length < 15)
  {
    char v6 = Length | 0x40;
    _reserveSpace(a1, 1LL);
    *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = v6;
  }

  else
  {
    _reserveSpace(a1, 1LL);
    *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = 79;
    _NSXPCSerializationAddInteger(a1, v5);
  }

  BytePtr = CFDataGetBytePtr(theData);
  CFIndex v8 = CFDataGetLength(theData);
  _reserveSpace(a1, v8);
  id result = memmove((void *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)), BytePtr, v8);
  *(void *)(a1 + 8200) += v8;
  return result;
}

void *_NSXPCSerializationAddRawData(uint64_t a1, const void *a2, unint64_t a3)
{
  if (a3 < 0xF)
  {
    char v6 = a3 | 0x40;
    _reserveSpace(a1, 1LL);
    *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = v6;
  }

  else
  {
    _reserveSpace(a1, 1LL);
    *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = 79;
    _NSXPCSerializationAddInteger(a1, a3);
  }

  _reserveSpace(a1, a3);
  id result = memmove((void *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)), a2, a3);
  *(void *)(a1 + 8200) += a3;
  return result;
}

void _NSXPCSerializationAddFloat(uint64_t a1, float a2)
{
  *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = 34;
  _reserveSpace(a1, 4LL);
  *(float *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)) = a2;
  *(void *)(a1 + 8200) += 4LL;
}

void _NSXPCSerializationAddDouble(uint64_t a1, double a2)
{
  *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = 35;
  _reserveSpace(a1, 8LL);
  *(double *)(*(void *)(a1 + 8216) + *(void *)(a1 + 8200)) = a2;
  *(void *)(a1 + 8200) += 8LL;
}

void _NSXPCSerializationAddBool(uint64_t a1, int a2)
{
  if (a2) {
    char v4 = -80;
  }
  else {
    char v4 = -64;
  }
  *(_BYTE *)(*(void *)(a1 + 8216) + (*(void *)(a1 + 8200))++) = v4;
}

void _NSXPCSerializationAddNumber(uint64_t a1, CFNumberRef number)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ((CFNumberRef)*MEMORY[0x189604DE8] == number)
  {
    int v4 = 1;
LABEL_8:
    _NSXPCSerializationAddBool(a1, v4);
    return;
  }

  if ((CFNumberRef)*MEMORY[0x189604DE0] == number)
  {
    int v4 = 0;
    goto LABEL_8;
  }

  if (CFNumberIsFloatType(number))
  {
    if (CFNumberGetByteSize(number) > 4)
    {
      CFNumberGetValue(number, kCFNumberFloat64Type, &valuePtr);
      _NSXPCSerializationAddDouble(a1, valuePtr);
    }

    else
    {
      CFNumberGetValue(number, kCFNumberFloat32Type, &valuePtr);
      _NSXPCSerializationAddFloat(a1, *(float *)&valuePtr);
    }
  }

  else if (_CFNumberGetType2() == 17)
  {
    double valuePtr = 0.0;
    uint64_t v6 = 0LL;
    CFNumberGetValue(number, kCFNumberMaxType|kCFNumberSInt8Type, &valuePtr);
    _NSXPCSerializationAddUnsignedInteger(a1, v6);
  }

  else
  {
    double valuePtr = 0.0;
    CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
    _NSXPCSerializationAddInteger(a1, *(unint64_t *)&valuePtr);
  }

uint64_t _NSXPCSerializationTypeForReference(void *a1, unint64_t a2)
{
  v8[1] = *MEMORY[0x1895F89C0];
  int v4 = *(_BYTE *)(*a1 + a2) & 0xF0;
  if ((*(_BYTE *)(*a1 + a2) & 0xB0) == 0x80 || v4 == 176 || v4 == 224) {
    return 0LL;
  }
  else {
    return *(_BYTE *)(*a1 + a2) & 0xF0;
  }
}

unint64_t _NSXPCSerializationReferenceForObject(uint64_t *a1, unint64_t *a2)
{
  v4[1] = *MEMORY[0x1895F89C0];
  if (!*a2) {
    return 0LL;
  }
  if (_getReferenceAtMarker(a1, &v3, *a2, v4)) {
    return v3;
  }
  return 0LL;
}

id _NSXPCSerializationDataForObject(void *a1, unint64_t *a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = *a2;
  if (!*a2) {
    return 0LL;
  }
  unint64_t v4 = a1[1];
  if (v4 <= v2) {
    return 0LL;
  }
  char v5 = *(_BYTE *)(*a1 + v2);
  if ((v5 & 0xF0) != 0x40) {
    return 0LL;
  }
  uint64_t v6 = v5 & 0xF;
  uint64_t v14 = v6;
  if ((v5 & 0xF) != 0)
  {
    unint64_t v7 = v2 + 1;
    v15[0] = v2 + 1;
    if (v2 + 1 < v4)
    {
      if ((_DWORD)v6 != 15
        || _getIntAtMarker(a1, &v14, v2 + 1, v15)
        && (unint64_t v7 = v15[0] + 1, v8 = v15[0] == -1LL, v9 = v8 << 63 >> 63, v9 == v8)
        && (v9 & 0x8000000000000000LL) == 0
        && (unint64_t v4 = a1[1], v4 > v7)
        && (uint64_t v6 = v14, (v14 & 0x8000000000000000LL) == 0))
      {
        uint64_t v10 = (v6 - 1) >> 63;
        if (__CFADD__(v7, v6 - 1)) {
          ++v10;
        }
        uint64_t v11 = v10 << 63 >> 63;
        BOOL v12 = v11 != v10;
        if (v4 > v7 + v6 - 1 && !v12 && (v11 & 0x8000000000000000LL) == 0) {
          return (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:*a1 + v7 length:v6];
        }
      }
    }

    return 0LL;
  }

  return (id)[MEMORY[0x189603F48] data];
}

uint64_t _getFloatAtMarker(void *a1, _DWORD *a2, unint64_t a3, void *a4)
{
  if (a1[1] <= a3 || *(_BYTE *)(*a1 + a3) != 34) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = a3 >= 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v6 = v5 << 63 >> 63;
  *a4 = a3 + 4;
  if (v6 == v5 && (v6 & 0x8000000000000000LL) == 0)
  {
    if (a1[1] > a3 + 4)
    {
      *a2 = *(_DWORD *)(a3 + *a1 + 1);
      return 1LL;
    }

    return 0LL;
  }

  return v4;
}

uint64_t _getDoubleAtMarker(void *a1, void *a2, unint64_t a3, void *a4)
{
  if (a1[1] <= a3 || *(_BYTE *)(*a1 + a3) != 35) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = a3 >= 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v6 = v5 << 63 >> 63;
  *a4 = a3 + 8;
  if (v6 == v5 && (v6 & 0x8000000000000000LL) == 0)
  {
    if (a1[1] > a3 + 8)
    {
      *a2 = *(void *)(a3 + *a1 + 1);
      return 1LL;
    }

    return 0LL;
  }

  return v4;
}

BOOL _NSXPCSerializationCreateObjectInDictionaryForGenericKey( uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  v7[0] = 0LL;
  v7[1] = v7;
  void v7[2] = 0x2020000000LL;
  v7[3] = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___NSXPCSerializationCreateObjectInDictionaryForGenericKey_block_invoke;
  v6[3] = &unk_189CA6870;
  v6[4] = v7;
  v6[5] = &v8;
  v6[6] = a3;
  v6[7] = a4;
  else {
    BOOL v4 = 0LL;
  }
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_1836F6210( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

uint64_t _NSXPCSerializationDebugInfoForReadData(uint64_t *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 8LL;
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  int v7 = *(_BYTE *)(*a1 + 8) & 0xF0;
  BOOL v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%.8s %llu bytes (-%llu bytes)\n",  v2,  v3,  _NSXPCSerializationDebugSizeForObject(a1, (uint64_t)&v6) - a1[1] + 8);
  return (uint64_t)-[NSString stringByAppendingString:]( v4,  "stringByAppendingString:",  _NSXPCSerializationDebugInfoForObject(a1, (char **)&v6, 2LL, 2LL));
}

uint64_t _NSXPCSerializationDebugSizeForObject(uint64_t *a1, uint64_t a2)
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t v2 = *(void *)a2;
  int v5 = *(_DWORD *)(a2 + 8);
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  v14[0] = 0LL;
  switch(v5)
  {
    case 208:
      v14[0] = 9LL;
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      void v9[2] = ___NSXPCSerializationDebugSizeForObject_block_invoke_2;
      v9[3] = &unk_189CA68E0;
      v9[4] = &v11;
      v9[5] = a1;
      _iterateDictionaryKeysAndValues(a1, (void *)a2, (uint64_t)v9);
      break;
    case 160:
      v14[0] = 9LL;
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = ___NSXPCSerializationDebugSizeForObject_block_invoke;
      v10[3] = &unk_189CA68B8;
      v10[4] = &v11;
      void v10[5] = a1;
      _NSXPCSerializationIterateArrayObject(a1, (void *)a2, (uint64_t)v10);
      break;
    case 128:
      if (_getReferenceAtMarker(a1, (unint64_t *)a2, v2, v14))
      {
        *(_DWORD *)(a2 + _Block_object_dispose((const void *)(v10 - 56), 8) = *(_BYTE *)(*a1 + *(void *)a2) & 0xF0;
        uint64_t v6 = _NSXPCSerializationDebugSizeForObject(a1);
        v12[3] = v6;
      }

      break;
    default:
      break;
  }

  uint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void sub_1836F6528(_Unwind_Exception *a1)
{
}

NSString *_NSXPCSerializationDebugInfoForObject(uint64_t *a1, char **a2, uint64_t a3, uint64_t a4)
{
  v22[1] = *MEMORY[0x1895F89C0];
  int v5 = *a2;
  if ((unint64_t)*a2 < a1[1])
  {
    HIDWORD(v7) = *((_DWORD *)a2 + 2);
    LODWORD(v7) = HIDWORD(v7) - 16;
    switch((v7 >> 4))
    {
      case 0u:
      case 1u:
      case 0xEu:
        uint64_t v10 = _NSXPCSerializationNumberForObject(a1, (unint64_t *)a2);
        unint64_t v11 = (unint64_t)*a2;
        if (v10) {
          return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"(@%lld) %@",  v11,  [v10 debugDescription]);
        }
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<bad number @%lld>",  v11,  v17);
      case 3u:
        uint64_t v10 = _NSXPCSerializationDataForObject(a1, (unint64_t *)a2);
        unint64_t v11 = (unint64_t)*a2;
        if (v10) {
          return +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"(@%lld) %@",  v11,  [v10 debugDescription]);
        }
        else {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<bad data @%lld>",  v11,  v17);
        }
      case 5u:
        v20[0] = 0LL;
        if (_getStringAtMarker(a1, v20, v5, v22) && v20[0]) {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(@%lld) %@",  *a2,  v20[0]);
        }
        else {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<bad string @%lld>",  *a2);
        }
      case 6u:
        v20[0] = 0LL;
        if (_getASCIIStringAtMarker(a1, v20, (unint64_t)v5, &v21, v22)) {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(@%lld) %s",  *a2,  v20[0]);
        }
        else {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<bad ASCII string @%lld>",  *a2,  v17);
        }
      case 7u:
        v20[0] = 0LL;
        if (_getReferenceAtMarker(a1, (unint64_t *)v20, (unint64_t)v5, v22) && v20[0]) {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(@%lld) ref #%lld",  *a2,  v20[0]);
        }
        else {
          return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<bad reference @%lld>",  *a2,  v17);
        }
      case 9u:
        uint64_t v13 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
        -[NSString appendFormat:](v13, "appendFormat:", @"(@%lld) [\n", *a2);
        v20[0] = 0LL;
        v20[1] = (const __CFString *)v20;
        v20[2] = (const __CFString *)0x2020000000LL;
        uint64_t v20[3] = 0LL;
        v19[0] = MEMORY[0x1895F87A8];
        v19[1] = 3221225472LL;
        void v19[2] = ___NSXPCSerializationDebugInfoForObject_block_invoke;
        v19[3] = &unk_189CA6908;
        v19[4] = v13;
        v19[5] = v20;
        v19[6] = a3;
        v19[7] = a1;
        v19[8] = a4;
        _NSXPCSerializationIterateArrayObject(a1, a2, (uint64_t)v19);
        uint64_t v16 = a3 - a4;
        if (a3 != a4)
        {
          do
          {
            -[NSString appendString:](v13, "appendString:", @" ");
            --v16;
          }

          while (v16);
        }

        -[NSString appendString:](v13, "appendString:", @"]");
        _Block_object_dispose(v20, 8);
        return v13;
      case 0xAu:
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(@%lld) YES",  *a2,  v17);
      case 0xBu:
        return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(@%lld) NO", *a2, v17);
      case 0xCu:
        uint64_t v13 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
        -[NSString appendFormat:](v13, "appendFormat:", @"(@%lld) {\n", *a2);
        v18[0] = MEMORY[0x1895F87A8];
        v18[1] = 3221225472LL;
        v18[2] = ___NSXPCSerializationDebugInfoForObject_block_invoke_2;
        v18[3] = &unk_189CA6930;
        v18[4] = v13;
        v18[5] = a3;
        v18[6] = a1;
        v18[7] = a4;
        _iterateDictionaryKeysAndValues(a1, a2, (uint64_t)v18);
        uint64_t v15 = a3 - a4;
        if (a3 != a4)
        {
          do
          {
            -[NSString appendString:](v13, "appendString:", @" ");
            --v15;
          }

          while (v15);
        }

        -[NSString appendString:](v13, "appendString:", @"}");
        return v13;
      case 0xDu:
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(@%lld) <null>",  *a2,  v17);
      default:
        return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<invalid object @%lld>",  *a2,  v17);
    }
  }

  return (NSString *)&stru_189CA6A28;
}

void sub_1836F6948(_Unwind_Exception *a1)
{
}

uint64_t ___reserveSpace_block_invoke()
{
  return ___NSXPCSerializationDebugSizeForObject_block_invoke(v0);
}

void sub_1836F714C(_Unwind_Exception *a1)
{
}

void _NSSetupDispatchDataBridge()
{
  if (_NSSetupDispatchDataBridge_onceToken != -1) {
    dispatch_once(&_NSSetupDispatchDataBridge_onceToken, &__block_literal_global_93);
  }
}

void NSUnimplemented_(uint64_t a1)
{
  qword_18C5D6210 = a1;
  __break(1u);
}

void NSRequestConcreteImplementation(uint64_t a1, const char *a2, objc_class *a3)
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  if ((objc_class *)v5 == a3)
  {
    unint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -%s cannot be sent to an abstract object of class %s: Create a concrete instance!",  Name,  class_getName(a3),  v12);
  }

  else
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = _NSNameOfClass(v8);
    unint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** -%s only defined for abstract class.  Define -[%s %s]!",  Name,  v9,  sel_getName(a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v7 userInfo:0]);
  _NSRequestConcreteObject(v10, v11);
}

void _NSRequestConcreteObject(int a1, SEL sel)
{
  Name = sel_getName(sel);
  uint64_t v3 = (objc_class *)objc_opt_class();
  BOOL v4 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"*** initialization method -%s cannot be sent to an abstract object of class %s: Create a concrete instance!", Name, _NSNameOfClass(v3)), 0 reason userInfo];
  objc_exception_throw(v4);
  Selector.init(_:)();
}

uint64_t Selector.init(_:)()
{
  return MEMORY[0x18961BAD8]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x18961B560]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x18961B568]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x18961B580]();
}

uint64_t TypeMetadata.descriptor.getter()
{
  return MEMORY[0x1896125B0]();
}

uint64_t TypeMetadata._resolve(_:)()
{
  return MEMORY[0x1896125C0]();
}

uint64_t TupleMetadata.Elements.Element.metadata.getter()
{
  return MEMORY[0x1896125E0]();
}

uint64_t TupleMetadata.Elements.endIndex.getter()
{
  return MEMORY[0x1896125E8]();
}

uint64_t TupleMetadata.Elements.subscript.getter()
{
  return MEMORY[0x1896125F0]();
}

uint64_t TupleMetadata.init(_:)()
{
  return MEMORY[0x1896125F8]();
}

uint64_t FieldDescriptor.subscript.getter()
{
  return MEMORY[0x189612638]();
}

uint64_t MangledTypeReference.standardSubstitution.getter()
{
  return MEMORY[0x1896126B0]();
}

uint64_t static Metadata.Kind.tuple.getter()
{
  return MEMORY[0x1896126E0]();
}

uint64_t type metadata accessor for AnyRegexOutput()
{
  return MEMORY[0x18961CE40]();
}

uint64_t dispatch thunk of RegexComponent.regex.getter()
{
  return MEMORY[0x18961CE50]();
}

uint64_t static RegexWordBoundaryKind.simple.getter()
{
  return MEMORY[0x18961CE60]();
}

uint64_t type metadata accessor for RegexWordBoundaryKind()
{
  return MEMORY[0x18961CE68]();
}

uint64_t CustomConsumingRegexComponent.regex.getter()
{
  return MEMORY[0x18961CE70]();
}

uint64_t Regex.ignoresCase(_:)()
{
  return MEMORY[0x18961CE78]();
}

uint64_t Regex._literalPattern.getter()
{
  return MEMORY[0x18961CE80]();
}

uint64_t Regex.wordBoundaryKind(_:)()
{
  return MEMORY[0x18961CE88]();
}

uint64_t Regex.Match.range.getter()
{
  return MEMORY[0x18961CE90]();
}

uint64_t Regex<A>.init<A>(_:)()
{
  return MEMORY[0x18961CEB0]();
}

uint64_t Regex<A>.init(_:)()
{
  return MEMORY[0x18961CEB8]();
}

uint64_t type metadata accessor for Regex()
{
  return MEMORY[0x18961CEC0]();
}

uint64_t PartialType.create2(with:)()
{
  return MEMORY[0x189611DE8]();
}

uint64_t GenericArguments2.subscript.getter()
{
  return MEMORY[0x189611E10]();
}

uint64_t Type.genericArguments.getter()
{
  return MEMORY[0x189611E30]();
}

uint64_t Type.genericArguments2.getter()
{
  return MEMORY[0x189611E38]();
}

uint64_t _HashTable.UnsafeHandle._startIterator(bucket:)()
{
  return MEMORY[0x18960D700]();
}

uint64_t _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)()
{
  return MEMORY[0x18960D708]();
}

uint64_t _HashTable.UnsafeHandle.subscript.setter()
{
  return MEMORY[0x18960D710]();
}

uint64_t _HashTable.BucketIterator.currentValue.getter()
{
  return MEMORY[0x18960D718]();
}

uint64_t _HashTable.BucketIterator.currentValue.setter()
{
  return MEMORY[0x18960D720]();
}

Swift::Void __swiftcall _HashTable.BucketIterator.advance()()
{
}

uint64_t static _HashTable.maximumCapacity(forScale:)()
{
  return MEMORY[0x18960D730]();
}

uint64_t static _HashTable.minimumCapacity(forScale:)()
{
  return MEMORY[0x18960D738]();
}

uint64_t _HashTable.copy()()
{
  return MEMORY[0x18960D740]();
}

uint64_t static _HashTable.scale(forCapacity:)()
{
  return MEMORY[0x18960D748]();
}

uint64_t _HashTable.init(scale:reservedScale:)()
{
  return MEMORY[0x18960D750]();
}

uint64_t BigSubstring.isIdentical(to:)()
{
  return MEMORY[0x18960D758]();
}

uint64_t BigSubstring.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x18960D760]();
}

uint64_t BigSubstring.UnicodeScalarView.isIdentical(to:)()
{
  return MEMORY[0x18960D768]();
}

uint64_t BigSubstring.UnicodeScalarView.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x18960D770]();
}

uint64_t BigSubstring.UnicodeScalarView.base.getter()
{
  return MEMORY[0x18960D778]();
}

uint64_t BigSubstring.UnicodeScalarView.index(after:)()
{
  return MEMORY[0x18960D780]();
}

uint64_t BigSubstring.UnicodeScalarView.index(before:)()
{
  return MEMORY[0x18960D788]();
}

uint64_t BigSubstring.UnicodeScalarView.distance(from:to:)()
{
  return MEMORY[0x18960D790]();
}

uint64_t BigSubstring.UnicodeScalarView.subscript.getter()
{
  return MEMORY[0x18960D7A8]();
}

{
  return MEMORY[0x18960D7B0]();
}

uint64_t static BigSubstring.== infix(_:_:)()
{
  return MEMORY[0x18960D7B8]();
}

uint64_t BigSubstring.base.getter()
{
  return MEMORY[0x18960D7C0]();
}

uint64_t BigSubstring.hash(into:)()
{
  return MEMORY[0x18960D7C8]();
}

uint64_t BigSubstring.UTF8View.index(after:)()
{
  return MEMORY[0x18960D7D0]();
}

uint64_t BigSubstring.UTF8View.index(before:)()
{
  return MEMORY[0x18960D7D8]();
}

uint64_t BigSubstring.UTF8View.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x18960D7E0]();
}

uint64_t BigSubstring.UTF8View.subscript.getter()
{
  return MEMORY[0x18960D7E8]();
}

uint64_t BigSubstring.distance(from:to:)()
{
  return MEMORY[0x18960D7F0]();
}

uint64_t BigSubstring.subscript.getter()
{
  return MEMORY[0x18960D808]();
}

uint64_t BigString.startIndex.getter()
{
  return MEMORY[0x18960D848]();
}

uint64_t BigString.init(stringLiteral:)()
{
  return MEMORY[0x18960D850]();
}

uint64_t BigString.unicodeScalars.modify()
{
  return MEMORY[0x18960D858]();
}

uint64_t BigString.unicodeScalars.getter()
{
  return MEMORY[0x18960D860]();
}

uint64_t BigString.UnicodeScalarView.replaceSubrange(_:with:)()
{
  return MEMORY[0x18960D868]();
}

uint64_t BigString.UnicodeScalarView.index(roundingUp:)()
{
  return MEMORY[0x18960D870]();
}

uint64_t BigString.UnicodeScalarView.index(roundingDown:)()
{
  return MEMORY[0x18960D878]();
}

uint64_t BigString.UnicodeScalarView.index(after:)()
{
  return MEMORY[0x18960D880]();
}

uint64_t BigString.UnicodeScalarView.index(before:)()
{
  return MEMORY[0x18960D888]();
}

uint64_t BigString.UnicodeScalarView.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x18960D890]();
}

uint64_t BigString.UnicodeScalarView.index(_:offsetBy:)()
{
  return MEMORY[0x18960D898]();
}

uint64_t BigString.UnicodeScalarView.distance(from:to:)()
{
  return MEMORY[0x18960D8A0]();
}

uint64_t BigString.UnicodeScalarView.subscript.getter()
{
  return MEMORY[0x18960D8A8]();
}

{
  return MEMORY[0x18960D8B0]();
}

uint64_t BigString.utf8.getter()
{
  return MEMORY[0x18960D8B8]();
}

uint64_t BigString.Index.init(_utf8Offset:utf16TrailingSurrogate:)()
{
  return MEMORY[0x18960D8C0]();
}

uint64_t BigString.Index.init(_utf8Offset:)()
{
  return MEMORY[0x18960D8C8]();
}

uint64_t BigString.index(roundingDown:)()
{
  return MEMORY[0x18960D8D8]();
}

uint64_t BigString.index(after:)()
{
  return MEMORY[0x18960D8E0]();
}

uint64_t BigString.index(before:)()
{
  return MEMORY[0x18960D8E8]();
}

uint64_t BigString.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x18960D8F0]();
}

uint64_t BigString.index(_:offsetBy:)()
{
  return MEMORY[0x18960D8F8]();
}

uint64_t BigString.utf16.getter()
{
  return MEMORY[0x18960D900]();
}

uint64_t BigString.append(contentsOf:)()
{
  return MEMORY[0x18960D908]();
}

uint64_t BigString.isEmpty.getter()
{
  return MEMORY[0x18960D910]();
}

uint64_t BigString.UTF8View.startIndex.getter()
{
  return MEMORY[0x18960D918]();
}

uint64_t BigString.UTF8View.count.getter()
{
  return MEMORY[0x18960D920]();
}

uint64_t BigString.UTF8View.index(roundingDown:)()
{
  return MEMORY[0x18960D928]();
}

uint64_t BigString.UTF8View.index(after:)()
{
  return MEMORY[0x18960D930]();
}

uint64_t BigString.UTF8View.index(before:)()
{
  return MEMORY[0x18960D938]();
}

uint64_t BigString.UTF8View.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x18960D940]();
}

uint64_t BigString.UTF8View.index(_:offsetBy:)()
{
  return MEMORY[0x18960D948]();
}

uint64_t BigString.UTF8View.endIndex.getter()
{
  return MEMORY[0x18960D950]();
}

uint64_t BigString.UTF8View.subscript.getter()
{
  return MEMORY[0x18960D958]();
}

{
  return MEMORY[0x18960D960]();
}

uint64_t BigString.endIndex.getter()
{
  return MEMORY[0x18960D968]();
}

uint64_t BigString.UTF16View.startIndex.getter()
{
  return MEMORY[0x18960D970]();
}

uint64_t BigString.UTF16View.count.getter()
{
  return MEMORY[0x18960D978]();
}

uint64_t BigString.UTF16View.index(before:)()
{
  return MEMORY[0x18960D980]();
}

uint64_t BigString.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x18960D988]();
}

uint64_t BigString.UTF16View.distance(from:to:)()
{
  return MEMORY[0x18960D990]();
}

uint64_t BigString.UTF16View.endIndex.getter()
{
  return MEMORY[0x18960D998]();
}

uint64_t BigString.UTF16View.subscript.getter()
{
  return MEMORY[0x18960D9A0]();
}

uint64_t BigString.init()()
{
  return MEMORY[0x18960D9A8]();
}

uint64_t BigString.subscript.getter()
{
  return MEMORY[0x18960D9B8]();
}

{
  return MEMORY[0x18960D9E8]();
}

uint64_t BigString.init(_:)()
{
  return MEMORY[0x18960D9C0]();
}

{
  return MEMORY[0x18960D9C8]();
}

{
  return MEMORY[0x18960D9D8]();
}

{
  return MEMORY[0x18960D9E0]();
}

uint64_t BigString.init<A>(_:)()
{
  return MEMORY[0x18960D9D0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t Logger.init()()
{
  return MEMORY[0x18961D1E8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x18961D200]();
}

uint64_t XPC_TYPE_DATA.getter()
{
  return MEMORY[0x18961BC18]();
}

uint64_t XPCCodableObject.copyUnderlyingXPCObject()()
{
  return MEMORY[0x18961BC58]();
}

uint64_t XPCCodableObject.type.getter()
{
  return MEMORY[0x18961BC60]();
}

uint64_t XPCCodableObject.init(copying:)()
{
  return MEMORY[0x18961BC68]();
}

uint64_t type metadata accessor for XPCCodableObject()
{
  return MEMORY[0x18961BC70]();
}

uint64_t MAP_FAILED.getter()
{
  return MEMORY[0x18961B588]();
}

uint64_t static POSIXErrorCode.EWOULDBLOCK.getter()
{
  return MEMORY[0x18961D0E0]();
}

uint64_t POSIXErrorCode.init(rawValue:)()
{
  return MEMORY[0x18961D0F0]();
}

uint64_t POSIXErrorCode.rawValue.getter()
{
  return MEMORY[0x18961D0F8]();
}

uint64_t open(_:_:_:)()
{
  return MEMORY[0x18961B5C0]();
}

uint64_t open(_:_:)()
{
  return MEMORY[0x18961B5C8]();
}

uint64_t errno.getter()
{
  return MEMORY[0x18961D120]();
}

uint64_t errno.setter()
{
  return MEMORY[0x18961D128]();
}

Swift::Int32 __swiftcall fcntl(_:_:_:)(Swift::Int32 a1, Swift::Int32 a2, Swift::Int32 a3)
{
  return MEMORY[0x18961B5D0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

uint64_t fcntl(_:_:_:)()
{
  return MEMORY[0x18961B5D8]();
}

Swift::Int32 __swiftcall fcntl(_:_:)(Swift::Int32 a1, Swift::Int32 a2)
{
  return MEMORY[0x18961B5E0](*(void *)&a1, *(void *)&a2);
}

uint64_t S_IFMT.getter()
{
  return MEMORY[0x18961B5F0]();
}

uint64_t S_IFBLK.getter()
{
  return MEMORY[0x18961B5F8]();
}

uint64_t S_IFCHR.getter()
{
  return MEMORY[0x18961B600]();
}

uint64_t S_IFDIR.getter()
{
  return MEMORY[0x18961B608]();
}

uint64_t S_IFLNK.getter()
{
  return MEMORY[0x18961B610]();
}

uint64_t S_IFREG.getter()
{
  return MEMORY[0x18961B618]();
}

uint64_t S_IRWXG.getter()
{
  return MEMORY[0x18961B620]();
}

uint64_t S_IRWXO.getter()
{
  return MEMORY[0x18961B628]();
}

uint64_t S_IRWXU.getter()
{
  return MEMORY[0x18961B630]();
}

uint64_t S_ISVTX.getter()
{
  return MEMORY[0x18961B638]();
}

uint64_t S_IWUSR.getter()
{
  return MEMORY[0x18961B640]();
}

uint64_t S_IFSOCK.getter()
{
  return MEMORY[0x18961B648]();
}

uint64_t type metadata accessor for FilePath()
{
  return MEMORY[0x18961BBF0]();
}

uint64_t FilePath.init(_:)()
{
  return MEMORY[0x18961BC08]();
}

uint64_t CustomCombineIdentifierConvertible<>.combineIdentifier.getter()
{
  return MEMORY[0x1896021A8]();
}

uint64_t type metadata accessor for CombineIdentifier()
{
  return MEMORY[0x1896021B0]();
}

uint64_t dispatch thunk of Subscriber.receive(completion:)()
{
  return MEMORY[0x189602228]();
}

uint64_t dispatch thunk of Subscriber.receive(subscription:)()
{
  return MEMORY[0x189602230]();
}

uint64_t dispatch thunk of Subscriber.receive(_:)()
{
  return MEMORY[0x189602238]();
}

uint64_t static Subscribers.Demand.== infix(_:_:)()
{
  return MEMORY[0x189602240]();
}

uint64_t static Subscribers.Demand.none.getter()
{
  return MEMORY[0x189602248]();
}

uint64_t static Subscribers.Demand.unlimited.getter()
{
  return MEMORY[0x189602250]();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x189602290]();
}

uint64_t AnyCancellable.init<A>(_:)()
{
  return MEMORY[0x1896022A8]();
}

uint64_t AnyCancellable.init(_:)()
{
  return MEMORY[0x1896022B8]();
}

uint64_t Publisher.map<A>(_:)()
{
  return MEMORY[0x189602338]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x18961B6A0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x18961B6E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x18961B708]();
}

uint64_t DispatchData.enumerateBytes(_:)()
{
  return MEMORY[0x18961B718]();
}

uint64_t type metadata accessor for DispatchData()
{
  return MEMORY[0x18961B740]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x18961B778]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x18961B788]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x18961B820]();
}

uint64_t dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter()
{
  return MEMORY[0x1896177B0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandWidth.getter()
{
  return MEMORY[0x1896177B8]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter()
{
  return MEMORY[0x1896177C0]();
}

uint64_t dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter()
{
  return MEMORY[0x1896177C8]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter()
{
  return MEMORY[0x1896177D0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)()
{
  return MEMORY[0x1896177D8]();
}

uint64_t static BinaryFloatingPoint._convert<A>(from:)()
{
  return MEMORY[0x1896177E8]();
}

uint64_t static BinaryFloatingPoint<>._convert<A>(from:)()
{
  return MEMORY[0x1896177F8]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init(_:)()
{
  return MEMORY[0x189617800]();
}

{
  return MEMORY[0x189617808]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x189617810]();
}

uint64_t Dictionary.init(minimumCapacity:)()
{
  return MEMORY[0x189617820]();
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x189617838]();
}

uint64_t static Dictionary._bridgeFromObjectiveCAdoptingNativeStorageOf(_:)()
{
  return MEMORY[0x189617840]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x189617878]();
}

uint64_t Dictionary.isEmpty.getter()
{
  return MEMORY[0x189617898]();
}

uint64_t Dictionary._Variant.setValue(_:forKey:)()
{
  return MEMORY[0x1896178B8]();
}

uint64_t type metadata accessor for Dictionary._Variant()
{
  return MEMORY[0x1896178C8]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1896178E0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x189617900]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x189617930]();
}

uint64_t dispatch thunk of static FloatingPoint.nan.getter()
{
  return MEMORY[0x189617968]();
}

uint64_t dispatch thunk of FloatingPoint.sign.getter()
{
  return MEMORY[0x189617978]();
}

uint64_t dispatch thunk of FloatingPoint.isNaN.getter()
{
  return MEMORY[0x189617980]();
}

uint64_t dispatch thunk of FloatingPoint.isZero.getter()
{
  return MEMORY[0x189617988]();
}

uint64_t dispatch thunk of FloatingPoint.nextUp.getter()
{
  return MEMORY[0x189617990]();
}

uint64_t dispatch thunk of FloatingPoint.exponent.getter()
{
  return MEMORY[0x1896179B0]();
}

uint64_t dispatch thunk of static FloatingPoint.infinity.getter()
{
  return MEMORY[0x1896179B8]();
}

uint64_t dispatch thunk of FloatingPoint.isFinite.getter()
{
  return MEMORY[0x1896179C0]();
}

uint64_t dispatch thunk of FloatingPoint.nextDown.getter()
{
  return MEMORY[0x1896179C8]();
}

uint64_t dispatch thunk of FloatingPoint.init<A>(_:)()
{
  return MEMORY[0x1896179E8]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1896179F8]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x189617A00]();
}

uint64_t Character.asciiValue.getter()
{
  return MEMORY[0x189617A30]();
}

Swift::String __swiftcall Character.lowercased()()
{
  uint64_t v0 = MEMORY[0x189617A38]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Character.isWhitespace.getter()
{
  return MEMORY[0x189617A50]();
}

uint64_t Character._isSingleScalar.getter()
{
  return MEMORY[0x189617A70]();
}

uint64_t Character.wholeNumberValue.getter()
{
  return MEMORY[0x189617A78]();
}

uint64_t Character.hash(into:)()
{
  return MEMORY[0x189617A88]();
}

uint64_t Character.write<A>(to:)()
{
  return MEMORY[0x189617A90]();
}

uint64_t Character.isNumber.getter()
{
  return MEMORY[0x189617AA0]();
}

uint64_t BidirectionalCollection<>.firstMatch<A, B>(of:)()
{
  return MEMORY[0x18961D020]();
}

uint64_t BidirectionalCollection<>.prefixMatch<A>(of:)()
{
  return MEMORY[0x18961D038]();
}

uint64_t BidirectionalCollection<>.contains<A>(_:)()
{
  return MEMORY[0x18961D068]();
}

uint64_t dispatch thunk of BidirectionalCollection.index(before:)()
{
  return MEMORY[0x189617AD0]();
}

uint64_t dispatch thunk of BidirectionalCollection.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x189617AD8]();
}

uint64_t dispatch thunk of BidirectionalCollection.index(_:offsetBy:)()
{
  return MEMORY[0x189617AE0]();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return MEMORY[0x189617AE8]();
}

uint64_t BidirectionalCollection.last.getter()
{
  return MEMORY[0x189617AF8]();
}

uint64_t BidirectionalCollection.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x189617B00]();
}

uint64_t BidirectionalCollection.index(_:offsetBy:)()
{
  return MEMORY[0x189617B08]();
}

uint64_t BidirectionalCollection.distance(from:to:)()
{
  return MEMORY[0x189617B18]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x189617B30]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x189617B38]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x189617B40]();
}

uint64_t dispatch thunk of static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x189617B48]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x189617B50]();
}

uint64_t static Comparable.> infix(_:_:)()
{
  return MEMORY[0x189617B58]();
}

uint64_t static Comparable.>= infix(_:_:)()
{
  return MEMORY[0x189617B60]();
}

uint64_t static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x189617B68]();
}

uint64_t MutableCollection<>.sort(by:)()
{
  return MEMORY[0x189617BC0]();
}

uint64_t type metadata accessor for ClosedRange()
{
  return MEMORY[0x189617BE0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x189617C20]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x189617C90]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x189617C98]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x189617CA0]();
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = MEMORY[0x189617CA8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x189617CB0]();
}

uint64_t String.init(_cocoaString:)()
{
  return MEMORY[0x189617CC0]();
}

uint64_t static String._tryFromUTF8(_:)()
{
  return MEMORY[0x189617CC8]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x189617CE0]();
}

uint64_t String.init(_nativeStorage:)()
{
  return MEMORY[0x189617CE8]();
}

uint64_t String.removeSubrange(_:)()
{
  return MEMORY[0x189617CF0]();
}

uint64_t String.init(validatingUTF8:)()
{
  return MEMORY[0x189617CF8]();
}

uint64_t String.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x189617D00]();
}

Swift::Void __swiftcall String.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t String._slowWithCString<A, B>(encodedAs:_:)()
{
  return MEMORY[0x189617D10]();
}

uint64_t String.UnicodeScalarView._foreignIndex(after:)()
{
  return MEMORY[0x189617D20]();
}

uint64_t String.UnicodeScalarView._foreignIndex(before:)()
{
  return MEMORY[0x189617D28]();
}

uint64_t String.UnicodeScalarView.append<A>(contentsOf:)()
{
  return MEMORY[0x189617D38]();
}

uint64_t String.UnicodeScalarView.append(_:)()
{
  return MEMORY[0x189617D40]();
}

uint64_t String.UnicodeScalarView.subscript.getter()
{
  return MEMORY[0x189617D68]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x189617D78]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x189617D80]();
}

uint64_t String.init(_:)()
{
  return MEMORY[0x18960D9F0]();
}

{
  return MEMORY[0x18960D9F8]();
}

{
  return MEMORY[0x18960DA00]();
}

{
  return MEMORY[0x189618050]();
}

{
  return MEMORY[0x189618058]();
}

{
  return MEMORY[0x189618060]();
}

uint64_t String._copyUTF16CodeUnits(into:range:)()
{
  return MEMORY[0x189617D88]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x189617D90]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x189617D98](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t String._bridgeToObjectiveCImpl()()
{
  return MEMORY[0x189617DA0]();
}

uint64_t String.init(unsafeUninitializedCapacity:initializingUTF8With:)()
{
  return MEMORY[0x189617DA8]();
}

uint64_t String._nfd.getter()
{
  return MEMORY[0x189617DC8]();
}

uint64_t String.init(from:)()
{
  return MEMORY[0x189617DD0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x189617DD8]();
}

uint64_t String.Index.init<A>(utf16Offset:in:)()
{
  return MEMORY[0x189617DE0]();
}

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x189617DE8]();
}

uint64_t String.Index.samePosition(in:)()
{
  return MEMORY[0x189617DF0]();
}

uint64_t String.Index.init<A>(_:within:)()
{
  return MEMORY[0x189617E18]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x189617E20]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x189617E28]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x189617E30]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x189617E38]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x189617E40]();
}

uint64_t String.init(validating:)()
{
  return MEMORY[0x18961BC10]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x189617E60]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.encode(to:)()
{
  return MEMORY[0x189617E78]();
}

uint64_t String.remove(at:)()
{
  return MEMORY[0x189617E88]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x189617E90]();
}

{
  return MEMORY[0x189617E98]();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x189617EA8]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x189617EB0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x189617EB8]();
}

uint64_t String.UTF8View._foreignIndex(before:)()
{
  return MEMORY[0x189617EC0]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x189617EC8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x189617ED0]();
}

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x189617ED8]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x189617EE0]();
}

Swift::Int __swiftcall String.UTF16View._foreignCount()()
{
  return MEMORY[0x189617F10]();
}

uint64_t String.UTF16View._foreignIndex(after:)()
{
  return MEMORY[0x189617F18]();
}

uint64_t String.UTF16View._foreignIndex(before:)()
{
  return MEMORY[0x189617F20]();
}

uint64_t String.UTF16View._nativeGetOffset(for:)()
{
  return MEMORY[0x189617F28]();
}

uint64_t String.UTF16View._foreignSubscript(position:)()
{
  return MEMORY[0x189617F30]();
}

uint64_t String.UTF16View.count.getter()
{
  return MEMORY[0x189617F38]();
}

uint64_t String.UTF16View.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x189617F40]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x189617F48]();
}

Swift::UInt16_optional __swiftcall String.UTF16View.Iterator.next()()
{
  return (Swift::UInt16_optional)MEMORY[0x189617F50]();
}

uint64_t String.UTF16View.distance(from:to:)()
{
  return MEMORY[0x189617F58]();
}

uint64_t String.UTF16View.subscript.getter()
{
  return MEMORY[0x189617F70]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x189617F78](a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x189617F80](a1._countAndFlagsBits, a1._object);
}

uint64_t String.hashValue.getter()
{
  return MEMORY[0x189617F88]();
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = MEMORY[0x189617F90](repeating._countAndFlagsBits, repeating._object, count);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x189617FF8]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x189618040]();
}

{
  return MEMORY[0x189618078]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x189618068]();
}

{
  return MEMORY[0x189618070]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x189618080]();
}

uint64_t dispatch thunk of Sequence._copyContents(initializing:)()
{
  return MEMORY[0x189618088]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x189618090]();
}

uint64_t dispatch thunk of Sequence._copyToContiguousArray()()
{
  return MEMORY[0x189618098]();
}

uint64_t dispatch thunk of Sequence._customContainsEquatableElement(_:)()
{
  return MEMORY[0x1896180A0]();
}

uint64_t dispatch thunk of Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1896180A8]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1896180D0]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x1896180E0]();
}

uint64_t Sequence._copyToContiguousArray()()
{
  return MEMORY[0x1896180F0]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1896180F8]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x189618128]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x189618160]();
}

uint64_t Sequence<>.starts<A>(with:)()
{
  return MEMORY[0x189618190]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x1896181A0]();
}

uint64_t dispatch thunk of RangeExpression.contains(_:)()
{
  return MEMORY[0x189618200]();
}

uint64_t dispatch thunk of RangeExpression.relative<A>(to:)()
{
  return MEMORY[0x189618208]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x189618220]();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return MEMORY[0x189618230]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x189618248]();
}

{
  return MEMORY[0x189618250]();
}

{
  return MEMORY[0x189618258]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x189618290]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x189618298]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x1896182A0]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1896182A8]();
}

{
  return MEMORY[0x1896182B0]();
}

{
  return MEMORY[0x1896182B8]();
}

Swift::Void __swiftcall Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
}

uint64_t Array.description.getter()
{
  return MEMORY[0x189618318]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x189618320]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x189618358]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x189618390]();
}

Swift::Void __swiftcall Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(Swift::Int oldCount)
{
}

uint64_t Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1896183C0]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1896183C8]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1896183D8]();
}

Swift::Int __swiftcall Array._getCount()()
{
  return MEMORY[0x1896183F8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x189618410]();
}

uint64_t Bool.encode(to:)()
{
  return MEMORY[0x1896184B8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x18961BC98]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x18961BCA0]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x18961BCA8]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x18961BCB0]();
}

uint64_t dispatch thunk of AsyncIteratorProtocol.next()()
{
  return MEMORY[0x18961BCD8]();
}

uint64_t _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF()
{
  return MEMORY[0x18961BD08]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x18961BD20]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x18961BD28]();
}

uint64_t static Task<>.checkCancellation()()
{
  return MEMORY[0x18961BDE8]();
}

uint64_t type metadata accessor for UnsafeContinuation()
{
  return MEMORY[0x18961BDF0]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x18961BE28]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x189618500]();
}

uint64_t Double._roundSlowPath(_:)()
{
  return MEMORY[0x189618510]();
}

uint64_t Double.significandWidth.getter()
{
  return MEMORY[0x189618520]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x189618530]();
}

uint64_t Double.exponent.getter()
{
  return MEMORY[0x189618548]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x1896185D0]();
}

uint64_t Float.description.getter()
{
  return MEMORY[0x1896185E0]();
}

uint64_t Float.significandWidth.getter()
{
  return MEMORY[0x1896185F0]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x189618600]();
}

uint64_t Float.exponent.getter()
{
  return MEMORY[0x189618610]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x189618660]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x189618668]();
}

uint64_t static Set._bridgeFromObjectiveCAdoptingNativeStorageOf(_:)()
{
  return MEMORY[0x189618670]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x189618688]();
}

uint64_t Set.isEmpty.getter()
{
  return MEMORY[0x1896186A0]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1896186A8]();
}

uint64_t Set._Variant.insert(_:)()
{
  return MEMORY[0x1896186B0]();
}

uint64_t type metadata accessor for Set._Variant()
{
  return MEMORY[0x1896186B8]();
}

uint64_t Int.init(from:)()
{
  return MEMORY[0x189618720]();
}

uint64_t Int.encode(to:)()
{
  return MEMORY[0x189618728]();
}

uint64_t dispatch thunk of static Numeric.* infix(_:_:)()
{
  return MEMORY[0x1896187B8]();
}

uint64_t dispatch thunk of Numeric.init<A>(exactly:)()
{
  return MEMORY[0x1896187C0]();
}

uint64_t dispatch thunk of Numeric.magnitude.getter()
{
  return MEMORY[0x1896187D8]();
}

uint64_t dispatch thunk of RandomAccessCollection.index(_:offsetBy:)()
{
  return MEMORY[0x1896187E8]();
}

uint64_t dispatch thunk of RandomAccessCollection.distance(from:to:)()
{
  return MEMORY[0x1896187F0]();
}

uint64_t RandomAccessCollection.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x1896187F8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x189618828]();
}

uint64_t Collection<>.trimmingPrefix<A>(_:)()
{
  return MEMORY[0x18961D070]();
}

uint64_t Collection<>.contains<A>(_:)()
{
  return MEMORY[0x18961D080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x189618848]();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return MEMORY[0x189618850]();
}

uint64_t dispatch thunk of Collection.index(_:offsetBy:)()
{
  return MEMORY[0x189618860]();
}

uint64_t dispatch thunk of Collection.distance(from:to:)()
{
  return MEMORY[0x189618880]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x189618888]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x189618890]();
}

uint64_t Collection<>.popFirst()()
{
  return MEMORY[0x1896188A8]();
}

uint64_t Collection.underestimatedCount.getter()
{
  return MEMORY[0x1896188B8]();
}

uint64_t Collection._copyToContiguousArray()()
{
  return MEMORY[0x1896188C0]();
}

uint64_t Collection.count.getter()
{
  return MEMORY[0x1896188C8]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x1896188D0]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1896188F8]();
}

uint64_t Collection<>.indices.getter()
{
  return MEMORY[0x189618928]();
}

uint64_t Collection<>.subscript.getter()
{
  return MEMORY[0x189618940]();
}

uint64_t dispatch thunk of Collection.subscript.getter()
{
  return MEMORY[0x189618948]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x189618950]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.replaceSubrange<A>(_:with:)()
{
  return MEMORY[0x189618960]();
}

uint64_t RangeReplaceableCollection<>.replace<A, B>(_:with:maxReplacements:)()
{
  return MEMORY[0x18961D090]();
}

uint64_t RangeReplaceableCollection<>.replacing<A, B>(_:with:maxReplacements:)()
{
  return MEMORY[0x18961D098]();
}

Swift::Void __swiftcall RangeReplaceableCollection.removeFirst(_:)(Swift::Int a1)
{
}

uint64_t RangeReplaceableCollection<>.removeLast()()
{
  return MEMORY[0x1896189D0]();
}

uint64_t Range.init(uncheckedBounds:)()
{
  return MEMORY[0x189618A00]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x189618A18]();
}

uint64_t Range<>.encode(to:)()
{
  return MEMORY[0x189618A20]();
}

uint64_t Range<>.init(from:)()
{
  return MEMORY[0x189618A28]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x18961D210]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x18961D220]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x18961D228]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x18961D238]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x18961B8A8]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x18961B8D0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x18961B920]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x18961B958]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x18961BAE0](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x18961BAF0]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x18961BAF8]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x18961BB00]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x18961D280]();
}

uint64_t Optional._bridgeToObjectiveC()()
{
  return MEMORY[0x189618AB8]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x189618AC0]();
}

Swift::String __swiftcall Substring.lowercased()()
{
  uint64_t v0 = MEMORY[0x189618B58]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall Substring.uppercased()()
{
  uint64_t v0 = MEMORY[0x189618B60]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Substring.UnicodeScalarView.index(after:)()
{
  return MEMORY[0x189618B68]();
}

uint64_t Substring.UnicodeScalarView.index(before:)()
{
  return MEMORY[0x189618B70]();
}

uint64_t Substring.UnicodeScalarView.index(_:offsetBy:)()
{
  return MEMORY[0x189618B80]();
}

uint64_t Substring.UnicodeScalarView.formIndex(after:)()
{
  return MEMORY[0x189618B88]();
}

uint64_t Substring.UnicodeScalarView.formIndex(before:)()
{
  return MEMORY[0x189618B90]();
}

uint64_t Substring.UnicodeScalarView.subscript.getter()
{
  return MEMORY[0x189618BC8]();
}

uint64_t Substring.index(after:)()
{
  return MEMORY[0x189618BD0]();
}

uint64_t Substring.index(before:)()
{
  return MEMORY[0x189618BD8]();
}

uint64_t Substring.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x189618BE0]();
}

uint64_t Substring.index(_:offsetBy:)()
{
  return MEMORY[0x189618BE8]();
}

uint64_t Substring.UTF8View.index(after:)()
{
  return MEMORY[0x189618BF8]();
}

uint64_t Substring.UTF8View.index(before:)()
{
  return MEMORY[0x189618C00]();
}

uint64_t Substring.UTF8View.index(_:offsetBy:)()
{
  return MEMORY[0x189618C10]();
}

uint64_t Substring.UTF8View.distance(from:to:)()
{
  return MEMORY[0x189618C18]();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return MEMORY[0x189618C38]();
}

uint64_t Substring.distance(from:to:)()
{
  return MEMORY[0x189618C40]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x189618C90]();
}

{
  return MEMORY[0x189618CA0]();
}

uint64_t Substring.init(_:)()
{
  return MEMORY[0x189618C98]();
}

uint64_t Substring.init<A>(_:)()
{
  return MEMORY[0x189618CA8]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x189618CB0]();
}

uint64_t UInt.hashValue.getter()
{
  return MEMORY[0x189618CC8]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x189618D30]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x189618D50]();
}

uint64_t dispatch thunk of Strideable.distance(to:)()
{
  return MEMORY[0x189618D70]();
}

uint64_t static Strideable.== infix(_:_:)()
{
  return MEMORY[0x189618D80]();
}

uint64_t static Strideable._step(after:from:by:)()
{
  return MEMORY[0x189618D88]();
}

uint64_t dispatch thunk of StringProtocol.unicodeScalars.getter()
{
  return MEMORY[0x189618DA0]();
}

uint64_t dispatch thunk of StringProtocol.utf8.getter()
{
  return MEMORY[0x189618DB0]();
}

uint64_t dispatch thunk of StringProtocol.utf16.getter()
{
  return MEMORY[0x189618DB8]();
}

uint64_t dispatch thunk of StringProtocol.hasSuffix(_:)()
{
  return MEMORY[0x189618DD8]();
}

uint64_t StringProtocol._toUTF16Index(_:)()
{
  return MEMORY[0x189618DE8]();
}

uint64_t StringProtocol._toUTF16Offset(_:)()
{
  return MEMORY[0x189618DF0]();
}

uint64_t StringProtocol._toUTF16Indices(_:)()
{
  return MEMORY[0x189618DF8]();
}

uint64_t StringProtocol._toUTF16Offsets(_:)()
{
  return MEMORY[0x189618E00]();
}

uint64_t StringProtocol._ephemeralString.getter()
{
  return MEMORY[0x189618E08]();
}

uint64_t dispatch thunk of BinaryInteger.isMultiple(of:)()
{
  return MEMORY[0x189618E18]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x189618E20]();
}

uint64_t dispatch thunk of static BinaryInteger./= infix(_:_:)()
{
  return MEMORY[0x189618E60]();
}

uint64_t dispatch thunk of static BinaryInteger.>> infix<A>(_:_:)()
{
  return MEMORY[0x189618E68]();
}

uint64_t dispatch thunk of BinaryInteger.words.getter()
{
  return MEMORY[0x189618E90]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(exactly:)()
{
  return MEMORY[0x189618E98]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x189618EA0]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x189618EA8]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(clamping:)()
{
  return MEMORY[0x189618EB0]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x189618EB8]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x189618ED0]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return MEMORY[0x189618ED8]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x189618EE0]();
}

uint64_t dispatch thunk of AnyKeyPath._kvcKeyPathString.getter()
{
  return MEMORY[0x189618EF0]();
}

uint64_t AnyKeyPath.debugDescription.getter()
{
  return MEMORY[0x189618EF8]();
}

uint64_t dispatch thunk of static AnyKeyPath._rootAndValueType.getter()
{
  return MEMORY[0x189618F00]();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return MEMORY[0x189618F08]();
}

uint64_t static AnyKeyPath.== infix(_:_:)()
{
  return MEMORY[0x189618F10]();
}

uint64_t type metadata accessor for AnyKeyPath()
{
  return MEMORY[0x189618F18]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x189618F78]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x189619018]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x189619020]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x189619030]();
}

uint64_t _NativeSet._unsafeInsertNew(_:)()
{
  return MEMORY[0x189619038]();
}

uint64_t _NativeSet.bridged()()
{
  return MEMORY[0x189619040]();
}

uint64_t type metadata accessor for _NativeSet()
{
  return MEMORY[0x189619048]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x189619058]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x189619078]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x189619080]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x189619098]();
}

uint64_t debugPrint<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x1896190B8]();
}

uint64_t withVaList<A>(_:_:)()
{
  return MEMORY[0x1896190C0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1896190C8](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1896190D0]();
}

uint64_t AnyHashable.base.getter()
{
  return MEMORY[0x1896190D8]();
}

uint64_t AnyHashable.hash(into:)()
{
  return MEMORY[0x1896190E0]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x189619100]();
}

uint64_t static CommandLine.arguments.getter()
{
  return MEMORY[0x189619138]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x189619188]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x189619190]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x189619198]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1896191A0]();
}

uint64_t type metadata accessor for _SetStorage()
{
  return MEMORY[0x1896191A8]();
}

uint64_t _StringGuts.fastUTF8Scalar(startingAt:)()
{
  return MEMORY[0x1896191B8]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1896191C0]();
}

uint64_t _StringGuts._isContiguousASCII.getter()
{
  return MEMORY[0x1896191C8]();
}

uint64_t _StringGuts.foreignScalarAlign(_:)()
{
  return MEMORY[0x1896191D0]();
}

Swift::Int __swiftcall _StringGuts.fastUTF8ScalarLength(endingAt:)(Swift::Int endingAt)
{
  return MEMORY[0x1896191D8](endingAt);
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x1896191E0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1896191F0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x189619260]();
}

uint64_t _ArrayBuffer.requestNativeBuffer()()
{
  return MEMORY[0x1896192D8]();
}

uint64_t _ArrayBuffer._copyContents(subRange:initializing:)()
{
  return MEMORY[0x1896192E8]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1896192F8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x189619300]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x189619308]();
}

uint64_t _ArrayBuffer.capacity.getter()
{
  return MEMORY[0x189619310]();
}

uint64_t static DecodingError.dataCorruptedError(in:debugDescription:)()
{
  return MEMORY[0x189619338]();
}

{
  return MEMORY[0x189619340]();
}

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x189619348]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x189619378]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1896193A0]();
}

uint64_t EncodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1896193C0]();
}

uint64_t type metadata accessor for EncodingError()
{
  return MEMORY[0x1896193D0]();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return MEMORY[0x1896193F8]();
}

uint64_t dispatch thunk of static SignedNumeric.- prefix(_:)()
{
  return MEMORY[0x189619438]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x189619440]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x189619448]();
}

uint64_t type metadata accessor for PartialKeyPath()
{
  return MEMORY[0x189619458]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1896194A0]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1896194C0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1896194D8]();
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1896194E0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1896194F8]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x189619500]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x189619538]();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x189619630]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x189619640]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x189619648]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x189619650]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x189619660]();
}

uint64_t type metadata accessor for PartialRangeFrom()
{
  return MEMORY[0x189619680]();
}

uint64_t type metadata accessor for PartialRangeUpTo()
{
  return MEMORY[0x189619698]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x1896196E0]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x1896196E8]();
}

uint64_t dispatch thunk of FixedWidthInteger.addingReportingOverflow(_:)()
{
  return MEMORY[0x189619768]();
}

uint64_t dispatch thunk of FixedWidthInteger.multipliedReportingOverflow(by:)()
{
  return MEMORY[0x189619780]();
}

uint64_t dispatch thunk of FixedWidthInteger.subtractingReportingOverflow(_:)()
{
  return MEMORY[0x189619788]();
}

uint64_t dispatch thunk of static FixedWidthInteger.max.getter()
{
  return MEMORY[0x189619798]();
}

uint64_t FixedWidthInteger.init<A>(exactly:)()
{
  return MEMORY[0x1896197C8]();
}

uint64_t _NativeDictionary._unsafeInsertNew(key:value:)()
{
  return MEMORY[0x189619818]();
}

uint64_t _NativeDictionary.bridged()()
{
  return MEMORY[0x189619830]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x189619848]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x189619870]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x189619890]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A0]();
}

{
  return MEMORY[0x1896198A8]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x1896198B8]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x1896198C0]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.- infix(_:_:)()
{
  return MEMORY[0x1896198C8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x189619930]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x189619948]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x189619950]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x189619960]();
}

uint64_t type metadata accessor for _DictionaryStorage()
{
  return MEMORY[0x189619968]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x189619978]();
}

uint64_t type metadata accessor for PartialRangeThrough()
{
  return MEMORY[0x189619980]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x189619990]();
}

uint64_t type metadata accessor for CollectionDifference.Change()
{
  return MEMORY[0x1896199B0]();
}

uint64_t type metadata accessor for CollectionDifference()
{
  return MEMORY[0x1896199C0]();
}

uint64_t CollectionDifference.init<A>(_:)()
{
  return MEMORY[0x1896199D0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x189619A08]();
}

uint64_t dispatch thunk of _ObjectiveCBridgeable._bridgeToObjectiveC()()
{
  return MEMORY[0x189619A28]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x189619A40](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedUnkeyedContainer(forKey:)()
{
  return MEMORY[0x189619A60]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x189619A68]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x189619A70]();
}

uint64_t KeyedDecodingContainer.superDecoder(forKey:)()
{
  return MEMORY[0x189619A78]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x189619A80]();
}

{
  return MEMORY[0x189619A88]();
}

{
  return MEMORY[0x189619A90]();
}

{
  return MEMORY[0x189619AA0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x189619AB0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x189619AF8]();
}

{
  return MEMORY[0x189619B00]();
}

{
  return MEMORY[0x189619B08]();
}

{
  return MEMORY[0x189619B10]();
}

{
  return MEMORY[0x189619B18]();
}

{
  return MEMORY[0x189619B20]();
}

{
  return MEMORY[0x189619B30]();
}

{
  return MEMORY[0x189619B38]();
}

{
  return MEMORY[0x189619B48]();
}

{
  return MEMORY[0x189619B50]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x189619B28]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x189619B58]();
}

uint64_t KeyedDecodingContainer.contains(_:)()
{
  return MEMORY[0x189619B60]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x189619B70]();
}

uint64_t KeyedDecodingContainer.init<A>(_:)()
{
  return MEMORY[0x189619B80]();
}

uint64_t KeyedEncodingContainer.nestedUnkeyedContainer(forKey:)()
{
  return MEMORY[0x189619B90]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x189619B98]();
}

uint64_t KeyedEncodingContainer.codingPath.getter()
{
  return MEMORY[0x189619BA0]();
}

uint64_t KeyedEncodingContainer.superEncoder(forKey:)()
{
  return MEMORY[0x189619BA8]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x189619BB0]();
}

{
  return MEMORY[0x189619BB8]();
}

{
  return MEMORY[0x189619BC0]();
}

{
  return MEMORY[0x189619BC8]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x189619BD8]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x189619BF0]();
}

{
  return MEMORY[0x189619BF8]();
}

{
  return MEMORY[0x189619C00]();
}

{
  return MEMORY[0x189619C08]();
}

{
  return MEMORY[0x189619C10]();
}

{
  return MEMORY[0x189619C18]();
}

{
  return MEMORY[0x189619C38]();
}

{
  return MEMORY[0x189619C40]();
}

{
  return MEMORY[0x189619C58]();
}

{
  return MEMORY[0x189619C60]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x189619C20]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x189619C70]();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return MEMORY[0x189619C80]();
}

uint64_t _ContiguousArrayBuffer._asCocoaArray()()
{
  return MEMORY[0x189619C90]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x189619C98]();
}

uint64_t type metadata accessor for __SwiftDeferredNSArray()
{
  return MEMORY[0x189619CA0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x189619CA8](a1);
}

uint64_t _stringCompareInternal(_:_:_:_:expecting:)()
{
  return MEMORY[0x189619CB0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x189619CC8]();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return MEMORY[0x189619CD8]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)()
{
  return MEMORY[0x189619D08]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.superDecoder()()
{
  return MEMORY[0x189619D28]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return MEMORY[0x189619D30]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.count.getter()
{
  return MEMORY[0x189619D38]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x189619D40]();
}

{
  return MEMORY[0x189619D50]();
}

{
  return MEMORY[0x189619D68]();
}

{
  return MEMORY[0x189619D70]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x189619D58]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter()
{
  return MEMORY[0x189619D80]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decodeNil()()
{
  return MEMORY[0x189619D88]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return MEMORY[0x189619D90]();
}

{
  return MEMORY[0x189619D98]();
}

{
  return MEMORY[0x189619DA0]();
}

{
  return MEMORY[0x189619DB0]();
}

{
  return MEMORY[0x189619DB8]();
}

{
  return MEMORY[0x189619DE0]();
}

{
  return MEMORY[0x189619E08]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent<A>(_:)()
{
  return MEMORY[0x189619DC0]();
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x189619E18]();
}

{
  return MEMORY[0x189619E20]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)()
{
  return MEMORY[0x189619E30]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.superEncoder()()
{
  return MEMORY[0x189619E40]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode<A>(contentsOf:)()
{
  return MEMORY[0x189619E50]();
}

{
  return MEMORY[0x189619E58]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x189619E60]();
}

{
  return MEMORY[0x189619E70]();
}

{
  return MEMORY[0x189619E88]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x189619E78]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encodeNil()()
{
  return MEMORY[0x189619E98]();
}

uint64_t UnkeyedEncodingContainer.encodeConditional<A>(_:)()
{
  return MEMORY[0x189619EA0]();
}

uint64_t UnkeyedEncodingContainer.encode<A>(contentsOf:)()
{
  return MEMORY[0x189619EA8]();
}

{
  return MEMORY[0x189619EB0]();
}

{
  return MEMORY[0x189619EB8]();
}

{
  return MEMORY[0x189619EC0]();
}

{
  return MEMORY[0x189619EC8]();
}

{
  return MEMORY[0x189619ED0]();
}

{
  return MEMORY[0x189619ED8]();
}

{
  return MEMORY[0x189619EE0]();
}

{
  return MEMORY[0x189619EE8]();
}

{
  return MEMORY[0x189619EF0]();
}

{
  return MEMORY[0x189619EF8]();
}

{
  return MEMORY[0x189619F00]();
}

{
  return MEMORY[0x189619F08]();
}

{
  return MEMORY[0x189619F10]();
}

{
  return MEMORY[0x189619F18]();
}

{
  return MEMORY[0x189619F20]();
}

{
  return MEMORY[0x189619F28]();
}

uint64_t UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x189619F30]();
}

{
  return MEMORY[0x189619F38]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x189619F40]();
}

uint64_t dispatch thunk of ExpressibleByFloatLiteral.init(floatLiteral:)()
{
  return MEMORY[0x189619F48]();
}

uint64_t static FloatingPointRoundingRule.== infix(_:_:)()
{
  return MEMORY[0x189619F80]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x189619F98]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x189619FD0]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x189619FE0]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x18961A010]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x18961A040]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x18961A050]();
}

uint64_t withTaskCancellationHandler<A>(operation:onCancel:isolation:)()
{
  return MEMORY[0x18961BF58]();
}

uint64_t dispatch thunk of CustomDebugStringConvertible.debugDescription.getter()
{
  return MEMORY[0x18961A058]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x18961A070]();
}

{
  return MEMORY[0x18961A078]();
}

{
  return MEMORY[0x18961A080]();
}

{
  return MEMORY[0x18961A090]();
}

{
  return MEMORY[0x18961A098]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x18961A0A0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decodeNil()()
{
  return MEMORY[0x18961A0B0]();
}

uint64_t SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x18961A0B8]();
}

{
  return MEMORY[0x18961A0C0]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x18961A0C8]();
}

{
  return MEMORY[0x18961A0D0]();
}

{
  return MEMORY[0x18961A0D8]();
}

{
  return MEMORY[0x18961A0E0]();
}

{
  return MEMORY[0x18961A0E8]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x18961A0F0]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encodeNil()()
{
  return MEMORY[0x18961A100]();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x18961A108]();
}

{
  return MEMORY[0x18961A110]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x18961A118]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x18961A120]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x18961A128]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x18961A168]();
}

{
  return MEMORY[0x18961A170]();
}

{
  return MEMORY[0x18961A178]();
}

{
  return MEMORY[0x18961A188]();
}

{
  return MEMORY[0x18961A190]();
}

{
  return MEMORY[0x18961A1B8]();
}

{
  return MEMORY[0x18961A1E0]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x18961A198]();
}

uint64_t KeyedDecodingContainerProtocol.decode(_:forKey:)()
{
  return MEMORY[0x18961A1F0]();
}

{
  return MEMORY[0x18961A1F8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x18961A220]();
}

{
  return MEMORY[0x18961A228]();
}

{
  return MEMORY[0x18961A230]();
}

{
  return MEMORY[0x18961A240]();
}

{
  return MEMORY[0x18961A248]();
}

{
  return MEMORY[0x18961A270]();
}

{
  return MEMORY[0x18961A280]();
}

{
  return MEMORY[0x18961A298]();
}

{
  return MEMORY[0x18961A2A0]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x18961A250]();
}

uint64_t KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)()
{
  return MEMORY[0x18961A2A8]();
}

uint64_t KeyedEncodingContainerProtocol.encode(_:forKey:)()
{
  return MEMORY[0x18961A2B0]();
}

{
  return MEMORY[0x18961A2B8]();
}

uint64_t _copySequenceToContiguousArray<A>(_:)()
{
  return MEMORY[0x18961A2C0]();
}

uint64_t withCheckedThrowingContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x18961BF68]();
}

uint64_t _bridgeNonVerbatimFromObjectiveC<A>(_:_:_:)()
{
  return MEMORY[0x18961A2E0]();
}

uint64_t _copyCollectionToContiguousArray<A>(_:)()
{
  return MEMORY[0x18961A2E8]();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x18961A2F0]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinFloatLiteral.init(_builtinFloatLiteral:)()
{
  return MEMORY[0x18961A2F8]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x18961A310]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x18961A318]();
}

uint64_t _bridgeNonVerbatimFromObjectiveCConditional<A>(_:_:_:)()
{
  return MEMORY[0x18961A330]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x18961A398]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t dispatch thunk of Error._code.getter()
{
  return MEMORY[0x18961A3B0]();
}

uint64_t dispatch thunk of Error._domain.getter()
{
  return MEMORY[0x18961A3B8]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t type metadata accessor for Slice()
{
  return MEMORY[0x18961A5B0]();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return MEMORY[0x18961A670]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x18961A678]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

uint64_t Hasher.combine(bytes:)()
{
  return MEMORY[0x18961A688]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x18961A6B8]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x18961A6C8]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x18961A6F0]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x18961A728]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x18961A750]();
}

uint64_t Mirror.children.getter()
{
  return MEMORY[0x18961A758]();
}

uint64_t type metadata accessor for Mirror()
{
  return MEMORY[0x18961A760]();
}

uint64_t Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x18961A770]();
}

uint64_t Mirror.init<A, B>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x18961A778]();
}

uint64_t Mirror.init<A>(_:children:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x18961A780]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x18961A920]();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return MEMORY[0x18961A930]();
}

uint64_t dispatch thunk of Decoder.unkeyedContainer()()
{
  return MEMORY[0x18961A938]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x18961A940]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x18961A950]();
}

uint64_t dispatch thunk of Encoder.unkeyedContainer()()
{
  return MEMORY[0x18961A960]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x18961A968]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x18961A978]();
}

uint64_t type metadata accessor for KeyPath()
{
  return MEMORY[0x18961A998]();
}

uint64_t type metadata accessor for Unicode.GeneralCategory()
{
  return MEMORY[0x18961AB00]();
}

uint64_t static Unicode.CanonicalCombiningClass.notReordered.getter()
{
  return MEMORY[0x18961AB48]();
}

uint64_t static Unicode.CanonicalCombiningClass.== infix(_:_:)()
{
  return MEMORY[0x18961AB50]();
}

uint64_t Unicode.CanonicalCombiningClass.rawValue.getter()
{
  return MEMORY[0x18961AB60]();
}

uint64_t type metadata accessor for Unicode.CanonicalCombiningClass()
{
  return MEMORY[0x18961AB68]();
}

Swift::UInt8 __swiftcall Unicode.UTF8.ForwardParser._invalidLength()()
{
  return MEMORY[0x18961AB80]();
}

uint64_t type metadata accessor for Unicode._NFD.Iterator()
{
  return MEMORY[0x18961ABC8]();
}

uint64_t type metadata accessor for Unicode._NFD()
{
  return MEMORY[0x18961ABD8]();
}

uint64_t Unicode.Scalar.Properties._caseFolded.getter()
{
  return MEMORY[0x18961AC30]();
}

uint64_t Unicode.Scalar.Properties.isWhitespace.getter()
{
  return MEMORY[0x18961AC78]();
}

uint64_t Unicode.Scalar.Properties.numericValue.getter()
{
  return MEMORY[0x18961AC80]();
}

uint64_t Unicode.Scalar.Properties.generalCategory.getter()
{
  return MEMORY[0x18961ACB8]();
}

uint64_t Unicode.Scalar.Properties.lowercaseMapping.getter()
{
  return MEMORY[0x18961ACF0]();
}

uint64_t Unicode.Scalar.Properties.titlecaseMapping.getter()
{
  return MEMORY[0x18961ACF8]();
}

uint64_t Unicode.Scalar.Properties.canonicalCombiningClass.getter()
{
  return MEMORY[0x18961AD78]();
}

uint64_t type metadata accessor for Unicode.Scalar.Properties()
{
  return MEMORY[0x18961ADF0]();
}

uint64_t Unicode.Scalar.properties.getter()
{
  return MEMORY[0x18961AE00]();
}

uint64_t Unicode.Scalar.UTF8View.subscript.getter()
{
  return MEMORY[0x18961AE20]();
}

uint64_t Unicode.Scalar.UTF16View.subscript.getter()
{
  return MEMORY[0x18961AE28]();
}

uint64_t Duration.components.getter()
{
  return MEMORY[0x18961AE58]();
}

uint64_t Duration.init(secondsComponent:attosecondsComponent:)()
{
  return MEMORY[0x18961AE60]();
}

uint64_t static Duration./ infix<A>(_:_:)()
{
  return MEMORY[0x18961AE68]();
}

uint64_t static Duration./ infix(_:_:)()
{
  return MEMORY[0x18961AE70]();
}

uint64_t static Duration.< infix(_:_:)()
{
  return MEMORY[0x18961AE78]();
}

uint64_t static Duration.* infix(_:_:)()
{
  return MEMORY[0x18961AE80]();
}

uint64_t static Duration.* infix<A>(_:_:)()
{
  return MEMORY[0x18961AE88]();
}

uint64_t static Duration.+ infix(_:_:)()
{
  return MEMORY[0x18961AE90]();
}

uint64_t static Duration.- infix(_:_:)()
{
  return MEMORY[0x18961AE98]();
}

uint64_t static Duration.== infix(_:_:)()
{
  return MEMORY[0x18961AEA0]();
}

uint64_t static Duration.-= infix(_:_:)()
{
  return MEMORY[0x18961AEA8]();
}

uint64_t static Duration.zero.getter()
{
  return MEMORY[0x18961AEB8]();
}

uint64_t static Duration.seconds(_:)()
{
  return MEMORY[0x18961AEC0]();
}

uint64_t RangeSet.ranges.getter()
{
  return MEMORY[0x18961AF00]();
}

uint64_t RangeSet.init<A>(_:)()
{
  return MEMORY[0x18961AF10]();
}

uint64_t _Pointer.debugDescription.getter()
{
  return MEMORY[0x18961AF38]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x18961AF48]();
}

uint64_t dispatch thunk of CodingKey.init(stringValue:)()
{
  return MEMORY[0x18961AF50]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x18961AF60]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x18961AF68]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x18961AF88]();
}

uint64_t getVaList(_:)()
{
  return MEMORY[0x18961AF90]();
}

CFAbsoluteTime CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTime at, CFTimeZoneRef tz, CFGregorianUnits *units)
{
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

SInt32 CFAbsoluteTimeGetDayOfWeek(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1896025B8](tz, at);
}

SInt32 CFAbsoluteTimeGetDayOfYear(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  return MEMORY[0x1896025C0](tz, at);
}

CFGregorianUnits *__cdecl CFAbsoluteTimeGetDifferenceAsGregorianUnits( CFGregorianUnits *__return_ptr retstr, CFAbsoluteTime at1, CFAbsoluteTime at2, CFTimeZoneRef tz, CFOptionFlags unitFlags)
{
  return (CFGregorianUnits *)MEMORY[0x1896025C8](retstr, tz, unitFlags, at1, at2);
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1896025D0](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1896025E0](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFAttributedStringRef CFAttributedStringCreateCopy(CFAllocatorRef alloc, CFAttributedStringRef aStr)
{
  return (CFAttributedStringRef)MEMORY[0x1896026E8](alloc, aStr);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutableCopy( CFAllocatorRef alloc, CFIndex maxLength, CFAttributedStringRef aStr)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1896026F0](alloc, maxLength, aStr);
}

CFAttributedStringRef CFAttributedStringCreateWithSubstring( CFAllocatorRef alloc, CFAttributedStringRef aStr, CFRange range)
{
  return (CFAttributedStringRef)MEMORY[0x1896026F8](alloc, aStr, range.location, range.length);
}

CFTypeRef CFAttributedStringGetAttribute( CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x189602700](aStr, loc, attrName, effectiveRange);
}

CFTypeRef CFAttributedStringGetAttributeAndLongestEffectiveRange( CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFTypeRef)MEMORY[0x189602708](aStr, loc, attrName, inRange.location, inRange.length, longestEffectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributes( CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x189602710](aStr, loc, effectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributesAndLongestEffectiveRange( CFAttributedStringRef aStr, CFIndex loc, CFRange inRange, CFRange *longestEffectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x189602718](aStr, loc, inRange.location, inRange.length, longestEffectiveRange);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x189602720](aStr);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x189602728]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x189602730](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x189602740](allocator, capacity, callBacks);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x189602748](theBag, value);
}

CFTypeID CFBagGetTypeID(void)
{
  return MEMORY[0x189602750]();
}

const void *__cdecl CFBagGetValue(CFBagRef theBag, const void *value)
{
  return (const void *)MEMORY[0x189602758](theBag, value);
}

void CFBagRemoveAllValues(CFMutableBagRef theBag)
{
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFURLRef CFBundleCopyAuxiliaryExecutableURL(CFBundleRef bundle, CFStringRef executableName)
{
  return (CFURLRef)MEMORY[0x1896027D8](bundle, executableName);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027E0](bundle);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1896027E8](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027F0](bundle);
}

CFArrayRef CFBundleCopyExecutableArchitectures(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1896027F8](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602800](bundle);
}

uint64_t CFBundleCopyLocalizationForLocalizationInfo()
{
  return MEMORY[0x189602818]();
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x189602820](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString( CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x189602828](bundle, key, value, tableName);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x189602830]();
}

uint64_t CFBundleCopyLocalizedStringTableForLocalization()
{
  return MEMORY[0x189602838]();
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x189602840](locArray);
}

CFURLRef CFBundleCopyPrivateFrameworksURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602848](bundle);
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x189602858](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFURLRef CFBundleCopyResourceURLInDirectory( CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602860](bundleURL, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfType(CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x189602868](bundle, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfTypeForLocalization( CFBundleRef bundle, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFArrayRef)MEMORY[0x189602870](bundle, resourceType, subDirName, localizationName);
}

CFArrayRef CFBundleCopyResourceURLsOfTypeInDirectory( CFURLRef bundleURL, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFArrayRef)MEMORY[0x189602878](bundleURL, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602880](bundle);
}

CFURLRef CFBundleCopySharedFrameworksURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602888](bundle);
}

CFURLRef CFBundleCopySharedSupportURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602890](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1896028A0](allocator, bundleURL);
}

CFStringRef CFBundleGetDevelopmentRegion(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028C0](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1896028D8](bundle);
}

CFDictionaryRef CFBundleGetLocalInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1896028E0](bundle);
}

uint64_t CFBundleGetLocalizationInfoForLocalization()
{
  return MEMORY[0x1896028E8]();
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1896028F0]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

UInt32 CFBundleGetVersionNumber(CFBundleRef bundle)
{
  return MEMORY[0x189602910](bundle);
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return MEMORY[0x189602918](bundle);
}

Boolean CFBundlePreflightExecutable(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x189602928](bundle, error);
}

void CFBundleUnloadExecutable(CFBundleRef bundle)
{
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFDataRef CFCharacterSetCreateBitmapRepresentation(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFDataRef)MEMORY[0x189602978](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x189602980](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x189602988](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x189602990](alloc);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x189602998](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithBitmapRepresentation(CFAllocatorRef alloc, CFDataRef theData)
{
  return (CFCharacterSetRef)MEMORY[0x1896029A0](alloc, theData);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange)
{
  return (CFCharacterSetRef)MEMORY[0x1896029A8](alloc, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1896029B0](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1896029B8](theSetIdentifier);
}

CFTypeID CFCharacterSetGetTypeID(void)
{
  return MEMORY[0x1896029C0]();
}

Boolean CFCharacterSetHasMemberInPlane(CFCharacterSetRef theSet, CFIndex thePlane)
{
  return MEMORY[0x1896029C8](theSet, thePlane);
}

void CFCharacterSetIntersect(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1896029E0](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1896029E8](theSet, *(void *)&theChar);
}

Boolean CFCharacterSetIsSupersetOfSet(CFCharacterSetRef theSet, CFCharacterSetRef theOtherset)
{
  return MEMORY[0x1896029F0](theSet, theOtherset);
}

void CFCharacterSetRemoveCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

void CFCharacterSetRemoveCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x189602A20]();
}

uint64_t CFCopySystemVersionString()
{
  return MEMORY[0x189602A30]();
}

uint64_t CFCopyUserName()
{
  return MEMORY[0x189602A40]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x189602AF8](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate( CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x189602B00](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate( CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x189602B08](allocator, tmplate, options, locale);
}

CFDateRef CFDateFormatterCreateDateFromString( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x189602B10](allocator, formatter, string, rangep);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter( CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x189602B18](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x189602B20](allocator, formatter, at);
}

CFStringRef CFDateFormatterCreateStringWithDate( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x189602B28](allocator, formatter, date);
}

Boolean CFDateFormatterGetAbsoluteTimeFromString( CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep, CFAbsoluteTime *atp)
{
  return MEMORY[0x189602B30](formatter, string, rangep, atp);
}

CFDateFormatterStyle CFDateFormatterGetDateStyle(CFDateFormatterRef formatter)
{
  return MEMORY[0x189602B38](formatter);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x189602B40](formatter);
}

CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter)
{
  return (CFLocaleRef)MEMORY[0x189602B48](formatter);
}

CFDateFormatterStyle CFDateFormatterGetTimeStyle(CFDateFormatterRef formatter)
{
  return MEMORY[0x189602B50](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

uint64_t CFDictionaryGetKeyIfPresent()
{
  return MEMORY[0x189602BD8]();
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

uint64_t CFErrorCopyCallBackBlockForDomain()
{
  return MEMORY[0x189602C40]();
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x189602C58](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x189602C80]();
}

uint64_t CFErrorSetCallBackBlockForDomain()
{
  return MEMORY[0x189602C88]();
}

Boolean CFFileSecurityGetOwner(CFFileSecurityRef fileSec, uid_t *owner)
{
  return MEMORY[0x189602CF8](fileSec, owner);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x189602D20](cf);
}

uint64_t CFGetSystemUptime()
{
  return MEMORY[0x189602D28]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  return result;
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x189602D58]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x189602D60]();
}

CFStringRef CFLocaleCopyDisplayNameForPropertyValue( CFLocaleRef displayLocale, CFLocaleKey key, CFStringRef value)
{
  return (CFStringRef)MEMORY[0x189602D68](displayLocale, key, value);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x189602D78](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString( CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x189602D80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString( CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x189602D88](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier( CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x189602D90](allocator, localeID);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x189602D98]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortGetContext(CFMachPortRef port, CFMachPortContext *context)
{
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x189602DD0](port);
}

CFTypeID CFMachPortGetTypeID(void)
{
  return MEMORY[0x189602DD8]();
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

Boolean CFMachPortIsValid(CFMachPortRef port)
{
  return MEMORY[0x189602DE8](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

uint64_t CFMergeSortArray()
{
  return MEMORY[0x189602E00]();
}

CFMessagePortRef CFMessagePortCreateLocal( CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMessagePortRef)MEMORY[0x189602E08](allocator, name, callout, context, shouldFreeInfo);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return (CFMessagePortRef)MEMORY[0x189602E10](allocator, name);
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource( CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602E18](allocator, local, order);
}

CFStringRef CFMessagePortGetName(CFMessagePortRef ms)
{
  return (CFStringRef)MEMORY[0x189602E20](ms);
}

void CFMessagePortInvalidate(CFMessagePortRef ms)
{
}

Boolean CFMessagePortIsValid(CFMessagePortRef ms)
{
  return MEMORY[0x189602E30](ms);
}

SInt32 CFMessagePortSendRequest( CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef *returnData)
{
  return MEMORY[0x189602E38](remote, *(void *)&msgid, data, replyMode, returnData, sendTimeout, rcvTimeout);
}

Boolean CFMessagePortSetName(CFMessagePortRef ms, CFStringRef newName)
{
  return MEMORY[0x189602E40](ms, newName);
}

void CFNotificationCenterAddObserver( CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E60]();
}

void CFNotificationCenterPostNotification( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x189602E88]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeRef CFNumberFormatterCopyProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x189602EA8](formatter, key);
}

CFNumberFormatterRef CFNumberFormatterCreate( CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x189602EB0](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString( CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x189602EB8](allocator, formatter, string, rangep, options);
}

CFStringRef CFNumberFormatterCreateStringWithNumber( CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberRef number)
{
  return (CFStringRef)MEMORY[0x189602EC0](allocator, formatter, number);
}

CFStringRef CFNumberFormatterGetFormat(CFNumberFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x189602EC8](formatter);
}

CFLocaleRef CFNumberFormatterGetLocale(CFNumberFormatterRef formatter)
{
  return (CFLocaleRef)MEMORY[0x189602ED0](formatter);
}

CFNumberFormatterStyle CFNumberFormatterGetStyle(CFNumberFormatterRef formatter)
{
  return MEMORY[0x189602ED8](formatter);
}

void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString)
{
}

void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key, CFTypeRef value)
{
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x189602EF0](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x189602F20](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x189602F58](applicationID);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x189602F60](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFArrayRef CFPreferencesCopyApplicationList(CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x189602F70](userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue( CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x189602FC0](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x189603010](plist, format);
}

CFIndex CFPropertyListWrite( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x189603018](propertyList, stream, format, options, error);
}

CFIndex CFPropertyListWriteToStream( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x189603020](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x189603038](stream);
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603040](stream, propertyName);
}

uint64_t CFReadStreamCreateWithData()
{
  return MEMORY[0x189603058]();
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

const UInt8 *__cdecl CFReadStreamGetBuffer(CFReadStreamRef stream, CFIndex maxBytesToRead, CFIndex *numBytesRead)
{
  return (const UInt8 *)MEMORY[0x189603068](stream, maxBytesToRead, numBytesRead);
}

CFStreamError CFReadStreamGetError(CFReadStreamRef stream)
{
  CFIndex v1 = MEMORY[0x189603070](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

CFStreamStatus CFReadStreamGetStatus(CFReadStreamRef stream)
{
  return MEMORY[0x189603080](stream);
}

CFTypeID CFReadStreamGetTypeID(void)
{
  return MEMORY[0x189603088]();
}

Boolean CFReadStreamHasBytesAvailable(CFReadStreamRef stream)
{
  return MEMORY[0x189603090](stream);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1896030A0](stream, buffer, bufferLength);
}

void CFReadStreamScheduleWithRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

Boolean CFReadStreamSetClient( CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x1896030B0](stream, streamEvents, clientCB, clientContext);
}

Boolean CFReadStreamSetProperty( CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x1896030C0](stream, propertyName, propertyValue);
}

void CFReadStreamUnscheduleFromRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  return MEMORY[0x189603120](rl, timer, mode);
}

CFArrayRef CFRunLoopCopyAllModes(CFRunLoopRef rl)
{
  return (CFArrayRef)MEMORY[0x189603128](rl);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x189603130](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x189603140]();
}

CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFRunLoopMode mode)
{
  return result;
}

CFRunLoopObserverRef CFRunLoopObserverCreate( CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x189603158](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverGetContext(CFRunLoopObserverRef observer, CFRunLoopObserverContext *context)
{
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode( CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x189603198](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate( CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1896031A0](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate( CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1896031D8](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerGetContext(CFRunLoopTimerRef timer, CFRunLoopTimerContext *context)
{
}

CFTimeInterval CFRunLoopTimerGetInterval(CFRunLoopTimerRef timer)
{
  return result;
}

CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer)
{
  return result;
}

CFTimeInterval CFRunLoopTimerGetTolerance(CFRunLoopTimerRef timer)
{
  return result;
}

CFTypeID CFRunLoopTimerGetTypeID(void)
{
  return MEMORY[0x189603208]();
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

Boolean CFRunLoopTimerIsValid(CFRunLoopTimerRef timer)
{
  return MEMORY[0x189603218](timer);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFRunLoopTimerSetTolerance(CFRunLoopTimerRef timer, CFTimeInterval tolerance)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x189603280](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

uint64_t CFSortIndexes()
{
  return MEMORY[0x189603328]();
}

uint64_t CFStorageCreate()
{
  return MEMORY[0x189603330]();
}

uint64_t CFStorageCreateWithSubrange()
{
  return MEMORY[0x189603338]();
}

uint64_t CFStorageDeleteValues()
{
  return MEMORY[0x189603340]();
}

uint64_t CFStorageGetConstValueAtIndex()
{
  return MEMORY[0x189603348]();
}

uint64_t CFStorageGetCount()
{
  return MEMORY[0x189603350]();
}

uint64_t CFStorageGetValueAtIndex()
{
  return MEMORY[0x189603358]();
}

uint64_t CFStorageGetValues()
{
  return MEMORY[0x189603360]();
}

uint64_t CFStorageInsertValues()
{
  return MEMORY[0x189603368]();
}

void CFStreamCreateBoundPair( CFAllocatorRef alloc, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream, CFIndex transferBufferSize)
{
}

void CFStreamCreatePairWithSocketToHost( CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringCapitalize(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFComparisonResult CFStringCompareWithOptions( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C8](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFComparisonResult CFStringCompareWithOptionsAndLocale( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1896033D0]( theString1,  theString2,  rangeToCompare.location,  rangeToCompare.length,  compareOptions,  locale);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1896033D8](*(void *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1896033E0](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1896033F0](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1896033F8](encoding);
}

CFArrayRef CFStringCreateArrayWithFindResults( CFAllocatorRef alloc, CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return (CFArrayRef)MEMORY[0x189603408]( alloc,  theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings( CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x189603410](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation( CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603428](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy( CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x189603440](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateStringWithValidatedFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef validFormatSpecifiers, CFStringRef format, va_list arguments, CFErrorRef *errorPtr)
{
  return (CFStringRef)MEMORY[0x189603448](alloc, formatOptions, validFormatSpecifiers, format, arguments, errorPtr);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603458]( alloc,  bytes,  numBytes,  *(void *)&encoding,  isExternalRepresentation,  contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x189603478](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy( CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603480](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithPascalString( CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1896034A0](alloc, pStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet( CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D8]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  result);
}

Boolean CFStringFindWithOptionsAndLocale( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFLocaleRef locale, CFRange *result)
{
  return MEMORY[0x1896034E0]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  locale,  result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x189603520](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

const CFStringEncoding *CFStringGetListOfAvailableEncodings(void)
{
  return (const CFStringEncoding *)MEMORY[0x189603550]();
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x189603560](string);
}

CFStringRef CFStringGetNameOfEncoding(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603568](*(void *)&encoding);
}

uint64_t CFStringGetRangeOfCharacterClusterAtIndex()
{
  return MEMORY[0x189603578]();
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x189603588]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t CFStringHashCString()
{
  return MEMORY[0x1896035B0]();
}

uint64_t CFStringHashCharacters()
{
  return MEMORY[0x1896035B8]();
}

uint64_t CFStringHashISOLatin1CString()
{
  return MEMORY[0x1896035C0]();
}

uint64_t CFStringHashNSString()
{
  return MEMORY[0x1896035C8]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1896035D8](*(void *)&encoding);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

uint64_t CFStringOpenUText()
{
  return MEMORY[0x1896035F0]();
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

void CFStringSetExternalCharactersNoCopy( CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x189603618](tokenizer);
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x189603620](string, range.location, range.length);
}

CFStringTokenizerRef CFStringTokenizerCreate( CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x189603630](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x189603638](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x189603640](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x189603650](string, range, transform, reverse);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x189603670]();
}

Boolean CFURLCanBeDecomposed(CFURLRef anURL)
{
  return MEMORY[0x189603698](anURL);
}

void CFURLClearResourcePropertyCache(CFURLRef url)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1896036C0](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036C8](anURL);
}

CFStringRef CFURLCopyNetLocation(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036D8](anURL);
}

CFStringRef CFURLCopyParameterString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1896036E0](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036F0](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x189603700](anURL, charactersToLeaveEscaped);
}

Boolean CFURLCopyResourcePropertyForKey( CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x189603708](url, key, propertyValueTypeRefPtr, error);
}

CFStringRef CFURLCopyResourceSpecifier(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603710](anURL);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603718](anURL);
}

CFStringRef CFURLCopyUserName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603728](anURL);
}

CFURLRef CFURLCreateAbsoluteURLWithBytes( CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x189603730]( alloc,  relativeURLBytes,  length,  *(void *)&encoding,  baseURL,  useCompatibilityMode);
}

CFURLRef CFURLCreateByResolvingBookmarkData( CFAllocatorRef allocator, CFDataRef bookmark, CFURLBookmarkResolutionOptions options, CFURLRef relativeToURL, CFArrayRef resourcePropertiesToInclude, Boolean *isStale, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x189603740]( allocator,  bookmark,  options,  relativeToURL,  resourcePropertiesToInclude,  isStale,  error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x189603750](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x189603758](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x189603760](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x189603788](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes( CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1896037A0]( allocator,  originalString,  charactersToLeaveUnescaped,  legalURLCharactersToBeEscaped,  *(void *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes( CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1896037A8](allocator, originalString, charactersToLeaveEscaped);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapesUsingEncoding( CFAllocatorRef allocator, CFStringRef origString, CFStringRef charsToLeaveEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1896037B0](allocator, origString, charsToLeaveEscaped, *(void *)&encoding);
}

CFURLRef CFURLCreateWithBytes( CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037B8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037C8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037D0](allocator, URLString, baseURL);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForDirectoryURL( CFAllocatorRef alloc, CFURLRef directoryURL, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1896037D8](alloc, directoryURL, option, propertyKeys);
}

CFIndex CFURLEnumeratorGetDescendentLevel(CFURLEnumeratorRef enumerator)
{
  return MEMORY[0x1896037E8](enumerator);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL( CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1896037F0](enumerator, url, error);
}

void CFURLEnumeratorSkipDescendents(CFURLEnumeratorRef enumerator)
{
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x189603800](anURL);
}

CFRange CFURLGetByteRangeForComponent( CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFIndex v3 = MEMORY[0x189603808](url, component, rangeIncludingSeparators);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x189603810](url, buffer, bufferLength);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

SInt32 CFURLGetPortNumber(CFURLRef anURL)
{
  return MEMORY[0x189603820](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603828](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x189603838](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x189603848](url, error);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

uint64_t CFUniCharCompatibilityDecompose()
{
  return MEMORY[0x1896038B8]();
}

uint64_t CFUniCharDecomposeCharacter()
{
  return MEMORY[0x1896038C0]();
}

Boolean CFWriteStreamCanAcceptBytes(CFWriteStreamRef stream)
{
  return MEMORY[0x189603908](stream);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x189603918](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603920](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x189603930](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithBuffer(CFAllocatorRef alloc, UInt8 *buffer, CFIndex bufferCapacity)
{
  return (CFWriteStreamRef)MEMORY[0x189603938](alloc, buffer, bufferCapacity);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x189603940](alloc, fileURL);
}

CFStreamError CFWriteStreamGetError(CFWriteStreamRef stream)
{
  CFIndex v1 = MEMORY[0x189603948](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

CFStreamStatus CFWriteStreamGetStatus(CFWriteStreamRef stream)
{
  return MEMORY[0x189603950](stream);
}

CFTypeID CFWriteStreamGetTypeID(void)
{
  return MEMORY[0x189603958]();
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

void CFWriteStreamScheduleWithRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

Boolean CFWriteStreamSetClient( CFWriteStreamRef stream, CFOptionFlags streamEvents, CFWriteStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x189603970](stream, streamEvents, clientCB, clientContext);
}

Boolean CFWriteStreamSetProperty( CFWriteStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x189603980](stream, propertyName, propertyValue);
}

void CFWriteStreamUnscheduleFromRunLoop( CFWriteStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x189603998](stream, buffer, bufferLength);
}

IOReturn IOPMAssertionCreateWithName( CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1896083A8](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1896083D0](*(void *)&AssertionID);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x189603A50](typePtr, sizep, alignp);
}

void OSSpinLockLock(OSSpinLock *__lock)
{
}

void OSSpinLockUnlock(OSSpinLock *__lock)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

BOOL _Block_has_signature(void *aBlock)
{
  return MEMORY[0x1895F8728](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1895F8758](aBlock);
}

uint64_t _CFAppVersionCheck()
{
  return MEMORY[0x189604078]();
}

uint64_t _CFAppVersionCheckLessThan()
{
  return MEMORY[0x189604080]();
}

uint64_t _CFArraySetCapacity()
{
  return MEMORY[0x189604088]();
}

uint64_t _CFAttributedStringCheckAndReplace()
{
  return MEMORY[0x189604090]();
}

uint64_t _CFAttributedStringCheckAndReplaceAttributed()
{
  return MEMORY[0x189604098]();
}

uint64_t _CFAttributedStringCheckAndSetAttribute()
{
  return MEMORY[0x1896040A0]();
}

uint64_t _CFAttributedStringCheckAndSetAttributes()
{
  return MEMORY[0x1896040A8]();
}

uint64_t _CFAttributedStringGetLength()
{
  return MEMORY[0x1896040B0]();
}

uint64_t _CFAutoreleasePoolAddObject()
{
  return MEMORY[0x1896040B8]();
}

uint64_t _CFAutoreleasePoolPop()
{
  return MEMORY[0x1896040C0]();
}

uint64_t _CFAutoreleasePoolPrintPools()
{
  return MEMORY[0x1896040C8]();
}

uint64_t _CFAutoreleasePoolPush()
{
  return MEMORY[0x1896040D0]();
}

uint64_t _CFBagFastEnumeration()
{
  return MEMORY[0x1896040D8]();
}

uint64_t _CFBagGetUniqueCount()
{
  return MEMORY[0x1896040E0]();
}

uint64_t _CFBundleAddResourceURL()
{
  return MEMORY[0x1896040E8]();
}

uint64_t _CFBundleCopyFilteredLocalizedStringsForAllLocalizations()
{
  return MEMORY[0x189604110]();
}

uint64_t _CFBundleCopyFilteredLocalizedStringsForAllLocalizationsForURL()
{
  return MEMORY[0x189604118]();
}

uint64_t _CFBundleCopyFindResources()
{
  return MEMORY[0x189604120]();
}

uint64_t _CFBundleCopyLocalizedStringForLocalizationAndTableURL()
{
  return MEMORY[0x189604130]();
}

uint64_t _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption()
{
  return MEMORY[0x189604138]();
}

uint64_t _CFBundleCopyLocalizedStringForLocalizations()
{
  return MEMORY[0x189604140]();
}

uint64_t _CFBundleCopyWrappedBundleURL()
{
  return MEMORY[0x189604148]();
}

uint64_t _CFBundleCopyWrapperContainerURL()
{
  return MEMORY[0x189604150]();
}

uint64_t _CFBundleCreateError()
{
  return MEMORY[0x189604158]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x189604168]();
}

uint64_t _CFBundleFlushBundleCaches()
{
  return MEMORY[0x189604180]();
}

uint64_t _CFBundleGetBundleWithIdentifierAndLibraryName()
{
  return MEMORY[0x189604188]();
}

uint64_t _CFBundleGetBundleWithIdentifierWithHint()
{
  return MEMORY[0x189604190]();
}

uint64_t _CFBundleGetMappedStringsFile()
{
  return MEMORY[0x189604198]();
}

uint64_t _CFBundleLoadExecutableAndReturnError()
{
  return MEMORY[0x1896041A0]();
}

uint64_t _CFBundleRemoveResourceURL()
{
  return MEMORY[0x1896041A8]();
}

uint64_t _CFBundleSearchForLocalizedString()
{
  return MEMORY[0x1896041B0]();
}

uint64_t _CFBundleSetupXPCBootstrap()
{
  return MEMORY[0x1896041B8]();
}

uint64_t _CFBundleSetupXPCBootstrapWithLanguages()
{
  return MEMORY[0x1896041C0]();
}

uint64_t _CFCalendarGetMidnightNoteCount()
{
  return MEMORY[0x1896041C8]();
}

uint64_t _CFCalendarGetUnitsFromDateFormat()
{
  return MEMORY[0x1896041D0]();
}

uint64_t _CFCharacterSetCompact()
{
  return MEMORY[0x1896041D8]();
}

uint64_t _CFCharacterSetCreateKeyedCodingString()
{
  return MEMORY[0x1896041E0]();
}

uint64_t _CFCharacterSetFast()
{
  return MEMORY[0x1896041E8]();
}

uint64_t _CFCharacterSetGetKeyedCodingBuiltinType()
{
  return MEMORY[0x1896041F0]();
}

uint64_t _CFCharacterSetGetKeyedCodingRange()
{
  return MEMORY[0x1896041F8]();
}

uint64_t _CFCharacterSetGetKeyedCodingType()
{
  return MEMORY[0x189604200]();
}

uint64_t _CFCharacterSetIsInverted()
{
  return MEMORY[0x189604208]();
}

uint64_t _CFCharacterSetIsMutable()
{
  return MEMORY[0x189604210]();
}

uint64_t _CFCharacterSetIsValidRange()
{
  return MEMORY[0x189604218]();
}

uint64_t _CFCharacterSetSetIsInverted()
{
  return MEMORY[0x189604220]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x189604240]();
}

uint64_t _CFCreateArrayStorage()
{
  return MEMORY[0x189604250]();
}

uint64_t _CFCreateCharacterSetFromUSet()
{
  return MEMORY[0x189604258]();
}

uint64_t _CFDataFindBytes()
{
  return MEMORY[0x189604260]();
}

uint64_t _CFDateFormatterCreateAttributedStringAndFieldsWithAbsoluteTime()
{
  return MEMORY[0x189604268]();
}

uint64_t _CFDateFormatterCreateSkeletonFromTemplate()
{
  return MEMORY[0x189604270]();
}

uint64_t _CFDictionarySetCapacity()
{
  return MEMORY[0x189604278]();
}

uint64_t _CFDiscorporateMemoryAllocate()
{
  return MEMORY[0x189604280]();
}

uint64_t _CFDiscorporateMemoryDeallocate()
{
  return MEMORY[0x189604288]();
}

uint64_t _CFDiscorporateMemoryDematerialize()
{
  return MEMORY[0x189604290]();
}

uint64_t _CFDiscorporateMemoryMaterialize()
{
  return MEMORY[0x189604298]();
}

uint64_t _CFDoExceptionOperation()
{
  return MEMORY[0x1896042A0]();
}

uint64_t _CFErrorCreateCallStackReturnAddresses()
{
  return MEMORY[0x1896042A8]();
}

uint64_t _CFErrorCreateDebugDescription()
{
  return MEMORY[0x1896042B0]();
}

uint64_t _CFErrorCreateLocalizedDescription()
{
  return MEMORY[0x1896042B8]();
}

uint64_t _CFErrorCreateLocalizedFailureReason()
{
  return MEMORY[0x1896042C0]();
}

uint64_t _CFErrorCreateLocalizedRecoverySuggestion()
{
  return MEMORY[0x1896042C8]();
}

uint64_t _CFErrorCreateRedactedDescription()
{
  return MEMORY[0x1896042D0]();
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1896042D8]();
}

uint64_t _CFExtensionUniCharsIsValidToAppend()
{
  return MEMORY[0x1896042E0]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponentUniChars()
{
  return MEMORY[0x189604308]();
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x189604310]();
}

uint64_t _CFGetTSD()
{
  return MEMORY[0x189604318]();
}

uint64_t _CFHostGetTopLevelDomain()
{
  return MEMORY[0x189602038]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x189604320]();
}

uint64_t _CFKeyedArchiverUIDCreate()
{
  return MEMORY[0x189604328]();
}

uint64_t _CFKeyedArchiverUIDGetTypeID()
{
  return MEMORY[0x189604330]();
}

uint64_t _CFKeyedArchiverUIDGetValue()
{
  return MEMORY[0x189604338]();
}

uint64_t _CFListFormatterCreate()
{
  return MEMORY[0x189604340]();
}

uint64_t _CFListFormatterCreateStringByJoiningStrings()
{
  return MEMORY[0x189604348]();
}

uint64_t _CFLocaleCopyPreferred()
{
  return MEMORY[0x189604350]();
}

uint64_t _CFLocaleCopyPreferredLanguagesForCurrentUser()
{
  return MEMORY[0x189604358]();
}

uint64_t _CFLocaleCopyPreferredMeasurementSystem()
{
  return MEMORY[0x189604360]();
}

uint64_t _CFLocaleCopyPreferredTemperatureUnit()
{
  return MEMORY[0x189604368]();
}

uint64_t _CFLocaleGetCalendarDirection()
{
  return MEMORY[0x189604370]();
}

uint64_t _CFLocaleGetNoteCount()
{
  return MEMORY[0x189604378]();
}

uint64_t _CFLocaleSetPreferredMeasurementSystem()
{
  return MEMORY[0x189604380]();
}

uint64_t _CFLocaleSetPreferredTemperatureUnit()
{
  return MEMORY[0x189604388]();
}

uint64_t _CFLogvEx3()
{
  return MEMORY[0x189604390]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x189604398]();
}

uint64_t _CFNetworkErrorCopyLocalizedDescriptionWithHostname()
{
  return MEMORY[0x189602048]();
}

uint64_t _CFNetworkErrorGetLocalizedFailureReason()
{
  return MEMORY[0x189602050]();
}

uint64_t _CFNetworkErrorGetLocalizedRecoverySuggestion()
{
  return MEMORY[0x189602058]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1896043A8]();
}

uint64_t _CFNonObjCHash()
{
  return MEMORY[0x1896043B0]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1896043B8]();
}

uint64_t _CFNonObjCRetain()
{
  return MEMORY[0x1896043C0]();
}

uint64_t _CFNonObjCStringGetBytes()
{
  return MEMORY[0x1896043C8]();
}

uint64_t _CFNotificationCenterInitializeDependentNotificationIfNecessary()
{
  return MEMORY[0x1896043D0]();
}

uint64_t _CFNotificationCenterRegisterDependentNotificationList()
{
  return MEMORY[0x1896043D8]();
}

uint64_t _CFNumberFormatterGetFormatter()
{
  return MEMORY[0x1896043E0]();
}

uint64_t _CFNumberGetType2()
{
  return MEMORY[0x1896043E8]();
}

uint64_t _CFOperatingSystemVersionGetCurrent()
{
  return MEMORY[0x1896043F0]();
}

uint64_t _CFOperatingSystemVersionIsAtLeastVersion()
{
  return MEMORY[0x1896043F8]();
}

uint64_t _CFPredicatePolicyData()
{
  return MEMORY[0x189604400]();
}

uint64_t _CFPredicatePolicyData_getFlags()
{
  return MEMORY[0x189604408]();
}

uint64_t _CFPredicatePolicyData_setFlags()
{
  return MEMORY[0x189604410]();
}

uint64_t _CFPredicatePolicyRestrictedClasses()
{
  return MEMORY[0x189604418]();
}

uint64_t _CFPredicatePolicyRestrictedSelectors()
{
  return MEMORY[0x189604420]();
}

uint64_t _CFPreferencesAddSuitePreferencesToAppWithContainer()
{
  return MEMORY[0x189604428]();
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x189604430]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x189604438]();
}

uint64_t _CFPreferencesGetAppBooleanValueWithContainer()
{
  return MEMORY[0x189604448]();
}

uint64_t _CFPreferencesGetAppIntegerValueWithContainer()
{
  return MEMORY[0x189604450]();
}

uint64_t _CFPreferencesRegisterStandardUserDefaultsExists()
{
  return MEMORY[0x189604460]();
}

uint64_t _CFPreferencesRemoveSuitePreferencesFromAppWithContainer()
{
  return MEMORY[0x189604468]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x189604478]();
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x189604480]();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return MEMORY[0x189604488]();
}

uint64_t _CFPrefsCopyAppDictionaryWithContainer()
{
  return MEMORY[0x189604490]();
}

uint64_t _CFPrefsRegisterUserDefaultsInstance()
{
  return MEMORY[0x189604498]();
}

uint64_t _CFPrefsSynchronizeForProcessTermination()
{
  return MEMORY[0x1896044A8]();
}

uint64_t _CFPrefsUnregisterUserDefaultsInstance()
{
  return MEMORY[0x1896044B0]();
}

uint64_t _CFProcessPath()
{
  return MEMORY[0x1896044B8]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1896044C8]();
}

uint64_t _CFPropertyListCreateFromXMLData()
{
  return MEMORY[0x1896044D0]();
}

uint64_t _CFPropertyListCreateFromXMLString()
{
  return MEMORY[0x1896044D8]();
}

uint64_t _CFPropertyListCreateXMLDataWithExtras()
{
  return MEMORY[0x1896044E0]();
}

uint64_t _CFReadStreamDeallocate()
{
  return MEMORY[0x1896044E8]();
}

uint64_t _CFReadStreamGetClient()
{
  return MEMORY[0x1896044F0]();
}

uint64_t _CFReadStreamInitialize()
{
  return MEMORY[0x1896044F8]();
}

uint64_t _CFRelativeDateTimeFormatterCreate()
{
  return MEMORY[0x189604508]();
}

uint64_t _CFRelativeDateTimeFormatterCreateStringWithCalendarUnit()
{
  return MEMORY[0x189604510]();
}

uint64_t _CFRunLoop01()
{
  return MEMORY[0x189604518]();
}

uint64_t _CFRunLoopFinished()
{
  return MEMORY[0x189604528]();
}

uint64_t _CFRunLoopGet0()
{
  return MEMORY[0x189604530]();
}

uint64_t _CFRunLoopGet2()
{
  return MEMORY[0x189604538]();
}

uint64_t _CFRunLoopIsCurrent()
{
  return MEMORY[0x189604540]();
}

uint64_t _CFRunLoopModeContainsMode()
{
  return MEMORY[0x189604548]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFSetSetCapacity()
{
  return MEMORY[0x189604570]();
}

uint64_t _CFSetTSD()
{
  return MEMORY[0x189604578]();
}

uint64_t _CFStringAppendFormatAndArgumentsAux2()
{
  return MEMORY[0x189604580]();
}

uint64_t _CFStringAppendValidatedFormatAndArguments()
{
  return MEMORY[0x189604588]();
}

uint64_t _CFStringCreateByAddingPercentEncodingWithAllowedCharacters()
{
  return MEMORY[0x189604590]();
}

uint64_t _CFStringCreateByRemovingPercentEncoding()
{
  return MEMORY[0x189604598]();
}

uint64_t _CFStringCreateStringWithValidatedFormatAux()
{
  return MEMORY[0x1896045A0]();
}

uint64_t _CFStringCreateTaggedPointerString()
{
  return MEMORY[0x1896045A8]();
}

uint64_t _CFStringCreateWithFormatAndArgumentsAux2()
{
  return MEMORY[0x1896045B8]();
}

uint64_t _CFStringCreateWithFormatAndArgumentsReturningMetadata()
{
  return MEMORY[0x1896045C0]();
}

uint64_t _CFStringGetFormatSpecifierConfiguration()
{
  return MEMORY[0x1896045C8]();
}

uint64_t _CFStringValidateFormat()
{
  return MEMORY[0x1896045E0]();
}

uint64_t _CFSuddenTerminationDisable()
{
  return MEMORY[0x1896045E8]();
}

uint64_t _CFSuddenTerminationDisablingCount()
{
  return MEMORY[0x1896045F0]();
}

uint64_t _CFSuddenTerminationEnable()
{
  return MEMORY[0x1896045F8]();
}

uint64_t _CFSuddenTerminationExitIfTerminationEnabled()
{
  return MEMORY[0x189604600]();
}

uint64_t _CFSuddenTerminationExitWhenTerminationEnabled()
{
  return MEMORY[0x189604608]();
}

uint64_t _CFTimeZoneGetNoteCount()
{
  return MEMORY[0x189604610]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x189604618]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x189604620]();
}

uint64_t _CFURLComponentsGetURLFragmentAllowedCharacterSet()
{
  return MEMORY[0x189604630]();
}

uint64_t _CFURLComponentsGetURLHostAllowedCharacterSet()
{
  return MEMORY[0x189604638]();
}

uint64_t _CFURLComponentsGetURLPasswordAllowedCharacterSet()
{
  return MEMORY[0x189604640]();
}

uint64_t _CFURLComponentsGetURLPathAllowedCharacterSet()
{
  return MEMORY[0x189604648]();
}

uint64_t _CFURLComponentsGetURLQueryAllowedCharacterSet()
{
  return MEMORY[0x189604650]();
}

uint64_t _CFURLComponentsGetURLUserAllowedCharacterSet()
{
  return MEMORY[0x189604658]();
}

uint64_t _CFURLCopyComponents()
{
  return MEMORY[0x189604660]();
}

uint64_t _CFURLCopyFragment()
{
  return MEMORY[0x189604668]();
}

uint64_t _CFURLCopyHostName()
{
  return MEMORY[0x189604670]();
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x189604678]();
}

uint64_t _CFURLCopyPassword()
{
  return MEMORY[0x189604680]();
}

uint64_t _CFURLCopyPath()
{
  return MEMORY[0x189604688]();
}

uint64_t _CFURLCopyPropertiesOfPromiseAtURL()
{
  return MEMORY[0x189604698]();
}

uint64_t _CFURLCopyQueryString()
{
  return MEMORY[0x1896046A8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1896046C0]();
}

uint64_t _CFURLCopyUserName()
{
  return MEMORY[0x1896046C8]();
}

uint64_t _CFURLCreateByResolvingAliasFile()
{
  return MEMORY[0x1896046D0]();
}

uint64_t _CFURLCreateCopyAppendingPathComponent()
{
  return MEMORY[0x1896046D8]();
}

uint64_t _CFURLCreateDisplayPathComponentsArray()
{
  return MEMORY[0x1896046E0]();
}

uint64_t _CFURLCreateFromComponents()
{
  return MEMORY[0x1896046E8]();
}

uint64_t _CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys()
{
  return MEMORY[0x189604700]();
}

uint64_t _CFURLCreateWithRangesAndFlags()
{
  return MEMORY[0x189604708]();
}

uint64_t _CFURLGetEncoding()
{
  return MEMORY[0x189604740]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x189604758]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x189604760]();
}

uint64_t _CFURLNoteSecurityScopedResourceMoved()
{
  return MEMORY[0x189604768]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x189604770]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x189604780]();
}

uint64_t _CFURLReplaceObject()
{
  return MEMORY[0x1896047A0]();
}

uint64_t _CFWriteStreamDeallocate()
{
  return MEMORY[0x1896047B0]();
}

uint64_t _CFWriteStreamGetClient()
{
  return MEMORY[0x1896047B8]();
}

uint64_t _CFWriteStreamInitialize()
{
  return MEMORY[0x1896047C0]();
}

uint64_t _CFXNotificationCancelToken()
{
  return MEMORY[0x1896047D0]();
}

uint64_t _CFXNotificationCenterCopyDebugInfo()
{
  return MEMORY[0x1896047D8]();
}

uint64_t _CFXNotificationCenterCreate()
{
  return MEMORY[0x1896047E0]();
}

uint64_t _CFXNotificationCenterIsEmpty()
{
  return MEMORY[0x1896047E8]();
}

uint64_t _CFXNotificationGetSuspended()
{
  return MEMORY[0x1896047F0]();
}

uint64_t _CFXNotificationGetTaskCenter()
{
  return MEMORY[0x1896047F8]();
}

uint64_t _CFXNotificationPost()
{
  return MEMORY[0x189604800]();
}

uint64_t _CFXNotificationRegisterObserver()
{
  return MEMORY[0x189604808]();
}

uint64_t _CFXNotificationRemoveObservers()
{
  return MEMORY[0x189604810]();
}

uint64_t _CFXNotificationSetSuspended()
{
  return MEMORY[0x189604818]();
}

uint64_t _CFXPreferencesCopyDictionaryForNamedVolatileSource()
{
  return MEMORY[0x189604840]();
}

uint64_t _CFXPreferencesCopyDictionaryForSourceWithBundleID()
{
  return MEMORY[0x189604848]();
}

uint64_t _CFXPreferencesCopyVolatileSourceNames()
{
  return MEMORY[0x189604850]();
}

uint64_t _CFXPreferencesRegisterDefaultValues()
{
  return MEMORY[0x189604858]();
}

uint64_t _CFXPreferencesRemoveNamedVolatileSource()
{
  return MEMORY[0x189604860]();
}

uint64_t _CFXPreferencesReplaceValuesInNamedVolatileSource()
{
  return MEMORY[0x189604868]();
}

uint64_t _CFXPreferencesReplaceValuesInSourceWithBundleIDWithContainer()
{
  return MEMORY[0x189604870]();
}

int *_NSGetArgc(void)
{
  return (int *)MEMORY[0x1895F87B8]();
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1895F87C0]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1895F87C8]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x189604880]();
}

uint64_t _NSIsNSAttributedString()
{
  return MEMORY[0x189604888]();
}

uint64_t _NSIsNSCFConstantString()
{
  return MEMORY[0x189604890]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x189604898]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1896048A0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1896048A8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1896048B0]();
}

uint64_t _NSIsNSObject()
{
  return MEMORY[0x1896048B8]();
}

uint64_t _NSIsNSOrderedSet()
{
  return MEMORY[0x1896048C0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1896048C8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1896048D0]();
}

uint64_t _NSIsNSURL()
{
  return MEMORY[0x1896048D8]();
}

uint64_t _NSIsNSValue()
{
  return MEMORY[0x1896048E0]();
}

uint64_t _NSMessageBuilder()
{
  return MEMORY[0x1896048E8]();
}

uint64_t _NSObjectLoadWeak()
{
  return MEMORY[0x1896048F0]();
}

uint64_t _NSObjectLoadWeakRetained()
{
  return MEMORY[0x1896048F8]();
}

uint64_t _NSObjectStoreWeak()
{
  return MEMORY[0x189604900]();
}

uint64_t _NSTaggedPointerStringGetBytes()
{
  return MEMORY[0x189604908]();
}

uint64_t _SwiftCreateBridgedString()
{
  return MEMORY[0x18961AFE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __CFAllocatorRespectsHintZeroWhenAllocating()
{
  return MEMORY[0x189604910]();
}

uint64_t __CFAttributedStringMtbl()
{
  return MEMORY[0x189604918]();
}

uint64_t __CFBinaryPlistCreateObject()
{
  return MEMORY[0x189604920]();
}

uint64_t __CFBinaryPlistGetOffsetForValueFromArray2()
{
  return MEMORY[0x189604928]();
}

uint64_t __CFBinaryPlistGetOffsetForValueFromDictionary3()
{
  return MEMORY[0x189604930]();
}

uint64_t __CFBinaryPlistGetTopLevelInfo()
{
  return MEMORY[0x189604938]();
}

uint64_t __CFBinaryPlistParseASCIIString()
{
  return MEMORY[0x189604940]();
}

uint64_t __CFBinaryPlistParseUnicode16String()
{
  return MEMORY[0x189604948]();
}

uint64_t __CFBinaryPlistWriteToStreamWithOptions()
{
  return MEMORY[0x189604958]();
}

uint64_t __CFGetNextSearchPathEnumeration()
{
  return MEMORY[0x189604980]();
}

uint64_t __CFInitialize()
{
  return MEMORY[0x189604990]();
}

uint64_t __CFRecordAllocationEvent()
{
  return MEMORY[0x1896049A8]();
}

uint64_t __CFSafelyReallocate()
{
  return MEMORY[0x1896049B0]();
}

uint64_t __CFSafelyReallocateWithAllocator()
{
  return MEMORY[0x1896049B8]();
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1896049C0]();
}

uint64_t __CFStartSearchPathEnumeration()
{
  return MEMORY[0x1896049D8]();
}

uint64_t __CFStrConvertBytesToUnicode()
{
  return MEMORY[0x1896049E0]();
}

uint64_t __CFStringComputeEightBitStringEncoding()
{
  return MEMORY[0x1896049E8]();
}

uint64_t __CFStringDecodeByteStream3()
{
  return MEMORY[0x1896049F0]();
}

uint64_t __CFStringEncodeByteStream()
{
  return MEMORY[0x1896049F8]();
}

uint64_t __CFStringIsCF()
{
  return MEMORY[0x189604A00]();
}

uint64_t __CFURLReservedPtr()
{
  return MEMORY[0x189604A30]();
}

uint64_t __CFURLSetReservedPtr()
{
  return MEMORY[0x189604A40]();
}

uint64_t __CFXPreferencesCopyCurrentApplicationStateWithDeadlockAvoidance()
{
  return MEMORY[0x189604A50]();
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x189604A68]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

double __exp10(double a1)
{
  return result;
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1895F88C0](a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1895F8938]();
}

uint64_t __pthread_chdir()
{
  return MEMORY[0x1895F8968]();
}

uint64_t __pthread_fchdir()
{
  return MEMORY[0x1895F8970]();
}

__double2 __sincos_stret(double a1)
{
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

uint64_t __udivti3()
{
  return MEMORY[0x1895F8A38]();
}

uint64_t _amkrtemp()
{
  return MEMORY[0x1895F8A68]();
}

uint64_t _cfmp_record_nsmachport_deallocation()
{
  return MEMORY[0x189604A90]();
}

uint64_t _cfmp_record_nsmachport_is_interested()
{
  return MEMORY[0x189604A98]();
}

uint64_t _class_getIvarMemoryManagement()
{
  return MEMORY[0x189616350]();
}

uint64_t _class_isSwift()
{
  return MEMORY[0x189616358]();
}

uint64_t _dirhelper_relative()
{
  return MEMORY[0x1895F8A78]();
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1895F8C58]();
}

uint64_t _dyld_register_for_bulk_image_loads()
{
  return MEMORY[0x1895F8CD8]();
}

uint64_t _mkpath_np()
{
  return MEMORY[0x1895F8D38]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x189616380]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x189616390]();
}

uint64_t _objc_getFreedObjectClass()
{
  return MEMORY[0x1896163B8]();
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1896163D8]();
}

uint64_t _objc_rootAlloc()
{
  return MEMORY[0x1896163E0]();
}

uint64_t _objc_rootAllocWithZone()
{
  return MEMORY[0x1896163E8]();
}

uint64_t _objc_rootDealloc()
{
  return MEMORY[0x1896163F8]();
}

uint64_t _objc_rootFinalize()
{
  return MEMORY[0x189616400]();
}

uint64_t _objc_rootHash()
{
  return MEMORY[0x189616408]();
}

uint64_t _objc_rootIsDeallocating()
{
  return MEMORY[0x189616410]();
}

uint64_t _objc_rootRelease()
{
  return MEMORY[0x189616418]();
}

uint64_t _objc_rootReleaseWasZero()
{
  return MEMORY[0x189616420]();
}

uint64_t _objc_rootRetain()
{
  return MEMORY[0x189616428]();
}

uint64_t _objc_rootRetainCount()
{
  return MEMORY[0x189616430]();
}

uint64_t _objc_rootTryRetain()
{
  return MEMORY[0x189616438]();
}

uint64_t _objc_rootZone()
{
  return MEMORY[0x189616440]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_set_nscf_formatter()
{
  return MEMORY[0x1895F8DE8]();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x189616450]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x18961B018]();
}

uint64_t _swift_isObjCTypeNameSerializable()
{
  return MEMORY[0x18961B020]();
}

uint64_t _swift_reportToDebugger()
{
  return MEMORY[0x18961B038]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

uint64_t _swift_stdlib_getDefaultErrorCode()
{
  return MEMORY[0x18961B050]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895F9320](*(void *)&a1, a2, a3);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

uint64_t archive_entry_free()
{
  return MEMORY[0x189613D40]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x189613D70]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x189613DD0]();
}

uint64_t archive_errno()
{
  return MEMORY[0x189613E10]();
}

uint64_t archive_read_disk_entry_from_file()
{
  return MEMORY[0x189613E30]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x189613E38]();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return MEMORY[0x189613E40]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x189613E48]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x189613EB8]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x189613EC0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x189613EC8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x189613ED0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x189613EE8]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x189613F08]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1895F95E0](a1, *(void *)&a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9610](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1895F9620]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1895F9640]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1895F9658](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chdir(const char *a1)
{
  return MEMORY[0x1895FA528](a1);
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FA530](a1, *(void *)&a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FA540](a1, *(void *)&a2, *(void *)&a3);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x189616460](cls, name, imp, types);
}

uint64_t class_addMethodsBulk()
{
  return MEMORY[0x189616468]();
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x189616470](cls, protocol);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x189616490](cls, outCount);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x189616498](cls, extraBytes);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1896164A0](cls, name);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x1896164A8](cls);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1896164B0](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1896164B8](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1896164C0](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1896164C8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1896164E0](cls);
}

int class_getVersion(Class cls)
{
  return MEMORY[0x1896164E8](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x1896164F0](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x189616500](cls, sel);
}

Class class_setSuperclass(Class cls, Class newSuper)
{
  return (Class)MEMORY[0x189616508](cls, newSuper);
}

void class_setVersion(Class cls, int version)
{
}

void clearerr(FILE *a1)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1895FA570](*(void *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1896149B8](stream);
}

compression_status compression_stream_init( compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1896149D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1896149E0](stream, *(void *)&flags);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FA5E8](*(void *)&a1, a2, a3);
}

uint64_t container_create_or_lookup_app_group_path_by_app_group_identifier()
{
  return MEMORY[0x1895FA720]();
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1895FA738]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1895FAAD8](dirp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1895FABE8](data, applier);
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1895FAC08](data1, data2);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1895FAC18](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create( dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1895FAC98](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_read( dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1895FAD70]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1895FAD98](queue);
}

uint64_t dispatch_queue_set_label_nocopy()
{
  return MEMORY[0x1895FADB8]();
}

void dispatch_read(dispatch_fd_t fd, size_t length, dispatch_queue_t queue, void *handler)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

unint64_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1895FAE58](source);
}

unint64_t dispatch_source_get_mask(dispatch_source_t source)
{
  return MEMORY[0x1895FAE68](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1895FAF48](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1895FAFF0]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1895FB030]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

void endpwent(void)
{
}

uint64_t environ_lock_np()
{
  return MEMORY[0x1895FB108]();
}

uint64_t environ_unlock_np()
{
  return MEMORY[0x1895FB110]();
}

void exit(int a1)
{
}

double exp(double a1)
{
  return result;
}

double exp2(double a1)
{
  return result;
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1895FB218](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB278](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1895FB308](a1);
}

double fmod(double a1, double a2)
{
  return result;
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1895FB338](a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freehostent(hostent *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1895FB490](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1895FB498](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1895FB4A0](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1895FB4A8](a1, a2, *(void *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

int getc(FILE *a1)
{
  return MEMORY[0x1895FB518](a1);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1895FB520](a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FB530]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x1895FB558](*(void *)&a1);
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1895FB568](a1);
}

int getiopolicy_np(int a1, int a2)
{
  return MEMORY[0x1895FB5A8](*(void *)&a1, *(void *)&a2);
}

hostent *__cdecl getipnodebyname(const char *a1, int a2, int a3, int *a4)
{
  return (hostent *)MEMORY[0x1895FB5B0](a1, *(void *)&a2, *(void *)&a3, a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *getpwent(void)
{
  return (passwd *)MEMORY[0x1895FB658]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1895FB660](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1895FB680](*(void *)&a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FB840](*(void *)&a1, a2, a3);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

int isspace(int _c)
{
  return MEMORY[0x1895FB878](*(void *)&_c);
}

int isxdigit(int _c)
{
  return MEMORY[0x1895FB880](*(void *)&_c);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x189616538](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x189616540](v);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FB8E8](*(void *)&a1, *(void *)&a2);
}

uint64_t langid_consume_string()
{
  return MEMORY[0x189615E10]();
}

uint64_t langid_create()
{
  return MEMORY[0x189615E18]();
}

uint64_t langid_dispose()
{
  return MEMORY[0x189615E20]();
}

uint64_t langid_languagecode()
{
  return MEMORY[0x189615E28]();
}

uint64_t langid_numlanguages()
{
  return MEMORY[0x189615E30]();
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1895FB9E8](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FBA00](path, namebuff, size, *(void *)&options);
}

double log(double a1)
{
  return result;
}

double log10(double a1)
{
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1895FBBA8](*(void *)&task, *(void *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FBC00](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FBC10](*(void *)&target, address, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1895FBC98](start_size, *(void *)&flags);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1895FBCA0]();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x1895FBCB8](zone);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1895FBCC0](size);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1895FBCE8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1895FBCF0](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1895FBCF8](ptr, size, type_id);
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)MEMORY[0x1895FBD10](zone, num_items, size);
}

uint64_t malloc_zone_claimed_address()
{
  return MEMORY[0x1895FBD18]();
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

malloc_zone_t *__cdecl malloc_zone_from_ptr(const void *ptr)
{
  return (malloc_zone_t *)MEMORY[0x1895FBD28](ptr);
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)MEMORY[0x1895FBD30](zone, size);
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)MEMORY[0x1895FBD48](zone, ptr, size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

int mergesort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return MEMORY[0x1895FBE70](__base, __nel, __width, __compar);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x189616548](m, *(void *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x189616550](m);
}

void method_getArgumentType(Method m, unsigned int index, char *dst, size_t dst_len)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x189616570](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x189616578](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x189616580](m);
}

void method_getReturnType(Method m, char *dst, size_t dst_len)
{
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x189616590](m);
}

id method_invoke(id receiver, Method m, ...)
{
  return (id)MEMORY[0x189616598](receiver, m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1896165A0](m, imp);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF00](a1);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1895FBF58](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

double modf(double a1, double *a2)
{
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1895FBFB0](__rqtp, __rmtp);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x1896165C8](superclass, name, extraBytes);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x189616608](cls, bytes);
}

uint64_t objc_copyClassNamesForImageHeader()
{
  return MEMORY[0x189616618]();
}

const char **__cdecl objc_copyImageNames(unsigned int *outCount)
{
  return (const char **)MEMORY[0x189616628](outCount);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x189616668](obj);
}

Class objc_duplicateClass(Class original, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x189616678](original, name, extraBytes);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166A8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1896166D0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_initWeakOrNil(id *location, id val)
{
  return (id)MEMORY[0x1896166E0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1896166F8](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x189616708](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616720](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

void objc_removeAssociatedObjects(id object)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id object_copy(id a1, size_t a2)
{
  return (id)MEMORY[0x189616998](a1, a2);
}

id object_dispose(id a1)
{
  return (id)MEMORY[0x1896169A0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1896169B0](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x1896169B8](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1896169C0](a1, a2);
}

uint64_t object_getMethodImplementation()
{
  return MEMORY[0x1896169C8]();
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1896169D0](obj);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1896169D8](a1, a2);
}

void object_setIvar(id obj, Ivar ivar, id value)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC7E0](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1895FC7F0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC808](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC810](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC818](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1895FC828](a1);
}

int posix_spawnattr_set_qos_class_np(posix_spawnattr_t *__attr, qos_class_t __qos_class)
{
  return MEMORY[0x1895FC830](__attr, *(void *)&__qos_class);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x1895FC838](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1895FC840](a1, a2);
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1895FC848]();
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x1895FC858](a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x1895FC860](a1, a2);
}

double pow(double a1, double a2)
{
  return result;
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8C8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x189616A10](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList( Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x189616A18](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x189616A30](proto, outCount);
}

objc_method_description protocol_getMethodDescription( Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  CFIndex v4 = (const char *)MEMORY[0x189616A38](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.SEL name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x189616A40](p);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC940](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1895FC948](a1, a2);
}

int pthread_attr_getstacksize(const pthread_attr_t *a1, size_t *a2)
{
  return MEMORY[0x1895FC950](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1895FC958](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1895FC960](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1895FC968](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1895FC970](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1895FC978](a1, *(void *)&a2);
}

int pthread_attr_setscope(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1895FC980](a1, *(void *)&a2);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x1895FC988](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1895FC9C0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x1895FCA00](a1, a2);
}

void pthread_exit(void *a1)
{
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return MEMORY[0x1895FCA18](__pthread, __qos_class, __relative_priority);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCA30](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_getugid_np(uid_t *a1, gid_t *a2)
{
  return MEMORY[0x1895FCA48](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1895FCA70](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1895FCA78]();
}

uint64_t pthread_main_thread_np()
{
  return MEMORY[0x1895FCA80]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1895FCAB8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1895FCAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

int pthread_override_qos_class_end_np(pthread_override_t __override)
{
  return MEMORY[0x1895FCAD0](__override);
}

pthread_override_t pthread_override_qos_class_start_np( pthread_t __pthread, qos_class_t __qos_class, int __relative_priority)
{
  return (pthread_override_t)MEMORY[0x1895FCAD8](__pthread, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1895FCAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAF8](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB00](a1);
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB08](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x1895FCB28](*(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1895FCB38](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

void pthread_yield_np(void)
{
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x1895FCB80](*(void *)&a1, a2);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1895FCBB0]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1895FCBB8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int quotactl(const char *a1, int a2, int a3, caddr_t a4)
{
  return MEMORY[0x1895FCBD8](a1, *(void *)&a2, *(void *)&a3, a4);
}

uint64_t random(void)
{
  return MEMORY[0x1895FCBF8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1895FCC48](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

double remainder(double a1, double a2)
{
  return result;
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1895FCD18]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1895FCD20](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1895FCD28](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FCD80](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1895FCD98]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1895FCDC0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x189616A48](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x189616A50](str);
}

uint64_t sel_lookUpByName()
{
  return MEMORY[0x189616A60]();
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x189616A68](str);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCE80](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

void setpwent(void)
{
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1895FCEB8](*(void *)&a1, a2);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1895FCED8](a1, a2, *(void *)&a3, a4);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1895FCF50](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int snprintf_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  return MEMORY[0x1895FCF98](a1, a2, a3, a4);
}

void srandomdev(void)
{
}

int sscanf_l(const char *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1895FCFD8](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x1895FD0D8](a1, a2, a3, a4);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  return result;
}

float strtof_l(const char *a1, char **a2, locale_t a3)
{
  return result;
}

uint64_t strtoll_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1895FD1A8](a1, a2, *(void *)&a3, a4);
}

unint64_t strtoul_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1895FD1C0](a1, a2, *(void *)&a3, a4);
}

unint64_t strtoull_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1895FD1D0](a1, a2, *(void *)&a3, a4);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x18961B0B8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x18961B140]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x18961BFB8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x18961BFC0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x18961BFC8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x18961BFE0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x18961BFE8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x18961BFF0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x18961B188]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x18961B190]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x18961B198]();
}

uint64_t swift_dynamicCastMetatypeUnconditional()
{
  return MEMORY[0x18961B1A0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x18961B1A8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x18961B1B0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x18961B1C0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x18961B1C8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x18961B1D0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x18961B228]();
}

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x18961B230]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x18961B248]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B258]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x18961B268]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x18961B298]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x18961B2A0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x18961B2A8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x18961B2B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x18961B2E0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x18961B2F0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x18961B2F8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x18961B300]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x18961B330]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x18961B338]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x18961B340]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x18961B350]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x18961B360]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x18961B368]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x18961B378]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x18961B380]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x18961B388]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x18961B400]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x18961B408]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x18961B420]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x18961B428]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B438]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x18961C008]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x18961C010]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x18961C018]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x18961C038]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x18961B450]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x18961B460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x18961B470]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x18961B478]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x18961B480]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x18961B488]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x18961B490]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x18961B498]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x18961B4A0]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x18961B4A8]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x18961B4B0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x18961B4D8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x18961B4F0]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x18961B4F8]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x18961B500]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x18961B520]();
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD240](a1, a2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration( sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x1895FD2C8](*(void *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x1895FD2D8]();
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1895FD310](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t thread_policy_get( thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return MEMORY[0x1895FD3B8](*(void *)&thread, *(void *)&flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set( thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1895FD3C0](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

uint64_t thread_stack_async_pcs()
{
  return MEMORY[0x1895FD3E0]();
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x189615410](*(void *)&c);
}

void u_charsToUChars(const char *cs, UChar *us, int32_t length)
{
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x189615420](*(void *)&code);
}

int32_t u_getPropertyValueEnum(UProperty property, const char *alias)
{
  return MEMORY[0x189615430](*(void *)&property, alias);
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x189615438](*(void *)&c, *(void *)&which);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x189615440](*(void *)&c);
}

UBool u_isprint(UChar32 c)
{
  return MEMORY[0x189615450](*(void *)&c);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x189615458](s);
}

uint64_t u_vformatMessage()
{
  return MEMORY[0x189615460]();
}

uint64_t uameasfmt_close()
{
  return MEMORY[0x189615488]();
}

uint64_t uameasfmt_format()
{
  return MEMORY[0x189615490]();
}

uint64_t uameasfmt_formatMultiple()
{
  return MEMORY[0x189615498]();
}

uint64_t uameasfmt_getUnitName()
{
  return MEMORY[0x1896154A0]();
}

uint64_t uameasfmt_getUnitsForUsage()
{
  return MEMORY[0x1896154A8]();
}

uint64_t uameasfmt_open()
{
  return MEMORY[0x1896154B0]();
}

uint64_t uatmufmt_close()
{
  return MEMORY[0x1896154B8]();
}

uint64_t uatmufmt_format()
{
  return MEMORY[0x1896154C0]();
}

uint64_t uatmufmt_getListPattern()
{
  return MEMORY[0x1896154C8]();
}

uint64_t uatmufmt_getTimePattern()
{
  return MEMORY[0x1896154D0]();
}

uint64_t uatmufmt_openWithNumberFormat()
{
  return MEMORY[0x1896154D8]();
}

UBlockCode ublock_getCode(UChar32 c)
{
  return MEMORY[0x189615538](*(void *)&c);
}

uint64_t ucal_add()
{
  return MEMORY[0x189615568]();
}

uint64_t ucal_clear()
{
  return MEMORY[0x189615570]();
}

uint64_t ucal_clone()
{
  return MEMORY[0x189615578]();
}

uint64_t ucal_close()
{
  return MEMORY[0x189615580]();
}

uint64_t ucal_get()
{
  return MEMORY[0x189615588]();
}

uint64_t ucal_getAttribute()
{
  return MEMORY[0x189615590]();
}

uint64_t ucal_getCanonicalTimeZoneID()
{
  return MEMORY[0x189615598]();
}

uint64_t ucal_getDayOfWeekType()
{
  return MEMORY[0x1896155A0]();
}

uint64_t ucal_getFieldDifference()
{
  return MEMORY[0x1896155A8]();
}

uint64_t ucal_getGregorianChange()
{
  return MEMORY[0x1896155B0]();
}

uint64_t ucal_getKeywordValuesForLocale()
{
  return MEMORY[0x1896155B8]();
}

uint64_t ucal_getLimit()
{
  return MEMORY[0x1896155C0]();
}

uint64_t ucal_getMillis()
{
  return MEMORY[0x1896155C8]();
}

uint64_t ucal_getNow()
{
  return MEMORY[0x1896155D0]();
}

uint64_t ucal_getTZDataVersion()
{
  return MEMORY[0x1896155D8]();
}

uint64_t ucal_getTimeZoneDisplayName()
{
  return MEMORY[0x1896155E0]();
}

uint64_t ucal_getTimeZoneOffsetFromLocal()
{
  return MEMORY[0x1896155E8]();
}

uint64_t ucal_getTimeZoneTransitionDate()
{
  return MEMORY[0x1896155F0]();
}

uint64_t ucal_getWeekendTransition()
{
  return MEMORY[0x1896155F8]();
}

uint64_t ucal_isWeekend()
{
  return MEMORY[0x189615600]();
}

uint64_t ucal_open()
{
  return MEMORY[0x189615608]();
}

uint64_t ucal_openTimeZones()
{
  return MEMORY[0x189615610]();
}

uint64_t ucal_roll()
{
  return MEMORY[0x189615618]();
}

uint64_t ucal_set()
{
  return MEMORY[0x189615620]();
}

uint64_t ucal_setAttribute()
{
  return MEMORY[0x189615628]();
}

uint64_t ucal_setDateTime()
{
  return MEMORY[0x189615630]();
}

uint64_t ucal_setGregorianChange()
{
  return MEMORY[0x189615638]();
}

uint64_t ucal_setMillis()
{
  return MEMORY[0x189615640]();
}

uint64_t ucasemap_close()
{
  return MEMORY[0x189615650]();
}

uint64_t ucasemap_open()
{
  return MEMORY[0x189615658]();
}

uint64_t ucasemap_utf8ToTitle()
{
  return MEMORY[0x189615668]();
}

uint64_t ucol_getKeywordValues()
{
  return MEMORY[0x189615708]();
}

uint64_t ucol_getKeywordValuesForLocale()
{
  return MEMORY[0x189615710]();
}

uint64_t ucurr_forLocale()
{
  return MEMORY[0x189615750]();
}

uint64_t ucurr_getName()
{
  return MEMORY[0x189615760]();
}

uint64_t ucurr_getNumericCode()
{
  return MEMORY[0x189615768]();
}

uint64_t ucurr_openISOCurrencies()
{
  return MEMORY[0x189615778]();
}

uint64_t udat_applyPattern()
{
  return MEMORY[0x189615780]();
}

uint64_t udat_close()
{
  return MEMORY[0x189615798]();
}

uint64_t udat_countSymbols()
{
  return MEMORY[0x1896157A0]();
}

uint64_t udat_format()
{
  return MEMORY[0x1896157A8]();
}

uint64_t udat_formatForFields()
{
  return MEMORY[0x1896157B0]();
}

uint64_t udat_getCalendar()
{
  return MEMORY[0x1896157C0]();
}

uint64_t udat_getSymbols()
{
  return MEMORY[0x1896157D0]();
}

uint64_t udat_open()
{
  return MEMORY[0x1896157E0]();
}

uint64_t udat_parseCalendar()
{
  return MEMORY[0x1896157E8]();
}

uint64_t udat_patternCharToDateFormatField()
{
  return MEMORY[0x1896157F0]();
}

uint64_t udat_set2DigitYearStart()
{
  return MEMORY[0x1896157F8]();
}

uint64_t udat_setBooleanAttribute()
{
  return MEMORY[0x189615800]();
}

uint64_t udat_setCalendar()
{
  return MEMORY[0x189615808]();
}

uint64_t udat_setContext()
{
  return MEMORY[0x189615810]();
}

uint64_t udat_setLenient()
{
  return MEMORY[0x189615818]();
}

uint64_t udat_toCalendarDateField()
{
  return MEMORY[0x189615828]();
}

uint64_t udatpg_clone()
{
  return MEMORY[0x189615848]();
}

uint64_t udatpg_close()
{
  return MEMORY[0x189615850]();
}

uint64_t udatpg_getBestPatternWithOptions()
{
  return MEMORY[0x189615860]();
}

uint64_t udatpg_getDefaultHourCycle()
{
  return MEMORY[0x189615868]();
}

uint64_t udatpg_open()
{
  return MEMORY[0x189615878]();
}

uint64_t udtitvfmt_close()
{
  return MEMORY[0x189615880]();
}

uint64_t udtitvfmt_format()
{
  return MEMORY[0x189615888]();
}

uint64_t udtitvfmt_open()
{
  return MEMORY[0x189615890]();
}

uint64_t udtitvfmt_setAttribute()
{
  return MEMORY[0x189615898]();
}

uint64_t uenum_close()
{
  return MEMORY[0x1896158A0]();
}

uint64_t uenum_next()
{
  return MEMORY[0x1896158A8]();
}

uint64_t uenum_unext()
{
  return MEMORY[0x1896158B0]();
}

uint64_t ufieldpositer_close()
{
  return MEMORY[0x1896158B8]();
}

uint64_t ufieldpositer_next()
{
  return MEMORY[0x1896158C0]();
}

uint64_t ufieldpositer_open()
{
  return MEMORY[0x1896158C8]();
}

uint64_t ufmt_close()
{
  return MEMORY[0x1896158D0]();
}

uint64_t ufmt_getDecNumChars()
{
  return MEMORY[0x1896158D8]();
}

uint64_t ufmt_open()
{
  return MEMORY[0x1896158E0]();
}

int32_t uidna_nameToASCII( const UIDNA *idna, const UChar *name, int32_t length, UChar *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1896158F0](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

int32_t uidna_nameToASCII_UTF8( const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1896158F8](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

int32_t uidna_nameToUnicode( const UIDNA *idna, const UChar *name, int32_t length, UChar *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x189615900](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

int32_t uidna_nameToUnicodeUTF8( const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x189615908](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x189615910](*(void *)&options, pErrorCode);
}

uint64_t ulistfmt_close()
{
  return MEMORY[0x189615918]();
}

uint64_t ulistfmt_format()
{
  return MEMORY[0x189615920]();
}

uint64_t ulistfmt_openForType()
{
  return MEMORY[0x189615930]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x189615938]();
}

uint64_t uloc_countAvailable()
{
  return MEMORY[0x189615948]();
}

uint64_t uloc_getAvailable()
{
  return MEMORY[0x189615950]();
}

uint64_t uloc_getCountry()
{
  return MEMORY[0x189615960]();
}

uint64_t uloc_getDisplayCountry()
{
  return MEMORY[0x189615968]();
}

uint64_t uloc_getDisplayKeywordValue()
{
  return MEMORY[0x189615970]();
}

uint64_t uloc_getDisplayScript()
{
  return MEMORY[0x189615988]();
}

uint64_t uloc_getDisplayVariant()
{
  return MEMORY[0x189615990]();
}

uint64_t uloc_getISO3Language()
{
  return MEMORY[0x189615998]();
}

uint64_t uloc_getKeywordValue()
{
  return MEMORY[0x1896159B0]();
}

uint64_t uloc_getLCID()
{
  return MEMORY[0x1896159B8]();
}

uint64_t uloc_getLanguage()
{
  return MEMORY[0x1896159C0]();
}

uint64_t uloc_getLocaleForLCID()
{
  return MEMORY[0x1896159D0]();
}

uint64_t uloc_getScript()
{
  return MEMORY[0x1896159D8]();
}

uint64_t uloc_getVariant()
{
  return MEMORY[0x1896159E0]();
}

uint64_t uloc_openKeywords()
{
  return MEMORY[0x1896159F0]();
}

uint64_t uloc_setKeywordValue()
{
  return MEMORY[0x1896159F8]();
}

uint64_t uloc_toLanguageTag()
{
  return MEMORY[0x189615A00]();
}

uint64_t uloc_toLegacyKey()
{
  return MEMORY[0x189615A08]();
}

uint64_t ulocdata_close()
{
  return MEMORY[0x189615A10]();
}

uint64_t ulocdata_getDelimiter()
{
  return MEMORY[0x189615A18]();
}

uint64_t ulocdata_getExemplarSet()
{
  return MEMORY[0x189615A20]();
}

uint64_t ulocdata_getMeasurementSystem()
{
  return MEMORY[0x189615A28]();
}

uint64_t ulocdata_open()
{
  return MEMORY[0x189615A30]();
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1895FD448](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

uint64_t unum_clone()
{
  return MEMORY[0x189615A40]();
}

uint64_t unum_close()
{
  return MEMORY[0x189615A48]();
}

uint64_t unum_formatInt64()
{
  return MEMORY[0x189615A60]();
}

uint64_t unum_getAttribute()
{
  return MEMORY[0x189615A68]();
}

uint64_t unum_getSymbol()
{
  return MEMORY[0x189615A80]();
}

uint64_t unum_getTextAttribute()
{
  return MEMORY[0x189615A88]();
}

uint64_t unum_open()
{
  return MEMORY[0x189615A90]();
}

uint64_t unum_parseDouble()
{
  return MEMORY[0x189615AA8]();
}

uint64_t unum_parseInt64()
{
  return MEMORY[0x189615AB0]();
}

uint64_t unum_parseToUFormattable()
{
  return MEMORY[0x189615AB8]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x189615AC0]();
}

uint64_t unum_setContext()
{
  return MEMORY[0x189615AC8]();
}

uint64_t unum_setDoubleAttribute()
{
  return MEMORY[0x189615AD0]();
}

uint64_t unum_setSymbol()
{
  return MEMORY[0x189615AD8]();
}

uint64_t unum_setTextAttribute()
{
  return MEMORY[0x189615AE0]();
}

uint64_t unumf_close()
{
  return MEMORY[0x189615AF0]();
}

uint64_t unumf_closeResult()
{
  return MEMORY[0x189615AF8]();
}

uint64_t unumf_formatDecimal()
{
  return MEMORY[0x189615B00]();
}

uint64_t unumf_formatDouble()
{
  return MEMORY[0x189615B08]();
}

uint64_t unumf_formatInt()
{
  return MEMORY[0x189615B10]();
}

uint64_t unumf_openForSkeletonAndLocale()
{
  return MEMORY[0x189615B18]();
}

uint64_t unumf_openResult()
{
  return MEMORY[0x189615B20]();
}

uint64_t unumf_resultGetAllFieldPositions()
{
  return MEMORY[0x189615B28]();
}

uint64_t unumf_resultToString()
{
  return MEMORY[0x189615B30]();
}

uint64_t unumsys_close()
{
  return MEMORY[0x189615B38]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x189615B40]();
}

uint64_t unumsys_getRadix()
{
  return MEMORY[0x189615B48]();
}

uint64_t unumsys_isAlgorithmic()
{
  return MEMORY[0x189615B50]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x189615B58]();
}

uint64_t unumsys_openAvailableNames()
{
  return MEMORY[0x189615B60]();
}

uint64_t uplrules_close()
{
  return MEMORY[0x189615B68]();
}

uint64_t uplrules_open()
{
  return MEMORY[0x189615B70]();
}

uint64_t uplrules_select()
{
  return MEMORY[0x189615B78]();
}

URegularExpression *__cdecl uregex_clone(const URegularExpression *regexp, UErrorCode *status)
{
  return (URegularExpression *)MEMORY[0x189615B80](regexp, status);
}

void uregex_close(URegularExpression *regexp)
{
}

int64_t uregex_end64(URegularExpression *regexp, int32_t groupNum, UErrorCode *status)
{
  return MEMORY[0x189615B90](regexp, *(void *)&groupNum, status);
}

UBool uregex_findNext(URegularExpression *regexp, UErrorCode *status)
{
  return MEMORY[0x189615B98](regexp, status);
}

int32_t uregex_groupCount(URegularExpression *regexp, UErrorCode *status)
{
  return MEMORY[0x189615BA0](regexp, status);
}

int32_t uregex_groupNumberFromName( URegularExpression *regexp, const UChar *groupName, int32_t nameLength, UErrorCode *status)
{
  return MEMORY[0x189615BA8](regexp, groupName, *(void *)&nameLength, status);
}

UBool uregex_hitEnd(const URegularExpression *regexp, UErrorCode *status)
{
  return MEMORY[0x189615BB0](regexp, status);
}

UBool uregex_matches(URegularExpression *regexp, int32_t startIndex, UErrorCode *status)
{
  return MEMORY[0x189615BB8](regexp, *(void *)&startIndex, status);
}

URegularExpression *__cdecl uregex_open( const UChar *pattern, int32_t patternLength, uint32_t flags, UParseError *pe, UErrorCode *status)
{
  return (URegularExpression *)MEMORY[0x189615BC0](pattern, *(void *)&patternLength, *(void *)&flags, pe, status);
}

UBool uregex_requireEnd(const URegularExpression *regexp, UErrorCode *status)
{
  return MEMORY[0x189615BC8](regexp, status);
}

void uregex_setFindProgressCallback( URegularExpression *regexp, URegexFindProgressCallback *callback, const void *context, UErrorCode *status)
{
}

void uregex_setMatchCallback( URegularExpression *regexp, URegexMatchCallback *callback, const void *context, UErrorCode *status)
{
}

void uregex_setRegion64( URegularExpression *regexp, int64_t regionStart, int64_t regionLimit, UErrorCode *status)
{
}

void uregex_setText(URegularExpression *regexp, const UChar *text, int32_t textLength, UErrorCode *status)
{
}

void uregex_setUText(URegularExpression *regexp, UText *text, UErrorCode *status)
{
}

int64_t uregex_start64(URegularExpression *regexp, int32_t groupNum, UErrorCode *status)
{
  return MEMORY[0x189615BF8](regexp, *(void *)&groupNum, status);
}

void uregex_useAnchoringBounds(URegularExpression *regexp, UBool b, UErrorCode *status)
{
}

void uregex_useTransparentBounds(URegularExpression *regexp, UBool b, UErrorCode *status)
{
}

uint64_t uregion_getAvailable()
{
  return MEMORY[0x189615C10]();
}

uint64_t uregion_getContainedRegions()
{
  return MEMORY[0x189615C18]();
}

uint64_t uregion_getContainingRegion()
{
  return MEMORY[0x189615C20]();
}

uint64_t uregion_getContainingRegionOfType()
{
  return MEMORY[0x189615C28]();
}

uint64_t uregion_getRegionCode()
{
  return MEMORY[0x189615C30]();
}

uint64_t uregion_getRegionFromCode()
{
  return MEMORY[0x189615C38]();
}

uint64_t ureldatefmt_close()
{
  return MEMORY[0x189615C40]();
}

uint64_t ureldatefmt_open()
{
  return MEMORY[0x189615C58]();
}

uint64_t uscript_getCode()
{
  return MEMORY[0x189615C60]();
}

uint64_t uscript_getScript()
{
  return MEMORY[0x189615C68]();
}

uint64_t uset_clear()
{
  return MEMORY[0x189615C98]();
}

uint64_t uset_close()
{
  return MEMORY[0x189615CA0]();
}

uint64_t uset_contains()
{
  return MEMORY[0x189615CA8]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x189615CB0]();
}

uint64_t uset_getItem()
{
  return MEMORY[0x189615CB8]();
}

uint64_t uset_getItemCount()
{
  return MEMORY[0x189615CC0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x189615CC8]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x189615CD0](ut);
}

int32_t utf8_back1SafeBody(const uint8_t *s, int32_t start, int32_t i)
{
  return MEMORY[0x189615CE0](s, *(void *)&start, *(void *)&i);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FD4A8](a1, a2);
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vfprintf_l(FILE *a1, locale_t a2, const char *a3, va_list a4)
{
  return MEMORY[0x1895FD530](a1, a2, a3, a4);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_copy( vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1895FD550](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1895FD5B8]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1895FD5C0]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1895FD760](*(void *)&a1, a2, *(void *)&a3);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt( xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x189617418](sax, user_data, chunk, *(void *)&size, filename);
}

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return (xmlErrorPtr)MEMORY[0x189617420](ctx);
}

int xmlCtxtUseOptions(xmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x189617428](ctxt, *(void *)&options);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeEnumeration(xmlEnumerationPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

xmlExternalEntityLoader xmlGetExternalEntityLoader(void)
{
  return (xmlExternalEntityLoader)MEMORY[0x189617458]();
}

xmlEntityPtr xmlGetPredefinedEntity(const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x189617460](name);
}

void xmlInitParser(void)
{
}

xmlParserInputPtr xmlNoNetExternalEntityLoader(const char *URL, const char *ID, xmlParserCtxtPtr ctxt)
{
  return (xmlParserInputPtr)MEMORY[0x189617478](URL, ID, ctxt);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x189617480](ctxt, chunk, *(void *)&size, *(void *)&terminate);
}

void xmlSAX2EntityDecl( void *ctx, const xmlChar *name, int type, const xmlChar *publicId, const xmlChar *systemId, xmlChar *content)
{
}

void xmlSAX2ExternalSubset(void *ctx, const xmlChar *name, const xmlChar *ExternalID, const xmlChar *SystemID)
{
}

int xmlSAX2GetColumnNumber(void *ctx)
{
  return MEMORY[0x1896174A0](ctx);
}

xmlEntityPtr xmlSAX2GetEntity(void *ctx, const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x1896174A8](ctx, name);
}

int xmlSAX2GetLineNumber(void *ctx)
{
  return MEMORY[0x1896174B0](ctx);
}

void xmlSAX2InternalSubset(void *ctx, const xmlChar *name, const xmlChar *ExternalID, const xmlChar *SystemID)
{
}

void xmlSAX2UnparsedEntityDecl( void *ctx, const xmlChar *name, const xmlChar *publicId, const xmlChar *systemId, const xmlChar *notationName)
{
}

void xmlSetExternalEntityLoader(xmlExternalEntityLoader f)
{
}

void xmlSetStructuredErrorFunc(void *ctx, xmlStructuredErrorFunc handler)
{
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1895FD770](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1895FD780](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1895FD798](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1895FD7A0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

uint64_t xpc_add_bundle()
{
  return MEMORY[0x1895FD7B0]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_bundle_id()
{
  return MEMORY[0x1895FD928]();
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1895FD938]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1895FD948](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

au_asid_t xpc_connection_get_asid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD970](connection);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1895FD978]();
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD988](connection);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD990](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

uint64_t xpc_connection_kill()
{
  return MEMORY[0x1895FD9B0]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply( xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1895FD9F8]();
}

uint64_t xpc_connection_set_bootstrap()
{
  return MEMORY[0x1895FDA00]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_instance()
{
  return MEMORY[0x1895FDA28]();
}

uint64_t xpc_connection_set_legacy()
{
  return MEMORY[0x1895FDA30]();
}

uint64_t xpc_connection_set_privileged()
{
  return MEMORY[0x1895FDA40]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1895FDA58]();
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1895FDAB0]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1895FDC70]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1895FDD70](connection);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1895FDDF8](*(void *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1895FDE00](xfd);
}

uint64_t xpc_get_class4NSXPC()
{
  return MEMORY[0x1895FDE68]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_handle_service()
{
  return MEMORY[0x1895FDE80]();
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

uint64_t xpc_track_activity()
{
  return MEMORY[0x1895FE090]();
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t objc_msgSend_URLByResolvingBookmarkData_options_relativeToURL_bookmarkDataIsStale_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_URLByResolvingBookmarkData_options_relativeToURL_bookmarkDataIsStale_error_);
}

uint64_t objc_msgSend___NS_swiftOverlay_automaticallyNotifiesObserversForKey_foundationImplementation_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___NS_swiftOverlay_automaticallyNotifiesObserversForKey_foundationImplementation_);
}

uint64_t objc_msgSend___NS_swiftOverlay_keyPathsForValuesAffectingValueForKey_foundationImplementation_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___NS_swiftOverlay_keyPathsForValuesAffectingValueForKey_foundationImplementation_);
}

uint64_t objc_msgSend___decodeXPCObject_allowingSimpleMessageSend_outInvocation_outArguments_outArgumentsMaxCount_outMethodSignature_outSelector_isReply_replySelector_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel___decodeXPCObject_allowingSimpleMessageSend_outInvocation_outArguments_outArgumentsMaxCount_outMethodSignature_outSelector_isReply_replySelector_);
}

uint64_t objc_msgSend___initWithFormat_attributeOptions_formattingOptions_locale_arguments_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___initWithFormat_attributeOptions_formattingOptions_locale_arguments_);
}

uint64_t objc_msgSend___initWithFormat_attributeOptions_formattingOptions_locale_context_arguments_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___initWithFormat_attributeOptions_formattingOptions_locale_context_arguments_);
}

uint64_t objc_msgSend___localizedRestrictionExistsForComponents_ignoreUndeterminedComponents_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___localizedRestrictionExistsForComponents_ignoreUndeterminedComponents_);
}

uint64_t objc_msgSend___prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_byAccessor_);
}

uint64_t objc_msgSend___shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly);
}

uint64_t objc_msgSend___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly);
}

uint64_t objc_msgSend__acceptSentenceTerminatorRange_paragraphRange_tokens_count_tokenIndex_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__acceptSentenceTerminatorRange_paragraphRange_tokens_count_tokenIndex_);
}

uint64_t objc_msgSend__addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__addVersionOfItemAtURL_withContentsOfURL_options_userInfo_temporaryStorageIdentifier_error_);
}

uint64_t objc_msgSend__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate_);
}

uint64_t objc_msgSend__changeValueForKeys_count_maybeOldValuesDict_maybeNewValuesDict_usingBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__changeValueForKeys_count_maybeOldValuesDict_maybeNewValuesDict_usingBlock_);
}

uint64_t objc_msgSend__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue_);
}

uint64_t objc_msgSend__coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__coordinateReadingItemAtURL_options_writingItemAtURL_options_error_byAccessor_);
}

uint64_t objc_msgSend__coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__coordinateWritingItemAtURL_options_writingItemAtURL_options_error_byAccessor_);
}

uint64_t objc_msgSend__decodeBase64EncodedCharacterBuffer_length_options_buffer_bufferLength_state_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__decodeBase64EncodedCharacterBuffer_length_options_buffer_bufferLength_state_);
}

uint64_t objc_msgSend__decodeMessageFromXPCObject_allowingSimpleMessageSend_outInvocation_outArguments_outArgumentsMaxCount_outMethodSignature_outSelector_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__decodeMessageFromXPCObject_allowingSimpleMessageSend_outInvocation_outArguments_outArgumentsMaxCount_outMethodSignature_outSelector_);
}

uint64_t objc_msgSend__encodeInvocationObjectArgumentsOnly_count_typeString_selector_isReply_into_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__encodeInvocationObjectArgumentsOnly_count_typeString_selector_isReply_into_);
}

uint64_t objc_msgSend__enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__enumerateDatesStartingAfterDate_matchingComponents_options_usingBlock_);
}

uint64_t objc_msgSend__evaluateActivationRuleWithoutWorkarounds_withExtensionItemsRepresentation_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__evaluateActivationRuleWithoutWorkarounds_withExtensionItemsRepresentation_);
}

uint64_t objc_msgSend__finishWritingToURL_byTakingContentsFromItemAtURL_addingAttributes_usingTemporaryDirectoryAtURL_backupFileName_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__finishWritingToURL_byTakingContentsFromItemAtURL_addingAttributes_usingTemporaryDirectoryAtURL_backupFileName_error_);
}

uint64_t objc_msgSend__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__forEachRelevantAccessClaimExcludingClaimsFromSuperarbiter_performProcedure_);
}

uint64_t objc_msgSend__heuristicMorphologyForLanguage_prefix_suffix_featureName_matchedPrefix_matchedSuffix_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__heuristicMorphologyForLanguage_prefix_suffix_featureName_matchedPrefix_matchedSuffix_);
}

uint64_t objc_msgSend__initWithConnection_proxyNumber_generationCount_interface_options_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithConnection_proxyNumber_generationCount_interface_options_error_);
}

uint64_t objc_msgSend__initWithContainerClass_keyPath_firstDotIndex_propertiesBeingInitialized_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithContainerClass_keyPath_firstDotIndex_propertiesBeingInitialized_);
}

uint64_t objc_msgSend__initWithFileURL_library_clientID_name_contentsURL_isBackup_revision_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithFileURL_library_clientID_name_contentsURL_isBackup_revision_);
}

uint64_t objc_msgSend__initWithFormat_attributeOptions_formattingOptions_locale_arguments_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithFormat_attributeOptions_formattingOptions_locale_arguments_);
}

uint64_t objc_msgSend__initWithValidatedFormat_validFormatSpecifiers_locale_options_error_arguments_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithValidatedFormat_validFormatSpecifiers_locale_options_error_arguments_);
}

uint64_t objc_msgSend__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler_);
}

uint64_t objc_msgSend__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler_);
}

uint64_t objc_msgSend__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler_);
}

uint64_t objc_msgSend__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__makePresenter_observeVersionChangeOfKind_withClientID_name_subitemURL_);
}

uint64_t objc_msgSend__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__makePresenter_relinquishToAccessClaimWithID_purposeID_ifNecessaryUsingSelector_recordingRelinquishment_continuer_);
}

uint64_t objc_msgSend__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__makePresenter_relinquishToReadingClaimWithID_purposeID_options_completionHandler_);
}

uint64_t objc_msgSend__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__makePresenter_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler_);
}

uint64_t objc_msgSend__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__makePresenter_validateRelinquishmentToSubitemAtURL_completionHandler_);
}

uint64_t objc_msgSend__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__makePresenter_validateRemoteDeletionRecordingRelinquishment_completionHandler_);
}

uint64_t objc_msgSend__movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__movingItemAtURL_requiresProvidingWithDestinationURL_completionHandler_);
}

uint64_t objc_msgSend__newContentsAtURL_path_itemKind_oldChildrenByUniqueFileName_options_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__newContentsAtURL_path_itemKind_oldChildrenByUniqueFileName_options_error_);
}

uint64_t objc_msgSend__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context_);
}

uint64_t objc_msgSend__otherVersionsOfItemAtURL_temporaryStorageIdentifier_withoutOptions_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__otherVersionsOfItemAtURL_temporaryStorageIdentifier_withoutOptions_);
}

uint64_t objc_msgSend__readBytesAndEncodingFromPath_maxLength_encoding_bytes_length_didMap_options_reportProgress_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__readBytesAndEncodingFromPath_maxLength_encoding_bytes_length_didMap_options_reportProgress_error_);
}

uint64_t objc_msgSend__readBytesFromPath_maxLength_bytes_length_didMap_options_reportProgress_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__readBytesFromPath_maxLength_bytes_length_didMap_options_reportProgress_error_);
}

uint64_t objc_msgSend__replaceOccurrencesOfRegularExpressionPattern_withTemplate_options_range_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__replaceOccurrencesOfRegularExpressionPattern_withTemplate_options_range_);
}

uint64_t objc_msgSend__sendInvocation_orArguments_count_methodSignature_selector_withProxy_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__sendInvocation_orArguments_count_methodSignature_selector_withProxy_);
}

uint64_t objc_msgSend__stringByReplacingOccurrencesOfRegularExpressionPattern_withTemplate_options_range_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__stringByReplacingOccurrencesOfRegularExpressionPattern_withTemplate_options_range_);
}

uint64_t objc_msgSend__tokenDataForParagraphAtIndex_paragraphRange_requireLemmas_requirePartsOfSpeech_requireNamedEntities_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__tokenDataForParagraphAtIndex_paragraphRange_requireLemmas_requirePartsOfSpeech_requireNamedEntities_);
}

uint64_t objc_msgSend__tokenDataForParagraphRange_requireLemmas_requirePartsOfSpeech_requireNamedEntities_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__tokenDataForParagraphRange_requireLemmas_requirePartsOfSpeech_requireNamedEntities_);
}

uint64_t objc_msgSend__tokenizeParagraphAtIndex_requireLemmas_requirePartsOfSpeech_requireNamedEntities_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__tokenizeParagraphAtIndex_requireLemmas_requirePartsOfSpeech_requireNamedEntities_);
}

uint64_t objc_msgSend__versionOfItemAtURL_forClientID_name_temporaryStorageIdentifier_evenIfDeleted_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__versionOfItemAtURL_forClientID_name_temporaryStorageIdentifier_evenIfDeleted_);
}

uint64_t objc_msgSend__versionOfItemAtURL_forPersistentIdentifier_temporaryStorageIdentifier_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__versionOfItemAtURL_forPersistentIdentifier_temporaryStorageIdentifier_);
}

uint64_t objc_msgSend__writeContentsToURL_path_originalContentsURL_tryHardLinking_didHardLinking_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__writeContentsToURL_path_originalContentsURL_tryHardLinking_didHardLinking_error_);
}

uint64_t objc_msgSend__writeDataToPath_data_options_stringEncodingAttributeData_reportProgress_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__writeDataToPath_data_options_stringEncodingAttributeData_reportProgress_error_);
}

uint64_t objc_msgSend__xmlExternalEntityWithURL_identifier_context_originalLoaderFunction_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__xmlExternalEntityWithURL_identifier_context_originalLoaderFunction_);
}

uint64_t objc_msgSend_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_addPresenter_withID_fileURL_lastPresentedItemEventIdentifier_ubiquityAttributes_options_responses_);
}

uint64_t objc_msgSend_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_addProvider_withID_uniqueID_forProvidedItemsURL_options_withServer_reply_);
}

uint64_t objc_msgSend_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_);
}

uint64_t objc_msgSend_bookmarkDataWithOptions_includingResourceValuesForKeys_relativeToURL_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_bookmarkDataWithOptions_includingResourceValuesForKeys_relativeToURL_error_);
}

uint64_t objc_msgSend_canNewWriteOfItemAtLocation_options_safelyOverlapExistingWriteOfItemAtLocation_options_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_canNewWriteOfItemAtLocation_options_safelyOverlapExistingWriteOfItemAtLocation_options_);
}

uint64_t objc_msgSend_canReadingItemAtLocation_options_safelyOverlapNewWriting_ofItemAtLocation_options_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_canReadingItemAtLocation_options_safelyOverlapNewWriting_ofItemAtLocation_options_);
}

uint64_t objc_msgSend_checkIfSymbolicLinkAtURL_withResolutionCount_andIfSoThenReevaluateSelf_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_checkIfSymbolicLinkAtURL_withResolutionCount_andIfSoThenReevaluateSelf_);
}

uint64_t objc_msgSend_didSkipInflectableRangeWithUnfilledFormatSpecifiers_sourceSubstring_inflectionRule_alternative_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_didSkipInflectableRangeWithUnfilledFormatSpecifiers_sourceSubstring_inflectionRule_alternative_);
}

uint64_t objc_msgSend_directoryContentsAtPath_matchingExtension_options_keepExtension_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_directoryContentsAtPath_matchingExtension_options_keepExtension_error_);
}

uint64_t objc_msgSend_ensureProvidersIfNecessaryForClaim_user_atLocations_queue_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_ensureProvidersIfNecessaryForClaim_user_atLocations_queue_thenContinue_);
}

uint64_t objc_msgSend_ensureProvidersOfItemsAtReadingLocations_writingLocations_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_ensureProvidersOfItemsAtReadingLocations_writingLocations_thenContinue_);
}

uint64_t objc_msgSend_enumeratorForAdditionsInNameSpace_withOptions_withoutOptions_ordering_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_enumeratorForAdditionsInNameSpace_withOptions_withoutOptions_ordering_);
}

uint64_t objc_msgSend_fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler_);
}

uint64_t objc_msgSend_forEachRelevantAccessClaimForEvaluatingAgainstClaim_performProcedure_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_forEachRelevantAccessClaimForEvaluatingAgainstClaim_performProcedure_);
}

uint64_t objc_msgSend_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender_);
}

uint64_t objc_msgSend_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender_);
}

uint64_t objc_msgSend_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_forwardRelinquishmentForWritingClaim_withID_purposeID_subitemURL_options_completionHandler_);
}

uint64_t objc_msgSend_getBytes_maxLength_filledLength_encoding_allowLossyConversion_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getBytes_maxLength_filledLength_encoding_allowLossyConversion_range_remainingRange_);
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}

uint64_t objc_msgSend_getDebugInformationIncludingEverything_withString_fromPid_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getDebugInformationIncludingEverything_withString_fromPid_thenContinue_);
}

uint64_t objc_msgSend_getExternalRepresentation_extendedAttributes_forWritingToURLOrPath_usingEncoding_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getExternalRepresentation_extendedAttributes_forWritingToURLOrPath_usingEncoding_error_);
}

uint64_t objc_msgSend_initByResolvingBookmarkData_options_relativeToURL_bookmarkDataIsStale_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initByResolvingBookmarkData_options_relativeToURL_bookmarkDataIsStale_error_);
}

uint64_t objc_msgSend_initWithAttributedStringMarkdown_formatConfiguration_bundle_tableURL_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithAttributedStringMarkdown_formatConfiguration_bundle_tableURL_);
}

uint64_t objc_msgSend_initWithContainerClassID_key_baseGetter_baseSetter_containerIsa_proxyClass_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithContainerClassID_key_baseGetter_baseSetter_containerIsa_proxyClass_);
}

uint64_t objc_msgSend_initWithContainerClassID_key_nonmutatingMethods_mutatingMethods_proxyClass_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithContainerClassID_key_nonmutatingMethods_mutatingMethods_proxyClass_);
}

uint64_t objc_msgSend_initWithInsertIndexes_insertedObjects_removeIndexes_removedObjects_additionalChanges_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithInsertIndexes_insertedObjects_removeIndexes_removedObjects_additionalChanges_);
}

uint64_t objc_msgSend_initWithKeyboardLayoutType_keyboardType_identifier_primaryLanguage_flags_timestamp_characters_charactersIgnoringModifiers_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithKeyboardLayoutType_keyboardType_identifier_primaryLanguage_flags_timestamp_characters_charactersIgnoringModifiers_);
}

uint64_t objc_msgSend_initWithLeftSingleQuote_rightSingleQuote_apostrophe_leftDoubleQuote_rightDoubleQuote_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithLeftSingleQuote_rightSingleQuote_apostrophe_leftDoubleQuote_rightDoubleQuote_);
}

uint64_t objc_msgSend_initWithNSStringEncoding_CFStringEncoding_stackBuffer_bufferLength_placeholder_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithNSStringEncoding_CFStringEncoding_stackBuffer_bufferLength_placeholder_);
}

uint64_t objc_msgSend_initWithRange_date_timeZone_duration_referenceDate_underlyingResult_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithRange_date_timeZone_duration_referenceDate_underlyingResult_);
}

uint64_t objc_msgSend_initWithRange_date_timeZone_duration_referenceDate_underlyingResult_timeIsSignificant_timeIsApproximate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRange_date_timeZone_duration_referenceDate_underlyingResult_timeIsSignificant_timeIsApproximate_);
}

uint64_t objc_msgSend_initWithRange_date_timeZone_duration_referenceDate_underlyingResult_timeIsSignificant_timeIsApproximate_timeIsPast_leadingText_trailingText_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRange_date_timeZone_duration_referenceDate_underlyingResult_timeIsSignificant_timeIsApproximate_timeIsPast_leadingText_trailingText_);
}

uint64_t objc_msgSend_initWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_);
}

uint64_t objc_msgSend_initWithString_syllableCount_lastSyllableIsPartial_score_replacementCount_transpositionCount_insertionCount_deletionCount_indexOfFirstModification_rangeCount_ranges_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithString_syllableCount_lastSyllableIsPartial_score_replacementCount_transpositionCount_insertionCount_deletionCount_indexOfFirstModification_rangeCount_ranges_);
}

uint64_t objc_msgSend_initWithValidatedFormat_validFormatSpecifiers_locale_arguments_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithValidatedFormat_validFormatSpecifiers_locale_arguments_error_);
}

uint64_t objc_msgSend_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_loadItemForTypeIdentifier_completionHandler_expectedValueClass_options_);
}

uint64_t objc_msgSend_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter_);
}

uint64_t objc_msgSend_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue_);
}

uint64_t objc_msgSend_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue_);
}

uint64_t objc_msgSend_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue_);
}

uint64_t objc_msgSend_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue_);
}

uint64_t objc_msgSend_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_movingItemAtURL_requiresProvidingWithDestinationDirectoryURL_newFileName_completionHandler_);
}

uint64_t objc_msgSend_object_withObservance_didChangeValueForKeyOrKeys_recurse_forwardingValues_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_object_withObservance_didChangeValueForKeyOrKeys_recurse_forwardingValues_);
}

uint64_t objc_msgSend_object_withObservance_willChangeValueForKeyOrKeys_recurse_forwardingValues_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_object_withObservance_willChangeValueForKeyOrKeys_recurse_forwardingValues_);
}

uint64_t objc_msgSend_observeMoveByWriterWithPurposeID_withPhysicalDestinationURL_withFSID_andFileID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_observeMoveByWriterWithPurposeID_withPhysicalDestinationURL_withFSID_andFileID_);
}

uint64_t objc_msgSend_observeMoveOfSubitemAtURL_toURL_byWriterWithPurposeID_withFSID_andFileID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_observeMoveOfSubitemAtURL_toURL_byWriterWithPurposeID_withFSID_andFileID_);
}

uint64_t objc_msgSend_observeMoveToURL_withSubitemURL_byWriterWithPurposeID_withFSID_andFileID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_observeMoveToURL_withSubitemURL_byWriterWithPurposeID_withFSID_andFileID_);
}

uint64_t objc_msgSend_parser_foundAttributeDeclarationWithName_forElement_type_defaultValue_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_parser_foundAttributeDeclarationWithName_forElement_type_defaultValue_);
}

uint64_t objc_msgSend_parser_foundUnparsedEntityDeclarationWithName_publicID_systemID_notationName_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_parser_foundUnparsedEntityDeclarationWithName_publicID_systemID_notationName_);
}

uint64_t objc_msgSend_performMateralizationOfURL_withProvider_fakeClaim_kernelInfo_requestID_fromProcess_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_performMateralizationOfURL_withProvider_fakeClaim_kernelInfo_requestID_fromProcess_completionHandler_);
}

uint64_t objc_msgSend_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_performRemoteDeletePrerelinquishmentIfNecessaryUsingBlock_withReply_);
}

uint64_t objc_msgSend_prepareFileForUploadingAtURL_originalURLExtension_inDirectory_destinationSandboxExtension_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_prepareFileForUploadingAtURL_originalURLExtension_inDirectory_destinationSandboxExtension_completionHandler_);
}

uint64_t objc_msgSend_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_provideItemForKernelRequestWithInfo_atURL_forProcess_withOptions_completionHandler_);
}

uint64_t objc_msgSend_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_);
}

uint64_t objc_msgSend_relinquishToWritingClaimWithID_options_purposeID_subitemPath_resultHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_relinquishToWritingClaimWithID_options_purposeID_subitemPath_resultHandler_);
}

uint64_t objc_msgSend_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_relinquishToWritingClaimWithID_options_purposeID_subitemURL_completionHandler_);
}

uint64_t objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_);
}

uint64_t objc_msgSend_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error_);
}

uint64_t objc_msgSend_willProcessInflectableRange_sourceSubstring_inflectionRule_target_alternative_assumedInflectionFallback_fallbackWasUsed_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_willProcessInflectableRange_sourceSubstring_inflectionRule_target_alternative_assumedInflectionFallback_fallbackWasUsed_);
}

uint64_t objc_msgSend_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_writerWithPurposeID_didVersionChangeOfKind_toItemAtURL_withClientID_name_);
}