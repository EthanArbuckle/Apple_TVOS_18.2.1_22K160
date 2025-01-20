@interface NSMutableDictionary
+ (NSMutableDictionary)dictionaryWithCapacity:(NSUInteger)numItems;
+ (NSMutableDictionary)dictionaryWithSharedKeySet:(id)keyset;
- (NSMutableDictionary)initWithCapacity:(NSUInteger)numItems;
- (NSMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)__addObject:(id)a3 forKey:(id)a4;
- (void)__setObject:(id)a3 forKey:(id)a4;
- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)addObject:(id)a3 forKey:(id)a4;
- (void)addObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)addObjects:(id)a3 forKeys:(id)a4;
- (void)invert;
- (void)removeAllObjects;
- (void)removeEntriesInDictionary:(id)a3;
- (void)removeEntriesPassingTest:(id)a3;
- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)removeKeysForObject:(id)a3;
- (void)removeObjectForKey:(id)aKey;
- (void)removeObjectsForKeys:(NSArray *)keyArray;
- (void)replaceObject:(id)a3 forKey:(id)a4;
- (void)replaceObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)replaceObjects:(id)a3 forKeys:(id)a4;
- (void)setDictionary:(NSDictionary *)otherDictionary;
- (void)setEntriesFromDictionary:(id)a3;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (void)setObject:(id)obj forKeyedSubscript:(id)key;
- (void)setObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (void)setObjects:(id)a3 forKeys:(id)a4;
@end

@implementation NSMutableDictionary

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!otherDictionary) {
      goto LABEL_4;
    }
  }

  else if (!otherDictionary)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary addEntriesFromDictionary:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[NSMutableDictionary addEntriesFromDictionary:]");
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableDictionary addObject:forKey:](v13, v14, v15, v16);
    return;
  }

- (void)addObject:(id)a3 forKey:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableDictionary addObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableDictionary addObject:forKey:]");
    goto LABEL_9;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary addObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[NSMutableDictionary addObject:forKey:]");
LABEL_9:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v12);
  }

  if (!-[NSDictionary objectForKey:](self, "objectForKey:", a4)) {
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
  }
}

- (void)addObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_4;
    }
  }

  else if (a3)
  {
    goto LABEL_4;
  }

  if (a5)
  {
LABEL_20:
    uint64_t v13 = _os_log_pack_size();
    SEL v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
LABEL_23:
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[NSMutableDictionary addObjects:forKeys:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableDictionary addObjects:forKeys:count:]",  a5);
    goto LABEL_24;
  }

- (void)addObjects:(id)a3 forKeys:(id)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    SEL v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary addObjects:forKeys:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: objects argument is not an NSArray",  "-[NSMutableDictionary addObjects:forKeys:]");
LABEL_16:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v13);
    objc_exception_throw(v17);
    -[NSMutableDictionary invert](v18, v19);
    return;
  }

- (void)invert
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  uint64_t v4 = -[NSDictionary allKeys](self, "allKeys");
  uint64_t v5 = -[NSDictionary allValues](self, "allValues");
  -[NSMutableDictionary removeAllObjects](self, "removeAllObjects");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableDictionary setObject:forKey:]( self,  "setObject:forKey:",  *(void *)(*((void *)&v12 + 1) + 8 * v10),  -[NSArray objectAtIndex:](v5, "objectAtIndex:", v8 + v10));
        ++v10;
      }

      while (v7 != v10);
      uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
      v8 += v10;
    }

    while (v7);
  }

- (void)removeAllObjects
{
  v15[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  NSUInteger v4 = -[NSDictionary count](self, "count");
  unint64_t v6 = v4;
  if (v4 >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    __int128 v14 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v13,  0LL);
    CFRelease(v13);
    objc_exception_throw(v14);
  }

  if (v4 <= 1) {
    NSUInteger v4 = 1LL;
  }
  unint64_t v7 = MEMORY[0x1895F8858](v4, v5);
  uint64_t v9 = (char *)v15 - v8;
  if (v6 >= 0x101)
  {
    uint64_t v9 = (char *)_CFCreateArrayStorage(v7, 0, v15);
    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, v9, v6);
  if (v6)
  {
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      unint64_t v12 = -[NSDictionary countForKey:](self, "countForKey:", *(void *)&v9[8 * i]) + 1;
      while (--v12)
        -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", *(void *)&v9[8 * i]);
    }
  }

  free(v10);
}

- (void)removeEntriesInDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary removeEntriesInDictionary:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[NSMutableDictionary removeEntriesInDictionary:]");
    unint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableDictionary removeEntriesWithOptions:passingTest:](v13, v14, v15, v16);
    return;
  }

- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary removeEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableDictionary removeEntriesWithOptions:passingTest:]");
    id v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)&v18[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v14);
    objc_exception_throw(v16);
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_12;
  }
LABEL_3:
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4);
  uint64_t v9 = +[NSSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v25 = 0u;
  uint64_t v28 = 0LL;
  uint64_t v24 = 850045857LL;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __60__NSMutableDictionary_removeEntriesWithOptions_passingTest___block_invoke;
  v18[3] = &unk_18999C118;
  v18[5] = a4;
  v18[6] = &v24;
  v18[4] = v9;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v18);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMutableDictionary removeObjectForKey:]( self,  "removeObjectForKey:",  *(void *)(*((void *)&v20 + 1) + 8 * i));
      }

      uint64_t v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
    }

    while (v11);
  }

uint64_t __60__NSMutableDictionary_removeEntriesWithOptions_passingTest___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if ((_DWORD)result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    [*(id *)(a1 + 32) addObject:a2];
    return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
  }

  return result;
}

- (void)removeEntriesPassingTest:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableDictionary removeEntriesPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableDictionary removeEntriesPassingTest:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSMutableDictionary removeEntriesWithOptions:passingTest:](self, "removeEntriesWithOptions:passingTest:", 0LL, a3);
}

- (void)removeKeysForObject:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  NSUInteger v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
  if (v7)
  {
    NSUInteger v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(self);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (-[NSDictionary objectForKey:](self, "objectForKey:", v11) == a3) {
          -[NSArray addObject:](v6, "addObject:", v11);
        }
      }

      NSUInteger v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
    }

    while (v8);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableDictionary removeObjectForKey:]( self,  "removeObjectForKey:",  *(void *)(*((void *)&v17 + 1) + 8 * j));
      }

      uint64_t v13 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v17,  v16,  16LL);
    }

    while (v13);
  }

- (void)removeObjectsForKeys:(NSArray *)keyArray
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!keyArray) {
      goto LABEL_4;
    }
  }

  else if (!keyArray)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)keyArray) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary removeObjectsForKeys:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableDictionary removeObjectsForKeys:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableDictionary replaceObject:forKey:](v13, v14, v15, v16);
    return;
  }

- (void)replaceObject:(id)a3 forKey:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableDictionary replaceObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableDictionary replaceObject:forKey:]");
    goto LABEL_10;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary replaceObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[NSMutableDictionary replaceObject:forKey:]");
LABEL_10:
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v12);
  }

  if (-[NSDictionary objectForKey:](self, "objectForKey:", a4)) {
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
  }
}

- (void)replaceObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v25[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_4;
    }
  }

  else if (a3)
  {
    goto LABEL_4;
  }

  if (a5)
  {
LABEL_18:
    uint64_t v16 = _os_log_pack_size();
    __int128 v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
LABEL_21:
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableDictionary replaceObjects:forKeys:count:]",  a5);
    goto LABEL_22;
  }

- (void)replaceObjects:(id)a3 forKeys:(id)a4
{
  v21[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableDictionary replaceObjects:forKeys:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: objects argument is not an NSArray",  "-[NSMutableDictionary replaceObjects:forKeys:]");
LABEL_16:
    __int128 v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v13);
    objc_exception_throw(v17);
    -[NSMutableDictionary setEntriesFromDictionary:](v18, v19, v20);
    return;
  }

- (void)setEntriesFromDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSDictionary((uint64_t)a3) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary setEntriesFromDictionary:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[NSMutableDictionary setEntriesFromDictionary:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, v14, v15, v16);
    return;
  }

- (void)setObject:(id)obj forKeyedSubscript:(id)key
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  if (obj) {
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", obj, key);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", key);
  }
}

- (void)setObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v25[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a3) {
      goto LABEL_4;
    }
  }

  else if (a3)
  {
    goto LABEL_4;
  }

  if (a5)
  {
LABEL_18:
    uint64_t v16 = _os_log_pack_size();
    __int128 v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
LABEL_21:
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSMutableDictionary setObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableDictionary setObjects:forKeys:count:]",  a5);
    goto LABEL_22;
  }

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSMutableDictionary setObjects:forKeys:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: objects argument is not an NSArray",  "-[NSMutableDictionary setObjects:forKeys:]");
LABEL_16:
    id v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v15);
    -[NSMutableDictionary setDictionary:](v16, v17, v18);
    return;
  }

- (void)setDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    if (!otherDictionary) {
      goto LABEL_4;
    }
  }

  else if (!otherDictionary)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary setDictionary:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[NSMutableDictionary setDictionary:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableDictionary __addObject:forKey:](v13, v14, v15, v16);
    return;
  }

- (void)__addObject:(id)a3 forKey:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableDictionary __addObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableDictionary __addObject:forKey:]");
    goto LABEL_9;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableDictionary __addObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[NSMutableDictionary __addObject:forKey:]");
LABEL_9:
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v12);
  }

  if (!-[NSDictionary objectForKey:](self, "objectForKey:", a4)) {
    -[NSMutableDictionary __setObject:forKey:](self, "__setObject:forKey:", a3, a4);
  }
}

- (void)__setObject:(id)a3 forKey:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v14 = _os_log_pack_size();
    id v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableDictionary __setObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableDictionary __setObject:forKey:]");
    goto LABEL_10;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  if (!a4)
  {
    uint64_t v14 = _os_log_pack_size();
    id v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableDictionary __setObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[NSMutableDictionary __setObject:forKey:]");
LABEL_10:
    __int128 v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v18);
  }

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    CFLog( 3LL,  (uint64_t)@"*** CFDictionarySetValue(): attempt to use this function to set a key which is not copyable into a non-CFDictionary via toll-free bridging",  v8,  v9,  v10,  v11,  v12,  v13,  v19[0]);
  }
  -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

- (NSMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  unint64_t v5 = a5;
  NSUInteger v6 = a4;
  NSUInteger v7 = a3;
  v24[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a5)
  {
LABEL_17:
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
LABEL_20:
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSMutableDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableDictionary initWithObjects:forKeys:count:]",  v5);
    goto LABEL_21;
  }

  if (!(a5 >> 61))
  {
    if (!a5) {
      return -[NSMutableDictionary initWithCapacity:](self, "initWithCapacity:", 0LL);
    }
    for (uint64_t i = 0LL; i != a5; ++i)
    {
      if (!a3[i]) {
        goto LABEL_16;
      }
    }

    if (a4)
    {
      uint64_t i = 0LL;
      while (a4[i])
      {
        if (a5 == ++i)
        {
          for (uint64_t j = -[NSMutableDictionary initWithCapacity:](self, "initWithCapacity:", a5); v5; --v5)
          {
            uint64_t v11 = (uint64_t)*v7++;
            uint64_t v10 = v11;
            uint64_t v12 = (uint64_t)*v6++;
            -[NSMutableDictionary setObject:forKey:](j, "setObject:forKey:", v10, v12);
          }

          return j;
        }
      }

+ (NSMutableDictionary)dictionaryWithCapacity:(NSUInteger)numItems
{
  return (NSMutableDictionary *)(id)[objc_alloc((Class)a1) initWithCapacity:numItems];
}

+ (NSMutableDictionary)dictionaryWithSharedKeySet:(id)keyset
{
  if (!keyset)
  {
    uint64_t v9 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@: keyset cannot be nil", v9);
LABEL_8:
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v8);
    return (NSMutableDictionary *)_CFListFormatterGetTypeID();
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)a1, a2);
    uint64_t v10 = objc_opt_class();
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: keyset must be an object created by +sharedKeySetForKeys: instead of '%@'",  v7,  v10);
    goto LABEL_8;
  }

  if ([keyset isEmpty]) {
    return +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL);
  }
  else {
    return (NSMutableDictionary *)+[NSSharedKeyDictionary sharedKeyDictionaryWithKeySet:]( &OBJC_CLASS___NSSharedKeyDictionary,  "sharedKeyDictionaryWithKeySet:",  keyset);
  }
}

- (void)removeObjectForKey:(id)aKey
{
  uint64_t v4 = __CFLookUpClass("NSMutableDictionary");
  OUTLINED_FUNCTION_0_11(v4, (uint64_t)self);
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
  unint64_t v5 = __CFLookUpClass("NSMutableDictionary");
  OUTLINED_FUNCTION_0_11(v5, (uint64_t)self);
}

- (NSMutableDictionary)initWithCapacity:(NSUInteger)numItems
{
  uint64_t v4 = __CFLookUpClass("NSMutableDictionary");
  __CFRequireConcreteImplementation(v4, (uint64_t)self);
  return 0LL;
}

@end