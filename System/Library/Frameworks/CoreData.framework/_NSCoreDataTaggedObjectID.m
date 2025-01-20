@interface _NSCoreDataTaggedObjectID
+ (BOOL)_usesTaggedPointers;
+ (Class)classWithStore:(id)a3 andEntity:(id)a4;
+ (void)initialize;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryID;
- (_NSCoreDataTaggedObjectID)initWithObject:(id)a3;
- (id)_retainedURIString;
- (id)_storeIdentifier;
- (id)_storeInfo1;
- (id)entity;
- (id)entityName;
- (id)persistentStore;
- (int64_t)_referenceData64;
- (unint64_t)retainCount;
@end

@implementation _NSCoreDataTaggedObjectID

- (id)entity
{
  int v2 = *MEMORY[0x189616658];
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
}

- (int64_t)_referenceData64
{
  uint64_t v2 = *MEMORY[0x189616658];
  unint64_t v3 = v2 ^ (unint64_t)self;
  uint64_t v4 = 0x3FFFFFFFFFFLL;
  if ((~(_BYTE)v3 & 7) == 0) {
    uint64_t v4 = 0x3FFFFFFFFLL;
  }
  return v4 & (v3 >> 21);
}

- (BOOL)isTemporaryID
{
  int v2 = *MEMORY[0x189616658];
  return ((unint64_t)(v2 ^ self) >> 3) & 1;
}

- (id)persistentStore
{
  int v2 = *MEMORY[0x189616658];
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                            + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)));
}

- (id)_storeInfo1
{
  int v2 = *MEMORY[0x189616658];
  unint64_t v3 = (unint64_t *)(_PFTaggedPointersPool + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF));
  uint64_t v4 = (void *)atomic_load(v3);
  unint64_t v5 = atomic_load(v3 + 1);
  if (!v4 || v5 == 0) {
    return 0LL;
  }
  else {
    return (id)objc_msgSend(v4, "_storeInfoForEntityDescription:");
  }
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (void)initialize
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  Class = objc_getClass("_NSCoreDataTaggedObjectID");
  if (Class != (objc_class *)objc_opt_class())
  {
    uint64_t v6 = [NSString stringWithUTF8String:"Failure to initialize tagged pointers (classes don't match): %@:%p:%@:%p - %p\n%s\n%s"];
    NSStringFromClass(Class);
    class_getImageName((Class)a1);
    class_getImageName(Class);
    _NSCoreDataLog(17LL, v6, v7, v8, v9, v10, v11, v12, (uint64_t)a1);
    uint64_t v13 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413826;
      id v25 = a1;
      __int16 v26 = 2048;
      id v27 = a1;
      __int16 v28 = 2112;
      v29 = NSStringFromClass(Class);
      __int16 v30 = 2048;
      id v31 = Class;
      __int16 v32 = 2048;
      uint64_t v33 = _PFTaggedPointersPool;
      __int16 v34 = 2080;
      ImageName = class_getImageName((Class)a1);
      __int16 v36 = 2080;
      v37 = class_getImageName(Class);
      v14 = "CoreData: Failure to initialize tagged pointers (classes don't match): %@:%p:%@:%p - %p\n%s\n%s";
      v15 = (os_log_s *)v13;
LABEL_12:
      _os_log_fault_impl(&dword_186681000, v15, OS_LOG_TYPE_FAULT, v14, buf, 0x48u);
    }

- (_NSCoreDataTaggedObjectID)initWithObject:(id)a3
{
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (id)entityName
{
  int v2 = *MEMORY[0x189616658];
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
}

- (id)_storeIdentifier
{
  int v2 = *MEMORY[0x189616658];
  return (id)atomic_load((unint64_t *)(_PFTaggedPointersPool
}

- (BOOL)_isPersistentStoreAlive
{
  int v2 = *MEMORY[0x189616658];
  unint64_t v3 = (void *)atomic_load((unint64_t *)(_PFTaggedPointersPool
                                              + 32 * (((unint64_t)(v2 ^ self) >> 4) & 0x1FFFF)));
  return [v3 _isPersistentStoreAlive];
}

- (id)_retainedURIString
{
  unint64_t v3 = -[_NSCoreDataTaggedObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &stru_189EAC2E8;
  }
  uint64_t v5 = *MEMORY[0x189616658];
  unint64_t v6 = v5 ^ (unint64_t)self;
  unint64_t v7 = v6 >> 21;
  if ((v6 & 8) != 0) {
    return (id)[objc_alloc(NSString) initWithFormat:@"%@://%@/%@/t%@%d", @"x-coredata", v4, -[_NSCoreDataTaggedObjectID entityName](self, "entityName"), _PFCoreDataProcessInstanceUUID(), v7];
  }
  BOOL v8 = (~(_BYTE)v6 & 7) == 0LL;
  uint64_t v9 = 0x3FFFFFFFFFFLL;
  if (v8) {
    uint64_t v9 = 0x3FFFFFFFFLL;
  }
  return (id)[objc_alloc(NSString) initWithFormat:@"%@://%@/%@/p%qu", @"x-coredata", v4, -[_NSCoreDataTaggedObjectID entityName](self, "entityName"), v9 & v7, v11];
}

+ (Class)classWithStore:(id)a3 andEntity:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  if (!_PFTaggedPointersPool)
  {
    uint64_t v26 = [NSString stringWithUTF8String:"Fatal attempt to reserve a tagged pointer slot without a pool for '%@': %@"];
    uint64_t v27 = [a4 name];
    _NSCoreDataLog(17LL, v26, v28, v29, v30, v31, v32, v33, v27);
    __int16 v34 = (os_log_s *)__pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v35 = 138412546;
      *(void *)&v35[4] = [a4 name];
      *(_WORD *)&v35[12] = 2112;
      *(void *)&v35[14] = a3;
      _os_log_fault_impl( &dword_186681000,  v34,  OS_LOG_TYPE_FAULT,  "CoreData: Fatal attempt to reserve a tagged pointer slot without a pool for '%@': %@",  v35,  0x16u);
    }

    __break(1u);
  }

  uint64_t v6 = 0LL;
  while (atomic_load((unint64_t *)(_PFTaggedPointersPool + 32 * v6 + 16)))
  {
LABEL_9:
    if (++v6 == 0x20000) {
      goto LABEL_31;
    }
  }

  BOOL v8 = (unint64_t *)(_PFTaggedPointersPool + 32 * v6);
  do
  {
    if (__ldaxr(v8))
    {
      __clrex();
      goto LABEL_9;
    }
  }

  while (__stlxr((unint64_t)a3, v8));
  uint64_t v10 = (void *)[a3 identifier];
  uint64_t v11 = [a4 name];
  os_unfair_lock_lock_with_options();
  uint64_t v12 = (void *)[(id)qword_18C4AB958 member:v10];
  if (v12)
  {
    id v13 = v12;
  }

  else
  {
    id v13 = (id)[v10 copy];
    [(id)qword_18C4AB958 addObject:v13];
  }

  v14 = (void *)[(id)qword_18C4AB958 member:v11];
  if (v14)
  {
    id v15 = v14;
  }

  else
  {
    id v15 = (id)[objc_alloc(NSString) initWithString:v11];
    [(id)qword_18C4AB958 addObject:v15];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C4AB94C);
  uint64_t v16 = _PFTaggedPointersPool + 32LL * v6;
  atomic_store((unint64_t)a4, (unint64_t *)(v16 + 8));
  uint64_t v17 = (void *)atomic_load((unint64_t *)(v16 + 16));
  uint64_t v18 = (void *)atomic_load((unint64_t *)(_PFTaggedPointersPool + 32LL * v6 + 24));
  uint64_t v19 = _PFTaggedPointersPool;
  uint64_t v20 = (unint64_t *)(_PFTaggedPointersPool + 32LL * v6 + 16);
  while (1)
  {
    unint64_t v21 = __ldxr(v20);
  }

  __clrex();

  uint64_t v19 = _PFTaggedPointersPool;
LABEL_22:
  uint64_t v22 = (unint64_t *)(v19 + 32LL * v6 + 24);
  while (1)
  {
    unint64_t v23 = __ldxr(v22);
  }

  __clrex();

LABEL_27:
  __dmb(0xBu);
  if ((_DWORD)v6 == -1)
  {
LABEL_31:
    Class result = (Class)[(id)objc_opt_class() classWithStore:a3 andEntity:a4];
    goto LABEL_32;
  }

  v24 = (objc_class *)objc_opt_class();
  Class result = (Class)_PFAllocateObject(v24, 0LL);
  if (result)
  {
    *(void *)v35 = result;
    *(void *)&v35[8] = &OBJC_CLASS____NSCoreDataTaggedObjectIDFactory;
    Class result = (Class)objc_msgSendSuper2((objc_super *)v35, sel_init);
    if (result) {
      HIDWORD(result[1].isa) = v6;
    }
  }

+ (BOOL)_usesTaggedPointers
{
  return 1;
}

@end