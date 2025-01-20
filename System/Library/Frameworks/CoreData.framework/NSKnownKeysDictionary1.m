@interface NSKnownKeysDictionary1
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
+ (id)initForKeys:(id)a3;
+ (id)initWithCoder:(id)a3;
+ (id)initWithDictionary:(id)a3;
+ (id)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
+ (id)initWithObjects:(id *)a3 forKeys:(id *)a4 count:(unint64_t)a5;
+ (id)initWithSearchStrategy:(id)a3;
- (BOOL)isEqualToDictionary:(id)a3;
- (Class)classForCoder;
- (const)knownKeyValuesPointer;
- (const)values;
- (id)allKeys;
- (id)allValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)mapping;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (uint64_t)_recount;
- (unint64_t)_countByEnumeratingWithState:(unint64_t)a3 objects:(unint64_t)a4 count:(char)a5 forKeys:;
- (unint64_t)_valueCountByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_setValues:(id *)a3 retain:(BOOL)a4;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getKeys:(id *)a3;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 andKeys:(id *)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 atIndex:(unint64_t)a4;
- (void)setValues:(id *)a3;
@end

@implementation NSKnownKeysDictionary1

- (const)values
{
  return (const void **)self->_values;
}

- (id)objectForKey:(id)a3
{
  uint64_t v4 = _PFRawIndexForKnownKey(&self->_keySearch->super.isa, (__CFString *)a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return self->_values[v4];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"searchMapping"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"emptyToken"];
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), @"values");
  unint64_t v8 = [v7 count];
  unint64_t v9 = [v5 length];
  if (v8 == v9 && v9 < 0x7FFF)
  {
    else {
      uint64_t v12 = v8;
    }
    if (v8 <= 1) {
      uint64_t v13 = 1LL;
    }
    else {
      uint64_t v13 = v8;
    }
    v11 = _PFAllocateObject((Class)a1, 8 * v12);
    id v14 = v5;
    v11[2] = v14;
    MEMORY[0x1895F8858](v14);
    v16 = (char *)v21 - v15;
    if (v8 >= 0x201)
    {
      v16 = (char *)NSAllocateScannedUncollectable();
      objc_msgSend(v7, "getObjects:range:", v16, 0, v8);
    }

    else
    {
      bzero((char *)v21 - v15, 8 * v13);
      objc_msgSend(v7, "getObjects:range:", v16, 0, v8);
      if (!v8)
      {
        int v17 = 0;
LABEL_24:
        *((_DWORD *)v11 + 3) = v17;
        return v11;
      }
    }

    uint64_t v18 = 0LL;
    int v17 = 0;
    do
    {
      v19 = *(void **)&v16[8 * v18];
      if (v19 != (void *)v6 && ([*(id *)&v16[8 * v18] isEqual:v6] & 1) == 0)
      {
        v11[v18 + 3] = v19;
        ++v17;
      }

      ++v18;
    }

    while (v8 != v18);
    if (v8 >= 0x201) {
      NSZoneFree(0LL, v16);
    }
    goto LABEL_24;
  }

  objc_msgSend( a3,  "failWithError:",  objc_msgSend(MEMORY[0x189607870], "errorWithDomain:code:userInfo:", *MEMORY[0x189607460], 4864, &unk_189F036D0));

  return 0LL;
}

+ (id)initWithSearchStrategy:(id)a3
{
  uint64_t v5 = [a3 length];
  if (v5 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v5;
  }
  v7 = _PFAllocateObject((Class)a1, 8 * v6);
  v7[2] = a3;
  *((_DWORD *)v7 + 3) = -1;
  return v7;
}

+ (id)initForKeys:(id)a3
{
  id v4 = -[NSKnownKeysMappingStrategy initForKeys:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:",  a3);
  uint64_t v5 = (void *)[a1 initWithSearchStrategy:v4];

  return v5;
}

+ (id)initWithObjects:(id *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  id v8 = -[NSKnownKeysMappingStrategy initForKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:count:",  a4,  a5);
  unint64_t v9 = (_DWORD *)[a1 initWithSearchStrategy:v8];

  if (a5)
  {
    unint64_t v10 = 0LL;
    int v11 = 0;
    unsigned int v12 = 1;
    do
    {
      id v13 = a3[v10];
      *(void *)&v9[2 * v10 + 6] = v13;
      if (v13) {
        ++v11;
      }
      unint64_t v10 = v12++;
    }

    while (v10 < a5);
  }

  else
  {
    int v11 = 0;
  }

  v9[3] = v11;
  return v9;
}

+ (id)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  BOOL v27 = a4;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  unint64_t v6 = [a3 count];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_DWORD *)objc_msgSend(a1, "initWithSearchStrategy:", objc_msgSend(a3, "mapping"));
    if (v7)
    {
      uint64_t v8 = [a3 values];
      if (v6)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 0LL;
        int v11 = 0;
        do
        {
          unsigned int v12 = *(void **)(v9 + 8 * v10);
          if (v12)
          {
            if (v27) {
              id v13 = (id)[v12 copy];
            }
            else {
              id v13 = v12;
            }
            ++v11;
            *(void *)&v7[2 * v10 + 6] = v13;
          }

          ++v10;
        }

        while (v6 != v10);
      }

      else
      {
        int v11 = 0;
      }

      goto LABEL_34;
    }
  }

  else
  {
    id v14 = (_DWORD *)objc_msgSend(a1, "initForKeys:", objc_msgSend(a3, "allKeys"));
    v7 = v14;
    if (v14)
    {
      uint64_t v15 = (void *)[v14 mapping];
      if (v6 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v6;
      }
      if (v6 >= 0x201) {
        uint64_t v17 = 1LL;
      }
      else {
        uint64_t v17 = v16;
      }
      uint64_t v18 = (char *)v26 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      size_t v19 = 8 * v16;
      if (v6 >= 0x201)
      {
        uint64_t v18 = (char *)NSAllocateScannedUncollectable();
        v20 = (char *)NSAllocateScannedUncollectable();
        [a3 getObjects:v18 andKeys:v20];
      }

      else
      {
        bzero((char *)v26 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v16);
        v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        bzero(v20, v19);
        [a3 getObjects:v18 andKeys:v20];
        if (!v6)
        {
          int v11 = 0;
LABEL_34:
          v7[3] = v11;
          return v7;
        }
      }

      v26[1] = v26;
      uint64_t v21 = 0LL;
      int v11 = 0;
      do
      {
        uint64_t v22 = [v15 fastIndexForKnownKey:*(void *)&v20[8 * v21]];
        v23 = *(void **)&v18[8 * v21];
        if (v27) {
          id v24 = (id)[*(id *)&v18[8 * v21] copy];
        }
        else {
          id v24 = v23;
        }
        *(void *)&v7[2 * v22 + 6] = v24;
        if (v23) {
          ++v11;
        }
        ++v21;
      }

      while (v6 != v21);
      if (v6 >= 0x201)
      {
        NSZoneFree(0LL, v18);
        NSZoneFree(0LL, v20);
      }

      goto LABEL_34;
    }
  }

  return v7;
}

+ (id)initWithDictionary:(id)a3
{
  return (id)[a1 initWithDictionary:a3 copyItems:0];
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 0;
}

- (void)dealloc
{
  unint64_t v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v3)
  {
    unint64_t v4 = v3;
    values = self->_values;
    do
    {
      unint64_t v6 = *values++;

      --v4;
    }

    while (v4);
  }

  self->_keySearch = 0LL;
  _PFDeallocateObject(self);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  [a3 encodeInt32:1 forKey:@"version"];
  [a3 encodeObject:self->_keySearch forKey:@"searchMapping"];
  uint64_t v5 = (void *)[objc_alloc(NSString) initWithUTF8String:"__empty_slot_token_4c24_98dc_ac1e_b773__"];
  [a3 encodeObject:v5 forKey:@"emptyToken"];
  unint64_t v6 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  unint64_t v7 = v6;
  if (v6 <= 1) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v6;
  }
  if (v6 >= 0x201) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = (char *)v14 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v6 >= 0x201)
  {
    uint64_t v10 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v14 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v8);
    if (!v7) {
      goto LABEL_15;
    }
  }

  uint64_t v11 = 0LL;
  do
  {
    id v12 = self->_values[v11];
    if (!v12) {
      id v12 = v5;
    }
    *(void *)&v10[8 * v11++] = v12;
  }

  while (v7 != v11);
LABEL_15:
  id v13 = (void *)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v10 count:v7];
  [a3 encodeObject:v13 forKey:@"values"];

  if (v7 >= 0x201) {
    NSZoneFree(0LL, v10);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary1),  "initWithSearchStrategy:",  self->_keySearch);
  v4->_count = self->_count;
  unint64_t v5 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v5)
  {
    unint64_t v6 = v5;
    values = self->_values;
    uint64_t v8 = v4->_values;
    do
    {
      uint64_t v9 = *values++;
      *v8++ = v9;
      --v6;
    }

    while (v6);
  }

  return v4;
}

- (uint64_t)_recount
{
  if (result)
  {
    uint64_t v1 = result;
    result = [*(id *)(result + 16) length];
    int v2 = 0;
    if (result)
    {
      unint64_t v3 = (void *)(v1 + 24);
      do
      {
        if (*v3++) {
          ++v2;
        }
        --result;
      }

      while (result);
    }

    *(_DWORD *)(v1 + 12) = v2;
  }

  return result;
}

- (id)mapping
{
  return self->_keySearch;
}

- (const)knownKeyValuesPointer
{
  return (const void **)self->_values;
}

- (id)valueAtIndex:(unint64_t)a3
{
  return self->_values[a3];
}

- (void)setValue:(id)a3 atIndex:(unint64_t)a4
{
  values = self->_values;
  id v8 = self->_values[a4];
  if (v8)
  {
    int count = self->_count;
    if (count < 0)
    {
      -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
      int count = self->_count;
    }

    self->_int count = count - 1;
  }

  values[a4] = 0LL;
  if (a3)
  {
    int v10 = self->_count;
    if (v10 < 0)
    {
      -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
      int v10 = self->_count;
    }

    self->_int count = v10 + 1;
    values[a4] = a3;
  }

- (void)_setValues:(id *)a3 retain:(BOOL)a4
{
  BOOL v4 = a4;
  -[NSKnownKeysDictionary1 count](self, "count");
  unint64_t v7 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v7)
  {
    unint64_t v8 = v7;
    values = self->_values;
    do
    {
      id v10 = *values;
      id v11 = *a3;
      if (*values)
      {
        --self->_count;
      }

      if (v11)
      {
        if (v4) {
          id v11 = v11;
        }
        id *values = v11;
        ++self->_count;
      }

      else
      {
        id *values = 0LL;
      }

      ++a3;
      ++values;
      --v8;
    }

    while (v8);
  }

- (void)setValues:(id *)a3
{
}

- (unint64_t)count
{
  int count = self->_count;
  if (count < 0)
  {
    -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
    return self->_count;
  }

  return count;
}

- (id)keyEnumerator
{
  return  -[_NSKnownKeysEnumerator initWithArray:forTarget:withReferenceValues:andRange:andCopyItems:]( objc_alloc(&OBJC_CLASS____NSKnownKeysEnumerator),  (uint64_t)-[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys"),  self,  (uint64_t)self->_values,  0LL,  -[NSKnownKeysMappingStrategy length](self->_keySearch, "length"));
}

- (unint64_t)_countByEnumeratingWithState:(unint64_t)a3 objects:(unint64_t)a4 count:(char)a5 forKeys:
{
  if (result)
  {
    unint64_t v9 = result;
    if (!*a2) {
      a2[2] = result + 16;
    }
    a2[1] = a3;
    unint64_t v10 = [*(id *)(result + 16) length];
    uint64_t v11 = [*(id *)(v9 + 16) keys];
    if ((a5 & 1) != 0) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v9 + 24;
    }
    result = 0LL;
    unint64_t v13 = *a2;
    if (a4 && v13 < v10)
    {
      result = 0LL;
      do
      {
        if (*(void *)(v9 + 24 + 8 * v13)) {
          *(void *)(a3 + 8 * result++) = *(void *)(v12 + 8 * v13);
        }
        ++v13;
      }

      while (v13 < v10 && result < a4);
    }

    *a2 = v13;
  }

  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSKnownKeysDictionary1 _countByEnumeratingWithState:objects:count:forKeys:]( (unint64_t)self,  &a3->var0,  (unint64_t)a4,  a5,  1);
}

- (unint64_t)_valueCountByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSKnownKeysDictionary1 _countByEnumeratingWithState:objects:count:forKeys:]( (unint64_t)self,  &a3->var0,  (unint64_t)a4,  a5,  0);
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4 = _PFRawIndexForKnownKey(&self->_keySearch->super.isa, (__CFString *)a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    id v6 = self->_values[v4];
    if (v6)
    {
      int count = self->_count;
      if (count < 0)
      {
        -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
        int count = self->_count;
      }

      self->_int count = count - 1;

      self->_values[v5] = 0LL;
    }
  }

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v7 = _PFRawIndexForKnownKey(&self->_keySearch->super.isa, (__CFString *)a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189607790];
    uint64_t v15 = [NSString stringWithFormat:@"The key '%@' is not defined for this NSKnownKeysDictionary", a4];
    objc_exception_throw((id)objc_msgSend( v13,  "exceptionWithName:reason:userInfo:",  v14,  v15,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  a4,  @"NSUnknownUserInfoKey",  0)));
    -[NSKnownKeysDictionary1 allKeys](v16, v17);
  }

  else
  {
    uint64_t v8 = v7;
    values = self->_values;
    id v10 = self->_values[v7];
    if (v10)
    {
      int count = self->_count;
      if (count < 0)
      {
        -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
        int count = self->_count;
      }

      self->_int count = count - 1;
    }

    values[v8] = 0LL;
    if (a3)
    {
      int v12 = self->_count;
      if (v12 < 0)
      {
        -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
        int v12 = self->_count;
      }

      self->_int count = v12 + 1;
      values[v8] = a3;
    }
  }

- (id)allKeys
{
  unint64_t v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  uint64_t v4 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:v3];
  uint64_t v5 = -[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys");
  if (v3)
  {
    id v6 = v5;
    values = self->_values;
    do
    {
      if (*values) {
        [v4 addObject:*v6];
      }
      ++v6;
      ++values;
      --v3;
    }

    while (v3);
  }

  return v4;
}

- (id)allValues
{
  unint64_t v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  uint64_t v4 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSKnownKeysDictionary1 count](self, "count"));
  if (v3)
  {
    values = self->_values;
    do
    {
      if (*values) {
        objc_msgSend(v4, "addObject:");
      }
      ++values;
      --v3;
    }

    while (v3);
  }

  return v4;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  if (a3)
  {
    if (a4)
    {
      unint64_t v7 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
      uint64_t v8 = -[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys");
      if (v7)
      {
        uint64_t v9 = 0LL;
        values = self->_values;
        do
        {
          id v11 = *values;
          if (*values)
          {
            a4[v9] = *v8;
            a3[v9++] = v11;
          }

          ++v8;
          ++values;
          --v7;
        }

        while (v7);
      }
    }

    else
    {
      -[NSKnownKeysDictionary1 getObjects:](self, "getObjects:", a3);
    }
  }

  else if (a4)
  {
    -[NSKnownKeysDictionary1 getKeys:](self, "getKeys:", a4);
  }

- (void)getKeys:(id *)a3
{
  unint64_t v5 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  id v6 = -[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys");
  if (v5)
  {
    uint64_t v7 = 0LL;
    values = self->_values;
    do
    {
      if (*values) {
        a3[v7++] = *v6;
      }
      ++v6;
      ++values;
      --v5;
    }

    while (v5);
  }

- (void)getObjects:(id *)a3
{
  unint64_t v5 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v5)
  {
    uint64_t v6 = 0LL;
    values = self->_values;
    do
    {
      if (*values) {
        a3[v6++] = *values;
      }
      ++values;
      --v5;
    }

    while (v5);
  }

- (BOOL)isEqualToDictionary:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSKnownKeysDictionary1;
  return -[NSKnownKeysDictionary1 isEqualToDictionary:](&v6, sel_isEqualToDictionary_);
}

- (id)objectEnumerator
{
  return  -[_NSKnownKeysEnumerator initWithArray:forTarget:withReferenceValues:andRange:andCopyItems:]( objc_alloc(&OBJC_CLASS____NSKnownKeysEnumerator),  (uint64_t)self->_values,  self,  (uint64_t)self->_values,  0LL,  -[NSKnownKeysMappingStrategy length](self->_keySearch, "length"));
}

- (void)addEntriesFromDictionary:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = [a3 count];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend( (id)objc_msgSend(a3, "mapping"),  "isEqual:",  -[NSKnownKeysDictionary1 mapping](self, "mapping")))
  {
    uint64_t v6 = [a3 values];
    if (v5)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        uint64_t v9 = *(void *)(v7 + 8 * i);
        if (v9) {
          -[NSKnownKeysDictionary1 setValue:atIndex:](self, "setValue:atIndex:", v9, i);
        }
      }
    }
  }

  else
  {
    id v10 = -[NSKnownKeysDictionary1 mapping](self, "mapping");
    if (v5 <= 1) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v5;
    }
    if (v5 >= 0x201) {
      uint64_t v12 = 1LL;
    }
    else {
      uint64_t v12 = v11;
    }
    unint64_t v13 = (char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    size_t v14 = 8 * v11;
    if (v5 >= 0x201)
    {
      unint64_t v13 = (char *)NSAllocateScannedUncollectable();
      uint64_t v15 = (char *)NSAllocateScannedUncollectable();
      [a3 getObjects:v13 andKeys:v15];
    }

    else
    {
      bzero((char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v11);
      uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v15, v14);
      [a3 getObjects:v13 andKeys:v15];
      if (!v5) {
        return;
      }
    }

    for (uint64_t j = 0LL; j != v5; ++j)
    {
      uint64_t v17 = _PFRawIndexForKnownKey(v10, *(__CFString **)&v15[8 * j]);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v18 = (void *)MEMORY[0x189603F70];
        uint64_t v19 = *MEMORY[0x189607790];
        uint64_t v20 = [NSString stringWithFormat:@"The key '%@' is not defined for this NSKnownKeysDictionary", *(void *)&v15[8 * j]];
        objc_exception_throw((id)objc_msgSend( v18,  "exceptionWithName:reason:userInfo:",  v19,  v20,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  *(void *)&v15[8 * j],  @"NSUnknownUserInfoKey",  0)));
      }

      -[NSKnownKeysDictionary1 setValue:atIndex:](self, "setValue:atIndex:", *(void *)&v13[8 * j], v17);
    }

    if (v5 >= 0x201)
    {
      NSZoneFree(0LL, v13);
      NSZoneFree(0LL, v15);
    }
  }

- (void)removeAllObjects
{
  unint64_t v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v3)
  {
    unint64_t v4 = v3;
    values = self->_values;
    do
    {

      *values++ = 0LL;
      --v4;
    }

    while (v4);
  }

  self->_int count = 0;
}

@end