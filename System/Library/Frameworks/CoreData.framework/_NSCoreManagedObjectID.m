@interface _NSCoreManagedObjectID
+ (BOOL)_usesTaggedPointers;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)classWithStore:(id)a3 andEntity:(id)a4;
+ (char)generatedNameSuffix;
+ (id)_retain_1;
+ (id)_storeInfo1;
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)managedObjectIDFromURIRepresentation:(id)a3;
+ (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4;
+ (int64_t)version;
+ (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4;
+ (void)_setStoreInfo1:(id)a3;
+ (void)_storeDeallocated;
+ (void)initialize;
+ (void)setObjectStoreIdentifier:(id)a3;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryID;
- (_NSCoreManagedObjectID)retain;
- (id)URIRepresentation;
- (id)_storeIdentifier;
- (id)_storeInfo1;
- (id)entity;
- (id)entityName;
- (id)persistentStore;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation _NSCoreManagedObjectID

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (char)generatedNameSuffix
{
  return "abstract";
}

+ (void)initialize
{
  if (objc_getClass("_NSCoreManagedObjectID") == a1)
  {
    objc_opt_self();
    object_getIndexedIvars(a1);
    v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    qword_18C4AB960 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    qword_18C4AB968 = (uint64_t)CFArrayCreateMutable(v3, 0LL, 0LL);
    qword_18C4AB970 = (uint64_t)CFArrayCreateMutable(v3, 0LL, 0LL);
  }

+ (Class)classWithStore:(id)a3 andEntity:(id)a4
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  v7 = (_BYTE *)objc_msgSend((id)objc_msgSend(a4, "name"), "UTF8String");
  if (!v7 || !*v7)
  {
    v42 = (void *)MEMORY[0x189603F70];
    uint64_t v43 = *MEMORY[0x189603A60];
    v44 = @"Entity name must not be nil.";
    goto LABEL_48;
  }

  if (!a3)
  {
    v42 = (void *)MEMORY[0x189603F70];
    uint64_t v43 = *MEMORY[0x189603A60];
    v44 = @"Store must not be nil.";
LABEL_48:
    objc_exception_throw((id)[v42 exceptionWithName:v43 reason:v44 userInfo:0]);
  }

  v8 = (const char *)[a1 generatedNameSuffix];
  v9 = v8;
  int v10 = *(unsigned __int8 *)v8;
  if (v10 == 54) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = 2LL * (v10 == 105);
  }
  snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v8, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_67);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v12 = (void *)*((void *)&_MergedGlobals_67 + v11 + 3);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
LABEL_9:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v46 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(objc_class **)(*((void *)&v45 + 1) + 8 * v16);
      IndexedIvars = object_getIndexedIvars(v17);
      if (IndexedIvars)
      {
        id v19 = (id)IndexedIvars[1];
        if (!v19) {
          break;
        }
        if (v19 == a4 && IndexedIvars[2] == (void)a3) {
          break;
        }
      }

      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v14) {
          goto LABEL_9;
        }
        goto LABEL_25;
      }
    }

    if (!v17) {
      goto LABEL_25;
    }
LABEL_22:
    v21 = (unsigned int *)object_getIndexedIvars(v17);
    do
      unsigned int v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }

  else
  {
LABEL_25:
    int v23 = 1;
    while (1)
    {
      Class Class = objc_getClass(__str);
      if (!Class) {
        break;
      }
      v17 = Class;
      int v25 = v23;
LABEL_31:
      if (!*((void *)object_getIndexedIvars(v17) + 1)) {
        goto LABEL_22;
      }
      int v23 = v25 + 1;
      snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v9, v25);
    }

    while (1)
    {
      Class ClassPair = objc_allocateClassPair((Class)a1, __str, 0x40uLL);
      if (ClassPair) {
        break;
      }
      int v25 = v23 + 1;
      snprintf(__str, 0x100uLL, "_NSObjectID_%s_%x", v9, v23);
      Class v27 = objc_getClass(__str);
      ++v23;
      if (v27)
      {
        v17 = v27;
        goto LABEL_31;
      }
    }

    v17 = ClassPair;
    v28 = object_getClass(ClassPair);
    ClassMethod = class_getClassMethod(v17, sel__retain_1);
    Implementation = method_getImplementation(ClassMethod);
    TypeEncoding = method_getTypeEncoding(ClassMethod);
    class_addMethod(v28, sel_retain, Implementation, TypeEncoding);
    v32 = class_getClassMethod(v17, sel__release_1);
    v33 = method_getImplementation(v32);
    v34 = method_getTypeEncoding(v32);
    class_addMethod(v28, sel_release, v33, v34);
    objc_registerClassPair(v17);
    CFArrayAppendValue(*((CFMutableArrayRef *)&_MergedGlobals_67 + v11 + 3), v17);
  }

  v35 = object_getIndexedIvars(v17);
  if (!v35[1])
  {
    v36 = v35;
    *(_DWORD *)v35 = 0;
    v35[2] = a3;
    v35[5] = 0LL;
    v37 = (void *)objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    if (v37)
    {
      v38 = v37;
      v36[5] = CFRetain(v37);
    }

    v36[1] = a4;
    v36[6] = 0LL;
    v36[3] = 0LL;
    *((_DWORD *)v36 + 8) = objc_msgSend((id)objc_msgSend(a4, "name"), "hash") & 0x3F;
    if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      int v39 = 3;
    }

    else if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      int v39 = 2;
    }

    else
    {
      int v39 = 4;
    }

    *((_DWORD *)v36 + 1) = v39;
    if (a4) {
      int v40 = *((_DWORD *)a4 + 40);
    }
    else {
      int v40 = 0;
    }
    *((_DWORD *)v36 + 14) = v40;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_67);
  return v17;
}

+ (BOOL)_usesTaggedPointers
{
  return 0;
}

+ (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4
{
  unsigned int v5 = _PFAllocateObjects((objc_class *)a1, a3, a4, 0LL);
  IndexedIvars = (unsigned int *)object_getIndexedIvars(a1);
  do
    unsigned int v7 = __ldxr(IndexedIvars);
  while (__stxr(v7 + v5, IndexedIvars));
  return v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (int64_t)version
{
  return 134481920LL;
}

+ (id)_retain_1
{
  IndexedIvars = (unsigned int *)object_getIndexedIvars(a1);
  do
    unsigned int v4 = __ldxr(IndexedIvars);
  while (__stxr(v4 + 1, IndexedIvars));
  return a1;
}

+ (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  __endptr = 0LL;
  unint64_t v7 = strtouq(a3, &__endptr, 0);
  if (__endptr) {
    BOOL v8 = __endptr == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = (void *)[objc_alloc(NSString) initWithBytes:a3 length:a4 encoding:4];
    id v10 = (id)[objc_alloc((Class)a1) initWithObject:v9];
  }

  else
  {
    unint64_t v11 = v7;
    if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      v12 = (void *)[objc_alloc((Class)a1) initWithPK64:v11];
    }

    else
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:v11];
      uint64_t v14 = [objc_alloc((Class)a1) initWithObject:v13];

      v12 = (void *)v14;
    }

    return v12;
  }

  return v10;
}

+ (id)managedObjectIDFromURIRepresentation:(id)a3
{
  unsigned int v5 = (void *)MEMORY[0x186E3E5D8](a1, a2);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents"), "objectAtIndex:", 2);
  IndexedIvars = object_getIndexedIvars(a1);
  uint64_t v8 = IndexedIvars[2];
  char v9 = [v6 characterAtIndex:0];
  id v10 = (void *)[v6 substringFromIndex:1];
  if (v9 == 116)
  {
    unint64_t v11 = -[NSTemporaryObjectID initWithEntity:andUUIDString:]( objc_alloc(&OBJC_CLASS___NSTemporaryObjectID),  "initWithEntity:andUUIDString:",  IndexedIvars[1],  v10);
    -[NSTemporaryObjectID _setPersistentStore:](v11, "_setPersistentStore:", v8);
    if (v11) {
      goto LABEL_9;
    }
  }

  if (!+[_PFRoutines convertCString:toUnsignedInt64:withBase:]( (uint64_t)_PFRoutines,  (const char *)[v10 UTF8String],  &v16,  0))
  {
LABEL_8:
    unint64_t v11 = (NSTemporaryObjectID *)[objc_alloc((Class)a1) initWithObject:v10];
    goto LABEL_9;
  }

  if (![a1 isSubclassOfClass:objc_opt_class()])
  {
    id v13 = objc_alloc(MEMORY[0x189607968]);
    uint64_t v14 = (void *)[v13 initWithUnsignedLongLong:v16];
    unint64_t v11 = (NSTemporaryObjectID *)[objc_alloc((Class)a1) initWithObject:v14];

    if (v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  id v12 = objc_alloc((Class)a1);
  unint64_t v11 = (NSTemporaryObjectID *)[v12 initWithPK64:v16];
  if (!v11) {
    goto LABEL_8;
  }
LABEL_9:
  objc_autoreleasePoolPop(v5);
  return v11;
}

+ (void)setObjectStoreIdentifier:(id)a3
{
  IndexedIvars = object_getIndexedIvars(a1);
  id v5 = (id)IndexedIvars[5];
  if (v5 != a3)
  {
    if (v5) {
      CFRelease(v5);
    }
    v6 = (void *)CFRetain((CFTypeRef)[a3 copy]);
    IndexedIvars[5] = v6;
  }

+ (void)_setStoreInfo1:(id)a3
{
  *((void *)object_getIndexedIvars(a1) + 6) = a3;
}

+ (id)_storeInfo1
{
  id result = object_getIndexedIvars(a1);
  if (result) {
    return (id)*((void *)result + 6);
  }
  return result;
}

+ (void)_storeDeallocated
{
  IndexedIvars = object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    IndexedIvars[6] = 0LL;
    IndexedIvars[2] = 0LL;
    __dmb(0xBu);
  }

- (_NSCoreManagedObjectID)retain
{
  return (_NSCoreManagedObjectID *)_PFfastOidRetain((int)self, (unint64_t)self);
}

- (void)release
{
}

- (id)entity
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

- (id)entityName
{
  return (id)objc_msgSend(-[_NSCoreManagedObjectID entity](self, "entity"), "name");
}

- (id)persistentStore
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 2);
  }
  return result;
}

- (BOOL)isTemporaryID
{
  return 0;
}

- (id)_storeIdentifier
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result)
  {
    unsigned int v4 = (id *)result;
    id result = (id)*((void *)result + 5);
    if (!result)
    {
      objc_msgSend((id)objc_opt_class(), "setObjectStoreIdentifier:", objc_msgSend(v4[2], "identifier"));
      return v4[5];
    }
  }

  return result;
}

- (id)_storeInfo1
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 6);
  }
  return result;
}

- (BOOL)_isPersistentStoreAlive
{
  Class Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (IndexedIvars) {
    LOBYTE(IndexedIvars) = [IndexedIvars[2] _isPersistentStoreAlive];
  }
  return (char)IndexedIvars;
}

- (unint64_t)retainCount
{
  return SLODWORD(self[1].super.super.isa) + 1LL;
}

- (id)URIRepresentation
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x186E3E5D8](self, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
    {
      unsigned int v4 = -[_NSCoreManagedObjectID _storeIdentifier](self, "_storeIdentifier");
      if (v4) {
        id v5 = v4;
      }
      else {
        id v5 = &stru_189EAC2E8;
      }
      uint64_t v6 = -[__CFString length](v5, "length");
      qmemcpy(relativeURLBytes, "x-coredata://", 13);
      if (v6 && (uint64_t v7 = v6, -[__CFString getCharacters:range:](v5, "getCharacters:range:", v25, 0LL, v6), v7 >= 1))
      {
        for (uint64_t i = 0LL; i != v7; ++i)
          relativeURLBytes[i + 13] = v25[i];
        uint64_t v9 = i + 13;
      }

      else
      {
        uint64_t v9 = 13LL;
      }

      uint64_t v12 = v9 + 1;
      relativeURLBytes[v9] = 47;
      id v13 = -[_NSCoreManagedObjectID entityName](self, "entityName");
      uint64_t v14 = [v13 length];
      if (v14 && (uint64_t v15 = v14, objc_msgSend(v13, "getCharacters:range:", v25, 0, v14), v15 >= 1))
      {
        unint64_t v16 = (UInt8 *)v25;
        do
        {
          UInt8 v17 = *v16;
          v16 += 2;
          uint64_t v18 = v12 + 1;
          relativeURLBytes[v12++] = v17;
          --v15;
        }

        while (v15);
      }

      else
      {
        uint64_t v18 = v12;
      }

      *(_WORD *)&relativeURLBytes[v18] = 28719;
      int v19 = snprintf( (char *)&relativeURLBytes[v18 + 2],  1022 - v18,  "%qu",  -[NSManagedObjectID _referenceData64](self, "_referenceData64"));
      CFIndex v20 = v18 + 2 + (v19 & ~(v19 >> 31));
      relativeURLBytes[v20] = 0;
    }

    else
    {
      CFIndex v20 = 0LL;
    }

    CFURLRef v11 = CFURLCreateAbsoluteURLWithBytes(0LL, relativeURLBytes, v20, 0x8000100u, 0LL, 1u);
    v21 = v11;
    CFRelease(v11);
  }

  else
  {
    id v10 = -[NSManagedObjectID _retainedURIString](self, "_retainedURIString");
    CFURLRef v11 = (CFURLRef)[MEMORY[0x189604030] URLWithString:v10];
  }

  unsigned int v22 = v11;
  objc_autoreleasePoolPop(v3);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  return a3 && _PFObjectIDFastEquals64((unint64_t)self, (unint64_t)a3) != 0;
}

@end