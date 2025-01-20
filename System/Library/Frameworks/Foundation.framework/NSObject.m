@interface NSObject
+ (BOOL)_shouldAddObservationForwardersForKey:(id)a3;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key;
+ (BOOL)implementsSelector:(SEL)a3;
+ (BOOL)instancesImplementSelector:(SEL)a3;
+ (NSArray)classFallbacksForKeyedArchiver;
+ (NSInteger)version;
+ (NSSet)keyPathsForValuesAffectingValueForKey:(NSString *)key;
+ (id)_createMutableArrayValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createMutableOrderedSetValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createMutableSetValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createOtherValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createOtherValueSetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValueGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValuePrimitiveGetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValuePrimitiveSetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_createValueSetterWithContainerClassID:(id)a3 key:(id)a4;
+ (id)_keysForValuesAffectingValueForKey:(id)a3;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget;
+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument;
+ (void)setKeys:(NSArray *)keys triggerChangeNotificationsForDependentKey:(NSString *)dependentKey;
+ (void)setVersion:(NSInteger)aVersion;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_isKVOA;
- (BOOL)_isToManyChangeInformation;
- (BOOL)_overrideUseFastBlockObservers;
- (BOOL)implementsSelector:(SEL)a3;
- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError *)outError;
- (BOOL)validateValue:(id *)ioValue forKeyPath:(NSString *)inKeyPath error:(NSError *)outError;
- (NSDictionary)dictionaryWithValuesForKeys:(NSArray *)keys;
- (NSMutableArray)mutableArrayValueForKey:(NSString *)key;
- (NSMutableArray)mutableArrayValueForKeyPath:(NSString *)keyPath;
- (NSMutableOrderedSet)mutableOrderedSetValueForKey:(NSString *)key;
- (NSMutableOrderedSet)mutableOrderedSetValueForKeyPath:(NSString *)keyPath;
- (NSMutableSet)mutableSetValueForKey:(NSString *)key;
- (NSMutableSet)mutableSetValueForKeyPath:(NSString *)keyPath;
- (id)_implicitObservationInfo;
- (id)_observerStorage;
- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4;
- (id)addChainedObservers:(id)a3;
- (id)addObservationTransformer:(id)a3;
- (id)addObserver:(id)a3;
- (id)addObserver:(id)a3 forObservableKeyPath:(id)a4;
- (id)addObserverBlock:(id)a3;
- (id)autoContentAccessingProxy;
- (id)newTaggedNSStringWithASCIIBytes_:(const char *)a3 length_:(int64_t)a4;
- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver;
- (id)replacementObjectForPortCoder:(NSPortCoder *)coder;
- (id)valueForKey:(NSString *)key;
- (id)valueForKeyPath:(NSString *)keyPath;
- (id)valueForUndefinedKey:(NSString *)key;
- (void)_addObserver:(id)a3 forProperty:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)_changeValueForKey:(id)a3 key:(id)a4 key:(id)a5 usingBlock:(id)a6;
- (void)_changeValueForKey:(id)a3 usingBlock:(id)a4;
- (void)_changeValueForKeys:(id *)a3 count:(unint64_t)a4 maybeOldValuesDict:(id)a5 maybeNewValuesDict:(id)a6 usingBlock:(id)a7;
- (void)_destroyObserverList;
- (void)_didChangeValuesForKeys:(id)a3;
- (void)_notifyObserversForKeyPath:(id)a3 change:(id)a4;
- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4;
- (void)_observerStorageOfSize:(unint64_t)a3;
- (void)_receiveBox:(id)a3;
- (void)_removeObserver:(id)a3 forProperty:(id)a4;
- (void)_setSharedObservationInfo:(uint64_t)a1;
- (void)_willChangeValuesForKeys:(id)a3;
- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;
- (void)didChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key;
- (void)didChangeValueForKey:(NSString *)key;
- (void)didChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects;
- (void)finishObserving;
- (void)observationInfo;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay;
- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray *)modes;
- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg;
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array;
- (void)receiveObservedError:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)removeObservation:(id)a3;
- (void)removeObservation:(id)a3 forObservableKeyPath:(id)a4;
- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;
- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context;
- (void)setNilValueForKey:(NSString *)key;
- (void)setObservation:(id)a3 forObservingKeyPath:(id)a4;
- (void)setObservationInfo:(void *)observationInfo;
- (void)setSharedObservers:(id)a3;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues;
- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key;
- (void)willChangeValueForKey:(NSString *)key;
- (void)willChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects;
@end

@implementation NSObject

- (void)willChangeValueForKey:(NSString *)key
{
  NSKeyValueWillChangeWithPerThreadPendingNotifications( self,  (uint64_t)key,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting,  0LL,  0LL);
}

- (void)observationInfo
{
  if (NSKeyValueObservationInfoPerObject) {
    return (void *)CFDictionaryGetValue( (CFDictionaryRef)NSKeyValueObservationInfoPerObject,  (const void *)~(unint64_t)self);
  }
  else {
    return 0LL;
  }
}

- (id)_implicitObservationInfo
{
  unint64_t Value = (unint64_t)self;
  if (self)
  {
    os_unfair_lock_lock(&NSKeyValueObservationInfoLock);
    if (NSKeyValueSharedObservationInfoPerObject) {
      unint64_t Value = (unint64_t)CFDictionaryGetValue( (CFDictionaryRef)NSKeyValueSharedObservationInfoPerObject,  (const void *)~Value);
    }
    else {
      unint64_t Value = 0LL;
    }
    os_unfair_lock_unlock(&NSKeyValueObservationInfoLock);
  }

  return (id)Value;
}

- (void)didChangeValueForKey:(NSString *)key
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications( self,  (uint64_t)key,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting,  0LL);
}

- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4
{
  return NSKVOPendingPerThreadNotificationStack(a4);
}

- (id)newTaggedNSStringWithASCIIBytes_:(const char *)a3 length_:(int64_t)a4
{
  return (id)_CFStringCreateTaggedPointerString();
}

- (id)valueForKeyPath:(NSString *)keyPath
{
  size_t v5 = -[NSString length](keyPath, "length");
  if (!keyPath) {
    goto LABEL_7;
  }
  v6 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v7 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }

  CStringPtr = CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    v9 = CStringPtr;
    v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      v11 = (char *)(v10 - v9);
LABEL_9:
      v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0LL);
      id v16 = -[NSString _newSubstringWithRange:zone:]( keyPath,  "_newSubstringWithRange:zone:",  v14,  v5 - (void)v14,  0LL);
      v17 = (void *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "valueForKeyPath:", v16);

      return v17;
    }
  }

  else
  {
LABEL_7:
    uint64_t v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", @".", 2LL, 0LL, v5);
    if (v13)
    {
      v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return -[NSObject valueForKey:](self, "valueForKey:", keyPath);
}

- (id)valueForKey:(NSString *)key
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (!key)
  {
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to retrieve a value for a nil key", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }

  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  if (!_MergedGlobals_98)
  {
    __int128 v6 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
    *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
    *(_OWORD *)&callBacks.release = v6;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    _MergedGlobals_98 = (uint64_t)CFSetCreateMutable(0LL, 0LL, &callBacks);
  }

  callBacks.version = 0LL;
  callBacks.retain = Class;
  callBacks.release = (CFSetReleaseCallBack)key;
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(CFHash(key) ^ (unint64_t)Class);
  id Value = (id)CFSetGetValue((CFSetRef)_MergedGlobals_98, &callBacks);
  if (!Value)
  {
    id Value = objc_msgSend(Class, sel__createValueGetterWithContainerClassID_key_, Class, key);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, Value);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (id)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
  uint64_t v7 = _NSKeyValueDebugger();
  if (v7)
  {
    v8 = (os_unfair_lock_s *)v7;
    uint64_t v9 = _CFGetTSD();
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 64);
    }
    else {
      uint64_t v10 = 0LL;
    }
    -[_NSKeyValueDebugging object:willRemoveObserver:forKeyPath:context:]( v8,  (uint64_t)self,  observer,  (uint64_t)keyPath,  v10);
  }

  os_unfair_recursive_lock_lock_with_options();
  Class = object_getClass(self);
  -[NSObject _removeObserver:forProperty:]( self,  "_removeObserver:forProperty:",  observer,  NSKeyValuePropertyForIsaAndKeyPath(Class, keyPath));
  os_unfair_recursive_lock_unlock();
}

- (void)_removeObserver:(id)a3 forProperty:(id)a4
{
  v25[1] = *(NSKeyValueObservance **)MEMORY[0x1895F89C0];
  uint64_t v7 = *((void *)a4 + 1);
  v8 = _NSKeyValueRetainedObservationInfoForObject(self, v7);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = _CFGetTSD();
    if (v10
      && (uint64_t v11 = v10, *(NSObject **)(v10 + 32) == self)
      && *(id *)(v10 + 40) == a3
      && objc_msgSend(*(id *)(v10 + 48), "isEqualToString:", objc_msgSend(a4, "keyPath")))
    {
      uint64_t v13 = *(NSObject **)(v11 + 56);
      uint64_t v12 = *(void **)(v11 + 64);
      char v14 = *(_BYTE *)(v11 + 72) != 0;
    }

    else
    {
      char v14 = 0;
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
    }

    id v15 = _NSKeyValueObservationInfoCreateByRemoving( (uint64_t)v9,  (objc_class *)a3,  (NSKeyValueProperty *)a4,  v12,  v14,  v13,  &v24,  v25);
    if (v25[0])
    {
      id v16 = v15;
      v17 = v25[0];
      _NSKeyValueReplaceObservationInfoForObject(self, *((void *)a4 + 1), v9, v16);
      [a4 object:self didRemoveObservance:v25[0] recurse:1];
      if (!v16)
      {
        Class Class = object_getClass(self);
        v21 = *(objc_class **)(v7 + 8);
        if (Class != v21)
        {
          if (_NSKVOUsesBaseClassObservationInfoImplementationForClass(v21)) {
            object_setClass(self, *(Class *)(v7 + 8));
          }
          objc_setAssociatedObject(self, &_NSKeyValueObservingObservationInfoOverriderMayThrowOnDealloc, 0LL, (void *)1);
        }
      }

      return;
    }

- (void)setObservationInfo:(void *)observationInfo
{
  Mutable = (__CFDictionary *)NSKeyValueObservationInfoPerObject;
  if (!NSKeyValueObservationInfoPerObject)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
    NSKeyValueObservationInfoPerObject = (uint64_t)Mutable;
  }

  unint64_t v6 = ~(unint64_t)self;
  if (observationInfo) {
    CFDictionarySetValue(Mutable, (const void *)v6, observationInfo);
  }
  else {
    CFDictionaryRemoveValue(Mutable, (const void *)v6);
  }
}

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v4 = (void *)[MEMORY[0x189604008] currentRunLoop];
  if (v4)
  {
    size_t v5 = v4;
    objc_sync_enter(v4);
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v5 _dperf]);
    if (Count)
    {
      uint64_t v7 = (const __CFString *)*MEMORY[0x189603B48];
      v8 = (const __CFString *)*MEMORY[0x1896051A8];
      id v17 = aTarget;
      do
      {
        ValueAtIndex = (__CFRunLoopTimer *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v5, "_dperf", v17), --Count);
        if (CFRunLoopTimerIsValid(ValueAtIndex))
        {
          context.version = 0LL;
          CFRunLoopTimerGetContext(ValueAtIndex, &context);
          info = context.info;
          if (*(id *)context.info == aTarget || [*(id *)context.info isEqual:aTarget])
          {
            CFRetain(ValueAtIndex);
            uint64_t v18 = info;
            CFIndex v19 = Count;
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            uint64_t v11 = (void *)info[3];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v23;
              do
              {
                for (uint64_t i = 0LL; i != v12; ++i)
                {
                  if (*(void *)v23 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  id v15 = *(const __CFString **)(*((void *)&v22 + 1) + 8 * i);
                  id v16 = v8;
                  if (v15 != v7)
                  {
                    if ([*(id *)(*((void *)&v22 + 1) + 8 * i) isEqual:@"kCFRunLoopCommonModes"]) {
                      id v16 = v8;
                    }
                    else {
                      id v16 = v15;
                    }
                  }

                  CFRunLoopRemoveTimer((CFRunLoopRef)[v5 getCFRunLoop], ValueAtIndex, v16);
                }

                uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
              }

              while (v12);
            }

            aTarget = v17;
            CFIndex Count = v19;
            if (v18[6]) {
              -[NSProcessInfo endActivity:]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "endActivity:",  v18[6]);
            }
            CFRunLoopTimerInvalidate(ValueAtIndex);
            CFRelease(ValueAtIndex);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)[v5 _dperf], v19);
          }
        }
      }

      while (Count);
    }

    objc_sync_exit(v5);
  }

- (id)addObserver:(id)a3 forObservableKeyPath:(id)a4
{
  int v7 = [a3 conformsToProtocol:&unk_18C65FF90];
  v8 = off_189C62200;
  if (!v7) {
    v8 = off_189C621D8;
  }
  return (id)[objc_alloc(*v8) initWithObservable:self observer:a3 keyPath:a4];
}

- (void)removeObservation:(id)a3 forObservableKeyPath:(id)a4
{
}

- (void)setObservation:(id)a3 forObservingKeyPath:(id)a4
{
  AssociatedObject = (NSMapTable *)objc_getAssociatedObject(self, "strongObservingKeyPathsAssociationKey");
  if (!AssociatedObject)
  {
    AssociatedObject = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSMapTable),  "initWithKeyOptions:valueOptions:capacity:",  0LL,  0LL,  0LL);
    objc_setAssociatedObject(self, "strongObservingKeyPathsAssociationKey", AssociatedObject, (void *)0x301);
  }

  if (a3) {
    -[NSMapTable setObject:forKey:](AssociatedObject, "setObject:forKey:", a3, a4);
  }
  else {
    -[NSMapTable removeObjectForKey:](AssociatedObject, "removeObjectForKey:", a4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&setObservation_forObservingKeyPath__lock);
}

- (void)setSharedObservers:(id)a3
{
  if (a3) {
    [a3 _assignToObject:self];
  }
  else {
    -[NSObject _setSharedObservationInfo:]((uint64_t)self, 0LL);
  }
}

- (BOOL)_overrideUseFastBlockObservers
{
  return 0;
}

- (void)finishObserving
{
  v2 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)&OBJC_CLASS____NSObserverList, self, 0);
  [v2 finishObserving];
}

- (id)addChainedObservers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = (void *)[a3 reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0LL;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v7) {
          uint64_t v10 = (void *)[v10 addObserver:v7];
        }
        int v7 = v10;
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }

    while (v6);
  }

  else
  {
    int v7 = 0LL;
  }

  return -[NSObject addObserver:](self, "addObserver:", v7);
}

- (id)addObserverBlock:(id)a3
{
  if (qword_18C494A80 != -1) {
    dispatch_once(&qword_18C494A80, &__block_literal_global_12);
  }
  Class Class = object_getClass(self);
  if (class_getMethodImplementation(Class, sel_addObserver_) != (IMP)_MergedGlobals_19_1
    && !-[NSObject _overrideUseFastBlockObservers](self, "_overrideUseFastBlockObservers"))
  {
    return -[NSObject addObserver:]( self,  "addObserver:",  +[NSObservationSink handleValuesWithBlock:](&OBJC_CLASS___NSObservationSink, "handleValuesWithBlock:", a3));
  }

  uint64_t v6 = (NSObservation *)+[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]( (uint64_t)&OBJC_CLASS____NSObserverList,  self,  1);
  int v7 = -[_NSObserverList addBlockSink:toObservableObject:forTag:](v6, (uint64_t)a3, (uint64_t)self, 1LL);

  return v7;
}

IMP __64__NSObject_DefaultObservationImplementations__addObserverBlock___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  IMP result = class_getMethodImplementation(v0, sel_addObserver_);
  _MergedGlobals_19_1 = (uint64_t)result;
  return result;
}

- (id)addObservationTransformer:(id)a3
{
  v4[5] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __73__NSObject_DefaultObservationImplementations__addObservationTransformer___block_invoke;
  v4[3] = &unk_189C9B010;
  v4[4] = a3;
  return -[NSObject addObserver:]( self,  "addObserver:",  +[NSObservationTransformer mapValuesWithBlock:]( &OBJC_CLASS___NSObservationTransformer,  "mapValuesWithBlock:",  v4));
}

uint64_t __73__NSObject_DefaultObservationImplementations__addObservationTransformer___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)_observerStorage
{
  return 0LL;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  return 0LL;
}

- (void)_destroyObserverList
{
}

- (BOOL)_isToManyChangeInformation
{
  return 0;
}

- (void)receiveObservedError:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v10);
  MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
  uint64_t v8 = objc_constructInstance(v7, (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v8[6] = 2;
  *((void *)v8 + 1) = a3;
  *((void *)v8 + 2) = self;
  uint64_t v9 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)&OBJC_CLASS____NSObserverList, self, 0);
  [v9 _receiveBox:v8];
}

- (void)receiveObservedValue:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v10);
  MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
  uint64_t v8 = objc_constructInstance(v7, (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v8[6] = 1;
  *((void *)v8 + 1) = a3;
  *((void *)v8 + 2) = self;
  uint64_t v9 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)&OBJC_CLASS____NSObserverList, self, 0);
  [v9 _receiveBox:v8];
}

- (id)addObserver:(id)a3
{
  uint64_t v5 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)&OBJC_CLASS____NSObserverList, self, 1);
  -[_NSObserverList addObserver:toObservableObject:]((uint64_t)v5, a3, self);
  Class v7 = v6;

  return v7;
}

- (void)removeObservation:(id)a3
{
  v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)&OBJC_CLASS____NSObserverList, self, 0);
  [v4 removeObservation:a3];
}

- (void)_receiveBox:(id)a3
{
  int v3 = *((_DWORD *)a3 + 6);
  switch(v3)
  {
    case 3:
      -[NSObject finishObserving](self, "finishObserving");
      break;
    case 2:
      -[NSObject receiveObservedError:](self, "receiveObservedError:", *((void *)a3 + 1));
      break;
    case 1:
      -[NSObject receiveObservedValue:](self, "receiveObservedValue:", *((void *)a3 + 1));
      break;
    default:
      abort();
  }

+ (BOOL)accessInstanceVariablesDirectly
{
  return 1;
}

+ (id)_createMutableArrayValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    Class v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    uint64_t v8 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
    if (!NSKeyValueCachedMutableArrayGetters)
    {
      __int128 v9 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
      *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      uint64_t v8 = CFSetCreateMutable(0LL, 0LL, &callBacks);
      NSKeyValueCachedMutableArrayGetters = (uint64_t)v8;
    }

    callBacks.version = 0LL;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v10 = CFHash(a4);
      uint64_t v8 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
    }

    else
    {
      CFHashCode v10 = 0LL;
    }

    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    id Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      id Value = objc_msgSend(v7, sel__createMutableArrayValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableArrayGetters, Value);
    }

    return -[NSKeyValueNotifyingMutableCollectionGetter initWithContainerClassID:key:mutableCollectionGetter:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueNotifyingMutableCollectionGetter),  "initWithContainerClassID:key:mutableCollectionGetter:proxyClass:",  a3,  a4,  Value,  objc_opt_self());
  }

  uint64_t v11 = [a4 lengthOfBytesUsingEncoding:4];
  unint64_t v12 = v11 + 1;
  if (v11 == -1)
  {
    *(void *)&double v13 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    __int128 v14 = (char *)&v41;
  }

  else
  {
    __int128 v14 = (char *)malloc(v11 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1) {
    unint64_t v15 = 1LL;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 < 2 || !v14 || !memchr(v14, 0, v15 - 1))
  {
    if ([a4 length]) {
      char *v14 = __toupper(*v14);
    }
    __int128 v16 = (const __CFSet *)_MergedGlobals_98;
    if (!_MergedGlobals_98)
    {
      __int128 v17 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
      *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.release = v17;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      __int128 v16 = CFSetCreateMutable(0LL, 0LL, &callBacks);
      _MergedGlobals_98 = (uint64_t)v16;
    }

    callBacks.version = 0LL;
    callBacks.retain = (CFSetRetainCallBack)a1;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v18 = CFHash(a4);
      __int128 v16 = (const __CFSet *)_MergedGlobals_98;
    }

    else
    {
      CFHashCode v18 = 0LL;
    }

    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
    id v21 = (id)CFSetGetValue(v16, &callBacks);
    if (!v21)
    {
      id v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
      CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);
    }

    Method v22 = NSKeyValueMethodForPattern((objc_class *)a1, "insertObject:in%sAtIndex:", v14);
    Method v23 = NSKeyValueMethodForPattern((objc_class *)a1, "insert%s:atIndexes:", v14);
    Method v24 = NSKeyValueMethodForPattern((objc_class *)a1, "removeObjectFrom%sAtIndex:", v14);
    Method v25 = NSKeyValueMethodForPattern((objc_class *)a1, "remove%sAtIndexes:", v14);
    if ((unint64_t)v22 | (unint64_t)v23 && (uint64_t v26 = v25, (unint64_t)v24 | (unint64_t)v25))
    {
      id v42 = a3;
      v27 = objc_alloc_init(&OBJC_CLASS___NSKeyValueMutatingArrayMethodSet);
      v27->insertObjectAtIndex = v22;
      v27->insertObjectsAtIndexes = v23;
      v27->removeObjectAtIndex = v24;
      v27->removeObjectsAtIndexes = v26;
      v27->replaceObjectAtIndex = NSKeyValueMethodForPattern( (objc_class *)a1,  "replaceObjectIn%sAtIndex:withObject:",  v14);
      v27->replaceObjectsAtIndexes = NSKeyValueMethodForPattern( (objc_class *)a1,  "replace%sAtIndexes:with%s:",  v14,  v14);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_alloc(&OBJC_CLASS___NSKeyValueFastMutableCollection1Getter);
        uint64_t v29 = [v21 methods];
        uint64_t v30 = -[NSKeyValueFastMutableCollection1Getter initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:]( v28,  "initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:",  v42,  a4,  v29,  v27,  objc_opt_self());
      }

      else
      {
        v38 = objc_alloc(&OBJC_CLASS___NSKeyValueFastMutableCollection2Getter);
        uint64_t v30 = -[NSKeyValueFastMutableCollection2Getter initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:]( v38,  "initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:",  v42,  a4,  v21,  v27,  objc_opt_self());
      }

      v20 = (void *)v30;

      if (!v12) {
        return v20;
      }
    }

    else
    {
      v31 = (const __CFSet *)NSKeyValueCachedSetters;
      if (!NSKeyValueCachedSetters)
      {
        __int128 v32 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
        *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
        *(_OWORD *)&callBacks.release = v32;
        callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
        callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
        v31 = CFSetCreateMutable(0LL, 0LL, &callBacks);
        NSKeyValueCachedSetters = (uint64_t)v31;
      }

      callBacks.version = 0LL;
      callBacks.retain = (CFSetRetainCallBack)a1;
      callBacks.release = (CFSetReleaseCallBack)a4;
      id v33 = a3;
      if (a4)
      {
        CFHashCode v34 = CFHash(a4);
        v31 = (const __CFSet *)NSKeyValueCachedSetters;
      }

      else
      {
        CFHashCode v34 = 0LL;
      }

      callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
      id v35 = (id)CFSetGetValue(v31, &callBacks);
      if (!v35)
      {
        id v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
        CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);
      }

      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]( [NSKeyValueIvarMutableCollectionGetter alloc],  "initWithContainerClassID:key:containerIsa:ivar:proxyClass:",  v33,  a4,  a1,  [v35 ivar],  objc_opt_self());
      }
      else {
        v36 = -[NSKeyValueSlowMutableCollectionGetter initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueSlowMutableCollectionGetter),  "initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:",  v33,  a4,  v21,  v35,  a1,  objc_opt_self());
      }
      v20 = v36;
      if (!v12) {
        return v20;
      }
    }

    free(v14);
    return v20;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  return NSKeyValueMethodForPattern(v39, v40);
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!key)
  {
    CFHashCode v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: attempt to set a value for a nil key", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
  }

  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  if (!NSKeyValueCachedSetters)
  {
    __int128 v8 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
    *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
    *(_OWORD *)&callBacks.release = v8;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    NSKeyValueCachedSetters = (uint64_t)CFSetCreateMutable(0LL, 0LL, &callBacks);
  }

  callBacks.version = 0LL;
  callBacks.retain = Class;
  callBacks.release = (CFSetReleaseCallBack)key;
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(CFHash(key) ^ (unint64_t)Class);
  id v9 = (id)CFSetGetValue((CFSetRef)NSKeyValueCachedSetters, &callBacks);
  if (!v9)
  {
    id v9 = objc_msgSend(Class, sel__createValueSetterWithContainerClassID_key_, Class, key);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v9);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  _NSSetUsingKeyValueSetter((uint64_t)self, (uint64_t)v9, (uint64_t)value);
}

- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError *)outError
{
  v22[3] = *MEMORY[0x1895F89C0];
  NSUInteger v9 = -[NSString lengthOfBytesUsingEncoding:](inKey, "lengthOfBytesUsingEncoding:", 4LL);
  unint64_t v10 = v9 + 1;
  if (v9 == -1LL)
  {
    *(void *)&double v11 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v12 = (char *)v22;
  }

  else
  {
    uint64_t v12 = (char *)malloc(v9 + 1);
  }

  -[NSString getCString:maxLength:encoding:](inKey, "getCString:maxLength:encoding:", v12, v10, 4LL, v11);
  if (v10 <= 1) {
    unint64_t v13 = 1LL;
  }
  else {
    unint64_t v13 = v10;
  }
  BOOL v14 = v13 < 2 || v12 == 0LL;
  if (v14 || !memchr(v12, 0, v13 - 1))
  {
    if (-[NSString length](inKey, "length")) {
      *uint64_t v12 = __toupper(*v12);
    }
    Class Class = object_getClass(self);
    __int128 v16 = NSKeyValueMethodForPattern(Class, "validate%s:error:", v12);
    if (v16)
    {
      unsigned __int8 v17 = method_invoke(self, v16, ioValue, outError);
      if (!v10) {
        return v17;
      }
    }

    else
    {
      unsigned __int8 v17 = 1;
      if (!v10) {
        return v17;
      }
    }

    free(v12);
    return v17;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  return -[NSObject mutableArrayValueForKey:](v19, v20, v21);
}

- (NSMutableArray)mutableArrayValueForKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  uint64_t v6 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
  if (!NSKeyValueCachedMutableArrayGetters)
  {
    __int128 v7 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
    *(_OWORD *)&v11.version = *MEMORY[0x189605258];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    uint64_t v6 = CFSetCreateMutable(0LL, 0LL, &v11);
    NSKeyValueCachedMutableArrayGetters = (uint64_t)v6;
  }

  v11.version = 0LL;
  v11.retain = Class;
  v11.release = (CFSetReleaseCallBack)key;
  if (key)
  {
    CFHashCode v8 = CFHash(key);
    uint64_t v6 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
  }

  else
  {
    CFHashCode v8 = 0LL;
  }

  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  id Value = (id)CFSetGetValue(v6, &v11);
  if (!Value)
  {
    id Value = objc_msgSend( Class,  sel__createMutableArrayValueGetterWithContainerClassID_key_,  Class,  key,  *(_OWORD *)&v11.version,  v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableArrayGetters, Value);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableArray *)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (NSMutableOrderedSet)mutableOrderedSetValueForKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  uint64_t v6 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
  if (!NSKeyValueCachedMutableOrderedSetGetters)
  {
    __int128 v7 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
    *(_OWORD *)&v11.version = *MEMORY[0x189605258];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    uint64_t v6 = CFSetCreateMutable(0LL, 0LL, &v11);
    NSKeyValueCachedMutableOrderedSetGetters = (uint64_t)v6;
  }

  v11.version = 0LL;
  v11.retain = Class;
  v11.release = (CFSetReleaseCallBack)key;
  if (key)
  {
    CFHashCode v8 = CFHash(key);
    uint64_t v6 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
  }

  else
  {
    CFHashCode v8 = 0LL;
  }

  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  id Value = (id)CFSetGetValue(v6, &v11);
  if (!Value)
  {
    id Value = objc_msgSend( Class,  sel__createMutableOrderedSetValueGetterWithContainerClassID_key_,  Class,  key,  *(_OWORD *)&v11.version,  v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableOrderedSetGetters, Value);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableOrderedSet *)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (NSMutableSet)mutableSetValueForKey:(NSString *)key
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  Class Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  uint64_t v6 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
  if (!NSKeyValueCachedMutableSetGetters)
  {
    __int128 v7 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
    *(_OWORD *)&v11.version = *MEMORY[0x189605258];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    uint64_t v6 = CFSetCreateMutable(0LL, 0LL, &v11);
    NSKeyValueCachedMutableSetGetters = (uint64_t)v6;
  }

  v11.version = 0LL;
  v11.retain = Class;
  v11.release = (CFSetReleaseCallBack)key;
  if (key)
  {
    CFHashCode v8 = CFHash(key);
    uint64_t v6 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
  }

  else
  {
    CFHashCode v8 = 0LL;
  }

  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  id Value = (id)CFSetGetValue(v6, &v11);
  if (!Value)
  {
    id Value = objc_msgSend( Class,  sel__createMutableSetValueGetterWithContainerClassID_key_,  Class,  key,  *(_OWORD *)&v11.version,  v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableSetGetters, Value);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableSet *)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
  size_t v7 = -[NSString length](keyPath, "length");
  if (!keyPath) {
    goto LABEL_7;
  }
  CFHashCode v8 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v9 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v9 = *v8;
  }

  CStringPtr = CFStringGetCStringPtr((CFStringRef)keyPath, v9);
  if (CStringPtr)
  {
    CFSetCallBacks v11 = CStringPtr;
    uint64_t v12 = (char *)memchr(CStringPtr, 46, v7);
    if (v12)
    {
      unint64_t v13 = (char *)(v12 - v11);
LABEL_9:
      __int128 v16 = v13 + 1;
      id v18 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0LL);
      id v17 = -[NSString _newSubstringWithRange:zone:]( keyPath,  "_newSubstringWithRange:zone:",  v16,  v7 - (void)v16,  0LL);
      objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v18), "setValue:forKeyPath:", value, v17);

      return;
    }
  }

  else
  {
LABEL_7:
    uint64_t v14 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", @".", 2LL, 0LL, v7);
    if (v15)
    {
      unint64_t v13 = (char *)v14;
      goto LABEL_9;
    }
  }

  -[NSObject setValue:forKey:](self, "setValue:forKey:", value, keyPath);
}

- (BOOL)validateValue:(id *)ioValue forKeyPath:(NSString *)inKeyPath error:(NSError *)outError
{
  size_t v9 = -[NSString length](inKeyPath, "length");
  if (!inKeyPath) {
    goto LABEL_7;
  }
  unint64_t v10 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v11 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v11 = *v10;
  }

  CStringPtr = CFStringGetCStringPtr((CFStringRef)inKeyPath, v11);
  if (CStringPtr)
  {
    unint64_t v13 = CStringPtr;
    uint64_t v14 = (char *)memchr(CStringPtr, 46, v9);
    if (v14)
    {
      uint64_t v15 = (char *)(v14 - v13);
LABEL_9:
      id v18 = v15 + 1;
      id v19 = -[NSString _newSubstringWithRange:zone:](inKeyPath, "_newSubstringWithRange:zone:", 0LL);
      id v20 = -[NSString _newSubstringWithRange:zone:]( inKeyPath,  "_newSubstringWithRange:zone:",  v18,  v9 - (void)v18,  0LL);
      char v21 = objc_msgSend( -[NSObject valueForKey:](self, "valueForKey:", v19),  "validateValue:forKeyPath:error:",  ioValue,  v20,  outError);

      return v21;
    }
  }

  else
  {
LABEL_7:
    uint64_t v16 = -[NSString rangeOfString:options:range:](inKeyPath, "rangeOfString:options:range:", @".", 2LL, 0LL, v9);
    if (v17)
    {
      uint64_t v15 = (char *)v16;
      goto LABEL_9;
    }
  }

  return -[NSObject validateValue:forKey:error:](self, "validateValue:forKey:error:", ioValue, inKeyPath, outError);
}

- (NSMutableArray)mutableArrayValueForKeyPath:(NSString *)keyPath
{
  size_t v5 = -[NSString length](keyPath, "length");
  if (!keyPath) {
    goto LABEL_7;
  }
  uint64_t v6 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v7 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }

  CStringPtr = CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    size_t v9 = CStringPtr;
    unint64_t v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      CFStringEncoding v11 = (char *)(v10 - v9);
LABEL_9:
      uint64_t v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0LL);
      id v16 = -[NSString _newSubstringWithRange:zone:]( keyPath,  "_newSubstringWithRange:zone:",  v14,  v5 - (void)v14,  0LL);
      uint64_t v17 = (NSMutableArray *)objc_msgSend( -[NSObject valueForKey:](self, "valueForKey:", v15),  "mutableArrayValueForKeyPath:",  v16);

      return v17;
    }
  }

  else
  {
LABEL_7:
    uint64_t v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", @".", 2LL, 0LL, v5);
    if (v13)
    {
      CFStringEncoding v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return -[NSObject mutableArrayValueForKey:](self, "mutableArrayValueForKey:", keyPath);
}

- (NSMutableOrderedSet)mutableOrderedSetValueForKeyPath:(NSString *)keyPath
{
  size_t v5 = -[NSString length](keyPath, "length");
  if (!keyPath) {
    goto LABEL_7;
  }
  uint64_t v6 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v7 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }

  CStringPtr = CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    size_t v9 = CStringPtr;
    unint64_t v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      CFStringEncoding v11 = (char *)(v10 - v9);
LABEL_9:
      uint64_t v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0LL);
      id v16 = -[NSString _newSubstringWithRange:zone:]( keyPath,  "_newSubstringWithRange:zone:",  v14,  v5 - (void)v14,  0LL);
      uint64_t v17 = (NSMutableOrderedSet *)objc_msgSend( -[NSObject valueForKey:](self, "valueForKey:", v15),  "mutableOrderedSetValueForKeyPath:",  v16);

      return v17;
    }
  }

  else
  {
LABEL_7:
    uint64_t v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", @".", 2LL, 0LL, v5);
    if (v13)
    {
      CFStringEncoding v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return -[NSObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", keyPath);
}

- (NSMutableSet)mutableSetValueForKeyPath:(NSString *)keyPath
{
  size_t v5 = -[NSString length](keyPath, "length");
  if (!keyPath) {
    goto LABEL_7;
  }
  uint64_t v6 = (CFStringEncoding *)MEMORY[0x189604970];
  CFStringEncoding v7 = *MEMORY[0x189604970];
  if (*MEMORY[0x189604970] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v7 = *v6;
  }

  CStringPtr = CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    size_t v9 = CStringPtr;
    unint64_t v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      CFStringEncoding v11 = (char *)(v10 - v9);
LABEL_9:
      uint64_t v14 = v11 + 1;
      id v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0LL);
      id v16 = -[NSString _newSubstringWithRange:zone:]( keyPath,  "_newSubstringWithRange:zone:",  v14,  v5 - (void)v14,  0LL);
      uint64_t v17 = (NSMutableSet *)objc_msgSend( -[NSObject valueForKey:](self, "valueForKey:", v15),  "mutableSetValueForKeyPath:",  v16);

      return v17;
    }
  }

  else
  {
LABEL_7:
    uint64_t v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", @".", 2LL, 0LL, v5);
    if (v13)
    {
      CFStringEncoding v11 = (char *)v12;
      goto LABEL_9;
    }
  }

  return -[NSObject mutableSetValueForKey:](self, "mutableSetValueForKey:", keyPath);
}

- (id)valueForUndefinedKey:(NSString *)key
{
  int v3 = key;
  size_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[<%@ %p> valueForUndefinedKey:]: this class is not key value coding-compliant for the key %@.",  objc_opt_class(),  self,  key);
  id v6 = objc_alloc(MEMORY[0x189603F68]);
  if (!v3) {
    int v3 = (NSString *)[MEMORY[0x189603FE8] null];
  }
  CFStringEncoding v7 = (void *)objc_msgSend( v6,  "initWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  v3,  @"NSUnknownUserInfoKey",  0);
  CFHashCode v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSUnknownKeyException" reason:v5 userInfo:v7];

  [v8 raise];
  return 0LL;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
  v4 = key;
  id v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[<%@ %p> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key %@.",  objc_opt_class(),  self,  key);
  id v7 = objc_alloc(MEMORY[0x189603F68]);
  if (!v4) {
    v4 = (NSString *)[MEMORY[0x189603FE8] null];
  }
  CFHashCode v8 = (void *)objc_msgSend( v7,  "initWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  v4,  @"NSUnknownUserInfoKey",  0);
  size_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSUnknownKeyException" reason:v6 userInfo:v8];

  [v9 raise];
}

- (void)setNilValueForKey:(NSString *)key
{
  int v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> setNilValueForKey]: could not set nil as the value for the key %@.", objc_opt_class(), self, key), 0 reason userInfo];
  objc_exception_throw(v3);
  -[NSObject dictionaryWithValuesForKeys:](v4, v5, v6);
}

- (NSDictionary)dictionaryWithValuesForKeys:(NSArray *)keys
{
  NSUInteger v5 = -[NSArray count](keys, "count");
  id v6 = (uint64_t *)malloc(8 * v5);
  id v7 = (uint64_t *)malloc(8 * v5);
  -[NSArray getObjects:range:](keys, "getObjects:range:", v6, 0LL, v5);
  uint64_t v8 = [MEMORY[0x189603FE8] null];
  if (v5)
  {
    uint64_t v9 = v8;
    unint64_t v10 = v6;
    CFStringEncoding v11 = v7;
    NSUInteger v12 = v5;
    do
    {
      uint64_t v13 = *v10++;
      id v14 = -[NSObject valueForKey:](self, "valueForKey:", v13);
      if (v14) {
        uint64_t v15 = (uint64_t)v14;
      }
      else {
        uint64_t v15 = v9;
      }
      *v11++ = v15;
      --v12;
    }

    while (v12);
  }

  id v16 = (NSDictionary *)(id)[objc_alloc(MEMORY[0x189603F68]) initWithObjects:v7 forKeys:v6 count:v5];
  free(v7);
  free(v6);
  return v16;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [MEMORY[0x189603FE8] null];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  NSUInteger v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( keyedValues,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(keyedValues);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = -[NSDictionary objectForKey:](keyedValues, "objectForKey:", v10);
        if (v11 == (id)v5) {
          id v12 = 0LL;
        }
        else {
          id v12 = v11;
        }
        -[NSObject setValue:forKey:](self, "setValue:forKey:", v12, v10);
      }

      NSUInteger v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( keyedValues,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    }

    while (v7);
  }

+ (id)_createValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  v34[3] = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    *(void *)&double v9 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v10 = v34;
  }

  else
  {
    uint64_t v10 = malloc(v7 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1LL;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0LL;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_53;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    _BYTE *v10 = v14;
  }

  if (v8)
  {
    __int128 v15 = (char *)malloc(v8);
  }

  else
  {
    MEMORY[0x1895F8858](v14);
    __int128 v15 = (char *)v34;
  }

  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_53:
    }
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }

  Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "get%s", v10);
  if (v16
    || (Method v17 = NSKeyValueMethodForPattern((objc_class *)a1, "%s", v15)) != 0LL
    && (Method v16 = v17, ![&unk_189D1CDD0 containsObject:a4])
    || (Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "is%s", v10)) != 0LL
    || (Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "_get%s", v10)) != 0LL
    || (Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "_%s", v15)) != 0LL)
  {
    uint64_t v18 = -[NSKeyValueMethodGetter initWithContainerClassID:key:method:]( objc_alloc(&OBJC_CLASS___NSKeyValueMethodGetter),  "initWithContainerClassID:key:method:",  a3,  a4,  v16);
LABEL_29:
    id v19 = (NSKeyValueCollectionGetter *)v18;
    goto LABEL_30;
  }

  Method v21 = NSKeyValueMethodForPattern((objc_class *)a1, "countOf%s", v10);
  Method v22 = NSKeyValueMethodForPattern((objc_class *)a1, "objectIn%sAtIndex:", v10);
  Method v23 = NSKeyValueMethodForPattern((objc_class *)a1, "%sAtIndexes:", v15);
  Method v24 = NSKeyValueMethodForPattern((objc_class *)a1, "indexIn%sOfObject:", v10);
  if (v24 && v21)
  {
    if ((unint64_t)v22 | (unint64_t)v23)
    {
      Method v25 = v24;
      uint64_t v26 = objc_alloc_init(&OBJC_CLASS___NSKeyValueNonmutatingOrderedSetMethodSet);
      v26->count = v21;
      v26->objectAtIndex = v22;
      v26->indexOfObject = v25;
      v26->objectsAtIndexes = v23;
      v27 = v26;
      v26->getObjectsRange = NSKeyValueMethodForPattern((objc_class *)a1, "get%s:range:", v10);
      id v19 = -[NSKeyValueCollectionGetter initWithContainerClassID:key:methods:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueCollectionGetter),  "initWithContainerClassID:key:methods:proxyClass:",  a3,  a4,  v27,  objc_opt_self());

      goto LABEL_30;
    }
  }

  else if (!v21)
  {
    goto LABEL_42;
  }

  if ((unint64_t)v22 | (unint64_t)v23)
  {
    v28 = objc_alloc_init(&OBJC_CLASS___NSKeyValueNonmutatingArrayMethodSet);
    v28->count = v21;
    v28->objectAtIndex = v22;
    v28->objectsAtIndexes = v23;
    v28->getObjectsRange = NSKeyValueMethodForPattern((objc_class *)a1, "get%s:range:", v10);
    uint64_t v29 = objc_alloc(&OBJC_CLASS___NSKeyValueCollectionGetter);
LABEL_46:
    id v19 = -[NSKeyValueCollectionGetter initWithContainerClassID:key:methods:proxyClass:]( v29,  "initWithContainerClassID:key:methods:proxyClass:",  a3,  a4,  v28,  objc_opt_self());

LABEL_30:
    if (v19) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }

+ (id)_createValueSetterWithContainerClassID:(id)a3 key:(id)a4
{
  v21[3] = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    *(void *)&double v9 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v10 = v21;
  }

  else
  {
    uint64_t v10 = malloc(v7 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1LL;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0LL;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_37;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    _BYTE *v10 = v14;
  }

  if (v8)
  {
    __int128 v15 = (char *)malloc(v8);
  }

  else
  {
    MEMORY[0x1895F8858](v14);
    __int128 v15 = (char *)v21;
  }

  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_37:
    }
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }

  Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "set%s:", v10);
  if (v16
    || (Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "_set%s:", v10)) != 0LL
    || (Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "setIs%s:", v10)) != 0LL)
  {
    Method v17 = -[NSKeyValueMethodSetter initWithContainerClassID:key:method:]( objc_alloc(&OBJC_CLASS___NSKeyValueMethodSetter),  "initWithContainerClassID:key:method:",  a3,  a4,  v16);
    goto LABEL_26;
  }

  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v20
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0LL
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0LL
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0LL)
    {
      Method v17 = -[NSKeyValueIvarSetter initWithContainerClassID:key:containerIsa:ivar:]( objc_alloc(&OBJC_CLASS___NSKeyValueIvarSetter),  "initWithContainerClassID:key:containerIsa:ivar:",  a3,  a4,  a1,  v20);
LABEL_26:
      uint64_t v18 = v17;
      if (v17) {
        goto LABEL_28;
      }
    }
  }

  uint64_t v18 = (NSKeyValueMethodSetter *)[a1 _createValuePrimitiveSetterWithContainerClassID:a3 key:a4];
LABEL_28:
  if (v8)
  {
    free(v10);
    free(v15);
  }

  return v18;
}

+ (id)_createMutableOrderedSetValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    uint64_t v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    size_t v8 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
    if (!NSKeyValueCachedMutableOrderedSetGetters)
    {
      __int128 v9 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
      *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      size_t v8 = CFSetCreateMutable(0LL, 0LL, &callBacks);
      NSKeyValueCachedMutableOrderedSetGetters = (uint64_t)v8;
    }

    callBacks.version = 0LL;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v10 = CFHash(a4);
      size_t v8 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
    }

    else
    {
      CFHashCode v10 = 0LL;
    }

    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    id Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      id Value = objc_msgSend(v7, sel__createMutableOrderedValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableOrderedSetGetters, Value);
    }

    return -[NSKeyValueNotifyingMutableCollectionGetter initWithContainerClassID:key:mutableCollectionGetter:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueNotifyingMutableCollectionGetter),  "initWithContainerClassID:key:mutableCollectionGetter:proxyClass:",  a3,  a4,  Value,  objc_opt_self());
  }

  uint64_t v11 = [a4 lengthOfBytesUsingEncoding:4];
  unint64_t v12 = v11 + 1;
  if (v11 == -1)
  {
    *(void *)&double v13 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v14 = (char *)&v43;
  }

  else
  {
    uint64_t v14 = (char *)malloc(v11 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1) {
    unint64_t v15 = 1LL;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 < 2 || !v14 || !memchr(v14, 0, v15 - 1))
  {
    if ([a4 length]) {
      char *v14 = __toupper(*v14);
    }
    Method v16 = (const __CFSet *)_MergedGlobals_98;
    if (!_MergedGlobals_98)
    {
      __int128 v17 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
      *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.release = v17;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      Method v16 = CFSetCreateMutable(0LL, 0LL, &callBacks);
      _MergedGlobals_98 = (uint64_t)v16;
    }

    callBacks.version = 0LL;
    callBacks.retain = (CFSetRetainCallBack)a1;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v18 = CFHash(a4);
      Method v16 = (const __CFSet *)_MergedGlobals_98;
    }

    else
    {
      CFHashCode v18 = 0LL;
    }

    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
    id v21 = (id)CFSetGetValue(v16, &callBacks);
    if (!v21)
    {
      id v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
      CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);
    }

    Method v22 = NSKeyValueMethodForPattern((objc_class *)a1, "insertObject:in%sAtIndex:", v14);
    Method v23 = NSKeyValueMethodForPattern((objc_class *)a1, "insert%s:atIndexes:", v14);
    Method v24 = NSKeyValueMethodForPattern((objc_class *)a1, "removeObjectFrom%sAtIndex:", v14);
    Method v25 = NSKeyValueMethodForPattern((objc_class *)a1, "remove%sAtIndexes:", v14);
    if ((unint64_t)v22 | (unint64_t)v23 && (uint64_t v26 = v25, (unint64_t)v24 | (unint64_t)v25))
    {
      id v44 = a3;
      v27 = objc_alloc_init(&OBJC_CLASS___NSKeyValueMutatingOrderedSetMethodSet);
      v27->insertObjectAtIndex = v22;
      v27->insertObjectsAtIndexes = v23;
      v27->removeObjectAtIndex = v24;
      v27->removeObjectsAtIndexes = v26;
      v27->replaceObjectAtIndex = NSKeyValueMethodForPattern( (objc_class *)a1,  "replaceObjectIn%sAtIndex:withObject:",  v14);
      v27->replaceObjectsAtIndexes = NSKeyValueMethodForPattern( (objc_class *)a1,  "replace%sAtIndexes:with%s:",  v14,  v14);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_alloc(&OBJC_CLASS___NSKeyValueFastMutableCollection1Getter);
        uint64_t v29 = [v21 methods];
        uint64_t v30 = -[NSKeyValueFastMutableCollection1Getter initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:]( v28,  "initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:",  v44,  a4,  v29,  v27,  objc_opt_self());
      }

      else
      {
        v38 = objc_alloc(&OBJC_CLASS___NSKeyValueFastMutableCollection2Getter);
        uint64_t v30 = -[NSKeyValueFastMutableCollection2Getter initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:]( v38,  "initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:",  v44,  a4,  v21,  v27,  objc_opt_self());
      }

      Ivar v20 = (void *)v30;

      if (!v12) {
        return v20;
      }
    }

    else
    {
      Method v31 = (const __CFSet *)NSKeyValueCachedSetters;
      if (!NSKeyValueCachedSetters)
      {
        __int128 v32 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
        *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
        *(_OWORD *)&callBacks.release = v32;
        callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
        callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
        Method v31 = CFSetCreateMutable(0LL, 0LL, &callBacks);
        NSKeyValueCachedSetters = (uint64_t)v31;
      }

      callBacks.version = 0LL;
      callBacks.retain = (CFSetRetainCallBack)a1;
      callBacks.release = (CFSetReleaseCallBack)a4;
      id v33 = a3;
      if (a4)
      {
        CFHashCode v34 = CFHash(a4);
        Method v31 = (const __CFSet *)NSKeyValueCachedSetters;
      }

      else
      {
        CFHashCode v34 = 0LL;
      }

      callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
      id v35 = (id)CFSetGetValue(v31, &callBacks);
      if (!v35)
      {
        id v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
        CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);
      }

      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]( [NSKeyValueIvarMutableCollectionGetter alloc],  "initWithContainerClassID:key:containerIsa:ivar:proxyClass:",  v33,  a4,  a1,  [v35 ivar],  objc_opt_self());
      }
      else {
        v36 = -[NSKeyValueSlowMutableCollectionGetter initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueSlowMutableCollectionGetter),  "initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:",  v33,  a4,  v21,  v35,  a1,  objc_opt_self());
      }
      Ivar v20 = v36;
      if (!v12) {
        return v20;
      }
    }

    free(v14);
    return v20;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  return +[NSObject _createMutableSetValueGetterWithContainerClassID:key:](v39, v40, v41, v42);
}

+ (id)_createMutableSetValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    uint64_t v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    size_t v8 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
    if (!NSKeyValueCachedMutableSetGetters)
    {
      __int128 v9 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
      *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      size_t v8 = CFSetCreateMutable(0LL, 0LL, &callBacks);
      NSKeyValueCachedMutableSetGetters = (uint64_t)v8;
    }

    callBacks.version = 0LL;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v10 = CFHash(a4);
      size_t v8 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
    }

    else
    {
      CFHashCode v10 = 0LL;
    }

    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    id Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      id Value = objc_msgSend(v7, sel__createMutableSetValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableSetGetters, Value);
    }

    return -[NSKeyValueNotifyingMutableCollectionGetter initWithContainerClassID:key:mutableCollectionGetter:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueNotifyingMutableCollectionGetter),  "initWithContainerClassID:key:mutableCollectionGetter:proxyClass:",  a3,  a4,  Value,  objc_opt_self());
  }

  uint64_t v11 = [a4 lengthOfBytesUsingEncoding:4];
  unint64_t v12 = v11 + 1;
  if (v11 == -1)
  {
    *(void *)&double v13 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v14 = (char *)&v43;
  }

  else
  {
    uint64_t v14 = (char *)malloc(v11 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1) {
    unint64_t v15 = 1LL;
  }
  else {
    unint64_t v15 = v12;
  }
  if (v15 < 2 || !v14 || !memchr(v14, 0, v15 - 1))
  {
    if ([a4 length]) {
      char *v14 = __toupper(*v14);
    }
    Method v16 = (const __CFSet *)_MergedGlobals_98;
    if (!_MergedGlobals_98)
    {
      __int128 v17 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
      *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
      *(_OWORD *)&callBacks.release = v17;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      Method v16 = CFSetCreateMutable(0LL, 0LL, &callBacks);
      _MergedGlobals_98 = (uint64_t)v16;
    }

    callBacks.version = 0LL;
    callBacks.retain = (CFSetRetainCallBack)a1;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      CFHashCode v18 = CFHash(a4);
      Method v16 = (const __CFSet *)_MergedGlobals_98;
    }

    else
    {
      CFHashCode v18 = 0LL;
    }

    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
    id v21 = (id)CFSetGetValue(v16, &callBacks);
    if (!v21)
    {
      id v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
      CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);
    }

    Method v22 = NSKeyValueMethodForPattern((objc_class *)a1, "add%sObject:", v14);
    Method v23 = NSKeyValueMethodForPattern((objc_class *)a1, "remove%s:", v14);
    Method v24 = NSKeyValueMethodForPattern((objc_class *)a1, "remove%sObject:", v14);
    Method v25 = NSKeyValueMethodForPattern((objc_class *)a1, "add%s:", v14);
    if ((unint64_t)v22 | (unint64_t)v25 && (unint64_t)v24 | (unint64_t)v23)
    {
      uint64_t v26 = v25;
      id v44 = a3;
      v27 = objc_alloc_init(&OBJC_CLASS___NSKeyValueMutatingSetMethodSet);
      v27->addObject = v22;
      v27->intersectSet = NSKeyValueMethodForPattern((objc_class *)a1, "intersect%s:", v14);
      v27->minusSet = v23;
      v27->removeObject = v24;
      v27->setSet = NSKeyValueMethodForPattern((objc_class *)a1, "set%s:", v14);
      v27->unionSet = v26;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = objc_alloc(&OBJC_CLASS___NSKeyValueFastMutableCollection1Getter);
        uint64_t v29 = [v21 methods];
        uint64_t v30 = -[NSKeyValueFastMutableCollection1Getter initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:]( v28,  "initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:",  v44,  a4,  v29,  v27,  objc_opt_self());
      }

      else
      {
        v38 = objc_alloc(&OBJC_CLASS___NSKeyValueFastMutableCollection2Getter);
        uint64_t v30 = -[NSKeyValueFastMutableCollection2Getter initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:]( v38,  "initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:",  v44,  a4,  v21,  v27,  objc_opt_self());
      }

      Ivar v20 = (void *)v30;

      if (!v12) {
        return v20;
      }
    }

    else
    {
      Method v31 = (const __CFSet *)NSKeyValueCachedSetters;
      if (!NSKeyValueCachedSetters)
      {
        __int128 v32 = *(_OWORD *)(MEMORY[0x189605258] + 16LL);
        *(_OWORD *)&callBacks.version = *MEMORY[0x189605258];
        *(_OWORD *)&callBacks.release = v32;
        callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
        callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
        Method v31 = CFSetCreateMutable(0LL, 0LL, &callBacks);
        NSKeyValueCachedSetters = (uint64_t)v31;
      }

      callBacks.version = 0LL;
      callBacks.retain = (CFSetRetainCallBack)a1;
      callBacks.release = (CFSetReleaseCallBack)a4;
      id v33 = a3;
      if (a4)
      {
        CFHashCode v34 = CFHash(a4);
        Method v31 = (const __CFSet *)NSKeyValueCachedSetters;
      }

      else
      {
        CFHashCode v34 = 0LL;
      }

      callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
      id v35 = (id)CFSetGetValue(v31, &callBacks);
      if (!v35)
      {
        id v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
        CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);
      }

      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]( [NSKeyValueIvarMutableCollectionGetter alloc],  "initWithContainerClassID:key:containerIsa:ivar:proxyClass:",  v33,  a4,  a1,  [v35 ivar],  objc_opt_self());
      }
      else {
        v36 = -[NSKeyValueSlowMutableCollectionGetter initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:]( objc_alloc(&OBJC_CLASS___NSKeyValueSlowMutableCollectionGetter),  "initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:",  v33,  a4,  v21,  v35,  a1,  objc_opt_self());
      }
      Ivar v20 = v36;
      if (!v12) {
        return v20;
      }
    }

    free(v14);
    return v20;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  return +[NSObject _createOtherValueGetterWithContainerClassID:key:](v39, v40, v41, v42);
}

+ (id)_createOtherValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  return -[NSKeyValueUndefinedGetter initWithContainerClassID:key:containerIsa:]( objc_alloc(&OBJC_CLASS___NSKeyValueUndefinedGetter),  "initWithContainerClassID:key:containerIsa:",  a3,  a4,  a1);
}

+ (id)_createOtherValueSetterWithContainerClassID:(id)a3 key:(id)a4
{
  return -[NSKeyValueUndefinedSetter initWithContainerClassID:key:containerIsa:]( objc_alloc(&OBJC_CLASS___NSKeyValueUndefinedSetter),  "initWithContainerClassID:key:containerIsa:",  a3,  a4,  a1);
}

+ (id)_createValuePrimitiveGetterWithContainerClassID:(id)a3 key:(id)a4
{
  v21[3] = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    *(void *)&double v9 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    CFHashCode v10 = v21;
  }

  else
  {
    CFHashCode v10 = malloc(v7 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1LL;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0LL;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_36;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    _BYTE *v10 = v14;
  }

  if (v8)
  {
    unint64_t v15 = (char *)malloc(v8);
  }

  else
  {
    MEMORY[0x1895F8858](v14);
    unint64_t v15 = (char *)v21;
  }

  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_36:
    }
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }

  Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "getPrimitive%s", v10);
  if (v16 || (Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "primitive%s", v10)) != 0LL)
  {
    __int128 v17 = -[NSKeyValueMethodGetter initWithContainerClassID:key:method:]( objc_alloc(&OBJC_CLASS___NSKeyValueMethodGetter),  "initWithContainerClassID:key:method:",  a3,  a4,  v16);
    goto LABEL_25;
  }

  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v20
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0LL
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0LL
      || (Ivar v20 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0LL)
    {
      __int128 v17 = -[NSKeyValueIvarGetter initWithContainerClassID:key:containerIsa:ivar:]( objc_alloc(&OBJC_CLASS___NSKeyValueIvarGetter),  "initWithContainerClassID:key:containerIsa:ivar:",  a3,  a4,  a1,  v20);
LABEL_25:
      CFHashCode v18 = v17;
      if (v17) {
        goto LABEL_27;
      }
    }
  }

  CFHashCode v18 = (NSKeyValueMethodGetter *)[a1 _createOtherValueGetterWithContainerClassID:a3 key:a4];
LABEL_27:
  if (v8)
  {
    free(v10);
    free(v15);
  }

  return v18;
}

+ (id)_createValuePrimitiveSetterWithContainerClassID:(id)a3 key:(id)a4
{
  v21[3] = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a4 lengthOfBytesUsingEncoding:4];
  size_t v8 = v7 + 1;
  if (v7 == -1)
  {
    *(void *)&double v9 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    CFHashCode v10 = v21;
  }

  else
  {
    CFHashCode v10 = malloc(v7 + 1);
  }

  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1) {
    unint64_t v11 = 1LL;
  }
  else {
    unint64_t v11 = v8;
  }
  BOOL v12 = v11 < 2 || v10 == 0LL;
  char v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1)) {
    goto LABEL_35;
  }
  uint64_t v14 = [a4 length];
  if (v14)
  {
    uint64_t v14 = __toupper((char)*v10);
    _BYTE *v10 = v14;
  }

  if (v8)
  {
    unint64_t v15 = (char *)malloc(v8);
  }

  else
  {
    MEMORY[0x1895F8858](v14);
    unint64_t v15 = (char *)v21;
  }

  [a4 getCString:v15 maxLength:v8 encoding:4];
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1)) {
LABEL_35:
    }
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
  }

  Method v16 = NSKeyValueMethodForPattern((objc_class *)a1, "setPrimitive%s:", v10);
  if (v16)
  {
    __int128 v17 = -[NSKeyValueMethodSetter initWithContainerClassID:key:method:]( objc_alloc(&OBJC_CLASS___NSKeyValueMethodSetter),  "initWithContainerClassID:key:method:",  a3,  a4,  v16);
    goto LABEL_30;
  }

  if ([a1 accessInstanceVariablesDirectly])
  {
    Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v18
      || (Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0LL
      || (Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0LL
      || (Ivar v18 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0LL)
    {
      __int128 v17 = -[NSKeyValueIvarSetter initWithContainerClassID:key:containerIsa:ivar:]( objc_alloc(&OBJC_CLASS___NSKeyValueIvarSetter),  "initWithContainerClassID:key:containerIsa:ivar:",  a3,  a4,  a1,  v18);
LABEL_30:
      id v19 = v17;
      if (v17) {
        goto LABEL_32;
      }
    }
  }

  id v19 = (NSKeyValueMethodSetter *)[a1 _createOtherValueSetterWithContainerClassID:a3 key:a4];
LABEL_32:
  if (v8)
  {
    free(v10);
    free(v15);
  }

  return v19;
}

- (BOOL)_isKVOA
{
  return 0;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  unsigned __int8 v6 = atomic_load(_NSKVO51127338RequiresSilencingExceptions);
  if ((v6 & 1) != 0)
  {
    NSLog( (NSString *)@"%@: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.\nKey path: %@\nObserved object: %@\nChange: %@\nContext: %p",  a2,  self,  keyPath,  object,  change,  context);
  }

  else
  {
    uint64_t v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.\nKey path: %@\nObserved object: %@\nChange: %@\nContext: %p",  self,  keyPath,  object,  change,  context);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v7 userInfo:0]);
    -[NSObject _addObserver:forProperty:options:context:](v8, v9, v10, v11, v12, v13);
  }

- (void)_addObserver:(id)a3 forProperty:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  v23[1] = *(id *)MEMORY[0x1895F89C0];
  if ((a5 & 4) != 0)
  {
    v23[0] = 0LL;
    uint64_t v11 = [a4 keyPath];
    os_unfair_recursive_lock_unlock();
    if ((a5 & 1) != 0)
    {
      id v12 = -[NSObject valueForKeyPath:](self, "valueForKeyPath:", v11);
      if (!v12) {
        id v12 = (id)[MEMORY[0x189603FE8] null];
      }
    }

    else
    {
      id v12 = 0LL;
    }

    v22[0] = 1LL;
    v22[1] = 0LL;
    v22[3] = 0LL;
    void v22[4] = 0LL;
    v22[2] = v12;
    NSKeyValueNotifyObserver(a3, v11, (uint64_t)self, (uint64_t)a6, 0LL, 0LL, v22, (uint64_t *)v23);

    os_unfair_recursive_lock_lock_with_options();
  }

  char v13 = (NSKeyValueObservationInfo *)_NSKeyValueRetainedObservationInfoForObject(self, *((void *)a4 + 1));
  if ((a5 & 0x100) != 0 && (uint64_t v14 = _CFGetTSD()) != 0) {
    unint64_t v15 = *(NSObject **)(v14 + 16);
  }
  else {
    unint64_t v15 = 0LL;
  }
  +[_NSKVODeallocSentinel _havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:]( &OBJC_CLASS____NSKVODeallocSentinel,  "_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:",  self);
  Method v16 = _NSKeyValueObservationInfoCreateByAdding(v13, a3, (NSKeyValueProperty *)a4, a5, a6, v15, &v21, v23);
  _NSKeyValueReplaceObservationInfoForObject(self, *((void *)a4 + 1), v13, v16);
  [a4 object:self didAddObservance:v23[0] recurse:1];
  if (((unint64_t)self & 0x8000000000000000LL) == 0)
  {
    Class Class = object_getClass(self);
    Ivar v18 = (objc_class *)[a4 isaForAutonotifying];
    if (!v18 || Class == v18)
    {
      if (!_NSKVOUsesBaseClassObservationInfoImplementationForClass(Class))
      {
        uint64_t v19 = _NSKeyValueContainerClassForIsa(Class);
        Ivar v20 = (objc_class *)_NSKeyValueContainerClassGetNotifyingInfo(v19)[1];
        if (v20)
        {
          if (v20 != Class) {
            object_setClass(self, v20);
          }
        }
      }
    }

    else
    {
      object_setClass(self, v18);
      objc_setAssociatedObject( self,  &_NSKeyValueObservingObservationInfoOverriderMayThrowOnDealloc,  MEMORY[0x189604A88],  (void *)1);
    }
  }

  if (v13) {
}
  }

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
  uint64_t v11 = (os_unfair_lock_s *)_NSKeyValueDebugger();
  -[_NSKeyValueDebugging object:willAddObserver:forKeyPath:context:](v11, self, observer, keyPath, (uint64_t)context);
  os_unfair_recursive_lock_lock_with_options();
  Class Class = object_getClass(self);
  -[NSObject _addObserver:forProperty:options:context:]( self,  "_addObserver:forProperty:options:context:",  observer,  NSKeyValuePropertyForIsaAndKeyPath(Class, keyPath),  options,  context);
  os_unfair_recursive_lock_unlock();
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context
{
  SEL v9 = (os_unfair_lock_s *)_NSKeyValueDebugger();
  -[_NSKeyValueDebugging object:willRemoveObserver:forKeyPath:context:]( v9,  (uint64_t)self,  observer,  (uint64_t)keyPath,  (uint64_t)context);
  uint64_t v10 = _CFGetTSD();
  if (!v10)
  {
    uint64_t v11 = malloc_default_zone();
    uint64_t v10 = (uint64_t)malloc_zone_calloc(v11, 1uLL, 0x58uLL);
    _CFSetTSD();
  }

  uint64_t v12 = *(void *)(v10 + 32);
  uint64_t v13 = *(void *)(v10 + 40);
  uint64_t v15 = *(void *)(v10 + 48);
  uint64_t v14 = *(void *)(v10 + 56);
  uint64_t v16 = *(void *)(v10 + 64);
  char v17 = *(_BYTE *)(v10 + 72);
  *(void *)(v10 + 32) = self;
  *(void *)(v10 + 40) = observer;
  *(void *)(v10 + 48) = keyPath;
  *(void *)(v10 + 56) = 0LL;
  *(void *)(v10 + 64) = context;
  *(_BYTE *)(v10 + 72) = 1;
  -[NSObject removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", observer, keyPath);
  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v13;
  *(void *)(v10 + 48) = v15;
  *(void *)(v10 + 56) = v14;
  *(void *)(v10 + 64) = v16;
  *(_BYTE *)(v10 + 72) = v17;
}

- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key
{
  v5[2] = *MEMORY[0x1895F89C0];
  v5[0] = changeKind;
  v5[1] = indexes;
  NSKeyValueWillChangeWithPerThreadPendingNotifications( self,  (uint64_t)key,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeByOrderedToManyMutation,  (uint64_t)v5,  0LL);
}

- (void)didChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications( self,  (uint64_t)key,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeByOrderedToManyMutation,  0LL);
}

- (void)willChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
  v5[2] = *MEMORY[0x1895F89C0];
  v5[0] = mutationKind;
  v5[1] = objects;
  NSKeyValueWillChangeWithPerThreadPendingNotifications( self,  (uint64_t)key,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetMutation,  (uint64_t)v5,  0LL);
}

- (void)didChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications( self,  (uint64_t)key,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetMutation,  0LL);
}

+ (id)_keysForValuesAffectingValueForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock_with_options();
  v4 = (const __CFDictionary *)qword_18C496700;
  if (qword_18C496700
    && (uint64_t v5 = (const void *)objc_opt_class(), (v6 = (const __CFDictionary *)CFDictionaryGetValue(v4, v5)) != 0LL))
  {
    id Value = (void *)CFDictionaryGetValue(v6, a3);
  }

  else
  {
    id Value = 0LL;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_103);
  size_t v8 = (void *)[MEMORY[0x189603FE0] set];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v9 = [Value countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(Value);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v13 rangeOfString:@"."];
        if (!v14) {
          [v8 addObject:v13];
        }
      }

      uint64_t v10 = [Value countByEnumeratingWithState:&v17 objects:v16 count:16];
    }

    while (v10);
  }

  return v8;
}

+ (NSSet)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
  v6[5] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke;
  v6[3] = &unk_189C9E568;
  v6[4] = a1;
  if (_class_isSwift() && (objc_opt_respondsToSelector() & 1) != 0) {
    return (NSSet *)objc_msgSend( a1,  "__NS_swiftOverlay_keyPathsForValuesAffectingValueForKey:foundationImplementation:",  key,  v6);
  }
  else {
    return (NSSet *)__84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke( (uint64_t)v6,  key);
  }
}

BOOL __84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke( uint64_t a1,  void *a2)
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a2 lengthOfBytesUsingEncoding:4];
  unint64_t v5 = v4 + 1;
  if (v4 == -1)
  {
    *(void *)&double v6 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v7 = (char *)&v22;
  }

  else
  {
    uint64_t v7 = (char *)malloc(v4 + 1);
  }

  objc_msgSend(a2, "getCString:maxLength:encoding:", v7, v5, 4, v6);
  if (v5 <= 1) {
    unint64_t v8 = 1LL;
  }
  else {
    unint64_t v8 = v5;
  }
  BOOL v9 = v8 < 2 || v7 == 0LL;
  if (!v9 && memchr(v7, 0, v8 - 1))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
    return +[NSObject automaticallyNotifiesObserversForKey:](v19, v20, v21);
  }

  else
  {
    if ([a2 length]) {
      *uint64_t v7 = __toupper(*v7);
    }
    size_t v10 = strlen(v7);
    MEMORY[0x1895F8858](v10);
    uint64_t v12 = (char *)v23 - ((v11 + 44) & 0xFFFFFFFFFFFFFFF0LL);
    snprintf(v12, v13, "keyPathsForValuesAffecting%s", v7);
    uint64_t v14 = NSResolvedSelectorForName(*(objc_class **)(a1 + 32), v12);
    if (v14 && (ClassMethod = class_getClassMethod(*(Class *)(a1 + 32), v14)) != 0LL) {
      id v16 = method_invoke(*(id *)(a1 + 32), ClassMethod);
    }
    else {
      id v16 = (id)[*(id *)(a1 + 32) _keysForValuesAffectingValueForKey:a2];
    }
    id v17 = v16;
    if (v5) {
      free(v7);
    }
    return (BOOL)v17;
  }

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
  v6[5] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke;
  v6[3] = &unk_189C9E590;
  v6[4] = a1;
  __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke((uint64_t)v6, key);
  return result;
}

void __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke( uint64_t a1,  void *a2)
{
  v20[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a2 lengthOfBytesUsingEncoding:4];
  unint64_t v5 = v4 + 1;
  if (v4 == -1)
  {
    *(void *)&double v6 = MEMORY[0x1895F8858](-1LL).n128_u64[0];
    uint64_t v7 = &v19;
  }

  else
  {
    uint64_t v7 = (uint64_t *)malloc(v4 + 1);
  }

  objc_msgSend(a2, "getCString:maxLength:encoding:", v7, v5, 4, v6);
  if (v5 <= 1) {
    unint64_t v8 = 1LL;
  }
  else {
    unint64_t v8 = v5;
  }
  BOOL v9 = v8 < 2 || v7 == 0LL;
  if (!v9 && memchr(v7, 0, v8 - 1))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Attempted to use a key or key path whose UTF-8 representation contains a NUL character" userInfo:0]);
    +[NSObject setKeys:triggerChangeNotificationsForDependentKey:](v15, v16, v17, v18);
    return;
  }

  if ([a2 length]) {
    *(_BYTE *)uint64_t v7 = __toupper(*(char *)v7);
  }
  size_t v10 = strlen((const char *)v7);
  size_t v11 = v10 + 35;
  if (v10 + 35 < 0x101)
  {
    if (v10 == -35LL)
    {
      uint64_t v12 = 0LL;
    }

    else
    {
      MEMORY[0x1895F8858](v10);
      uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    }
  }

  else
  {
    uint64_t v12 = (char *)malloc(v10 + 35);
  }

  snprintf(v12, v11, "automaticallyNotifiesObserversOf%s", (const char *)v7);
  size_t v13 = NSResolvedSelectorForName(*(objc_class **)(a1 + 32), v12);
  if (!v13 || (ClassMethod = class_getClassMethod(*(Class *)(a1 + 32), v13)) == 0LL)
  {
    if (!v5) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  method_invoke(*(id *)(a1 + 32), ClassMethod);
  if (v5) {
LABEL_24:
  }
    free(v7);
LABEL_25:
  if (v11 >= 0x101) {
    free(v12);
  }
}

+ (void)setKeys:(NSArray *)keys triggerChangeNotificationsForDependentKey:(NSString *)dependentKey
{
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithArray:keys];
  Mutable = (const __CFDictionary *)qword_18C496700;
  if (!qword_18C496700)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, MEMORY[0x189605250]);
    qword_18C496700 = (uint64_t)Mutable;
  }

  id Value = (void *)CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    id Value = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_18C496700, a1, Value);
  }

  CFDictionarySetValue((CFMutableDictionaryRef)Value, dependentKey, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_103);
}

+ (BOOL)_shouldAddObservationForwardersForKey:(id)a3
{
  return 1;
}

- (void)_notifyObserversForKeyPath:(id)a3 change:(id)a4
{
  v44[1] = *MEMORY[0x1895F89C0];
  v38 = self;
  double v6 = (id *)_NSKeyValueRetainedObservationInfoForObject(self, 0LL);
  if (v6)
  {
    uint64_t v7 = v6;
    v44[0] = 0LL;
    uint64_t v8 = [v6[1] count];
    MEMORY[0x1895F8858](v8);
    size_t v10 = (id **)((char *)&v35 - v9);
    _NSKeyValueObservationInfoGetObservances((uint64_t)v7, (uint64_t)&v35 - v9, v8);
    if (v8)
    {
      uint64_t v35 = (uint64_t)&v35;
      v36 = v7;
      v37 = v41;
      id v39 = a4;
      while (1)
      {
        size_t v11 = *v10;
        uint64_t v12 = -[NSKeyValueObservance retainedObserver](*v10);
        if (v12) {
          break;
        }
LABEL_29:
        ++v10;
        if (!--v8)
        {
          CFHashCode v34 = (void *)v44[0];
          uint64_t v7 = v36;
          goto LABEL_32;
        }
      }

      size_t v13 = v12;
      uint64_t v14 = (void *)objc_msgSend(v11[2], "restOfKeyPathIfContainedByValueForKeyPath:", a3, v35);
      if (v14)
      {
        id v15 = v14;
        id v16 = a3;
        uint64_t v17 = [v14 length];
        uint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kind"), "integerValue");
        if (((_BYTE)v11[5] & 2) != 0)
        {
          Method v24 = (void *)[a4 objectForKey:@"old"];
          uint64_t v19 = (uint64_t)v24;
          if (v17) {
            uint64_t v19 = [v24 valueForKeyPath:v15];
          }
          if (!v19) {
            uint64_t v19 = [MEMORY[0x189603FE8] null];
          }
        }

        else
        {
          uint64_t v19 = 0LL;
        }

        if (((_BYTE)v11[5] & 1) != 0)
        {
          uint64_t v26 = (void *)[a4 objectForKey:@"new"];
          uint64_t v25 = (uint64_t)v26;
          if (v17) {
            uint64_t v25 = [v26 valueForKeyPath:v15];
          }
          if (!v25) {
            uint64_t v25 = [MEMORY[0x189603FE8] null];
          }
        }

        else
        {
          uint64_t v25 = 0LL;
        }

        uint64_t v27 = [v39 objectForKey:@"indexes"];
        uint64_t v28 = [v11[2] keyPath];
        uint64_t v29 = (uint64_t)v11[3];
        if (((_BYTE)v11[5] & 0x20) != 0) {
          uint64_t v30 = (uint64_t)v11[4];
        }
        else {
          uint64_t v30 = 0LL;
        }
        uint64_t v40 = v18;
        v41[0] = v19;
        v41[1] = v25;
        uint64_t v42 = v27;
        uint64_t v43 = 0LL;
        NSKeyValueNotifyObserver(v13, v28, (uint64_t)v38, v29, v30, 0LL, &v40, v44);
        a3 = v16;
      }

      else
      {
        if (![v11[2] matchesWithoutOperatorComponentsKeyPath:a3])
        {
LABEL_28:

          goto LABEL_29;
        }

        uint64_t v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kind"), "integerValue");
        uint64_t v21 = [a4 objectForKey:@"indexes"];
        uint64_t v22 = [v11[2] keyPath];
        if (((_BYTE)v11[5] & 0x20) != 0) {
          uint64_t v23 = (uint64_t)v11[4];
        }
        else {
          uint64_t v23 = 0LL;
        }
        uint64_t v31 = (uint64_t)v11[3];
        id v33 = v37;
        __int128 v32 = v38;
        void *v37 = 0LL;
        v33[1] = 0LL;
        uint64_t v40 = v20;
        uint64_t v42 = v21;
        uint64_t v43 = 0LL;
        NSKeyValueNotifyObserver(v13, v22, (uint64_t)v32, v31, v23, 0LL, &v40, v44);
      }

      a4 = v39;
      goto LABEL_28;
    }

    CFHashCode v34 = 0LL;
LABEL_32:
  }

- (void)_willChangeValuesForKeys:(id)a3
{
  NSKeyValueWillChangeWithPerThreadPendingNotifications( self,  (uint64_t)a3,  1,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting,  0LL,  0LL);
}

- (void)_didChangeValuesForKeys:(id)a3
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications( self,  (uint64_t)a3,  1,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting,  0LL);
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  id v5 = a3;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a3 count];
  uint64_t v8 = [a4 count];
  unint64_t v9 = v8 + v7;
  if ((unint64_t)(v8 + v7) >> 60)
  {
    CFStringRef v20 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8 + v7);
    uint64_t v21 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v20 userInfo:0];
    CFRelease(v20);
    objc_exception_throw(v21);
  }

  if (v9 <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v8 + v7;
  }
  MEMORY[0x1895F8858](v10);
  uint64_t v12 = (char *)&v22 - v11;
  uint64_t v23 = self;
  if (v9 >= 0x101)
  {
    uint64_t v12 = (char *)_CFCreateArrayStorage();
    Method v24 = v12;
  }

  else
  {
    Method v24 = 0LL;
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v13 = 0LL;
  uint64_t v14 = [a4 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(a4);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        if (![v5 objectForKey:v17]) {
          *(void *)&v12[8 * v13++] = v17;
        }
      }

      uint64_t v14 = [a4 countByEnumeratingWithState:&v36 objects:v35 count:16];
    }

    while (v14);
  }

  uint64_t v31 = 0LL;
  __int128 v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  uint64_t v34 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  v26[3] = v9;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __98__NSObject_NSKeyValueObservingPrivate___notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v25[3] = &unk_189C9E5B8;
  v25[8] = v12;
  v25[9] = v13;
  v25[4] = a4;
  v25[5] = &v31;
  v25[6] = v26;
  v25[7] = &v27;
  [v5 enumerateKeysAndObjectsUsingBlock:v25];
  uint64_t v18 = v28[3];
  unint64_t v19 = v32[3] + v13;
  if (v9 < v18 + v19) {
    __assert_rtn( "-[NSObject(NSKeyValueObservingPrivate) _notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:]",  "NSKeyValueObserving.m",  2610,  "changedKeyCount + removedKeyCount + addedKeyCount <= countSum");
  }
  if (v19 + v18)
  {
    if (!v18)
    {
      if (v5)
      {
        if (a4)
        {
LABEL_29:
          -[NSObject _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( v23,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  v12,  v19,  v5,  a4,  0LL);
          goto LABEL_30;
        }
      }

      else
      {
        id v5 = (id)[MEMORY[0x189603F68] dictionary];
        if (a4) {
          goto LABEL_29;
        }
      }

      a4 = (id)[MEMORY[0x189603F68] dictionary];
      goto LABEL_29;
    }

    bzero(&v12[8 * v19], 8 * (v9 - (v18 + v19)));
    if (v5)
    {
      if (!a4) {
        goto LABEL_27;
      }
    }

    else
    {
      id v5 = (id)[MEMORY[0x189603F68] dictionary];
      if (!a4) {
LABEL_27:
      }
        a4 = (id)[MEMORY[0x189603F68] dictionary];
    }

    unint64_t v19 = v9;
    goto LABEL_29;
  }

uint64_t __98__NSObject_NSKeyValueObservingPrivate___notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t result = [*(id *)(a1 + 32) objectForKey:a2];
  if (!result)
  {
    --*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    *(void *)(*(void *)(a1 + 64) + 8LL * *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) = a2;
    uint64_t v7 = *(void *)(a1 + 56);
    goto LABEL_6;
  }

  if ((void *)result != a3)
  {
    uint64_t result = [a3 isEqual:result];
    if ((result & 1) == 0)
    {
      *(void *)(*(void *)(a1 + 64)
                + 8LL * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + *(void *)(a1 + 72))) = a2;
      uint64_t v7 = *(void *)(a1 + 40);
LABEL_6:
      ++*(void *)(*(void *)(v7 + 8) + 24LL);
    }
  }

  return result;
}

- (void)_changeValueForKeys:(id *)a3 count:(unint64_t)a4 maybeOldValuesDict:(id)a5 maybeNewValuesDict:(id)a6 usingBlock:(id)a7
{
  id v39 = a5;
  __int128 v36 = a3;
  v48[160] = *MEMORY[0x1895F89C0];
  bzero(v48, 0x500uLL);
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v11 = (uint64_t)_NSKeyValueRetainedObservationInfoForObject(self, 0LL);
  uint64_t v40 = self;
  id v12 = -[NSObject _implicitObservationInfo](self, "_implicitObservationInfo");
  uint64_t v13 = (uint64_t)v12;
  if (v11)
  {
    id v12 = (id)[*(id *)(v11 + 8) count];
    uint64_t v14 = (uint64_t)v12;
    if (v13)
    {
LABEL_3:
      id v12 = (id)[*(id *)(v13 + 8) count];
      uint64_t v15 = (uint64_t)v12;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    if (v12) {
      goto LABEL_3;
    }
  }

  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v16 = v15 + v14;
  MEMORY[0x1895F8858](v12);
  uint64_t v18 = (uint64_t *)((char *)&v32 - v17);
  if (v11) {
    _NSKeyValueObservationInfoGetObservances(v11, (uint64_t)&v32 - v17, v14);
  }
  if (v13) {
    _NSKeyValueObservationInfoGetObservances(v13, (uint64_t)&v18[v14], v15);
  }
  uint64_t v37 = v13;
  uint64_t v38 = v15;
  if (v16)
  {
    unint64_t v19 = (id **)v18;
    uint64_t v20 = v16;
    do
    {
      if (-[NSKeyValueObservance retainedObserver](*v19))
      {
        uint64_t v21 = *v19;
        if (*v19)
        {
          if (((_BYTE)v21[5] & 0x20) != 0) {
            uint64_t v21 = (id *)v21[4];
          }
          else {
            uint64_t v21 = 0LL;
          }
        }
      }

      else
      {
        uint64_t v21 = 0LL;
        *unint64_t v19 = 0LL;
      }

      uint64_t v22 = v21;
      ++v19;
      --v20;
    }

    while (v20);
  }

  uint64_t v23 = v11 | v37;
  os_unfair_recursive_lock_unlock();
  Method v24 = v48;
  if (v23)
  {
    id v33 = a7;
    id v34 = a6;
    uint64_t v35 = (id *)v11;
    uint64_t v41 = 16LL;
    LOBYTE(v42) = 1;
    uint64_t v43 = v48;
    uint64_t v44 = 0LL;
    LOBYTE(v45) = 1;
    uint64_t v46 = 0LL;
    uint64_t v47 = 0LL;
    if (a4 && v35)
    {
      uint64_t v25 = (uint64_t *)v36;
      unint64_t v26 = a4;
      do
      {
        if (*v25) {
          NSKeyValueWillChange( (uint64_t)v40,  *v25,  0,  v18,  v14,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting,  (uint64_t)v39,  (void (*)(uint64_t, uint64_t, uint64_t, __int128 *, void, void, uint64_t))NSKeyValuePushPendingNotificationLocal,  (uint64_t)&v41,  0LL);
        }
        ++v25;
        --v26;
      }

      while (v26);
    }

    a7 = v33;
    if (v37)
    {
      LOBYTE(v45) = 0;
      if ((uint64_t)(a4 - 1) >= 0)
      {
        uint64_t v27 = &v18[v14];
        uint64_t v28 = v36 - 1;
        do
        {
          uint64_t v29 = (uint64_t)v28[a4];
          if (v29) {
            NSKeyValueWillChange( (uint64_t)v40,  v29,  0,  v27,  v38,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, void, void, uint64_t, char *))NSKeyValueWillChangeBySetting,  (uint64_t)v39,  (void (*)(uint64_t, uint64_t, uint64_t, __int128 *, void, void, uint64_t))NSKeyValuePushPendingNotificationLocal,  (uint64_t)&v41,  0LL);
          }
          --a4;
        }

        while ((uint64_t)a4 > 0);
      }
    }

    Method v24 = v43;
    uint64_t v23 = v44;
    a6 = v34;
    uint64_t v11 = (uint64_t)v35;
  }

  if (a7) {
    (*((void (**)(id))a7 + 2))(a7);
  }
  if (v23 >= 1)
  {
    uint64_t v41 = (uint64_t)v24;
    uint64_t v42 = v23;
    uint64_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    uint64_t v46 = v11;
    NSKeyValueDidChange( (uint64_t)v40,  0LL,  0,  (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting,  (uint64_t)a6,  (uint64_t (*)(uint64_t, uint64_t, uint64_t *, __int128 *, void *, CFTypeRef *, uint64_t))NSKeyValuePopPendingNotificationLocal,  (uint64_t)&v41);
  }

  for (; v16; --v16)
  {
    if (!*v18) {
      goto LABEL_43;
    }
    isClass Class = object_isClass((id)*v18);
    uint64_t v31 = *v18;
    if (!isClass)
    {

      uint64_t v31 = *v18;
    }

    if (!v31) {
      goto LABEL_45;
    }
    if ((*(_BYTE *)(v31 + 40) & 0x20) != 0) {
      uint64_t v31 = *(void *)(v31 + 32);
    }
    else {
LABEL_43:
    }
      uint64_t v31 = 0LL;
LABEL_45:

    ++v18;
  }

  if (v24 != v48) {
    free(v24);
  }
}

- (void)_changeValueForKey:(id)a3 key:(id)a4 key:(id)a5 usingBlock:(id)a6
{
  v6[3] = *MEMORY[0x1895F89C0];
  v6[0] = a3;
  v6[1] = a4;
  v6[2] = a5;
  -[NSObject _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  v6,  3LL,  0LL,  0LL,  a6);
}

- (void)_changeValueForKey:(id)a3 usingBlock:(id)a4
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  -[NSObject _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:]( self,  "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:",  v4,  1LL,  0LL,  0LL,  a4);
}

- (void)_setSharedObservationInfo:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock(&NSKeyValueObservationInfoLock);
    Mutable = (__CFDictionary *)NSKeyValueSharedObservationInfoPerObject;
    if (NSKeyValueSharedObservationInfoPerObject)
    {
      if (!a2)
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)NSKeyValueSharedObservationInfoPerObject, (const void *)~a1);
LABEL_8:
        os_unfair_lock_unlock(&NSKeyValueObservationInfoLock);
        return;
      }
    }

    else
    {
      if (!a2) {
        goto LABEL_8;
      }
      Mutable = CFDictionaryCreateMutable(0LL, 0LL, 0LL, MEMORY[0x189605250]);
      NSKeyValueSharedObservationInfoPerObject = (uint64_t)Mutable;
    }

    CFDictionarySetValue(Mutable, (const void *)~a1, a2);
    goto LABEL_8;
  }

- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver
{
  else {
    return -[NSObject replacementObjectForArchiver:](self, "replacementObjectForArchiver:", 0LL);
  }
}

+ (NSArray)classFallbacksForKeyedArchiver
{
  return (NSArray *)MEMORY[0x189604A58];
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

+ (BOOL)instancesImplementSelector:(SEL)a3
{
  if (a3) {
    return class_getMethodImplementation((Class)a1, a3) != (IMP)MEMORY[0x1896163C8];
  }
  _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return +[NSObject implementsSelector:](v4, v5, v6);
}

+ (BOOL)implementsSelector:(SEL)a3
{
  if (a3)
  {
    Class Class = object_getClass(a1);
    return class_getMethodImplementation(Class, a3) != (IMP)MEMORY[0x1896163C8];
  }

  else
  {
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
    return -[NSObject implementsSelector:](v6, v7, v8);
  }

- (BOOL)implementsSelector:(SEL)a3
{
  if (a3)
  {
    id v4 = (objc_class *)objc_opt_class();
    return class_getMethodImplementation(v4, a3) != (IMP)MEMORY[0x1896163C8];
  }

  else
  {
    _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
    +[NSObject setVersion:](v6, v7, v8);
  }

  return result;
}

+ (void)setVersion:(NSInteger)aVersion
{
}

+ (NSInteger)version
{
  return class_getVersion((Class)a1);
}

- (id)autoContentAccessingProxy
{
  return +[NSAutoContentAccessingProxy proxyWithTarget:]( &OBJC_CLASS___NSAutoContentAccessingProxy,  "proxyWithTarget:",  self);
}

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay
{
}

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray *)modes
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id obj = (id)[MEMORY[0x189604008] currentRunLoop];
  if (obj)
  {
    *(_OWORD *)&context.version = xmmword_189CA09A0;
    *(_OWORD *)&context.retain = unk_189CA09B0;
    context.copyDescription = 0LL;
    if (-[NSArray count](modes, "count"))
    {
      objc_sync_enter(obj);
      uint64_t v11 = malloc_default_zone();
      id v12 = malloc_zone_calloc(v11, 1uLL, 0x38uLL);
      context.info = v12;
      *id v12 = self;
      v12[1] = aSelector;
      v12[2] = anArgument;
      v12[3] = -[NSArray copyWithZone:](modes, "copyWithZone:", 0LL);
      v12[5] = obj;
      if (delay == 0.0) {
        v12[6] =  -[NSProcessInfo beginActivityWithOptions:reason:]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "beginActivityWithOptions:reason:",  0x400000000FFLL,  @"Delayed perform with delay 0");
      }
      double Current = CFAbsoluteTimeGetCurrent();
      double v14 = 0.0;
      if (delay >= 0.0) {
        double v14 = delay;
      }
      uint64_t v15 = CFRunLoopTimerCreate( 0LL,  v14 + Current,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)__NSFireDelayedPerform,  &context);
      v12[4] = v15;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      uint64_t v16 = modes;
      uint64_t v17 = -[NSArray countByEnumeratingWithState:objects:count:]( modes,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
      if (v17)
      {
        uint64_t v18 = *(void *)v28;
        unint64_t v19 = (__CFString *)*MEMORY[0x1896051B0];
        uint64_t v20 = (__CFString *)*MEMORY[0x189603B48];
        uint64_t v21 = (__CFString *)*MEMORY[0x1896051A8];
        do
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v23 = *(__CFString **)(*((void *)&v27 + 1) + 8 * i);
            CFRunLoopAddTimer((CFRunLoopRef)[obj getCFRunLoop], v15, v23);
          }

          uint64_t v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
        }

        while (v17);
      }

      CFArrayAppendValue((CFMutableArrayRef)[obj _dperf], v15);
      CFRelease(v15);
      objc_sync_exit(obj);
    }
  }

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  NSInteger v8 = (void *)[MEMORY[0x189604008] currentRunLoop];
  if (v8)
  {
    unint64_t v9 = v8;
    objc_sync_enter(v8);
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v9 _dperf]);
    if (Count)
    {
      uint64_t v11 = (const __CFString *)*MEMORY[0x189603B48];
      id v12 = (const __CFString *)*MEMORY[0x1896051A8];
      uint64_t v22 = aSelector;
      id v23 = anArgument;
      id v21 = aTarget;
      do
      {
        ValueAtIndex = (__CFRunLoopTimer *)CFArrayGetValueAtIndex( (CFArrayRef)objc_msgSend(v9, "_dperf", v21, v22, v23),  --Count);
        if (CFRunLoopTimerIsValid(ValueAtIndex))
        {
          context.version = 0LL;
          CFRunLoopTimerGetContext(ValueAtIndex, &context);
          if (*((SEL *)context.info + 1) == aSelector)
          {
            id v15 = (id)*((void *)context.info + 2);
            double v14 = (void *)*((void *)context.info + 3);
            uint64_t v25 = *((void *)context.info + 6);
            if ((*(id *)context.info == aTarget || [*(id *)context.info isEqual:aTarget])
              && (v15 == anArgument || [v15 isEqual:anArgument]))
            {
              CFRetain(ValueAtIndex);
              CFIndex v24 = Count;
              __int128 v30 = 0u;
              __int128 v31 = 0u;
              __int128 v28 = 0u;
              __int128 v29 = 0u;
              uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v27 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v29;
                do
                {
                  for (uint64_t i = 0LL; i != v16; ++i)
                  {
                    if (*(void *)v29 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    unint64_t v19 = *(const __CFString **)(*((void *)&v28 + 1) + 8 * i);
                    uint64_t v20 = v12;
                    if (v19 != v11)
                    {
                      if ([*(id *)(*((void *)&v28 + 1) + 8 * i) isEqual:@"kCFRunLoopCommonModes"]) {
                        uint64_t v20 = v12;
                      }
                      else {
                        uint64_t v20 = v19;
                      }
                    }

                    CFRunLoopRemoveTimer((CFRunLoopRef)[v9 getCFRunLoop], ValueAtIndex, v20);
                  }

                  uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v27 count:16];
                }

                while (v16);
              }

              aSelector = v22;
              anArgument = v23;
              aTarget = v21;
              CFIndex Count = v24;
              if (v25) {
                -[NSProcessInfo endActivity:]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "endActivity:",  v25);
              }
              CFRunLoopTimerInvalidate(ValueAtIndex);
              CFRelease(ValueAtIndex);
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)[v9 _dperf], v24);
            }
          }
        }
      }

      while (Count);
    }

    objc_sync_exit(v9);
  }

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array
{
  BOOL v8 = wait;
  uint64_t v51 = *MEMORY[0x1895F89C0];
  if ((performSelector_onThread_withObject_waitUntilDone_modes__sInvalidSystem & 1) == 0) {
    performSelector_onThread_withObject_waitUntilDone_modes__sInvalidSystem = 1;
  }
  NSUInteger v13 = -[NSArray count](array, "count");
  if (array && v13)
  {
    if (v8 && +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread") == thr)
    {
      uint64_t v32 = self;
      id v33 = arg;
      objc_msgSend(self, aSelector, arg);

      return;
    }

    double v14 = objc_alloc(&OBJC_CLASS____NSThreadPerformInfo);
    uint64_t v41 = a2;
    uint64_t v42 = self;
    if (v14)
    {
      v45.receiver = v14;
      v45.super_class = (Class)&OBJC_CLASS____NSThreadPerformInfo;
      id v15 = -[NSObject init](&v45, sel_init);
      if (isBlock(self)) {
        uint64_t v16 = -[NSObject copy](self, "copy");
      }
      else {
        uint64_t v16 = self;
      }
      v15[1].isa = (Class)v16;
      v15[2].isa = (Class)aSelector;
      uint64_t v43 = thr;
      if (isBlock(arg)) {
        uint64_t v17 = (objc_class *)[arg copy];
      }
      else {
        uint64_t v17 = (objc_class *)arg;
      }
      v15[3].isa = v17;
      LODWORD(v15[6].isa) = 0;
      id v18 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      uint64_t v19 = -[NSArray countByEnumeratingWithState:objects:count:]( array,  "countByEnumeratingWithState:objects:count:",  &v47,  v46,  16LL);
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v48;
        uint64_t v22 = (void *)*MEMORY[0x1896051B0];
        do
        {
          for (uint64_t i = 0LL; i != v20; ++i)
          {
            if (*(void *)v48 != v21) {
              objc_enumerationMutation(array);
            }
            CFIndex v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            else {
              uint64_t v25 = v24;
            }
            [v18 addObject:v25];
          }

          uint64_t v20 = -[NSArray countByEnumeratingWithState:objects:count:]( array,  "countByEnumeratingWithState:objects:count:",  &v47,  v46,  16LL);
        }

        while (v20);
      }

      v15[4].isa = (Class)[v18 copy];
      if (v8) {
        v15[5].isa = (Class)objc_alloc_init(&OBJC_CLASS___NSCondition);
      }

      thr = v43;
      if (v8) {
        goto LABEL_27;
      }
    }

    else
    {
      id v15 = 0LL;
      if (v8)
      {
LABEL_27:
        NSQualityOfService v26 = -[NSThread qualityOfService](thr, "qualityOfService");
        if (v26 == NSQualityOfServiceDefault) {
          uint64_t v27 = 25LL;
        }
        else {
          uint64_t v27 = v26;
        }
        NSQualityOfService v28 = -[NSThread qualityOfService]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "qualityOfService");
        if (v28 == NSQualityOfServiceDefault) {
          uint64_t v29 = 25LL;
        }
        else {
          uint64_t v29 = v28;
        }
        if (v29 <= v27) {
          __int128 v30 = 0LL;
        }
        else {
          __int128 v30 = -[NSThread _beginQoSOverride:relativePriority:](thr, "_beginQoSOverride:relativePriority:");
        }
        -[NSThread _nq:](thr, "_nq:", v15);
        int v31 = -[NSObject wait](v15, "wait");
        -[NSThread _endQoSOverride:](thr, "_endQoSOverride:", v30);

        if (v31 == 1)
        {
          id v34 = (void *)[MEMORY[0x189603F70] exceptionWithName:@"NSDestinationInvalidException", +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: target thread exited while waiting for the perform", _NSMethodExceptionProem((objc_class *)v42, v41)), 0 reason userInfo];
          objc_exception_throw(v34);
          -[NSObject performSelectorOnMainThread:withObject:waitUntilDone:modes:](v35, v36, v37, v38, v39, v40);
        }

        return;
      }
    }

    -[NSThread _nq:](thr, "_nq:", v15);
  }

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array
{
}

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait
{
  BOOL v5 = wait;
  id v9 = objc_allocWithZone(MEMORY[0x189603F18]);
  id v10 = (id)[v9 initWithObjects:MEMORY[0x1896051A8] count:1];
  -[NSObject performSelector:onThread:withObject:waitUntilDone:modes:]( self,  "performSelector:onThread:withObject:waitUntilDone:modes:",  aSelector,  +[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"),  arg,  v5,  v10);
}

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait
{
  BOOL v6 = wait;
  id v11 = objc_allocWithZone(MEMORY[0x189603F18]);
  id v12 = (id)[v11 initWithObjects:MEMORY[0x1896051A8] count:1];
  -[NSObject performSelector:onThread:withObject:waitUntilDone:modes:]( self,  "performSelector:onThread:withObject:waitUntilDone:modes:",  aSelector,  thr,  arg,  v6,  v12);
}

- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg
{
  id v4 = (id)[objc_allocWithZone((Class)NSThread) initWithTarget:self selector:aSelector object:arg];
  [v4 setQualityOfService:17];
  [v4 start];
}

- (id)replacementObjectForPortCoder:(NSPortCoder *)coder
{
  id result = -[NSObject replacementObjectForCoder:](self, "replacementObjectForCoder:");
  if (result) {
    return (id)-[NSPortCoder _proxyForLocalObject:](coder, "_proxyForLocalObject:", result);
  }
  return result;
}

@end