@interface NSConstraintCache
+ (uint64_t)createCachesForEntity:(uint64_t)a3 forValidator:;
- (id)description;
- (uint64_t)extendConstraint:(void *)a3 onParentEntity:(uint64_t)a4 parentCache:;
- (uint64_t)registerObject:(uint64_t)result;
- (uint64_t)reset;
- (void)dealloc;
- (void)initForEntity:(void *)a3 constraint:(void *)a4 extension:;
- (void)validateForSave:(void *)result;
@end

@implementation NSConstraintCache

- (uint64_t)extendConstraint:(void *)a3 onParentEntity:(uint64_t)a4 parentCache:
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v30 = result;
  if (result)
  {
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id obj = (id)[a3 subentities];
    result = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    uint64_t v27 = result;
    if (result)
    {
      uint64_t v26 = *(void *)v43;
      uint64_t v36 = a4;
      do
      {
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v43 != v26)
          {
            uint64_t v6 = v5;
            objc_enumerationMutation(obj);
            uint64_t v5 = v6;
          }

          uint64_t v28 = v5;
          v32 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
          v7 = -[NSEntityDescription _extensionsOfParentConstraint:](v32, a2);
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          __int128 v41 = 0u;
          id v31 = v7;
          uint64_t v34 = [v7 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v34)
          {
            uint64_t v33 = *(void *)v39;
            do
            {
              uint64_t v8 = 0LL;
              do
              {
                if (*(void *)v39 != v33) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v37 = v8;
                v35 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
                uint64_t v9 = [v35 objectAtIndexedSubscript:0];
                if (a4)
                {
                  v10 = (void *)v9;
                  __int128 v48 = 0u;
                  __int128 v49 = 0u;
                  __int128 v46 = 0u;
                  __int128 v47 = 0u;
                  v11 = *(void **)(a4 + 40);
                  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
                  if (v12)
                  {
                    uint64_t v13 = v12;
                    uint64_t v14 = *(void *)v47;
                    do
                    {
                      uint64_t v15 = 0LL;
                      do
                      {
                        if (*(void *)v47 != v14) {
                          objc_enumerationMutation(v11);
                        }
                        uint64_t v16 = *(void *)(*((void *)&v46 + 1) + 8 * v15);
                        if (v16) {
                          v17 = *(void **)(v16 + 8);
                        }
                        else {
                          v17 = 0LL;
                        }
                        unint64_t v18 = [v10 count];
                        unint64_t v19 = [v17 count];
                        if (v18 > v19)
                        {
                          uint64_t v20 = 0LL;
                          unint64_t v21 = v19;
                          if (v19)
                          {
                            uint64_t v22 = 0LL;
                            do
                            {
                              v20 += objc_msgSend( (id)objc_msgSend(v10, "objectAtIndex:", v22),  "isEqual:",  objc_msgSend(v17, "objectAtIndex:", v22));
                              ++v22;
                            }

                            while (v21 != v22);
                          }

                          if (v20 == v21)
                          {
                            a4 = v36;
                            goto LABEL_33;
                          }
                        }

                        ++v15;
                      }

                      while (v15 != v13);
                      uint64_t v23 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
                      uint64_t v13 = v23;
                      a4 = v36;
                    }

                    while (v23);
                  }
                }

                v24 = -[NSConstraintCache initForEntity:constraint:extension:]( [NSConstraintCache alloc],  (uint64_t)v32,  (void *)[v35 objectAtIndexedSubscript:0],  (void *)objc_msgSend(v35, "objectAtIndexedSubscript:", 2));
                if (a4) {
                  [*(id *)(a4 + 40) addObject:v24];
                }

                -[NSConstraintCache extendConstraint:onParentEntity:parentCache:]( v30,  [v35 objectAtIndexedSubscript:0],  v32,  v24);
LABEL_33:
                uint64_t v8 = v37 + 1;
              }

              while (v37 + 1 != v34);
              uint64_t v34 = [v31 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }

            while (v34);
          }

          -[NSConstraintCache extendConstraint:onParentEntity:parentCache:](v30, a2, v32, a4);
          uint64_t v5 = v28 + 1;
        }

        while (v28 + 1 != v27);
        result = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
        uint64_t v27 = result;
      }

      while (result);
    }
  }

  return result;
}

- (void)initForEntity:(void *)a3 constraint:(void *)a4 extension:
{
  if (!a1) {
    return 0LL;
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_CLASS___NSConstraintCache;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t v8 = v7;
  if (v7)
  {
    v7[3] = a2;
    v7[1] = a3;
    v8[2] = a4;
    v8[5] = objc_alloc_init(MEMORY[0x189603FA8]);
    v8[4] = objc_alloc_init(MEMORY[0x189603FC8]);
  }

  return v8;
}

+ (uint64_t)createCachesForEntity:(uint64_t)a3 forValidator:
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  if (a2)
  {
    uint64_t v5 = a2[16];
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t result = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if ((-[NSEntityDescription _constraintIsExtension:](objc_msgSend(a2, "superentity", (void)v13), v11) & 1) == 0)
        {
          uint64_t v12 = -[NSConstraintCache initForEntity:constraint:extension:]( objc_alloc(&OBJC_CLASS___NSConstraintCache),  (uint64_t)a2,  v11,  0LL);
          -[NSConstraintCache extendConstraint:onParentEntity:parentCache:]((uint64_t)v12, v11, a2, (uint64_t)v12);
          -[NSConstraintValidator _addConstraintRoot:forEntity:](a3, (uint64_t)v12, a2);
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t result = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = result;
    }

    while (result);
  }

  return result;
}

- (void)dealloc
{
  self->_entity = 0LL;

  self->_constraint = 0LL;
  self->_extension = 0LL;

  self->_children = 0LL;
  self->_knownValues = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConstraintCache;
  -[NSConstraintCache dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSConstraintCache : entity = %@, constraint = %@, extension = %@>", -[NSEntityDescription name](self->_entity, "name"), self->_constraint, self->_extension];
}

- (uint64_t)registerObject:(uint64_t)result
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "entity"), "isKindOfEntity:", *(void *)(result + 24));
  if (!(_DWORD)result) {
    return result;
  }
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v32 = v3;
  uint64_t v5 = *(void **)(v3 + 8);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v38;
  do
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      v11 = (void *)[v10 componentsSeparatedByString:@"."];
      if ((unint64_t)[v11 count] < 2)
      {
        __int128 v13 = (void *)[a2 valueForKey:v10];
        if (!v13) {
          goto LABEL_19;
        }
      }

      else
      {
        if (![v11 count]) {
          goto LABEL_19;
        }
        unint64_t v12 = 0LL;
        __int128 v13 = 0LL;
        do
        {
          uint64_t v14 = [v11 objectAtIndex:v12];
          if (v12) {
            uint64_t v15 = [v13 objectForKey:v14];
          }
          else {
            uint64_t v15 = [a2 valueForKey:v14];
          }
          __int128 v13 = (void *)v15;
          ++v12;
        }

        while ([v11 count] > v12);
        if (!v13)
        {
LABEL_19:
          uint64_t v16 = [MEMORY[0x189603FE8] null];
          goto LABEL_22;
        }
      }

      if ([v13 isNSString])
      {
        uint64_t v16 = +[_PFRoutines sanitize:]((uint64_t)&OBJC_CLASS____PFRoutines, v13);
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_23;
        }
        uint64_t v16 = [v13 objectID];
      }

- (void)validateForSave:(void *)result
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (result)
  {
    id v2 = a2;
    uint64_t v3 = result;
    if (a2) {
      id v4 = a2;
    }
    else {
      id v2 = objc_alloc_init(MEMORY[0x189603FE0]);
    }
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v6 = (void *)v3[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend( v5,  "addObjectsFromArray:",  objc_msgSend( (id)-[NSConstraintCache validateForSave:](*(void *)(*((void *)&v13 + 1) + 8 * i), v2),  "allObjects"));
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }

    v11 = (void *)v3[4];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __37__NSConstraintCache_validateForSave___block_invoke;
    v12[3] = &unk_189EAA670;
    v12[4] = v3;
    v12[5] = v2;
    v12[6] = v5;
    [v11 enumerateKeysAndObjectsUsingBlock:v12];

    return v5;
  }

  return result;
}

void __37__NSConstraintCache_validateForSave___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if ([MEMORY[0x189603FE8] null] != a2
    && (unint64_t)[a3 count] >= 2
    && *(void *)(a1 + 32))
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "objectID"), "persistentStore");
          if (!v10)
          {

            goto LABEL_15;
          }

          [v5 addObject:v10];
        }

        uint64_t v7 = [a3 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = [v5 count];

    if (v11 != [a3 count])
    {
LABEL_15:
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      uint64_t v12 = [a3 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        while (2)
        {
          for (uint64_t j = 0LL; j != v13; ++j)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(a3);
            }
            if (![*(id *)(a1 + 40) containsObject:*(void *)(*((void *)&v29 + 1) + 8 * j)])
            {
              [*(id *)(a1 + 40) addObjectsFromArray:a3];
              id v16 = objc_alloc_init(MEMORY[0x189603FA8]);
              __int128 v25 = 0u;
              __int128 v26 = 0u;
              __int128 v27 = 0u;
              __int128 v28 = 0u;
              uint64_t v17 = [a3 countByEnumeratingWithState:&v25 objects:v37 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v26;
                do
                {
                  for (uint64_t k = 0LL; k != v18; ++k)
                  {
                    if (*(void *)v26 != v19) {
                      objc_enumerationMutation(a3);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * k);
                    if (!v21 || (uint64_t v22 = *(void *)(v21 + 48)) == 0 || (v23 = *(void *)(v22 + 8)) == 0) {
                      uint64_t v23 = [MEMORY[0x189603FE8] null];
                    }
                    [v16 addObject:v23];
                  }

                  uint64_t v18 = [a3 countByEnumeratingWithState:&v25 objects:v37 count:16];
                }

                while (v18);
              }

              uint64_t v24 = -[NSConstraintConflict initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:]( objc_alloc(&OBJC_CLASS___NSConstraintConflict),  "initWithConstraint:databaseObject:databaseSnapshot:conflictingObjects:conflictingSnapshots:",  *(void *)(*(void *)(a1 + 32) + 8LL),  0LL,  0LL,  a3,  v16);

              [*(id *)(a1 + 48) addObject:v24];
              return;
            }
          }

          uint64_t v13 = [a3 countByEnumeratingWithState:&v29 objects:v38 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
  }

- (uint64_t)reset
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) removeAllObjects];
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    id v2 = *(void **)(v1 + 40);
    uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0LL;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          -[NSConstraintCache reset](*(void *)(*((void *)&v6 + 1) + 8 * v5++));
        }

        while (v3 != v5);
        uint64_t result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
      }

      while (result);
    }
  }

  return result;
}

@end