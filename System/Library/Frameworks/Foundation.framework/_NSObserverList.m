@interface _NSObserverList
+ (void)_copyObserversOfObject:(int)a3 creatingIfAbsent:;
+ (void)destroyObserverListForObject:(uint64_t)a1;
- (NSObservation)addBlockSink:(uint64_t)a3 toObservableObject:(uint64_t)a4 forTag:;
- (_NSObserverList)init;
- (id)description;
- (void)_receiveBox:(id)a3;
- (void)addObserver:(void *)a3 toObservableObject:;
- (void)dealloc;
- (void)finishObserving;
- (void)removeObservation:(id)a3;
@end

@implementation _NSObserverList

+ (void)_copyObserversOfObject:(int)a3 creatingIfAbsent:
{
  v5 = (objc_class *)objc_opt_self();
  if (qword_18C4972D0 != -1) {
    dispatch_once(&qword_18C4972D0, &__block_literal_global_84);
  }
  uint64_t v6 = [a2 _observerStorageOfSize:qword_18C4972C0];
  if (v6)
  {
    v7 = (void *)v6;
    os_unfair_lock_lock_with_options();
    if (!*v7)
    {
      objc_constructInstance((Class)qword_18C4972C8, v7);
      v7[1] = a2;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
    return v7;
  }

  else
  {
    v9 = (void **)[a2 _observerStorage];
    os_unfair_lock_lock_with_options();
    if (v9)
    {
      v10 = *v9;
      if (!*v9 && a3)
      {
        v11 = objc_alloc_init(v5);
        *v9 = v11;
        v11[1] = a2;
        v10 = *v9;
      }

      id v12 = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
      return v12;
    }

    else
    {
      v13 = objc_getAssociatedObject(a2, "_NSObserverListInternalKey");
      if (!v13 && a3)
      {
        v13 = objc_alloc_init(v5);
        v13[1] = a2;
        objc_setAssociatedObject(a2, "_NSObserverListInternalKey", v13, (void *)0x301);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
      return v13;
    }
  }

+ (void)destroyObserverListForObject:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v3 = objc_opt_self();
  uint64_t v8 = MEMORY[0x1895F87A8];
  uint64_t v9 = 3221225472LL;
  v10 = __48___NSObserverList_destroyObserverListForObject___block_invoke;
  v11 = &unk_189C9A030;
  uint64_t v12 = v3;
  if (qword_18C4972E0 != -1) {
    dispatch_once(&qword_18C4972E0, &v8);
  }
  uint64_t v4 = objc_msgSend(a2, "_observerStorageOfSize:", qword_18C4972D8, v8, v9, v10, v11, v12, v13);
  if (v4)
  {
    v5 = (void *)v4;
    if (*(void **)(v4 + 8) == a2)
    {
      clearAllObservers(v4);
      objc_destructInstance(v5);
    }
  }

  else
  {
    uint64_t v6 = (void **)[a2 _observerStorage];
    if (!v6)
    {
      NSLog((NSString *)@"Using +destroyObserverListForObject: on an object without inline observer storage is invalid");
      abort();
    }

    v7 = *v6;
    if (v7) {
  }
    }

- (_NSObserverList)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSObserverList;
  result = -[_NSObserverList init](&v3, sel_init);
  if (result) {
    result->_observersLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSObservation)addBlockSink:(uint64_t)a3 toObservableObject:(uint64_t)a4 forTag:
{
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    v5 = -[NSObservation initWithObservable:blockSink:tag:]( objc_alloc(&OBJC_CLASS___NSObservation),  "initWithObservable:blockSink:tag:",  a3,  a2,  a4);
    addObserver(v4, v5);
    return v5;
  }

  return result;
}

- (void)addObserver:(void *)a3 toObservableObject:
{
  if (a1)
  {
    if ([a2 conformsToProtocol:&unk_18C65FFF0])
    {
      if ([a3 conformsToProtocol:&unk_18C65FF90])
      {
        uint64_t v6 = -[NSObservation initWithObservable:observer:]( objc_alloc(&OBJC_CLASS___NSObservation),  "initWithObservable:observer:",  a3,  a2);
        addObserver(a1, a2);
        v7 = v6;
        return;
      }

      uint64_t v8 = (void *)MEMORY[0x189603F70];
      uint64_t v9 = *MEMORY[0x189603A60];
      v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to add %@ as an observer of non-NSObservable object %@",  a2,  a3);
    }

    else
    {
      uint64_t v8 = (void *)MEMORY[0x189603F70];
      uint64_t v9 = *MEMORY[0x189603A60];
      v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempt to add non-NSObserver object %@ as an observer of %@",  a2,  a3);
    }

    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
    -[_NSObserverList finishObserving](v11, v12);
  }

- (void)finishObserving
{
  v8[1] = *MEMORY[0x1895F89C0];
  id owner = self->_owner;
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v8);
  MEMORY[0x1895F8858](StackObservedValueClassAndBoxSize);
  v7 = objc_constructInstance(v6, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v7[6] = 3;
  *((void *)v7 + 1) = 0LL;
  *((void *)v7 + 2) = owner;
  -[_NSObserverList _receiveBox:](self, "_receiveBox:", v7);
}

- (void)removeObservation:(id)a3
{
}

- (void)_receiveBox:(id)a3
{
  v5[6] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __31___NSObserverList__receiveBox___block_invoke;
  v5[3] = &unk_189CA5AB8;
  v5[4] = a3;
  v5[5] = self;
  withUnlockedObservers((uint64_t)self, (uint64_t)v5);
  if (*((_DWORD *)a3 + 6) == 3) {
    clearAllObservers((uint64_t)self);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  clearAllObservers((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSObserverList;
  -[_NSObserverList dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 0LL;
  Class v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  uint64_t v8 = __Block_byref_object_copy__32;
  uint64_t v9 = __Block_byref_object_dispose__32;
  uint64_t v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __30___NSObserverList_description__block_invoke;
  v4[3] = &unk_189CA5AE0;
  v4[4] = self;
  v4[5] = &v5;
  withUnlockedObservers((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void).cxx_destruct
{
}

@end