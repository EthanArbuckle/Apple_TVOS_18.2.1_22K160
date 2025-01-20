@interface NSTemporaryObjectID
+ (BOOL)_usesTaggedPointers;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (Class)classForStore:(id)a3;
+ (id)_retain_1;
+ (id)initWithEntity:(id)a3;
+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4;
+ (int64_t)version;
+ (unsigned)allocateBatch:(id *)a3 forEntity:(id)a4 count:(unsigned int)a5;
+ (void)_storeDeallocated;
+ (void)initialize;
+ (void)setObjectStoreIdentifier:(id)a3;
- (BOOL)_isPersistentStoreAlive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporaryID;
- (NSTemporaryObjectID)initWithEntity:(id)a3;
- (NSTemporaryObjectID)initWithEntity:(id)a3 andUUIDString:(id)a4;
- (NSTemporaryObjectID)retain;
- (id)URIRepresentation;
- (id)_referenceData;
- (id)_retainedURIString;
- (id)_storeIdentifier;
- (id)entity;
- (id)persistentStore;
- (int)_temporaryIDCounter;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (void)_setPersistentStore:(id)a3;
- (void)dealloc;
- (void)release;
@end

@implementation NSTemporaryObjectID

+ (void)initialize
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (objc_getClass("NSTemporaryObjectID") == a1)
  {
    objc_opt_self();
    uuid_generate_random(out);
    qword_18C4ABC88 = (uint64_t)-[_NS128bitWrapper initWithBytes:]( (char *)objc_alloc(&OBJC_CLASS____NS128bitWrapper),  out);
    _CoreDataProcessInstanceTempIDCounter = 1;
    object_getIndexedIvars(a1);
    qword_18C4ABC90 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    _NSTemporaryObjectID_Default_Class = (uint64_t)objc_allocateClassPair( (Class)a1,  "NSTemporaryObjectID_default",  0x18uLL);
    objc_registerClassPair((Class)_NSTemporaryObjectID_Default_Class);
  }

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (void)_storeDeallocated
{
  IndexedIvars = object_getIndexedIvars(a1);
  if (IndexedIvars)
  {
    IndexedIvars[1] = 0LL;
    __dmb(0xBu);
  }

+ (void)setObjectStoreIdentifier:(id)a3
{
  IndexedIvars = object_getIndexedIvars(a1);
  id v5 = (id)IndexedIvars[2];
  if (v5 != a3)
  {
    if (v5) {
      CFRelease(v5);
    }
    v6 = (void *)CFRetain((CFTypeRef)[a3 copy]);
    IndexedIvars[2] = v6;
  }

+ (Class)classForStore:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Store must not be nil." userInfo:0]);
  }
  Name = class_getName((Class)a1);
  snprintf(__str, 0x100uLL, "%s_%x", Name, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_7);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  v6 = (void *)qword_18C4ABC90;
  uint64_t v7 = [(id)qword_18C4ABC90 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
LABEL_4:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(objc_class **)(*((void *)&v37 + 1) + 8 * v10);
      IndexedIvars = (unsigned int *)object_getIndexedIvars(v11);
      if (IndexedIvars)
      {
        if (!*((void *)IndexedIvars + 1)) {
          break;
        }
      }

+ (BOOL)_usesTaggedPointers
{
  return 0;
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

- (NSTemporaryObjectID)retain
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)release
{
  p_cd_rc = &self->_cd_rc;
  do
    int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    *p_cd_rc += 0x20000000;
    -[NSTemporaryObjectID dealloc](self, "dealloc");
  }

- (unint64_t)retainCount
{
  return self->_cd_rc + 1LL;
}

- (void)dealloc
{
  self->_entity = 0LL;
  if (object_getClass(self) != (Class)_NSTemporaryObjectID_Default_Class)
  {
    Class Class = object_getClass(self);
    _PFfastFactoryRelease2(Class);
  }

  _PFDeallocateObject(self);
}

+ (unsigned)allocateBatch:(id *)a3 forEntity:(id)a4 count:(unsigned int)a5
{
  uint64_t v8 = a5;
  do
    unsigned int v9 = __ldxr((unsigned int *)&_CoreDataProcessInstanceTempIDCounter);
  while (__stxr(v9 + a5, (unsigned int *)&_CoreDataProcessInstanceTempIDCounter));
  if (a5)
  {
    uint64_t v10 = 0LL;
    unsigned int v11 = v9 + 1;
    do
    {
      v12 = a3[v10];
      v12[3] = v11 + v10;
      *((void *)v12 + 2) = a4;
      ++v10;
    }

    while (v8 != v10);
  }

  else
  {
LABEL_8:
    LODWORD(v8) = 0;
  }

  return v8;
}

+ (id)initWithEntity:(id)a3
{
  return _PFFastTemporaryIDCreation(a3);
}

+ (id)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  return +[_NSTemporaryObjectID2 initWithEntity:andUUIDString:]( &OBJC_CLASS____NSTemporaryObjectID2,  "initWithEntity:andUUIDString:",  a3,  a4);
}

- (NSTemporaryObjectID)initWithEntity:(id)a3
{
  return +[NSTemporaryObjectID initWithEntity:](&OBJC_CLASS___NSTemporaryObjectID, "initWithEntity:", a3);
}

- (NSTemporaryObjectID)initWithEntity:(id)a3 andUUIDString:(id)a4
{
  return (NSTemporaryObjectID *)+[_NSTemporaryObjectID2 initWithEntity:andUUIDString:]( &OBJC_CLASS____NSTemporaryObjectID2,  "initWithEntity:andUUIDString:",  a3,  a4);
}

- (unint64_t)hash
{
  return __rbit32(self->_counter);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      return self->_counter == *((_DWORD *)a3 + 3);
    }
  }

  return 0;
}

- (id)persistentStore
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result) {
    return (id)*((void *)result + 1);
  }
  return result;
}

- (void)_setPersistentStore:(id)a3
{
  Class Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (a3 && IndexedIvars[1] != a3)
  {
    uint64_t v7 = _PFFastStoreTemporaryIDClass((uint64_t)a3);
    uint64_t v8 = (unsigned int *)object_getIndexedIvars(v7);
    do
      unsigned int v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    object_setClass(self, v7);
  }

- (id)entity
{
  return self->_entity;
}

- (BOOL)isTemporaryID
{
  return 1;
}

- (int)_temporaryIDCounter
{
  return self->_counter;
}

- (id)_storeIdentifier
{
  Class Class = object_getClass(self);
  id result = object_getIndexedIvars(Class);
  if (result)
  {
    unsigned int v4 = (id *)result;
    id result = (id)*((void *)result + 2);
    if (!result)
    {
      objc_msgSend((id)objc_opt_class(), "setObjectStoreIdentifier:", objc_msgSend(v4[1], "identifier"));
      return v4[2];
    }
  }

  return result;
}

- (BOOL)_isPersistentStoreAlive
{
  Class Class = object_getClass(self);
  IndexedIvars = (id *)object_getIndexedIvars(Class);
  if (IndexedIvars) {
    LOBYTE(IndexedIvars) = [IndexedIvars[1] _isPersistentStoreAlive];
  }
  return (char)IndexedIvars;
}

- (id)_retainedURIString
{
  int v3 = -[NSTemporaryObjectID _storeIdentifier](self, "_storeIdentifier");
  if (v3) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = &stru_189EAC2E8;
  }
  int counter = self->_counter;
  id v6 = objc_alloc(NSString);
  uint64_t v7 = objc_msgSend(-[NSTemporaryObjectID entity](self, "entity"), "name");
  id v8 = -[NSTemporaryObjectID _referenceData](self, "_referenceData");
  if (counter) {
    return (id)[v6 initWithFormat:@"%@://%@/%@/t%@%d", @"x-coredata", v4, v7, v8, self->_counter];
  }
  else {
    return (id)[v6 initWithFormat:@"%@://%@/%@/t%@", @"x-coredata", v4, v7, v8, v10];
  }
}

- (id)URIRepresentation
{
  int v3 = (void *)MEMORY[0x186E3E5D8](self, a2);
  id v4 = -[NSTemporaryObjectID _retainedURIString](self, "_retainedURIString");
  id v5 = (void *)[MEMORY[0x189604030] URLWithString:v4];

  id v6 = v5;
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)_referenceData
{
  return (id)qword_18C4ABC88;
}

@end