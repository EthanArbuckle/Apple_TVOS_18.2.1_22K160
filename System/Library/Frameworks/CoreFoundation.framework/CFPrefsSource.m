@interface CFPrefsSource
- (BOOL)alreadylocked_requestNewData;
- (BOOL)isByHost;
- (BOOL)isDirectModeEnabled;
- (BOOL)isVolatile;
- (BOOL)managed;
- (BOOL)synchronize;
- (CFPrefsSource)initWithContainingPreferences:(id)a3;
- (__CFArray)alreadylocked_copyKeyList;
- (__CFDictionary)alreadylocked_copyDictionary;
- (__CFString)container;
- (__CFString)copyOSLogDescription;
- (__CFString)domainIdentifier;
- (__CFString)userIdentifier;
- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4;
- (id)copyVolatileSourceWithContainingPreferences:(id)a3;
- (id)createRequestNewContentMessageForDaemon:(int)a3;
- (id)description;
- (int)alreadylocked_updateObservingRemoteChanges;
- (int64_t)alreadylocked_generationCount;
- (int64_t)generationCount;
- (os_unfair_lock_s)copyDictionary;
- (os_unfair_lock_s)copyKeyList;
- (uint64_t)alreadylocked_addPreferencesObserver:(uint64_t)a1;
- (uint64_t)alreadylocked_removePreferencesObserver:(uint64_t)a1;
- (uint64_t)enabled;
- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4;
- (void)alreadylocked_copyValueForKey:(__CFString *)a3;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
- (void)copyValueForKey:(__CFString *)a3;
- (void)dealloc;
- (void)forEachObserver:(uint64_t)a1;
- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3;
- (void)lock;
- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5;
- (void)removeAllValues_from:(os_unfair_lock_s *)a1;
- (void)replaceAllValuesWithValues:(uint64_t)a3 forKeys:(NSException *)a4 count:(uint64_t)a5 from:;
- (void)setValue:(uint64_t)a3 forKey:(uint64_t)a4 from:;
- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 from:;
- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 removeValuesForKeys:(unint64_t)a7 count:(uint64_t)a8 from:;
- (void)unlock;
@end

@implementation CFPrefsSource

- (CFPrefsSource)initWithContainingPreferences:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CFPrefsSource;
  result = -[CFPrefsSource init](&v5, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    atomic_store((unint64_t)&sentinelGeneration, (unint64_t *)&result->shmemEntry);
    result->_containingPreferences = (_CFXPreferences *)a3;
    result->_isSearchList = 0;
  }

  return result;
}

- (id)copyVolatileSourceWithContainingPreferences:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[CFPrefsSource isVolatile](self, "isVolatile"))
  {
    uint64_t v6 = -[CFPrefsSource initWithContainingPreferences:]( objc_alloc(&OBJC_CLASS___CFPrefsSource),  "initWithContainingPreferences:",  a3);
    dict = self->_dict;
    if (dict)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, dict);
      if (MutableCopy)
      {
        v9 = MutableCopy;
        v10 = v6->_dict;
        if (v10) {
          CFRelease(v10);
        }
        v6->_dict = v9;
      }
    }

    unint64_t v11 = atomic_load((unint64_t *)&self->_generationCount);
    atomic_store(v11, (unint64_t *)&v6->_generationCount);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (uint64_t)alreadylocked_addPreferencesObserver:(uint64_t)a1
{
  if (!a1 || !a2) {
    return 0LL;
  }
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 52));
  v4 = *(__CFPrefsWeakObservers **)(a1 + 24);
  if (!v4)
  {
    v4 = objc_alloc_init(&OBJC_CLASS_____CFPrefsWeakObservers);
    *(void *)(a1 + 24) = v4;
  }

  -[__CFPrefsWeakObservers addObject:](v4, "addObject:", a2);
  return objc_msgSend((id)a1, "alreadylocked_updateObservingRemoteChanges");
}

- (void)forEachObserver:(uint64_t)a1
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 52);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
    objc_super v5 = *(void **)(a1 + 24);
    if (v5)
    {
      unint64_t v6 = [v5 approximateCount];
      unint64_t v8 = v6;
      if (v6 >> 60)
      {
        CFStringRef v14 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
        v15 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v14,  0LL);
        CFRelease(v14);
        objc_exception_throw(v15);
        _Unwind_Resume(v16);
      }

      if (v6 <= 1) {
        unint64_t v6 = 1LL;
      }
      unint64_t v9 = MEMORY[0x1895F8858](v6, v7);
      unint64_t v11 = (id *)((char *)v17 - v10);
      if (v8 >= 0x101)
      {
        unint64_t v11 = (id *)_CFCreateArrayStorage(v9, 0, v17);
        v12 = v11;
      }

      else
      {
        v12 = 0LL;
      }

      uint64_t v13 = [*(id *)(a1 + 24) borrowObjects:v11 count:v8];
      os_unfair_lock_unlock(v4);
      for (; v13; --v13)
      {
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, *v11);
      }

      free(v12);
    }

    else
    {
      os_unfair_lock_unlock(v4);
    }
  }

- (uint64_t)alreadylocked_removePreferencesObserver:(uint64_t)a1
{
  if (!a1 || !a2) {
    return 0LL;
  }
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 52));
  [*(id *)(a1 + 24) removeObject:a2];
  return objc_msgSend((id)a1, "alreadylocked_updateObservingRemoteChanges");
}

- (int)alreadylocked_updateObservingRemoteChanges
{
  return 0;
}

- (id)alreadylocked_createObserverUpdateMessageWithOperation:(int)a3 forRole:(int *)a4
{
  return 0LL;
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_dict) {
    self->_dict = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  if (a5 >= 1)
  {
    do
    {
      uint64_t v10 = *a4;
      unint64_t v11 = *a3;
      dict = self->_dict;
      if (*a3) {
        CFDictionarySetValue(dict, *a4, *a3);
      }
      else {
        CFDictionaryRemoveValue(dict, *a4);
      }
      uint64_t v13 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v14 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
        _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
        v15 = (os_log_s *)_CFPrefsClientLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138478339;
          v19 = v11;
          __int16 v20 = 2113;
          v21 = v10;
          __int16 v22 = 2114;
          v23 = v14;
          _os_log_debug_impl( &dword_180A4C000,  v15,  OS_LOG_TYPE_DEBUG,  "setting new value %{private}@ for key %{private}@ in %{public}@",  buf,  0x20u);
        }

        _CFSetTSD(0xFu, 0LL, 0LL);
        CFRelease(v14);
      }

      ++a3;
      ++a4;
      --a5;
    }

    while (a5);
    p_generationCount = &self->_generationCount;
    do
      unint64_t v17 = __ldaxr((unint64_t *)p_generationCount);
    while (__stlxr(v17 + 1, (unint64_t *)p_generationCount));
  }

- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 removeValuesForKeys:(unint64_t)a7 count:(uint64_t)a8 from:
{
  uint64_t v36 = a8;
  v39[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  if (a7 >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  a7);
    v30 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v29,  0LL);
    CFRelease(v29);
    objc_exception_throw(v30);
    goto LABEL_34;
  }

  unint64_t v8 = a4;
  v33[1] = v33;
  if (a7 <= 1) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = a7;
  }
  unint64_t v16 = MEMORY[0x1895F8858](v15, a2);
  v18 = (char *)v33 - v17;
  if (a7 > 0x100)
  {
    v18 = (char *)_CFCreateArrayStorage(v16, 1, v39);
    v35 = v18;
  }

  else
  {
    bzero((char *)v33 - v17, 8 * v16);
    v35 = 0LL;
  }

  if (v8 >> 60)
  {
LABEL_34:
    CFStringRef v31 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8);
    v32 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v31,  0LL);
    CFRelease(v31);
    objc_exception_throw(v32);
    __break(1u);
  }

  if (v8 <= 1) {
    uint64_t v20 = 1LL;
  }
  else {
    uint64_t v20 = v8;
  }
  unint64_t v21 = MEMORY[0x1895F8858](v20, v19);
  v23 = (CFTypeRef *)((char *)v33 - v22);
  if (v8 >= 0x101)
  {
    v23 = (CFTypeRef *)_CFCreateArrayStorage(v21, 0, &v38);
    v34 = v23;
    goto LABEL_17;
  }

  if (v8)
  {
    v34 = 0LL;
LABEL_17:
    for (uint64_t i = 0LL; i != v8; ++i)
    {
      DeepCopyOfValueForKey = *(const __CFString **)(a2 + 8 * i);
      if (DeepCopyOfValueForKey)
      {
        if (a5) {
          DeepCopyOfValueForKey = createDeepCopyOfValueForKey(DeepCopyOfValueForKey, *(void *)(a3 + 8 * i));
        }
        else {
          DeepCopyOfValueForKey = (const __CFString *)CFRetain(DeepCopyOfValueForKey);
        }
      }

      v23[i] = DeepCopyOfValueForKey;
    }

    v26 = a1 + 13;
    os_unfair_lock_lock(a1 + 13);
    uint64_t v27 = v36;
    -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:]( a1,  "alreadylocked_setPrecopiedValues:forKeys:count:from:",  v23,  a3,  v8,  v36);
    if (!a7) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  v26 = a1 + 13;
  os_unfair_lock_lock(a1 + 13);
  v34 = 0LL;
  uint64_t v27 = v36;
  if (a7) {
LABEL_26:
  }
    -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:]( a1,  "alreadylocked_setPrecopiedValues:forKeys:count:from:",  v18,  a6,  a7,  v27);
LABEL_27:
  os_unfair_lock_unlock(v26);
  for (unint64_t j = v8; j; --j)
  {
    if (*v23) {
      CFRelease(*v23);
    }
    ++v23;
  }

  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __83__CFPrefsSource_setValues_forKeys_count_copyValues_removeValuesForKeys_count_from___block_invoke;
  v37[3] = &unk_1899E9960;
  v37[4] = v27;
  v37[5] = a1;
  -[CFPrefsSource forEachObserver:]((uint64_t)a1, (uint64_t)v37);
  free(v34);
  free(v35);
}

uint64_t __83__CFPrefsSource_setValues_forKeys_count_copyValues_removeValuesForKeys_count_from___block_invoke( uint64_t result,  void *a2)
{
  if (*(void **)(result + 32) != a2)
  {
    uint64_t v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0) {
      return objc_msgSend( a2,  "handleChangeNotificationForDomainIdentifier:isRemote:",  objc_msgSend(*(id *)(v3 + 40), "domainIdentifier"),  0);
    }
  }

  return result;
}

- (void)setValues:(uint64_t)a3 forKeys:(unint64_t)a4 count:(int)a5 copyValues:(uint64_t)a6 from:
{
  if (a1) {
    -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:]( a1,  a2,  a3,  a4,  a5,  0LL,  0LL,  a6);
  }
}

- (void)setValue:(uint64_t)a3 forKey:(uint64_t)a4 from:
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    uint64_t v4 = a3;
    v5[0] = a2;
    -[CFPrefsSource setValues:forKeys:count:copyValues:removeValuesForKeys:count:from:]( a1,  (uint64_t)v5,  (uint64_t)&v4,  1uLL,  1,  0LL,  0LL,  a4);
  }

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __75__CFPrefsSource__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v4[3] = &unk_1899E9960;
  v4[4] = a3;
  v4[5] = a4;
  -[CFPrefsSource forEachObserver:]((uint64_t)self, (uint64_t)v4);
}

uint64_t __75__CFPrefsSource__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 _notifyObserversOfChangeFromValuesForKeys:*(void *)(a1 + 32) toValuesForKeys:*(void *)(a1 + 40)];
}

- (void)replaceAllValuesWithValues:(uint64_t)a3 forKeys:(NSException *)a4 count:(uint64_t)a5 from:
{
  v47[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return;
  }
  uint64_t v40 = a5;
  uint64_t v10 = a1 + 13;
  os_unfair_lock_lock(a1 + 13);
  unint64_t v11 = (const __CFArray *)-[os_unfair_lock_s alreadylocked_copyKeyList](a1, "alreadylocked_copyKeyList");
  os_unfair_lock_t v43 = v10;
  os_unfair_lock_unlock(v10);
  v44 = v11;
  unint64_t Count = CFArrayGetCount(v11);
  unint64_t v14 = Count;
  if (Count >> 60)
  {
    CFStringRef v36 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
    a4 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v36,  0LL);
    CFRelease(v36);
    objc_exception_throw(a4);
LABEL_39:
    v39 = v5;
    CFStringRef v37 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  a4);
    size_t v38 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v37,  0LL);
    CFRelease(v37);
    objc_exception_throw(v38);
    __break(1u);
    return;
  }

  v41 = (void **)&v39;
  if (Count <= 1) {
    unint64_t v15 = 1LL;
  }
  else {
    unint64_t v15 = Count;
  }
  if (Count >= 0x101) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = v15;
  }
  uint64_t v17 = 8 * v16;
  MEMORY[0x1895F8858](Count, v13);
  uint64_t v19 = (const void **)((char *)&v39 - v18);
  if (v14 >= 0x101)
  {
    uint64_t v19 = (const void **)_CFCreateArrayStorage(v15, 0, v47);
    uint64_t v20 = v19;
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  v48.location = 0LL;
  v48.length = v14;
  CFArrayGetValues(v44, v48, v19);
  MEMORY[0x1895F8858](v21, v22);
  v23 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v14 > 0x100)
  {
    objc_super v5 = (char *)_CFCreateArrayStorage(v15, 1, &v46);
  }

  else
  {
    bzero(v23, 8 * v15);
    objc_super v5 = 0LL;
  }

  if (v14 >= 0x101) {
    v25 = v5;
  }
  else {
    v25 = v23;
  }
  else {
    uint64_t v26 = (uint64_t)a4;
  }
  unint64_t v27 = MEMORY[0x1895F8858](v26, v24);
  CFStringRef v29 = (CFTypeRef *)((char *)&v39 - v28);
  if ((unint64_t)a4 >= 0x101)
  {
    v39 = v5;
    CFStringRef v29 = (CFTypeRef *)_CFCreateArrayStorage(v27, 0, &v45);
    v30 = v20;
    v42 = v29;
LABEL_26:
    CFStringRef v31 = 0LL;
    do
    {
      v32 = *(const __CFString **)(a2 + 8LL * (void)v31);
      if (v32) {
        v29[(void)v31] = createDeepCopyOfValueForKey(v32, *(void *)(a3 + 8LL * (void)v31));
      }
      CFStringRef v31 = (NSException *)((char *)v31 + 1);
    }

    while (a4 != v31);
    int v33 = 1;
    uint64_t v20 = v30;
    objc_super v5 = v39;
    goto LABEL_31;
  }

  v42 = 0LL;
  if (a4)
  {
    v39 = v5;
    v30 = v20;
    goto LABEL_26;
  }

  int v33 = 0;
LABEL_31:
  os_unfair_lock_lock(v43);
  v34 = v19;
  uint64_t v35 = v40;
  -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:]( a1,  "alreadylocked_setPrecopiedValues:forKeys:count:from:",  v25,  v34,  v14,  v40);
  -[os_unfair_lock_s alreadylocked_setPrecopiedValues:forKeys:count:from:]( a1,  "alreadylocked_setPrecopiedValues:forKeys:count:from:",  v29,  a3,  a4,  v35);
  os_unfair_lock_unlock(v43);
  CFRelease(v44);
  if (v33)
  {
    do
    {
      if (*v29) {
        CFRelease(*v29);
      }
      ++v29;
      a4 = (NSException *)((char *)a4 - 1);
    }

    while (a4);
  }

  free(v42);
  free(v5);
  free(v20);
}

- (os_unfair_lock_s)copyKeyList
{
  if (result)
  {
    v1 = result;
    v2 = result + 13;
    os_unfair_lock_lock(result + 13);
    uint64_t v3 = -[os_unfair_lock_s alreadylocked_copyKeyList](v1, "alreadylocked_copyKeyList");
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }

  return result;
}

- (void)removeAllValues_from:(os_unfair_lock_s *)a1
{
  if (a1) {
    -[CFPrefsSource replaceAllValuesWithValues:forKeys:count:from:](a1, 0LL, 0LL, 0LL, a2);
  }
}

- (void)alreadylocked_copyValueForKey:(__CFString *)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  dict = self->_dict;
  if (dict) {
    Value = CFDictionaryGetValue(dict, a3);
  }
  else {
    Value = 0LL;
  }
  uint64_t v7 = (os_log_s *)_CFPrefsClientLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = -[CFPrefsSource copyOSLogDescription](self, "copyOSLogDescription");
    if (Value)
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      unint64_t v9 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138478339;
        uint64_t v13 = Value;
        __int16 v14 = 2114;
        unint64_t v15 = a3;
        __int16 v16 = 2114;
        uint64_t v17 = v8;
        _os_log_debug_impl( &dword_180A4C000,  v9,  OS_LOG_TYPE_DEBUG,  "looked up value %{private}@ for key %{public}@ in %{public}@",  (uint8_t *)&v12,  0x20u);
      }

      _CFSetTSD(0xFu, 0LL, 0LL);
    }

    else
    {
      _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0LL);
      uint64_t v10 = (os_log_s *)_CFPrefsClientLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CFPrefsSource alreadylocked_copyValueForKey:].cold.1();
      }
      _CFSetTSD(0xFu, 0LL, 0LL);
    }

    CFRelease(v8);
  }

  if (Value) {
    return (void *)CFRetain(Value);
  }
  else {
    return 0LL;
  }
}

- (void)copyValueForKey:(__CFString *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = -[CFPrefsSource alreadylocked_copyValueForKey:](self, "alreadylocked_copyValueForKey:", a3);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)alreadylocked_requestNewData
{
  if (a1) {
    os_unfair_lock_assert_owner(a1 + 13);
  }
  return a1 != 0LL;
}

- (BOOL)synchronize
{
  return 1;
}

- (uint64_t)enabled
{
  return 0LL;
}

- (__CFArray)alreadylocked_copyKeyList
{
  v16[1] = *MEMORY[0x1895F89C0];
  v2 = -[CFPrefsSource alreadylocked_copyDictionary](self, "alreadylocked_copyDictionary");
  if (!v2) {
    return CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, 0LL, &kCFTypeArrayCallBacks);
  }
  uint64_t v3 = v2;
  unint64_t Count = CFDictionaryGetCount(v2);
  unint64_t v6 = Count;
  if (Count >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  Count);
    __int16 v14 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v13,  0LL);
    CFRelease(v13);
    objc_exception_throw(v14);
    _Unwind_Resume(v15);
  }

  if (Count <= 1) {
    unint64_t Count = 1LL;
  }
  unint64_t v7 = MEMORY[0x1895F8858](Count, v5);
  unint64_t v9 = (const void **)((char *)v16 - v8);
  if (v6 >= 0x101)
  {
    unint64_t v9 = (const void **)_CFCreateArrayStorage(v7, 0, v16);
    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  CFDictionaryGetKeysAndValues(v3, v9, 0LL);
  int v12 = CFArrayCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, v6, &kCFTypeArrayCallBacks);
  CFRelease(v3);
  free(v10);
  return v12;
}

- (__CFDictionary)alreadylocked_copyDictionary
{
  dict = self->_dict;
  if (dict && CFDictionaryGetCount(dict) >= 1) {
    return CFDictionaryCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, self->_dict);
  }
  else {
    return 0LL;
  }
}

- (os_unfair_lock_s)copyDictionary
{
  if (result)
  {
    v1 = result;
    v2 = result + 13;
    os_unfair_lock_lock(result + 13);
    uint64_t v3 = -[os_unfair_lock_s alreadylocked_copyDictionary](v1, "alreadylocked_copyDictionary");
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }

  return result;
}

- (void)mergeIntoDictionary:(__CFDictionary *)a3 sourceDictionary:(__CFDictionary *)a4 cloudKeyEvaluator:(id)a5
{
  v11[7] = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v9 = -[CFPrefsSource alreadylocked_copyDictionary](self, "alreadylocked_copyDictionary");
  if (v9)
  {
    uint64_t v10 = v9;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __72__CFPrefsSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke;
    v11[3] = &unk_1899E9988;
    v11[5] = a3;
    v11[6] = a4;
    v11[4] = self;
    _CFPrefsDictionaryApplyBlock(v9, v11);
    CFRelease(v10);
  }

  os_unfair_lock_unlock(p_lock);
}

void __72__CFPrefsSource_mergeIntoDictionary_sourceDictionary_cloudKeyEvaluator___block_invoke( uint64_t a1,  const void *a2,  const void *a3)
{
  uint64_t v5 = *(__CFDictionary **)(a1 + 48);
  if (v5) {
    CFDictionaryAddValue(v5, a2, *(const void **)(a1 + 32));
  }
}

- (void)fullCloudSynchronizeWithCompletionHandler:(id)a3
{
}

- (id)createRequestNewContentMessageForDaemon:(int)a3
{
  return 0LL;
}

- (int64_t)alreadylocked_generationCount
{
  return atomic_load((unint64_t *)&self->_generationCount);
}

- (int64_t)generationCount
{
  return atomic_load((unint64_t *)&self->_generationCount);
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)managed
{
  return 0;
}

- (BOOL)isVolatile
{
  return 1;
}

- (BOOL)isDirectModeEnabled
{
  return 0;
}

- (__CFString)userIdentifier
{
  return &stru_1899EF170;
}

- (__CFString)domainIdentifier
{
  return @"Volatile";
}

- (BOOL)isByHost
{
  return 0;
}

- (__CFString)container
{
  return &stru_1899EF170;
}

- (id)description
{
  v16[1] = *MEMORY[0x1895F89C0];
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  os_unfair_lock_lock(&self->_lock);
  ClassName = object_getClassName(self);
  uint64_t v5 = -[CFPrefsSource domainIdentifier](self, "domainIdentifier");
  unint64_t v6 = -[CFPrefsSource userIdentifier](self, "userIdentifier");
  if (-[CFPrefsSource isByHost](self, "isByHost")) {
    unint64_t v7 = "Yes";
  }
  else {
    unint64_t v7 = "No";
  }
  CFStringAppendFormat( Mutable,  0LL,  @"%s<%p> (Domain: %@, User: %@, ByHost: %s, Container: %@)",  ClassName,  self,  v5,  v6,  v7,  -[CFPrefsSource container](self, "container"));
  dict = self->_dict;
  if (dict
    && (CFIndex Count = CFDictionaryGetCount(dict),
        uint64_t v11 = MEMORY[0x1895F8858](Count, v10),
        CFStringRef v13 = (const __CFString **)((char *)v16 - v12),
        v11 > 0))
  {
    CFDictionaryGetKeysAndValues(self->_dict, (const void **)((char *)v16 - v12), 0LL);
    CFStringAppend(Mutable, @" Keys: [");
    do
    {
      __int16 v14 = *v13++;
      CFStringAppend(Mutable, v14);
      CFStringAppend(Mutable, @", ");
      --Count;
    }

    while (Count);
  }

  else
  {
    CFStringAppend(Mutable, @" Keys: [");
  }

  CFStringAppend(Mutable, @"]\n");
  os_unfair_lock_unlock(&self->_lock);
  return (id)CFAutorelease(Mutable);
}

- (__CFString)copyOSLogDescription
{
  ClassName = object_getClassName(self);
  uint64_t v4 = -[CFPrefsSource domainIdentifier](self, "domainIdentifier");
  uint64_t v5 = -[CFPrefsSource userIdentifier](self, "userIdentifier");
  BOOL v6 = -[CFPrefsSource isByHost](self, "isByHost");
  unint64_t v7 = -[CFPrefsSource container](self, "container");
  uint64_t v8 = (unsigned int *)atomic_load((unint64_t *)&self->shmemEntry);
  unint64_t v9 = "No";
  if (v8 && ((v10 = atomic_load(v8), v10 == -1) || (unsigned int v11 = atomic_load(&self->lastKnownShmemState), v10 == v11))) {
    uint64_t v12 = "No";
  }
  else {
    uint64_t v12 = "Yes";
  }
  if (v6) {
    unint64_t v9 = "Yes";
  }
  return (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%s<%p> (Domain: %@, User: %@, ByHost: %s, Container: %@, Contents Need Refresh: %s)",  ClassName,  self,  v4,  v5,  v9,  v7,  v12);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  dict = self->_dict;
  if (dict) {
    CFRelease(dict);
  }
  self->_dict = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CFPrefsSource;
  -[CFPrefsSource dealloc](&v4, sel_dealloc);
}

- (void)alreadylocked_copyValueForKey:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_0_13();
  _os_log_debug_impl( &dword_180A4C000,  v0,  OS_LOG_TYPE_DEBUG,  "found no value for key %{public}@ in %{public}@",  v1,  0x16u);
}

@end