@interface NSSQLRow
+ (id)allocWithZone:(_NSZone *)a3;
+ (unsigned)newBatchRowAllocation:(id *)a3 count:(unsigned int)a4 forSQLEntity:(id)a5 withOwnedObjectIDs:(id *)a6 andTimestamp:(double)a7;
+ (void)allocForSQLEntity:(uint64_t)a1;
+ (void)initialize;
- (BOOL)hasUniqueConstraintDiffFrom:(const __CFBitVector *)a1;
- (BOOL)isEqual:(id)a3;
- (CFBitVectorRef)newColumnMaskFrom:(uint64_t)a3 columnInclusionOptions:;
- (CFDateRef)attributeValueForSlot:(CFDateRef)result;
- (NSSQLRow)initWithSQLEntity:(id)a3 objectID:(id)a4;
- (NSSQLRow)initWithSQLEntity:(id)a3 ownedObjectID:(id)a4 andTimestamp:(double)a5;
- (const)knownKeyValuesPointer;
- (id)_snapshot_;
- (id)copy;
- (id)description;
- (id)newObjectIDForToOne:(id)a3;
- (id)objectID;
- (id)valueForKey:(id)a3;
- (uint64_t)_validateToOnes;
- (uint64_t)foreignKeyForSlot:(uint64_t)result;
- (unint64_t)version;
- (unsigned)_versionNumber;
- (void)setForeignEntityKeySlot:(unsigned int)a3 entityKey:(unsigned int)a4;
- (void)setForeignKeySlot:(unsigned int)a3 int64:(int64_t)a4;
- (void)setForeignOrderKeySlot:(unsigned int)a3 orderKey:(unsigned int)a4;
- (void)setObjectID:(id)a3;
- (void)setOptLock:(int64_t)a3;
@end

@implementation NSSQLRow

+ (unsigned)newBatchRowAllocation:(id *)a3 count:(unsigned int)a4 forSQLEntity:(id)a5 withOwnedObjectIDs:(id *)a6 andTimestamp:(double)a7
{
  uint64_t v10 = *(void *)&a4;
  v29[1] = *MEMORY[0x1895F89C0];
  uint64_t v13 = [(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)a5) count];
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a5, "foreignEntityKeyColumns"), "count");
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a5, "foreignOrderKeyColumns"), "count");
  v16 = (void *)_PFCDSnapshotClassForEntity([a5 entityDescription]);
  MEMORY[0x1895F8858](v16);
  v19 = (void **)((char *)v29 - v18);
  else {
    bzero((char *)v29 - v18, 8LL * v17);
  }
  unsigned int v20 = [v16 newBatchAllocation:v19 count:v10 withOwnedObjectIDs:a6];
  if (v20 >= v10)
  {
    unsigned int v22 = _PFAllocateObjects((objc_class *)a1, a3, v10, 2 * v14 + 8 * v13 + 4 * v15);
    unsigned int v21 = v22;
    if (v22)
    {
      uint64_t v23 = v22;
      v24 = (uint64_t *)v19;
      do
      {
        uint64_t v26 = (uint64_t)*a3++;
        uint64_t v25 = v26;
        uint64_t v27 = *v24++;
        *(void *)(v25 + 40) = v27;
        snapshot_set_transient_default_values(v27);
        *(_BYTE *)(v27 + 24) |= 1u;
        *(double *)(v25 + 32) = a7;
        *(_DWORD *)(v25 + 16) = (unsigned __int16)(4 * (v13 & 0x3FFF)) | ((v15 & 0x3FFF) << 16) | *(_DWORD *)(v25 + 16) & 0xC0000003;
        --v23;
      }

      while (v23);
    }
  }

  else
  {
    _PFDeallocateObjects(v19, v20);
    unsigned int v21 = 0;
  }

  return v21;
}

- (void)setOptLock:(int64_t)a3
{
  self->_snapshot->_cd_version = a3;
}

- (void)setForeignKeySlot:(unsigned int)a3 int64:(int64_t)a4
{
  snapshot = self->_snapshot;
  uint64_t v8 = (uint64_t)-[NSManagedObjectID entity](snapshot->_cd_objectID, "entity")[112];
  unint64_t v9 = *(void *)(v8 + 104);
  BOOL v10 = a3 >= v9;
  unint64_t v11 = a3 - v9;
  if (v10)
  {
    *(Class *)((char *)&(&self->super.super.isa)[v11] + _NSSQLRowInstanceSize) = (Class)a4;
  }

  else
  {
    uint64_t v12 = *(void *)(v8 + 96);
    if (a4)
    {
      if (HIDWORD(a4))
      {
        int64_t v16 = a4;
        uint64_t v13 = &v16;
        CFNumberType v14 = kCFNumberLongLongType;
      }

      else
      {
        int v17 = a4;
        uint64_t v13 = (int64_t *)&v17;
        CFNumberType v14 = kCFNumberIntType;
      }

      CFNumberRef v15 = CFNumberCreate(0LL, v14, v13);
    }

    else
    {
      CFNumberRef v15 = 0LL;
    }

    snapshot_set_object((char *)snapshot, v12 + a3, (uint64_t)v15);
  }

- (const)knownKeyValuesPointer
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->super._invalidToOnes);
  if ((v2 & 1) != 0) {
    -[NSSQLRow _validateToOnes]((uint64_t)self);
  }
  return 0LL;
}

- (uint64_t)_validateToOnes
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    if ((*(_BYTE *)(result + 16) & 1) == 0)
    {
      unsigned __int8 v2 = (void *)[*(id *)(*(void *)(result + 40) + 16) _storeInfo1];
      v3 = (void *)[v2 foreignKeyColumns];
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      result = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (result)
      {
        uint64_t v4 = result;
        uint64_t v5 = *(void *)v12;
        do
        {
          uint64_t v6 = 0LL;
          do
          {
            if (*(void *)v12 != v5) {
              objc_enumerationMutation(v3);
            }
            v7 = (_BYTE *)[*(id *)(*((void *)&v11 + 1) + 8 * v6) toOneRelationship];
            uint64_t v8 = v7;
            if (!v7 || !v7[88])
            {
              int v9 = [v7 slot];
              if (v2) {
                uint64_t v10 = v2[24];
              }
              else {
                LODWORD(v10) = 0;
              }
              snapshot_set_object(*(char **)(v1 + 40), v9 + v10, [(id)v1 newObjectIDForToOne:v8]);
            }

            ++v6;
          }

          while (v4 != v6);
          result = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
          uint64_t v4 = result;
        }

        while (result);
      }

      atomic_store(0, (unsigned __int8 *)(v1 + 20));
    }
  }

  return result;
}

- (id)newObjectIDForToOne:(id)a3
{
  cd_objectID = self->_snapshot->_cd_objectID;
  id result = (id)-[NSSQLRow foreignKeyForSlot:]((uint64_t)self, [*((id *)a3 + 8) slot]);
  if (result)
  {
    id v7 = result;
    uint64_t v8 = -[NSManagedObjectID persistentStore](cd_objectID, "persistentStore");
    int v9 = (void *)*((void *)a3 + 9);
    if (v9) {
      _sqlEntityForEntityID( *(void *)(-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1") + 16),  *(unsigned __int16 *)((char *)&self->super.super.isa + 2 * [v9 slot]
    }
                            + _NSSQLRowInstanceSize
                            + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)
                            + (((unint64_t)self->super._externalRefFlags >> 14) & 0xFFFC)));
    return (id)-[NSSQLCore newForeignKeyID:entity:](v8, (uint64_t)v7);
  }

  return result;
}

- (uint64_t)foreignKeyForSlot:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)([*(id *)(*(void *)(result + 40) + 16) entity] + 112);
    unint64_t v5 = *(void *)(v4 + 104);
    BOOL v6 = a2 >= v5;
    unint64_t v7 = a2 - v5;
    if (v6)
    {
      return *(void *)(v3 + _NSSQLRowInstanceSize + 8 * v7);
    }

    else
    {
      uint64_t v8 = *(char **)(v3 + 40);
      unsigned int v9 = *(_DWORD *)(v4 + 96) + a2;
      Class Class = object_getClass(v8);
      __int128 v11 = *(void **)&v8[*((unsigned int *)object_getIndexedIvars(Class) + v9 + 19)];
      if (v11)
      {
        else {
          return [v11 _referenceData64];
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  return result;
}

- (id)objectID
{
  return self->_snapshot->_cd_objectID;
}

- (id)_snapshot_
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->super._invalidToOnes);
  if ((v3 & 1) != 0) {
    -[NSSQLRow _validateToOnes]((uint64_t)self);
  }
  return self->_snapshot;
}

+ (void)initialize
{
  _NSSQLRowInstanceSize = (class_getInstanceSize((Class)a1) + 7) & 0xFFFFFFFFFFFFFFF8LL;
}

+ (void)allocForSQLEntity:(uint64_t)a1
{
  unsigned __int8 v3 = (objc_class *)objc_opt_self();
  int v4 = [(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)a2) count];
  return _PFAllocateObject( v3,  2 * objc_msgSend((id)objc_msgSend(a2, "foreignEntityKeyColumns"), "count")
         + 8 * v4
         + 4 * objc_msgSend((id)objc_msgSend(a2, "foreignOrderKeyColumns"), "count"));
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (NSSQLRow)initWithSQLEntity:(id)a3 objectID:(id)a4
{
  return -[NSSQLRow initWithSQLEntity:ownedObjectID:andTimestamp:]( self,  "initWithSQLEntity:ownedObjectID:andTimestamp:",  a3,  a4,  CFAbsoluteTimeGetCurrent());
}

- (NSSQLRow)initWithSQLEntity:(id)a3 ownedObjectID:(id)a4 andTimestamp:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSSQLRow;
  id v7 = -[NSPersistentCacheRow initWithOptions:andTimestamp:](&v10, sel_initWithOptions_andTimestamp_, 0LL, a5);
  if (v7)
  {
    uint64_t v8 = objc_alloc_init((Class)_PFCDSnapshotClassForEntity([a3 entityDescription]));
    *((void *)v7 + 5) = v8;
    v8[2] = a4;
    snapshot_set_transient_default_values(*((void *)v7 + 5));
    *(_BYTE *)(*((void *)v7 + 5) + 24LL) |= 1u;
    atomic_store(0, (unsigned __int8 *)v7 + 20);
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xFFFFFFFE | [a4 isTemporaryID];
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xFFFF0003 | (4
                                                            * ([(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)a3) count] & 0x3FFF));
    *((_DWORD *)v7 + 4) = *((_DWORD *)v7 + 4) & 0xC000FFFF | ((objc_msgSend( (id)objc_msgSend(a3, "foreignOrderKeyColumns"),  "count") & 0x3FFF) << 16);
  }

  return (NSSQLRow *)v7;
}

- (id)copy
{
  if (!self || (*(_BYTE *)&self->super._externalRefFlags & 1) != 0) {
    unsigned __int8 v3 = 0LL;
  }
  else {
    unsigned __int8 v3 = (void *)-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
  }
  uint64_t v4 = objc_msgSend( +[NSSQLRow allocForSQLEntity:]((uint64_t)NSSQLRow, v3),  "initWithSQLEntity:objectID:",  v3,  -[NSSQLRow objectID](self, "objectID"));
  unint64_t v5 = *(void **)(v4 + 40);
  BOOL v6 = -[_CDSnapshot mutableCopy](self->_snapshot, "mutableCopy");
  *(void *)(v4 + 40) = v6;
  v6[24] |= 1u;
  uint64_t v7 = [(id)-[NSSQLEntity virtualForeignKeyColumns]((unint64_t)v3) count];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v3, "foreignEntityKeyColumns"), "count");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v3, "foreignOrderKeyColumns"), "count");
  if (v8 + v7 + v9) {
    memcpy((void *)(v4 + _NSSQLRowInstanceSize), (char *)self + _NSSQLRowInstanceSize, 2 * v8 + 8 * v7 + 4 * v9);
  }
  *(_externalRefFlags_st *)(v4 + 16) = self->super._externalRefFlags;
  *(double *)(v4 + 32) = self->super._birth;
  -[NSPersistentCacheRow copyRelationshipCachesFrom:]((void *)v4, (uint64_t)self);
  return (id)v4;
}

- (id)description
{
  if (!self || (*(_BYTE *)&self->super._externalRefFlags & 1) != 0) {
    unsigned __int8 v3 = 0LL;
  }
  else {
    unsigned __int8 v3 = (void *)-[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
  }
  uint64_t v4 = (void *)MEMORY[0x189607940];
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___NSSQLRow;
  id v5 = -[NSSQLRow description](&v45, sel_description);
  uint64_t v6 = [v3 name];
  v44 = v3;
  if (self)
  {
    uint64_t v7 = -[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
    if (v7) {
      uint64_t v8 = *(unsigned int *)(v7 + 184);
    }
    else {
      uint64_t v8 = 0LL;
    }
    int64_t v9 = -[NSManagedObjectID _referenceData64](self->_snapshot->_cd_objectID, "_referenceData64");
    uint64_t cd_version = self->_snapshot->_cd_version;
  }

  else
  {
    uint64_t v8 = 0LL;
    int64_t v9 = 0LL;
    uint64_t cd_version = 0LL;
  }

  __int128 v11 = (void *)[v4 stringWithFormat:@"%@{%@ %d-%qd-%qi", v5, v6, v8, v9, cd_version];
  __int128 v12 = (void *)[v44 attributeColumns];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t i = 0LL; i != v14; ++i)
    {
      uint64_t v16 = (void *)[v12 objectAtIndex:i];
      uint64_t v17 = [v16 name];
      uint64_t v18 = (void *)[v16 propertyDescription];
      if (v18 && [v18 superCompositeAttribute]) {
        uint64_t v17 = objc_msgSend((id)objc_msgSend(v16, "propertyDescription"), "_qualifiedName");
      }
      uint64_t v19 = -[_CDSnapshot valueForKeyPath:](self->_snapshot, "valueForKeyPath:", v17);
      if (v19)
      {
        unsigned int v20 = (void *)v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            [v11 appendFormat:@" %@=<NSFileBackedFuture fileSize=%lu>", v17, objc_msgSend(v20, "fileSize")];
          }
          else {
            [v11 appendFormat:@" %@=<NSData len=%lu>", v17, objc_msgSend(v20, "length")];
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            [v11 appendFormat:@" %@=\"%@\"", v17, v20];
          }
          else {
            [v11 appendFormat:@" %@=%@", v17, objc_msgSend(v20, "description")];
          }
        }
      }

      else
      {
        [v11 appendFormat:@" %@=NULL", v17, v43];
      }
    }
  }

  unsigned int v21 = (void *)[v44 foreignKeyColumns];
  uint64_t v22 = [v21 count];
  if (v22)
  {
    uint64_t v23 = v22;
    for (uint64_t j = 0LL; j != v23; ++j)
    {
      uint64_t v25 = (void *)[v21 objectAtIndex:j];
      [v11 appendFormat:@" %@=%qd", objc_msgSend(v25, "name"), -[NSSQLRow foreignKeyForSlot:]((uint64_t)self, objc_msgSend(v25, "slot"))];
    }
  }

  uint64_t v26 = (void *)[v44 foreignEntityKeyColumns];
  uint64_t v27 = [v26 count];
  if (v27)
  {
    uint64_t v28 = v27;
    for (uint64_t k = 0LL; k != v28; ++k)
    {
      v30 = (void *)[v26 objectAtIndex:k];
      uint64_t v31 = [v30 name];
      unsigned int v32 = [v30 slot];
      if (self) {
        uint64_t v33 = *(unsigned __int16 *)((char *)&self->super.super.isa
      }
                                  + 2 * v32
                                  + _NSSQLRowInstanceSize
                                  + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)
                                  + (((unint64_t)self->super._externalRefFlags >> 14) & 0xFFFC));
      else {
        uint64_t v33 = 0LL;
      }
      [v11 appendFormat:@" %@=%u", v31, v33];
    }
  }

  v34 = (void *)[v44 foreignOrderKeyColumns];
  uint64_t v35 = [v34 count];
  if (v35)
  {
    uint64_t v36 = v35;
    for (uint64_t m = 0LL; m != v36; ++m)
    {
      v38 = (void *)[v34 objectAtIndex:m];
      uint64_t v39 = [v38 name];
      unsigned int v40 = [v38 slot];
      if (self) {
        uint64_t v41 = *(unsigned int *)((char *)&self->super.super.isa
      }
                              + 4 * v40
                              + _NSSQLRowInstanceSize
                              + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8));
      else {
        uint64_t v41 = 0LL;
      }
      [v11 appendFormat:@" %@=%u", v39, v41];
    }
  }

  objc_msgSend(v11, "appendFormat:", @" and to-manys=%p}", self->super._toManyMap);
  return v11;
}

- (void)setObjectID:(id)a3
{
  self->super._externalRefFlags = (_externalRefFlags_st)(*(_DWORD *)&self->super._externalRefFlags & 0xFFFFFFFE | [a3 isTemporaryID]);
}

- (void)setForeignEntityKeySlot:(unsigned int)a3 entityKey:(unsigned int)a4
{
  *(_WORD *)((char *)&self->super.super.isa
           + 2 * a3
           + _NSSQLRowInstanceSize
           + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)
           + (((unint64_t)self->super._externalRefFlags >> 14) & 0xFFFC)) = a4;
}

- (void)setForeignOrderKeySlot:(unsigned int)a3 orderKey:(unsigned int)a4
{
  *(_DWORD *)((char *)&self->super.super.isa
            + 4 * a3
            + _NSSQLRowInstanceSize
            + ((2 * *(_DWORD *)&self->super._externalRefFlags) & 0x1FFF8)) = a4;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (id)valueForKey:(id)a3
{
  if (!self || (*(_BYTE *)&self->super._externalRefFlags & 1) != 0)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v5 = -[NSManagedObjectID _storeInfo1](self->_snapshot->_cd_objectID, "_storeInfo1");
    uint64_t v6 = (_DWORD *)v5;
    if (v5)
    {
      uint64_t v7 = (unsigned __int8 *)[*(id *)(v5 + 40) objectForKey:a3];
      if (v7)
      {
        uint64_t v8 = v7;
        int v9 = v7[24];
        if (v9 != 7)
        {
          if (v9 == 1)
          {
            unsigned int v10 = [v7 slot];
            __int128 v11 = self;
            return -[NSSQLRow attributeValueForSlot:]((CFDateRef)v11, v10);
          }

          if ([v7 propertyType] != 3)
          {
            objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58], objc_msgSend( NSString, "stringWithFormat:", @"unexpected key found for: %@", v8), 0 reason userInfo]);
            return -[NSSQLRow attributeValueForSlot:]((CFDateRef)v11, v10);
          }
        }

        unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->super._invalidToOnes);
        if ((v16 & 1) != 0) {
          -[NSSQLRow _validateToOnes]((uint64_t)self);
        }
        snapshot = self->_snapshot;
        unsigned int v15 = [v8 slot] + v6[48];
        goto LABEL_20;
      }
    }
  }

  __int128 v12 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(v6, "entityDescription"), "propertiesByName"),  "objectForKey:",  a3);
  if ([v12 _propertyType] != 7)
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___NSSQLRow;
    return -[NSSQLRow valueForKey:](&v19, sel_valueForKey_, a3);
  }

  uint64_t v13 = (void *)objc_msgSend( (id)-[NSSQLEntity sqlAttributesForCompositeAttributeName:]((uint64_t)v6, objc_msgSend(v12, "name")),  "firstObject");
  snapshot = self->_snapshot;
  unsigned int v15 = [v13 slot];
LABEL_20:
  Class Class = object_getClass(snapshot);
  return *(Class *)((char *)&snapshot->super.isa + *((unsigned int *)object_getIndexedIvars(Class) + v15 + 19));
}

- (CFDateRef)attributeValueForSlot:(CFDateRef)result
{
  if (result)
  {
    CFDateRef v3 = result;
    uint64_t v4 = (unsigned __int8 *)*((void *)result + 5);
    uint64_t v5 = a2;
    if (((v4[((unint64_t)a2 >> 3) + 28] >> (a2 & 7)) & 1) != 0)
    {
      return 0LL;
    }

    else
    {
      Class Class = object_getClass(v4);
      int v7 = *(char *)(*((void *)object_getIndexedIvars(Class) + 7) + a2);
      switch(v7)
      {
        case 'c':
          uint64_t v8 = (char *)*((void *)v3 + 5);
          Class v9 = object_getClass(v8);
          int v10 = v8[*((unsigned int *)object_getIndexedIvars(v9) + v5 + 19)];
          goto LABEL_11;
        case 'd':
          uint64_t v18 = (char *)*((void *)v3 + 5);
          Class v19 = object_getClass(v18);
          CFAbsoluteTime v20 = *(double *)&v18[*((unsigned int *)object_getIndexedIvars(v19) + v5 + 19)];
          CFAbsoluteTime valuePtr = v20;
          if (objc_msgSend( *(id *)(*(void *)(objc_msgSend(*(id *)(*((void *)v3 + 5) + 16), "entity") + 96) + 24 + 8 * v5),  "attributeType") == 900)
          {
            CFDateRef v21 = CFDateCreate(0LL, v20);
            goto LABEL_18;
          }

          CFNumberType v17 = kCFNumberDoubleType;
          goto LABEL_17;
        case 'e':
        case 'g':
        case 'h':
          goto LABEL_9;
        case 'f':
          uint64_t v22 = (char *)*((void *)v3 + 5);
          Class v23 = object_getClass(v22);
          LODWORD(valuePtr) = *(_DWORD *)&v22[*((unsigned int *)object_getIndexedIvars(v23) + v5 + 19)];
          CFNumberType v17 = kCFNumberFloatType;
          goto LABEL_17;
        case 'i':
          unsigned int v15 = (char *)*((void *)v3 + 5);
          Class v16 = object_getClass(v15);
          int v10 = *(_DWORD *)&v15[*((unsigned int *)object_getIndexedIvars(v16) + v5 + 19)];
          goto LABEL_11;
        default:
          if (v7 == 113)
          {
            v24 = (char *)*((void *)v3 + 5);
            Class v25 = object_getClass(v24);
            CFAbsoluteTime valuePtr = *(double *)&v24[*((unsigned int *)object_getIndexedIvars(v25) + v5 + 19)];
            CFNumberType v17 = kCFNumberLongLongType;
          }

          else
          {
            if (v7 != 115)
            {
LABEL_9:
              uint64_t v13 = (char *)*((void *)v3 + 5);
              Class v14 = object_getClass(v13);
              return *(CFDateRef *)&v13[*((unsigned int *)object_getIndexedIvars(v14) + v5 + 19)];
            }

            __int128 v11 = (char *)*((void *)v3 + 5);
            Class v12 = object_getClass(v11);
            int v10 = *(__int16 *)&v11[*((unsigned int *)object_getIndexedIvars(v12) + v5 + 19)];
LABEL_11:
            LODWORD(valuePtr) = v10;
            CFNumberType v17 = kCFNumberIntType;
          }

- (unint64_t)version
{
  if (self) {
    return *(unsigned int *)(*(void *)(self + 40) + 12LL);
  }
  return self;
}

- (unsigned)_versionNumber
{
  return self->_snapshot->_cd_version;
}

- (CFBitVectorRef)newColumnMaskFrom:(uint64_t)a3 columnInclusionOptions:
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  if (result)
  {
    char v5 = *((_BYTE *)result + 16);
    CFBitVectorRef v114 = result;
    if ((v5 & 1) != 0) {
      uint64_t v6 = 0LL;
    }
    else {
      uint64_t v6 = (void *)[*(id *)(*((void *)result + 5) + 16) _storeInfo1];
    }
    int v7 = (void *)[v6 foreignKeyColumns];
    uint64_t v8 = (unsigned __int8 *)[v6 foreignEntityKeyColumns];
    Class v9 = (void *)[v6 foreignOrderKeyColumns];
    id v115 = (id)[v6 attributeColumns];
    uint64_t v10 = [v115 count];
    id v113 = v9;
    uint64_t v11 = [v9 count];
    v112 = v8;
    uint64_t v12 = [v8 count];
    uint64_t v13 = [v7 count];
    v110 = &v107;
    CFIndex v109 = v11 + v10 + v12 + v13;
    MEMORY[0x1895F8858](v13);
    unsigned int v15 = (const UInt8 *)&v107 - v14;
    bzero((char *)&v107 - v14, v16);
    unint64_t v116 = a3;
    if ((a3 & 0xA) == 0)
    {
      unsigned int v27 = [v7 count];
      goto LABEL_23;
    }

    __int128 v131 = 0u;
    __int128 v132 = 0u;
    __int128 v129 = 0u;
    __int128 v130 = 0u;
    uint64_t v17 = [v7 countByEnumeratingWithState:&v129 objects:v136 count:16];
    if (!v17)
    {
      unsigned int v27 = 0;
      if ((a3 & 2) != 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }

    uint64_t v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v130;
LABEL_8:
    uint64_t v21 = 0LL;
    int v22 = v19;
    while (1)
    {
      if (*(void *)v130 != v20) {
        objc_enumerationMutation(v7);
      }
      Class v23 = *(void **)(*((void *)&v129 + 1) + 8 * v21);
      if ((a3 & 2) == 0) {
        break;
      }
      unsigned int v25 = [v23 slot];
      a3 = -[NSSQLRow foreignKeyForSlot:]((uint64_t)v114, v25);
      BOOL v26 = a3 == -[NSSQLRow foreignKeyForSlot:](a2, v25);
      LOBYTE(a3) = v116;
      if (!v26) {
        goto LABEL_16;
      }
LABEL_17:
      if (v18 == ++v21)
      {
        uint64_t v18 = [v7 countByEnumeratingWithState:&v129 objects:v136 count:16];
        int v19 = v22 + v21;
        if (!v18)
        {
          unsigned int v27 = v22 + v21;
          if ((a3 & 2) != 0)
          {
LABEL_24:
            __int128 v127 = 0u;
            __int128 v128 = 0u;
            __int128 v125 = 0u;
            __int128 v126 = 0u;
            uint64_t v29 = [v112 countByEnumeratingWithState:&v125 objects:v135 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v126;
              do
              {
                uint64_t v32 = 0LL;
                unsigned int v33 = v27;
                uint64_t v34 = (uint64_t)v114;
                do
                {
                  if (*(void *)v126 != v31) {
                    objc_enumerationMutation(v112);
                  }
                  unsigned int v35 = [*(id *)(*((void *)&v125 + 1) + 8 * v32) slot];
                  if (a2) {
                    int v36 = *(unsigned __int16 *)(a2
                  }
                                              + _NSSQLRowInstanceSize
                                              + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8)
                  else {
                    int v36 = 0;
                  }
                  if (v36 != *(unsigned __int16 *)(v34
                                                  + _NSSQLRowInstanceSize
                                                  + ((2 * *(_DWORD *)(v34 + 16)) & 0x1FFF8)
                                                  + (((unint64_t)*(unsigned int *)(v34 + 16) >> 14) & 0xFFFC)
                                                  + 2LL * v35))
                    v15[(v33 + v32) >> 3] |= 1 << (~(v33 + v32) & 7);
                  ++v32;
                }

                while (v30 != v32);
                uint64_t v37 = [v112 countByEnumeratingWithState:&v125 objects:v135 count:16];
                uint64_t v30 = v37;
                unsigned int v27 = v33 + v32;
              }

              while (v37);
              unsigned int v27 = v33 + v32;
            }

            __int128 v123 = 0u;
            __int128 v124 = 0u;
            __int128 v121 = 0u;
            __int128 v122 = 0u;
            uint64_t v38 = [v113 countByEnumeratingWithState:&v121 objects:v134 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v122;
              do
              {
                uint64_t v41 = 0LL;
                unsigned int v42 = v27;
                uint64_t v43 = (uint64_t)v114;
                do
                {
                  if (*(void *)v122 != v40) {
                    objc_enumerationMutation(v113);
                  }
                  unsigned int v44 = [*(id *)(*((void *)&v121 + 1) + 8 * v41) slot];
                  if (a2) {
                    int v45 = *(_DWORD *)(a2 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(a2 + 16)) & 0x1FFF8) + 4LL * v44);
                  }
                  else {
                    int v45 = 0;
                  }
                  if (*(_DWORD *)(v43 + _NSSQLRowInstanceSize + ((2 * *(_DWORD *)(v43 + 16)) & 0x1FFF8) + 4LL * v44) != v45) {
                    v15[(v42 + v41) >> 3] |= 1 << (~(v42 + v41) & 7);
                  }
                  ++v41;
                }

                while (v39 != v41);
                uint64_t v46 = [v113 countByEnumeratingWithState:&v121 objects:v134 count:16];
                uint64_t v39 = v46;
                unsigned int v27 = v42 + v41;
              }

              while (v46);
              unsigned int v27 = v42 + v41;
            }

- (BOOL)hasUniqueConstraintDiffFrom:(const __CFBitVector *)a1
{
  if (!a1) {
    return 0LL;
  }
  unsigned __int8 v2 = -[NSSQLRow newColumnMaskFrom:columnInclusionOptions:](a1, a2, 24LL);
  if (!v2) {
    return 0LL;
  }
  CFDateRef v3 = v2;
  v6.length = CFBitVectorGetCount(v2);
  v6.location = 0LL;
  BOOL v4 = CFBitVectorContainsBit(v3, v6, 1u) != 0;
  CFRelease(v3);
  return v4;
}

@end