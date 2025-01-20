@interface _NSPersistentHistoryChange
+ (BOOL)supportsSecureCoding;
+ (CFMutableSetRef)_updatedPropertiesForEntity:(void *)a3 andData:;
+ (id)_mergeOldMask:(void *)a3 andNewMask:;
+ (void)_dataMaskForEntity:(const __CFBitVector *)a3 andDeltaMask:;
+ (void)_propertyDataForEntity:(void *)a3 withSetOfPropertyNames:;
- (_NSPersistentHistoryChange)initWithCoder:(id)a3;
- (_NSPersistentHistoryChange)initWithDictionary:(id)a3 andChangeObjectID:(id)a4;
- (_NSPersistentHistoryChange)initWithManagedObject:(id)a3;
- (id)_backingObjectID;
- (id)changedObjectID;
- (id)tombstone;
- (id)transaction;
- (id)updatedProperties;
- (int64_t)changeID;
- (int64_t)changeType;
- (void)_setTransaction:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPersistentHistoryChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryChange)initWithManagedObject:(id)a3
{
  if (a3 && (uint64_t v5 = *((void *)a3 + 6)) != 0) {
    v6 = *(void **)(v5 + 16);
  }
  else {
    v6 = 0LL;
  }
  if ([v6 valueForKey:@"CHANGETYPE"] && objc_msgSend(a3, "objectID")) {
    return -[_NSPersistentHistoryChange initWithDictionary:andChangeObjectID:]( [_NSPersistentHistoryChange alloc],  "initWithDictionary:andChangeObjectID:",  v6,  [a3 objectID]);
  }
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryChange;
  v14 = -[_NSPersistentHistoryChange init](&v15, sel_init);
  if (v14) {
    _NSCoreDataLog( 1LL,  (uint64_t)@"_NSPersistentHistoryChange was created with an empty MO - %@",  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)a3);
  }
  return v14;
}

- (_NSPersistentHistoryChange)initWithDictionary:(id)a3 andChangeObjectID:(id)a4
{
  uint64_t v133 = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a3 count];
  if (a4 && v7)
  {
    uint64_t v8 = [a4 _referenceData64];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"CHANGETYPE"), "unsignedIntegerValue");
    v116 = (void *)[a3 valueForKey:@"COLUMNS"];
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"ENTITY"), "unsignedLongValue");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"ENTITYPK"), "longLongValue");
    uint64_t v12 = (__CFString *)[a4 persistentStore];
    uint64_t v13 = v12;
    int64_t v115 = v8;
    v118 = self;
    uint64_t v113 = v11;
    uint64_t v114 = v10;
    if (!v12 || (v10 ? (BOOL v14 = v11 < 1) : (BOOL v14 = 1), v14))
    {
      uint64_t v43 = [NSString stringWithUTF8String:"Unexpectedly nil entry in: entity - %@, entityID - %ld, pk - %lld, model - %@ - %@, store - %@"];
      v44 = (void *)-[__CFString model](v13, "model");
      if (v44) {
        v44 = (void *)v44[4];
      }
      [v44 valueForKey:@"name"];
      v45 = (void *)-[__CFString model](v13, "model");
      if (v45) {
        v45 = (void *)v45[4];
      }
      [v45 valueForKey:@"entityID"];
      if (v13) {
        v52 = v13;
      }
      else {
        v52 = @"<null>";
      }
      _NSCoreDataLog(17LL, v43, v46, v47, v48, v49, v50, v51, 0LL);
      uint64_t v53 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_58;
      }
      v54 = (void *)-[__CFString model](v13, "model");
      if (v54) {
        v54 = (void *)v54[4];
      }
      uint64_t v55 = [v54 valueForKey:@"name"];
      if (v55) {
        v56 = (const __CFString *)v55;
      }
      else {
        v56 = @"<null>";
      }
      v57 = (void *)-[__CFString model](v13, "model");
      if (v57) {
        v57 = (void *)v57[4];
      }
      uint64_t v58 = [v57 valueForKey:@"entityID"];
      *(_DWORD *)buf = 138413570;
      if (v58) {
        v59 = (const __CFString *)v58;
      }
      else {
        v59 = @"<null>";
      }
      v122 = 0LL;
      __int16 v123 = 2048;
      uint64_t v124 = v10;
      __int16 v125 = 2048;
      uint64_t v126 = v11;
      __int16 v127 = 2112;
      v128 = v56;
      __int16 v129 = 2112;
      v130 = v59;
      __int16 v131 = 2112;
      v132 = v52;
      v60 = "CoreData: Unexpectedly nil entry in: entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@";
      v61 = (os_log_s *)v53;
      uint32_t v62 = 62;
    }

    else
    {
      uint64_t v15 = objc_msgSend((id)-[__CFString model](v12, "model"), "entityForID:", v10);
      if (v15)
      {
        v117 = (void *)v15;
        uint64_t v112 = -[__CFString newObjectIDForEntity:pk:](v13, "newObjectIDForEntity:pk:", v15, v11);
        if (!v112)
        {
          uint64_t v16 = [NSString stringWithUTF8String:"Unexpected change - objectID failed for entity - %@, entityID - %ld, pk - %lld, model - %@ - %@, store - %@"];
          v17 = (void *)-[__CFString model](v13, "model");
          if (v17) {
            v17 = (void *)v17[4];
          }
          uint64_t v18 = [v17 valueForKey:@"name"];
          if (v18) {
            v19 = (const __CFString *)v18;
          }
          else {
            v19 = @"<null>";
          }
          v20 = (void *)-[__CFString model](v13, "model");
          if (v20) {
            v20 = (void *)v20[4];
          }
          uint64_t v21 = [v20 valueForKey:@"entityID"];
          if (v21) {
            v28 = (const __CFString *)v21;
          }
          else {
            v28 = @"<null>";
          }
          v110 = v28;
          v111 = v13;
          uint64_t v108 = v11;
          v109 = v19;
          _NSCoreDataLog(17LL, v16, v22, v23, v24, v25, v26, v27, (uint64_t)v117);
          v29 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v101 = (void *)-[__CFString model](v13, "model");
            if (v101) {
              v101 = (void *)v101[4];
            }
            uint64_t v102 = [v101 valueForKey:@"name"];
            if (v102) {
              v103 = (const __CFString *)v102;
            }
            else {
              v103 = @"<null>";
            }
            v104 = (void *)-[__CFString model](v13, "model");
            if (v104) {
              v104 = (void *)v104[4];
            }
            uint64_t v105 = [v104 valueForKey:@"entityID"];
            *(_DWORD *)buf = 138413570;
            if (v105) {
              v106 = (const __CFString *)v105;
            }
            else {
              v106 = @"<null>";
            }
            v122 = v117;
            __int16 v123 = 2048;
            uint64_t v124 = v10;
            __int16 v125 = 2048;
            uint64_t v126 = v11;
            __int16 v127 = 2112;
            v128 = v103;
            __int16 v129 = 2112;
            v130 = v106;
            __int16 v131 = 2112;
            v132 = v13;
            _os_log_fault_impl( &dword_186681000,  v29,  OS_LOG_TYPE_FAULT,  "CoreData: Unexpected change - objectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@",  buf,  0x3Eu);
          }
        }

        if (v9 == 2)
        {
          id v30 = +[_PFPersistentHistoryModel _retainedTombstonesForEntity:]( (uint64_t)&OBJC_CLASS____PFPersistentHistoryModel,  v117);
          if ([v30 count])
          {
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v30, "count"));
            if ([v30 count])
            {
              unint64_t v32 = 0LL;
              do
              {
                uint64_t v33 = [NSString stringWithFormat:@"%@%lu", @"TOMBSTONE", v32, v108, v109, v110, v111];
                uint64_t v34 = [a3 objectForKey:v33];
                if (v34 != NSKeyValueCoding_NullValue)
                {
                  uint64_t v35 = [a3 objectForKey:v33];
                  if (v35) {
                    objc_msgSend(v31, "setObject:forKey:", v35, objc_msgSend(v30, "objectAtIndexedSubscript:", v32));
                  }
                }

                ++v32;
              }

              while (v32 < [v30 count]);
            }

            if (![v31 count])
            {

              v31 = 0LL;
            }
          }

          else
          {
            v31 = 0LL;
          }

          v74 = (void *)v112;

          int v73 = 1;
        }

        else
        {
          v31 = 0LL;
          int v73 = 1;
          v74 = (void *)v112;
        }

        goto LABEL_59;
      }

      uint64_t v63 = [NSString stringWithUTF8String:"Unexpected change - entity ID (%ld) not found in model - %@ - %@, store - %@"];
      v64 = (void *)-[__CFString model](v13, "model");
      if (v64) {
        v64 = (void *)v64[4];
      }
      [v64 valueForKey:@"name"];
      v65 = (void *)-[__CFString model](v13, "model");
      if (v65) {
        v65 = (void *)v65[4];
      }
      [v65 valueForKey:@"entityID"];
      _NSCoreDataLog(17LL, v63, v66, v67, v68, v69, v70, v71, v10);
      uint64_t v72 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_58:
        int v73 = 0;
        v117 = 0LL;
        v74 = 0LL;
        v31 = 0LL;
LABEL_59:
        v75 = v74;
        if (!objc_opt_class())
        {
          uint64_t v76 = [NSString stringWithUTF8String:"Unexpectedly corrupt changedObjectID failed for entity - %@, entityID - %ld, pk - %lld, model - %@ - %@, store - %@"];
          v77 = (void *)-[__CFString model](v13, "model");
          if (v77) {
            v77 = (void *)v77[4];
          }
          [v77 valueForKey:@"name"];
          v78 = (void *)-[__CFString model](v13, "model");
          if (v78) {
            v78 = (void *)v78[4];
          }
          [v78 valueForKey:@"entityID"];
          if (v13) {
            v85 = v13;
          }
          else {
            v85 = @"<null>";
          }
          _NSCoreDataLog(17LL, v76, v79, v80, v81, v82, v83, v84, (uint64_t)v117);
          v86 = (os_log_s *)__pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            v89 = (void *)-[__CFString model](v13, "model");
            if (v89) {
              v89 = (void *)v89[4];
            }
            uint64_t v90 = [v89 valueForKey:@"name"];
            if (v90) {
              v91 = (const __CFString *)v90;
            }
            else {
              v91 = @"<null>";
            }
            v92 = (void *)-[__CFString model](v13, "model");
            if (v92) {
              v92 = (void *)v92[4];
            }
            uint64_t v93 = [v92 valueForKey:@"entityID"];
            *(_DWORD *)buf = 138413570;
            if (v93) {
              v94 = (const __CFString *)v93;
            }
            else {
              v94 = @"<null>";
            }
            v122 = v117;
            __int16 v123 = 2048;
            uint64_t v124 = v114;
            __int16 v125 = 2048;
            uint64_t v126 = v113;
            __int16 v127 = 2112;
            v128 = v91;
            __int16 v129 = 2112;
            v130 = v94;
            __int16 v131 = 2112;
            v132 = v85;
            _os_log_fault_impl( &dword_186681000,  v86,  OS_LOG_TYPE_FAULT,  "CoreData: Unexpectedly corrupt changedObjectID failed for entity - %@, entityID - %ld,  pk - %lld,  model - %@ - %@, store - %@",  buf,  0x3Eu);
          }
        }

        v119.receiver = v118;
        v119.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryChange;
        v87 = -[_NSPersistentHistoryChange init](&v119, sel_init);
        v42 = v87;
        if (v87)
        {
          v87->_changeID = v115;
          v87->_changedObjectID = (NSManagedObjectID *)v75;
          v42->_changeType = v9;
          if (v31) {
            v42->_tombstone = (NSDictionary *)v31;
          }
          if (v116) {
            v42->_columns = (NSData *)v116;
          }
          if (v73) {
            v42->_sqlEntity = (NSSQLEntity *)v117;
          }
          v42->_backingObjectID = (NSManagedObjectID *)a4;
        }

        return v42;
      }

      v95 = (void *)-[__CFString model](v13, "model");
      if (v95) {
        v95 = (void *)v95[4];
      }
      uint64_t v96 = [v95 valueForKey:@"name"];
      if (v96) {
        v97 = (const __CFString *)v96;
      }
      else {
        v97 = @"<null>";
      }
      v98 = (void *)-[__CFString model](v13, "model");
      if (v98) {
        v98 = (void *)v98[4];
      }
      uint64_t v99 = [v98 valueForKey:@"entityID"];
      *(_DWORD *)buf = 134218754;
      if (v99) {
        v100 = (const __CFString *)v99;
      }
      else {
        v100 = @"<null>";
      }
      v122 = (void *)v10;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v97;
      __int16 v125 = 2112;
      uint64_t v126 = (uint64_t)v100;
      __int16 v127 = 2112;
      v128 = v13;
      v60 = "CoreData: Unexpected change - entity ID (%ld) not found in model - %@ - %@, store - %@";
      v61 = (os_log_s *)v72;
      uint32_t v62 = 42;
    }

    _os_log_fault_impl(&dword_186681000, v61, OS_LOG_TYPE_FAULT, v60, buf, v62);
    goto LABEL_58;
  }

  v120.receiver = self;
  v120.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryChange;
  v42 = -[_NSPersistentHistoryChange init](&v120, sel_init);
  if (v42) {
    _NSCoreDataLog( 1LL,  (uint64_t)@"_NSPersistentHistoryChange was created with an empty changeDictionary or changeObjectID",  v36,  v37,  v38,  v39,  v40,  v41,  v107);
  }
  return v42;
}

- (void)dealloc
{
  self->_changedObjectID = 0LL;
  self->_tombstone = 0LL;

  self->_columns = 0LL;
  self->_sqlEntity = 0LL;

  self->_backingObjectID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryChange;
  -[_NSPersistentHistoryChange dealloc](&v3, sel_dealloc);
}

- (_NSPersistentHistoryChange)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryChange;
  v4 = -[_NSPersistentHistoryChange init](&v8, sel_init);
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x186E3E5D8]();
    v4->_changedObjectID = (NSManagedObjectID *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines xpcStoreArchiverObjectIDClassesForSecureCoding]() forKey:@"NSPersistentHistoryChangeObjectID"];
    v4->_changeID = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSPersistentHistoryChangeID"),  "longLongValue");
    v4->_changeType = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSPersistentHistoryChangeType"),  "integerValue");
    v4->_tombstone = (NSDictionary *)(id)[a3 decodeObjectOfClasses:+[_PFRoutines attributeClassesForSecureCoding]() forKey:@"NSPersistentHistoryChangeTombstone"];
    v4->_columns = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPersistentHistoryChangeColumn"];
    changedObjectID = v4->_changedObjectID;
    if (changedObjectID) {
      v4->_sqlEntity = (NSSQLEntity *)(id)_sqlEntityForEntityDescription( -[NSPersistentStore model]( -[NSManagedObjectID persistentStore]( changedObjectID,  "persistentStore"),  "model"),  (void *)-[NSManagedObjectID entity]( v4->_changedObjectID,  "entity"));
    }
    objc_autoreleasePoolPop(v5);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x186E3E5D8](self, a2);
  [a3 encodeObject:self->_changedObjectID forKey:@"NSPersistentHistoryChangeObjectID"];
  objc_msgSend( a3,  "encodeObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithLongLong:", self->_changeID),  @"NSPersistentHistoryChangeID");
  objc_msgSend( a3,  "encodeObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", self->_changeType),  @"NSPersistentHistoryChangeType");
  [a3 encodeObject:self->_tombstone forKey:@"NSPersistentHistoryChangeTombstone"];
  [a3 encodeObject:self->_transaction forKey:@"NSPersistentHistoryChangeTransaction"];
  [a3 encodeObject:self->_columns forKey:@"NSPersistentHistoryChangeColumn"];
  objc_autoreleasePoolPop(v5);
}

- (id)tombstone
{
  return self->_tombstone;
}

- (id)changedObjectID
{
  return self->_changedObjectID;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)_setTransaction:(id)a3
{
  self->_transaction = (NSPersistentHistoryTransaction *)a3;
}

- (id)transaction
{
  return self->_transaction;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (id)updatedProperties
{
  columns = self->_columns;
  if (columns && (sqlEntity = self->_sqlEntity) != 0LL) {
    return  +[_NSPersistentHistoryChange _updatedPropertiesForEntity:andData:]( (uint64_t)&OBJC_CLASS____NSPersistentHistoryChange,  sqlEntity,  columns);
  }
  else {
    return 0LL;
  }
}

+ (CFMutableSetRef)_updatedPropertiesForEntity:(void *)a3 andData:
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = (void *)[a2 foreignKeyColumns];
  v6 = (void *)[a2 foreignEntityKeyColumns];
  uint64_t v7 = (void *)[a2 foreignOrderKeyColumns];
  objc_super v8 = (void *)[a2 attributeColumns];
  uint64_t v9 = (void *)[a2 toManyRelationships];
  uint64_t v10 = (void *)[a2 manyToManyRelationships];
  v65 = v8;
  uint64_t v11 = [v8 count];
  uint64_t v12 = [v7 count];
  uint64_t v13 = [v6 count];
  uint64_t v14 = [v5 count];
  uint64_t v66 = v9;
  uint64_t v15 = [v9 count];
  uint64_t v67 = v10;
  unint64_t v16 = v12 + v11 + v13 + v14 + v15 + [v10 count];
  if (v16 > 8 * [a3 length]) {
    return 0LL;
  }
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
  uint64_t v18 = CFBitVectorCreate(0, (const UInt8 *)[a3 bytes], v16);
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v19)
  {
    int v20 = 0;
    uint64_t v21 = *(void *)v89;
    do
    {
      uint64_t v22 = 0LL;
      int v23 = v20;
      do
      {
        if (*(void *)v89 != v21) {
          objc_enumerationMutation(v5);
        }
        uint64_t v24 = *(void **)(*((void *)&v88 + 1) + 8 * v22);
        if (CFBitVectorGetBitAtIndex(v18, (v23 + v22)))
        {
          uint64_t v25 = (void *)[v24 toOneRelationship];
          if (v25)
          {
            uint64_t v26 = [v25 propertyDescription];
            if (v26) {
              -[__CFSet addObject:](Mutable, "addObject:", v26);
            }
          }
        }

        ++v22;
      }

      while (v19 != v22);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v88 objects:v97 count:16];
      int v20 = v23 + v22;
    }

    while (v19);
    LODWORD(v19) = v23 + v22;
  }

  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  uint64_t v27 = [v6 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v85;
    do
    {
      uint64_t v30 = 0LL;
      int v31 = v19;
      do
      {
        if (*(void *)v85 != v29) {
          objc_enumerationMutation(v6);
        }
        unint64_t v32 = *(void **)(*((void *)&v84 + 1) + 8 * v30);
        if (CFBitVectorGetBitAtIndex(v18, (v31 + v30)))
        {
          uint64_t v33 = (void *)[v32 toOneRelationship];
          if (v33)
          {
            uint64_t v34 = [v33 propertyDescription];
            if (v34) {
              -[__CFSet addObject:](Mutable, "addObject:", v34);
            }
          }
        }

        ++v30;
      }

      while (v28 != v30);
      uint64_t v28 = [v6 countByEnumeratingWithState:&v84 objects:v96 count:16];
      LODWORD(v19) = v31 + v30;
    }

    while (v28);
    LODWORD(v19) = v31 + v30;
  }

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  uint64_t v35 = [v7 countByEnumeratingWithState:&v80 objects:v95 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v81;
    do
    {
      uint64_t v38 = 0LL;
      int v39 = v19;
      do
      {
        if (*(void *)v81 != v37) {
          objc_enumerationMutation(v7);
        }
        uint64_t v40 = *(void **)(*((void *)&v80 + 1) + 8 * v38);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v38)))
        {
          uint64_t v41 = (void *)[v40 toOneRelationship];
          if (v41)
          {
            uint64_t v42 = [v41 propertyDescription];
            if (v42) {
              -[__CFSet addObject:](Mutable, "addObject:", v42);
            }
          }
        }

        ++v38;
      }

      while (v36 != v38);
      uint64_t v36 = [v7 countByEnumeratingWithState:&v80 objects:v95 count:16];
      LODWORD(v19) = v19 + v38;
    }

    while (v36);
    LODWORD(v19) = v39 + v38;
  }

  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  uint64_t v43 = [v65 countByEnumeratingWithState:&v76 objects:v94 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v77;
    do
    {
      uint64_t v46 = 0LL;
      int v47 = v19;
      do
      {
        if (*(void *)v77 != v45) {
          objc_enumerationMutation(v65);
        }
        uint64_t v48 = *(void **)(*((void *)&v76 + 1) + 8 * v46);
        ++v46;
      }

      while (v44 != v46);
      uint64_t v44 = [v65 countByEnumeratingWithState:&v76 objects:v94 count:16];
      LODWORD(v19) = v19 + v46;
    }

    while (v44);
    LODWORD(v19) = v47 + v46;
  }

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  uint64_t v49 = [v66 countByEnumeratingWithState:&v72 objects:v93 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v73;
    do
    {
      uint64_t v52 = 0LL;
      int v53 = v19;
      do
      {
        if (*(void *)v73 != v51) {
          objc_enumerationMutation(v66);
        }
        v54 = *(void **)(*((void *)&v72 + 1) + 8 * v52);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v52)))
        {
          if (v54) {
            uint64_t v55 = [v54 propertyDescription];
          }
          else {
            uint64_t v55 = 0LL;
          }
          -[__CFSet addObject:](Mutable, "addObject:", v55);
        }

        ++v52;
      }

      while (v50 != v52);
      uint64_t v56 = [v66 countByEnumeratingWithState:&v72 objects:v93 count:16];
      uint64_t v50 = v56;
      LODWORD(v19) = v19 + v52;
    }

    while (v56);
    LODWORD(v19) = v53 + v52;
  }

  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  uint64_t v57 = [v67 countByEnumeratingWithState:&v68 objects:v92 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v69;
    do
    {
      uint64_t v60 = 0LL;
      do
      {
        if (*(void *)v69 != v59) {
          objc_enumerationMutation(v67);
        }
        v61 = *(void **)(*((void *)&v68 + 1) + 8 * v60);
        if (CFBitVectorGetBitAtIndex(v18, (v19 + v60)))
        {
          if (v61) {
            uint64_t v62 = [v61 propertyDescription];
          }
          else {
            uint64_t v62 = 0LL;
          }
          -[__CFSet addObject:](Mutable, "addObject:", v62);
        }

        ++v60;
      }

      while (v58 != v60);
      uint64_t v63 = [v67 countByEnumeratingWithState:&v68 objects:v92 count:16];
      uint64_t v58 = v63;
      LODWORD(v19) = v19 + v60;
    }

    while (v63);
  }

  CFRelease(v18);
  return Mutable;
}

- (id)_backingObjectID
{
  return self->_backingObjectID;
}

+ (void)_propertyDataForEntity:(void *)a3 withSetOfPropertyNames:
{
  uint64_t v96 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = (void *)[a2 foreignKeyColumns];
  v6 = (void *)[a2 foreignEntityKeyColumns];
  uint64_t v7 = (void *)[a2 foreignOrderKeyColumns];
  objc_super v8 = (void *)[a2 attributeColumns];
  uint64_t v9 = (void *)[a2 toManyRelationships];
  uint64_t v10 = (void *)[a2 manyToManyRelationships];
  id v64 = v8;
  uint64_t v11 = [v8 count];
  id v63 = v7;
  uint64_t v12 = [v7 count] + v11;
  id v62 = v6;
  uint64_t v13 = [v6 count];
  uint64_t v14 = v12 + v13 + [v5 count];
  id v65 = v9;
  uint64_t v15 = [v9 count];
  id v61 = v10;
  CFIndex v60 = v14 + v15 + [v10 count];
  MEMORY[0x1895F8858]();
  v17 = (const UInt8 *)&v60 - v16;
  bzero((char *)&v60 - v16, v18);
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  uint64_t v19 = [v5 countByEnumeratingWithState:&v86 objects:v95 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    int v21 = 0;
    uint64_t v22 = *(void *)v87;
    do
    {
      uint64_t v23 = 0LL;
      int v24 = v21;
      do
      {
        if (*(void *)v87 != v22) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend( a3,  "containsObject:",  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * v23), "toOneRelationship"),  "name"))) {
          v17[(v24 + v23) >> 3] |= 1 << (~(v24 + v23) & 7);
        }
        ++v23;
      }

      while (v20 != v23);
      uint64_t v20 = [v5 countByEnumeratingWithState:&v86 objects:v95 count:16];
      int v21 = v24 + v23;
    }

    while (v20);
    int v25 = v24 + v23;
  }

  else
  {
    int v25 = 0;
  }

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  uint64_t v26 = [v62 countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v83;
    do
    {
      uint64_t v29 = 0LL;
      int v30 = v25;
      id v31 = v62;
      do
      {
        if (*(void *)v83 != v28) {
          objc_enumerationMutation(v31);
        }
        if (objc_msgSend( a3,  "containsObject:",  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v82 + 1) + 8 * v29), "toOneRelationship"),  "name"))) {
          v17[(v30 + v29) >> 3] |= 1 << (~(v30 + v29) & 7);
        }
        ++v29;
      }

      while (v27 != v29);
      uint64_t v27 = [v31 countByEnumeratingWithState:&v82 objects:v94 count:16];
      int v25 = v30 + v29;
    }

    while (v27);
    int v25 = v30 + v29;
  }

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  uint64_t v32 = [v63 countByEnumeratingWithState:&v78 objects:v93 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v79;
    do
    {
      uint64_t v35 = 0LL;
      int v36 = v25;
      id v37 = v63;
      do
      {
        if (*(void *)v79 != v34) {
          objc_enumerationMutation(v37);
        }
        if (objc_msgSend( a3,  "containsObject:",  objc_msgSend( (id)objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * v35), "toOneRelationship"),  "name"))) {
          v17[(v36 + v35) >> 3] |= 1 << (~(v36 + v35) & 7);
        }
        ++v35;
      }

      while (v33 != v35);
      uint64_t v33 = [v37 countByEnumeratingWithState:&v78 objects:v93 count:16];
      int v25 = v36 + v35;
    }

    while (v33);
    int v25 = v36 + v35;
  }

  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  uint64_t v38 = [v64 countByEnumeratingWithState:&v74 objects:v92 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v75;
    do
    {
      uint64_t v41 = 0LL;
      int v42 = v25;
      id v43 = v64;
      do
      {
        if (*(void *)v75 != v40) {
          objc_enumerationMutation(v43);
        }
        if (objc_msgSend( a3,  "containsObject:",  objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * v41), "name"))) {
          v17[(v42 + v41) >> 3] |= 1 << (~(v42 + v41) & 7);
        }
        ++v41;
      }

      while (v39 != v41);
      uint64_t v39 = [v43 countByEnumeratingWithState:&v74 objects:v92 count:16];
      int v25 = v42 + v41;
    }

    while (v39);
    int v25 = v42 + v41;
  }

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  uint64_t v44 = [v65 countByEnumeratingWithState:&v70 objects:v91 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v71;
    do
    {
      uint64_t v47 = 0LL;
      int v48 = v25;
      id v49 = v65;
      do
      {
        if (*(void *)v71 != v46) {
          objc_enumerationMutation(v49);
        }
        if (objc_msgSend( a3,  "containsObject:",  objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * v47), "name"))) {
          v17[(v48 + v47) >> 3] |= 1 << (~(v48 + v47) & 7);
        }
        ++v47;
      }

      while (v45 != v47);
      uint64_t v45 = [v49 countByEnumeratingWithState:&v70 objects:v91 count:16];
      int v25 = v48 + v47;
    }

    while (v45);
    int v25 = v48 + v47;
  }

  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  id v50 = v61;
  uint64_t v51 = [v61 countByEnumeratingWithState:&v66 objects:v90 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v67;
    do
    {
      for (uint64_t i = 0LL; i != v52; ++i)
      {
        if (*(void *)v67 != v53) {
          objc_enumerationMutation(v50);
        }
        if (objc_msgSend( a3,  "containsObject:",  objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * i), "name"))) {
          v17[(v25 + i) >> 3] |= 1 << (~(v25 + i) & 7);
        }
      }

      uint64_t v52 = [v50 countByEnumeratingWithState:&v66 objects:v90 count:16];
      v25 += i;
    }

    while (v52);
  }

  CFIndex v55 = v60;
  uint64_t v56 = CFBitVectorCreate(0LL, v17, v60);
  uint64_t v57 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:(unint64_t)(v55 + 7) >> 3];
  uint64_t v58 = (UInt8 *)[v57 mutableBytes];
  v97.location = 0LL;
  v97.length = v55;
  CFBitVectorGetBits(v56, v97, v58);
  CFRelease(v56);
  return v57;
}

+ (void)_dataMaskForEntity:(const __CFBitVector *)a3 andDeltaMask:
{
  v31[1] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  uint64_t v5 = (void *)[a2 foreignKeyColumns];
  v6 = (void *)[a2 foreignEntityKeyColumns];
  uint64_t v7 = (void *)[a2 foreignOrderKeyColumns];
  objc_super v8 = (void *)[a2 attributeColumns];
  uint64_t v9 = (void *)[a2 toManyRelationships];
  uint64_t v10 = (void *)[a2 manyToManyRelationships];
  uint64_t v11 = [v8 count];
  uint64_t v12 = [v7 count] + v11;
  uint64_t v13 = [v6 count];
  uint64_t v14 = v12 + v13 + [v5 count];
  uint64_t v15 = [v9 count];
  uint64_t v16 = [v10 count];
  CFIndex v17 = v14 + v15 + v16;
  MEMORY[0x1895F8858](v16);
  uint64_t v19 = (const UInt8 *)v31 - v18;
  bzero((char *)v31 - v18, v20);
  CFIndex Count = CFBitVectorGetCount(a3);
  CFIndex v22 = Count - 1;
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v23 = Count;
  CFIndex v24 = 0LL;
  char v25 = 0;
  do
  {
    while (CFBitVectorGetBitAtIndex(a3, v24))
    {
      char v25 = 1;
      v19[v24 >> 3] |= 1 << (~(_BYTE)v24 & 7);
      if (v22 == v24++) {
        goto LABEL_10;
      }
    }

    ++v24;
  }

  while (v23 != v24);
  if ((v25 & 1) == 0) {
    return 0LL;
  }
LABEL_10:
  uint64_t v27 = CFBitVectorCreate(0LL, v19, v17);
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:(unint64_t)(v17 + 7) >> 3];
  uint64_t v29 = (UInt8 *)[v28 mutableBytes];
  v32.location = 0LL;
  v32.length = v17;
  CFBitVectorGetBits(v27, v32, v29);
  CFRelease(v27);
  return v28;
}

+ (id)_mergeOldMask:(void *)a3 andNewMask:
{
  uint64_t v5 = [a2 bytes];
  uint64_t v6 = [a3 bytes];
  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  if ([a2 length])
  {
    unint64_t v8 = 0LL;
    unsigned int v9 = 1;
    do
    {
      if ([a3 length] <= v8) {
        break;
      }
      char v12 = *(_BYTE *)(v6 + v8) | *(_BYTE *)(v5 + v8);
      [v7 appendBytes:&v12 length:1];
      unint64_t v8 = v9;
    }

    while ([a2 length] > (unint64_t)v9++);
  }

  return v7;
}

@end