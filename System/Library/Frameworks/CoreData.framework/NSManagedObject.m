@interface NSManagedObject
+ ($2554683636028369AA004D99F7FAFE96)_PFMOClassFactoryData;
+ (BOOL)_classShouldAlwaysRegisterSelectorNamed:(const char *)a3;
+ (BOOL)_hasOverriddenAwake;
+ (BOOL)_isGeneratedClass_1;
+ (BOOL)_useFastValidationMethod;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)contextShouldIgnoreUnmodeledPropertyChanges;
+ (BOOL)resolveClassMethod:(SEL)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (Class)classForEntity:(id)a3;
+ (NSFetchRequest)fetchRequest;
+ (char)_transientPropertiesChangesMask__;
+ (id)_PFPlaceHolderSingleton;
+ (id)_PFPlaceHolderSingleton_core;
+ (id)_entityName;
+ (id)_retain_1;
+ (id)allocWithEntity:(id)a3;
+ (id)allocWithZone_10_4:(_NSZone *)a3;
+ (id)alloc_10_4;
+ (id)batchAllocateWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4 count:(unsigned int)a5;
+ (unsigned)allocBatch:(id *)a3 withEntity:(id)a4 count:(unsigned int)a5;
+ (void)_entityDeallocated;
+ (void)_initializeAccessorStubs;
+ (void)_initializePrimitiveAccessorStubs;
+ (void)_release_1;
+ (void)initialize;
- (BOOL)_defaultValidation:(id *)a3 error:(id *)a4;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 error:(id *)a5;
- (BOOL)_validateValue:(void *)a3 forProperty:(uint64_t)a4 andKey:(uint64_t)a5 withIndex:(void *)a6 error:;
- (BOOL)hasChanges;
- (BOOL)hasFaultForRelationshipNamed:(NSString *)key;
- (BOOL)hasPersistentChangedValues;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFault;
- (BOOL)isInserted;
- (BOOL)isUpdated;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)validateForDelete:(NSError *)error;
- (BOOL)validateForInsert:(NSError *)error;
- (BOOL)validateForUpdate:(NSError *)error;
- (BOOL)validateValue:(id *)value forKey:(NSString *)key error:(NSError *)error;
- (NSArray)objectIDsForRelationshipNamed:(NSString *)key;
- (NSDictionary)changedValues;
- (NSDictionary)changedValuesForCurrentEvent;
- (NSDictionary)committedValuesForKeys:(NSArray *)keys;
- (NSKnownKeysDictionary)_changedTransientProperties__;
- (NSKnownKeysDictionary)_newChangedValuesForRefresh__;
- (NSKnownKeysDictionary)_newCommittedSnapshotValues;
- (NSKnownKeysDictionary)_newNestedSaveChangedValuesForParent:(_BYTE *)a1;
- (NSKnownKeysDictionary)_newPropertiesForRetainedTypes:(unsigned int *)a3 andCopiedTypes:(char)a4 preserveFaults:;
- (NSKnownKeysDictionary)_newSnapshotForUndo__;
- (NSManagedObject)init;
- (NSManagedObject)initWithContext:(NSManagedObjectContext *)moc;
- (NSManagedObject)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context;
- (NSManagedObject)retain;
- (NSManagedObjectContext)managedObjectContext;
- (NSManagedObjectID)objectID;
- (NSString)description;
- (NSUInteger)faultingState;
- (id)_genericMergeableStringValueForKey:(id)a3 withIndex:(int64_t)a4;
- (id)_genericMutableOrderedSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5;
- (id)_genericMutableSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5;
- (id)_genericValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5;
- (id)_implicitObservationInfo;
- (id)_initWithEntity:(id)a3 withID:(id)a4 withHandler:(id)a5 withContext:(id)a6;
- (id)_orderKeysForRelationshipWithName__:(id)a3;
- (id)bindableObjectPublisher;
- (id)dictionaryWithPropertyValues;
- (id)dictionaryWithValuesForKeys:(id)a3;
- (id)diffOrderedSets:(void *)a1 :(void *)a2 :(id *)a3 :(id *)a4 :(id *)a5 :(id *)a6 :(id *)a7;
- (id)mergeableStringValueForKey:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)mutableArrayValueForKey:(id)a3;
- (id)mutableOrderedSetValueForKey:(id)a3;
- (id)mutableSetValueForKey:(id)a3;
- (id)primitiveValueForKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;
- (id)valueForUndefinedKey:(id)a3;
- (uint64_t)_commitPhotoshoperyForRelationshipAtIndex:(void *)a3 newValue:;
- (uint64_t)_generateErrorWithCode:(void *)a3 andMessage:(uint64_t)a4 forKey:(uint64_t)a5 andValue:(uint64_t)a6 additionalDetail:;
- (uint64_t)_isValidRelationshipDestination__;
- (uint64_t)_validateForSave:(void *)a1;
- (unint64_t)hash;
- (unint64_t)retainCount;
- (unsigned)_versionReference__;
- (void)_chainNewError:(uint64_t *)a3 toOriginalErrorDoublePointer:;
- (void)_clearRawPropertiesWithHint:(uint64_t)a3;
- (void)_didChangeValue:(id)a3 forRelationship:(id)a4 named:(id)a5 withInverse:(id)a6;
- (void)_genericUpdateFromSnapshot:(_DWORD *)a1;
- (void)_maintainInverseRelationship:(uint64_t *)a1 forProperty:(void *)a2 oldDestination:(uint64_t *)a3 newDestination:(uint64_t *)a4;
- (void)_maintainInverseRelationship:(void *)a3 forProperty:(uint64_t)a4 forChange:(void *)a5 onSet:;
- (void)_nilOutReservedCurrentEventSnapshot__;
- (void)_propagateDelete:(void *)a1;
- (void)_setGenericValue:(id)a3 forKey:(id)a4 withIndex:(int64_t)a5 flags:(int64_t)a6;
- (void)_setLastSnapshot__:(void *)result;
- (void)_setObjectID__:(void *)result;
- (void)_setOriginalSnapshot__:(void *)result;
- (void)_setVersionReference__:(unsigned int)a3;
- (void)_substituteEntityAndProperty:(void *)a3 inString:;
- (void)_updateFromRefreshSnapshot:(int)a3 includingTransients:;
- (void)_updateFromSnapshot:(uint64_t)a1;
- (void)_updateFromUndoSnapshot:(id *)a1;
- (void)_updateToManyRelationship:(void *)a3 from:(void *)a4 to:(void *)a5 with:;
- (void)_willChange_Swift_Trampoline;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)awakeFromSnapshotEvents:(NSSnapshotEventType)flags;
- (void)dealloc;
- (void)didAccessValueForKey:(NSString *)key;
- (void)didChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5;
- (void)didChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects;
- (void)didChangeValueForKey:(NSString *)key;
- (void)didSave;
- (void)methodForSelector:(SEL)a3;
- (void)observationInfo;
- (void)prepareForDeletion;
- (void)release;
- (void)setBindableObjectPublisher:(id)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setObservationInfo:(void *)inObservationInfo;
- (void)setPrimitiveValue:(id)value forKey:(NSString *)key;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setValue:(id)value forKey:(NSString *)key;
- (void)setValuesForKeysWithDictionary:(id)a3;
- (void)willAccessValueForKey:(NSString *)key;
- (void)willChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5;
- (void)willChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects;
- (void)willChangeValueForKey:(NSString *)key;
- (void)willSave;
@end

@implementation NSManagedObject

+ (id)allocWithEntity:(id)a3
{
  v5 = _PFFastEntityClass((unint64_t *)a3);
  if (!v5)
  {
    v12 = (objc_class *)a1;
    return _PFAllocateObject(v12, 0LL);
  }

  v6 = (objc_class *)v5;
  if ((*((_BYTE *)a3 + 120) & 4) == 0)
  {
    uint64_t v13 = [a3 managedObjectModel];
    id v14 = a3;
    if (v13) {
      id v14 = (id)[a3 managedObjectModel];
    }
    [v14 _setIsEditable:0];
  }

  uint64_t v7 = -[objc_class _PFMOClassFactoryData](v6, "_PFMOClassFactoryData");
  if (!v7)
  {
    v12 = v6;
    return _PFAllocateObject(v12, 0LL);
  }

  uint64_t v8 = v7;
  if (!*(void *)(v7 + 24))
  {
    uint64_t v15 = *((void *)a3 + 14);
    if (v15) {
      unint64_t v16 = *(void *)(v15 + 8);
    }
    else {
      unint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
    }
    if (v16 <= 1) {
      uint64_t v17 = 1LL;
    }
    else {
      uint64_t v17 = v16;
    }
    *(void *)(v8 + 24) = 8 * v17;
  }

  v9 = _PFAllocateObject(v6, 0LL);
  int InstanceSize = class_getInstanceSize(v6);
  v9[4] = *(_DWORD *)(v8 + 40) | (*(unsigned __int8 *)(v8 + 32) << 24);
  v9[5] = (InstanceSize + 7) & 0xFFFFFFF8;
  __dmb(0xBu);
  return v9;
}

- (id)_initWithEntity:(id)a3 withID:(id)a4 withHandler:(id)a5 withContext:(id)a6
{
  uint64_t v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSManagedObject;
  id result = -[NSManagedObject init](&v11, sel_init, a3, a4, a5);
  if (result)
  {
    v10 = result;
    *((void *)result + 4) = a6;
    if (!v7) {
      uint64_t v7 = _PFFastTemporaryIDCreation(a3);
    }
    v10[5] = v7;
    *((_DWORD *)v10 + 4) |= 0x8400u;
    return (id)[v10 initWithEntity:a3 insertIntoManagedObjectContext:a6];
  }

  return result;
}

- (NSManagedObject)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
  v4 = self;
  if ((self->_cd_stateFlags & 0x400) != 0) {
    return v4;
  }
  v5 = entity;
  if (!entity)
  {
    v5 = (void *)objc_opt_class();
    if ((v4->_cd_stateFlags & 0x100000) == 0) {

    }
    v4 = (NSManagedObject *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    uint64_t v13 = [NSString stringWithFormat:@"An NSManagedObject of class '%@' must have a valid NSEntityDescription.", v5];
    id v14 = v4;
    uint64_t v15 = v12;
    goto LABEL_24;
  }

  if ((*(_BYTE *)&entity->_entityDescriptionFlags & 4) == 0)
  {
    if (-[NSEntityDescription managedObjectModel](entity, "managedObjectModel")) {
      uint64_t v7 = (void *)[v5 managedObjectModel];
    }
    else {
      uint64_t v7 = v5;
    }
    [v7 _setIsEditable:0];
  }

  uint64_t v8 = _PFFastEntityClass((unint64_t *)v5);
  if (_MergedGlobals_69 == 1)
  {
    Class = object_getClass(v4);
    if ((v4->_cd_stateFlags & 0x100000) == 0)
    {
      v10 = Class;
      if (Class == (objc_class *)v8) {
        goto LABEL_15;
      }
      if (Class != class_getSuperclass((Class)v8) && v10 != object_getClass((id)qword_18C4AB990))
      {
        while (1)
        {
          uint64_t v16 = objc_opt_class();
          v4->_cd_stateFlags = v4->_cd_stateFlags & 0xFFFC7FFF | 0x8000;

          v4 = (NSManagedObject *)MEMORY[0x189603F70];
          uint64_t v17 = *MEMORY[0x189603A60];
          uint64_t v13 = [NSString stringWithFormat:@"NSEntityDescription '%@' can only support a single custom class (tried to instantiate class '%@'). Use a subentity with 0 properties to further specialize the NSManagedObject subclass.", objc_msgSend(v5, "name"), v16];
          id v14 = v4;
          uint64_t v15 = v17;
LABEL_24:
          objc_exception_throw((id)-[NSManagedObject exceptionWithName:reason:userInfo:]( v14,  "exceptionWithName:reason:userInfo:",  v15,  v13,  0LL));
        }
      }

      _PFDeallocateObject(v4);
    }

    v4 = (NSManagedObject *)[v8 allocWithEntity:v5];
  }

  else
  {
    object_setClass(v4, (Class)v8);
  }

- (NSManagedObjectID)objectID
{
  return self->_cd_objectID;
}

- (NSManagedObject)retain
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v4 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v4 + 2, (unsigned int *)p_cd_rc));
  if (*MEMORY[0x1896049A0]) {
    NSRecordAllocationEvent();
  }
  return self;
}

- (void)release
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v4 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v4 - 2, (unsigned int *)p_cd_rc));
  v5 = (_BYTE *)MEMORY[0x1896049A0];
  if (*MEMORY[0x1896049A0])
  {
    NSRecordAllocationEvent();
    if (v4) {
      return;
    }
  }

  else if (v4)
  {
    return;
  }

  if ((self->_cd_stateFlags & 0x100000) != 0)
  {
    do
      unsigned int v9 = __ldaxr((unsigned int *)p_cd_rc);
    while (__stlxr(v9 + 0x20000000, (unsigned int *)p_cd_rc));
  }

  else
  {
    id cd_queueReference = self->_cd_queueReference;
    if (cd_queueReference)
    {
      do
        unsigned int v7 = __ldaxr((unsigned int *)p_cd_rc);
      while (__stlxr(v7 + 2, (unsigned int *)p_cd_rc));
      if (*v5)
      {
        id v10 = cd_queueReference;
        NSRecordAllocationEvent();
        id cd_queueReference = v10;
      }

      -[_PFManagedObjectReferenceQueue _queueForDealloc:]((uint64_t)cd_queueReference, (unsigned int *)self);
    }

    else
    {
      while (1)
      {
        unsigned int v8 = __ldaxr((unsigned int *)p_cd_rc);
        if (v8 != -2) {
          break;
        }
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[NSManagedObject dealloc](self, "dealloc");
          return;
        }
      }

      __clrex();
    }
  }

- (NSManagedObjectContext)managedObjectContext
{
  if (self)
  {
    if ((self->_wasDisposed & 0x80) != 0) {
      return 0LL;
    }
    else {
      return (NSManagedObjectContext *)self->_parentObjectStore;
    }
  }

  return self;
}

- (BOOL)isInserted
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  return (self->_cd_stateFlags & 0x12) != 0;
}

- (uint64_t)_commitPhotoshoperyForRelationshipAtIndex:(void *)a3 newValue:
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 48);
    if (v4)
    {
      uint64_t v7 = *(void *)(v4 + 8);
      if (v7)
      {
        uint64_t v8 = v7 + 24;
        unsigned int v9 = *(void **)(v7 + 24 + 8 * a2);
        if (v9 != a3)
        {
          id result = [*(id *)(v8 + 8 * a2) isFault];
          if ((_DWORD)result)
          {

            id result = [a3 copy];
            *(void *)(v8 + 8 * a2) = result;
          }
        }
      }

      uint64_t v10 = *(void *)(v3 + 48);
      if (v10)
      {
        uint64_t v11 = *(void *)(v10 + 16);
        if (v11)
        {
          uint64_t v12 = v11 + 24;
          uint64_t v13 = *(void **)(v11 + 24 + 8 * a2);
          if (v13 != a3)
          {
            id result = [*(id *)(v12 + 8 * a2) isFault];
            if ((_DWORD)result)
            {

              id result = [a3 copy];
              *(void *)(v12 + 8 * a2) = result;
            }
          }
        }
      }
    }
  }

  return result;
}

- (void)dealloc
{
  self->_cd_rc = 536870913;
  self->_cd_managedObjectContext = 0LL;
  unsigned int v3 = (self->_cd_stateFlags >> 15) & 7;
  if (v3 == 5 || v3 == 0) {
    -[NSFaultHandler turnObject:intoFaultWithContext:](_insertion_fault_handler, (uint64_t)self, 0LL);
  }
  if (self->_cd_extras || self->_cd_rawData)
  {
    v5 = _PFEntityForManagedObject(self);
    if (v5)
    {
      uint64_t v6 = v5[14];
      if (v6) {
        -[NSManagedObject _clearRawPropertiesWithHint:]((uint64_t)self, *(void *)v6, *(void *)(v6 + 8));
      }
    }
  }

  cd_extras = self->_cd_extras;
  if (cd_extras)
  {

    uint64_t v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v8 = malloc_default_zone();
    }
    malloc_zone_free(v8, self->_cd_extras);
    self->_cd_extras = 0LL;
  }

  id cd_queueReference = (unsigned int *)self->_cd_queueReference;
  if (cd_queueReference)
  {
    uint64_t v10 = cd_queueReference + 2;
    do
      int v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (v11 <= 0)
    {
      cd_queueReference[2] += 0x20000000;
      [cd_queueReference dealloc];
    }
  }

  _PFDeallocateObject(self);
}

- (void)_clearRawPropertiesWithHint:(uint64_t)a3
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {

      *(void *)(v6 + 8) = 0LL;
      *(void *)(v6 + 16) = 0LL;

      *(void *)(v6 + 24) = 0LL;
      if (!*(void *)v6 && !*(void *)(v6 + 32))
      {
        uint64_t v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
        if (!_PF_Private_Malloc_Zone) {
          uint64_t v7 = malloc_default_zone();
        }
        malloc_zone_free(v7, *(void **)(a1 + 48));
        *(void *)(a1 + 48) = 0LL;
      }
    }

    uint64_t v8 = *(void **)(a1 + 24);
    if (v8)
    {
      int v9 = a2 + a3;
      if (a2 < a2 + a3)
      {
        uint64_t v10 = *(unsigned int *)(a1 + 20);
        if ((_DWORD)v10) {
          uint64_t v11 = a1 + v10;
        }
        else {
          uint64_t v11 = 0LL;
        }
        unint64_t v12 = ((unint64_t)*(unsigned int *)(a1 + 16) >> 22) & 0x3FC;
        uint64_t v13 = v11 - v12;
        int v14 = v9 - 1;
        int v15 = (int)a2 >> 3;
        int v16 = v14 >> 3;
        unsigned int v17 = 0xFFu >> (8 - (a2 & 7));
        if (v14 >> 3 == (int)a2 >> 3)
        {
          int v18 = (510 << (v14 & 7)) | v17;
        }

        else
        {
          *(_BYTE *)(v13 + v15) &= v17;
          if (v15 + 1 < v16) {
            bzero((void *)(v15 - v12 + v11 + 1), (v16 - v15 - 2) + 1LL);
          }
          int v18 = 510 << (v14 & 7);
          int v15 = v14 >> 3;
        }

        *(_BYTE *)(v13 + v15) &= v18;
        uint64_t v8 = *(void **)(a1 + 24);
      }

      *(void *)(a1 + 24) = 0LL;
    }

    *(_DWORD *)(a1 + 12) = 0;
  }

- (void)awakeFromFetch
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)_willChange_Swift_Trampoline
{
  v2 = self;
  if (-[NSManagedObject bindableObjectPublisher](v2, sel_bindableObjectPublisher))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(&v3, &v4);
    type metadata accessor for ObservableObjectPublisher();
    swift_dynamicCast();
    ObservableObjectPublisher.send()();

    swift_release();
  }

  else
  {
    __break(1u);
  }

+ (id)_PFPlaceHolderSingleton_core
{
  return (id)qword_18C4AB990;
}

+ (char)_transientPropertiesChangesMask__
{
  return 0LL;
}

+ (id)alloc_10_4
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (id)allocWithZone_10_4:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0LL);
}

+ (void)initialize
{
  if (objc_getClass("NSManagedObject") == a1 && qword_18C4AB990 == 0)
  {
    __int128 v4 = (objc_class *)objc_opt_class();
    off_18C4AB998 = class_getMethodImplementation(v4, sel_willChangeValueForKey_);
    v5 = (objc_class *)objc_opt_class();
    _NSObjectDidChangeVFKImp = class_getMethodImplementation(v5, sel_didChangeValueForKey_);
    uint64_t v6 = (objc_class *)objc_opt_class();
    off_18C4AB9A0 = class_getMethodImplementation(v6, sel_willChangeValueForKey_withSetMutation_usingObjects_);
    uint64_t v7 = (objc_class *)objc_opt_class();
    _NSObjectDidChangeForKeywithSetMutationImp = class_getMethodImplementation( v7,  sel_didChangeValueForKey_withSetMutation_usingObjects_);
    uint64_t v8 = (objc_class *)objc_opt_class();
    off_18C4AB9A8 = class_getMethodImplementation(v8, sel_willChange_valuesAtIndexes_forKey_);
    int v9 = (objc_class *)objc_opt_class();
    off_18C4AB9B0 = class_getMethodImplementation(v9, sel_didChange_valuesAtIndexes_forKey_);
    uint64_t v10 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v10 = malloc_default_zone();
    }
    size_t InstanceSize = class_getInstanceSize((Class)a1);
    qword_18C4AB990 = (uint64_t)malloc_zone_calloc(v10, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8LL);
    object_setClass((id)qword_18C4AB990, (Class)a1);
    uint64_t v12 = qword_18C4AB990;
    *(_DWORD *)(qword_18C4AB990 + 16) |= 0x100000u;
    *(_DWORD *)(v12 + 8) = 0x20000000;
    _MergedGlobals_69 = 1;
    objc_opt_class();
  }

+ (BOOL)contextShouldIgnoreUnmodeledPropertyChanges
{
  return 1;
}

- (unint64_t)hash
{
  unsigned int v2 = (2 * ((unint64_t)self >> 4)) & 0xAAAAAAAA | (((unint64_t)self >> 4) >> 1) & 0x55555555;
  unsigned int v3 = (4 * v2) & 0xCCCCCCCC | (v2 >> 2) & 0x33333333;
  unsigned int v4 = (16 * v3) & 0xF0F0F0F0 | (v3 >> 4) & 0xF0F0F0F;
  return (v4 << 8) & 0xFF0000 | (v4 << 24) | (v4 >> 8) & 0xFF00 | HIBYTE(v4);
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (unint64_t)retainCount
{
  return (uint64_t)(self->_cd_rc + 2) >> 1;
}

- (BOOL)_tryRetain
{
  p_cd_rc = (unsigned int *)&self->_cd_rc;
LABEL_2:
  unsigned int v3 = *p_cd_rc;
  if ((*p_cd_rc & 1) == 0)
  {
    do
    {
      unsigned int v4 = __ldaxr(p_cd_rc);
      if (v4 != v3)
      {
        __clrex();
        goto LABEL_2;
      }
    }

    while (__stlxr(v3 + 2, p_cd_rc));
    if (*MEMORY[0x1896049A0]) {
      NSRecordAllocationEvent();
    }
  }

  return (v3 & 1) == 0;
}

- (BOOL)_isDeallocating
{
  return self->_cd_rc & 1;
}

- (NSString)description
{
  unsigned int v2 = self;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  unsigned int v3 = (void *)MEMORY[0x186E3E5D8](self, a2);
  uint64_t v4 = -[NSManagedObjectID entity](-[NSManagedObject objectID](v2, "objectID"), "entity");
  v5 = (void *)NSString;
  if (v4)
  {
    v51.receiver = v2;
    v51.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    uint64_t v6 = -[NSManagedObject description](&v51, sel_description);
    uint64_t v7 = -[NSEntityDescription name](-[NSManagedObject entity](v2, "entity"), "name");
    uint64_t v8 = -[NSManagedObject objectID](v2, "objectID");
    if (-[NSManagedObject isFault](v2, "isFault"))
    {
      int v9 = @"<fault>";
      goto LABEL_80;
    }

    if (v2)
    {
      if (_PF_Threading_Debugging_level) {
        _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v2->_cd_managedObjectContext, sel__descriptionValues);
      }
      uint64_t v11 = (void *)[_PFEntityForManagedObject(v2) properties];
      uint64_t v12 = [v11 count];
      uint64_t v13 = [MEMORY[0x189603FC8] dictionaryWithCapacity:v12];
      int v9 = (const __CFString *)v13;
      uint64_t cd_extraFlags = v2->_cd_extraFlags;
      if ((_DWORD)cd_extraFlags) {
        int v15 = (char *)v2 + cd_extraFlags;
      }
      else {
        int v15 = 0LL;
      }
      uint64_t v49 = v12;
      if (v12)
      {
        uint64_t v40 = v8;
        uint64_t v41 = v7;
        v42 = v6;
        v43 = v5;
        unint64_t v16 = 0LL;
        v44 = v3;
        v45 = &v15[-(((unint64_t)v2->_cd_stateFlags >> 22) & 0x3FC)];
        uint64_t v17 = v12;
        v47 = (__CFString *)v13;
        v48 = v2;
        v46 = v11;
        while (1)
        {
          int v18 = (void *)MEMORY[0x186E3E5D8]();
          v19 = (void *)[v11 objectAtIndex:v16];
          uint64_t v20 = [v19 name];
          uint64_t v21 = -[NSManagedObject valueForKey:](v2, "valueForKey:", v20);
          if (v21)
          {
            v22 = (__CFString *)v21;
            switch([v19 _propertyType])
            {
              case 2LL:
              case 6LL:
              case 7LL:
                uint64_t v23 = [v19 attributeType];
                if (v23 <= 799)
                {
                  if (v23 <= 399)
                  {
                    if (v23 != 100 && v23 != 200 && v23 != 300) {
                      goto LABEL_67;
                    }
                  }

                  else
                  {
                    if (v23 > 599)
                    {
                      if (v23 == 600) {
                        goto LABEL_76;
                      }
                      if (v23 != 700)
                      {
LABEL_67:
                        v22 = @"(...not nil..)";
                        goto LABEL_76;
                      }

                      if (-[__CFString isNSString](v22, "isNSString"))
                      {
                        uint64_t v33 = -[__CFString substringToIndex:](v22, "substringToIndex:", 200LL);
                        goto LABEL_75;
                      }

- (NSManagedObject)init
{
  if ((init__warn_once & 1) == 0)
  {
    unsigned int v3 = (void *)NSString;
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = [v3 stringWithFormat:@"CoreData: error: Failed to call designated initializer on NSManagedObject class '%@' \n", NSStringFromClass(v4)];
    init__warn_once = 1;
    if (v5)
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      _NSCoreDataLog( 1LL,  (uint64_t)@"CoreData: error: Failed to call designated initializer on NSManagedObject class '%@' \n",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v7);
    }
  }

  Class = object_getClass(self);
  return (NSManagedObject *)_PFAllocateObject(Class, 0LL);
}

- (BOOL)isUpdated
{
  char v3 = _PF_Threading_Debugging_level;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    char v3 = self == 0LL;
  }

  else
  {
    BOOL result = 0;
    if (!self) {
      return result;
    }
  }

  unsigned int cd_stateFlags = self->_cd_stateFlags;
  BOOL v6 = (cd_stateFlags >> 3) & 1;
  BOOL v7 = cd_stateFlags & 1;
  if ((self->_cd_stateFlags & 8) != 0) {
    BOOL v7 = v6;
  }
  if ((v3 & 1) != 0) {
    return v6;
  }
  else {
    return v7;
  }
}

- (BOOL)isDeleted
{
  char v3 = _PF_Threading_Debugging_level;
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
    char v3 = self == 0LL;
  }

  else
  {
    BOOL result = 0;
    if (!self) {
      return result;
    }
  }

  unsigned int cd_stateFlags = self->_cd_stateFlags;
  BOOL v6 = (cd_stateFlags >> 5) & 1;
  BOOL v7 = (cd_stateFlags >> 2) & 1;
  if ((self->_cd_stateFlags & 0x20) != 0) {
    LOBYTE(v7) = v6;
  }
  if ((v3 & 1) != 0) {
    return v6;
  }
  else {
    return v7;
  }
}

- (BOOL)isFault
{
  return BYTE1(self->_cd_stateFlags) >> 7;
}

- (BOOL)hasFaultForRelationshipNamed:(NSString *)key
{
  char v3 = key;
  if (!_PF_Threading_Debugging_level)
  {
    if (key) {
      goto LABEL_3;
    }
LABEL_26:
    uint64_t v15 = [NSString stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key %@.", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), 0];
    id v16 = objc_alloc(MEMORY[0x189603F68]);
    uint64_t v17 = (void *)objc_msgSend( v16,  "initWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  objc_msgSend(MEMORY[0x189603FE8], "null"),  @"NSUnknownUserInfoKey",  0);
    int v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189607790] reason:v15 userInfo:v17];

    objc_exception_throw(v18);
    -[NSManagedObject setObservationInfo:](v19, v20, v21);
    return v14;
  }

  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!v3) {
    goto LABEL_26;
  }
LABEL_3:
  v23.length = CFStringGetLength((CFStringRef)v3);
  v23.location = 0LL;
  if (CFStringFindWithOptions((CFStringRef)v3, @".", v23, 0LL, &result))
  {
    v24.length = result.location;
    v24.location = 0LL;
    CFStringRef v5 = CFStringCreateWithSubstring(0LL, (CFStringRef)v3, v24);
    char v3 = (NSString *)v5;
  }

  else
  {
    CFStringRef v5 = 0LL;
  }

  id v6 = _PFEntityForManagedObject(self);
  if (v6
    && (BOOL v7 = (unint64_t *)v6, v8 = [*((id *)v6 + 13) indexForKey:v3], v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v8;
    uint64_t cd_extraFlags = self->_cd_extraFlags;
    if ((_DWORD)cd_extraFlags) {
      uint64_t v11 = (char *)self + cd_extraFlags;
    }
    else {
      uint64_t v11 = 0LL;
    }
    if (((v11[(v8 >> 3) - (((unint64_t)self->_cd_stateFlags >> 22) & 0x3FC)] >> (v8 & 7)) & 1) != 0)
    {
      if (!*(void *)(_kvcPropertysPrimitiveGetters(v7) + 8 * v8))
      {
        id v12 = -[NSManagedObject _genericValueForKey:withIndex:flags:]( self,  "_genericValueForKey:withIndex:flags:",  v3,  v9,  0LL);
        goto LABEL_16;
      }

- (void)setObservationInfo:(void *)inObservationInfo
{
  cd_extras = self->_cd_extras;
  if (!cd_extras)
  {
    id v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      id v6 = malloc_default_zone();
    }
    cd_extras = ($EC3A7A785197EEFA6C82A67C8BBF666E *)malloc_zone_calloc(v6, 1uLL, 0x28uLL);
    self->_cd_extras = cd_extras;
  }

  cd_extras->var0 = inObservationInfo;
}

- (void)observationInfo
{
  cd_extras = self->_cd_extras;
  if (cd_extras) {
    return cd_extras->var0;
  }
  else {
    return 0LL;
  }
}

- (void)willAccessValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }

  else if (!self)
  {
    goto LABEL_4;
  }

  if ((self->_cd_stateFlags & 0x4000) != 0)
  {
    unint64_t v9 = self;
    self->_cd_stateFlags &= ~0x4000u;
    if (key) {
      goto LABEL_5;
    }
LABEL_15:
    -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, self, (uint64_t)self->_cd_managedObjectContext);
    return;
  }

- (void)didAccessValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)willChangeValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  CFStringRef v5 = (id *)_PFEntityForManagedObject(self);
  if (v5)
  {
    unint64_t v7 = [v5[13] indexForKey:key];
LABEL_7:
    _PF_ManagedObject_WillChangeValueForKeyIndex((uint64_t)self, v6, (uint64_t)key, v7, 1);
    return;
  }

  if (BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_7;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSManagedObject;
  -[NSManagedObject willChangeValueForKey:](&v8, sel_willChangeValueForKey_, key);
}

- (void)didChangeValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if (!_PFEntityForManagedObject(self) && !BYTE1(z9dsptsiQ80etb9782fsrs98bfdle88))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    -[NSManagedObject willChangeValueForKey:](&v7, sel_willChangeValueForKey_, key);
    return;
  }

  unsigned int cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x2000) != 0)
  {
    if ((cd_stateFlags & 0x1000) != 0) {
      goto LABEL_7;
    }
  }

  else
  {
    _NSObjectDidChangeVFKImp(self, a2, key);
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_7:
      if ((cd_stateFlags & 0x40) == 0) {
        goto LABEL_12;
      }
      return;
    }
  }

  self->_cd_stateFlags &= ~0x800u;
  if ((cd_stateFlags & 0x40) == 0) {
LABEL_12:
  }
    -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", key);
}

- (void)willChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v10 = (id *)_PFEntityForManagedObject(self);
  if (!v10)
  {
    p_unsigned int cd_stateFlags = &self->_cd_stateFlags;
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if ((cd_stateFlags & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  unint64_t v11 = [v10[13] indexForKey:a5];
  uint64_t v12 = v11;
  p_unsigned int cd_stateFlags = &self->_cd_stateFlags;
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x40) == 0)
  {
LABEL_8:
    -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a5);
    goto LABEL_10;
  }

  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    _PF_Handler_WillAccess_Property((id *)&self->super.isa, (uint64_t)sel_willAccessValueForKey_, v11);
  }
LABEL_10:
  if ((*((_BYTE *)p_cd_stateFlags + 1) & 0x80) != 0)
  {
    [(id)_insertion_fault_handler fulfillFault:self withContext:self->_cd_managedObjectContext forIndex:v12];
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_12:
      if ((cd_stateFlags & 0x2000) != 0) {
        return;
      }
      goto LABEL_13;
    }
  }

  else if ((cd_stateFlags & 0x1000) != 0)
  {
    goto LABEL_12;
  }

  if ((cd_stateFlags & 0x400000) == 0 || v12 != 0x7FFFFFFFFFFFFFFFLL) {
    _PFFastMOCObjectWillChange((uint64_t)self->_cd_managedObjectContext, self);
  }
  *p_cd_stateFlags |= 0x800u;
  if ((cd_stateFlags & 0x2000) == 0) {
LABEL_13:
  }
    off_18C4AB9A8(self, a2, a3, a4, a5);
}

- (void)didChange:(unint64_t)a3 valuesAtIndexes:(id)a4 forKey:(id)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  unsigned int cd_stateFlags = self->_cd_stateFlags;
  if ((cd_stateFlags & 0x2000) != 0)
  {
    if ((cd_stateFlags & 0x1000) != 0) {
      goto LABEL_5;
    }
  }

  else
  {
    off_18C4AB9B0(self, a2, a3, a4, a5);
    if ((cd_stateFlags & 0x1000) != 0)
    {
LABEL_5:
      if ((cd_stateFlags & 0x40) != 0) {
        return;
      }
LABEL_9:
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a5);
      return;
    }
  }

  self->_cd_stateFlags &= ~0x800u;
  if ((cd_stateFlags & 0x40) == 0) {
    goto LABEL_9;
  }
}

- (void)willChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v10 = (id *)_PFEntityForManagedObject(self);
  if (v10) {
    unint64_t v11 = [v10[13] indexForKey:inKey];
  }
  else {
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _PF_ManagedObject_WillChangeValueForKeywithSetMutation( self,  (uint64_t)a2,  (uint64_t)inKey,  inMutationKind,  (uint64_t)inObjects,  v11);
}

- (void)didChangeValueForKey:(NSString *)inKey withSetMutation:(NSKeyValueSetMutationKind)inMutationKind usingObjects:(NSSet *)inObjects
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  _PF_ManagedObject_DidChangeValueForKeywithSetMutation((uint64_t)self, (uint64_t)a2, (uint64_t)inKey);
}

- (void)awakeFromInsert
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)awakeFromSnapshotEvents:(NSSnapshotEventType)flags
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)prepareForDeletion
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)willSave
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (void)didSave
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
}

- (BOOL)validateValue:(id *)value forKey:(NSString *)key error:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  unint64_t v9 = _PFEntityForManagedObject(self);
  uint64_t v10 = v9;
  if (v9) {
    unint64_t v9 = (void *)v9[13];
  }
  uint64_t v11 = [v9 indexForKey:key];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v12 = 0LL;
  }
  else {
    uint64_t v12 = *(void **)(v10[12] + 24LL + 8 * v11);
  }
  return -[NSManagedObject _validateValue:forProperty:andKey:withIndex:error:]( self,  (uint64_t *)value,  v12,  (uint64_t)key,  v11,  error);
}

- (BOOL)_validateValue:(void *)a3 forProperty:(uint64_t)a4 andKey:(uint64_t)a5 withIndex:(void *)a6 error:
{
  if (!a1)
  {
LABEL_62:
    LOBYTE(v19) = 0;
    return v19 & 1;
  }

  uint64_t v62 = 0LL;
  v63[0] = 0LL;
  if (a6) {
    uint64_t v12 = &v62;
  }
  else {
    uint64_t v12 = 0LL;
  }
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    Class = object_getClass(a1);
    Class Superclass = class_getSuperclass(Class);
    if (Superclass == (Class)objc_opt_class())
    {
      LOBYTE(v19) = 1;
      return v19 & 1;
    }

    v61.receiver = a1;
    v61.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    unsigned __int8 v15 = objc_msgSendSuper2(&v61, sel_validateValue_forKey_error_, a2, a4, v12);
  }

  else
  {
    id v16 = (unint64_t *)_PFEntityForManagedObject(a1);
    uint64_t v17 = *(void *)(v16[19] + 32);
    if (!v17) {
      uint64_t v17 = _resolveValidationMethods(v16);
    }
    int v18 = *(objc_method **)(v17 + 8 * a5);
    if (!v18)
    {
      id v20 = _PFEntityForManagedObject(a1);
      goto LABEL_22;
    }

    unsigned __int8 v15 = method_invoke(a1, v18, a2, v12);
  }

  LOBYTE(v19) = v15;
  if (a6 && (v15 & 1) == 0) {
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v62, v63);
  }
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_59;
  }
  id v20 = _PFEntityForManagedObject(a1);
  if ((v19 & 1) == 0)
  {
    if (!a6 || ([a3 _nonPredicateValidateValue:a2 forKey:a4 inObject:a1 error:&v62] & 1) != 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

- (BOOL)validateForDelete:(NSError *)error
{
  v75[1] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([_PFEntityForManagedObject(self) _skipValidation]) {
    return 1;
  }
  if ((self->_cd_stateFlags & 0x8000) != 0) {
    -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, self, (uint64_t)self->_cd_managedObjectContext);
  }
  CFStringRef v5 = (unint64_t *)_PFEntityForManagedObject(self);
  if (!v5)
  {
    BOOL result = _kvcPropertysPrimitiveGetters(0LL);
    __break(1u);
    return result;
  }

  uint64_t v6 = v5;
  unint64_t v7 = v5[14];
  uint64_t v8 = *(void *)(v5[13] + 40);
  uint64_t v55 = _kvcPropertysPrimitiveGetters(v5);
  unint64_t v9 = v6[12];
  v65 = 0LL;
  unint64_t v11 = *(void *)(v7 + 32);
  uint64_t v10 = *(void *)(v7 + 40);
  uint64_t v12 = v10 + v11;
  if (v11 >= v10 + v11) {
    return 1;
  }
  unint64_t v56 = v9 + 24;
  uint64_t v13 = *MEMORY[0x189607460];
  SEL v52 = error;
  uint64_t v53 = v13;
  BOOL v14 = 1;
  uint64_t v51 = v8;
  do
  {
    uint64_t v15 = *(void *)(v8 + 8 * v11);
    id v16 = *(void **)(v56 + 8 * v11);
    if (![v16 deleteRule]) {
      goto LABEL_34;
    }
    _PF_Handler_Primitive_GetProperty((id **)self, v11, v15, *(void *)(v55 + 8 * v11), v17, v18, v19, v20);
    if (!v21) {
      goto LABEL_34;
    }
    int v22 = v21;
    if ([v16 isToMany])
    {
      uint64_t v23 = [v22 count];
      if (!v23) {
        goto LABEL_34;
      }
      unint64_t v24 = v23;
      unint64_t v25 = MEMORY[0x1895F8858](v23);
      uint64_t v27 = (char *)&v49 - v26;
      uint64_t v54 = v28;
      if (v25 > 0x200) {
        uint64_t v27 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)&v49 - v26, 8 * v25);
      }
      [v22 getObjects:v27];
      uint64_t v31 = 0LL;
      while (([*(id *)&v27[8 * v31] isDeleted] & 1) != 0)
      {
        if (v24 == ++v31)
        {
          error = v52;
          goto LABEL_31;
        }
      }

      error = v52;
      if (v52)
      {
        v74 = @"NSValidationErrorShouldAttemptRecoveryKey";
        v75[0] = [MEMORY[0x189607968] numberWithBool:1];
        uint64_t v32 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]( (uint64_t)self,  1600,  0,  v15,  (uint64_t)v22,  [MEMORY[0x189603F68] dictionaryWithObjects:v75 forKeys:&v74 count:1]);
        -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](self, v32, (uint64_t *)&v65);
        int v33 = -[NSError domain](v65, "domain");
        if (-[NSString isEqualToString:](v33, "isEqualToString:", v53))
        {
          if (-[NSError code](v65, "code") == 1560
            && !-[NSDictionary objectForKey:]( -[NSError userInfo](v65, "userInfo"),  "objectForKey:",  @"NSValidationErrorShouldAttemptRecoveryKey"))
          {
            id v41 = -[NSDictionary objectForKey:]( -[NSError userInfo](v65, "userInfo"),  "objectForKey:",  @"NSDetailedErrors");
            __int128 v61 = 0u;
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            id v50 = v41;
            uint64_t v42 = [v41 countByEnumeratingWithState:&v61 objects:v73 count:16];
            if (!v42)
            {
LABEL_53:
              uint64_t v46 = (void *)MEMORY[0x189607870];
              v71[0] = @"NSDetailedErrors";
              v71[1] = @"NSValidationErrorShouldAttemptRecoveryKey";
              v72[0] = v50;
              v72[1] = MEMORY[0x189604A88];
              uint64_t v47 = [MEMORY[0x189603F68] dictionaryWithObjects:v72 forKeys:v71 count:2];
              BOOL v14 = 0;
              v65 = (NSError *)[v46 errorWithDomain:v53 code:1560 userInfo:v47];
LABEL_31:
              if (v24 >= 0x201) {
                NSZoneFree(0LL, v27);
              }
              uint64_t v8 = v51;
              if (error == 0LL && !v14) {
                return 0;
              }
              goto LABEL_34;
            }

            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v62;
LABEL_47:
            uint64_t v45 = 0LL;
            while (1)
            {
              if (*(void *)v62 != v44) {
                objc_enumerationMutation(v50);
              }
              if (!objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * v45), "userInfo"),  "objectForKey:",  @"NSValidationErrorShouldAttemptRecoveryKey"),  "BOOLValue")) {
                break;
              }
              if (v43 == ++v45)
              {
                uint64_t v43 = [v50 countByEnumeratingWithState:&v61 objects:v73 count:16];
                if (v43) {
                  goto LABEL_47;
                }
                goto LABEL_53;
              }
            }
          }
        }
      }

      BOOL v14 = 0;
      goto LABEL_31;
    }

    if ([v22 isDeleted]) {
      goto LABEL_34;
    }
    if (!error) {
      return 0;
    }
    v69 = @"NSValidationErrorShouldAttemptRecoveryKey";
    uint64_t v70 = [MEMORY[0x189607968] numberWithBool:1];
    uint64_t v29 = -[NSManagedObject _generateErrorWithCode:andMessage:forKey:andValue:additionalDetail:]( (uint64_t)self,  1600,  0,  v15,  (uint64_t)v22,  [MEMORY[0x189603F68] dictionaryWithObjects:&v70 forKeys:&v69 count:1]);
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](self, v29, (uint64_t *)&v65);
    uint64_t v30 = -[NSError domain](v65, "domain");
    if (!-[NSString isEqualToString:](v30, "isEqualToString:", v53)
      || -[NSError code](v65, "code") != 1560
      || -[NSDictionary objectForKey:]( -[NSError userInfo](v65, "userInfo"),  "objectForKey:",  @"NSValidationErrorShouldAttemptRecoveryKey"))
    {
      goto LABEL_20;
    }

    id v34 = -[NSDictionary objectForKey:]( -[NSError userInfo](v65, "userInfo"),  "objectForKey:",  @"NSDetailedErrors");
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v58;
LABEL_38:
      uint64_t v38 = 0LL;
      while (1)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        if (!objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * v38), "userInfo"),  "objectForKey:",  @"NSValidationErrorShouldAttemptRecoveryKey"),  "BOOLValue")) {
          break;
        }
        if (v36 == ++v38)
        {
          uint64_t v36 = [v34 countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (v36) {
            goto LABEL_38;
          }
          goto LABEL_44;
        }
      }

- (uint64_t)_generateErrorWithCode:(void *)a3 andMessage:(uint64_t)a4 forKey:(uint64_t)a5 andValue:(uint64_t)a6 additionalDetail:
{
  if (result)
  {
    unint64_t v11 = (void *)result;
    uint64_t v12 = (void *)[MEMORY[0x189603FC8] dictionaryWithCapacity:4];
    uint64_t v13 = v12;
    if (a6) {
      [v12 addEntriesFromDictionary:a6];
    }
    BOOL v14 = (void *)MEMORY[0x189603FC8];
    if (!a5) {
      a5 = [MEMORY[0x189603FE8] null];
    }
    objc_msgSend( v13,  "addEntriesFromDictionary:",  objc_msgSend( v14,  "dictionaryWithObjectsAndKeys:",  v11,  @"NSValidationErrorObject",  a4,  @"NSValidationErrorKey",  a5,  @"NSValidationErrorValue",  0));
    uint64_t v15 = (void *)MEMORY[0x189607460];
    if (!a3) {
      a3 = (void *)objc_msgSend( (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  a2,  0),  "localizedDescription");
    }
    id v16 = (void *)[v11 entity];
    if (v16) {
      uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "propertiesByName"), "objectForKey:", a4);
    }
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = -[NSManagedObject _substituteEntityAndProperty:inString:](v11, v17, a3);
    if (v18) {
      [v13 setObject:v18 forKey:*MEMORY[0x1896075E0]];
    }
    return [MEMORY[0x189607870] errorWithDomain:*v15 code:a2 userInfo:v13];
  }

  return result;
}

- (void)_chainNewError:(uint64_t *)a3 toOriginalErrorDoublePointer:
{
  if (result && a2 && a3)
  {
    BOOL result = (void *)*a3;
    if (*a3)
    {
      CFStringRef v5 = (void *)objc_msgSend((id)objc_msgSend(result, "userInfo"), "valueForKey:", @"NSDetailedErrors");
      if (!v5)
      {
        CFStringRef v5 = (void *)[MEMORY[0x189603FA8] arrayWithObject:*a3];
        *a3 = objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  1560,  objc_msgSend(MEMORY[0x189603FC8], "dictionaryWithObject:forKey:", v5, @"NSDetailedErrors"));
      }

      return (void *)[v5 addObject:a2];
    }

    else
    {
      *a3 = a2;
    }
  }

  return result;
}

- (BOOL)validateForInsert:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([_PFEntityForManagedObject(self) _skipValidation]) {
    return 1;
  }
  else {
    return -[NSManagedObject _validateForSave:](self, error);
  }
}

- (uint64_t)_validateForSave:(void *)a1
{
  if (!a1)
  {
LABEL_25:
    char v18 = 0;
    return v18 & 1;
  }

  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__validateForSave_);
  }
  uint64_t v26 = 0LL;
  if ((*((_BYTE *)a1 + 17) & 0x80) != 0) {
    -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, a1, a1[4]);
  }
  unint64_t v25 = a2;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__validatePropertiesWithError_);
  }
  uint64_t v4 = (unint64_t *)_PFEntityForManagedObject(a1);
  CFStringRef v5 = (unint64_t *)v4[14];
  uint64_t v6 = *(void *)(v4[13] + 40);
  uint64_t v7 = _kvcPropertysPrimitiveGetters(v4);
  uint64_t v23 = _kvcPropertysPublicSetters(v4);
  unint64_t v8 = v4[12];
  unint64_t v10 = *v5;
  unint64_t v9 = v5[1];
  int v11 = -[objc_class _useFastValidationMethod](object_getClass(a1), "_useFastValidationMethod");
  if (v10 >= v9 + v10)
  {
    char v18 = 1;
    return v18 & 1;
  }

  int v16 = v11;
  unint64_t v24 = v8 + 24;
  if (v25) {
    uint64_t v17 = &v28;
  }
  else {
    uint64_t v17 = 0LL;
  }
  char v18 = 1;
  do
  {
    uint64_t v28 = 0LL;
    uint64_t v19 = *(void *)(v6 + 8 * v10);
    _PF_Handler_Primitive_GetProperty((id **)a1, v10, v19, *(void *)(v7 + 8 * v10), v12, v13, v14, v15);
    int v21 = v20;
    uint64_t v27 = v20;
    if (v16)
    {
      if (-[NSManagedObject _validateValue:forProperty:andKey:withIndex:error:]( a1,  (uint64_t *)&v27,  *(void **)(v24 + 8 * v10),  v19,  v10,  v17))
      {
        goto LABEL_18;
      }
    }

    else if ([a1 validateValue:&v27 forKey:v19 error:v17])
    {
LABEL_18:
      if (v21 != v27 && (objc_msgSend(v21, "isEqual:") & 1) == 0) {
        _PF_Handler_Public_SetProperty((unsigned int *)a1, v10, v27, v19, *(void **)(v23 + 8 * v10));
      }
      goto LABEL_21;
    }

    if (!v25) {
      goto LABEL_25;
    }
    -[NSManagedObject _chainNewError:toOriginalErrorDoublePointer:](a1, v28, &v26);
    char v18 = 0;
LABEL_21:
    ++v10;
    --v9;
  }

  while (v9);
  if (!((v25 == 0LL) | v18 & 1))
  {
    char v18 = 0;
    void *v25 = v26;
  }

  return v18 & 1;
}

- (BOOL)validateForUpdate:(NSError *)error
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ([_PFEntityForManagedObject(self) _skipValidation]) {
    return 1;
  }
  else {
    return -[NSManagedObject _validateForSave:](self, error);
  }
}

- (id)mutableArrayValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5
    && (uint64_t v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "objectForKey:", a3)) != 0
    && ((uint64_t v7 = v6, ![v6 isTransient]) || objc_msgSend(v7, "_propertyType") == 3))
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"NSManagedObjects of entity '%@' do not support -mutableArrayValueForKey: for the property '%@'", -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0 reason userInfo]);
    return -[NSManagedObject mutableSetValueForKey:](v9, v10, v11);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    return -[NSManagedObject mutableArrayValueForKey:](&v12, sel_mutableArrayValueForKey_, a3);
  }

- (id)mutableSetValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, unint64_t v7 = [*((id *)v5 + 13) indexForKey:a3], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v7;
    SEL v10 = (void *)v6[14];
    unint64_t v11 = v10[14];
    BOOL v13 = v7 >= v11;
    unint64_t v12 = v7 - v11;
    BOOL v13 = !v13 || v12 >= v10[15];
    if (v13
      && ((v15 = v10[22], v14 = v10[23], BOOL v13 = v7 >= v15, v16 = v7 - v15, v13) ? (v17 = v16 >= v14) : (v17 = 1), v17))
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"NSManagedObjects of entity '%@' do not support -mutableSetValueForKey: for the property '%@'", -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0 reason userInfo]);
      return -[NSManagedObject mutableOrderedSetValueForKey:](v20, v21, v22);
    }

    else
    {
      unsigned int cd_stateFlags = self->_cd_stateFlags;
      if ((cd_stateFlags & 0x40) == 0) {
        -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a3);
      }
      _kvcPropertysPublicGetters(v6);
      id v19 = -[NSManagedObject _genericMutableSetValueForKey:withIndex:flags:]( self,  "_genericMutableSetValueForKey:withIndex:flags:",  a3,  v9,  0LL);
      if ((cd_stateFlags & 0x40) == 0) {
        -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a3);
      }
      return v19;
    }
  }

  else
  {
    object_getClass(self);
    _NSKeyValueMutableSetGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }

- (id)mutableOrderedSetValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (!v5
    || (v6 = (unint64_t *)v5, unint64_t v7 = [*((id *)v5 + 13) indexForKey:a3], v7 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    return -[NSManagedObject mutableOrderedSetValueForKey:](&v23, sel_mutableOrderedSetValueForKey_, a3);
  }

  unint64_t v9 = v7;
  SEL v10 = (void *)v6[14];
  unint64_t v11 = v10[16];
  BOOL v13 = v7 >= v11;
  unint64_t v12 = v7 - v11;
  BOOL v13 = !v13 || v12 >= v10[17];
  if (!v13
    || ((v15 = v10[24], v14 = v10[25], BOOL v13 = v7 >= v15, v16 = v7 - v15, v13) ? (v17 = v16 >= v14) : (v17 = 1), !v17))
  {
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0) {
      -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a3);
    }
    _kvcPropertysPublicGetters(v6);
    id v8 = -[NSManagedObject _genericMutableOrderedSetValueForKey:withIndex:flags:]( self,  "_genericMutableOrderedSetValueForKey:withIndex:flags:",  a3,  v9,  0LL);
    if ((cd_stateFlags & 0x40) == 0) {
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a3);
    }
    return v8;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], objc_msgSend( NSString, "stringWithFormat:", @"NSManagedObjects of entity '%@' do not support -mutableOrderedSetValueForKey: for the property '%@'", -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3), 0 reason userInfo]);
  return -[NSManagedObject valueForKey:](v20, v21, v22);
}

- (id)valueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, uint64_t v7 = [*((id *)v5 + 13) indexForKey:key],
                                     v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v9 = v7;
    uint64_t v10 = *(void *)(_kvcPropertysPublicGetters(v6) + 8 * v7);
    return _PF_Handler_Public_GetProperty((id **)self, v9, (uint64_t)key, v10);
  }

  else
  {
    object_getClass(self);
    _NSKeyValueGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }

- (void)setValue:(id)value forKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v7 = _PFEntityForManagedObject(self);
  if (v7
    && (id v8 = (unint64_t *)v7, v9 = [*((id *)v7 + 13) indexForKey:key],
                                     v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v10 = v9;
    unint64_t v11 = *(void **)(_kvcPropertysPublicSetters(v8) + 8 * v9);
    _PF_Handler_Public_SetProperty((unsigned int *)self, v10, value, (uint64_t)key, v11);
  }

  else
  {
    object_getClass(self);
    _NSKeyValueSetterForClassAndKey();
    _NSSetUsingKeyValueSetter();
  }

- (id)primitiveValueForKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = (unint64_t *)_PFEntityForManagedObject(self);
  if (v5
    && ((v6 = v5, id v7 = (void *)v5[13], !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      ? (uint64_t v8 = [v7 indexForKey:key])
      : (uint64_t v8 = [v7 fastIndexForKnownKey:key]),
        uint64_t v9 = v8,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (!*(void *)(_kvcPropertysPrimitiveGetters(v6) + 8 * v8)) {
      return -[NSManagedObject _genericValueForKey:withIndex:flags:]( self,  "_genericValueForKey:withIndex:flags:",  key,  v9,  0LL);
    }
  }

  else
  {
    object_getClass(self);
    _NSKeyValuePrimitiveGetterForClassAndKey();
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if ((self->_cd_stateFlags & 0x8000) != 0) {
    [(id)_insertion_fault_handler fulfillFault:self withContext:self->_cd_managedObjectContext forIndex:v9];
  }
  return (id)_NSGetUsingKeyValueGetter();
}

- (void)setPrimitiveValue:(id)value forKey:(NSString *)key
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v7 = _PFEntityForManagedObject(self);
  if (v7
    && ((uint64_t v8 = (uint64_t)v7, v9 = (void *)v7[13], !(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
      ? (uint64_t v10 = [v9 indexForKey:key])
      : (uint64_t v10 = [v9 fastIndexForKnownKey:key]),
        uint64_t v11 = v10,
        v10 != 0x7FFFFFFFFFFFFFFFLL))
  {
    if (!*(void *)(_kvcPropertysPrimitiveSetters(v8) + 8 * v10))
    {
      -[NSManagedObject _setGenericValue:forKey:withIndex:flags:]( self,  "_setGenericValue:forKey:withIndex:flags:",  value,  key,  v11,  0LL);
      return;
    }
  }

  else
  {
    object_getClass(self);
    _NSKeyValuePrimitiveSetterForClassAndKey();
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if ((self->_cd_stateFlags & 0x8000) != 0) {
    [(id)_insertion_fault_handler fulfillFault:self withContext:self->_cd_managedObjectContext forIndex:v11];
  }
  _NSSetUsingKeyValueSetter();
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = (unint64_t *)_PFEntityForManagedObject(self);
  if (!v5)
  {
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    -[NSManagedObject setValuesForKeysWithDictionary:](&v29, sel_setValuesForKeysWithDictionary_, a3);
    return;
  }

  uint64_t v6 = v5;
  id v7 = (void *)v5[12];
  id v28 = (id)v5[13];
  uint64_t v26 = _kvcPropertysPublicGetters(v5);
  uint64_t v24 = _kvcPropertysPublicSetters(v6);
  uint64_t v25 = [v7 values];
  uint64_t v27 = [MEMORY[0x189603FE8] null];
  unint64_t v8 = [a3 count];
  unint64_t v9 = MEMORY[0x1895F8858](v8);
  unint64_t v12 = (char *)v23 - v11;
  size_t v13 = 8 * v10;
  if (v9 >= 0x201)
  {
    unint64_t v12 = (char *)NSAllocateScannedUncollectable();
    unint64_t v15 = (char *)NSAllocateScannedUncollectable();
    [a3 getObjects:v15 andKeys:v12];
  }

  else
  {
    bzero((char *)v23 - v11, 8 * v10);
    MEMORY[0x1895F8858](v14);
    unint64_t v15 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v15, v13);
    [a3 getObjects:v15 andKeys:v12];
    if (!v8) {
      return;
    }
  }

  v23[1] = v23;
  uint64_t v16 = 0LL;
  do
  {
    uint64_t v17 = *(void *)&v12[8 * v16];
    if (*(void *)&v15[8 * v16] == v27) {
      id v18 = 0LL;
    }
    else {
      id v18 = *(id *)&v15[8 * v16];
    }
    unint64_t v19 = [v28 indexForKey:*(void *)&v12[8 * v16]];
    unint64_t v20 = v19;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      id Property = -[NSManagedObject valueForKey:](self, "valueForKey:", v17);
    }
    else {
      id Property = _PF_Handler_Public_GetProperty((id **)self, v19, v17, *(void *)(v26 + 8 * v19));
    }
    id v22 = Property;
    if (v18 != Property && ([Property isEqual:v18] & 1) == 0)
    {
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSManagedObject setValue:forKey:](self, "setValue:forKey:", v18, v17);
      }

      else if ([*(id *)(v25 + 8 * v20) _isToManyRelationship])
      {
        -[NSManagedObject _updateToManyRelationship:from:to:with:](self, v17, v22, v18, v22);
      }

      else
      {
        _PF_Handler_Public_SetProperty((unsigned int *)self, v20, v18, v17, *(void **)(v24 + 8 * v20));
      }
    }

    ++v16;
  }

  while (v8 != v16);
  if (v8 >= 0x201)
  {
    NSZoneFree(0LL, v12);
    NSZoneFree(0LL, v15);
  }

- (void)_updateToManyRelationship:(void *)a3 from:(void *)a4 to:(void *)a5 with:
{
  if (a1)
  {
    if ([a3 isNSOrderedSet])
    {
      id v23 = 0LL;
      id v24 = 0LL;
      id v21 = 0LL;
      id v22 = 0LL;
      id v20 = 0LL;
      -[NSManagedObject diffOrderedSets:::::::](a3, a4, &v24, &v23, &v22, &v21, &v20);
      id v10 = v24;
      if ([v24 count])
      {
        [a1 willChange:3 valuesAtIndexes:v10 forKey:a2];
        [a5 removeObjectsAtIndexes:v10];
        [a1 didChange:3 valuesAtIndexes:v10 forKey:a2];
      }

      id v11 = v23;
      if ([v23 count])
      {
        [a1 willChange:2 valuesAtIndexes:v11 forKey:a2];
        [a5 insertObjects:v22 atIndexes:v11];
        [a1 didChange:2 valuesAtIndexes:v11 forKey:a2];
      }

      id v12 = v21;
      if ([v21 count])
      {
        [a1 willChange:4 valuesAtIndexes:v12 forKey:a2];
        id v13 = v20;
        [a5 removeObjectsInArray:v20];
        if ([a5 count]) {
          [a5 insertObjects:v13 atIndexes:v12];
        }
        else {
          [a5 addObjectsFromArray:v13];
        }
        [a1 didChange:4 valuesAtIndexes:v12 forKey:a2];
      }
    }

    else
    {
      if ([a4 count] && (uint64_t v14 = (void *)objc_msgSend(a4, "mutableCopy")) != 0)
      {
        id v18 = v14;
        [v14 minusSet:a3];
      }

      else
      {
        id v18 = 0LL;
      }

      if (objc_msgSend(a3, "count", v18))
      {
        unint64_t v15 = (void *)[a3 mutableCopy];
        uint64_t v16 = v15;
        if (v15)
        {
          if (a4) {
            uint64_t v17 = (uint64_t)a4;
          }
          else {
            uint64_t v17 = NSSet_EmptySet;
          }
          [v15 minusSet:v17];
        }
      }

      else
      {
        uint64_t v16 = 0LL;
      }

      if ([v16 count])
      {
        [a1 willChangeValueForKey:a2 withSetMutation:2 usingObjects:v16];
        [a5 minusSet:v16];
        [a1 didChangeValueForKey:a2 withSetMutation:2 usingObjects:v16];
      }

      if ([v19 count])
      {
        [a1 willChangeValueForKey:a2 withSetMutation:1 usingObjects:v19];
        [a5 unionSet:v19];
        [a1 didChangeValueForKey:a2 withSetMutation:1 usingObjects:v19];
      }
    }
  }

- (id)dictionaryWithPropertyValues
{
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }

  else if (!self)
  {
    char v3 = 0LL;
    return v3;
  }

  char v3 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( self,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  0);
  return v3;
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (!v5)
  {
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___NSManagedObject;
    return -[NSManagedObject dictionaryWithValuesForKeys:](&v28, sel_dictionaryWithValuesForKeys_, a3);
  }

  uint64_t v6 = v5;
  uint64_t v7 = [a3 count];
  if (a3)
  {
    unint64_t v8 = v7;
    if (!v7) {
      return (id)NSDictionary_EmptyDictionary;
    }
    MEMORY[0x1895F8858](v7);
    id v10 = (char *)&v25 - v9;
    uint64_t v25 = v11;
    if (v8 > 0x200)
    {
      id v10 = (char *)NSAllocateScannedUncollectable();
      id v13 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v25 - v9, 8 * v8);
      MEMORY[0x1895F8858](v12);
      id v13 = (char *)&v25 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v13, 8 * v8);
    }

    objc_msgSend(a3, "getObjects:range:", v10, 0, v8, v25);
    uint64_t v16 = (void *)v6[13];
    uint64_t v17 = (void *)[v6 propertiesByName];
    uint64_t v27 = _kvcPropertysPublicGetters(v6);
    uint64_t v26 = [v17 values];
    uint64_t v18 = [MEMORY[0x189603FE8] null];
    uint64_t v19 = 0LL;
    do
    {
      uint64_t v20 = *(void *)&v10[8 * v19];
      unint64_t v21 = [v16 indexForKey:v20];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id Property = -[NSManagedObject valueForKey:](self, "valueForKey:", v20);
      }

      else
      {
        unint64_t v23 = v21;
        id Property = _PF_Handler_Public_GetProperty((id **)self, v21, v20, *(void *)(v27 + 8 * v21));
        if ([Property isFault]
          && [*(id *)(v26 + 8 * v23) _isToManyRelationship])
        {
          [Property count];
        }
      }

      if (Property) {
        uint64_t v24 = (uint64_t)Property;
      }
      else {
        uint64_t v24 = v18;
      }
      *(void *)&v13[8 * v19++] = v24;
    }

    while (v8 != v19);
    id v14 = (id)[objc_alloc(MEMORY[0x189603F68]) initWithObjects:v13 forKeys:v10 count:v8];
    if (v8 >= 0x201)
    {
      NSZoneFree(0LL, v13);
      NSZoneFree(0LL, v10);
    }

    return v14;
  }

  if (self) {
    return  -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( self,  __const__newAllPropertiesWithRelationshipFaultsIntact___simple,  __const__newAllPropertiesWithRelationshipFaultsIntact___complex,  0);
  }
  else {
    return 0LL;
  }
}

- (NSDictionary)committedValuesForKeys:(NSArray *)keys
{
  v47[1] = *MEMORY[0x1895F89C0];
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if (-[NSManagedObject isInserted](self, "isInserted")) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  if (self && (cd_extras = self->_cd_extras) != 0LL) {
    var1 = (NSKnownKeysDictionary *)cd_extras->var1;
  }
  else {
    var1 = 0LL;
  }
  unint64_t v8 = _PFEntityForManagedObject(self);
  uint64_t v9 = v8;
  if (v8) {
    uint64_t v10 = v8[12];
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = NSKeyValueCoding_NullValue;
  NSUInteger v12 = -[NSArray count](keys, "count");
  if (v12)
  {
    unint64_t v13 = v12;
    uint64_t v44 = (NSKnownKeysDictionary *)&v43;
    unint64_t v14 = MEMORY[0x1895F8858](v12);
    uint64_t v16 = (char *)&v43 - v15;
    size_t v17 = 8 * v14;
    if (v14 > 0x200)
    {
      uint64_t v16 = (char *)NSAllocateScannedUncollectable();
      uint64_t v19 = (char *)NSAllocateScannedUncollectable();
    }

    else
    {
      bzero((char *)&v43 - v15, v17);
      MEMORY[0x1895F8858](v18);
      uint64_t v19 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      bzero(v19, v17);
    }

    uint64_t v46 = v10 + 24;
    -[NSArray getObjects:range:](keys, "getObjects:range:", v16, 0LL, v13);
    unint64_t v21 = var1;
    if (self)
    {
      unint64_t v21 = var1;
      if (!var1)
      {
        v47[0] = 0x900000001LL;
        unint64_t v21 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( self,  dword_1868D5D48,  (unsigned int *)v47,  1);
      }
    }

    uint64_t v45 = (uint64_t)var1;
    id v22 = -[NSKnownKeysDictionary mapping](v21, "mapping");
    uint64_t v43 = v21;
    uint64_t v23 = -[NSKnownKeysDictionary values](v21, "values");
    for (uint64_t i = 0LL; i != v13; ++i)
    {
      uint64_t v25 = -[NSKnownKeysMappingStrategy indexForKey:](v22, "indexForKey:", *(void *)&v16[8 * i]);
      uint64_t v26 = v11;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = *(void **)(v23 + 8 * v25);
        objc_super v28 = *(void **)(v46 + 8 * v25);
        char v29 = [v28 isTransient];
        uint64_t v26 = v11;
        if ((v29 & 1) == 0)
        {
          if (v27) {
            uint64_t v26 = (uint64_t)v27;
          }
          else {
            uint64_t v26 = v11;
          }
        }
      }

      *(void *)&v19[8 * i] = v26;
    }

    p_super = (NSDictionary *)(id)[objc_alloc(MEMORY[0x189603F68]) initWithObjects:v19 forKeys:v16 count:v13];
    if (v13 >= 0x201)
    {
      NSZoneFree(0LL, v19);
      NSZoneFree(0LL, v16);
    }

    if (!v45) {
  }
    }

  else if (var1)
  {
    uint64_t v46 = -[NSKnownKeysDictionary values](var1, "values");
    uint64_t v44 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  -[NSKnownKeysDictionary mapping](var1, "mapping"));
    uint64_t v45 = -[NSKnownKeysDictionary values](v44, "values");
    if (v9) {
      uint64_t v20 = v9[14];
    }
    else {
      uint64_t v20 = 0LL;
    }
    uint64_t v31 = 0LL;
    uint64_t v32 = v10 + 24;
    do
    {
      int v33 = (uint64_t *)(v20 + 16LL * dword_1868D5CE0[v31]);
      uint64_t v34 = *v33;
      uint64_t v35 = v33[1];
      if (*v33 < (unint64_t)(v35 + *v33))
      {
        uint64_t v36 = (void *)(v45 + 8 * v34);
        uint64_t v37 = (void **)(v46 + 8 * v34);
        uint64_t v38 = (id *)(v32 + 8 * v34);
        do
        {
          id v39 = *v38;
          if (([*v38 isTransient] & 1) == 0)
          {
            uint64_t v40 = *v37;
            if ([v39 _isToManyRelationship])
            {
              [v40 count];
              id v41 = (id)v11;
              if (v40) {
                id v41 = (id)[v40 copy];
              }
            }

            else
            {
              id v41 = (id)v11;
              if (v40) {
                id v41 = v40;
              }
            }

            *uint64_t v36 = v41;
          }

          ++v36;
          ++v37;
          ++v38;
          --v35;
        }

        while (v35);
      }

      ++v31;
    }

    while (v31 != 3);
    p_super = &v44->super.super;
    uint64_t v42 = v44;
  }

  else
  {
    if (self)
    {
      v47[0] = 0x900000001LL;
      return (NSDictionary *) -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( self,  dword_1868D5D48,  (unsigned int *)v47,  0);
    }

    return 0LL;
  }

  return p_super;
}

- (NSDictionary)changedValues
{
  unsigned int v2 = self;
  if (_PF_Threading_Debugging_level) {
    self = (NSManagedObject *)_PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ((v2->_cd_stateFlags & 0x8000) != 0) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  cd_extras = v2->_cd_extras;
  if (!cd_extras || !cd_extras->var1) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  uint64_t v4 = NSDictionary_EmptyDictionary;
  context = (void *)MEMORY[0x186E3E5D8](self, a2);
  id v5 = (unint64_t *)_PFEntityForManagedObject(v2);
  uint64_t v6 = v5;
  if (v5) {
    unint64_t v7 = v5[13];
  }
  else {
    unint64_t v7 = 0LL;
  }
  uint64_t v9 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v7);
  uint64_t v10 = _kvcPropertysPrimitiveGetters(v6);
  uint64_t v37 = v4;
  if (v6) {
    unint64_t v41 = v6[14];
  }
  else {
    unint64_t v41 = 0LL;
  }
  uint64_t v11 = NSKeyValueCoding_NullValue;
  NSUInteger v12 = v2->_cd_extras;
  if (v12) {
    id var1 = v12->var1;
  }
  else {
    id var1 = 0LL;
  }
  uint64_t v14 = objc_msgSend(var1, "values", v37);
  id v39 = v9;
  uint64_t v43 = -[NSKnownKeysDictionary values](v9, "values");
  uint64_t v19 = 0LL;
  char v20 = 1;
  do
  {
    char v42 = v20;
    unint64_t v21 = (unint64_t *)(v41 + 16LL * dword_1868D5CE0[v19]);
    unint64_t v23 = *v21;
    unint64_t v22 = v21[1];
    if (*v21 < v22 + *v21)
    {
      do
      {
        if (*(void *)(v14 + 8 * v23) == v11) {
          uint64_t v24 = 0LL;
        }
        else {
          uint64_t v24 = *(void **)(v14 + 8 * v23);
        }
        _PF_Handler_Primitive_GetProperty((id **)v2, v23, 0LL, *(void *)(v10 + 8 * v23), v15, v16, v17, v18);
        if (v24 != v25)
        {
          uint64_t v26 = v25;
          if (([*(id *)(v6[12] + 24 + 8 * v23) _epsilonEquals:v25 rhs:v24 withFlags:1] & 1) == 0)
          {
            id v27 = (id)v11;
            if (v26) {
              id v27 = v26;
            }
            *(void *)(v43 + 8 * v23) = v27;
          }
        }

        ++v23;
        --v22;
      }

      while (v22);
    }

    char v20 = 0;
    uint64_t v19 = 1LL;
  }

  while ((v42 & 1) != 0);
  unint64_t v29 = *(void *)(v41 + 144);
  uint64_t v28 = *(void *)(v41 + 152);
  if (v29 < v28 + v29)
  {
    do
    {
      if (*(void *)(v14 + 8 * v29) == v11) {
        uint64_t v30 = 0LL;
      }
      else {
        uint64_t v30 = *(void **)(v14 + 8 * v29);
      }
      _PF_Handler_Primitive_GetProperty((id **)v2, v29, 0LL, *(void *)(v10 + 8 * v29), v15, v16, v17, v18);
      uint64_t v32 = v31;
      int v33 = [v30 isFault];
      if ((v33 & [v32 isFault] & 1) == 0
        && v30 != v32
        && ([v32 isEqual:v30] & 1) == 0)
      {
        uint64_t v34 = v11;
        if (v32) {
          uint64_t v34 = [v32 copy];
        }
        *(void *)(v43 + 8 * v29) = v34;
      }

      ++v29;
      --v28;
    }

    while (v28);
  }

  if (-[NSKnownKeysDictionary count](v39, "count"))
  {
    uint64_t v35 = v39;
  }

  else
  {

    uint64_t v35 = v38;
  }

  uint64_t v36 = v35;
  objc_autoreleasePoolPop(context);
  return (NSDictionary *)v35;
}

- (id)mergeableStringValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v5 = _PFEntityForManagedObject(self);
  if (v5
    && (v6 = (unint64_t *)v5, uint64_t v7 = [*((id *)v5 + 13) indexForKey:a3], v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v9 = v7;
    unsigned int cd_stateFlags = self->_cd_stateFlags;
    if ((cd_stateFlags & 0x40) == 0) {
      -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", a3);
    }
    _kvcPropertysPublicGetters(v6);
    id v11 = -[NSManagedObject _genericMergeableStringValueForKey:withIndex:]( self,  "_genericMergeableStringValueForKey:withIndex:",  a3,  v9);
    if ((cd_stateFlags & 0x40) == 0) {
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", a3);
    }
    return v11;
  }

  else
  {
    object_getClass(self);
    _NSKeyValueMutableSetGetterForClassAndKey();
    return (id)_NSGetUsingKeyValueGetter();
  }

- (id)valueForUndefinedKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v5 = [NSString stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key %@.", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3];
  id v6 = objc_alloc(MEMORY[0x189603F68]);
  if (!a3) {
    a3 = (id)[MEMORY[0x189603FE8] null];
  }
  uint64_t v7 = (void *)objc_msgSend( v6,  "initWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  a3,  @"NSUnknownUserInfoKey",  0);
  unint64_t v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189607790] reason:v5 userInfo:v7];

  [v8 raise];
  return 0LL;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v6 = [NSString stringWithFormat:@"[<%@ %p> setValue:forUndefinedKey:]: the entity %@ is not key value coding-compliant for the key %@.", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a4];
  id v7 = objc_alloc(MEMORY[0x189603F68]);
  if (!a4) {
    a4 = (id)[MEMORY[0x189603FE8] null];
  }
  unint64_t v8 = (void *)objc_msgSend( v7,  "initWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  a4,  @"NSUnknownUserInfoKey",  0);
  uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189607790] reason:v6 userInfo:v8];

  [v9 raise];
}

- (void)setNilValueForKey:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v5 = (id *)_PFEntityForManagedObject(self);
  if (v5 && (uint64_t v6 = [v5[13] indexForKey:a3], v6 != 0x7FFFFFFFFFFFFFFFLL)) {
    _PF_Handler_SetNilValueForKeyIndex((char **)self, (uint64_t)a3, v6);
  }
  else {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"[<%@ %p> setNilValueForKey]: instance of entity %@ could not set nil as the value for the key %@.", objc_opt_class(), self, -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name"), a3 format];
  }
}

- (NSUInteger)faultingState
{
  return ((unint64_t)self->_cd_stateFlags >> 15) & 7;
}

- (NSDictionary)changedValuesForCurrentEvent
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  if ((self->_cd_stateFlags & 0x8000) != 0) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  cd_extras = self->_cd_extras;
  if (!cd_extras || !cd_extras->var3 && !cd_extras->var2) {
    return (NSDictionary *)NSDictionary_EmptyDictionary;
  }
  uint64_t v4 = NSDictionary_EmptyDictionary;
  uint64_t v5 = (unint64_t *)_PFEntityForManagedObject(self);
  uint64_t v6 = v5;
  if (v5) {
    unint64_t v7 = v5[13];
  }
  else {
    unint64_t v7 = 0LL;
  }
  uint64_t v9 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v7);
  uint64_t v10 = _kvcPropertysPrimitiveGetters(v6);
  uint64_t v37 = (NSDictionary *)v4;
  if (v6) {
    unint64_t v11 = v6[14];
  }
  else {
    unint64_t v11 = 0LL;
  }
  uint64_t v12 = NSKeyValueCoding_NullValue;
  unint64_t v13 = self->_cd_extras;
  if (v13)
  {
    id var3 = v13->var3;
    if (!var3) {
      id var3 = v13->var2;
    }
  }

  else
  {
    id var3 = 0LL;
  }

  uint64_t v15 = [var3 values];
  uint64_t v38 = v9;
  uint64_t v41 = -[NSKnownKeysDictionary values](v9, "values");
  uint64_t v20 = 0LL;
  unint64_t v39 = v11;
  do
  {
    unint64_t v21 = (unint64_t *)(v11 + 16LL * dword_1868D5CCC[v20]);
    unint64_t v23 = *v21;
    unint64_t v22 = v21[1];
    if (*v21 < v22 + *v21)
    {
      do
      {
        if (*(void *)(v15 + 8 * v23) == v12) {
          uint64_t v24 = 0LL;
        }
        else {
          uint64_t v24 = *(void **)(v15 + 8 * v23);
        }
        _PF_Handler_Primitive_GetProperty((id **)self, v23, 0LL, *(void *)(v10 + 8 * v23), v16, v17, v18, v19);
        if (v24 != v25
          && ([*(id *)(v6[12] + 24 + 8 * v23) _epsilonEquals:v25 rhs:v24 withFlags:1] & 1) == 0)
        {
          id v26 = (id)v12;
          if (v24) {
            id v26 = v24;
          }
          *(void *)(v41 + 8 * v23) = v26;
        }

        ++v23;
        --v22;
      }

      while (v22);
    }

    ++v20;
    unint64_t v11 = v39;
  }

  while (v20 != 3);
  char v27 = 0;
  uint64_t v28 = 3LL;
  do
  {
    char v40 = v27;
    unint64_t v29 = (unint64_t *)(v39 + 16LL * dword_1868D5CCC[v28]);
    unint64_t v31 = *v29;
    unint64_t v30 = v29[1];
    if (*v29 < v30 + *v29)
    {
      do
      {
        if (*(void *)(v15 + 8 * v31) == v12) {
          uint64_t v32 = 0LL;
        }
        else {
          uint64_t v32 = *(void **)(v15 + 8 * v31);
        }
        _PF_Handler_Primitive_GetProperty((id **)self, v31, 0LL, *(void *)(v10 + 8 * v31), v16, v17, v18, v19);
        uint64_t v34 = v33;
        int v35 = [v32 isFault];
        if ((v35 & [v34 isFault] & 1) == 0
          && v32 != v34
          && ([v34 isEqual:v32] & 1) == 0)
        {
          uint64_t v36 = v12;
          if (v32) {
            uint64_t v36 = [v32 copy];
          }
          *(void *)(v41 + 8 * v31) = v36;
        }

        ++v31;
        --v30;
      }

      while (v30);
    }

    char v27 = 1;
    uint64_t v28 = 4LL;
  }

  while ((v40 & 1) == 0);
  if (-[NSKnownKeysDictionary count](v38, "count")) {
    return (NSDictionary *)v38;
  }

  return v37;
}

- (BOOL)hasChanges
{
  return (self->_cd_stateFlags & 0x3F) != 0;
}

- (BOOL)hasPersistentChangedValues
{
  if ((self->_cd_stateFlags & 0x3F) == 0 || (self->_cd_stateFlags & 0x8000) != 0) {
    return 0;
  }
  cd_extras = self->_cd_extras;
  if (!cd_extras || !cd_extras->var1) {
    return 0;
  }
  uint64_t v5 = (unint64_t *)_PFEntityForManagedObject(self);
  uint64_t v6 = _kvcPropertysPrimitiveGetters(v5);
  if (v5) {
    unint64_t v30 = v5[14];
  }
  else {
    unint64_t v30 = 0LL;
  }
  unint64_t v7 = self->_cd_extras;
  if (v7) {
    id var1 = v7->var1;
  }
  else {
    id var1 = 0LL;
  }
  uint64_t v9 = NSKeyValueCoding_NullValue;
  uint64_t v14 = objc_msgSend(var1, "values", v30);
  uint64_t v15 = 0LL;
  char v16 = 1;
  BOOL v17 = 1;
  do
  {
    char v32 = v16;
    uint64_t v18 = (unint64_t *)(v31 + 16LL * dword_1868D5CE0[v15]);
    unint64_t v19 = *v18;
    unint64_t v20 = v18[1];
    if (*v18 < v20 + *v18)
    {
      do
      {
        uint64_t v21 = *(void *)(v14 + 8 * v19) == v9 ? 0LL : *(void *)(v14 + 8 * v19);
        _PF_Handler_Primitive_GetProperty((id **)self, v19, 0LL, *(void *)(v6 + 8 * v19), v10, v11, v12, v13);
        if (v21 != v22
          && ![*(id *)(v5[12] + 24 + 8 * v19) _epsilonEquals:v22 rhs:v21 withFlags:1])
        {
          return v17;
        }

        ++v19;
      }

      while (--v20);
    }

    char v16 = 0;
    uint64_t v15 = 1LL;
  }

  while ((v32 & 1) != 0);
  unint64_t v23 = *(void *)(v31 + 144);
  uint64_t v24 = *(void *)(v31 + 152);
  if (v23 >= v24 + v23) {
    return 0;
  }
  while (1)
  {
    uint64_t v25 = *(void *)(v14 + 8 * v23) == v9 ? 0LL : *(void **)(v14 + 8 * v23);
    _PF_Handler_Primitive_GetProperty((id **)self, v23, 0LL, *(void *)(v6 + 8 * v23), v10, v11, v12, v13);
    char v27 = v26;
    int v28 = [v25 isFault];
    if ((v28 & [v27 isFault] & 1) == 0
      && v25 != v27
      && ![v27 isEqual:v25])
    {
      break;
    }

    BOOL v17 = 0;
    ++v23;
    if (!--v24) {
      return v17;
    }
  }

  return 1;
}

- (NSArray)objectIDsForRelationshipNamed:(NSString *)key
{
  char v3 = key;
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!_PF_Threading_Debugging_level)
  {
    if (key) {
      goto LABEL_3;
    }
LABEL_42:
    CFStringRef v5 = 0LL;
    goto LABEL_43;
  }

  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  if (!v3) {
    goto LABEL_42;
  }
LABEL_3:
  v47.length = CFStringGetLength((CFStringRef)v3);
  v47.location = 0LL;
  if (CFStringFindWithOptions((CFStringRef)v3, @".", v47, 0LL, &result))
  {
    v48.length = result.location;
    v48.location = 0LL;
    CFStringRef v5 = CFStringCreateWithSubstring(0LL, (CFStringRef)v3, v48);
    char v3 = (NSString *)v5;
  }

  else
  {
    CFStringRef v5 = 0LL;
  }

  id v6 = _PFEntityForManagedObject(self);
  if (!v6
    || (unint64_t v7 = (unint64_t *)v6, v8 = [*((id *)v6 + 13) indexForKey:v3], v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_43:
    char v32 = (void *)NSString;
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = -[NSEntityDescription name](-[NSManagedObject entity](self, "entity"), "name");
    int v35 = @"<null>";
    if (v3) {
      int v35 = (const __CFString *)v3;
    }
    uint64_t v36 = [v32 stringWithFormat:@"[<%@ %p> valueForUndefinedKey:]: the entity %@ is not key value coding-compliant for the key %@.", v33, self, v34, v35];
    id v37 = objc_alloc(MEMORY[0x189603F68]);
    if (!v3) {
      char v3 = (NSString *)[MEMORY[0x189603FE8] null];
    }
    uint64_t v38 = (void *)objc_msgSend( v37,  "initWithObjectsAndKeys:",  self,  @"NSTargetObjectUserInfoKey",  v3,  @"NSUnknownUserInfoKey",  0);
    unint64_t v39 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189607790] reason:v36 userInfo:v38];

    if (v5) {
      CFRelease(v5);
    }
    objc_exception_throw(v39);
  }

  unint64_t v9 = v8;
  uint64_t v10 = (void *)v7[14];
  -[NSManagedObject willAccessValueForKey:](self, "willAccessValueForKey:", v3);
  unint64_t v11 = v10[12];
  BOOL v13 = v9 >= v11;
  unint64_t v12 = v9 - v11;
  BOOL v13 = !v13 || v12 >= v10[13];
  if (!v13 || (v14 = v10[18], BOOL v13 = v9 >= v14, v15 = v9 - v14, v13) && v15 < v10[19])
  {
    char v16 = _PF_ObjectIDsForDeferredFault((id **)self, v9);
LABEL_17:
    BOOL v17 = (NSArray *)v16;
    goto LABEL_18;
  }

  unint64_t v19 = v10[20];
  BOOL v13 = v9 >= v19;
  unint64_t v20 = v9 - v19;
  if (!v13 || v20 >= v10[21])
  {
    unint64_t v21 = v10[26];
    BOOL v13 = v9 >= v21;
    unint64_t v22 = v9 - v21;
    if (!v13 || v22 >= v10[27])
    {
      -[NSManagedObject didAccessValueForKey:](self, "didAccessValueForKey:", v3);
      goto LABEL_43;
    }
  }

  uint64_t v23 = _kvcPropertysPrimitiveGetters(v7);
  id Property = _PF_Handler_Public_GetProperty((id **)self, v9, (uint64_t)v3, *(void *)(v23 + 8 * v9));
  if (!Property)
  {
    char v16 = (id *)[MEMORY[0x189603F18] array];
    goto LABEL_17;
  }

  uint64_t v25 = Property;
  unint64_t v26 = v10[20];
  BOOL v13 = v9 >= v26;
  unint64_t v27 = v9 - v26;
  if (v13 && v27 < v10[21])
  {
    char v16 = (id *)objc_msgSend(MEMORY[0x189603F18], "arrayWithObject:", objc_msgSend(Property, "objectID"));
    goto LABEL_17;
  }

  BOOL v17 = (NSArray *)[MEMORY[0x189603FA8] array];
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  uint64_t v28 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (uint64_t i = 0LL; i != v29; ++i)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v25);
        }
        -[NSArray addObject:](v17, "addObject:", [*(id *)(*((void *)&v40 + 1) + 8 * i) objectID]);
      }

      uint64_t v29 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }

    while (v29);
  }

+ (NSFetchRequest)fetchRequest
{
  uint64_t v3 = [a1 entity];
  if (v3)
  {
    uint64_t v4 = v3;
    CFStringRef v5 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
    -[NSFetchRequest setEntity:](v5, "setEntity:", v4);
    return v5;
  }

  uint64_t v7 = [a1 entityName];
  if (!v7) {
    return 0LL;
  }
  return +[NSFetchRequest fetchRequestWithEntityName:](&OBJC_CLASS___NSFetchRequest, "fetchRequestWithEntityName:", v7);
}

- (NSManagedObject)initWithContext:(NSManagedObjectContext *)moc
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [(id)objc_opt_class() entity];
  id v6 = (void *)v5;
  if (moc && !v5)
  {
    uint64_t v7 = (void *)NSString;
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = [v7 stringWithUTF8String:class_getName(v8)];
    uint64_t v10 = -[NSManagedObjectContext persistentStoreCoordinator](moc, "persistentStoreCoordinator");
    if (v10) {
      uint64_t v10 = (NSPersistentStoreCoordinator *)v10->_modelMap;
    }
    id v6 = -[_PFModelMap entityForClassName:inContext:]((uint64_t)v10, v9, moc);
    if (v6)
    {
      unint64_t v11 = (void *)objc_opt_class();
      v13[0] = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)&OBJC_CLASS____PFWeakReference, (uint64_t)v6);
      objc_setAssociatedObject( v11,  PFEntityDescriptionAssociationKey,  (id)[MEMORY[0x189603F18] arrayWithObjects:v13 count:1],  (void *)0x303);
    }
  }

  return -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]( self,  "initWithEntity:insertIntoManagedObjectContext:",  v6,  moc);
}

- (id)bindableObjectPublisher
{
  cd_extras = self->_cd_extras;
  if (cd_extras) {
    return cd_extras->var4;
  }
  else {
    return 0LL;
  }
}

- (void)setBindableObjectPublisher:(id)a3
{
  cd_extras = self->_cd_extras;
  if (!cd_extras)
  {
    id v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      id v6 = malloc_default_zone();
    }
    cd_extras = ($EC3A7A785197EEFA6C82A67C8BBF666E *)malloc_zone_calloc(v6, 1uLL, 0x28uLL);
    self->_cd_extras = cd_extras;
  }

  if (cd_extras->var4)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Cannot set BindableObject publisher after it has already been set" userInfo:0]);
    JUMPOUT(0x186740464LL);
  }

  self->_cd_extras->var4 = a3;
}

- (void)_setLastSnapshot__:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[6];
    if (!v4)
    {
      if (!a2) {
        return result;
      }
      uint64_t v5 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v5 = malloc_default_zone();
      }
      uint64_t v4 = malloc_zone_calloc(v5, 1uLL, 0x28uLL);
      v3[6] = v4;
    }

    uint64_t v8 = (void *)v4[2];
    id v6 = v4 + 2;
    uint64_t v7 = v8;
    uint64_t v9 = v6 + 1;

    if (v8 != a2)
    {
      void *v9 = v7;
      uint64_t v9 = v6;
    }

    CFRange result = a2;
    void *v9 = result;
  }

  return result;
}

- (void)_nilOutReservedCurrentEventSnapshot__
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      uint64_t v3 = *(void **)(v2 + 24);
      if (v3)
      {

        *(void *)(*(void *)(a1 + 48) + 24LL) = 0LL;
      }
    }
  }

- (unsigned)_versionReference__
{
  return self->_cd_lockingInfo;
}

- (void)_setVersionReference__:(unsigned int)a3
{
  self->_cd_lockingInfo = a3;
}

- (void)_setObjectID__:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[5];
    if (v4 != a2)
    {

      CFRange result = a2;
      v3[5] = result;
    }
  }

  return result;
}

- (void)_setOriginalSnapshot__:(void *)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFRange result = (void *)result[6];
    if (!result)
    {
      if (!a2) {
        return result;
      }
      uint64_t v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone) {
        uint64_t v4 = malloc_default_zone();
      }
      CFRange result = malloc_zone_calloc(v4, 1uLL, 0x28uLL);
      v3[6] = result;
    }

    uint64_t v5 = (void *)result[1];
    if (v5 != a2)
    {

      CFRange result = a2;
      *(void *)(v3[6] + 8LL) = result;
    }
  }

  return result;
}

- (NSKnownKeysDictionary)_newPropertiesForRetainedTypes:(unsigned int *)a3 andCopiedTypes:(char)a4 preserveFaults:
{
  __int128 v43 = a2;
  uint64_t v44 = a3;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newPropertiesForRetainedTypes_andCopiedTypes_preserveFaults_);
  }
  if ((*((_BYTE *)a1 + 17) & 0x80) != 0) {
    -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, a1, a1[4]);
  }
  id v6 = (unint64_t *)_PFEntityForManagedObject(a1);
  uint64_t v7 = _kvcPropertysPrimitiveGetters(v6);
  if (v6) {
    uint64_t v8 = (void *)v6[13];
  }
  else {
    uint64_t v8 = 0LL;
  }
  __int128 v42 = &v40;
  [v8 length];
  unint64_t v9 = MEMORY[0x1895F8858]();
  unint64_t v12 = (char *)&v40 - v11;
  unint64_t v40 = v9;
  if (v9 > 0x200) {
    unint64_t v12 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)&v40 - v11, 8 * v10);
  }
  __int128 v41 = v8;
  if (v6) {
    unint64_t v17 = v6[14];
  }
  else {
    unint64_t v17 = 0LL;
  }
  uint64_t v18 = NSKeyValueCoding_NullValue;
  uint64_t v19 = *v43;
  if ((_DWORD)v19)
  {
    uint64_t v20 = 1LL;
    do
    {
      unint64_t v21 = (unint64_t *)(v17 + 16LL * v43[v20]);
      unint64_t v23 = *v21;
      unint64_t v22 = v21[1];
      if (*v21 < v22 + *v21)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a1, v23, 0LL, *(void *)(v7 + 8 * v23), v13, v14, v15, v16);
          id v25 = (id)v18;
          if (v24) {
            id v25 = v24;
          }
          *(void *)&v12[8 * v23++] = v25;
          --v22;
        }

        while (v22);
      }

      BOOL v26 = v20++ == v19;
    }

    while (!v26);
  }

  __int128 v43 = (unsigned int *)*v44;
  if ((_DWORD)v43)
  {
    uint64_t v27 = 1LL;
    do
    {
      uint64_t v28 = (unint64_t *)(v17 + 16LL * v44[v27]);
      unint64_t v30 = *v28;
      unint64_t v29 = v28[1];
      if (*v28 < v29 + *v28)
      {
        do
        {
          _PF_Handler_Primitive_GetProperty((id **)a1, v30, 0LL, *(void *)(v7 + 8 * v30), v13, v14, v15, v16);
          char v32 = v31;
          uint64_t v33 = v18;
          if (v32)
          {
            uint64_t v33 = objc_msgSend(v32, "copy", v40);
          }

          *(void *)&v12[8 * v30++] = v33;
          --v29;
        }

        while (v29);
      }

      BOOL v26 = v27++ == (void)v43;
    }

    while (!v26);
  }

  uint64_t v34 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
  int v35 = v41;
  uint64_t v36 = -[NSKnownKeysDictionary initWithSearchStrategy:](v34, "initWithSearchStrategy:", v41);
  -[NSKnownKeysDictionary setValues:](v36, "setValues:", v12);
  if ([v35 length])
  {
    unint64_t v37 = 0LL;
    do
    {
      uint64_t v38 = *(void **)&v12[8 * v37];
      ++v37;
    }

    while (v37 < objc_msgSend(v35, "length", v40));
  }

  if (v40 >= 0x201) {
    NSZoneFree(0LL, v12);
  }
  return v36;
}

- (NSKnownKeysDictionary)_newChangedValuesForRefresh__
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(*(void *)(a1 + 32), sel__newChangedValuesForRefresh__);
  }
  if ((*(_BYTE *)(a1 + 17) & 0x80) != 0) {
    return (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
  }
  uint64_t v1 = *(void *)(a1 + 48);
  if (!v1 || !*(void *)(v1 + 8)) {
    return (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
  }
  id v37 = (id)NSDictionary_EmptyDictionary;
  uint64_t v2 = (unint64_t *)_PFEntityForManagedObject((id)a1);
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = v2[13];
  }
  else {
    unint64_t v4 = 0LL;
  }
  uint64_t v38 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v4);
  uint64_t v44 = _kvcPropertysPrimitiveGetters(v3);
  if (v3) {
    unint64_t v6 = v3[14];
  }
  else {
    unint64_t v6 = 0LL;
  }
  uint64_t v7 = NSKeyValueCoding_NullValue;
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    unint64_t v9 = *(void **)(v8 + 8);
  }
  else {
    unint64_t v9 = 0LL;
  }
  uint64_t v43 = [v9 values];
  uint64_t v42 = -[NSKnownKeysDictionary values](v38, "values");
  uint64_t v14 = 0LL;
  char v15 = 1;
  do
  {
    char v40 = v15;
    uint64_t v16 = (unint64_t *)(v6 + 16LL * dword_1868D5D70[v14]);
    unint64_t v18 = *v16;
    unint64_t v17 = v16[1];
    if (*v16 < v17 + *v16)
    {
      do
      {
        if (*(void *)(v43 + 8 * v18) == v7) {
          uint64_t v19 = 0LL;
        }
        else {
          uint64_t v19 = *(void **)(v43 + 8 * v18);
        }
        _PF_Handler_Primitive_GetProperty((id **)a1, v18, 0LL, *(void *)(v44 + 8 * v18), v10, v11, v12, v13);
        if (v19 != v20)
        {
          unint64_t v21 = v20;
          unint64_t v22 = *(void **)(v3[12] + 24 + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            && ([v22 _epsilonEquals:v21 rhs:v19 withFlags:1] & 1) == 0)
          {
            id v23 = (id)v7;
            if (v21) {
              id v23 = v21;
            }
            *(void *)(v42 + 8 * v18) = v23;
          }
        }

        ++v18;
        --v17;
      }

      while (v17);
    }

    char v15 = 0;
    uint64_t v14 = 1LL;
  }

  while ((v40 & 1) != 0);
  uint64_t v24 = 2LL;
  unint64_t v39 = v6;
  do
  {
    uint64_t v41 = v24;
    id v25 = (unint64_t *)(v6 + 16LL * dword_1868D5D70[v24]);
    unint64_t v27 = *v25;
    unint64_t v26 = v25[1];
    if (*v25 < v26 + *v25)
    {
      do
      {
        if (*(void *)(v43 + 8 * v27) == v7) {
          uint64_t v28 = 0LL;
        }
        else {
          uint64_t v28 = *(void **)(v43 + 8 * v27);
        }
        _PF_Handler_Primitive_GetProperty((id **)a1, v27, 0LL, *(void *)(v44 + 8 * v27), v10, v11, v12, v13);
        unint64_t v30 = v29;
        int v31 = [v28 isFault];
        if ((v31 & [v30 isFault] & 1) == 0
          && v28 != v30
          && ([v30 isEqual:v28] & 1) == 0)
        {
          char v32 = (NSKnownKeysDictionary *)v7;
          if (v30)
          {
            if ([v30 count]) {
              id v33 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v30,  v28);
            }
            else {
              id v33 = 0LL;
            }
            if ([v28 count]) {
              id v34 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v28,  v30);
            }
            else {
              id v34 = 0LL;
            }
            int v35 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              v46[0] = xmmword_189EA7FF0;
              v46[1] = *(_OWORD *)off_189EA8000;
              _PFFastMappingForChanges__pffastmappingforchanges = -[NSKnownKeysMappingStrategy initForKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:count:",  v46,  4LL);
            }

            char v32 = -[NSKnownKeysDictionary initWithSearchStrategy:](v35, "initWithSearchStrategy:");
            uint64_t v36 = -[NSKnownKeysDictionary values](v32, "values");
            *uint64_t v36 = v33;
            v36[1] = v34;
            v36[2] = v30;
            if (v41 == 3) {
              v36[3] = v28;
            }
          }

          *(void *)(v42 + 8 * v27) = v32;
        }

        ++v27;
        --v26;
      }

      while (v26);
    }

    unint64_t v6 = v39;
    uint64_t v24 = v41 + 1;
  }

  while (v41 != 3);
  if (-[NSKnownKeysDictionary count](v38, "count"))
  {
  }

  else
  {

    return (NSKnownKeysDictionary *)v37;
  }

  return v38;
}

- (NSKnownKeysDictionary)_newNestedSaveChangedValuesForParent:(_BYTE *)a1
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v3 = a1;
  unint64_t v4 = (unint64_t *)_PFEntityForManagedObject(a1);
  uint64_t v5 = v4;
  unint64_t v6 = v4 ? v4[13] : 0LL;
  if ((v3[17] & 0x80) != 0) {
    return 0LL;
  }
  uint64_t v7 = *((void *)v3 + 6);
  if (!v7 || !*(void *)(v7 + 8)) {
    return 0LL;
  }
  uint64_t v8 = [a2 managedObjectContext];
  unint64_t v9 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v6);
  uint64_t v10 = _kvcPropertysPrimitiveGetters(v5);
  if (v5) {
    unint64_t v50 = v5[14];
  }
  else {
    unint64_t v50 = 0LL;
  }
  uint64_t v11 = NSKeyValueCoding_NullValue;
  uint64_t v12 = *((void *)v3 + 6);
  if (v12) {
    uint64_t v13 = *(void **)(v12 + 8);
  }
  else {
    uint64_t v13 = 0LL;
  }
  uint64_t v56 = [v13 values];
  uint64_t v49 = v9;
  uint64_t v55 = -[NSKnownKeysDictionary values](v9, "values");
  unint64_t v19 = *(void *)(v50 + 16);
  uint64_t v18 = *(void *)(v50 + 24);
  if (v19 < v18 + v19)
  {
    do
    {
      if (*(void *)(v56 + 8 * v19) == v11) {
        uint64_t v20 = 0LL;
      }
      else {
        uint64_t v20 = *(void **)(v56 + 8 * v19);
      }
      _PF_Handler_Primitive_GetProperty((id **)v3, v19, 0LL, *(void *)(v10 + 8 * v19), v14, v15, v16, v17);
      if (v20 != v21)
      {
        unint64_t v22 = v21;
        if (([*(id *)(v5[12] + 24 + 8 * v19) _epsilonEquals:v21 rhs:v20 withFlags:1] & 1) == 0)
        {
          id v23 = (id)v11;
          if (v22) {
            id v23 = v22;
          }
          *(void *)(v55 + 8 * v19) = v23;
        }
      }

      ++v19;
      --v18;
    }

    while (v18);
  }

  char v24 = 0;
  uint64_t v25 = 1LL;
  do
  {
    char v26 = v24;
    unint64_t v27 = (unint64_t *)(v50 + 16LL * dword_1868D5CEC[v25]);
    unint64_t v29 = *v27;
    unint64_t v28 = v27[1];
    if (*v27 < v28 + *v27)
    {
      do
      {
        if (*(void *)(v56 + 8 * v29) == v11) {
          unint64_t v30 = 0LL;
        }
        else {
          unint64_t v30 = *(void **)(v56 + 8 * v29);
        }
        _PF_Handler_Primitive_GetProperty((id **)v3, v29, 0LL, *(void *)(v10 + 8 * v29), v14, v15, v16, v17);
        if (v30 != v31)
        {
          char v32 = v31;
          if (([v31 isEqual:v30] & 1) == 0)
          {
            uint64_t v33 = v11;
            if (v32) {
              uint64_t v33 = (uint64_t)_PFRetainedObjectForMappedChildObjectIDInParentContext( (void *)[v32 objectID],  v8);
            }
            *(void *)(v55 + 8 * v29) = v33;
          }
        }

        ++v29;
        --v28;
      }

      while (v28);
    }

    char v24 = 1;
    uint64_t v25 = 2LL;
  }

  while ((v26 & 1) == 0);
  uint64_t v51 = v10;
  uint64_t v52 = v8;
  uint64_t v34 = 3LL;
  uint64_t v54 = v3;
  do
  {
    int v35 = (unint64_t *)(v50 + 16LL * dword_1868D5CEC[v34]);
    unint64_t v37 = *v35;
    unint64_t v36 = v35[1];
    if (*v35 < v36 + *v35)
    {
      unint64_t v53 = v34;
      do
      {
        if (*(void *)(v56 + 8 * v37) == v11) {
          uint64_t v38 = 0LL;
        }
        else {
          uint64_t v38 = *(void **)(v56 + 8 * v37);
        }
        _PF_Handler_Primitive_GetProperty((id **)v3, v37, 0LL, *(void *)(v10 + 8 * v37), v14, v15, v16, v17);
        char v40 = v39;
        int v41 = [v38 isFault];
        if ((v41 & [v40 isFault] & 1) == 0
          && v38 != v40
          && ([v40 isEqual:v38] & 1) == 0)
        {
          uint64_t v42 = (NSKnownKeysDictionary *)v11;
          if (v40)
          {
            uint64_t v43 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              v57[0] = xmmword_189EA7FF0;
              v57[1] = *(_OWORD *)off_189EA8000;
              _PFFastMappingForChanges__pffastmappingforchanges = -[NSKnownKeysMappingStrategy initForKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:count:",  v57,  4LL);
            }

            uint64_t v42 = -[NSKnownKeysDictionary initWithSearchStrategy:](v43, "initWithSearchStrategy:");
            if ([v40 count]) {
              id v44 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v40,  v38);
            }
            else {
              id v44 = 0LL;
            }
            if ([v38 count]) {
              id v45 = +[_PFRoutines newMutableArrayFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v38,  v40);
            }
            else {
              id v45 = 0LL;
            }
            uint64_t v46 = -[NSKnownKeysDictionary values](v42, "values");
            id *v46 = +[_PFRoutines newMutableArrayFromCollection:forParentContext:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v44,  v52);

            v46[1] = +[_PFRoutines newMutableArrayFromCollection:forParentContext:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v45,  v52);
            uint64_t v34 = v53;
            if (v53 > 4)
            {
              _OWORD v46[2] = +[_PFRoutines newMutableOrderedSetFromCollection:forParentContext:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v40,  v52);
              v46[3] = +[_PFRoutines newMutableOrderedSetFromCollection:forParentContext:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v38,  v52);
            }

            else
            {
              _OWORD v46[2] = +[_PFRoutines newMutableSetFromCollection:forParentContext:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v40,  v52);
            }

            uint64_t v10 = v51;
          }

          *(void *)(v55 + 8 * v37) = v42;
          uint64_t v3 = v54;
        }

        ++v37;
        --v36;
      }

      while (v36);
    }

    ++v34;
  }

  while (v34 != 7);
  uint64_t v47 = v49;
  if (!-[NSKnownKeysDictionary count](v49, "count"))
  {

    return 0LL;
  }

  return v47;
}

- (NSKnownKeysDictionary)_newSnapshotForUndo__
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1;
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newSnapshotForUndo__);
  }
  uint64_t v70 = (NSKnownKeysDictionary *)(id)NSDictionary_EmptyDictionary;
  uint64_t v2 = (unint64_t *)_PFEntityForManagedObject(v1);
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v4 = v2[13];
  }
  else {
    unint64_t v4 = 0LL;
  }
  uint64_t v5 = -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v4);
  uint64_t v78 = _kvcPropertysPrimitiveGetters(v3);
  if (v3) {
    unint64_t v73 = v3[14];
  }
  else {
    unint64_t v73 = 0LL;
  }
  uint64_t v77 = NSKeyValueCoding_NullValue;
  uint64_t v6 = v1[6];
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 16);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v79 = [v7 values];
  uint64_t v75 = -[NSKnownKeysDictionary values](v5, "values");
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    uint64_t v13 = (uint64_t *)(v73 + 16LL * dword_1868D5D08[i]);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    if (*v13 < (unint64_t)(v15 + *v13))
    {
      uint64_t v16 = (void *)(v75 + 8 * v14);
      uint64_t v17 = (void **)(v79 + 8 * v14);
      do
      {
        uint64_t v18 = *v17++;
        *v16++ = v18;
        --v15;
      }

      while (v15);
    }
  }

  v69 = v5;
  char v19 = 0;
  uint64_t v20 = 4LL;
  v74 = v1;
  unint64_t v21 = (void *)v77;
  do
  {
    char v22 = v19;
    id v23 = (unint64_t *)(v73 + 16LL * dword_1868D5D08[v20]);
    unint64_t v24 = *v23;
    unint64_t v25 = v23[1];
    if (*v23 < v25 + *v23)
    {
      do
      {
        else {
          char v26 = *(void **)(v79 + 8 * v24);
        }
        _PF_Handler_Primitive_GetProperty((id **)v1, v24, 0LL, *(void *)(v78 + 8 * v24), v8, v9, v10, v11);
        unint64_t v28 = v27;
        int v29 = [v26 isFault];
        int v30 = v29 & [v28 isFault];
        unint64_t v21 = (void *)v77;
        if ((v30 & 1) == 0 && v26 != v28 && ([v28 isEqual:v26] & 1) == 0)
        {
          int v31 = (NSKnownKeysDictionary *)v77;
          if (v28)
          {
            if ([v28 count])
            {
              char v32 = (void *)[v28 mutableCopy];
              uint64_t v33 = v32;
              if (v32) {
                [v32 minusSet:v26];
              }
            }

            else
            {
              uint64_t v33 = 0LL;
            }

            if (objc_msgSend(v26, "count", v69))
            {
              uint64_t v34 = (void *)[v26 mutableCopy];
              int v35 = v34;
              if (v34) {
                [v34 minusSet:v28];
              }
            }

            else
            {
              int v35 = 0LL;
            }

            unint64_t v36 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
            if (!_PFFastMappingForChanges__pffastmappingforchanges)
            {
              objc_super v80 = (objc_super)xmmword_189EA7FF0;
              __int128 v81 = *(_OWORD *)off_189EA8000;
              _PFFastMappingForChanges__pffastmappingforchanges = -[NSKnownKeysMappingStrategy initForKeys:count:]( objc_alloc(&OBJC_CLASS___NSKnownKeysMappingStrategy),  "initForKeys:count:",  &v80,  4LL);
            }

            int v31 = -[NSKnownKeysDictionary initWithSearchStrategy:](v36, "initWithSearchStrategy:");
            unint64_t v37 = -[NSKnownKeysDictionary values](v31, "values");
            NSDictionary *v37 = v33;
            v37[1] = v35;
            unint64_t v21 = (void *)v77;
          }

          *(void *)(v75 + 8 * v24) = v31;
          uint64_t v1 = v74;
        }

        ++v24;
        --v25;
      }

      while (v25);
    }

    char v19 = 1;
    uint64_t v20 = 5LL;
  }

  while ((v22 & 1) == 0);
  char v38 = 0;
  uint64_t v39 = 6LL;
  do
  {
    char v72 = v38;
    char v40 = (unint64_t *)(v73 + 16LL * dword_1868D5D08[v39]);
    unint64_t v42 = *v40;
    unint64_t v41 = v40[1];
    unint64_t v43 = v41 + v42;
    if (v42 >= v41 + v42) {
      goto LABEL_92;
    }
    unint64_t v71 = v41 + v42;
    do
    {
      else {
        id v44 = *(void **)(v79 + 8 * v42);
      }
      _PF_Handler_Primitive_GetProperty((id **)v1, v42, 0LL, *(void *)(v78 + 8 * v42), v8, v9, v10, v11);
      uint64_t v46 = v45;
      int v47 = [v44 isFault];
      if ((v47 & [v46 isFault] & 1) != 0
        || v44 == v46
        || ([v46 isEqual:v44] & 1) != 0)
      {
        goto LABEL_91;
      }

      id v48 = v21;
      if (!v46) {
        goto LABEL_90;
      }
      if ([v46 isEqual:v44])
      {
        id v48 = (id)NSArray_EmptyArray;
        goto LABEL_90;
      }

      id v48 = objc_alloc_init(MEMORY[0x189603FA8]);
      unint64_t v49 = [v46 count];
      unint64_t v50 = [v44 count];
      id v76 = objc_alloc_init(MEMORY[0x189603FE0]);
      unint64_t v51 = 0LL;
      unint64_t v52 = 0LL;
      while (1)
      {
        uint64_t v53 = v52 >= v49 ? 0 : [v46 objectAtIndex:v52];
        uint64_t v54 = v51 >= v50 ? 0 : [v44 objectAtIndex:v51];
        if (!(v53 | v54)) {
          break;
        }
        if (!v53)
        {
          if ([v46 containsObject:v54]) {
            goto LABEL_85;
          }
LABEL_75:
          __int128 v59 = objc_alloc(&OBJC_CLASS____NSOrderedSetDiffInsert);
          if (v59)
          {
            v80.receiver = v59;
            v80.super_class = (Class)&OBJC_CLASS____NSOrderedSetDiffChange;
            id v60 = objc_msgSendSuper2(&v80, sel_initWithObject_, v54);
            __int128 v61 = v60;
            if (v60) {
              *((void *)v60 + 2) = v51;
            }
          }

          else
          {
            __int128 v61 = 0LL;
          }

          objc_msgSend(v48, "addObject:", v61, v69);

          goto LABEL_85;
        }

        if (!v54)
        {
          if ([v44 containsObject:v53]) {
            goto LABEL_73;
          }
LABEL_72:
          uint64_t v58 = -[_NSOrderedSetDiff initWithObject:]( objc_alloc(&OBJC_CLASS____NSOrderedSetDiffDelete),  "initWithObject:",  v53);
          [v48 addObject:v58];

          goto LABEL_73;
        }

        if ([(id)v53 isEqual:v54])
        {
          if (v51 != v52)
          {
            __int128 v62 = objc_alloc(&OBJC_CLASS____NSOrderedSetDiffMove);
            if (v62)
            {
              v80.receiver = v62;
              v80.super_class = (Class)&OBJC_CLASS____NSOrderedSetDiffChange;
              id v63 = objc_msgSendSuper2(&v80, sel_initWithObject_, v53);
              __int128 v64 = v63;
              if (v63) {
                *((void *)v63 + 2) = v51;
              }
            }

            else
            {
              __int128 v64 = 0LL;
            }

            objc_msgSend(v48, "addObject:", v64, v69);
          }

          ++v52;
LABEL_85:
          ++v51;
        }

        else
        {
          if (([v46 containsObject:v54] & 1) == 0) {
            goto LABEL_75;
          }
          if (([v76 containsObject:v53] & 1) == 0)
          {
            uint64_t v55 = objc_alloc(&OBJC_CLASS____NSOrderedSetDiffMove);
            if (v55)
            {
              v80.receiver = v55;
              v80.super_class = (Class)&OBJC_CLASS____NSOrderedSetDiffChange;
              id v56 = objc_msgSendSuper2(&v80, sel_initWithObject_, v54);
              __int128 v57 = v56;
              if (v56) {
                *((void *)v56 + 2) = v51;
              }
            }

            else
            {
              __int128 v57 = 0LL;
            }

            objc_msgSend(v48, "addObject:", v57, v69);

            [v76 addObject:v54];
            goto LABEL_85;
          }

- (NSKnownKeysDictionary)_newCommittedSnapshotValues
{
  v27[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__newCommittedSnapshotValues);
  }
  uint64_t v2 = objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary);
  uint64_t v3 = _PFEntityForManagedObject(a1);
  if (v3) {
    uint64_t v4 = v3[13];
  }
  else {
    uint64_t v4 = 0LL;
  }
  uint64_t v5 = -[NSKnownKeysDictionary initWithSearchStrategy:](v2, "initWithSearchStrategy:", v4);
  if (([a1 isInserted] & 1) == 0)
  {
    uint64_t v6 = -[NSKnownKeysDictionary values](v5, "values");
    uint64_t v7 = a1[6];
    if (v7)
    {
      uint64_t v8 = *(void **)(v7 + 8);
      uint64_t v9 = NSKeyValueCoding_NullValue;
      if (v8)
      {
        uint64_t v10 = [v8 values];
        uint64_t v11 = 0LL;
LABEL_13:
        uint64_t v12 = *((void *)_PFEntityForManagedObject(a1) + 14);
        unint64_t v13 = *(void *)(v12 + 48);
        uint64_t v14 = *(void *)(v12 + 56);
        if (v13 < v14 + v13)
        {
          uint64_t v15 = (void *)(v6 + 8 * v13);
          uint64_t v16 = (id *)(v10 + 8 * v13);
          do
          {
            id v17 = (id)v9;
            if (*v16) {
              id v17 = *v16;
            }
            *v15++ = v17;
            ++v16;
            --v14;
          }

          while (v14);
        }

        uint64_t v18 = *((void *)_PFEntityForManagedObject(a1) + 14);
        unint64_t v19 = *(void *)(v18 + 96);
        uint64_t v20 = *(void *)(v18 + 104);
        if (v19 < v20 + v19)
        {
          unint64_t v21 = (void *)(v6 + 8 * v19);
          char v22 = (void **)(v10 + 8 * v19);
          do
          {
            id v23 = *v22;
            if (*v22) {
              BOOL v24 = v23 == (void *)v9;
            }
            else {
              BOOL v24 = 1;
            }
            id v25 = (id)v9;
            if (!v24) {
              id v25 = (id)[v23 objectID];
            }
            *v21++ = v25;
            ++v22;
            --v20;
          }

          while (v20);
        }

        return v5;
      }
    }

    else
    {
      uint64_t v9 = NSKeyValueCoding_NullValue;
    }

    v27[0] = 0LL;
    uint64_t v11 = -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( a1,  dword_1868D5D48,  (unsigned int *)v27,  1);
    uint64_t v10 = -[NSKnownKeysDictionary values](v11, "values");
    goto LABEL_13;
  }

  return v5;
}

- (NSKnownKeysDictionary)_changedTransientProperties__
{
  v27[1] = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__changedTransientProperties__);
  }
  if ((*((_BYTE *)a1 + 17) & 0x80) != 0) {
    return (NSKnownKeysDictionary *)NSDictionary_EmptyDictionary;
  }
  uint64_t v2 = _PFEntityForManagedObject(a1);
  if (v2) {
    uint64_t v3 = v2[13];
  }
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 =  -[NSKnownKeysDictionary initWithSearchStrategy:]( objc_alloc(&OBJC_CLASS___NSKnownKeysDictionary),  "initWithSearchStrategy:",  v3);
  uint64_t v5 = _PFEntityForManagedObject(a1);
  if (v5) {
    uint64_t v6 = v5[14];
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = NSKeyValueCoding_NullValue;
  v27[0] = 0xD00000001LL;
  uint64_t v8 = -[NSKnownKeysDictionary values](  -[NSManagedObject _newPropertiesForRetainedTypes:andCopiedTypes:preserveFaults:]( a1,  dword_1868D5D80,  (unsigned int *)v27,  0),  "values");
  uint64_t v9 = -[NSKnownKeysDictionary values](v4, "values");
  uint64_t v10 = 0LL;
  char v11 = 1;
  do
  {
    char v12 = v11;
    unint64_t v13 = (uint64_t *)(v6 + 16LL * dword_1868D5D54[v10]);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    if (*v13 < (unint64_t)(v15 + *v13))
    {
      uint64_t v16 = (void *)(v9 + 8 * v14);
      id v17 = (void **)&v8[v14];
      do
      {
        uint64_t v18 = *v17;
        if (*v17) {
          BOOL v19 = v18 == (void *)v7;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19) {
          *uint64_t v16 = v18;
        }
        ++v16;
        ++v17;
        --v15;
      }

      while (v15);
    }

    char v11 = 0;
    uint64_t v10 = 1LL;
  }

  while ((v12 & 1) != 0);
  unint64_t v20 = *(void *)(v6 + 208);
  uint64_t v21 = *(void *)(v6 + 216);
  if (v20 < v21 + v20)
  {
    char v22 = (void *)(v9 + 8 * v20);
    id v23 = (id *)&v8[v20];
    do
    {
      id v24 = *v23;
      if (([*v23 isFault] & 1) == 0)
      {
        if (v24) {
          BOOL v25 = v24 == (id)v7;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25) {
          void *v22 = v24;
        }
      }

      ++v22;
      ++v23;
      --v21;
    }

    while (v21);
  }

  return v4;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSManagedObject;
  return objc_msgSendSuper2(&v4, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)_implicitObservationInfo
{
  uint64_t v5 = 0LL;
  if (!self || (self->_cd_stateFlags & 0x80) != 0) {
    cd_managedObjectContext = 0LL;
  }
  else {
    cd_managedObjectContext = self->_cd_managedObjectContext;
  }
  uint64_t v3 = _PFEntityForManagedObject(self);
  return (id)-[NSManagedObjectContext _implicitObservationInfoForEntity:forResultingClass:]( (uint64_t)cd_managedObjectContext,  v3,  &v5);
}

- (id)_genericMergeableStringValueForKey:(id)a3 withIndex:(int64_t)a4
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  uint64_t v7 = (unint64_t *)_PFEntityForManagedObject(self);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = -[NSManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", a3);
  }

  else
  {
    uint64_t v9 = _kvcPropertysPrimitiveGetters(v7);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(void *)(v9 + 8 * a4), v10, v11, v12, v13);
  }

  if (v8) {
    uint64_t v14 = -[PFMergeableStringProxy initWithContainer:key:mergeableString:]( objc_alloc(&OBJC_CLASS___PFMergeableStringProxy),  "initWithContainer:key:mergeableString:",  self,  a3,  v8);
  }
  else {
    uint64_t v14 = 0LL;
  }
  return v14;
}

- (id)_genericMutableSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v8 = (unint64_t *)_PFEntityForManagedObject(self);
  uint64_t v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = -[NSManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", a3);
  }

  else
  {
    uint64_t v11 = _kvcPropertysPrimitiveGetters(v8);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(void *)(v11 + 8 * a4), v12, v13, v14, v15);
  }

  uint64_t v16 = (uint64_t)v10;
  if (v10)
  {
    Class Class = object_getClass(self);
    if (Class == (Class)objc_opt_class()
      || (uint64_t v18 = *(void **)(_kvcPropertysPublicRelationshipMutators(v9) + 8 * a4)) == 0LL)
    {
      BOOL v19 = -[_NSNotifyingWrapperMutableSet initWithContainer:key:mutableSet:]( objc_alloc(&OBJC_CLASS____NSNotifyingWrapperMutableSet),  "initWithContainer:key:mutableSet:",  self,  a3,  v16);
    }

    else
    {
      BOOL v19 = (_NSNotifyingWrapperMutableSet *)-[_NSProxyWrapperMutableSet initWithContainer:key:mutableSet:mutationMethods:]( objc_alloc(&OBJC_CLASS____NSProxyWrapperMutableSet),  (uint64_t)self,  (uint64_t)a3,  v16,  v18);
    }
  }

  else
  {
    BOOL v19 = 0LL;
  }

  return v19;
}

- (id)_genericMutableOrderedSetValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->_cd_managedObjectContext, a2);
  }
  id v8 = (unint64_t *)_PFEntityForManagedObject(self);
  uint64_t v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = -[NSManagedObject primitiveValueForKey:](self, "primitiveValueForKey:", a3);
  }

  else
  {
    uint64_t v11 = _kvcPropertysPrimitiveGetters(v8);
    _PF_Handler_Primitive_GetProperty((id **)self, a4, (uint64_t)a3, *(void *)(v11 + 8 * a4), v12, v13, v14, v15);
  }

  uint64_t v16 = (uint64_t)v10;
  if (v10)
  {
    Class Class = object_getClass(self);
    if (Class == (Class)objc_opt_class()
      || (uint64_t v18 = *(void **)(_kvcPropertysPublicRelationshipMutators(v9) + 8 * a4)) == 0LL)
    {
      BOOL v19 = -[_NSNotifyingWrapperMutableOrderedSet initWithContainer:key:mutableOrderedSet:]( objc_alloc(&OBJC_CLASS____NSNotifyingWrapperMutableOrderedSet),  "initWithContainer:key:mutableOrderedSet:",  self,  a3,  v16);
    }

    else
    {
      BOOL v19 = (_NSNotifyingWrapperMutableOrderedSet *)-[_NSProxyWrapperMutableOrderedSet initWithContainer:key:mutableOrderedSet:mutationMethods:]( objc_alloc(&OBJC_CLASS____NSProxyWrapperMutableOrderedSet),  (uint64_t)self,  (uint64_t)a3,  v16,  v18);
    }
  }

  else
  {
    BOOL v19 = 0LL;
  }

  return v19;
}

- (uint64_t)_isValidRelationshipDestination__
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 16) & 0x80) != 0) {
      uint64_t v2 = 0LL;
    }
    else {
      uint64_t v2 = *(void *)(result + 32);
    }
    if ([*(id *)(result + 40) isTemporaryID] && (*(_BYTE *)(v1 + 16) & 0x12) == 0)
    {
      if (v2)
      {
        unsigned __int8 v4 = atomic_load((unsigned __int8 *)(v2 + 48));
        unsigned int v3 = v4 & 1;
      }

      else
      {
        unsigned int v3 = 0;
      }
    }

    else
    {
      unsigned int v3 = 1;
    }

    if (v2) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

- (void)_maintainInverseRelationship:(uint64_t *)a1 forProperty:(void *)a2 oldDestination:(uint64_t *)a3 newDestination:(uint64_t *)a4
{
  if (a1 && a4 != a3)
  {
    id v8 = (void *)MEMORY[0x186E3E5D8]();
    if (!a3 || a3 != a1 && (a3[2] & 0x800) != 0) {
      goto LABEL_33;
    }
    if (!a2)
    {
      if (([a3 hasChanges] & 1) == 0) {
        _PFFastMOCObjectWillChange(a1[4], a3);
      }
      goto LABEL_33;
    }

    uint64_t v9 = [a2 isToMany];
    uint64_t v10 = [a2 name];
    unint64_t v11 = [a2 _entitysReferenceID];
    uint64_t v12 = [a2 entity];
    uint64_t v13 = (unint64_t *)[a3 entity];
    uint64_t v14 = v13;
    if (!(_DWORD)v9)
    {
      uint64_t v29 = a1[4];
      if (!v29
        || (*(_BYTE *)(v29 + 42) & 4) == 0
        || (!*(void *)(_kvcPropertysPrimitiveGetters(v14) + 8 * v11)
          ? (uint64_t v30 = [a3 _genericValueForKey:v10 withIndex:v11 flags:0])
          : (uint64_t v30 = _NSGetUsingKeyValueGetter()),
            (uint64_t *)v30 == a1))
      {
        uint64_t v32 = _kvcPropertysPublicSetters(v14);
        _PF_Handler_Public_SetProperty((unsigned int *)a3, v11, 0LL, v10, *(void **)(v32 + 8 * v11));
      }

      goto LABEL_33;
    }

    id v60 = a1;
    id v15 = _PFEntityForManagedObject(a3);
    uint64_t v16 = (void *)objc_msgSend((id)objc_msgSend(v15, "propertiesByName"), "valueAtIndex:", v11);
    uint64_t v17 = *(void *)(_kvcPropertysPrimitiveGetters((unint64_t *)v15) + 8 * v11);
    LODWORD(v16) = [v16 isOrdered];
    [a3 willAccessValueForKey:v10];
    _PF_Handler_Primitive_GetProperty((id **)a3, v11, v10, v17, v18, v19, v20, v21);
    id v23 = v22;
    if ((_DWORD)v16)
    {
      if (v22)
      {
        uint64_t v24 = [v22 indexOfObject:a1];
        [a3 didAccessValueForKey:v10];
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v25 = *(void *)(_kvcPropertysPublicRelationshipMutators((unint64_t *)v15) + 8 * v11);
          if (v25)
          {
            char v26 = *(objc_method **)(v25 + 16);
            if (v26)
            {
              unint64_t v27 = a3;
              uint64_t v28 = v24;
LABEL_28:
              method_invoke(v27, v26, v28);
              goto LABEL_33;
            }

            uint64_t v58 = [objc_alloc(MEMORY[0x1896078D0]) initWithIndex:v24];
            goto LABEL_61;
          }

          id v56 = (void *)[objc_alloc(MEMORY[0x1896078D0]) initWithIndex:v24];
          [a3 willChange:3 valuesAtIndexes:v56 forKey:v10];
          [v23 removeObjectAtIndex:v24];
          [a3 didChange:3 valuesAtIndexes:v56 forKey:v10];
          goto LABEL_55;
        }

        goto LABEL_33;
      }
    }

    else if (v22)
    {
      int v31 = [v22 containsObject:a1];
      [a3 didAccessValueForKey:v10];
      if (v31)
      {
        uint64_t v25 = *(void *)(_kvcPropertysPublicRelationshipMutators((unint64_t *)v15) + 8 * v11);
        if (v25)
        {
          char v26 = *(objc_method **)(v25 + 16);
          if (v26)
          {
            unint64_t v27 = a3;
            uint64_t v28 = (uint64_t)a1;
            goto LABEL_28;
          }

          uint64_t v58 = [objc_alloc(MEMORY[0x189604010]) initWithObjects:&v60 count:1];
LABEL_61:
          __int128 v59 = (void *)v58;
          method_invoke(a3, *(Method *)(v25 + 32), v58);

          goto LABEL_33;
        }

        id v56 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v60 count:1];
        [a3 willChangeValueForKey:v10 withSetMutation:2 usingObjects:v56];
        [v23 removeObject:v60];
        [a3 didChangeValueForKey:v10 withSetMutation:2 usingObjects:v56];
LABEL_55:
      }

- (void)_maintainInverseRelationship:(void *)a3 forProperty:(uint64_t)a4 forChange:(void *)a5 onSet:
{
  v27[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unint64_t v10 = [a5 count];
    if (v10)
    {
      unint64_t v11 = v10;
      if (v10 >= 0x201) {
        uint64_t v12 = 1LL;
      }
      else {
        uint64_t v12 = v10;
      }
      unint64_t v13 = (8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v14 = (char *)v27 - v13;
      if (v10 > 0x200) {
        uint64_t v14 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v27 - v13, 8 * v10);
      }
      [a5 getObjects:v14];
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          uint64_t v16 = *(uint64_t **)&v14[8 * i];
          if (a4 == 2)
          {
            uint64_t v17 = 0LL;
          }

          else
          {
            uint64_t v17 = *(uint64_t **)&v14[8 * i];
            uint64_t v16 = 0LL;
          }

          -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:](a1, a2, v17, v16);
        }

        if (v11 >= 0x201) {
          NSZoneFree(0LL, v14);
        }
      }

      else
      {
        uint64_t v18 = (void *)MEMORY[0x189603F70];
        uint64_t v19 = *MEMORY[0x189603A58];
        uint64_t v20 = [NSString stringWithFormat:@"Insufficient information to maintain inverse relationship %@ for relationship: %@.", objc_msgSend(a2, "name"), objc_msgSend(a3, "name")];
        objc_exception_throw((id)objc_msgSend( v18,  "exceptionWithName:reason:userInfo:",  v19,  v20,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(a3, "name"),  @"key",  objc_msgSend(a2, "name"),  @"inverse",  0)));
        -[NSManagedObject _didChangeValue:forRelationship:named:withInverse:](v21, v22, v23, v24, v25, v26);
      }
    }
  }

- (void)_didChangeValue:(id)a3 forRelationship:(id)a4 named:(id)a5 withInverse:(id)a6
{
  v37[1] = *MEMORY[0x1895F89C0];
  if (objc_msgSend(a6, "isReadOnly", a3, a4, a5))
  {
    uint64_t v34 = (void *)MEMORY[0x189603F70];
    uint64_t v35 = *MEMORY[0x189603A58];
    uint64_t v36 = [NSString stringWithFormat:@"Cannot maintain read-only inverse relationship %@ for relationship: %@.", objc_msgSend(a6, "name"), objc_msgSend(a4, "name")];
    objc_exception_throw((id)objc_msgSend( v34,  "exceptionWithName:reason:userInfo:",  v35,  v36,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  objc_msgSend(a4, "name"),  @"key",  objc_msgSend(a6, "name"),  @"inverse",  0)));
  }

  unint64_t v10 = (void *)[a3 objectForKey:*MEMORY[0x1896075C0]];
  unint64_t v11 = (void *)[a3 objectForKey:*MEMORY[0x1896075B8]];
  else {
    uint64_t v12 = (uint64_t)v10;
  }
  else {
    uint64_t v13 = (uint64_t)v11;
  }
  if (v12 | v13) {
    BOOL v14 = v12 == v13;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && ((objc_opt_respondsToSelector() & 1) == 0 || ([(id)v12 _isIdenticalFault:v13] & 1) == 0))
  {
    self->_cd_stateFlags |= 0x800u;
    if ([a4 isToMany])
    {
      switch(objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1896075B0]), "intValue"))
      {
        case 1u:
          unint64_t v15 = [(id)v12 count];
          unint64_t v16 = [(id)v13 count];
          uint64_t v17 = [a4 isOrdered];
          int v18 = v17;
          if ((_DWORD)v17)
          {
            if (v15)
            {
              MEMORY[0x1895F8858](v17);
              uint64_t v20 = (char *)v37 - v19;
              if (v15 > 0x200) {
                uint64_t v20 = (char *)NSAllocateScannedUncollectable();
              }
              else {
                bzero((char *)v37 - v19, 8 * v15);
              }
              [(id)v12 getObjects:v20];
              uint64_t v17 = [objc_alloc(MEMORY[0x189604010]) initWithObjects:v20 count:v15];
              uint64_t v12 = v17;
              if (v15 >= 0x201) {
                NSZoneFree(0LL, v20);
              }
            }

            else
            {
              uint64_t v12 = NSSet_EmptySet;
            }

            if (v16)
            {
              MEMORY[0x1895F8858](v17);
              unint64_t v27 = (char *)v37 - v26;
              if (v16 > 0x200) {
                unint64_t v27 = (char *)NSAllocateScannedUncollectable();
              }
              else {
                bzero((char *)v37 - v26, 8 * v16);
              }
              [(id)v13 getObjects:v27];
              uint64_t v13 = [objc_alloc(MEMORY[0x189604010]) initWithObjects:v27 count:v16];
              if (v16 >= 0x201) {
                NSZoneFree(0LL, v27);
              }
            }

            else
            {
              uint64_t v13 = NSSet_EmptySet;
            }
          }

          else
          {
            if (!v13) {
              uint64_t v13 = NSSet_EmptySet;
            }
            if (!v12) {
              uint64_t v12 = NSSet_EmptySet;
            }
          }

          if (([(id)v12 isEqualToSet:v13] & 1) == 0)
          {
            if ([(id)v13 count])
            {
              uint64_t v28 = (void *)[(id)v13 mutableCopy];
              uint64_t v29 = v28;
              if (v28) {
                [v28 minusSet:v12];
              }
            }

            else
            {
              uint64_t v29 = 0LL;
            }

            if ([(id)v12 count])
            {
              uint64_t v30 = (void *)[(id)v12 mutableCopy];
              int v31 = v30;
              if (v30) {
                [v30 minusSet:v13];
              }
            }

            else
            {
              int v31 = 0LL;
            }

            if ([v31 count]) {
              -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]( (uint64_t *)self,  a6,  a4,  3LL,  v31);
            }
            if ([v29 count]) {
              -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]( (uint64_t *)self,  a6,  a4,  2LL,  v29);
            }
          }

          if (v15) {
            int v32 = v18;
          }
          else {
            int v32 = 0;
          }
          if (v32 == 1) {

          }
          if (v16) {
            int v33 = v18;
          }
          else {
            int v33 = 0;
          }
          if (v33 == 1) {

          }
          break;
        case 2u:
          goto LABEL_23;
        case 3u:
          uint64_t v21 = (uint64_t *)self;
          id v22 = a6;
          id v23 = a4;
          uint64_t v24 = 3LL;
          id v25 = (void *)v12;
          goto LABEL_24;
        case 4u:
          -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:]( (uint64_t *)self,  a6,  a4,  3LL,  (void *)v12);
LABEL_23:
          uint64_t v21 = (uint64_t *)self;
          id v22 = a6;
          id v23 = a4;
          uint64_t v24 = 2LL;
          id v25 = (void *)v13;
LABEL_24:
          -[NSManagedObject _maintainInverseRelationship:forProperty:forChange:onSet:](v21, v22, v23, v24, v25);
          break;
        default:
          break;
      }
    }

    else
    {
      -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]( (uint64_t *)self,  a6,  (uint64_t *)v12,  (uint64_t *)v13);
    }

    self->_cd_stateFlags &= ~0x800u;
  }

- (void)_propagateDelete:(void *)a1
{
  int v94 = a2;
  v102[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__propagateDelete_);
    }
    unsigned int v3 = (unint64_t *)_PFEntityForManagedObject(a1);
    unsigned __int8 v4 = v3;
    if ((a1[2] & 0x80) != 0) {
      id v95 = 0LL;
    }
    else {
      id v95 = (id)a1[4];
    }
    if (v3)
    {
      unint64_t v5 = v3[13];
      unint64_t v91 = v3[14];
      unint64_t v6 = v3[12];
      uint64_t v7 = v5 + 40;
    }

    else
    {
      unint64_t v91 = 0LL;
      unint64_t v6 = 0LL;
      uint64_t v7 = 40LL;
    }

    uint64_t v8 = *(void *)v7;
    unint64_t v99 = v6 + 24;
    uint64_t v100 = v8;
    uint64_t v97 = _kvcPropertysPrimitiveGetters(v3);
    uint64_t v9 = _kvcPropertysPublicSetters(v4);
    int v10 = *((_DWORD *)a1 + 4);
    v98 = (id **)a1;
    *((_DWORD *)a1 + 4) = v10 | 0x800;
    if ((v10 & 0x8000) != 0) {
      -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, v98, (uint64_t)v98[4]);
    }
    uint64_t v11 = 0LL;
    int v88 = v10 & 0x800;
    v102[0] = 0xA00000006LL;
    int v12 = 1;
    uint64_t v13 = v98;
    do
    {
      LODWORD(v101) = v12;
      v96 = (void *)MEMORY[0x186E3E5D8]();
      BOOL v14 = (unint64_t *)(v91 + 16LL * *((unsigned int *)v102 + v11));
      unint64_t v16 = *v14;
      unint64_t v15 = v14[1];
      char v17 = v94;
      if (*v14 < v15 + *v14)
      {
        do
        {
          int v18 = *(void **)(v99 + 8 * v16);
          uint64_t v19 = *(void *)(v100 + 8 * v16);
          uint64_t v20 = [v18 deleteRule];
          if (!v20) {
            goto LABEL_31;
          }
          uint64_t v25 = v20;
          if (v20 == 3 && (v17 & 2) == 0) {
            goto LABEL_31;
          }
          _PF_Handler_Primitive_GetProperty(v13, v16, v19, *(void *)(v97 + 8 * v16), v21, v22, v23, v24);
          if (!v26) {
            goto LABEL_31;
          }
          unint64_t v27 = v26;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            __break(1u);
          }
          uint64_t v28 = (void *)[v18 inverseRelationship];
          id v29 = v27;
          _PF_Handler_Public_SetProperty((unsigned int *)v13, v16, 0LL, v19, *(void **)(v9 + 8 * v16));
          if (v28)
          {
            if (([v28 isToMany] & 1) == 0)
            {
              uint64_t v30 = (void *)[v27 entity];
              uint64_t v31 = [v28 entity];
              unint64_t v32 = [v28 _entitysReferenceID];
              uint64_t v33 = *(void *)(_kvcPropertysPrimitiveGetters((unint64_t *)v30) + 8 * v32);
              uint64_t v34 = [v28 name];
              _PF_Handler_Primitive_GetProperty((id **)v27, v32, v34, v33, v35, v36, v37, v38);
              uint64_t v13 = v98;
              char v17 = v94;
              if (v39 != v98) {
                goto LABEL_30;
              }
            }

            -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]( (uint64_t *)v13,  v28,  (uint64_t *)v27,  0LL);
          }

          if (v25 == 2 && ([v27 isDeleted] & 1) == 0) {
            [v95 deleteObject:v27];
          }
LABEL_30:

LABEL_31:
          ++v16;
          --v15;
        }

        while (v15);
      }

      objc_autoreleasePoolPop(v96);
      int v12 = 0;
      uint64_t v11 = 1LL;
    }

    while ((v101 & 1) != 0);
    uint64_t v40 = 0LL;
    v102[0] = 0xD00000009LL;
    int v41 = 1;
    unint64_t v42 = v91;
    while (1)
    {
      int v90 = v41;
      v89 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v43 = (unint64_t *)(v42 + 16LL * *((unsigned int *)v102 + v40));
      unint64_t v45 = *v43;
      unint64_t v44 = v43[1];
      unint64_t v46 = v44 + v45;
      char v47 = v94;
      if (v45 < v44 + v45) {
        break;
      }
LABEL_69:
      objc_autoreleasePoolPop(v89);
      int v41 = 0;
      uint64_t v40 = 1LL;
      if ((v90 & 1) == 0)
      {
        *((_DWORD *)v98 + 4) = (_DWORD)v98[2] & 0xFFFFF7FF | v88;
        return;
      }
    }

    unint64_t v92 = v44 + v45;
    while (1)
    {
      uint64_t v48 = *(void **)(v99 + 8 * v45);
      uint64_t v49 = *(void *)(v100 + 8 * v45);
      uint64_t v50 = [v48 deleteRule];
      if (v50)
      {
        uint64_t v55 = v50;
        if (v50 != 3 || (v47 & 2) != 0)
        {
          _PF_Handler_Primitive_GetProperty(v98, v45, v49, *(void *)(v97 + 8 * v45), v51, v52, v53, v54);
          if (v56)
          {
            __int128 v57 = v56;
            if ([v56 count])
            {
              if ((v47 & 2) != 0 || (unint64_t)(v55 - 1) <= 1)
              {
                uint64_t v58 = (void *)[v48 inverseRelationship];
                uint64_t v59 = [v58 isToMany];
                id v60 = (void *)[v57 allObjects];
                __int128 v61 = (void *)[v60 count];
                v93 = v87;
                MEMORY[0x1895F8858]();
                if ((unint64_t)v61 > 0x200)
                {
                  v65 = (void *)NSAllocateScannedUncollectable();
                }

                else
                {
                  __int128 v64 = &v87[-v63];
                  bzero(&v87[-v63], 8 * v62);
                  v65 = v64;
                }

                uint64_t v66 = v98;
                v101 = v65;
                objc_msgSend(v60, "getObjects:range:", v65, 0, v61);
                unint64_t v67 = *(void *)(v42 + 128);
                BOOL v68 = v45 >= v67;
                unint64_t v69 = v45 - v67;
                if (v68 && v69 < *(void *)(v42 + 136)) {
                  uint64_t v70 = (void *)[v66 mutableOrderedSetValueForKey:v49];
                }
                else {
                  uint64_t v70 = (void *)[v66 mutableSetValueForKey:v49];
                }
                uint64_t v71 = [v70 removeAllObjects];
                if (v61)
                {
                  uint64_t v72 = 0LL;
                  v96 = v61;
                  while (1)
                  {
                    unint64_t v73 = (void *)MEMORY[0x186E3E5D8](v71);
                    v74 = (id **)v101[v72];
                    if (v58)
                    {
                      if ((v59 & 1) == 0)
                      {
                        uint64_t v75 = v59;
                        id v76 = (void *)[(id)v101[v72] entity];
                        uint64_t v77 = [v58 entity];
                        unint64_t v78 = [v58 _entitysReferenceID];
                        if (v76 != (void *)v77) {
                          unint64_t v78 = [v76 _offsetRelationshipIndex:v78 fromSuperEntity:v77 andIsToMany:0];
                        }
                        uint64_t v79 = *(void *)(_kvcPropertysPrimitiveGetters((unint64_t *)v76) + 8 * v78);
                        uint64_t v80 = [v58 name];
                        _PF_Handler_Primitive_GetProperty(v74, v78, v80, v79, v81, v82, v83, v84);
                        uint64_t v66 = v98;
                        uint64_t v59 = v75;
                        __int128 v61 = v96;
                        if (v85 != v98)
                        {
                          int v86 = 1;
                          goto LABEL_61;
                        }
                      }

                      -[NSManagedObject _maintainInverseRelationship:forProperty:oldDestination:newDestination:]( (uint64_t *)v66,  v58,  (uint64_t *)v74,  0LL);
                    }

                    int v86 = 0;
LABEL_61:
                    objc_autoreleasePoolPop(v73);
                    if (v61 == (void *)++v72)
                    {
                      char v47 = v94;
                      unint64_t v42 = v91;
                      break;
                    }
                  }
                }

                unint64_t v46 = v92;
              }
            }
          }
        }
      }

      if (++v45 == v46) {
        goto LABEL_69;
      }
    }
  }

- (void)_substituteEntityAndProperty:(void *)a3 inString:
{
  unsigned int v3 = a3;
  if (a2)
  {
    if (a3)
    {
      id v5 = _PFEntityForManagedObject(a1);
      unint64_t v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "managedObjectModel"), "_localizationPolicy");
      uint64_t v7 = [v6 localizedEntityNameForEntity:v5];
      uint64_t v8 = [v6 localizedPropertyNameForProperty:a2];
      if (v7 | v8)
      {
        uint64_t v9 = v8;
        int v10 = (void *)[v3 mutableCopyWithZone:0];
        unsigned int v3 = v10;
        if (v7) {
          objc_msgSend( v10,  "replaceOccurrencesOfString:withString:options:range:",  @"%{ENTITY}@",  v7,  2,  0,  objc_msgSend(v10, "length"));
        }
        if (v9) {
          objc_msgSend( v3,  "replaceOccurrencesOfString:withString:options:range:",  @"%{PROPERTY}@",  v9,  2,  0,  objc_msgSend(v3, "length"));
        }
        id v11 = v3;
      }
    }
  }

  return v3;
}

- (id)diffOrderedSets:(void *)a1 :(void *)a2 :(id *)a3 :(id *)a4 :(id *)a5 :(id *)a6 :(id *)a7
{
  uint64_t v7 = a7;
  uint64_t v9 = a5;
  uint64_t v88 = *MEMORY[0x1895F89C0];
  uint64_t v83 = a3;
  uint64_t v84 = a4;
  *a3 = 0LL;
  *a4 = 0LL;
  *a5 = 0LL;
  *a6 = 0LL;
  *a7 = 0LL;
  size_t v12 = [a2 count];
  id v85 = a1;
  size_t v13 = [a1 count];
  unint64_t v14 = MEMORY[0x1895F8858](v13);
  char v17 = (char *)v76 - v16;
  if (v14 > 0x200)
  {
    uint64_t v18 = NSAllocateScannedUncollectable();
    char v17 = (char *)v18;
  }

  else
  {
    bzero((char *)v76 - v16, 8 * v15);
  }

  MEMORY[0x1895F8858](v18);
  uint64_t v21 = (char *)v76 - v20;
  uint64_t v81 = a6;
  if (v12 > 0x200) {
    uint64_t v21 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v76 - v20, 8 * v19);
  }
  uint64_t v79 = a2;
  uint64_t v22 = objc_msgSend(a2, "getObjects:range:", v21, 0, v12);
  MEMORY[0x1895F8858](v22);
  uint64_t v25 = (char *)v76 - v24;
  size_t v26 = 8 * v23;
  unint64_t v80 = v27;
  if (v27 > 0x200)
  {
    uint64_t v25 = (char *)NSAllocateScannedUncollectable();
    v87 = (char *)NSAllocateScannedUncollectable();
  }

  else
  {
    bzero((char *)v76 - v24, 8 * v23);
    MEMORY[0x1895F8858](v28);
    v87 = (char *)v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v87, v26);
  }

  objc_msgSend(v85, "getObjects:range:", v17, 0, v13);
  qsort_b(v17, v13, 8uLL, &__block_literal_global_7);
  qsort_b(v21, v12, 8uLL, &__block_literal_global_7);
  size_t v29 = 0LL;
  size_t v30 = 0LL;
  size_t v31 = 0LL;
  size_t v32 = 0LL;
  if (v13 && v12)
  {
    size_t v32 = 0LL;
    size_t v31 = 0LL;
    size_t v30 = 0LL;
    size_t v29 = 0LL;
    do
    {
      uint64_t v33 = *(void *)&v17[8 * v30];
      uint64_t v34 = *(void *)&v21[8 * v29];
      if (v33 >= v34)
      {
        if (v33 == v34) {
          ++v30;
        }
        else {
          *(void *)&v87[8 * v31++] = v34;
        }
        ++v29;
      }

      else
      {
        *(void *)&v25[8 * v32++] = v33;
        ++v30;
      }
    }

    while (v30 < v13 && v29 < v12);
  }

  size_t v35 = v13 - v30;
  if (v13 > v30)
  {
    size_t v36 = v35 + v32;
    uint64_t v37 = &v25[8 * v32];
    uint64_t v38 = &v17[8 * v30];
    do
    {
      uint64_t v39 = *(void *)v38;
      v38 += 8;
      *(void *)uint64_t v37 = v39;
      v37 += 8;
      --v35;
    }

    while (v35);
    size_t v32 = v36;
  }

  size_t v40 = v12 - v29;
  if (v12 > v29)
  {
    size_t v41 = v40 + v31;
    unint64_t v42 = &v87[8 * v31];
    uint64_t v43 = &v21[8 * v29];
    do
    {
      uint64_t v44 = *(void *)v43;
      v43 += 8;
      *(void *)unint64_t v42 = v44;
      v42 += 8;
      --v40;
    }

    while (v40);
    size_t v31 = v41;
  }

  int v86 = v25;
  uint64_t v82 = v7;
  unint64_t v78 = v17;
  if (v32)
  {
    objc_msgSend(v85, "getObjects:range:", v17, 0, v13);
    unint64_t v45 = (void *)[MEMORY[0x189607938] indexSet];
    if (v13)
    {
      uint64_t v46 = 0LL;
      char v47 = v78;
      do
      {
        if (bsearch_b(v47, v86, v32, 8uLL, &__block_literal_global_7)) {
          [v45 addIndex:v46];
        }
        ++v46;
        v47 += 8;
      }

      while (v13 != v46);
    }

    uint64_t v48 = v83;
    *uint64_t v83 = v45;
    id v49 = v45;
    size_t v32 = (size_t)(id)[v85 mutableCopy];
    [(id)v32 removeObjectsAtIndexes:*v48];
    uint64_t v7 = v82;
  }

  uint64_t v50 = objc_msgSend(v79, "getObjects:range:", v21, 0, v12);
  if (v31)
  {
    uint64_t v79 = v9;
    v76[1] = v76;
    size_t v77 = v32;
    MEMORY[0x1895F8858](v50);
    uint64_t v52 = (char *)v76 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v53 = (void *)[MEMORY[0x189607938] indexSet];
    if (v12)
    {
      uint64_t v54 = 0LL;
      uint64_t v55 = 0LL;
      uint64_t v56 = 0LL;
      do
      {
        if (bsearch_b(&v21[v54], v87, v31, 8uLL, &__block_literal_global_7))
        {
          [v53 addIndex:v55];
          *(void *)&v52[8 * v56++] = *(void *)&v21[8 * v55];
        }

        ++v55;
        v54 += 8LL;
      }

      while (v12 != v55);
    }

    else
    {
      uint64_t v56 = 0LL;
    }

    __int128 v57 = v84;
    *uint64_t v84 = v53;
    id v58 = v53;
    size_t v32 = v77;
    if (!v77) {
      size_t v32 = (size_t)(id)[v85 mutableCopy];
    }
    uint64_t v59 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:v52 count:v56];
    uint64_t v9 = (id *)v79;
    *uint64_t v79 = v59;
    [(id)v32 insertObjects:v59 atIndexes:*v57];
    uint64_t v7 = v82;
  }

  if (v32) {
    id v60 = (id)v32;
  }
  else {
    id v60 = v85;
  }
  unint64_t v61 = [v60 count];
  unint64_t v62 = MEMORY[0x1895F8858](v61);
  v65 = (char *)v76 - v64;
  if (v62 > 0x200) {
    v65 = (char *)NSAllocateScannedUncollectable();
  }
  else {
    bzero((char *)v76 - v64, 8 * v63);
  }
  objc_msgSend(v60, "getObjects:range:", v65, 0, v61);
  uint64_t v66 = (void *)[MEMORY[0x189607938] indexSet];
  unint64_t v67 = (void *)[MEMORY[0x189603FA8] array];
  if (v61)
  {
    for (uint64_t i = 0LL; i != v61; ++i)
    {
      if (*(void *)&v21[8 * i] != *(void *)&v65[8 * i])
      {
        [v66 addIndex:i];
        [v67 addObject:*(void *)&v21[8 * i]];
      }
    }
  }

  uint64_t v69 = [v66 count];
  uint64_t v70 = v81;
  if (v69)
  {
    *uint64_t v70 = v66;
    *uint64_t v7 = v67;
  }

  if (v13 >= 0x201) {
    NSZoneFree(0LL, v78);
  }
  if (v12 >= 0x201) {
    NSZoneFree(0LL, v21);
  }
  if (v80 >= 0x201)
  {
    NSZoneFree(0LL, v86);
    NSZoneFree(0LL, v87);
  }

  if (v61 >= 0x201) {
    NSZoneFree(0LL, v65);
  }
  id v71 = *v83;
  id v72 = *v84;
  id v73 = *v9;
  id v74 = *v70;
  return *v7;
}

uint64_t __61__NSManagedObject__NSInternalMethods__diffOrderedSets_____::__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  if (*a2 > *a3) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = -1;
  }
  if (*a2 == *a3) {
    return 0LL;
  }
  else {
    return v3;
  }
}

- (void)_genericUpdateFromSnapshot:(_DWORD *)a1
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  unsigned __int8 v4 = _PFEntityForManagedObject(a1);
  id v5 = (void *)[v4 propertiesByName];
  uint64_t v27 = _kvcPropertysPrimitiveGetters(v4);
  uint64_t v25 = _kvcPropertysPrimitiveSetters((uint64_t)v4);
  if (v4) {
    id v29 = (id)v4[13];
  }
  else {
    id v29 = 0LL;
  }
  uint64_t v26 = objc_msgSend(v5, "values", v25);
  uint64_t v28 = [MEMORY[0x189603FE8] null];
  [a1 willAccessValueForKey:0];
  a1[4] |= 0x800u;
  unint64_t v6 = [a2 count];
  unint64_t v7 = MEMORY[0x1895F8858](v6);
  int v10 = (char *)&v25 - v9;
  size_t v11 = 8 * v8;
  if (v7 >= 0x201)
  {
    int v10 = (char *)NSAllocateScannedUncollectable();
    size_t v13 = (char *)NSAllocateScannedUncollectable();
    [a2 getObjects:v13 andKeys:v10];
  }

  else
  {
    bzero((char *)&v25 - v9, 8 * v8);
    MEMORY[0x1895F8858](v12);
    size_t v13 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    bzero(v13, v11);
    [a2 getObjects:v13 andKeys:v10];
    if (!v6) {
      goto LABEL_26;
    }
  }

  uint64_t v14 = 0LL;
  do
  {
    uint64_t v15 = *(void *)&v10[8 * v14];
    if (*(void *)&v13[8 * v14] == v28) {
      uint64_t v16 = 0LL;
    }
    else {
      uint64_t v16 = *(void **)&v13[8 * v14];
    }
    unint64_t v17 = [v29 indexForKey:*(void *)&v10[8 * v14]];
    unint64_t v22 = v17;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v23 = (void *)[a1 primitiveValueForKey:v15];
    }
    else {
      _PF_Handler_Primitive_GetProperty((id **)a1, v17, v15, *(void *)(v27 + 8 * v17), v18, v19, v20, v21);
    }
    uint64_t v24 = v23;
    if (v16 != v23 && ([v23 isEqual:v16] & 1) == 0)
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [a1 willChangeValueForKey:v15];
        [a1 setPrimitiveValue:v16 forKey:v15];
      }

      else
      {
        if ([*(id *)(v26 + 8 * v22) _isToManyRelationship])
        {
          -[NSManagedObject _updateToManyRelationship:from:to:with:](a1, v15, v24, v16, v24);
          goto LABEL_23;
        }

        [a1 willChangeValueForKey:v15];
        _PF_Handler_Primitive_SetProperty((char **)a1, v22, v16, v15, *(void *)(v25 + 8 * v22));
      }

      [a1 didChangeValueForKey:v15];
    }

- (void)_updateFromSnapshot:(uint64_t)a1
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    unsigned __int8 v4 = (unint64_t *)_PFEntityForManagedObject((id)a1);
    id v5 = v4;
    if (v4) {
      unint64_t v6 = v4[13];
    }
    else {
      unint64_t v6 = 0LL;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 mapping] == v6)
    {
      int v7 = *(_DWORD *)(a1 + 16);
      if ((v7 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, (id)a1, *(void *)(a1 + 32));
        int v7 = *(_DWORD *)(a1 + 16);
      }

      *(_DWORD *)(a1 + 16) = v7 | 0x800;
      if (v5) {
        uint64_t v8 = (_OWORD *)v5[14];
      }
      else {
        uint64_t v8 = 0LL;
      }
      uint64_t v9 = *(void *)(v6 + 40);
      uint64_t v10 = _kvcPropertysPrimitiveGetters(v5);
      uint64_t v37 = v5;
      uint64_t v36 = _kvcPropertysPrimitiveSetters((uint64_t)v5);
      uint64_t v15 = [a2 values];
      uint64_t v16 = 0LL;
      size_t v35 = v8;
      __int128 v17 = v8[5];
      __int128 v18 = v8[6];
      __int128 v39 = v8[3];
      __int128 v40 = v17;
      __int128 v19 = v8[10];
      __int128 v41 = v18;
      __int128 v42 = v19;
      __int128 v43 = v8[14];
      do
      {
        uint64_t v20 = (unint64_t *)(&v39 + v16);
        unint64_t v22 = *v20;
        unint64_t v21 = v20[1];
        if (*v20 < v21 + *v20)
        {
          do
          {
            uint64_t v23 = *(void **)(v15 + 8 * v22);
            if (v23)
            {
              uint64_t v24 = *(void *)(v9 + 8 * v22);
              _PF_Handler_Primitive_GetProperty((id **)a1, v22, v24, *(void *)(v10 + 8 * v22), v11, v12, v13, v14);
              if (v23 != v25
                && ([*(id *)(v37[12] + 24 + 8 * v22) _epsilonEquals:v25 rhs:v23 withFlags:1] & 1) == 0)
              {
                [(id)a1 willChangeValueForKey:v24];
                _PF_Handler_Primitive_SetProperty((char **)a1, v22, v23, v24, *(void *)(v36 + 8 * v22));
                [(id)a1 didChangeValueForKey:v24];
              }
            }

            ++v22;
            --v21;
          }

          while (v21);
        }

        ++v16;
      }

      while (v16 != 5);
      uint64_t v26 = 0LL;
      __int128 v39 = v35[9];
      __int128 v40 = v35[13];
      char v27 = 1;
      do
      {
        char v38 = v27;
        uint64_t v28 = (unint64_t *)(&v39 + v26);
        unint64_t v29 = *v28;
        unint64_t v30 = v28[1];
        if (*v28 < v30 + *v28)
        {
          do
          {
            size_t v31 = *(void **)(v15 + 8 * v29);
            if (v31)
            {
              uint64_t v32 = *(void *)(v9 + 8 * v29);
              _PF_Handler_Primitive_GetProperty((id **)a1, v29, v32, *(void *)(v10 + 8 * v29), v11, v12, v13, v14);
              if (v31 != v33)
              {
                uint64_t v34 = v33;
                if (([v33 isEqual:v31] & 1) == 0) {
                  -[NSManagedObject _updateToManyRelationship:from:to:with:]((void *)a1, v32, v34, v31, v34);
                }
              }
            }

            ++v29;
            --v30;
          }

          while (v30);
        }

        char v27 = 0;
        uint64_t v26 = 1LL;
      }

      while ((v38 & 1) != 0);
      *(_DWORD *)(a1 + 16) &= ~0x800u;
    }

    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:]((_DWORD *)a1, a2);
    }
  }

- (void)_updateFromRefreshSnapshot:(int)a3 includingTransients:
{
  uint64_t v112 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl(a1[4], sel__updateFromRefreshSnapshot_includingTransients_);
    }
    unint64_t v6 = (unint64_t *)_PFEntityForManagedObject(a1);
    int v7 = v6;
    if (v6) {
      unint64_t v8 = v6[13];
    }
    else {
      unint64_t v8 = 0LL;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 mapping] == v8)
    {
      int v9 = *((_DWORD *)a1 + 4);
      if ((v9 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, a1, a1[4]);
        int v9 = *((_DWORD *)a1 + 4);
      }

      *((_DWORD *)a1 + 4) = v9 | 0x800;
      if (v7) {
        uint64_t v10 = (_OWORD *)v7[14];
      }
      else {
        uint64_t v10 = 0LL;
      }
      uint64_t v101 = *(void *)(v8 + 40);
      uint64_t v100 = _kvcPropertysPrimitiveGetters(v7);
      unint64_t v99 = _kvcPropertysPrimitiveSetters((uint64_t)v7);
      v102 = (id **)a1;
      uint64_t v103 = [a2 values];
      uint64_t v15 = v10 + 6;
      LODWORD(v97) = a3;
      id v95 = v111;
      v96 = v10;
      v104 = v7;
      if ((a3 & 1) != 0)
      {
        __int128 v16 = v10[1];
        v111[0] = *v15;
        __int128 v17 = v10[10];
        __int128 v110 = v16;
        v111[1] = v17;
        uint64_t v18 = 3LL;
      }

      else
      {
        __int128 v110 = v10[3];
        v111[0] = *v15;
        uint64_t v18 = 2LL;
      }

      uint64_t v98 = v18;
      uint64_t v19 = 0LL;
      int v94 = (_OWORD *)*MEMORY[0x189607798];
      v93 = (void *)*MEMORY[0x189607460];
      do
      {
        uint64_t v20 = (unint64_t *)&v111[v19 - 1];
        unint64_t v22 = *v20;
        unint64_t v21 = v20[1];
        if (*v20 < v21 + *v20)
        {
          do
          {
            char v27 = (void *)MEMORY[0x186E3E5D8]();
            uint64_t v28 = *(void *)(v103 + 8 * v22);
            if (v28)
            {
              uint64_t v29 = *(void *)(v101 + 8 * v22);
              _PF_Handler_Primitive_GetProperty(v102, v22, v29, *(void *)(v100 + 8 * v22), v23, v24, v25, v26);
              size_t v31 = v28 == NSKeyValueCoding_NullValue ? 0LL : (void *)v28;
              if (v31 != v30)
              {
                uint64_t v32 = v30;
                uint64_t v33 = *(void **)(v104[12] + 24LL + 8 * v22);
                id v34 = v31;
                if (([v33 _epsilonEquals:v30 rhs:v31 withFlags:1] & 1) == 0)
                {
                  if ([v33 _propertyType] == 2
                    && [v33 usesMergeableStorage])
                  {
                    [v32 merge:v31];
                    id v34 = (id)[v32 copy];
                  }

                  [v102 willChangeValueForKey:v29];
                  _PF_Handler_Primitive_SetProperty((char **)v102, v22, v34, v29, *(void *)(v99 + 8 * v22));
                  [v102 didChangeValueForKey:v29];
                }
              }
            }

            objc_autoreleasePoolPop(v27);
            ++v22;
            --v21;
          }

          while (v21);
        }

        ++v19;
      }

      while (v19 != v98);
      __int128 v110 = v96[7];
      if ((_DWORD)v97)
      {
        *id v95 = v96[11];
        uint64_t v35 = 2LL;
      }

      else
      {
        uint64_t v35 = 1LL;
      }

      for (uint64_t i = 0LL; i != v35; ++i)
      {
        uint64_t v37 = (unint64_t *)&v111[i - 1];
        unint64_t v38 = *v37;
        unint64_t v39 = v37[1];
        if (*v37 < v39 + *v37)
        {
          do
          {
            uint64_t v40 = *(void *)(v103 + 8 * v38);
            if (v40)
            {
              uint64_t v41 = *(void *)(v101 + 8 * v38);
              _PF_Handler_Primitive_GetProperty(v102, v38, v41, *(void *)(v100 + 8 * v38), v11, v12, v13, v14);
              __int128 v43 = v40 == NSKeyValueCoding_NullValue ? 0LL : (void *)v40;
              if (v43 != v42)
              {
                uint64_t v44 = v42;
                if ((![v43 isFault] || (objc_msgSend(v44, "isFault") & 1) == 0)
                  && ([v44 isEqual:v43] & 1) == 0)
                {
                  uint64_t v45 = [v43 values];
                  if (v45)
                  {
                    id v46 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v44,  *(void **)(v45 + 8));
                    [v46 addObjectsFromArray:*(void *)v45];
                  }

                  else
                  {
                    id v46 = +[_PFRoutines newMutableSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v44,  0LL);
                  }

                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v102, v41, v44, v46, v44);
                }
              }
            }

            ++v38;
            --v39;
          }

          while (v39);
        }
      }

      __int128 v110 = v96[8];
      if ((_DWORD)v97)
      {
        *id v95 = v96[12];
        uint64_t v47 = 2LL;
      }

      else
      {
        uint64_t v47 = 1LL;
      }

      int v94 = (_OWORD *)v47;
      uint64_t v48 = 0LL;
      do
      {
        id v95 = v48;
        id v49 = (unint64_t *)&v111[(void)v48 - 1];
        unint64_t v50 = *v49;
        unint64_t v99 = v49[1] + *v49;
        if (v50 < v99)
        {
          do
          {
            uint64_t v51 = *(void **)(v103 + 8 * v50);
            if (v51)
            {
              uint64_t v52 = *(void *)(v100 + 8 * v50);
              uint64_t v98 = *(void *)(v101 + 8 * v50);
              _PF_Handler_Primitive_GetProperty(v102, v50, v98, v52, v11, v12, v13, v14);
              uint64_t v54 = v53;
              uint64_t v55 = NSKeyValueCoding_NullValue;
              uint64_t v56 = v51 == (void *)NSKeyValueCoding_NullValue ? 0LL : v51;
              if (v56 != v53
                && (![v56 isFault] || (objc_msgSend(v54, "isFault") & 1) == 0)
                && ([v54 isEqual:v56] & 1) == 0)
              {
                if (v51 == (void *)v55)
                {
                  id v60 = 0LL;
                  v104 = 0LL;
                  id v58 = 0LL;
                  uint64_t v59 = 0LL;
                }

                else
                {
                  uint64_t v57 = [v51 values];
                  uint64_t v59 = *(void **)v57;
                  id v58 = *(void **)(v57 + 8);
                  id v60 = *(void **)(v57 + 24);
                  v104 = *(void **)(v57 + 16);
                }

                if ([v54 isEqual:v60])
                {
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v102, v98, v54, v104, v54);
                }

                else
                {
                  id v97 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v54,  v58);
                  v96 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v60,  v58);
                  if ([v96 count])
                  {
                    if (+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v96,  v104))
                    {
                      v104 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v96,  v104,  v97);
                    }

                    else if (+[_PFRoutines _objectsInOrderedCollection:formSubstringInOrderedCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v60,  v54))
                    {
                      if ([v97 count]) {
                        v104 = +[_PFRoutines _replaceBaseline:inOrderedSet:withOrderedSet:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v96,  v97,  v104);
                      }
                    }

                    else
                    {
                      v93 = (void *)[v104 count];
                      v92[1] = v92;
                      MEMORY[0x1895F8858](v93);
                      uint64_t v63 = (char *)v92 - v62;
                      if (v64 > 0x200) {
                        uint64_t v63 = (char *)NSAllocateScannedUncollectable();
                      }
                      else {
                        bzero((char *)v92 - v62, 8 * v61);
                      }
                      __int128 v107 = 0u;
                      __int128 v108 = 0u;
                      __int128 v105 = 0u;
                      __int128 v106 = 0u;
                      uint64_t v65 = 0LL;
                      uint64_t v66 = [v104 countByEnumeratingWithState:&v105 objects:v109 count:16];
                      if (v66)
                      {
                        uint64_t v67 = *(void *)v106;
                        do
                        {
                          for (uint64_t j = 0LL; j != v66; ++j)
                          {
                            if (*(void *)v106 != v67) {
                              objc_enumerationMutation(v104);
                            }
                            uint64_t v69 = *(void *)(*((void *)&v105 + 1) + 8 * j);
                            if (([v59 containsObject:v69] & 1) != 0
                              || [v54 containsObject:v69])
                            {
                              *(void *)&v63[8 * v65++] = v69;
                            }
                          }

                          uint64_t v66 = [v104 countByEnumeratingWithState:&v105 objects:v109 count:16];
                        }

                        while (v66);
                      }

                      BOOL v70 = (unint64_t)v93 < 0x201;
                      v104 = (void *)[objc_alloc(MEMORY[0x189603FD0]) initWithObjects:v63 count:v65];
                      if (!v70) {
                        NSZoneFree(0LL, v63);
                      }
                      id v71 = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v97,  v104);
                      if ([v71 count])
                      {
                        unint64_t v72 = [v97 count];
                        v93 = v92;
                        unint64_t v73 = MEMORY[0x1895F8858](v72);
                        id v76 = (char *)v92 - v75;
                        if (v73 > 0x200) {
                          id v76 = (char *)NSAllocateScannedUncollectable();
                        }
                        else {
                          bzero((char *)v92 - v75, 8 * v74);
                        }
                        size_t v77 = v76;
                        +[_PFRoutines getIndexes:fromCollection:forObjectsInCollection:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v76,  v104,  v97);
                        uint64_t v78 = [v97 count];
                        if (v78)
                        {
                          uint64_t v79 = 0LL;
                          uint64_t v80 = 0LL;
                          uint64_t v81 = 0LL;
                          char v82 = 0;
                          uint64_t v83 = v77;
                          do
                          {
                            if (v83[v79] == -1)
                            {
                              BOOL v84 = (v82 & 1) == 0;
                              char v82 = 1;
                              if (v84) {
                                uint64_t v81 = 1LL;
                              }
                              else {
                                ++v81;
                              }
                              if (v84) {
                                uint64_t v80 = v79;
                              }
                            }

                            else if (v80 | v81)
                            {
                              uint64_t v85 = objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", v80, v81);
                              uint64_t v86 = [v97 objectsAtIndexes:v85];
                              uint64_t v87 = objc_msgSend( MEMORY[0x1896078D0],  "indexSetWithIndexesInRange:",  *(unsigned int *)&v77[4 * v79],  v81);
                              [v104 insertObjects:v86 atIndexes:v87];
                              char v82 = 0;
                              uint64_t v81 = 0LL;
                              uint64_t v80 = 0LL;
                              uint64_t v83 = v77;
                            }

                            else
                            {
                              uint64_t v81 = 0LL;
                              uint64_t v80 = 0LL;
                            }

                            ++v79;
                          }

                          while (v78 != v79);
                        }

                        else
                        {
                          uint64_t v81 = 0LL;
                          uint64_t v80 = 0LL;
                          uint64_t v83 = v77;
                        }

                        if (v72 >= 0x201) {
                          NSZoneFree(0LL, v83);
                        }
                        if (v80 | v81)
                        {
                          uint64_t v88 = objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", v80, v81);
                          uint64_t v89 = [v97 objectsAtIndexes:v88];
                          uint64_t v90 = [v104 count];
                          uint64_t v91 = objc_msgSend(MEMORY[0x1896078D0], "indexSetWithIndexesInRange:", v90, v81);
                          [v104 insertObjects:v89 atIndexes:v91];
                        }
                      }
                    }
                  }

                  else
                  {
                    v104 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]( (uint64_t)&OBJC_CLASS____PFRoutines,  v97,  v104);
                  }

                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v102, v98, v54, v104, v54);
                }
              }
            }

            ++v50;
          }

          while (v50 != v99);
        }

        uint64_t v48 = (_OWORD *)((char *)v95 + 1);
      }

      while ((_OWORD *)((char *)v95 + 1) != v94);
      *((_DWORD *)v102 + 4) &= ~0x800u;
    }

    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:](a1, a2);
    }
  }

- (void)_updateFromUndoSnapshot:(id *)a1
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (_PF_Threading_Debugging_level) {
      _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a1[4], sel__updateFromUndoSnapshot_);
    }
    id v58 = a1;
    unsigned __int8 v4 = (unint64_t *)_PFEntityForManagedObject(a1);
    id v5 = v4;
    if (v4) {
      unint64_t v6 = v4[13];
    }
    else {
      unint64_t v6 = 0LL;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a2 mapping] == v6)
    {
      int v7 = *((_DWORD *)a1 + 4);
      if ((v7 & 0x8000) != 0)
      {
        -[NSFaultHandler fulfillFault:withContext:](_insertion_fault_handler, a1, (uint64_t)a1[4]);
        int v7 = *((_DWORD *)a1 + 4);
      }

      *((_DWORD *)a1 + 4) = v7 | 0x800;
      if (v5) {
        unint64_t v8 = (_OWORD *)v5[14];
      }
      else {
        unint64_t v8 = 0LL;
      }
      uint64_t v59 = *(void *)(v6 + 40);
      uint64_t v60 = _kvcPropertysPrimitiveGetters(v5);
      uint64_t v9 = _kvcPropertysPrimitiveSetters((uint64_t)v5);
      uint64_t v14 = [a2 values];
      uint64_t v15 = 0LL;
      uint64_t v56 = v8;
      __int128 v16 = v8[6];
      __int128 v65 = v8[1];
      __int128 v66 = v16;
      __int128 v17 = v8[14];
      __int128 v67 = v8[10];
      __int128 v68 = v17;
      uint64_t v18 = v58;
      do
      {
        uint64_t v19 = (unint64_t *)(&v65 + v15);
        unint64_t v20 = *v19;
        unint64_t v21 = v19[1];
        if (*v19 < v21 + *v19)
        {
          do
          {
            uint64_t v22 = *(void *)(v14 + 8 * v20);
            if (v22)
            {
              uint64_t v23 = *(void *)(v59 + 8 * v20);
              _PF_Handler_Primitive_GetProperty(v58, v20, v23, *(void *)(v60 + 8 * v20), v10, v11, v12, v13);
              uint64_t v25 = v22 == NSKeyValueCoding_NullValue ? 0LL : (void *)v22;
              if (v25 != v24 && ([v24 isEqual:v25] & 1) == 0)
              {
                [v58 willChangeValueForKey:v23];
                _PF_Handler_Primitive_SetProperty((char **)v58, v20, v25, v23, *(void *)(v9 + 8 * v20));
                [v58 didChangeValueForKey:v23];
              }
            }

            ++v20;
            --v21;
          }

          while (v21);
        }

        ++v15;
      }

      while (v15 != 4);
      uint64_t v26 = 0LL;
      __int128 v65 = v56[7];
      __int128 v66 = v56[11];
      char v27 = 1;
      uint64_t v28 = v59;
      do
      {
        char v29 = v27;
        unint64_t v30 = (unint64_t *)(&v65 + v26);
        unint64_t v31 = *v30;
        unint64_t v32 = v30[1];
        if (*v30 < v32 + *v30)
        {
          do
          {
            uint64_t v33 = *(void *)(v14 + 8 * v31);
            if (v33)
            {
              uint64_t v34 = *(void *)(v28 + 8 * v31);
              _PF_Handler_Primitive_GetProperty(v58, v31, v34, *(void *)(v60 + 8 * v31), v10, v11, v12, v13);
              uint64_t v36 = v33 == NSKeyValueCoding_NullValue ? 0LL : (void *)v33;
              if (v36 != v35)
              {
                uint64_t v37 = v35;
                if ((![v36 isFault] || (objc_msgSend(v37, "isFault") & 1) == 0)
                  && ([v37 isEqual:v36] & 1) == 0)
                {
                  unint64_t v38 = (void *)[v36 values];
                  unint64_t v39 = (void *)[objc_alloc(MEMORY[0x189603FE0]) initWithSet:v37];
                  [v39 minusSet:*v38];
                  [v39 unionSet:v38[1]];
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v58, v34, v37, v39, v37);

                  uint64_t v28 = v59;
                }
              }
            }

            ++v31;
            --v32;
          }

          while (v32);
        }

        char v27 = 0;
        uint64_t v26 = 1LL;
      }

      while ((v29 & 1) != 0);
      uint64_t v40 = 0LL;
      __int128 v65 = v56[8];
      __int128 v66 = v56[12];
      char v41 = 1;
      do
      {
        char v57 = v41;
        __int128 v42 = (unint64_t *)(&v65 + v40);
        unint64_t v44 = *v42;
        unint64_t v43 = v42[1];
        unint64_t v45 = v43 + v44;
        if (v44 < v43 + v44)
        {
          do
          {
            uint64_t v46 = *(void *)(v14 + 8 * v44);
            if (v46)
            {
              uint64_t v47 = *(void *)(v28 + 8 * v44);
              _PF_Handler_Primitive_GetProperty(v18, v44, v47, *(void *)(v60 + 8 * v44), v10, v11, v12, v13);
              id v49 = v46 == NSKeyValueCoding_NullValue ? 0LL : (void *)v46;
              if (v49 != v48)
              {
                unint64_t v50 = v48;
                if ((![v49 isFault] || (objc_msgSend(v50, "isFault") & 1) == 0)
                  && ([v50 isEqual:v49] & 1) == 0)
                {
                  uint64_t v51 = (void *)[v50 mutableCopy];
                  __int128 v61 = 0u;
                  __int128 v62 = 0u;
                  __int128 v63 = 0u;
                  __int128 v64 = 0u;
                  uint64_t v52 = [v49 countByEnumeratingWithState:&v61 objects:v69 count:16];
                  if (v52)
                  {
                    uint64_t v53 = v52;
                    uint64_t v54 = *(void *)v62;
                    do
                    {
                      for (uint64_t i = 0LL; i != v53; ++i)
                      {
                        if (*(void *)v62 != v54) {
                          objc_enumerationMutation(v49);
                        }
                        [*(id *)(*((void *)&v61 + 1) + 8 * i) applyToSet:v51];
                      }

                      uint64_t v53 = [v49 countByEnumeratingWithState:&v61 objects:v69 count:16];
                    }

                    while (v53);
                  }

                  uint64_t v18 = v58;
                  -[NSManagedObject _updateToManyRelationship:from:to:with:](v58, v47, v50, v51, v50);

                  uint64_t v28 = v59;
                }
              }
            }

            ++v44;
          }

          while (v44 != v45);
        }

        char v41 = 0;
        uint64_t v40 = 1LL;
      }

      while ((v57 & 1) != 0);
      *((_DWORD *)v18 + 4) &= ~0x800u;
    }

    else
    {
      -[NSManagedObject _genericUpdateFromSnapshot:](a1, a2);
    }
  }

- (id)_orderKeysForRelationshipWithName__:(id)a3
{
  if (-[NSManagedObject isUpdated](self, "isUpdated")
    || -[NSManagedObject isInserted](self, "isInserted")
    || -[NSManagedObject isDeleted](self, "isDeleted"))
  {
    return 0LL;
  }

  else
  {
    return (id)objc_msgSend( -[NSManagedObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", a3),  "_orderedObjectsAndKeys");
  }

- (BOOL)_updateLocationsOfObjectsToLocationByOrderKey:(id)a3 inRelationshipWithName:(id)a4 error:(id *)a5
{
  if (!-[NSManagedObject isUpdated](self, "isUpdated")
    && !-[NSManagedObject isInserted](self, "isInserted")
    && !-[NSManagedObject isDeleted](self, "isDeleted"))
  {
    return objc_msgSend( -[NSManagedObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", a4),  "_reorderObjectsToLocationsByOrderKey:error:",  a3,  a5);
  }

  if (a5) {
    *a5 = (id)[MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607460] code:134060 userInfo:&unk_189F036F8];
  }
  return 0;
}

+ ($2554683636028369AA004D99F7FAFE96)_PFMOClassFactoryData
{
  return 0LL;
}

- (BOOL)_defaultValidation:(id *)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);
  return class_respondsToSelector(Class, a3);
}

- (void)methodForSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);
  return class_getMethodImplementation(Class, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (!a3) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"%@: null selector", _NSMethodExceptionProem() format];
  }
  Class Class = object_getClass(self);
  unint64_t v6 = Class;
  if (Class)
  {
    Class Superclass = Class;
    while (1)
    {
      unsigned int outCount = 0;
      unint64_t v8 = class_copyProtocolList(Superclass, &outCount);
      uint64_t v9 = v8;
      if (outCount) {
        break;
      }
      if (v8) {
LABEL_12:
      }
        free(v9);
      Class Superclass = class_getSuperclass(Superclass);
      if (!Superclass) {
        goto LABEL_14;
      }
    }

    uint64_t v10 = 0LL;
    while (1)
    {
      uint64_t v11 = v9[v10];
      isMetaClass Class = class_isMetaClass(Superclass);
      objc_method_description MethodDescription = protocol_getMethodDescription(v11, a3, 1, !isMetaClass);
      types = MethodDescription.types;
      if (MethodDescription.name) {
        break;
      }
      uint64_t v15 = v9[v10];
      BOOL v16 = class_isMetaClass(Superclass);
      objc_method_description v17 = protocol_getMethodDescription(v15, a3, 0, !v16);
      types = v17.types;
      if (v17.name) {
        break;
      }
    }

    unint64_t v20 = types;
    free(v9);
  }

  else
  {
LABEL_14:
    id result = class_getInstanceMethod(v6, a3);
    if (!result) {
      return result;
    }
    Description = method_getDescription((Method)result);
    if (!Description->name) {
      return 0LL;
    }
    unint64_t v20 = Description->types;
  }

  return (id)[MEMORY[0x189603FA0] signatureWithObjCTypes:v20];
}

+ (Class)classForEntity:(id)a3
{
  v218 = (objc_class *)MethodImplementation;
  uint64_t v223 = *MEMORY[0x1895F89C0];
  if (!qword_18C4AB9C8)
  {
    unsigned __int8 v4 = (objc_class *)objc_opt_class();
    qword_18C4AB9C8 = (uint64_t)class_getMethodImplementation(v4, sel_willChangeValueForKey_);
    id v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_didChangeValueForKey_);
    qword_18C4AB9D0 = (uint64_t)MethodImplementation;
  }

  MEMORY[0x1895F8858](MethodImplementation);
  v217 = (char *)&v180;
  unint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(a3, "name"), "UTF8String");
  if (!v6 || (int v7 = v6, !*v6)) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Entity name must not be nil." userInfo:0]);
  }
  if ((*((_BYTE *)a3 + 120) & 4) == 0)
  {
    uint64_t v147 = [a3 managedObjectModel];
    id v148 = a3;
    if (v147) {
      id v148 = (id)[a3 managedObjectModel];
    }
    [v148 _setIsEditable:0];
  }

  v188 = v7;
  Name = class_getName(v218);
  uint64_t v9 = strchr(Name, 46);
  if (MEMORY[0x1895F8858](v9))
  {
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    memset(v177, 0, sizeof(v177));
    __int128 v176 = 0u;
    __int128 v174 = 0u;
    memset(v175, 0, sizeof(v175));
    memset(v173, 0, sizeof(v173));
    __int128 v172 = 0u;
    __int128 v170 = 0u;
    memset(v171, 0, sizeof(v171));
    memset(v169, 0, sizeof(v169));
    __int128 v168 = 0u;
    __int128 v166 = 0u;
    memset(v167, 0, sizeof(v167));
    memset(v165, 0, sizeof(v165));
    __int128 v164 = 0u;
    __int128 v162 = 0u;
    memset(v163, 0, sizeof(v163));
    memset(v161, 0, sizeof(v161));
    __int128 v160 = 0u;
    memset(v159, 0, sizeof(v159));
    unsigned int v10 = strlen(Name);
    if (v10 >= 0x1FF) {
      uint64_t v11 = 511LL;
    }
    else {
      uint64_t v11 = v10;
    }
    if ((_DWORD)v11)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        int v13 = Name[i];
        if (!Name[i]) {
          break;
        }
        if (v13 == 46) {
          LOBYTE(v13) = 95;
        }
        *((_BYTE *)v159 + i) = v13;
      }
    }

    Name = (const char *)v159;
  }

  uint64_t v14 = v188;
  v212 = Name;
  snprintf(v217, 0x200uLL, "%s_%s_", Name, v188);
  os_unfair_lock_lock(&stru_18C4AB9BC);
  v215 = 0LL;
  SEL v194 = sel_retain;
  SEL v195 = sel__retain_1;
  SEL v193 = sel__release_1;
  SEL v192 = sel_release;
  SEL v209 = sel__isGeneratedClass;
  SEL v210 = sel__isGeneratedClass_1;
  SEL v214 = sel_class;
  SEL v211 = sel_superclass;
  SEL v191 = sel__PFMOClassFactoryData;
  SEL v187 = sel_willAccessValueForKey_;
  SEL v185 = sel__classShouldAlwaysRegisterSelectorNamed_;
  SEL v186 = sel_didAccessValueForKey_;
  SEL v207 = sel_validateValue_forKey_error_;
  SEL v208 = sel_resolveInstanceMethod_;
  SEL v184 = sel__useFastValidationMethod;
  SEL v206 = sel_awakeFromFetch;
  *(void *)&__int128 v15 = 136315138LL;
  __int128 v182 = v15;
  *(void *)&__int128 v15 = 134218498LL;
  __int128 v181 = v15;
  SEL v204 = sel_didChangeValueForKey_;
  SEL v205 = sel_willChangeValueForKey_;
  SEL v203 = sel_willChangeValueForKey_withSetMutation_usingObjects_;
  SEL v202 = sel_didChangeValueForKey_withSetMutation_usingObjects_;
  SEL v200 = sel_didFireFault;
  SEL v201 = sel_willFireFault;
  SEL v183 = sel__transientPropertiesChangesMask__;
  v189 = a3;
  SEL v190 = sel__PFPlaceHolderSingleton;
  uint64_t v216 = 2LL;
  do
  {
    while (1)
    {
      while (1)
      {
        Class Class = objc_getClass(v217);
        Class v17 = Class;
        if (Class)
        {
          uint64_t v18 = Class;
        }

        else
        {
          Class ClassPair = objc_allocateClassPair(v218, v217, 0LL);
          uint64_t v18 = ClassPair;
          if (!ClassPair) {
            goto LABEL_107;
          }
          unint64_t v20 = object_getClass(ClassPair);
          ClassMethod = class_getClassMethod(v18, v195);
          Implementation = method_getImplementation(ClassMethod);
          TypeEncoding = method_getTypeEncoding(ClassMethod);
          class_addMethod(v20, v194, Implementation, TypeEncoding);
          uint64_t v24 = class_getClassMethod(v18, v193);
          uint64_t v25 = method_getImplementation(v24);
          uint64_t v26 = method_getTypeEncoding(v24);
          class_addMethod(v20, v192, v25, v26);
          char v27 = class_getClassMethod(v18, v210);
          uint64_t v28 = method_getImplementation(v27);
          char v29 = method_getTypeEncoding(v27);
          class_addMethod(v20, v209, v28, v29);
          unint64_t v30 = class_getClassMethod(v218, v214);
          unint64_t v31 = method_getTypeEncoding(v30);
          class_addMethod(v18, v214, (IMP)override_instace_class, v31);
          unint64_t v32 = class_getClassMethod(v218, v214);
          uint64_t v33 = method_getTypeEncoding(v32);
          class_addMethod(v20, v214, (IMP)override_class_class, v33);
          uint64_t v34 = class_getClassMethod(v218, v211);
          uint64_t v35 = method_getTypeEncoding(v34);
          class_addMethod(v20, v211, (IMP)override_class_superclass, v35);
          Class v213 = v20;
          int v36 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
          uint64_t v37 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone) {
            uint64_t v37 = malloc_default_zone();
          }
          if (v36) {
            size_t v38 = (((v36 - 1) >> 3) & 0x1FFFFFFC) + 108LL;
          }
          else {
            size_t v38 = 108LL;
          }
          unint64_t v39 = (char *)malloc_zone_calloc(v37, 1uLL, v38);
          *(void *)v220 = MEMORY[0x1895F87A8];
          *(void *)&v220[8] = 3221225472LL;
          *(void *)&v220[16] = __generateReturnPointerMethod_block_invoke;
          v221 = (const char *)&__block_descriptor_40_e9__v16__0_8l;
          v222 = v39;
          uint64_t v40 = imp_implementationWithBlock(v220);
          if (!v40)
          {
            uint64_t v41 = [NSString stringWithUTF8String:"Failed to generate function for '%s'"];
            _NSCoreDataLog(17LL, v41, v42, v43, v44, v45, v46, v47, (uint64_t)v14);
            uint64_t v48 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v220 = v182;
              *(void *)&v220[4] = v14;
              _os_log_fault_impl( &dword_186681000,  v48,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to generate function for '%s'",  v220,  0xCu);
            }
          }

          if (!class_addMethod(v213, v191, v40, "@@:"))
          {
            uint64_t v49 = [NSString stringWithUTF8String:"Failed to add function to class for '%s'"];
            _NSCoreDataLog(17LL, v49, v50, v51, v52, v53, v54, v55, (uint64_t)v14);
            uint64_t v56 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v220 = v182;
              *(void *)&v220[4] = v14;
              _os_log_fault_impl( &dword_186681000,  v56,  OS_LOG_TYPE_FAULT,  "CoreData: Failed to add function to class for '%s'",  v220,  0xCu);
            }
          }

          char v57 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone) {
            char v57 = malloc_default_zone();
          }
          size_t InstanceSize = class_getInstanceSize(v218);
          v215 = (char *)malloc_zone_calloc(v57, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8LL);
          *((void *)v39 + 6) = v215;
          if ((objc_class *)objc_opt_class() == v218)
          {
            uint64_t v119 = 2392384LL;
          }

          else
          {
            uint64_t v59 = (objc_class *)objc_opt_class();
            uint64_t v60 = v187;
            IMP v61 = class_getMethodImplementation(v59, v187);
            IMP v62 = class_getMethodImplementation(v218, v60);
            __int128 v63 = (objc_class *)objc_opt_class();
            __int128 v64 = v186;
            IMP v65 = class_getMethodImplementation(v63, v186);
            IMP v66 = class_getMethodImplementation(v218, v64);
            BOOL v68 = v61 != v62 || v65 != v66;
            *((_DWORD *)v39 + 24) = *((_DWORD *)v39 + 24) & 0xFFFFFFFE | v68;
            uint64_t v69 = (objc_class *)objc_opt_class();
            uint64_t v70 = class_getClassMethod(v69, v208);
            id v71 = method_getImplementation(v70);
            unint64_t v72 = class_getClassMethod(v218, v208);
            if (v71 != method_getImplementation(v72))
            {
              *((_DWORD *)v39 + 24) |= 0x40u;
              unint64_t v73 = (objc_class *)objc_opt_class();
              uint64_t v74 = class_getClassMethod(v73, v210);
              uint64_t v75 = object_getClass(v218);
              id v76 = method_getImplementation(v74);
              size_t v77 = method_getTypeEncoding(v70);
              class_addMethod(v75, v185, v76, v77);
            }

            uint64_t v78 = (objc_class *)objc_opt_class();
            uint64_t v79 = class_getMethodImplementation(v78, v207);
            if (v79 != class_getMethodImplementation(v218, v207))
            {
              *((_DWORD *)v39 + 24) |= 0x10u;
              uint64_t v80 = (objc_class *)objc_opt_class();
              uint64_t v81 = class_getClassMethod(v80, v209);
              char v82 = method_getImplementation(v81);
              uint64_t v83 = method_getTypeEncoding(v81);
              class_addMethod(v213, v184, v82, v83);
            }

            BOOL v84 = (objc_class *)objc_opt_class();
            uint64_t v85 = class_getMethodImplementation(v84, v206);
            if (v85 != class_getMethodImplementation(v218, v206)) {
              *((_DWORD *)v39 + 24) |= 0x20u;
            }
            uint64_t v86 = (objc_class *)objc_opt_class();
            IMP v87 = class_getMethodImplementation(v86, v205);
            IMP v88 = class_getMethodImplementation(v218, v205);
            uint64_t v89 = (objc_class *)objc_opt_class();
            uint64_t v90 = class_getMethodImplementation(v89, v204);
            if (v90 == class_getMethodImplementation(v218, v204) && v87 == v88) {
              int v92 = 0;
            }
            else {
              int v92 = 2;
            }
            *((_DWORD *)v39 + 24) = *((_DWORD *)v39 + 24) & 0xFFFFFFFD | v92;
            v93 = (objc_class *)objc_opt_class();
            IMP v94 = class_getMethodImplementation(v93, v203);
            IMP v95 = class_getMethodImplementation(v218, v203);
            v96 = (objc_class *)objc_opt_class();
            id v97 = class_getMethodImplementation(v96, v202);
            if (v97 == class_getMethodImplementation(v218, v202) && v94 == v95) {
              int v99 = 0;
            }
            else {
              int v99 = 4;
            }
            *((_DWORD *)v39 + 24) = *((_DWORD *)v39 + 24) & 0xFFFFFFFB | v99;
            uint64_t v100 = (objc_class *)objc_opt_class();
            IMP v199 = class_getMethodImplementation(v100, v201);
            IMP v198 = class_getMethodImplementation(v218, v201);
            uint64_t v101 = (objc_class *)objc_opt_class();
            IMP v197 = class_getMethodImplementation(v101, v200);
            IMP v196 = class_getMethodImplementation(v218, v200);
            uint64_t v102 = *((void *)a3 + 14);
            unint64_t v103 = *(void *)(v102 + 80);
            uint64_t v104 = *(void *)(v102 + 88);
            if (v103 < v104 + v103)
            {
              uint64_t v105 = *(void *)(v189[13] + 40LL);
              do
              {
                objc_msgSend( *(id *)(v105 + 8 * v103),  "UTF8String",  v159[0],  *(void *)&v159[1],  *(_OWORD *)((char *)&v159[1] + 8),  *((void *)&v159[2] + 1),  v160,  *(void *)&v161[0],  *(_OWORD *)((char *)v161 + 8),  *((void *)&v161[1] + 1),  v162,  *(void *)&v163[0],  *(_OWORD *)((char *)v163 + 8),  *((void *)&v163[1] + 1),  v164,  *(void *)&v165[0],  *(_OWORD *)((char *)v165 + 8),  *((void *)&v165[1] + 1),  v166,  *(void *)&v167[0],  *(_OWORD *)((char *)v167 + 8),  *((void *)&v167[1] + 1),  v168,  *(void *)&v169[0],  *(_OWORD *)((char *)v169 + 8),  *((void *)&v169[1] + 1),  v170,  *(void *)&v171[0],  *(_OWORD *)((char *)v171 + 8),  *((void *)&v171[1] + 1),  v172,  *(void *)&v173[0],  *(_OWORD *)((char *)v173 + 8),  *((void *)&v173[1] + 1),  v174,  *(void *)&v175[0],  *(_OWORD *)((char *)v175 + 8),  *((void *)&v175[1] + 1),  v176,  *(void *)&v177[0],  *(_OWORD *)((char *)v177 + 8),  *((void *)&v177[1] + 1),  (void)v178);
                int v106 = __strlcpy_chk();
                __strlcat_chk();
                v220[v106] = __toupper((char)v220[v106]);
                if (BYTE2(dword_18C4ABDC0)) {
                  uint64_t v107 = sel_lookUpByName();
                }
                else {
                  uint64_t v107 = (uint64_t)sel_registerName(v220);
                }
                __int128 v108 = (const char *)v107;
                if ((objc_opt_respondsToSelector() & 1) != 0 && [v218 v108])
                {
                  v109 = (char *)*((void *)v39 + 11);
                  if (!v109)
                  {
                    *((void *)v39 + 11) = v39 + 104;
                    v109 = v39 + 104;
                  }

                  v109[v103 >> 3] |= 1 << (v103 & 7);
                }

                ++v103;
                --v104;
              }

              while (v104);
            }

            __int128 v110 = (char *)*((void *)v39 + 11);
            if (v110)
            {
              *(void *)v220 = MEMORY[0x1895F87A8];
              *(void *)&v220[8] = 3221225472LL;
              *(void *)&v220[16] = __generateReturnPointerMethod_block_invoke;
              v221 = (const char *)&__block_descriptor_40_e9__v16__0_8l;
              v222 = v110;
              v111 = imp_implementationWithBlock(v220);
              class_addMethod(v213, v183, v111, "@@:");
            }

            BOOL v112 = v199 == v198;
            BOOL v113 = v197 == v196;
            int v114 = *((_DWORD *)v39 + 24);
            uint64_t v115 = 0x8000LL;
            if ((v114 & 1) == 0) {
              uint64_t v115 = 32832LL;
            }
            if ((v114 & 2) == 0) {
              v115 |= 0x40000uLL;
            }
            BOOL v116 = !v112 || !v113;
            if (v112 && v113) {
              int v117 = 0;
            }
            else {
              int v117 = 8;
            }
            *((_DWORD *)v39 + 24) = v114 & 0xFFFFFFF7 | v117;
            uint64_t v118 = v115 | 0x100;
            if (v116) {
              uint64_t v118 = v115;
            }
            if ((v114 & 4) != 0) {
              uint64_t v119 = v118;
            }
            else {
              uint64_t v119 = v118 | 0x200000;
            }
            uint64_t v14 = v188;
            a3 = v189;
          }

          if (-[objc_class contextShouldIgnoreUnmodeledPropertyChanges]( v218,  "contextShouldIgnoreUnmodeledPropertyChanges",  *(void *)&v159[0],  *((void *)&v159[0] + 1),  *(void *)&v159[1],  *((void *)&v159[1] + 1),  *(void *)&v159[2],  *((void *)&v159[2] + 1),  (void)v160,  *((void *)&v160 + 1),  *(void *)&v161[0],  *((void *)&v161[0] + 1),  *(void *)&v161[1],  *((void *)&v161[1] + 1),  (void)v162,  *((void *)&v162 + 1),  *(void *)&v163[0],  *((void *)&v163[0] + 1),  *(void *)&v163[1],  *((void *)&v163[1] + 1),  (void)v164,  *((void *)&v164 + 1),  *(void *)&v165[0],  *((void *)&v165[0] + 1),  *(void *)&v165[1],  *((void *)&v165[1] + 1),  (void)v166,  *((void *)&v166 + 1),  *(void *)&v167[0],  *((void *)&v167[0] + 1),  *(void *)&v167[1],  *((void *)&v167[1] + 1),  (void)v168,  *((void *)&v168 + 1),  *(void *)&v169[0],  *((void *)&v169[0] + 1),  *(void *)&v169[1],  *((void *)&v169[1] + 1),  (void)v170,  *((void *)&v170 + 1),  *(void *)&v171[0],  *((void *)&v171[0] + 1),  *(void *)&v171[1],  *((void *)&v171[1] + 1),  (void)v172,  *((void *)&v172 + 1),  *(void *)&v173[0],  *((void *)&v173[0] + 1),  *(void *)&v173[1],
                               *((void *)&v173[1] + 1),
                               (void)v174,
                               *((void *)&v174 + 1),
                               *(void *)&v175[0],
                               *((void *)&v175[0] + 1),
                               *(void *)&v175[1],
                               *((void *)&v175[1] + 1),
                               (void)v176,
                               *((void *)&v176 + 1),
                               *(void *)&v177[0],
                               *((void *)&v177[0] + 1),
                               *(void *)&v177[1],
                               *((void *)&v177[1] + 1),
                               (void)v178))
            uint64_t v120 = 0x400000LL;
          else {
            uint64_t v120 = 0LL;
          }
          int v121 = objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "count");
          __snprintf_chk(v217, 0x200uLL, 0, 0x200uLL, "_cd_bits_%p", v18);
          if (v121) {
            unsigned int v122 = ((v121 - 1) >> 5) + 1;
          }
          else {
            unsigned int v122 = 1;
          }
          if (v122 > 0x4000)
          {
            objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Incorrect ivar generation" userInfo:0]);
LABEL_131:
            __break(1u);
            return result;
          }

          __snprintf_chk(v219, 0xAuLL, 0, 0xAuLL, "[%dI]", v122);
          if (!class_addIvar(v18, v217, 4 * v122, 1u, v219))
          {
            objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"class_addIvar failed" userInfo:0]);
            goto LABEL_131;
          }

          *(void *)v220 = MEMORY[0x1895F87A8];
          *(void *)&v220[8] = 3221225472LL;
          *(void *)&v220[16] = __generateReturnPointerMethod_block_invoke;
          v221 = (const char *)&__block_descriptor_40_e9__v16__0_8l;
          v222 = v215;
          v123 = imp_implementationWithBlock(v220);
          class_addMethod(v213, v190, v123, "@@:");
          objc_registerClassPair(v18);
          object_setClass(v215, v18);
          v124 = v215;
          *((_DWORD *)v215 + 4) |= 0x100000u;
          *((_DWORD *)v124 + 2) = 10000;
          InstanceVariable = class_getInstanceVariable(v18, v217);
          int Offset = ivar_getOffset(InstanceVariable);
          v39[32] = ((((unsigned __int16)class_getInstanceSize(v18) + 7) & 0x3F8u) - Offset) >> 2;
          *((void *)v39 + 5) = v120 | v119;
          uint64_t v127 = -[objc_class _PFMOClassFactoryData](v18, "_PFMOClassFactoryData");
          if (v39 != (char *)v127)
          {
            uint64_t v149 = [NSString stringWithUTF8String:"Testing generated function for +classForEntity: failed for entity %s (%p)"];
            _NSCoreDataLog(17LL, v149, v150, v151, v152, v153, v154, v155, (uint64_t)v188);
            v156 = (os_log_s *)__pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v220 = 136315394;
              *(void *)&v220[4] = v188;
              *(_WORD *)&v220[12] = 2048;
              *(void *)&v220[14] = v18;
              _os_log_fault_impl( &dword_186681000,  v156,  OS_LOG_TYPE_FAULT,  "CoreData: Testing generated function for +classForEntity: failed for entity %s (%p)",  v220,  0x16u);
            }

            v157 = (void *)MEMORY[0x189603F70];
            uint64_t v158 = objc_msgSend( NSString,  "stringWithFormat:",  @"Testing generated function, factory %p != result %p",  v39,  v127);
            objc_exception_throw((id)[v157 exceptionWithName:*MEMORY[0x189603A58] reason:v158 userInfo:0]);
            goto LABEL_131;
          }

          objc_msgSend((id)objc_msgSend(a3, "versionHash"), "getBytes:length:", v39 + 56, 32);
        }

        uint64_t v128 = -[objc_class _PFMOClassFactoryData]( v18,  "_PFMOClassFactoryData",  *(void *)&v159[0],  *((void *)&v159[0] + 1),  *(void *)&v159[1],  *((void *)&v159[1] + 1),  *(void *)&v159[2],  *((void *)&v159[2] + 1),  (void)v160,  *((void *)&v160 + 1),  *(void *)&v161[0],  *((void *)&v161[0] + 1),  *(void *)&v161[1],  *((void *)&v161[1] + 1),  (void)v162,  *((void *)&v162 + 1),  *(void *)&v163[0],  *((void *)&v163[0] + 1),  *(void *)&v163[1],  *((void *)&v163[1] + 1),  (void)v164,  *((void *)&v164 + 1),  *(void *)&v165[0],  *((void *)&v165[0] + 1),  *(void *)&v165[1],  *((void *)&v165[1] + 1),  (void)v166,  *((void *)&v166 + 1),  *(void *)&v167[0],  *((void *)&v167[0] + 1),  *(void *)&v167[1],  *((void *)&v167[1] + 1),  (void)v168,  *((void *)&v168 + 1),  *(void *)&v169[0],  *((void *)&v169[0] + 1),  *(void *)&v169[1],  *((void *)&v169[1] + 1),  (void)v170,  *((void *)&v170 + 1),  *(void *)&v171[0],  *((void *)&v171[0] + 1),  *(void *)&v171[1],  *((void *)&v171[1] + 1),  (void)v172,  *((void *)&v172 + 1),  *(void *)&v173[0],  *((void *)&v173[0] + 1),  *(void *)&v173[1],
                 *((void *)&v173[1] + 1),
                 (void)v174,
                 *((void *)&v174 + 1),
                 *(void *)&v175[0],
                 *((void *)&v175[0] + 1),
                 *(void *)&v175[1],
                 *((void *)&v175[1] + 1),
                 (void)v176,
                 *((void *)&v176 + 1),
                 *(void *)&v177[0],
                 *((void *)&v177[0] + 1),
                 *(void *)&v177[1],
                 *((void *)&v177[1] + 1),
                 (void)v178);
        if (!v17) {
          goto LABEL_108;
        }
        v129 = _PFStackAllocatorCreate((unint64_t *)v220, 1024LL);
        CFDataRef v130 = CFDataCreate(v129, (const UInt8 *)(v128 + 56), 32LL);
        int v131 = objc_msgSend((id)objc_msgSend(a3, "versionHash"), "isEqual:", v130);
        int v132 = v131;
        if (!v221) {
          break;
        }
        if (v130) {
          CFRelease(v130);
        }
        if (v132) {
          goto LABEL_105;
        }
LABEL_107:
        __snprintf_chk(v217, 0x200uLL, 0, 0x200uLL, "%s_%s_%x", v212, v14, v216);
        uint64_t v216 = (v216 + 1);
      }

      *(void *)&v220[8] = *(void *)v220;
      if (!v131) {
        goto LABEL_107;
      }
LABEL_105:
      id v133 = *(id *)(v128 + 8);
      if (v133 && v133 != a3) {
        goto LABEL_107;
      }
LABEL_108:
      if (!*(void *)(v128 + 8)) {
        break;
      }
LABEL_114:
      if (v18) {
        goto LABEL_117;
      }
    }

    *(_DWORD *)uint64_t v128 = 0;
    *(void *)(v128 + 8) = a3;
    if (!*(void *)(v128 + 16)) {
      *(void *)(v128 + 16) = objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
    }
    *(void *)(v128 + 24) = 0LL;
    v134 = (void *)-[objc_class _PFPlaceHolderSingleton](v18, "_PFPlaceHolderSingleton");
    v135 = v134;
    if (v134 != *(void **)(v128 + 48))
    {
      uint64_t v136 = [NSString stringWithUTF8String:"Factory and entity class skew over placeholder singleton.  Expected %p but got %p for entity '%s'"];
      _NSCoreDataLog(17LL, v136, v137, v138, v139, v140, v141, v142, *(void *)(v128 + 48));
      v143 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        uint64_t v144 = *(void *)(v128 + 48);
        *(_DWORD *)v220 = v181;
        *(void *)&v220[4] = v144;
        *(_WORD *)&v220[12] = 2048;
        *(void *)&v220[14] = v135;
        *(_WORD *)&v220[22] = 2080;
        v221 = v14;
        _os_log_fault_impl( &dword_186681000,  v143,  OS_LOG_TYPE_FAULT,  "CoreData: Factory and entity class skew over placeholder singleton.  Expected %p but got %p for entity '%s'",  v220,  0x20u);
      }

      goto LABEL_114;
    }

    object_setClass(v134, v18);
    *(void *)(v128 + 48) = v135;
  }

  while (!v18);
LABEL_117:
  os_unfair_lock_unlock(&stru_18C4AB9BC);
  if (v215)
  {
    os_unfair_lock_lock_with_options();
    Mutable = (__CFArray *)qword_18C4AB9D8;
    if (!qword_18C4AB9D8)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
      qword_18C4AB9D8 = (uint64_t)Mutable;
    }

    CFArrayAppendValue(Mutable, v215);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C4AB9C0);
  }

  objc_opt_self();
  __dmb(0xBu);
  return v18;
}

+ (id)_PFPlaceHolderSingleton
{
  uint64_t v2 = (_DWORD *)objc_msgSend(a1, "_PFPlaceHolderSingleton_core");
  unsigned int v3 = (objc_class *)objc_opt_class();
  if (v3 != object_getClass(v2))
  {
    unsigned __int8 v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      unsigned __int8 v4 = malloc_default_zone();
    }
    size_t InstanceSize = class_getInstanceSize(v3);
    uint64_t v2 = malloc_zone_calloc(v4, 1uLL, (InstanceSize + 7) & 0xFFFFFFFFFFFFFFF8LL);
    object_setClass(v2, v3);
    v2[4] |= 0x100000u;
    uint64_t v6 = MEMORY[0x1895F87A8];
    v2[2] = 10000;
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __generateReturnPointerMethod_block_invoke;
    block[3] = &__block_descriptor_40_e9__v16__0_8l;
    block[4] = v2;
    int v7 = imp_implementationWithBlock(block);
    Class Class = object_getClass(v3);
    class_addMethod(Class, sel__PFPlaceHolderSingleton_core, v7, "@@:");
  }

  return v2;
}

+ (id)_entityName
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v3 = [a1 _PFMOClassFactoryData];
  if (!v3 || (unsigned __int8 v4 = *(void **)(v3 + 16)) == 0LL)
  {
    Name = class_getName((Class)a1);
    if (strncmp(Name, "NSManagedObject", 0xFuLL))
    {
      id AssociatedObject = objc_getAssociatedObject(a1, &PFEntityNameAssociationKey);
      uint64_t v7 = [AssociatedObject count];
      if (v7)
      {
        if (v7 == 1) {
          return (id)[AssociatedObject lastObject];
        }
      }

      else
      {
        uint64_t v9 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "persistentStoreCoordinator"), "managedObjectModel");
            if (v10)
            {
              uint64_t v11 = (void *)v10;
              uint64_t v12 = (void *)[NSString stringWithUTF8String:Name];
              __int128 v19 = 0u;
              __int128 v20 = 0u;
              __int128 v21 = 0u;
              __int128 v22 = 0u;
              uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                unsigned __int8 v4 = 0LL;
                uint64_t v15 = *(void *)v20;
                do
                {
                  for (uint64_t i = 0LL; i != v14; ++i)
                  {
                    if (*(void *)v20 != v15) {
                      objc_enumerationMutation(v11);
                    }
                    Class v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
                    uint64_t v18 = [v17 managedObjectClassName];
                    if (v18 && [v12 isEqualToString:v18])
                    {
                      if (v4) {
                        return 0LL;
                      }
                      unsigned __int8 v4 = (void *)objc_msgSend(NSString, "stringWithString:", objc_msgSend(v17, "name"));
                    }
                  }

                  uint64_t v14 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
                }

                while (v14);
                if (v4) {
                  objc_setAssociatedObject( a1,  &PFEntityNameAssociationKey,  (id)[MEMORY[0x189603F18] arrayWithObject:v4],  (void *)0x303);
                }
                return v4;
              }
            }
          }
        }
      }
    }

    return 0LL;
  }

  return v4;
}

+ (void)_entityDeallocated
{
  uint64_t v3 = [a1 _PFMOClassFactoryData];
  if (v3)
  {
    uint64_t v4 = v3;
    os_unfair_lock_lock(&stru_18C4AB9BC);
    *(void *)(v4 + 24) = 0LL;
    id v5 = (void *)[a1 _PFPlaceHolderSingleton];
    uint64_t v6 = (objc_class *)objc_opt_class();
    object_setClass(v5, v6);
    *(void *)(v4 + 8) = 0LL;
    os_unfair_lock_unlock(&stru_18C4AB9BC);
  }

+ (BOOL)_isGeneratedClass_1
{
  return 1;
}

+ (BOOL)_useFastValidationMethod
{
  return 1;
}

+ (unsigned)allocBatch:(id *)a3 withEntity:(id)a4 count:(unsigned int)a5
{
  unint64_t v8 = (objc_class *)_PFFastEntityClass((unint64_t *)a4);
  uint64_t v9 = -[objc_class _PFMOClassFactoryData](v8, "_PFMOClassFactoryData");
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  if (!*(void *)(v9 + 24))
  {
    if (a4 && (uint64_t v17 = *((void *)a4 + 14)) != 0) {
      unint64_t v18 = *(void *)(v17 + 8);
    }
    else {
      unint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "propertiesByName"), "count");
    }
    if (v18 <= 1) {
      uint64_t v19 = 1LL;
    }
    else {
      uint64_t v19 = v18;
    }
    *(void *)(v10 + 24) = 8 * v19;
  }

  unsigned int v11 = _PFAllocateObjects(v8, a3, a5, 0LL);
  int InstanceSize = class_getInstanceSize(v8);
  if (v11)
  {
    int v13 = *(_DWORD *)(v10 + 40) | (*(unsigned __int8 *)(v10 + 32) << 24);
    uint64_t v14 = v11;
    do
    {
      uint64_t v15 = (uint64_t)*a3++;
      *(_DWORD *)(v15 + 16) = v13;
      *(_DWORD *)(v15 + 20) = (InstanceSize + 7) & 0xFFFFFFF8;
      --v14;
    }

    while (v14);
  }

  return v11;
}

+ (id)batchAllocateWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4 count:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v9 = a5;
  uint64_t v10 = (id *)PF_ALLOCATE_OBJECT_ARRAY(a5);
  uint64_t v11 = [a1 allocBatch:v10 withEntity:a3 count:v5];
  if ((_DWORD)v11 == (_DWORD)v5)
  {
    if ((*((_BYTE *)a3 + 120) & 4) == 0)
    {
      uint64_t v22 = [a3 managedObjectModel];
      id v23 = a3;
      if (v22) {
        id v23 = (id)[a3 managedObjectModel];
      }
      uint64_t v11 = [v23 _setIsEditable:0];
    }

    uint64_t v24 = (uint64_t)&v24;
    MEMORY[0x1895F8858](v11);
    uint64_t v14 = (char *)&v24 - v13;
    else {
      bzero((char *)&v24 - v13, 8 * v12);
    }
    uint64_t v16 = _insertion_fault_handler;
    unsigned int v17 = +[NSTemporaryObjectID allocateBatch:forEntity:count:]( &OBJC_CLASS___NSTemporaryObjectID,  "allocateBatch:forEntity:count:",  v14,  a3,  v5,  v24,  v25);
    unsigned int v18 = v17;
    if ((_DWORD)v5 && v17 == (_DWORD)v5)
    {
      uint64_t v19 = v10;
      __int128 v20 = v14;
      do
      {
        uint64_t v21 = [*v19 _initWithEntity:a3 withID:*(void *)v20 withHandler:v16 withContext:0];
        id *v19 = (id)v21;
        if (a4) {
          [a4 insertObject:v21];
        }
        else {
          _PFFaultHandlerFulfillFault(v16, v21, 0LL, 0LL, 1);
        }
        v20 += 8;
        ++v19;
        --v9;
      }

      while (v9);
    }

    if (v18 == (_DWORD)v5) {
      return  -[_PFArray initWithObjects:count:andFlags:andContext:]( objc_alloc(&OBJC_CLASS____PFArray),  "initWithObjects:count:andFlags:andContext:",  v10,  v5,  40LL,  a4);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    PF_FREE_OBJECT_ARRAY(v10);
    return 0LL;
  }

+ (id)_retain_1
{
  uint64_t v3 = (unsigned int *)[a1 _PFMOClassFactoryData];
  do
    unsigned int v4 = __ldxr(v3);
  while (__stxr(v4 + 1, v3));
  return a1;
}

+ (void)_release_1
{
  uint64_t v2 = (unsigned int *)[a1 _PFMOClassFactoryData];
  do
    unsigned int v3 = __ldxr(v2);
  while (__stxr(v3 - 1, v2));
}

+ (BOOL)_hasOverriddenAwake
{
  uint64_t v2 = [a1 _PFMOClassFactoryData];
  if (v2) {
    LODWORD(v2) = (*(unsigned __int8 *)(v2 + 96) >> 5) & 1;
  }
  return v2;
}

- (id)_genericValueForKey:(id)a3 withIndex:(int64_t)a4 flags:(int64_t)a5
{
  if (a5 && (self->_cd_stateFlags & 0x40) == 0) {
    return (id)_sharedIMPL_vfk_core((id **)self, (uint64_t)a2, a4);
  }
  _sharedIMPL_pvfk_core((uint64_t)self, (uint64_t)a2, a4, a4, a5, v5, v6, v7);
  return result;
}

- (void)_setGenericValue:(id)a3 forKey:(id)a4 withIndex:(int64_t)a5 flags:(int64_t)a6
{
  if (a6) {
    _sharedIMPL_setvfk_core((char **)self, (uint64_t)a2, a3, a5);
  }
  else {
    _sharedIMPL_setPvfk_core((char **)self, (uint64_t)a2, a3, a5);
  }
}

+ (void)_initializePrimitiveAccessorStubs
{
  uint64_t v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v2 = malloc_default_zone();
  }
  unsigned int v3 = malloc_zone_malloc(v2, 0x190uLL);
  os_unfair_lock_lock_with_options();
  if (qword_18C4AB9E8)
  {
    unsigned int v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      unsigned int v4 = malloc_default_zone();
    }
    malloc_zone_free(v4, v3);
    unsigned int v3 = (void *)qword_18C4AB9E8;
  }

  else
  {
    qword_18C4AB9E8 = (uint64_t)v3;
  }

  *unsigned int v3 = _spvfk_0;
  v3[1] = _spvfk_1;
  v3[2] = _spvfk_2;
  v3[3] = _spvfk_3;
  v3[4] = _spvfk_4;
  v3[5] = _spvfk_5;
  v3[6] = _spvfk_6;
  v3[7] = _spvfk_7;
  v3[8] = _spvfk_8;
  v3[9] = _spvfk_9;
  v3[10] = _spvfk_10;
  v3[11] = _spvfk_11;
  v3[12] = _spvfk_12;
  v3[13] = _spvfk_13;
  v3[14] = _spvfk_14;
  v3[15] = _spvfk_15;
  v3[16] = _spvfk_16;
  v3[17] = _spvfk_17;
  v3[18] = _spvfk_18;
  v3[19] = _spvfk_19;
  v3[20] = _spvfk_20;
  v3[21] = _spvfk_21;
  v3[22] = _spvfk_22;
  v3[23] = _spvfk_23;
  v3[24] = _spvfk_24;
  v3[25] = _spvfk_25;
  v3[26] = _spvfk_26;
  v3[27] = _spvfk_27;
  v3[28] = _spvfk_28;
  v3[29] = _spvfk_29;
  v3[30] = _spvfk_30;
  v3[31] = _spvfk_31;
  v3[32] = _spvfk_32;
  v3[33] = _spvfk_33;
  v3[34] = _spvfk_34;
  v3[35] = _spvfk_35;
  v3[36] = _spvfk_36;
  v3[37] = _spvfk_37;
  v3[38] = _spvfk_38;
  v3[39] = _spvfk_39;
  v3[40] = _spvfk_40;
  v3[41] = _spvfk_41;
  v3[42] = _spvfk_42;
  v3[43] = _spvfk_43;
  v3[44] = _spvfk_44;
  v3[45] = _spvfk_45;
  v3[46] = _spvfk_46;
  v3[47] = _spvfk_47;
  v3[48] = _spvfk_48;
  v3[49] = _spvfk_49;
  _MergedGlobals_70 = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C4AB9C0);
}

+ (void)_initializeAccessorStubs
{
  uint64_t v2 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    uint64_t v2 = malloc_default_zone();
  }
  unsigned int v3 = malloc_zone_malloc(v2, 0x190uLL);
  unsigned int v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone) {
    unsigned int v4 = malloc_default_zone();
  }
  uint64_t v5 = malloc_zone_malloc(v4, 0x190uLL);
  os_unfair_lock_lock_with_options();
  if (qword_18C4AB9F0)
  {
    uint64_t v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v6 = malloc_default_zone();
    }
    malloc_zone_free(v6, v3);
    uint64_t v7 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone) {
      uint64_t v7 = malloc_default_zone();
    }
    malloc_zone_free(v7, v5);
    unsigned int v3 = (void *)qword_18C4AB9F0;
    uint64_t v5 = (void *)qword_18C4AB9F8;
  }

  else
  {
    qword_18C4AB9F0 = (uint64_t)v3;
    qword_18C4AB9F8 = (uint64_t)v5;
  }

  *unsigned int v3 = _pvfk_0;
  v3[1] = _pvfk_1;
  v3[2] = _pvfk_2;
  v3[3] = _pvfk_3;
  v3[4] = _pvfk_4;
  v3[5] = _pvfk_5;
  v3[6] = _pvfk_6;
  v3[7] = _pvfk_7;
  v3[8] = _pvfk_8;
  v3[9] = _pvfk_9;
  v3[10] = _pvfk_10;
  v3[11] = _pvfk_11;
  v3[12] = _pvfk_12;
  v3[13] = _pvfk_13;
  v3[14] = _pvfk_14;
  v3[15] = _pvfk_15;
  v3[16] = _pvfk_16;
  v3[17] = _pvfk_17;
  v3[18] = _pvfk_18;
  v3[19] = _pvfk_19;
  v3[20] = _pvfk_20;
  v3[21] = _pvfk_21;
  v3[22] = _pvfk_22;
  v3[23] = _pvfk_23;
  v3[24] = _pvfk_24;
  v3[25] = _pvfk_25;
  v3[26] = _pvfk_26;
  v3[27] = _pvfk_27;
  v3[28] = _pvfk_28;
  v3[29] = _pvfk_29;
  v3[30] = _pvfk_30;
  v3[31] = _pvfk_31;
  v3[32] = _pvfk_32;
  v3[33] = _pvfk_33;
  v3[34] = _pvfk_34;
  v3[35] = _pvfk_35;
  v3[36] = _pvfk_36;
  v3[37] = _pvfk_37;
  v3[38] = _pvfk_38;
  v3[39] = _pvfk_39;
  v3[40] = _pvfk_40;
  v3[41] = _pvfk_41;
  v3[42] = _pvfk_42;
  v3[43] = _pvfk_43;
  v3[44] = _pvfk_44;
  v3[45] = _pvfk_45;
  v3[46] = _pvfk_46;
  v3[47] = _pvfk_47;
  v3[48] = _pvfk_48;
  v3[49] = _pvfk_49;
  void *v5 = _svfk_0;
  v5[1] = _svfk_1;
  v5[2] = _svfk_2;
  v5[3] = _svfk_3;
  v5[4] = _svfk_4;
  v5[5] = _svfk_5;
  v5[6] = _svfk_6;
  v5[7] = _svfk_7;
  v5[8] = _svfk_8;
  v5[9] = _svfk_9;
  v5[10] = _svfk_10;
  v5[11] = _svfk_11;
  v5[12] = _svfk_12;
  v5[13] = _svfk_13;
  v5[14] = _svfk_14;
  v5[15] = _svfk_15;
  v5[16] = _svfk_16;
  v5[17] = _svfk_17;
  v5[18] = _svfk_18;
  v5[19] = _svfk_19;
  v5[20] = _svfk_20;
  v5[21] = _svfk_21;
  v5[22] = _svfk_22;
  v5[23] = _svfk_23;
  v5[24] = _svfk_24;
  v5[25] = _svfk_25;
  v5[26] = _svfk_26;
  v5[27] = _svfk_27;
  v5[28] = _svfk_28;
  v5[29] = _svfk_29;
  v5[30] = _svfk_30;
  v5[31] = _svfk_31;
  v5[32] = _svfk_32;
  v5[33] = _svfk_33;
  v5[34] = _svfk_34;
  v5[35] = _svfk_35;
  v5[36] = _svfk_36;
  v5[37] = _svfk_37;
  v5[38] = _svfk_38;
  v5[39] = _svfk_39;
  v5[40] = _svfk_40;
  v5[41] = _svfk_41;
  v5[42] = _svfk_42;
  v5[43] = _svfk_43;
  v5[44] = _svfk_44;
  v5[45] = _svfk_45;
  v5[46] = _svfk_46;
  v5[47] = _svfk_47;
  v5[48] = _svfk_48;
  v5[49] = _svfk_49;
  byte_18C4AB9B9 = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C4AB9C0);
}

+ (BOOL)_classShouldAlwaysRegisterSelectorNamed:(const char *)a3
{
  size_t v5 = strlen(a3);
  if (v5 >= 0x21 && !strncmp("automaticallyNotifiesObserversOf", a3, 0x20uLL)) {
    return 1;
  }
  uint64_t v6 = [a1 _PFMOClassFactoryData];
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 96) & 0x40) != 0) {
      return 1;
    }
  }

  BOOL result = 0;
  if (v5 >= 0xA && !BYTE1(dword_18C4ABDC0))
  {
    uint64_t v8 = 9LL;
    result = (!strncmp("primitive", a3, 9uLL) || v5 >= 0xD && (uint64_t v8 = 12LL, !strncmp("setPrimitive", a3, 0xCuLL)))
          && (__darwin_ct_rune_t v9 = a3[v8]) != 0
          && v9 == (char)__toupper(v9);
  }

  return result;
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  Name = sel_getName(a3);
  uint64_t v6 = [a1 _PFMOClassFactoryData];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(v6 + 8);
  if (v7)
  {
    size_t v8 = strlen(Name);
    if (v8 < 0x21 || (size_t v9 = v8, strncmp("automaticallyNotifiesObserversOf", Name, 0x20uLL)))
    {
LABEL_5:
      LOBYTE(v7) = 0;
      return v7;
    }

    uint64_t v11 = *(void **)(v7 + 104);
    uint64_t v12 = _PFStackAllocatorCreate(&v23, 1024LL);
    MEMORY[0x1895F8858](v12);
    uint64_t v13 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    memcpy(v13, Name + 32, v9 - 31);
    uint64_t v14 = (const __CFAllocator *)*MEMORY[0x189604DC8];
    CFStringRef v15 = CFStringCreateWithCStringNoCopy(v12, v13, 0x600u, (CFAllocatorRef)*MEMORY[0x189604DC8]);
    uint64_t v16 = [v11 indexForKey:v15];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v25)
      {
        if (v15) {
          CFRelease(v15);
        }
      }

      else
      {
        unint64_t v24 = v23;
      }

      *uint64_t v13 = __tolower((char)*v13);
      CFStringRef v15 = CFStringCreateWithCStringNoCopy(v12, v13, 0x600u, v14);
      uint64_t v16 = [v11 indexForKey:v15];
    }

    uint64_t v17 = v16;
    if (v25)
    {
      if (v15) {
        CFRelease(v15);
      }
    }

    else
    {
      unint64_t v24 = v23;
    }

    LOBYTE(v7) = v17 != 0x7FFFFFFFFFFFFFFFLL;
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v18 = (objc_class *)objc_opt_class();
      ClassMethod = class_getClassMethod(v18, sel__isGeneratedClass);
      Class Class = object_getClass(a1);
      Implementation = method_getImplementation(ClassMethod);
      TypeEncoding = method_getTypeEncoding(ClassMethod);
      class_addMethod(Class, a3, Implementation, TypeEncoding);
    }
  }

  return v7;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  uint64_t v273 = *MEMORY[0x1895F89C0];
  Name = sel_getName(a3);
  uint64_t v6 = [a1 _PFMOClassFactoryData];
  if (v6)
  {
    uint64_t v7 = v6;
    size_t v8 = *(void **)(v6 + 8);
    if (v8)
    {
      v259 = (objc_class *)a1;
      SEL v254 = a3;
      if (!strncmp(Name, "managedObjectOriginal_", 0x16uLL)) {
        uint64_t v9 = 22LL;
      }
      else {
        uint64_t v9 = 0LL;
      }
      uint64_t v10 = &Name[v9];
      uint64_t v11 = (void *)v8[13];
      uint64_t v12 = _PFStackAllocatorCreate(&v270, 1024LL);
      size_t v13 = strlen(v10);
      size_t v14 = v13 + 100;
      MEMORY[0x1895F8858](v13);
      v255 = (const __CFString **)((char *)&v252 - v15);
      uint64_t v16 = (const __CFAllocator *)*MEMORY[0x189604DC8];
      CFStringRef v17 = CFStringCreateWithCStringNoCopy(v12, v10, 0x600u, (CFAllocatorRef)*MEMORY[0x189604DC8]);
      id v257 = v11;
      CFStringRef v258 = v17;
      uint64_t v18 = [v11 indexForKey:v17];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v13 < 5) {
          goto LABEL_274;
        }
        if (v13 < 0xE)
        {
          if (v13 < 0xA)
          {
            v256 = &v252;
            int v56 = 0;
            goto LABEL_69;
          }
        }

        else if (!strncmp("setPrimitive", v10, 0xCuLL))
        {
          if (v272)
          {
            if (v258) {
              CFRelease(v258);
            }
          }

          else
          {
            unint64_t v271 = v270;
          }

          uint64_t v89 = (const char *)v255;
          strlcpy((char *)v255, v10 + 12, v14);
          v89[v13 - 13] = 0;
          CFStringRef v90 = CFStringCreateWithCStringNoCopy(v12, v89, 0x600u, v16);
          id v91 = v257;
          CFStringRef v258 = v90;
          uint64_t v92 = objc_msgSend(v257, "indexForKey:");
          if (v92 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_210;
          }
          if (v272)
          {
            if (v258) {
              CFRelease(v258);
            }
          }

          else
          {
            unint64_t v271 = v270;
          }

          uint64_t v158 = (char *)v255;
          *uint64_t v158 = __tolower(*(char *)v255);
          CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v158, 0x600u, v16);
          uint64_t v92 = objc_msgSend(v91, "indexForKey:");
          if (v92 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_210:
            unint64_t v19 = v92;
            __int128 v20 = v259;
            if ((_MergedGlobals_70 & 1) == 0) {
              -[objc_class _initializePrimitiveAccessorStubs](v259, "_initializePrimitiveAccessorStubs");
            }
            char v57 = 0LL;
            int v55 = 0;
            LODWORD(v257) = 0;
            id v58 = 0LL;
            uint64_t v62 = qword_18C4AB9E8;
            int v61 = 1;
            goto LABEL_321;
          }

          goto LABEL_274;
        }

        if (!strncmp("primitive", v10, 9uLL))
        {
          if (v272)
          {
            if (v258) {
              CFRelease(v258);
            }
          }

          else
          {
            unint64_t v271 = v270;
          }

          uint64_t v85 = (const char *)v255;
          strlcpy((char *)v255, v10 + 9, v14);
          CFStringRef v86 = CFStringCreateWithCStringNoCopy(v12, v85, 0x600u, v16);
          id v87 = v257;
          CFStringRef v258 = v86;
          uint64_t v88 = objc_msgSend(v257, "indexForKey:");
          if (v88 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_196;
          }
          if (v272)
          {
            if (v258) {
              CFRelease(v258);
            }
          }

          else
          {
            unint64_t v271 = v270;
          }

          uint64_t v153 = (char *)v255;
          *uint64_t v153 = __tolower(*(char *)v255);
          CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v153, 0x600u, v16);
          uint64_t v88 = objc_msgSend(v87, "indexForKey:");
          if (v88 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_196:
            unint64_t v19 = v88;
            __int128 v20 = v259;
            if ((byte_18C4AB9B9 & 1) == 0) {
              -[objc_class _initializeAccessorStubs](v259, "_initializeAccessorStubs");
            }
            char v57 = 0LL;
            int v55 = 0;
            LODWORD(v257) = 0;
            id v58 = 0LL;
            LODWORD(v59) = 0;
            uint64_t v62 = qword_18C4AB9F0;
            int v61 = 1;
            goto LABEL_277;
          }

          goto LABEL_274;
        }

        v256 = &v252;
        int v56 = 1;
LABEL_69:
        if (strncmp("set", v10, 3uLL))
        {
          if (strncmp("add", v10, 3uLL))
          {
            if (v13 < 8) {
              goto LABEL_202;
            }
            if (strncmp("remove", v10, 6uLL))
            {
              if (v13 < 0x12)
              {
                if (v13 < 0x10) {
                  goto LABEL_202;
                }
              }

              else
              {
                if (!strncmp("insert", v10, 6uLL))
                {
                  if (v13 < 0x18 || strncmp("insertObject:in", v10, 0xFuLL) || strncmp("AtIndex:", &v10[v13 - 8], 8uLL))
                  {
                    if (!strncmp(":atIndexes:", &v10[v13 - 11], 0xBuLL))
                    {
                      if (v272)
                      {
                        if (v258) {
                          CFRelease(v258);
                        }
                      }

                      else
                      {
                        unint64_t v271 = v270;
                      }

                      uint64_t v223 = (const char *)v255;
                      strlcpy((char *)v255, v10 + 6, v14);
                      v223[v13 - 17] = 0;
                      CFStringRef v224 = CFStringCreateWithCStringNoCopy(v12, v223, 0x600u, v16);
                      id v225 = v257;
                      CFStringRef v258 = v224;
                      uint64_t v226 = objc_msgSend(v257, "indexForKey:");
                      if (v226 != 0x7FFFFFFFFFFFFFFFLL) {
                        goto LABEL_408;
                      }
                      if (v272)
                      {
                        if (v258) {
                          CFRelease(v258);
                        }
                      }

                      else
                      {
                        unint64_t v271 = v270;
                      }

                      v234 = (char *)v255;
                      char *v234 = __tolower(*(char *)v255);
                      CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v234, 0x600u, v16);
                      uint64_t v226 = objc_msgSend(v225, "indexForKey:");
                      if (v226 != 0x7FFFFFFFFFFFFFFFLL)
                      {
LABEL_408:
                        unint64_t v19 = v226;
                        int v55 = 0;
                        LODWORD(v257) = 0;
                        uint64_t v62 = 0LL;
                        int v61 = 0;
                        LODWORD(v59) = 1;
                        id v58 = _sharedIMPL_insertOrderedSetAtIndexes_core;
                        char v57 = "v@:@@";
                        goto LABEL_276;
                      }
                    }

                    goto LABEL_274;
                  }

                  if (v272)
                  {
                    if (v258) {
                      CFRelease(v258);
                    }
                  }

                  else
                  {
                    unint64_t v271 = v270;
                  }

                  v240 = (const char *)v255;
                  strlcpy((char *)v255, v10 + 15, v14);
                  v240[v13 - 23] = 0;
                  CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v240, 0x600u, v16);
                  uint64_t v241 = objc_msgSend(v257, "indexForKey:");
                  if (v241 != 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_444;
                  }
                  if (v272)
                  {
                    if (v258) {
                      CFRelease(v258);
                    }
                  }

                  else
                  {
                    unint64_t v271 = v270;
                  }

                  v244 = (char *)v255;
                  char *v244 = __tolower(*(char *)v255);
                  CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v244, 0x600u, v16);
                  uint64_t v241 = objc_msgSend(v257, "indexForKey:");
                  if (v241 != 0x7FFFFFFFFFFFFFFFLL)
                  {
LABEL_444:
                    unint64_t v19 = v241;
                    int v55 = 0;
                    LODWORD(v257) = 0;
                    uint64_t v62 = 0LL;
                    int v61 = 0;
                    LODWORD(v59) = 1;
                    id v58 = _sharedIMPL_insertObjectToOrderedSetAtIndex_core;
                    char v57 = "v@:@Q";
                    goto LABEL_276;
                  }

                  goto LABEL_452;
                }

                if (v13 >= 0x17 && !strncmp("replace", v10, 7uLL))
                {
                  if (v13 < 0x23
                    || strncmp("replaceObjectIn", v10, 0xFuLL)
                    || strncmp("AtIndex:withObject:", &v10[v13 - 19], 0x13uLL))
                  {
                    __int128 v63 = v256;
                    if (v10[v13 - 1] == 58)
                    {
                      uint64_t v59 = strnstr(v10, "AtIndexes:with", v13);
                      if (v59)
                      {
                        v256 = v63;
                        if (v272)
                        {
                          if (v258) {
                            CFRelease(v258);
                          }
                        }

                        else
                        {
                          unint64_t v271 = v270;
                        }

                        v236 = (const char *)v255;
                        strlcpy((char *)v255, v10 + 7, v14);
                        v236[&v10[v13] - v59 - 15] = 0;
                        CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v236, 0x600u, v16);
                        uint64_t v237 = objc_msgSend(v257, "indexForKey:");
                        if (v237 == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          if (v272)
                          {
                            if (v258) {
                              CFRelease(v258);
                            }
                          }

                          else
                          {
                            unint64_t v271 = v270;
                          }

                          v242 = (char *)v255;
                          char *v242 = __tolower(*(char *)v255);
                          CFStringRef v258 = CFStringCreateWithCStringNoCopy(v12, v242, 0x600u, v16);
                          uint64_t v237 = objc_msgSend(v257, "indexForKey:");
                        }

                        unint64_t v19 = v237;
                        int v55 = 0;
                        LODWORD(v257) = 0;
                        uint64_t v62 = 0LL;
                        int v61 = 0;
                        LODWORD(v59) = v237 != 0x7FFFFFFFFFFFFFFFLL;
                        if (v237 == 0x7FFFFFFFFFFFFFFFLL) {
                          char v57 = 0LL;
                        }
                        else {
                          char v57 = "v@:@@";
                        }
                        if (v237 == 0x7FFFFFFFFFFFFFFFLL) {
                          id v58 = 0LL;
                        }
                        else {
                          id v58 = _sharedIMPL_replaceOrderedSetAtIndexes_core;
                        }
                        goto LABEL_276;
                      }

                      char v57 = 0LL;
                      int v55 = 0;
                      LODWORD(v257) = 0;
                      id v58 = 0LL;
                      uint64_t v62 = 0LL;
                      int v61 = 0;
                      goto LABEL_275;
                    }

void *__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke( uint64_t a1,  void *a2,  double a3)
{
  unint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___sharedIMPL_setvfk_core_d_block_invoke;
  v6[3] = &unk_189EA8258;
  v6[4] = a2;
  v6[5] = v4;
  *(double *)&v6[6] = a3;
  return _sharedIMPL_setvfk_core_scalar(a2, v4, (uint64_t)v6);
}

void *__80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_2( uint64_t a1,  void *a2,  float a3)
{
  unint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___sharedIMPL_setvfk_core_f_block_invoke;
  v6[3] = &unk_189EA8230;
  v6[4] = a2;
  v6[5] = v4;
  float v7 = a3;
  return _sharedIMPL_setvfk_core_scalar(a2, v4, (uint64_t)v6);
}

double __80__NSManagedObject__PFDynamicAccessorsAndPropertySupport__resolveInstanceMethod___block_invoke_3( uint64_t a1,  unsigned int *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  unint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = (char *)*((void *)a2 + 3);
  Class Class = object_getClass(v10);
  return *(double *)&v10[*((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)];
}

@end