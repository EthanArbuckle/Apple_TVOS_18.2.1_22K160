@interface NSSimpleAttributeDictionary
+ (id)emptyAttributeDictionary;
+ (id)newWithDictionary:(id)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newWithKey:(id)a3 object:(id)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)slotForKey:(id)a3;
- (void)dealloc;
@end

@implementation NSSimpleAttributeDictionary

+ (id)emptyAttributeDictionary
{
  if (qword_18C494A48 != -1) {
    dispatch_once(&qword_18C494A48, &__block_literal_global_1);
  }
  return (id)_MergedGlobals_19;
}

_DWORD *__55__NSSimpleAttributeDictionary_emptyAttributeDictionary__block_invoke()
{
  v0 = (objc_class *)objc_opt_self();
  result = NSAllocateObject(v0, 0LL, 0LL);
  _MergedGlobals_19 = (uint64_t)result;
  result[2] = 0;
  return result;
}

+ (id)newWithDictionary:(id)a3
{
  id v18 = a3;
  if (a3)
  {
    objc_opt_self();
    char isKindOfClass = objc_opt_isKindOfClass();
    a3 = v18;
    if ((isKindOfClass & 1) != 0) {
      return v18;
    }
  }

  uint64_t v6 = [a3 count];
  if (!v6) {
    return (id)[a1 emptyAttributeDictionary];
  }
  unint64_t v7 = v6;
  v8 = (void *)[v18 keyEnumerator];
  v9 = (objc_class *)objc_opt_self();
  v10 = NSAllocateObject(v9, 24 * v7 - 24, 0LL);
  v10[2] = v7;
  uint64_t v11 = [v8 nextObject];
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      unint64_t v13 = [v12 hash];
      unint64_t v14 = v13 % v7;
      v15 = (void *)[v18 objectForKey:v12];
      v16 = v10 + 4;
      while (*(void *)&v16[6 * v14 + 2])
      {
        if (v14 + 1 == v7) {
          unint64_t v14 = 0LL;
        }
        else {
          ++v14;
        }
      }

      uint64_t v17 = 3 * v14;
      *(void *)&v16[2 * v17] = v13;
      *(void *)&v10[2 * v17 + 6] = [v12 copyWithZone:0];
      *(void *)&v10[2 * v17 + 8] = v15;
      v12 = (void *)[v8 nextObject];
    }

    while (v12);
  }

  return v10;
}

- (id)newWithKey:(id)a3 object:(id)a4
{
  unint64_t v6 = -[NSSimpleAttributeDictionary slotForKey:](self, "slotForKey:");
  unint64_t v7 = self;
  unint64_t v8 = v6;
  unsigned int numElements = self->numElements;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = numElements + 1;
  }
  else {
    unint64_t v10 = numElements;
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id var0 = self->elements[v6].var0;
    if (var0 == a4) {
      return v7;
    }
    int v12 = [var0 isEqual:a4];
    unint64_t v7 = self;
    if (v12) {
      return v7;
    }
  }

  unint64_t v14 = (objc_class *)objc_opt_self();
  v15 = NSAllocateObject(v14, 24LL * v10 - 24, 0LL);
  v15[2] = v10;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((_DWORD)v10)
    {
      id v16 = a4;
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (i == self->numElements)
        {
          unint64_t hash = [a3 hash];
          id key = a3;
          id v20 = v16;
        }

        else
        {
          v21 = &self->elements[i];
          id key = v21->key;
          id v20 = v21->var0;
          unint64_t hash = v21->hash;
        }

        unint64_t v22 = hash % v10;
        v23 = v15 + 4;
        while (1)
        {
          v24 = &v23[6 * v22];
          uint64_t v26 = *((void *)v24 + 1);
          v25 = v24 + 2;
          if (!v26) {
            break;
          }
          if (v22 + 1 == v10) {
            unint64_t v22 = 0LL;
          }
          else {
            ++v22;
          }
        }

        v27 = (unint64_t *)&v23[6 * v22];
        unint64_t *v27 = hash;
        void *v25 = [key copyWithZone:0];
        v27[2] = (unint64_t)v20;
      }
    }
  }

  else
  {
    id v34 = a4;
    unint64_t v28 = self->numElements;
    if ((_DWORD)v28)
    {
      unint64_t v29 = 0LL;
      v30 = v15;
      v31 = self;
      do
      {
        if (v8 != v29)
        {
          v32 = v31->elements[0].key;
          v30[2] = v31->elements[0].hash;
          v30[3] = -[value copyWithZone:](v32, "copyWithZone:", 0LL, v34);
          v30[4] = v31->elements[0].var0;
          unint64_t v28 = self->numElements;
        }

        ++v29;
        v31 = (NSSimpleAttributeDictionary *)((char *)v31 + 24);
        v30 += 3;
      }

      while (v29 < v28);
    }

    v33 = &v15[6 * v8 + 4];
    void *v33 = objc_msgSend(a3, "hash", v34);
    v33[1] = [a3 copyWithZone:0];
    v33[2] = v35;
  }

  return v15;
}

- (unint64_t)count
{
  return self->numElements;
}

- (unint64_t)slotForKey:(id)a3
{
  uint64_t numElements = self->numElements;
  if (!(_DWORD)numElements) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v6 = 0LL;
  elements = self->elements;
  for (uint64_t i = &self->elements[0].key; *i != a3; i += 3)
  {
    if (numElements == ++v6)
    {
      unint64_t v9 = [a3 hash];
      unint64_t v10 = self->numElements;
      unint64_t v11 = v9 % v10;
      unint64_t v6 = v9 % v10;
      do
      {
        if (elements[v6].hash == v9)
        {
          if ((-[value isEqual:](elements[v6].key, "isEqual:", a3) & 1) != 0) {
            return v6;
          }
          unint64_t v10 = self->numElements;
        }

        if (v6 + 1 == v10) {
          unint64_t v6 = 0LL;
        }
        else {
          ++v6;
        }
      }

      while (v6 != v11);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  unint64_t v4 = -[NSSimpleAttributeDictionary slotForKey:](self, "slotForKey:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return self->elements[v4].var0;
  }
}

- (id)keyEnumerator
{
  return (id)[objc_allocWithZone((Class)NSSimpleAttributeDictionaryEnumerator) initWithAttributeDictionary:self];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self->numElements)
  {
    unint64_t v3 = 0LL;
    p_id var0 = &self->elements[0].var0;
    do
    {

      id v5 = *p_var0;
      p_var0 += 3;

      ++v3;
    }

    while (v3 < self->numElements);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSSimpleAttributeDictionary;
  -[NSSimpleAttributeDictionary dealloc](&v6, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t numElements = self->numElements;
  if (numElements < 0x29)
  {
    if ((_DWORD)numElements)
    {
      p_id var0 = &self->elements[0].var0;
      objc_super v6 = v10;
      uint64_t v7 = v11;
      do
      {
        *v7++ = *(p_var0 - 1);
        id v8 = *p_var0;
        p_var0 += 3;
        *v6++ = v8;
        --numElements;
      }

      while (numElements);
    }

    return (id)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603FC8], "allocWithZone:", a3),  "initWithObjects:forKeys:count:",  v10,  v11,  self->numElements);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSSimpleAttributeDictionary;
    return -[NSSimpleAttributeDictionary mutableCopyWithZone:](&v9, sel_mutableCopyWithZone_, a3);
  }

@end