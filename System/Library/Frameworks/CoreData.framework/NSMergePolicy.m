@interface NSMergePolicy
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (NSMergePolicy)errorMergePolicy;
+ (NSMergePolicy)mergeByPropertyObjectTrumpMergePolicy;
+ (NSMergePolicy)mergeByPropertyStoreTrumpMergePolicy;
+ (NSMergePolicy)overwriteMergePolicy;
+ (NSMergePolicy)rollbackMergePolicy;
+ (void)initialize;
- (BOOL)resolveConflicts:(NSArray *)list error:(NSError *)error;
- (BOOL)resolveConstraintConflicts:(NSArray *)list error:(NSError *)error;
- (BOOL)resolveOptimisticLockingVersionConflicts:(NSArray *)list error:(NSError *)error;
- (NSMergePolicy)init;
- (NSMergePolicy)initWithCoder:(id)a3;
- (NSMergePolicyType)mergeType;
- (id)initWithMergeType:(NSMergePolicyType)ty;
- (uint64_t)_byPropertyObjectTrumpResolveConstraintConflict:(void *)a1;
- (uint64_t)_byPropertyStoreTrumpResolveConstraintConflict:(void *)a1;
- (uint64_t)_cannotResolveConflictOnEntity:(void *)a1 relationshipWithNoInverse:(void *)a2;
- (uint64_t)_mergeToManyUnionRelationshipsForObject:(void *)a1 andObject:(void *)a2;
- (uint64_t)_overwriteResolveConstraintConflict:(void *)a1;
- (uint64_t)_rollbackResolveConstraintConflict:(void *)a1;
- (uint64_t)_valuesOnObject:(uint64_t)a1 matchAgainstValues:(void *)a2;
- (void)_mergeChangesObjectUpdatesTrumpForObject:(id)a3 withRecord:(id)a4;
- (void)_mergeChangesStoreUpdatesTrumpForObject:(id)a3 withRecord:(id)a4;
- (void)_mergeToManyRelationshipsForObject:(void *)a1 ontoObject:(void *)a2;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMergePolicy

+ (void)initialize
{
  if ((_MergedGlobals_74 & 1) == 0)
  {
    _MergedGlobals_74 = 1;
    objc_opt_self();
    dword_18C4ABA3C = _CFExecutableLinkedOnOrAfter() == 0;
    NSErrorMergePolicy = -[NSMergePolicy initWithMergeType:]( objc_alloc(&OBJC_CLASS___NSMergePolicy),  "initWithMergeType:",  0LL);
    NSMergeByPropertyStoreTrumpMergePolicy = -[NSMergePolicy initWithMergeType:]( objc_alloc(&OBJC_CLASS___NSMergePolicy),  "initWithMergeType:",  1LL);
    NSMergeByPropertyObjectTrumpMergePolicy = -[NSMergePolicy initWithMergeType:]( objc_alloc(&OBJC_CLASS___NSMergePolicy),  "initWithMergeType:",  2LL);
    NSOverwriteMergePolicy = -[NSMergePolicy initWithMergeType:]( objc_alloc(&OBJC_CLASS___NSMergePolicy),  "initWithMergeType:",  3LL);
    NSRollbackMergePolicy = -[NSMergePolicy initWithMergeType:]( objc_alloc(&OBJC_CLASS___NSMergePolicy),  "initWithMergeType:",  4LL);
  }

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (id)initWithMergeType:(NSMergePolicyType)ty
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSMergePolicy;
  id result = -[NSMergePolicy init](&v5, sel_init);
  if (result) {
    *((void *)result + 1) = ty;
  }
  return result;
}

- (NSMergePolicyType)mergeType
{
  return self->_type;
}

- (NSMergePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMergePolicy;
  return -[NSMergePolicy init](&v3, sel_init);
}

- (void)dealloc
{
  if (NSMergeByPropertyStoreTrumpMergePolicy == self
    || NSMergeByPropertyObjectTrumpMergePolicy == self
    || NSOverwriteMergePolicy == self
    || NSRollbackMergePolicy == self
    || NSErrorMergePolicy == self)
  {
    v6 = self;
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSMergePolicy;
    -[NSMergePolicy dealloc](&v7, sel_dealloc);
  }

- (NSMergePolicy)initWithCoder:(id)a3
{
  unsigned int v4 = [a3 decodeIntForKey:@"NSTypeCode"] - 1;
  if (v4 > 3) {
    objc_super v5 = &NSErrorMergePolicy;
  }
  else {
    objc_super v5 = (id *)off_189EA8930[v4];
  }
  id v7 = *v5;

  return (NSMergePolicy *)v7;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (uint64_t)_valuesOnObject:(uint64_t)a1 matchAgainstValues:(void *)a2
{
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __52__NSMergePolicy__valuesOnObject_matchAgainstValues___block_invoke;
  v4[3] = &unk_189EA7D08;
  v4[4] = a1;
  v4[5] = &v5;
  [a2 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __52__NSMergePolicy__valuesOnObject_matchAgainstValues___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  unint64_t v5 = (unint64_t)a3;
  uint64_t result = [*(id *)(a1 + 32) valueForKey:a2];
  if (v5 | result)
  {
    v9 = (void *)result;
    uint64_t result = [(id)v5 isEqual:result];
    if ((result & 1) == 0)
    {
      uint64_t result = [v9 isNSString];
      if (!(_DWORD)result
        || (uint64_t result = +[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)&OBJC_CLASS____PFRoutines, v9, (void *)v5),
            (result & 1) == 0))
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
        *a4 = 1;
      }
    }
  }

  return result;
}

- (uint64_t)_rollbackResolveConstraintConflict:(void *)a1
{
  v1 = (void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  int v2 = [v1 isInserted];
  objc_super v3 = (void *)[v1 managedObjectContext];
  if (v2) {
    return [v3 deleteObject:v1];
  }
  else {
    return [v3 refreshObject:v1 mergeChanges:0];
  }
}

- (uint64_t)_cannotResolveConflictOnEntity:(void *)a1 relationshipWithNoInverse:(void *)a2
{
  return -[NSMergePolicy _mergeToManyUnionRelationshipsForObject:andObject:]();
}

- (uint64_t)_mergeToManyUnionRelationshipsForObject:(void *)a1 andObject:(void *)a2
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  uint64_t v3 = [a2 entity];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    uint64_t result = [*(id *)(v3 + 104) keys];
    uint64_t v6 = v4[14];
    unint64_t v7 = *(void *)(v6 + 144);
    unint64_t v39 = *(void *)(v6 + 152) + v7;
    if (v7 < v39)
    {
      uint64_t v8 = result;
      uint64_t v36 = result;
      v37 = v4;
      while (1)
      {
        v9 = *(void **)(v4[12] + 24LL + 8 * v7);
        v10 = (void *)objc_msgSend(v9, "inverseRelationship", v36);
        uint64_t v11 = [v10 name];
        int v12 = [v10 isToMany];
        int v42 = [v10 isOrdered];
        v38 = v9;
        int v13 = [v9 isOrdered];
        uint64_t v14 = *(void *)(v8 + 8 * v7);
        unint64_t v41 = v7;
        if (v13) {
          break;
        }
        v18 = (void *)[a1 mutableSetValueForKey:v14];
        v19 = (void *)[a2 mutableSetValueForKey:*(void *)(v8 + 8 * v7)];
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v47 = 0u;
        v40 = v19;
        v20 = (void *)[v19 allObjects];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v45;
          do
          {
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v45 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              [v18 addObject:v25];
              if (!v10) {
LABEL_40:
              }
                -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v37, v38);
              if (v12)
              {
                if (v42) {
                  v26 = (void *)[v25 mutableOrderedSetValueForKey:v11];
                }
                else {
                  v26 = (void *)[v25 mutableSetValueForKey:v11];
                }
                v27 = v26;
                [v26 removeObject:a2];
                [v27 addObject:a1];
              }

              else
              {
                [v25 setValue:a1 forKey:v11];
              }
            }

            uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }

          while (v22);
LABEL_37:
          uint64_t v8 = v36;
          unsigned int v4 = v37;
        }

- (uint64_t)_overwriteResolveConstraintConflict:(void *)a1
{
  int v2 = (void *)[a1 databaseObject];
  -[NSMergePolicy _mergeToManyUnionRelationshipsForObject:andObject:]( (void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject"),  (void *)objc_msgSend(a1, "databaseObject"));
  return objc_msgSend((id)objc_msgSend(v2, "managedObjectContext"), "deleteObject:", v2);
}

- (void)_mergeToManyRelationshipsForObject:(void *)a1 ontoObject:(void *)a2
{
  int v2 = a1;
  uint64_t v104 = *MEMORY[0x1895F89C0];
  uint64_t v3 = [a1 entity];
  unsigned int v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = [*(id *)(v3 + 104) keys];
    uint64_t v6 = v4[14];
    if (!v2) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v5 = [0 keys];
    uint64_t v6 = 0LL;
    if (!v2)
    {
LABEL_7:
      v66 = 0LL;
      goto LABEL_8;
    }
  }

  uint64_t v7 = v2[6];
  if (!v7) {
    goto LABEL_7;
  }
  v66 = *(void **)(v7 + 8);
LABEL_8:
  unint64_t v8 = *(void *)(v6 + 144);
  unint64_t v65 = *(void *)(v6 + 152) + v8;
  if (v8 >= v65) {
    return;
  }
  v71 = v2;
  uint64_t v67 = v5;
  v64 = v4;
  do
  {
    v9 = *(void **)(v4[12] + 24LL + 8 * v8);
    v10 = (void *)[v9 inverseRelationship];
    uint64_t v11 = [v10 name];
    int v12 = [v10 isToMany];
    int v72 = [v10 isOrdered];
    v63 = v9;
    int v13 = [v9 isOrdered];
    uint64_t v14 = *(void *)(v5 + 8 * v8);
    unint64_t v68 = v8;
    if (v13)
    {
      v15 = (void *)[v2 mutableOrderedSetValueForKey:v14];
      v16 = (void *)[v66 objectForKey:*(void *)(v5 + 8 * v8)];
      id v17 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      uint64_t v18 = [v16 countByEnumeratingWithState:&v94 objects:v103 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v95;
        do
        {
          for (uint64_t i = 0LL; i != v19; ++i)
          {
            if (*(void *)v95 != v20) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void *)(*((void *)&v94 + 1) + 8 * i);
            if (([v15 containsObject:v22] & 1) == 0) {
              [v17 addObject:v22];
            }
          }

          uint64_t v19 = [v16 countByEnumeratingWithState:&v94 objects:v103 count:16];
        }

        while (v19);
      }

      uint64_t v23 = (void *)[a2 mutableOrderedSetValueForKey:*(void *)(v67 + 8 * v68)];
      obuint64_t j = v17;
      if ([v15 count]) {
        v24 = (void *)objc_msgSend( v15,  "objectsAtIndexes:",  objc_msgSend( MEMORY[0x1896078D0],  "indexSetWithIndexesInRange:",  0,  objc_msgSend(v15, "count")));
      }
      else {
        v24 = (void *)[MEMORY[0x189603F18] array];
      }
      m = v24;
      __int128 v92 = 0u;
      __int128 v93 = 0u;
      __int128 v90 = 0u;
      __int128 v91 = 0u;
      uint64_t v48 = [v24 countByEnumeratingWithState:&v90 objects:v102 count:16];
      if (!v48) {
        goto LABEL_76;
      }
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v91;
LABEL_64:
      uint64_t v51 = 0LL;
      while (1)
      {
        v52 = v15;
        if (*(void *)v91 != v50) {
          objc_enumerationMutation(m);
        }
        v53 = *(void **)(*((void *)&v90 + 1) + 8 * v51);
        [v23 addObject:v53];
        if (!v10) {
          break;
        }
        if (v12)
        {
          if (v72) {
            uint64_t v54 = (void *)[v53 mutableOrderedSetValueForKey:v11];
          }
          else {
            uint64_t v54 = (void *)[v53 mutableSetValueForKey:v11];
          }
          v55 = v54;
          [v54 removeObject:v71];
          [v55 addObject:a2];
        }

        else
        {
          [v53 setValue:a2 forKey:v11];
        }

        ++v51;
        v15 = v52;
        if (v49 == v51)
        {
          uint64_t v49 = [m countByEnumeratingWithState:&v90 objects:v102 count:16];
          if (!v49)
          {
LABEL_76:
            __int128 v88 = 0u;
            __int128 v89 = 0u;
            __int128 v86 = 0u;
            __int128 v87 = 0u;
            uint64_t v56 = [obj countByEnumeratingWithState:&v86 objects:v101 count:16];
            if (!v56) {
              goto LABEL_89;
            }
            uint64_t v57 = v56;
            uint64_t v58 = *(void *)v87;
            while (1)
            {
              for (uint64_t j = 0LL; j != v57; ++j)
              {
                if (*(void *)v87 != v58) {
                  objc_enumerationMutation(obj);
                }
                m = *(void **)(*((void *)&v86 + 1) + 8 * j);
                if ([v23 containsObject:m])
                {
                  [v23 removeObject:m];
                  if (!v10)
                  {

                    while (1)
                    {
LABEL_95:
                      -[NSMergePolicy _cannotResolveConflictOnEntity:relationshipWithNoInverse:](v64, v63);
LABEL_96:
                    }
                  }

                  if (v72) {
                    v60 = (void *)[m mutableOrderedSetValueForKey:v11];
                  }
                  else {
                    v60 = (void *)[m mutableSetValueForKey:v11];
                  }
                  [v60 removeObject:a2];
                }
              }

              uint64_t v57 = [obj countByEnumeratingWithState:&v86 objects:v101 count:16];
              if (!v57)
              {
LABEL_89:

                [v15 removeAllObjects];
                goto LABEL_90;
              }
            }
          }

          goto LABEL_64;
        }
      }

      v61 = obj;
LABEL_94:

      goto LABEL_95;
    }

    v25 = (void *)[v2 mutableSetValueForKey:v14];
    v26 = (void *)[v66 objectForKey:*(void *)(v5 + 8 * v8)];
    id v27 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    uint64_t v28 = [v26 countByEnumeratingWithState:&v82 objects:v100 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v83;
      do
      {
        for (uint64_t k = 0LL; k != v29; ++k)
        {
          if (*(void *)v83 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v82 + 1) + 8 * k);
          if (([v25 containsObject:v32] & 1) == 0) {
            [v27 addObject:v32];
          }
        }

        uint64_t v29 = [v26 countByEnumeratingWithState:&v82 objects:v100 count:16];
      }

      while (v29);
    }

    v62 = v27;
    v33 = (void *)[a2 mutableSetValueForKey:*(void *)(v67 + 8 * v68)];
    v34 = (void *)[v25 allObjects];
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    id obja = v34;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v78 objects:v99 count:16];
    if (!v35) {
      goto LABEL_45;
    }
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v79;
    do
    {
      for (m = 0LL; m != (void *)v36; m = (char *)m + 1)
      {
        if (*(void *)v79 != v37) {
          objc_enumerationMutation(obja);
        }
        unint64_t v39 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)m);
        [v33 addObject:v39];
        if (!v10)
        {
          v61 = v62;
          goto LABEL_94;
        }

        if (v12)
        {
          if (v72) {
            v40 = (void *)[v39 mutableOrderedSetValueForKey:v11];
          }
          else {
            v40 = (void *)[v39 mutableSetValueForKey:v11];
          }
          unint64_t v41 = v40;
          [v40 removeObject:v71];
          [v41 addObject:a2];
        }

        else
        {
          [v39 setValue:a2 forKey:v11];
        }

        [v25 removeObject:v39];
      }

      uint64_t v36 = [obja countByEnumeratingWithState:&v78 objects:v99 count:16];
    }

    while (v36);
LABEL_45:
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    m = v62;
    uint64_t v42 = [v62 countByEnumeratingWithState:&v74 objects:v98 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v75;
      do
      {
        for (uint64_t n = 0LL; n != v43; ++n)
        {
          if (*(void *)v75 != v44) {
            objc_enumerationMutation(v62);
          }
          __int128 v46 = *(void **)(*((void *)&v74 + 1) + 8 * n);
          if ([v33 containsObject:v46])
          {
            [v33 removeObject:v46];
            if (!v10) {
              goto LABEL_96;
            }
            if (v12)
            {
              if (v72) {
                __int128 v47 = (void *)[v46 mutableOrderedSetValueForKey:v11];
              }
              else {
                __int128 v47 = (void *)[v46 mutableSetValueForKey:v11];
              }
              [v47 removeObject:a2];
            }

            else
            {
              [v46 setValue:0 forKey:v11];
            }
          }
        }

        uint64_t v43 = [v62 countByEnumeratingWithState:&v74 objects:v98 count:16];
      }

      while (v43);
    }

LABEL_90:
    uint64_t v5 = v67;
    unint64_t v8 = v68 + 1;
    unsigned int v4 = v64;
    int v2 = v71;
  }

  while (v68 + 1 != v65);
}

- (uint64_t)_byPropertyStoreTrumpResolveConstraintConflict:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  uint64_t v3 = (void *)[a1 conflictingObjects];
  else {
    unsigned int v4 = 0LL;
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        if (v4 != v9) {
          -[NSMergePolicy _mergeToManyRelationshipsForObject:ontoObject:](v9, v4);
        }
        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return objc_msgSend((id)objc_msgSend(v2, "managedObjectContext"), "deleteObject:", v2);
}

- (uint64_t)_byPropertyObjectTrumpResolveConstraintConflict:(void *)a1
{
  int v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "conflictingObjects"), "lastObject");
  uint64_t v3 = (void *)[a1 databaseObject];
  char v48 = [v2 isInserted];
  uint64_t v44 = (void *)[v2 managedObjectContext];
  uint64_t v4 = [v2 entity];
  uint64_t v5 = (void *)v4;
  uint64_t v45 = v4;
  if (v4)
  {
    uint64_t v6 = [*(id *)(v4 + 104) keys];
    uint64_t v5 = (void *)v5[14];
  }

  else
  {
    uint64_t v6 = [0 keys];
  }

  uint64_t v7 = [MEMORY[0x189603FE8] null];
  if (v2 && (uint64_t v8 = v2[6]) != 0) {
    v9 = *(void **)(v8 + 8);
  }
  else {
    v9 = 0LL;
  }
  unint64_t v10 = v5[6];
  uint64_t v11 = v5[7];
  if (v10 < v11 + v10)
  {
    __int128 v12 = (void *)(v6 + 8 * v10);
    do
    {
      uint64_t v13 = [v9 valueForKey:*v12];
      uint64_t v14 = [v2 valueForKey:*v12];
      if (v7 == v14) {
        uint64_t v15 = 0LL;
      }
      else {
        uint64_t v15 = v14;
      }
      if ((v48 & 1) != 0
        || (v7 != v13 ? (uint64_t v16 = (void *)v13) : (uint64_t v16 = 0), ([v16 isEqual:v15] & 1) == 0))
      {
        [v3 setValue:v15 forKey:*v12];
      }

      ++v12;
      --v11;
    }

    while (v11);
  }

  unint64_t v17 = v5[12];
  uint64_t v18 = v5[13];
  if (v17 < v18 + v17)
  {
    uint64_t v19 = 8 * v17;
    __int128 v46 = v2;
    __int128 v47 = v9;
    uint64_t v42 = v3;
    while (1)
    {
      uint64_t v20 = [v9 valueForKey:*(void *)(v6 + v19)];
      if (v7 == v20) {
        uint64_t v21 = 0LL;
      }
      else {
        uint64_t v21 = (void *)v20;
      }
      uint64_t v22 = (void *)[v2 valueForKey:*(void *)(v6 + v19)];
      uint64_t v23 = v22;
      else {
        uint64_t v24 = [v22 objectID];
      }
      if (v48 & 1) == 0 && ([v21 isEqual:v24]) {
        goto LABEL_52;
      }
      v25 = v3;
      v26 = (void *)[v3 valueForKey:*(void *)(v6 + v19)];
      id v27 = *(void **)(*(void *)(v45 + 96) + 24LL + v19);
      uint64_t v28 = (void *)[v27 inverseRelationship];
      uint64_t v29 = [v28 name];
      int v30 = [v28 isToMany];
      if (!v26)
      {
        if (v28)
        {
          if (v30)
          {
            int v37 = [v28 isOrdered];
            uint64_t v38 = [v28 name];
            if (v37) {
              unint64_t v39 = (void *)[v23 mutableOrderedSetValueForKey:v38];
            }
            else {
              unint64_t v39 = (void *)[v23 mutableSetValueForKey:v38];
            }
            v40 = v39;
            [v39 addObject:v25];
            [v40 removeObject:v46];
          }

          else
          {
            [v23 setValue:v25 forKey:v29];
          }
        }

        goto LABEL_51;
      }

      if (v28) {
        break;
      }
LABEL_47:
      if ([v27 deleteRule] == 2) {
        [v44 deleteObject:v26];
      }
LABEL_51:
      [v46 setValue:0 forKey:*(void *)(v6 + v19)];
      uint64_t v3 = v25;
      int v2 = v46;
      [v3 setValue:v23 forKey:*(void *)(v6 + v19)];
LABEL_52:
      v19 += 8LL;
      --v18;
      v9 = v47;
      if (!v18) {
        goto LABEL_53;
      }
    }

    if (!v30)
    {
      [v23 setValue:v25 forKey:v29];
      [v26 setValue:0 forKey:v29];
      goto LABEL_47;
    }

    int v31 = [v28 isOrdered];
    uint64_t v32 = [v28 name];
    if (v31)
    {
      uint64_t v43 = [v26 mutableOrderedSetValueForKey:v32];
      v33 = (void *)objc_msgSend(v23, "mutableOrderedSetValueForKey:", objc_msgSend(v28, "name"));
      if (([v33 containsObject:v25] & 1) == 0)
      {
        unint64_t v34 = [v33 indexOfObject:v46];
        if (v34 < [v33 count]) {
          [v33 replaceObjectAtIndex:v34 withObject:v25];
        }
        uint64_t v35 = (void *)v43;
        uint64_t v36 = v25;
        goto LABEL_46;
      }
    }

    else
    {
      objc_msgSend((id)objc_msgSend(v26, "mutableSetValueForKey:", v32), "removeObject:", v25);
      v33 = (void *)objc_msgSend(v23, "mutableSetValueForKey:", objc_msgSend(v28, "name"));
      [v33 addObject:v42];
    }

    uint64_t v35 = v33;
    uint64_t v36 = v46;
LABEL_46:
    [v35 removeObject:v36];
    goto LABEL_47;
  }

void __33__NSMergePolicy_resolveConflict___block_invoke(uint64_t a1)
{
  int v2 = -[_NSQueryGenerationToken _generationalComponentForStore:]( [*(id *)(a1 + 32) _queryGenerationToken],  *(id *)(a1 + 40));
  -[NSXPCStore _clearCachedRowForObjectWithID:generation:](*(void *)(a1 + 40), *(const void **)(a1 + 48), v2);
}

- (void)_mergeChangesStoreUpdatesTrumpForObject:(id)a3 withRecord:(id)a4
{
  uint64_t v38 = (void **)[a3 managedObjectContext];
  uint64_t v42 = a3;
  v40 = (void *)[a4 ancestorSnapshot];
  uint64_t v7 = [a4 objectForKey:@"snapshot"];
  uint64_t v8 = [a4 objectForKey:@"cachedRow"];
  v9 = (void *)v8;
  if (v7)
  {
    unint64_t v10 = (void *)v8;
    v9 = (void *)v7;
  }

  else
  {
    unint64_t v10 = (void *)[a4 objectForKey:@"databaseRow"];
  }

  if (v7) {
    BOOL v11 = dword_18C4ABA3C == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  unsigned int v39 = v12;
  uint64_t v13 = [v42 entity];
  uint64_t v14 = v13;
  uint64_t v36 = self;
  if (v13)
  {
    uint64_t v15 = [*(id *)(v13 + 104) keys];
    uint64_t v16 = *(void *)(v14 + 112);
  }

  else
  {
    uint64_t v15 = [0 keys];
    uint64_t v16 = 0LL;
  }

  uint64_t v17 = [MEMORY[0x189603FE8] null];
  unint64_t v41 = (void *)objc_msgSend((id)-[NSManagedObjectContext _committedSnapshotForObject:]((uint64_t)v38, v42), "copy");
  unint64_t v18 = *(void *)(v16 + 48);
  uint64_t v19 = *(void *)(v16 + 56);
  uint64_t v37 = v16;
  if (v18 < v19 + v18)
  {
    do
    {
      uint64_t v20 = [v9 objectForKey:*(void *)(v15 + 8 * v18)];
      if (v20 == v17) {
        uint64_t v21 = 0LL;
      }
      else {
        uint64_t v21 = (void *)v20;
      }
      uint64_t v22 = [v10 objectForKey:*(void *)(v15 + 8 * v18)];
      if (v22 == v17) {
        uint64_t v23 = 0LL;
      }
      else {
        uint64_t v23 = (void *)v22;
      }
      if (v21 != v23
        && ([*(id *)(*(void *)(v14 + 96) + 24 + 8 * v18) _epsilonEquals:v23 rhs:v21 withFlags:1] & 1) == 0)
      {
        if (!v40
          || (uint64_t v24 = (void *)[v40 objectForKey:*(void *)(v15 + 8 * v18)], v25 = v24, v24 == v21)
          || ([v24 isEqual:v21] & 1) != 0)
        {
          uint64_t v21 = v23;
        }

        else if (v25 != v23 && ![v25 isEqual:v23])
        {
          uint64_t v21 = v23;
        }

        [v42 setValue:v21 forKey:*(void *)(v15 + 8 * v18)];
        [v41 setValue:v21 atIndex:v18];
      }

      ++v18;
      --v19;
    }

    while (v19);
  }

  unint64_t v26 = *(void *)(v37 + 96);
  uint64_t v27 = *(void *)(v37 + 104);
  uint64_t v28 = v39;
  if (v26 < v27 + v26)
  {
    while (1)
    {
      uint64_t v29 = [v9 objectForKey:*(void *)(v15 + 8 * v26)];
      if (v29 == v17) {
        int v30 = 0LL;
      }
      else {
        int v30 = (void *)v29;
      }
      if ((_DWORD)v28) {
        int v30 = (void *)[v30 objectID];
      }
      uint64_t v31 = [v10 objectForKey:*(void *)(v15 + 8 * v26)];
      if (v31 == v17) {
        uint64_t v32 = 0LL;
      }
      else {
        uint64_t v32 = (void *)v31;
      }
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        uint64_t v32 = (void *)[v32 objectID];
      }
      if (v30 == v32 || ([v32 isEqual:v30] & 1) != 0) {
        goto LABEL_59;
      }
      if (!v40) {
        goto LABEL_54;
      }
      v33 = (void *)[v40 objectForKey:*(void *)(v15 + 8 * v26)];
      if (v33 == v30) {
        goto LABEL_54;
      }
      unint64_t v34 = v33;
      if ([v33 isEqual:v30]) {
        goto LABEL_54;
      }
      if (v34 != v32) {
        break;
      }
      uint64_t v32 = v30;
      if (!v30)
      {
LABEL_57:
        id v35 = 0LL;
        goto LABEL_58;
      }

void __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke(uint64_t a1)
{
  v92[128] = *MEMORY[0x1895F89C0];
  uint64_t v2 = [*(id *)(a1 + 32) entity];
  uint64_t v3 = (unint64_t *)v2;
  if (v2)
  {
    uint64_t v75 = [*(id *)(v2 + 104) keys];
    unint64_t v4 = v3[14];
  }

  else
  {
    uint64_t v75 = [0 keys];
    unint64_t v4 = 0LL;
  }

  v69 = v3;
  uint64_t v65 = _kvcPropertysPrimitiveGetters(v3);
  uint64_t v5 = [MEMORY[0x189603FE8] null];
  int v72 = (void *)[*(id *)(a1 + 32) objectID];
  unint64_t v6 = *(void *)(v4 + 96);
  uint64_t v7 = *(void *)(v4 + 104);
  unint64_t v67 = v4;
  if (v6 < v7 + v6)
  {
    uint64_t v8 = 8 * v6;
    while (1)
    {
      uint64_t v9 = *(void *)(v75 + v8);
      uint64_t v10 = [*(id *)(a1 + 40) objectForKey:v9];
      if (v10 == v5) {
        id v11 = 0LL;
      }
      else {
        id v11 = (id)v10;
      }
      if (*(_BYTE *)(a1 + 72)) {
        id v11 = (id)[v11 objectID];
      }
      uint64_t v12 = [*(id *)(a1 + 48) objectForKey:v9];
      if (v12 == v5) {
        id v13 = 0LL;
      }
      else {
        id v13 = (id)v12;
      }
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        id v13 = (id)[v13 objectID];
      }
      if (v11 == v13) {
        goto LABEL_57;
      }
      if ([*(id *)(v69[12] + 24 + v8) _epsilonEquals:v13 rhs:v11 withFlags:1]) {
        goto LABEL_57;
      }
      uint64_t v14 = *(void **)(v69[12] + 24 + v8);
      uint64_t v15 = [v14 deleteRule];
      uint64_t v16 = (void *)[v14 inverseRelationship];
      if (!v16) {
        goto LABEL_57;
      }
      if (v13) {
        id v13 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:]( *(void ***)(a1 + 56),  v13,  0LL);
      }
      uint64_t v73 = [v16 name];
      v70 = (void *)objc_msgSend(v13, "primitiveValueForKey:");
      if (![v16 isToMany])
      {
        if (v11
          && (id v11 = (id)[*(id *)(a1 + 64) newValuesForObjectWithID:v11 withContext:*(void *)(a1 + 56) error:0]) != 0 && (v17 = objc_opt_class(), v17 != objc_opt_class()))
        {
          id v18 = (id)[v11 valueForPropertyDescription:v16];
          v92[0] = 0LL;
          if (!v18)
          {
            id v18 = (id)[*(id *)(a1 + 64) newValueForRelationship:v16 forObjectWithID:v72 withContext:*(void *)(a1 + 56) error:v92];
            if (!v18)
            {
              NSLog((NSString *)@"That was unexpected. Error trying to get %@ from %@ (%@)", v14, v72, v92[0]);
              id v18 = 0LL;
            }
          }

          if ((id)[MEMORY[0x189603FE8] null] == v18) {
            id v19 = 0LL;
          }
          else {
            id v19 = v18;
          }
        }

        else
        {
          id v19 = (id)[v11 valueForKey:v73];
        }

        if ((([v72 isEqual:v19] & 1) != 0 || v70 == *(void **)(a1 + 32)) && v13)
        {
          [*(id *)(a1 + 56) refreshObject:v13 mergeChanges:1];
          if (v15 == 2) {
            [*(id *)(a1 + 56) deleteObject:v13];
          }
          else {
            [v13 setValue:0 forKey:v73];
          }
        }

        goto LABEL_56;
      }

      if (v11) {
        id v11 = (id)[*(id *)(a1 + 64) newValueForRelationship:v16 forObjectWithID:v11 withContext:*(void *)(a1 + 56) error:0];
      }
      if (([v11 containsObject:v72] & 1) == 0) {
        break;
      }
      if (v13) {
        goto LABEL_47;
      }
LABEL_55:

LABEL_56:
LABEL_57:
      v8 += 8LL;
      if (!--v7) {
        goto LABEL_58;
      }
    }

    char v20 = [v70 containsObject:*(void *)(a1 + 32)];
    if (v13) {
      char v21 = v20;
    }
    else {
      char v21 = 0;
    }
    if ((v21 & 1) == 0) {
      goto LABEL_55;
    }
LABEL_47:
    [*(id *)(a1 + 56) refreshObject:v13 mergeChanges:1];
    if (v15 == 2)
    {
      [*(id *)(a1 + 56) deleteObject:v13];
    }

    else
    {
      else {
        uint64_t v22 = (void *)[v13 mutableSetValueForKey:v73];
      }
      [v22 removeObject:*(void *)(a1 + 32)];
    }

    goto LABEL_55;
  }

- (void)_mergeChangesObjectUpdatesTrumpForObject:(id)a3 withRecord:(id)a4
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x186E3E5D8](self, a2);
  uint64_t v7 = [a3 managedObjectContext];
  uint64_t v8 = (void *)-[NSManagedObjectContext _committedSnapshotForObject:](v7, a3);
  if ([a3 isDeleted])
  {
    if (self)
    {
      uint64_t v9 = [a4 objectForKey:@"snapshot"];
      uint64_t v10 = [a4 objectForKey:@"cachedRow"];
      uint64_t v11 = v10;
      if (v9)
      {
        uint64_t v12 = v10;
        uint64_t v11 = v9;
      }

      else
      {
        uint64_t v12 = [a4 objectForKey:@"databaseRow"];
      }

      if (v9) {
        BOOL v13 = dword_18C4ABA3C == 0;
      }
      else {
        BOOL v13 = 1;
      }
      char v14 = !v13;
      uint64_t v15 = [a3 managedObjectContext];
      uint64_t v16 = (void *)v15;
      if (v15) {
        uint64_t v17 = *(void **)(v15 + 32);
      }
      else {
        uint64_t v17 = 0LL;
      }
      v66[0] = MEMORY[0x1895F87A8];
      v66[1] = 3221225472LL;
      v66[2] = __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke;
      v66[3] = &unk_189EA8880;
      v66[4] = a3;
      v66[5] = v11;
      char v67 = v14;
      v66[6] = v12;
      v66[7] = v15;
      v66[8] = v17;
      -[NSManagedObjectContext lockObjectStore](v15);
      else {
        __68__NSMergePolicy__mergeDeletionWithStoreChangesForObject_withRecord___block_invoke((uint64_t)v66);
      }
      -[NSManagedObjectContext unlockObjectStore]((uint64_t)v16);
    }
  }

  else if ([a3 isInserted])
  {
    -[NSManagedObjectContext _forceMoveInsertToUpdatedList:](v7, a3);
  }

  uint64_t v18 = [a4 objectForKey:@"snapshot"];
  uint64_t v19 = [a4 objectForKey:@"cachedRow"];
  char v20 = (void *)v19;
  if (v18)
  {
    uint64_t v56 = (void *)v19;
    char v20 = (void *)v18;
  }

  else
  {
    uint64_t v56 = (void *)[a4 objectForKey:@"databaseRow"];
  }

  if (v18) {
    BOOL v21 = dword_18C4ABA3C == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = !v21;
  int v55 = v22;
  uint64_t v23 = -[NSManagedObject _newChangedValuesForRefresh__]((uint64_t)a3);
  id v54 = (id)[v8 copy];
  uint64_t v24 = [a3 entity];
  id v52 = (void **)v7;
  uint64_t v53 = v24;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = [*(id *)(v24 + 104) keys];
    uint64_t v27 = *(void *)(v25 + 112);
  }

  else
  {
    uint64_t v26 = [0 keys];
    uint64_t v27 = 0LL;
  }

  uint64_t v28 = [MEMORY[0x189603FE8] null];
  unint64_t v29 = *(void *)(v27 + 48);
  uint64_t v30 = *(void *)(v27 + 56);
  uint64_t v51 = v27;
  uint64_t v57 = v20;
  if (v29 < v30 + v29)
  {
    do
    {
      uint64_t v31 = (void *)MEMORY[0x186E3E5D8]();
      uint64_t v32 = [v20 objectForKey:*(void *)(v26 + 8 * v29)];
      if (v32 == v28) {
        id v33 = 0LL;
      }
      else {
        id v33 = (id)v32;
      }
      uint64_t v34 = [v56 objectForKey:*(void *)(v26 + 8 * v29)];
      if (v34 == v28) {
        id v35 = 0LL;
      }
      else {
        id v35 = (id)v34;
      }
      if (v33 != v35)
      {
        uint64_t v36 = *(void **)(*(void *)(v53 + 96) + 24LL + 8 * v29);
        if (([v36 _epsilonEquals:v35 rhs:v33 withFlags:1] & 1) == 0)
        {
          if ([v36 usesMergeableStorage])
          {
            [v35 merge:v33];
            id v35 = (id)[v35 copy];
          }

          [a3 setValue:v35 forKey:*(void *)(v26 + 8 * v29)];
          [v54 setValue:v35 atIndex:v29];
        }
      }

      objc_autoreleasePoolPop(v31);
      ++v29;
      --v30;
      char v20 = v57;
    }

    while (v30);
  }

  unint64_t v37 = *(void *)(v51 + 96);
  uint64_t v38 = *(void *)(v51 + 104);
  if (v37 < v38 + v37)
  {
    do
    {
      uint64_t v39 = [v20 objectForKey:*(void *)(v26 + 8 * v37)];
      if (v39 == v28) {
        uint64_t v40 = 0LL;
      }
      else {
        uint64_t v40 = (void *)v39;
      }
      if (v55) {
        uint64_t v40 = (void *)[v40 objectID];
      }
      uint64_t v41 = [v56 objectForKey:*(void *)(v26 + 8 * v37)];
      if (v41 == v28) {
        uint64_t v42 = 0LL;
      }
      else {
        uint64_t v42 = (void *)v41;
      }
      if (!(_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88) {
        uint64_t v42 = (void *)[v42 objectID];
      }
      if (v40 != v42 && ([v42 isEqual:v40] & 1) == 0)
      {
        if (v42) {
          id v43 = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v52, v42, 0LL);
        }
        else {
          id v43 = 0LL;
        }
        [a3 setValue:v43 forKey:*(void *)(v26 + 8 * v37)];
        [v54 setValue:v43 atIndex:v37];
      }

      ++v37;
      --v38;
      char v20 = v57;
    }

    while (v38);
  }

  -[NSManagedObject _setOriginalSnapshot__:](a3, v54);
  if (-[NSKnownKeysDictionary count](v23, "count"))
  {
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    uint64_t v44 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v62,  v69,  16LL);
    if (v44)
    {
      uint64_t v45 = *(void *)v63;
      do
      {
        for (uint64_t i = 0LL; i != v44; ++i)
        {
          if (*(void *)v63 != v45) {
            objc_enumerationMutation(v23);
          }
          [a3 willChangeValueForKey:*(void *)(*((void *)&v62 + 1) + 8 * i)];
        }

        uint64_t v44 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v62,  v69,  16LL);
      }

      while (v44);
    }

    -[NSManagedObject _updateFromRefreshSnapshot:includingTransients:](a3, v23, 0);
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    uint64_t v47 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v58,  v68,  16LL);
    if (v47)
    {
      uint64_t v48 = *(void *)v59;
      do
      {
        for (uint64_t j = 0LL; j != v47; ++j)
        {
          if (*(void *)v59 != v48) {
            objc_enumerationMutation(v23);
          }
          [a3 didChangeValueForKey:*(void *)(*((void *)&v58 + 1) + 8 * j)];
        }

        uint64_t v47 = -[NSKnownKeysDictionary countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v58,  v68,  16LL);
      }

      while (v47);
    }
  }

  objc_autoreleasePoolPop(context);
}

- (BOOL)resolveConflicts:(NSArray *)list error:(NSError *)error
{
  uint64_t v7 = -[NSArray filteredArrayUsingPredicate:]( list,  "filteredArrayUsingPredicate:",  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_9]);
  uint64_t v8 = -[NSArray filteredArrayUsingPredicate:]( list,  "filteredArrayUsingPredicate:",  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_201]);
  if ((!-[NSArray count](v7, "count")
     || (BOOL v9 = -[NSMergePolicy resolveOptimisticLockingVersionConflicts:error:]( self,  "resolveOptimisticLockingVersionConflicts:error:",  v7,  error)))
    && (!-[NSArray count](v8, "count")
     || (BOOL v9 = -[NSMergePolicy resolveConstraintConflicts:error:](self, "resolveConstraintConflicts:error:", v8, error))))
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

uint64_t __40__NSMergePolicy_resolveConflicts_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __40__NSMergePolicy_resolveConflicts_error___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)resolveConstraintConflicts:(NSArray *)list error:(NSError *)error
{
  v207[16] = *MEMORY[0x1895F89C0];
  id v182 = 0LL;
  if (!-[NSArray count](list, "count")) {
    return 1;
  }
  v154 = self;
  if (!self->_type) {
    goto LABEL_251;
  }
  v149 = error;
  id v150 = objc_alloc_init(MEMORY[0x1896077E8]);
  if (objc_msgSend(-[NSArray firstObject](list, "firstObject"), "_isDBConflict"))
  {
    unint64_t v6 = (void *)[MEMORY[0x189603FA8] array];
    __int128 v180 = 0u;
    __int128 v181 = 0u;
    __int128 v178 = 0u;
    __int128 v179 = 0u;
    uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( list,  "countByEnumeratingWithState:objects:count:",  &v178,  v199,  16LL);
    if (v7)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = *(void *)v179;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v179 != v9) {
            objc_enumerationMutation(list);
          }
          uint64_t v11 = *(void **)(*((void *)&v178 + 1) + 8 * i);
          __int128 v174 = 0u;
          __int128 v175 = 0u;
          __int128 v176 = 0u;
          __int128 v177 = 0u;
          uint64_t v12 = (void *)[v11 conflictingObjects];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v174 objects:v198 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v175;
            do
            {
              for (uint64_t j = 0LL; j != v13; ++j)
              {
                if (*(void *)v175 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = *(void **)(*((void *)&v174 + 1) + 8 * j);
                objc_msgSend(v6, "addObject:", objc_msgSend(v16, "objectID"));
                if (!v8) {
                  uint64_t v8 = [v16 managedObjectContext];
                }
              }

              uint64_t v13 = [v12 countByEnumeratingWithState:&v174 objects:v198 count:16];
            }

            while (v13);
          }
        }

        uint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( list,  "countByEnumeratingWithState:objects:count:",  &v178,  v199,  16LL);
      }

      while (v7);
      if (v8)
      {
        uint64_t v17 = +[_PFRoutines createDictionaryPartitioningObjectsIDByRootEntity:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v6);
        v207[0] = 0LL;
        v207[1] = v207;
        v207[2] = 0x3052000000LL;
        v207[3] = __Block_byref_object_copy__14;
        v207[4] = __Block_byref_object_dispose__14;
        v207[5] = [MEMORY[0x189603FA8] array];
        v173[0] = MEMORY[0x1895F87A8];
        v173[1] = 3221225472LL;
        v173[2] = __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke;
        v173[3] = &unk_189EA7D08;
        v173[4] = v8;
        v173[5] = v207;
        -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v17, "enumerateKeysAndObjectsUsingBlock:", v173);

        _Block_object_dispose(v207, 8);
      }
    }
  }

  __int128 v171 = 0u;
  __int128 v172 = 0u;
  __int128 v169 = 0u;
  __int128 v170 = 0u;
  uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:]( list,  "countByEnumeratingWithState:objects:count:",  &v169,  v197,  16LL);
  if (!v18) {
    goto LABEL_245;
  }
  uint64_t v151 = *MEMORY[0x189607460];
  uint64_t v152 = *(void *)v170;
LABEL_24:
  uint64_t v162 = 0LL;
  uint64_t v153 = v18;
  while (1)
  {
    if (*(void *)v170 != v152) {
      objc_enumerationMutation(list);
    }
    if (!v154) {
      break;
    }
    uint64_t v19 = *(void **)(*((void *)&v169 + 1) + 8 * v162);
    if ([v19 _isDBConflict])
    {
      char v20 = (void *)[v19 databaseObject];
      BOOL v21 = (void *)objc_msgSend((id)objc_msgSend(v19, "conflictingObjects"), "lastObject");
      if ([v21 isDeleted] & 1) != 0 || (objc_msgSend(v20, "isDeleted")) {
        goto LABEL_76;
      }
      id v167 = (id)[v19 constraint];
      int v22 = (void *)[v19 databaseSnapshot];
      if (v20 && (uint64_t v23 = v20[6]) != 0) {
        v165 = *(void **)(v23 + 8);
      }
      else {
        v165 = 0LL;
      }
      __int128 v193 = 0u;
      __int128 v194 = 0u;
      __int128 v191 = 0u;
      __int128 v192 = 0u;
      uint64_t v50 = [v167 countByEnumeratingWithState:&v191 objects:v207 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v192;
        do
        {
          for (uint64_t k = 0LL; k != v50; ++k)
          {
            if (*(void *)v192 != v51) {
              objc_enumerationMutation(v167);
            }
            uint64_t v53 = *(void *)(*((void *)&v191 + 1) + 8 * k);
            id v54 = (void *)[v21 valueForKey:v53];
            int v55 = (void *)[v22 valueForKey:v53];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if ((objc_msgSend((id)objc_msgSend(v54, "objectID"), "isEqual:", v55) & 1) == 0) {
                  goto LABEL_76;
                }
              }

              else
              {
                uint64_t v56 = [NSString stringWithUTF8String:"Got non-object value back for property '%@' which returned an objectID from the snapshot."];
                _NSCoreDataLog(17LL, v56, v57, v58, v59, v60, v61, v62, v53);
                __int128 v63 = (os_log_s *)__pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v202 = v53;
                  _os_log_fault_impl( &dword_186681000,  v63,  OS_LOG_TYPE_FAULT,  "CoreData: Got non-object value back for property '%@' which returned an objectID from the snapshot.",  buf,  0xCu);
                }
              }
            }

            else if (([v54 isEqual:v55] & 1) == 0 {
                   && (![v54 isNSString]
            }
                    || !+[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)&OBJC_CLASS____PFRoutines, v54, v55)))
            {
              goto LABEL_76;
            }

            if ([v20 hasChanges])
            {
              __int128 v64 = (void *)[v20 valueForKey:v53];
              if ((objc_msgSend(v64, "isEqual:", objc_msgSend(v165, "valueForKey:", v53)) & 1) == 0
                && ([v64 isEqual:v54] & 1) == 0
                && (![v64 isNSString]
                 || !+[_PFRoutines isSanitizedVersionOf:equalTo:]((uint64_t)&OBJC_CLASS____PFRoutines, v54, v64)))
              {
                goto LABEL_76;
              }
            }
          }

          uint64_t v50 = [v167 countByEnumeratingWithState:&v191 objects:v207 count:16];
        }

        while (v50);
      }

      v156 = v19;
    }

    else
    {
      uint64_t v24 = (void *)[MEMORY[0x189603FA8] array];
      uint64_t v25 = (void *)[v19 constraintValues];
      __int128 v193 = 0u;
      __int128 v194 = 0u;
      __int128 v191 = 0u;
      __int128 v192 = 0u;
      uint64_t v26 = (void *)[v19 conflictingObjects];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v191 objects:v207 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v192;
        do
        {
          for (uint64_t m = 0LL; m != v27; ++m)
          {
            if (*(void *)v192 != v28) {
              objc_enumerationMutation(v26);
            }
            uint64_t v30 = *(void **)(*((void *)&v191 + 1) + 8 * m);
            if (([v30 isDeleted] & 1) == 0
              && -[NSMergePolicy _valuesOnObject:matchAgainstValues:]((uint64_t)v30, v25))
            {
              [v24 addObject:v30];
            }
          }

          uint64_t v27 = [v26 countByEnumeratingWithState:&v191 objects:v207 count:16];
        }

        while (v27);
      }

      id v31 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v189 = 0u;
      __int128 v190 = 0u;
      __int128 v187 = 0u;
      __int128 v188 = 0u;
      uint64_t v32 = [v24 countByEnumeratingWithState:&v187 objects:&v203 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v188;
        do
        {
          for (uint64_t n = 0LL; n != v32; ++n)
          {
            if (*(void *)v188 != v33) {
              objc_enumerationMutation(v24);
            }
            uint64_t v35 = *(void *)(*((void *)&v187 + 1) + 8 * n);
            if (!v35 || (uint64_t v36 = *(void *)(v35 + 48)) == 0 || (v37 = *(void *)(v36 + 8)) == 0) {
              uint64_t v37 = [MEMORY[0x189603FE8] null];
            }
            [v31 addObject:v37];
          }

          uint64_t v32 = [v24 countByEnumeratingWithState:&v187 objects:&v203 count:16];
        }

        while (v32);
      }

      v156 = -[NSConstraintConflict initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:]( [NSConstraintConflict alloc],  "initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:",  [v19 constraint],  0,  0,  v24,  v31);
    }

    if (!v156) {
      goto LABEL_76;
    }
    uint64_t v38 = (void *)[MEMORY[0x189603FE0] set];
    __int128 v185 = 0u;
    __int128 v186 = 0u;
    __int128 v183 = 0u;
    __int128 v184 = 0u;
    uint64_t v39 = -[NSConstraintConflict conflictingObjects](v156, "conflictingObjects");
    uint64_t v40 = -[NSArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v183,  v200,  16LL);
    if (!v40) {
      goto LABEL_73;
    }
    uint64_t v41 = 0LL;
    uint64_t v42 = *(void *)v184;
    do
    {
      for (iuint64_t i = 0LL; ii != v40; ++ii)
      {
        if (*(void *)v184 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void **)(*((void *)&v183 + 1) + 8 * ii);
        if (!v41) {
          uint64_t v41 = [*(id *)(*((void *)&v183 + 1) + 8 * ii) managedObjectContext];
        }
        objc_msgSend(v38, "addObject:", objc_msgSend(v44, "entity"));
      }

      uint64_t v40 = -[NSArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v183,  v200,  16LL);
    }

    while (v40);
    if (!v41)
    {
LABEL_73:
      uint64_t v48 = &unk_189F039C8;
      goto LABEL_74;
    }

    uint64_t v45 = -[NSConstraintConflict databaseObject](v156, "databaseObject");
    p_isa = &v45->super.isa;
    if (v45) {
      objc_msgSend(v38, "addObject:", -[NSManagedObject entity](v45, "entity"));
    }
    unint64_t v47 = [v38 count];
    uint64_t v48 = &unk_189F039F0;
    if (v47 > 1) {
      goto LABEL_74;
    }
    if ((-[NSEntityDescription _isPathologicalForConstraintMerging:]([v38 anyObject], &v182) & 1) == 0)
    {
      if (-[NSConstraintConflict _isDBConflict](v156, "_isDBConflict"))
      {
        switch(v154->_type)
        {
          case 1uLL:
            -[NSMergePolicy _byPropertyStoreTrumpResolveConstraintConflict:](v156);
            goto LABEL_145;
          case 2uLL:
            -[NSMergePolicy _byPropertyObjectTrumpResolveConstraintConflict:](v156);
            goto LABEL_145;
          case 3uLL:
            -[NSMergePolicy _overwriteResolveConstraintConflict:](v156);
            goto LABEL_145;
          case 4uLL:
            -[NSMergePolicy _rollbackResolveConstraintConflict:](v156);
LABEL_145:
            char v88 = 1;
            break;
          default:
            char v88 = 0;
            break;
        }

        goto LABEL_239;
      }

      __int128 v65 = -[NSConstraintConflict conflictingObjects](v156, "conflictingObjects");
      unint64_t v66 = -[NSConstraintConflict conflictingSnapshots](v156, "conflictingSnapshots");
      char v67 = -[NSConstraintConflict constraintValues](v156, "constraintValues");
      uint64_t v68 = -[NSArray count](-[NSConstraintConflict conflictingSnapshots](v156, "conflictingSnapshots"), "count");
      if (!v68) {
        goto LABEL_115;
      }
      p_isa = 0LL;
      uint64_t v69 = 0LL;
      while (2)
      {
        uint64_t v70 = -[NSArray objectAtIndex:](v66, "objectAtIndex:", v69);
        if ([MEMORY[0x189603FE8] null] == v70
          && (objc_msgSend(-[NSArray objectAtIndex:](v65, "objectAtIndex:", v69), "hasChanges") & 1) == 0)
        {
          p_isa = -[NSArray objectAtIndex:](v65, "objectAtIndex:", v69);
LABEL_110:
          if (v68 == ++v69) {
            goto LABEL_114;
          }
          continue;
        }

        break;
      }

      p_isa = -[NSArray objectAtIndex:](v65, "objectAtIndex:", v69);
LABEL_114:
      if (p_isa) {
        goto LABEL_165;
      }
LABEL_115:
      id v71 = objc_alloc_init(MEMORY[0x189603FA8]);
      id v72 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v189 = 0u;
      __int128 v190 = 0u;
      __int128 v187 = 0u;
      __int128 v188 = 0u;
      uint64_t v73 = -[NSArray countByEnumeratingWithState:objects:count:]( v65,  "countByEnumeratingWithState:objects:count:",  &v187,  &v203,  16LL);
      if (v73)
      {
        uint64_t v74 = *(void *)v188;
        do
        {
          for (juint64_t j = 0LL; jj != v73; ++jj)
          {
            if (*(void *)v188 != v74) {
              objc_enumerationMutation(v65);
            }
            __int128 v76 = *(void **)(*((void *)&v187 + 1) + 8 * jj);
            else {
              uint64_t v77 = v71;
            }
            [v77 addObject:v76];
          }

          uint64_t v73 = -[NSArray countByEnumeratingWithState:objects:count:]( v65,  "countByEnumeratingWithState:objects:count:",  &v187,  &v203,  16LL);
        }

        while (v73);
      }

      uint64_t v78 = [v71 count];
      if (!v78)
      {
        uint64_t v79 = [v72 firstObject];
LABEL_163:
        p_isa = (void *)v79;
        goto LABEL_164;
      }

      if (v78 == 1)
      {
        uint64_t v79 = [v71 lastObject];
        goto LABEL_163;
      }

      __int128 v80 = (void *)objc_msgSend((id)objc_msgSend(v71, "firstObject"), "objectID");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        __int128 v193 = 0u;
        __int128 v194 = 0u;
        __int128 v191 = 0u;
        __int128 v192 = 0u;
        uint64_t v81 = [v71 countByEnumeratingWithState:&v191 objects:v207 count:16];
        if (v81)
        {
          p_isa = 0LL;
          uint64_t v82 = *(void *)v192;
          uint64_t v83 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (kuint64_t k = 0LL; kk != v81; ++kk)
            {
              if (*(void *)v192 != v82) {
                objc_enumerationMutation(v71);
              }
              __int128 v85 = *(void **)(*((void *)&v191 + 1) + 8 * kk);
              uint64_t v86 = objc_msgSend((id)objc_msgSend(v85, "objectID"), "_referenceData64");
              BOOL v87 = v83 <= v86;
              if (v83 >= v86) {
                uint64_t v83 = v86;
              }
              if (!v87) {
                p_isa = v85;
              }
            }

            uint64_t v81 = [v71 countByEnumeratingWithState:&v191 objects:v207 count:16];
          }

          while (v81);
          goto LABEL_164;
        }

uint64_t __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (objc_msgSend( *(id *)(a1 + 32),  "concurrencyType",  MEMORY[0x1895F87A8],  3221225472,  __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2,  &unk_189EA8908,  a2,  a3,  *(void *)(a1 + 32),  *(void *)(a1 + 40)))
  {
    return [*(id *)(a1 + 32) performBlockAndWait:&v5];
  }

  else
  {
    return __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2((uint64_t)&v5);
  }

uint64_t __50__NSMergePolicy_resolveConstraintConflicts_error___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = *(void **)(a1 + 32);
  unint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v4, "setEntity:", v3);
  -[NSFetchRequest setIncludesSubentities:](v4, "setIncludesSubentities:", 1LL);
  -[NSFetchRequest setIncludesPendingChanges:](v4, "setIncludesPendingChanges:", 0LL);
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v4,  "setRelationshipKeyPathsForPrefetching:",  -[NSEntityDescription _keypathsForDeletions](v3));
  -[NSFetchRequest setPredicate:]( v4,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self IN %@", *(void *)(a1 + 40)]);
  uint64_t v7 = 0LL;
  uint64_t v5 = [*(id *)(a1 + 48) executeFetchRequest:v4 error:&v7];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
  }

  return [v2 drain];
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(NSArray *)list error:(NSError *)error
{
  unint64_t v4 = list;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  if (!-[NSArray count](list, "count")) {
    return 1;
  }
  if (!self->_type)
  {
    BOOL v22 = 0;
    goto LABEL_50;
  }

  id v33 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v35 = (void *)[MEMORY[0x189603FA8] array];
  obuint64_t j = v4;
  if (objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "objectForKey:", @"snapshot")) {
    goto LABEL_4;
  }
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v42,  v54,  16LL);
  if (!v24) {
    goto LABEL_4;
  }
  uint64_t v25 = 0LL;
  uint64_t v26 = *(void *)v43;
  do
  {
    for (uint64_t i = 0LL; i != v24; ++i)
    {
      if (*(void *)v43 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      int v29 = objc_msgSend((id)objc_msgSend(v28, "objectForKey:", @"newVersion"), "unsignedIntValue");
      uint64_t v30 = (void *)[v28 objectForKey:@"object"];
      id v31 = v30;
      if (v25)
      {
        if (!v30) {
          continue;
        }
      }

      else
      {
        uint64_t v25 = [v30 managedObjectContext];
        if (!v31) {
          continue;
        }
      }
    }

    uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v54,  16LL);
  }

  while (v24);
  unint64_t v4 = obj;
  if (v25)
  {
    uint64_t v32 = +[_PFRoutines createDictionaryPartitioningObjectsIDByRootEntity:]( (uint64_t)&OBJC_CLASS____PFRoutines,  (uint64_t)v35);
    uint64_t v46 = 0LL;
    uint64_t v47 = (uint64_t)&v46;
    uint64_t v48 = 0x3052000000LL;
    char v49 = __Block_byref_object_copy__14;
    uint64_t v50 = __Block_byref_object_dispose__14;
    uint64_t v51 = [MEMORY[0x189603FA8] array];
    v41[0] = MEMORY[0x1895F87A8];
    v41[1] = 3221225472LL;
    v41[2] = __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke;
    v41[3] = &unk_189EA7D08;
    v41[4] = v25;
    v41[5] = &v46;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v32, "enumerateKeysAndObjectsUsingBlock:", v41);

    _Block_object_dispose(&v46, 8);
    unint64_t v4 = obj;
  }

uint64_t __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (objc_msgSend( *(id *)(a1 + 32),  "concurrencyType",  MEMORY[0x1895F87A8],  3221225472,  __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2,  &unk_189EA8908,  a2,  a3,  *(void *)(a1 + 32),  *(void *)(a1 + 40)))
  {
    return [*(id *)(a1 + 32) performBlockAndWait:&v5];
  }

  else
  {
    return __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2((uint64_t)&v5);
  }

uint64_t __64__NSMergePolicy_resolveOptimisticLockingVersionConflicts_error___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1896077E8]);
  uint64_t v3 = *(void **)(a1 + 32);
  unint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  -[NSFetchRequest setEntity:](v4, "setEntity:", v3);
  -[NSFetchRequest setIncludesSubentities:](v4, "setIncludesSubentities:", 1LL);
  -[NSFetchRequest setIncludesPendingChanges:](v4, "setIncludesPendingChanges:", 0LL);
  -[NSFetchRequest setRelationshipKeyPathsForPrefetching:]( v4,  "setRelationshipKeyPathsForPrefetching:",  -[NSEntityDescription _keypathsForDeletions](v3));
  -[NSFetchRequest setPredicate:]( v4,  "setPredicate:",  [MEMORY[0x1896079C8] predicateWithFormat:@"self IN %@", *(void *)(a1 + 40)]);
  uint64_t v7 = 0LL;
  uint64_t v5 = [*(id *)(a1 + 48) executeFetchRequest:v4 error:&v7];
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
  }

  return [v2 drain];
}

+ (NSMergePolicy)errorMergePolicy
{
  return (NSMergePolicy *)NSErrorMergePolicy;
}

+ (NSMergePolicy)mergeByPropertyStoreTrumpMergePolicy
{
  return (NSMergePolicy *)NSMergeByPropertyStoreTrumpMergePolicy;
}

+ (NSMergePolicy)mergeByPropertyObjectTrumpMergePolicy
{
  return (NSMergePolicy *)NSMergeByPropertyObjectTrumpMergePolicy;
}

+ (NSMergePolicy)overwriteMergePolicy
{
  return (NSMergePolicy *)NSOverwriteMergePolicy;
}

+ (NSMergePolicy)rollbackMergePolicy
{
  return (NSMergePolicy *)NSRollbackMergePolicy;
}

@end