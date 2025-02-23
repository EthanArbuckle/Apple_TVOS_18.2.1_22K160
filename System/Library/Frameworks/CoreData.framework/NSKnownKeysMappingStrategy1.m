@interface NSKnownKeysMappingStrategy1
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CFMutableArrayRef)_makeBranchTableForKeys:(const void *)a1 count:(unint64_t)a2;
- (Class)classForCoder;
- (NSKnownKeysMappingStrategy1)initWithCoder:(id)a3;
- (id)allKeys;
- (id)description;
- (id)initForKeys:(id *)a3 count:(unint64_t)a4;
- (id)initForKeys:(id)a3;
- (id)keys;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)fastIndexForKnownKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)indexForKey:(id)a3;
- (unint64_t)length;
- (void)_coreCreationForKeys:(unint64_t)a3 count:;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSKnownKeysMappingStrategy1

- (unint64_t)indexForKey:(id)a3
{
  return _PFRawIndexForKnownKey(self, (__CFString *)a3);
}

- (id)initForKeys:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a3 count];
  unint64_t v6 = MEMORY[0x1895F8858](v5);
  v9 = (char *)v12 - v8;
  if (v6 > 0x200) {
    v9 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v12 - v8, 8 * v7);
  }
  objc_msgSend(a3, "getObjects:range:", v9, 0, v5);
  id v10 = -[NSKnownKeysMappingStrategy1 initForKeys:count:](self, "initForKeys:count:", v9, v5);
  if (v5 >= 0x201) {
    NSZoneFree(0LL, v9);
  }
  return v10;
}

- (id)initForKeys:(id *)a3 count:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSKnownKeysMappingStrategy1;
  unint64_t v6 = -[NSKnownKeysMappingStrategy1 init](&v9, sel_init);
  uint64_t v7 = v6;
  if (v6) {
    -[NSKnownKeysMappingStrategy1 _coreCreationForKeys:count:](v6, (uint64_t)a3, a4);
  }
  return v7;
}

- (void)_coreCreationForKeys:(unint64_t)a3 count:
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  unint64_t v3 = a3;
  if (a3 > 0x8000) {
    goto LABEL_19;
  }
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (const void **)((char *)v24 - v7);
  if (v3 >= 0x201)
  {
    uint64_t v8 = (const void **)NSAllocateScannedUncollectable();
LABEL_7:
    for (uint64_t i = 0LL; i != v3; ++i)
    {
      v11 = *(void **)(a2 + 8 * i);
      id v12 = v11;
      uint64_t v13 = [v11 UTF8String];
      if (!v13)
      {
        unint64_t v3 = MEMORY[0x189603F70];
        uint64_t v18 = *MEMORY[0x189603A60];
        uint64_t v19 = [NSString stringWithFormat:@"%@ cannot be encoded as UTF-8", v11];
        v20 = (void *)v3;
        for (uint64_t j = v18; ; uint64_t j = v23)
        {
          objc_exception_throw((id)[v20 exceptionWithName:j reason:v19 userInfo:0]);
LABEL_19:
          v22 = (void *)MEMORY[0x189603F70];
          uint64_t v23 = *MEMORY[0x189603A60];
          uint64_t v19 = [NSString stringWithFormat:@"%@ supports a maximum of 32,768 elements.  parameter was %lu", objc_opt_class(), v3];
          v20 = v22;
        }
      }

      v8[i] = (const void *)v13;
    }

    char v9 = 0;
    goto LABEL_11;
  }

  bzero((char *)v24 - v7, 8 * v6);
  if (v3) {
    goto LABEL_7;
  }
  char v9 = 1;
LABEL_11:
  a1[3] = v3;
  a1[4] = 0LL;
  v14 = -[NSKnownKeysMappingStrategy1 _makeBranchTableForKeys:count:](v8, v3);
  CFIndex Count = CFArrayGetCount(v14);
  v16 = (const void **)PF_CALLOC_SCANNED_BYTES(8 * Count + 8);
  a1[2] = v16;
  v25.location = 0LL;
  v25.length = Count;
  CFArrayGetValues(v14, v25, v16);
  CFRelease(v14);
  *(void *)(a1[2] + 8 * Count) = 0LL;
  a1[5] = PF_ALLOCATE_OBJECT_ARRAY(v3);
  if ((v9 & 1) == 0)
  {
    uint64_t v17 = 0LL;
    do
    {
      *(void *)(a1[5] + 8 * v17) = *(void *)(a2 + 8 * v17);
      ++v17;
    }

    while (v3 != v17);
  }

  if (v3 >= 0x201) {
    NSZoneFree(0LL, v8);
  }
}

- (CFMutableArrayRef)_makeBranchTableForKeys:(const void *)a1 count:(unint64_t)a2
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  memset(&valueCallBacks, 0, sizeof(valueCallBacks));
  valueCallBacks.release = *(CFDictionaryReleaseCallBack *)(MEMORY[0x189605250] + 16LL);
  if (!a2) {
    return CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  }
  unint64_t v2 = a2;
  if (a2 >= 0x201) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = a2;
  }
  unint64_t v5 = (8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v6 = (const void **)((char *)&v21 - v5);
  size_t v7 = 8 * a2;
  if (v2 > 0x200) {
    uint64_t v6 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v21 - v5, v7);
  }
  id v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v11 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x189604DB0], a1, v6, v2, 0LL, 0LL);
  if (v2 >= 0x201) {
    NSZoneFree(0LL, v6);
  }
  id v12 = CFDictionaryCreateMutable(v10, 0LL, 0LL, &valueCallBacks);
  do
  {
    uint64_t v13 = *a1;
    v14 = (const void *)strlen((const char *)*a1);
    Value = (void *)CFDictionaryGetValue(v12, v14);
    if (!Value)
    {
      Value = CFArrayCreateMutable(v10, 0LL, 0LL);
      CFDictionarySetValue(v12, v14, Value);
    }

    CFArrayAppendValue((CFMutableArrayRef)Value, v13);
    ++a1;
    --v2;
  }

  while (v2);
  unint64_t Count = CFDictionaryGetCount(v12);
  unint64_t v17 = Count;
  if (Count <= 1) {
    uint64_t v18 = 1LL;
  }
  else {
    uint64_t v18 = Count;
  }
  if (Count >= 0x201) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = v18;
  }
  v20 = (const void **)((char *)&v21 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (Count > 0x200) {
    v20 = (const void **)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v21 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v18);
  }
  CFDictionaryGetKeysAndValues(v12, 0LL, v20);
  __int128 v24 = xmmword_189EA7F88;
  CFMergeSortArray();
  CFArrayRef Mutable = CFArrayCreateMutable(v10, 0LL, 0LL);
  makeBranchRow(&Mutable, (CFArrayRef *)v20, v17, v11, 0, 0, 0LL, 0);
  CFRelease(v11);
  if (v17 >= 0x201) {
    NSZoneFree(0LL, v20);
  }
  CFRelease(v12);
  return Mutable;
}

- (void)dealloc
{
  if (self)
  {
    table = (void **)self->_table;
    if (table)
    {
      uint64_t v4 = *table;
      if (*table)
      {
        unint64_t v5 = table + 1;
        do
        {
          uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone)
          {
            uint64_t v6 = malloc_default_zone();
            uint64_t v4 = *(v5 - 1);
          }

          malloc_zone_free(v6, v4);
          size_t v7 = *v5++;
          uint64_t v4 = v7;
        }

        while (v7);
      }

      uint64_t v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v8 = malloc_default_zone();
      }
      malloc_zone_free(v8, self->_table);
    }

    self->_table = 0LL;
    keys = self->_keys;
    if (keys)
    {
      unint64_t length = self->_length;
      if (length)
      {
        do
        {
          v11 = *keys++;

          --length;
        }

        while (length);
        keys = self->_keys;
      }

      PF_FREE_OBJECT_ARRAY(keys);
    }

    self->_keys = 0LL;
    self->_unint64_t length = 0LL;
    _PFDeallocateObject(self);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    objc_opt_self();
    objc_opt_class();
  }

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

- (unint64_t)fastIndexForKnownKey:(id)a3
{
  return _PFRawFastIndexForKnownKey(self, (__CFString *)a3, &v4);
}

- (unint64_t)length
{
  return self->_length;
}

- (id)keys
{
  return self->_keys;
}

- (id)allKeys
{
  return (id)[MEMORY[0x189603F18] arrayWithObjects:self->_keys count:self->_length];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }

  else if (a3 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (unint64_t length = self->_length, length == *((void *)a3 + 3)))
  {
    if (length)
    {
      uint64_t v6 = 0LL;
      while (1)
      {
        id v7 = self->_keys[v6];
        if (v7 != *(id *)(*((void *)a3 + 5) + 8 * v6))
        {
          int v8 = objc_msgSend(v7, "isEqual:");
          if (!v8) {
            break;
          }
        }

        if (length == ++v6) {
          goto LABEL_10;
        }
      }
    }

    else
    {
LABEL_10:
      LOBYTE(v8) = 1;
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t length = self->_length;
  if (length) {
    return length & 0x7F | ([*self->_keys hash] << 7);
  }
  return length;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (NSKnownKeysMappingStrategy1)initWithCoder:(id)a3
{
  unint64_t v4 = self;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  self->_unint64_t length = [a3 decodeInt64ForKey:@"length"];
  unint64_t v5 = (void *)MEMORY[0x189604010];
  uint64_t v6 = objc_opt_class();
  id v7 = (void *)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0),  @"keys");
  unint64_t v8 = [v7 count];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v23 + 1) + 8 * v12) isNSString])
        {
          v15 = (void *)MEMORY[0x189607870];
          uint64_t v16 = *MEMORY[0x189607460];
          unint64_t v17 = &unk_189F03680;
          uint64_t v18 = 4866LL;
          goto LABEL_16;
        }

        ++v12;
      }

      while (v10 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v10 = v9;
      if (v9) {
        continue;
      }
      break;
    }
  }

  unint64_t length = v4->_length;
  if (length != v8 || length >= 0x7FFF)
  {
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x189607460];
    unint64_t v17 = &unk_189F036A8;
    uint64_t v18 = 4864LL;
LABEL_16:
    objc_msgSend(a3, "failWithError:", objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v18, v17));

    return 0LL;
  }

  else
  {
    MEMORY[0x1895F8858](v9);
    v22 = (char *)&v23 - v21;
    if (v8 > 0x200) {
      v22 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v23 - v21, 8 * v20);
    }
    objc_msgSend(v7, "getObjects:range:", v22, 0, v8);
    -[NSKnownKeysMappingStrategy1 _coreCreationForKeys:count:](v4, (uint64_t)v22, v8);
    if (v8 >= 0x201) {
      NSZoneFree(0LL, v22);
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:self->_keys count:self->_length];
  [a3 encodeObject:v5 forKey:@"keys"];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = &self->_length;
  }
  unint64_t result = 0LL;
  a3->var1 = a4;
  if (a5)
  {
    unint64_t length = self->_length;
    if (var0 < length)
    {
      unint64_t result = 0LL;
      do
        a4[result++] = self->_keys[var0++];
      while (var0 < length && result < a5);
    }
  }

  a3->unint64_t var0 = var0;
  return result;
}

- (id)description
{
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:self->_keys count:self->_length];
  table = (uint64_t *)self->_table;
  if (self->_length < 0x401)
  {
    if (table)
    {
      if (*table)
      {
        uint64_t v7 = 0LL;
        while (table[++v7])
          ;
        uint64_t v9 = (__CFString *)objc_msgSend( MEMORY[0x189607940],  "stringWithFormat:",  @"mapping table %p has %d branch rows:",  self->_table,  v7);
        uint64_t v10 = *table;
        if (*table)
        {
          uint64_t v11 = 0LL;
          do
          {
            -[__CFString appendFormat:](v9, "appendFormat:", @"\n\t %@", descriptionForBranchRow(v10, v11));
            uint64_t v10 = table[++v11];
          }

          while (v10);
        }
      }

      else
      {
        uint64_t v9 = @"mapping table has 0 branch rows";
      }
    }

    else
    {
      uint64_t v9 = @"mapping table pointer is NULL";
    }
  }

  else
  {
    if (table)
    {
      uint64_t v5 = *table;
      if (*table)
      {
        uint64_t v5 = 0LL;
        while (table[++v5])
          ;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    uint64_t v9 = (__CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"mapping table %p has %d branch rows: (...)",  self->_table,  v5);
  }

  uint64_t v12 = (void *)NSString;
  uint64_t v13 = (objc_class *)objc_opt_class();
  v14 = (void *)[v12 stringWithFormat:@"%@ (%p) table of length %d with known keys:%@ and %@", NSStringFromClass(v13), self, self->_length, v3, v9];

  return v14;
}

@end