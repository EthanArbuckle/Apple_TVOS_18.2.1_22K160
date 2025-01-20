@interface NEHasher
+ (id)hashObject:(id)a3;
+ (id)hashObject:(id)a3 withClassPrefixWhitelist:(id)a4;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (NEHasher)init;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)decodeDataObject;
- (id)finishHashing;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (int64_t)versionForClassName:(id)a3;
- (void)dealloc;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeDataObject:(id)a3;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
@end

@implementation NEHasher

- (NEHasher)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEHasher;
  v2 = -[NEHasher init](&v5, sel_init);
  if (v2)
  {
    v3 = (CC_SHA1_CTX *)malloc(0x60uLL);
    v2->_sha1Context = v3;
    CC_SHA1_Init(v3);
  }

  return v2;
}

- (void)dealloc
{
  if (self)
  {
    sha1Context = self->_sha1Context;
    if (sha1Context) {
      free(sha1Context);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEHasher;
  -[NEHasher dealloc](&v4, sel_dealloc);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  return 0;
}

- (int64_t)versionForClassName:(id)a3
{
  return 0LL;
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  if (!a4) {
    return;
  }
  objc_super v5 = self;
  int v6 = *a3;
  if (v6 == 64)
  {
    id v7 = *(id *)a4;
    v8 = v7;
    if (!v7)
    {
LABEL_42:

      return;
    }

    if (isa_nsdictionary(v7))
    {
      id v9 = v8;
      [v9 allKeys];
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0LL; i != v12; ++i)
          {
            if (*(void *)v59 != v13) {
              objc_enumerationMutation(v10);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v58 + 1) + 8 * i)))
            {

              ne_log_obj();
              v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)data = 0;
                _os_log_debug_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_DEBUG,  "Not hashing dictionary containing one or more non-string keys",  data,  2u);
              }

              goto LABEL_39;
            }
          }

          uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      [v10 sortedArrayUsingSelector:NSSelectorFromString(@"compare:")];
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      uint64_t v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v54,  v65,  16LL);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t j = 0LL; j != v17; ++j)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(v15);
            }
            [v9 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * j)];
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NEHasher encodeObject:](v5, "encodeObject:", v20);
          }

          uint64_t v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v54,  v65,  16LL);
        }

        while (v17);
      }

- (void)encodeDataObject:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v8 = v4;
    uint64_t v6 = [v4 length];
    objc_super v5 = v8;
    if (v6)
    {
      if (self) {
        self = (NEHasher *)self->_sha1Context;
      }
      id v7 = v8;
      CC_SHA1_Update((CC_SHA1_CTX *)self, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
      objc_super v5 = v8;
    }
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "B", &v4);
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    if (self) {
      self = (NEHasher *)self->_sha1Context;
    }
    CC_SHA1_Update((CC_SHA1_CTX *)self, a3, a4);
  }

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  double v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "d", &v4);
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  int v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "i", &v4);
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  float v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "f", &v4);
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  int64_t v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "q", &v4);
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  int v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "i", &v4);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  int64_t v4 = a3;
  -[NEHasher encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "q", &v4);
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  id v4 = [MEMORY[0x189603F70] exceptionWithName:@"NEHasherInvalidOperationException" reason:@"NEHasher cannot be used as a decoder" userInfo:0];
  objc_exception_throw(v4);
  -[NEHasher decodeDataObject](v5, v6);
}

- (id)decodeDataObject
{
  id v2 = [MEMORY[0x189603F70] exceptionWithName:@"NEHasherInvalidOperationException" reason:@"NEHasher cannot be used as a decoder" userInfo:0];
  objc_exception_throw(v2);
  return (id)-[NEHasher decodeBoolForKey:](v3, v4, v5);
}

- (BOOL)decodeBoolForKey:(id)a3
{
  BOOL v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "B", &v4, 1LL);
  return v4;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  return (const char *)-[NEHasher decodeBytesWithReturnedLength:]( self, "decodeBytesWithReturnedLength:", a4);
}

- (double)decodeDoubleForKey:(id)a3
{
  double v4 = 0.0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "d", &v4, 8LL);
  return v4;
}

- (float)decodeFloatForKey:(id)a3
{
  float v4 = 0.0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "f", &v4, 4LL);
  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  int v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "i", &v4, 4LL);
  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t v4 = 0LL;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "q", &v4, 8LL);
  return v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  int64_t v4 = 0LL;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "q", &v4, 8LL);
  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  int v4 = 0;
  -[NEHasher decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "i", &v4, 4LL);
  return v4;
}

- (void).cxx_destruct
{
}

+ (id)hashObject:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(&OBJC_CLASS___NEHasher);
  -[NEHasher encodeRootObject:](v4, "encodeRootObject:", v3);

  -[NEHasher finishHashing]((uint64_t)v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hashObject:(id)a3 withClassPrefixWhitelist:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NEHasher);
  id v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 16LL);
    -[NEHasher encodeRootObject:](v9, "encodeRootObject:", v5);
    -[NEHasher finishHashing]((uint64_t)v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [0 encodeRootObject:v5];
    id v10 = 0LL;
  }

  return v10;
}

- (id)finishHashing
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v2 = *(CC_SHA1_CTX **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  CC_SHA1_Final(md, v2);
  [MEMORY[0x189603F48] dataWithBytes:md length:20];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  free(*(void **)(a1 + 8));
  *(void *)(a1 + 8) = 0LL;
  return v3;
}

@end