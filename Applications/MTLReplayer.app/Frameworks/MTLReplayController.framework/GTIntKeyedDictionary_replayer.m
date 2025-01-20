@interface GTIntKeyedDictionary_replayer
+ (BOOL)supportsSecureCoding;
- (GTIntKeyedDictionary_replayer)init;
- (GTIntKeyedDictionary_replayer)initWithCapacity:(unint64_t)a3;
- (GTIntKeyedDictionary_replayer)initWithCoder:(id)a3;
- (GTIntKeyedDictionary_replayer)initWithIntKeyedDictionary:(id)a3;
- (id)allKeys;
- (id)objectForIntKey:(int64_t)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForIntKey:(int64_t)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forIntKey:(int64_t)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation GTIntKeyedDictionary_replayer

- (GTIntKeyedDictionary_replayer)init
{
  return -[GTIntKeyedDictionary_replayer initWithCapacity:](self, "initWithCapacity:", 0LL);
}

- (GTIntKeyedDictionary_replayer)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___GTIntKeyedDictionary_replayer;
  v4 = -[GTIntKeyedDictionary_replayer init](&v8, "init");
  if (v4)
  {
    v5 = operator new(0x28uLL);
    v6 = v5;
    _OWORD *v5 = 0u;
    v5[1] = 0u;
    *((_DWORD *)v5 + 8) = 1065353216;
    if (a3) {
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v5,  a3);
    }
    v4->_private = v6;
  }

  return v4;
}

- (GTIntKeyedDictionary_replayer)initWithIntKeyedDictionary:(id)a3
{
  v4 = -[GTIntKeyedDictionary_replayer initWithCapacity:](self, "initWithCapacity:", [a3 count]);
  v5 = v4;
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = __51__GTIntKeyedDictionary_initWithIntKeyedDictionary___block_invoke;
    v7[3] = &unk_58E138;
    v7[4] = v4;
    [a3 enumerateKeysAndObjectsUsingBlock:v7];
  }

  return v5;
}

- (GTIntKeyedDictionary_replayer)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v13 = "[coder allowsKeyedCoding]";
    goto LABEL_8;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray, v5);
  id v8 = objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  +[NSSet setWithObjects:]( NSSet,  "setWithObjects:",  v6,  objc_opt_class(NSNumber, v7),  0),  @"keys");
  if (!v8)
  {
    v13 = "keys";
LABEL_8:
    __assert_rtn("-[GTIntKeyedDictionary initWithCoder:]", "", 0, v13);
  }

  v9 = v8;
  v10 = -[GTIntKeyedDictionary_replayer initWithCapacity:](self, "initWithCapacity:", [v8 count]);
  v11 = v10;
  if (v10)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __38__GTIntKeyedDictionary_initWithCoder___block_invoke;
    v14[3] = &unk_58E160;
    v14[4] = a3;
    v14[5] = v10;
    [v9 enumerateObjectsUsingBlock:v14];
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __40__GTIntKeyedDictionary_encodeWithCoder___block_invoke;
  v5[3] = &unk_58E138;
  v5[4] = a3;
  -[GTIntKeyedDictionary_replayer enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v5);
}

- (void)dealloc
{
  v3 = (char *)self->_private;
  if (v3)
  {
    for (i = (CFTypeRef *)(v3 + 16); ; CFRelease(i[3]))
    {
      i = (CFTypeRef *)*i;
      if (!i) {
        break;
      }
    }

    uint64_t v5 = (void *)std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long>>>::~__hash_table((uint64_t)v3);
    operator delete(v5);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTIntKeyedDictionary_replayer;
  -[GTIntKeyedDictionary_replayer dealloc](&v6, "dealloc");
}

- (unint64_t)count
{
  return *((void *)self->_private + 3);
}

- (void)removeAllObjects
{
  v2 = self->_private;
  if (v2[3])
  {
    v4 = (void *)v2[2];
    if (v4)
    {
      do
      {
        uint64_t v5 = (void *)*v4;
        operator delete(v4);
        v4 = v5;
      }

      while (v5);
    }

    v2[2] = 0LL;
    uint64_t v6 = v2[1];
    if (v6)
    {
      for (uint64_t j = 0LL; j != v6; ++j)
        *(void *)(*v2 + 8 * j) = 0LL;
    }

    v2[3] = 0LL;
  }

- (void)setObject:(id)a3 forIntKey:(int64_t)a4
{
  if (!a3)
  {
    -[GTIntKeyedDictionary_replayer removeObjectForIntKey:](self, "removeObjectForIntKey:", a4);
    return;
  }

  uint64_t v7 = (char *)self->_private;
  unint64_t v8 = *((void *)v7 + 1);
  if (!v8) {
    goto LABEL_20;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v4 = a4;
    if (v8 <= a4) {
      unint64_t v4 = a4 % v8;
    }
  }

  else
  {
    unint64_t v4 = (v8 - 1) & a4;
  }

  v10 = *(void **)(*(void *)v7 + 8 * v4);
  if (!v10 || (v11 = (void *)*v10) == 0LL)
  {
LABEL_20:
    v13 = operator new(0x20uLL);
    void *v13 = 0LL;
    v13[1] = a4;
    v13[2] = a4;
    v13[3] = a3;
    float v14 = (float)(unint64_t)(*((void *)v7 + 3) + 1LL);
    float v15 = *((float *)v7 + 8);
    if (!v8 || (float)(v15 * (float)v8) < v14)
    {
      BOOL v16 = 1LL;
      if (v8 >= 3) {
        BOOL v16 = (v8 & (v8 - 1)) != 0;
      }
      unint64_t v17 = v16 | (2 * v8);
      unint64_t v18 = vcvtps_u32_f32(v14 / v15);
      if (v17 <= v18) {
        size_t v19 = v18;
      }
      else {
        size_t v19 = v17;
      }
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>( (uint64_t)v7,  v19);
      unint64_t v8 = *((void *)v7 + 1);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v8 <= a4) {
          unint64_t v4 = a4 % v8;
        }
        else {
          unint64_t v4 = a4;
        }
      }

      else
      {
        unint64_t v4 = (v8 - 1) & a4;
      }
    }

    uint64_t v20 = *(void *)v7;
    v21 = *(void **)(*(void *)v7 + 8 * v4);
    if (v21)
    {
      void *v13 = *v21;
    }

    else
    {
      void *v13 = *((void *)v7 + 2);
      *((void *)v7 + 2) = v13;
      *(void *)(v20 + 8 * v4) = v7 + 16;
      if (!*v13)
      {
LABEL_41:
        ++*((void *)v7 + 3);
        CFRetain(a3);
        return;
      }

      unint64_t v22 = *(void *)(*v13 + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }

      else
      {
        v22 &= v8 - 1;
      }

      v21 = (void *)(*(void *)v7 + 8 * v22);
    }

    void *v21 = v13;
    goto LABEL_41;
  }

  while (1)
  {
    unint64_t v12 = v11[1];
    if (v12 == a4) {
      break;
    }
    if (v9.u32[0] > 1uLL)
    {
      if (v12 >= v8) {
        v12 %= v8;
      }
    }

    else
    {
      v12 &= v8 - 1;
    }

    if (v12 != v4) {
      goto LABEL_20;
    }
LABEL_19:
    v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_20;
    }
  }

  if (v11[2] != a4) {
    goto LABEL_19;
  }
  id v23 = (id)v11[3];
  if (v23 != a3)
  {
    CFRelease(v23);
    CFRetain(a3);
    v11[3] = a3;
  }

- (id)objectForIntKey:(int64_t)a3
{
  id result = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( (void *)self->_private,  a3);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (void)removeObjectForIntKey:(int64_t)a3
{
  v3 = self->_private;
  unint64_t v4 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>( v3,  a3);
  if (v4)
  {
    uint64_t v5 = v4;
    CFRelease((CFTypeRef)v4[3]);
    int8x8_t v6 = (int8x8_t)v3[1];
    unint64_t v7 = v5[1];
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      if (v7 >= *(void *)&v6) {
        v7 %= *(void *)&v6;
      }
    }

    else
    {
      v7 &= *(void *)&v6 - 1LL;
    }

    uint8x8_t v9 = *(void **)(*v3 + 8 * v7);
    do
    {
      v10 = v9;
      uint8x8_t v9 = (void *)*v9;
    }

    while (v9 != v5);
    if (v10 == v3 + 2) {
      goto LABEL_20;
    }
    unint64_t v11 = v10[1];
    if (v8.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v6) {
        v11 %= *(void *)&v6;
      }
    }

    else
    {
      v11 &= *(void *)&v6 - 1LL;
    }

    if (v11 != v7)
    {
LABEL_20:
      if (!*v5) {
        goto LABEL_21;
      }
      unint64_t v12 = *(void *)(*v5 + 8LL);
      if (v8.u32[0] > 1uLL)
      {
        if (v12 >= *(void *)&v6) {
          v12 %= *(void *)&v6;
        }
      }

      else
      {
        v12 &= *(void *)&v6 - 1LL;
      }

      if (v12 != v7) {
LABEL_21:
      }
        *(void *)(*v3 + 8 * v7) = 0LL;
    }

    uint64_t v13 = *v5;
    if (*v5)
    {
      unint64_t v14 = *(void *)(v13 + 8);
      if (v8.u32[0] > 1uLL)
      {
        if (v14 >= *(void *)&v6) {
          v14 %= *(void *)&v6;
        }
      }

      else
      {
        v14 &= *(void *)&v6 - 1LL;
      }

      if (v14 != v7)
      {
        *(void *)(*v3 + 8 * v14) = v10;
        uint64_t v13 = *v5;
      }
    }

    void *v10 = v13;
    void *v5 = 0LL;
    --v3[3];
    operator delete(v5);
  }

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  unint64_t v4 = (char *)self->_private;
  char v6 = 0;
  uint64_t v5 = v4 + 16;
  do
  {
    uint64_t v5 = (void *)*v5;
    if (!v5) {
      break;
    }
    (*((void (**)(id, void, void, char *))a3 + 2))(a3, v5[2], v5[3], &v6);
  }

  while (!v6);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (id)objectForKey:(id)a3
{
  return -[GTIntKeyedDictionary_replayer objectForIntKey:](self, "objectForIntKey:", [a3 longLongValue]);
}

- (void)removeObjectForKey:(id)a3
{
}

- (id)allKeys
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, a2);
  for (i = (void *)*((void *)self->_private + 2); i; i = (void *)*i)
  {
    uint64_t v5 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", i[2]);
    [v3 addObject:v5];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end