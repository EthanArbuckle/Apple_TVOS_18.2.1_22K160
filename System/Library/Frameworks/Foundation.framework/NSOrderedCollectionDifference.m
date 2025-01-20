@interface NSOrderedCollectionDifference
- (BOOL)hasChanges;
- (BOOL)isEqual:(id)a3;
- (NSArray)insertions;
- (NSArray)removals;
- (NSOrderedCollectionDifference)differenceByTransformingChangesWithBlock:(void *)block;
- (NSOrderedCollectionDifference)init;
- (NSOrderedCollectionDifference)initWithChanges:(NSArray *)changes;
- (NSOrderedCollectionDifference)initWithInsertIndexes:(NSIndexSet *)inserts insertedObjects:(NSArray *)insertedObjects removeIndexes:(NSIndexSet *)removes removedObjects:(NSArray *)removedObjects;
- (NSOrderedCollectionDifference)initWithInsertIndexes:(NSIndexSet *)inserts insertedObjects:(NSArray *)insertedObjects removeIndexes:(NSIndexSet *)removes removedObjects:(NSArray *)removedObjects additionalChanges:(NSArray *)changes;
- (NSOrderedCollectionDifference)inverseDifference;
- (id)_changeWithType:(int64_t)a3 index:(unint64_t)a4 object:(id)a5;
- (id)debugDescription;
- (id)description;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_enumerateChangesInDiffOrderWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation NSOrderedCollectionDifference

- (NSOrderedCollectionDifference)initWithInsertIndexes:(NSIndexSet *)inserts insertedObjects:(NSArray *)insertedObjects removeIndexes:(NSIndexSet *)removes removedObjects:(NSArray *)removedObjects
{
  return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:]( self,  "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:",  inserts,  insertedObjects,  removes,  removedObjects,  MEMORY[0x189604A58]);
}

- (NSOrderedCollectionDifference)initWithInsertIndexes:(NSIndexSet *)inserts insertedObjects:(NSArray *)insertedObjects removeIndexes:(NSIndexSet *)removes removedObjects:(NSArray *)removedObjects additionalChanges:(NSArray *)changes
{
  uint64_t v81 = *MEMORY[0x1895F89C0];
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___NSOrderedCollectionDifference;
  v11 = -[NSOrderedCollectionDifference init](&v65, sel_init);
  if (!v11) {
    return v11;
  }
  if (insertedObjects)
  {
    NSUInteger v12 = -[NSArray count](insertedObjects, "count");
    if (v12 != -[NSIndexSet count](inserts, "count"))
    {

      v54 = (void *)MEMORY[0x189603F70];
      uint64_t v55 = *MEMORY[0x189603A60];
      v56 = @"Count of inserted objects does not match count of inserted indexes";
      goto LABEL_83;
    }
  }

  if (removedObjects)
  {
    NSUInteger v13 = -[NSArray count](removedObjects, "count");
    if (v13 != -[NSIndexSet count](removes, "count"))
    {

      v54 = (void *)MEMORY[0x189603F70];
      uint64_t v55 = *MEMORY[0x189603A60];
      v56 = @"Count of removed objects does not match count of removed indexes";
      goto LABEL_83;
    }
  }

  if (-[NSArray count](changes, "count"))
  {
    v57 = v11;
    v60 = (void *)objc_opt_new();
    v61 = (void *)objc_opt_new();
    v14 = (NSIndexSet *)-[NSIndexSet mutableCopy](inserts, "mutableCopy");
    v62 = (NSArray *)-[NSArray mutableCopy](insertedObjects, "mutableCopy");
    v15 = (NSIndexSet *)-[NSIndexSet mutableCopy](removes, "mutableCopy");
    v16 = (NSArray *)-[NSArray mutableCopy](removedObjects, "mutableCopy");
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    v17 = changes;
    uint64_t v64 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v72,  v71,  16LL);
    if (!v64) {
      goto LABEL_45;
    }
    uint64_t v18 = *(void *)v73;
    v59 = v14;
    while (1)
    {
      for (uint64_t i = 0LL; i != v64; ++i)
      {
        if (*(void *)v73 != v18) {
          objc_enumerationMutation(v17);
        }
        v20 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "index", v57);
        uint64_t v22 = [v20 object];
        if ([v20 changeType] == 1)
        {
          if (-[NSIndexSet containsIndex:](v15, "containsIndex:", v21))
          {

            v51 = (void *)MEMORY[0x189603F70];
            uint64_t v52 = *MEMORY[0x189603A60];
            v69 = @"index";
            v70 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v21);
            uint64_t v53 = [MEMORY[0x189603F68] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
            v56 = @"Insert index duplicated between index set and additional changes parameters";
LABEL_79:
            v54 = v51;
            uint64_t v55 = v52;
            goto LABEL_84;
          }

          -[NSIndexSet addIndex:](v15, "addIndex:", v21);
          if (v22) {
            BOOL v23 = v16 == 0LL;
          }
          else {
            BOOL v23 = 1;
          }
          if (v23)
          {
            if (v22) {
              BOOL v24 = v16 == 0LL;
            }
            else {
              BOOL v24 = 0;
            }
            if (v24)
            {

              v54 = (void *)MEMORY[0x189603F70];
              uint64_t v55 = *MEMORY[0x189603A60];
              v56 = @"No removed objects array provided, but additional change included object";
              goto LABEL_83;
            }

            if (!v22 && v16)
            {

              v54 = (void *)MEMORY[0x189603F70];
              uint64_t v55 = *MEMORY[0x189603A60];
              v56 = @"Removed objects array provided, but additional change omitted object";
              goto LABEL_83;
            }
          }

          else
          {
            -[NSArray insertObject:atIndex:]( v16,  "insertObject:atIndex:",  v22,  -[NSIndexSet countOfIndexesInRange:](v15, "countOfIndexesInRange:", 0LL, v21));
          }

          uint64_t v27 = [v20 associatedIndex];
          v28 = v61;
          if (v27 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_42;
          }
        }

        else
        {
          if (-[NSIndexSet containsIndex:](v14, "containsIndex:", v21))
          {

            v51 = (void *)MEMORY[0x189603F70];
            uint64_t v52 = *MEMORY[0x189603A60];
            v67 = @"index";
            v68 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v21);
            uint64_t v53 = [MEMORY[0x189603F68] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
            v56 = @"Remove index duplicated between index set and additional changes parameters";
            goto LABEL_79;
          }

          -[NSIndexSet addIndex:](v14, "addIndex:", v21);
          if (v22) {
            BOOL v25 = v62 == 0LL;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25)
          {
            if (v22) {
              BOOL v26 = v62 == 0LL;
            }
            else {
              BOOL v26 = 0;
            }
            if (v26)
            {

              v54 = (void *)MEMORY[0x189603F70];
              uint64_t v55 = *MEMORY[0x189603A60];
              v56 = @"No inserted objects array provided, but additional changes included objects";
              goto LABEL_83;
            }

            if (!v22 && v62)
            {

              v54 = (void *)MEMORY[0x189603F70];
              uint64_t v55 = *MEMORY[0x189603A60];
              v56 = @"Inserted objects array provided, but additional change omitted object";
              goto LABEL_83;
            }
          }

          else
          {
            -[NSArray insertObject:atIndex:]( v62,  "insertObject:atIndex:",  v22,  -[NSIndexSet countOfIndexesInRange:](v14, "countOfIndexesInRange:", 0LL, v21));
          }

          uint64_t v29 = [v20 associatedIndex];
          uint64_t v27 = v21;
          uint64_t v21 = v29;
          v14 = v59;
          v28 = v60;
          v17 = changes;
          if (v29 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_42:
            objc_msgSend( v28,  "setObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27),  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21));
            continue;
          }
        }
      }

      uint64_t v64 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v72,  v71,  16LL);
      if (!v64)
      {
LABEL_45:
        v30 = v60;
        if (objc_msgSend(v60, "isEqual:", v61, v57))
        {
          v11 = v58;
          if ([v60 count])
          {
            v31 = objc_alloc(&OBJC_CLASS____NSOrderedCollectionDifferenceMoves);
            if (v31
              && (v66.receiver = v31,
                  v66.super_class = (Class)&OBJC_CLASS____NSOrderedCollectionDifferenceMoves,
                  (v32 = -[NSOrderedCollectionDifference init](&v66, sel_init)) != 0LL))
            {
              v33 = v32;
              v32->_insertIndexes = (NSIndexSet *)objc_opt_new();
              v33->_insertObjects = (NSArray *)objc_opt_new();
              v33->_removeIndexes = (NSIndexSet *)0x7FFFFFFFFFFFFFFFLL;
              __int128 v77 = 0u;
              __int128 v78 = 0u;
              __int128 v79 = 0u;
              __int128 v80 = 0u;
              uint64_t v34 = -[NSArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v77,  v76,  16LL);
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v78;
                do
                {
                  for (uint64_t j = 0LL; j != v35; ++j)
                  {
                    if (*(void *)v78 != v36) {
                      objc_enumerationMutation(changes);
                    }
                    v38 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                    uint64_t v39 = [v38 associatedIndex];
                    if (v39 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v40 = v39;
                      unint64_t v41 = [v38 index];
                      uint64_t v42 = [v38 changeType];
                      p_insertObjects = (id *)&v33->_insertObjects;
                      if (v42 == 1)
                      {
                        p_insertObjects = (id *)&v33->_insertIndexes;
                        if ((NSIndexSet *)v41 < v33->_removeIndexes)
                        {
                          p_insertObjects = (id *)&v33->_insertIndexes;
                          v33->_removeIndexes = (NSIndexSet *)v41;
                        }
                      }

                      objc_msgSend( *p_insertObjects,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v40),  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  v41));
                    }
                  }

                  uint64_t v35 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v77,  v76,  16LL);
                }

                while (v35);
              }

              uint64_t v44 = -[NSArray count](v33->_insertObjects, "count");
              if (v44 == -[NSIndexSet count](v33->_insertIndexes, "count"))
              {
                v11 = v58;
                v45 = (_NSOrderedCollectionDifferenceMoves *)v33;
                v30 = v60;
              }

              else
              {
                v45 = (_NSOrderedCollectionDifferenceMoves *)v33;
                -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  sel_initWithChanges_,  v33,  @"NSOrderedCollectionDifference.m",  38LL,  @"Unbalanced number of remove and insert changes with associations.");
                v11 = v58;
                v30 = v60;
              }
            }

            else
            {
              v45 = 0LL;
            }

            v11->_moves = v45;
          }

          v11->_removeIndexes = v15;
          if (-[NSIndexSet count](v15, "count"))
          {
            v11->_removeObjects = v16;
          }

          else
          {
            v11->_removeObjects = 0LL;
          }

          v11->_insertIndexes = v14;
          if (-[NSIndexSet count](v14, "count"))
          {
            v11->_insertObjects = v62;
          }

          else
          {
            v11->_insertObjects = 0LL;
          }

          return v11;
        }

        v54 = (void *)MEMORY[0x189603F70];
        uint64_t v55 = *MEMORY[0x189603A60];
        v56 = @"Inconsistent associations for moves";
LABEL_83:
        uint64_t v53 = 0LL;
LABEL_84:
        objc_exception_throw((id)[v54 exceptionWithName:v55 reason:v56 userInfo:v53]);
      }
    }
  }

  v46 = (NSIndexSet *)-[NSIndexSet copy](inserts, "copy");
  v11->_insertIndexes = v46;
  uint64_t v47 = -[NSIndexSet count](v46, "count");
  if (v47) {
    uint64_t v47 = -[NSArray copy](insertedObjects, "copy");
  }
  v11->_insertObjects = (NSArray *)v47;
  v48 = (NSIndexSet *)-[NSIndexSet copy](removes, "copy");
  v11->_removeIndexes = v48;
  uint64_t v49 = -[NSIndexSet count](v48, "count");
  if (v49) {
    uint64_t v49 = -[NSArray copy](removedObjects, "copy");
  }
  v11->_removeObjects = (NSArray *)v49;
  return v11;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v7 = a3;
  unint64_t var0 = a3->var0;
  if (a3->var0)
  {
    unint64_t v11 = a3->var3[0];
    NSUInteger v12 = a3->var3[1];
  }

  else if (-[NSIndexSet count](self->_removeIndexes, "count"))
  {
    NSUInteger v12 = -[NSIndexSet lastIndex](self->_removeIndexes, "lastIndex");
    unint64_t v11 = 1LL;
  }

  else
  {
    if (!-[NSIndexSet count](self->_insertIndexes, "count")) {
      return 0LL;
    }
    NSUInteger v12 = -[NSIndexSet firstIndex](self->_insertIndexes, "firstIndex");
    unint64_t v11 = 0LL;
  }

  NSUInteger v13 = -[NSIndexSet count](self->_removeIndexes, "count");
  NSUInteger v14 = -[NSIndexSet count](self->_insertIndexes, "count");
  unint64_t v15 = 0LL;
  if (a5)
  {
    SEL v21 = a2;
    unint64_t v16 = v14 + v13;
    if (var0 < v14 + v13)
    {
      unint64_t v15 = 0LL;
      uint64_t v22 = v7;
      unint64_t v23 = var0 - v13;
      unint64_t v17 = ~var0 + v13;
      while (1)
      {
        if (v11 == 1)
        {
          id v18 = -[NSOrderedCollectionDifference _changeWithType:index:object:]( self,  "_changeWithType:index:object:",  1LL,  v12,  -[NSArray objectAtIndex:](self->_removeObjects, "objectAtIndex:", v17));
          NSUInteger v19 = -[NSIndexSet indexLessThanIndex:](self->_removeIndexes, "indexLessThanIndex:", v12);
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger v12 = -[NSIndexSet firstIndex](self->_insertIndexes, "firstIndex");
            unint64_t v11 = 0LL;
            if (v18) {
              goto LABEL_15;
            }
          }

          else
          {
            NSUInteger v12 = v19;
            unint64_t v11 = 1LL;
            if (v18) {
              goto LABEL_15;
            }
          }
        }

        else
        {
          id v18 = -[NSOrderedCollectionDifference _changeWithType:index:object:]( self,  "_changeWithType:index:object:",  0LL,  v12,  -[NSArray objectAtIndex:](self->_insertObjects, "objectAtIndex:", v23 + v15));
          NSUInteger v12 = -[NSIndexSet indexGreaterThanIndex:](self->_insertIndexes, "indexGreaterThanIndex:", v12);
          if (v18) {
            goto LABEL_15;
          }
        }

        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  v21,  self,  @"NSOrderedCollectionDifference.m",  502LL,  @"Failed to materialize change for diff offset %lu",  var0 + v15);
LABEL_15:
        a4[v15++] = v18;
        if (v15 + var0 < v16)
        {
          --v17;
          if (v15 < a5) {
            continue;
          }
        }

        var0 += v15;
        v7 = v22;
        break;
      }
    }
  }

  v7->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  v7->var3[0] = v11;
  v7->var3[1] = v12;
  v7->unint64_t var0 = var0;
  v7->var1 = a4;
  return v15;
}

- (id)_changeWithType:(int64_t)a3 index:(unint64_t)a4 object:(id)a5
{
  moves = self->_moves;
  if (!moves) {
    goto LABEL_6;
  }
  uint64_t v9 = 2LL;
  if (a3 == 1) {
    uint64_t v9 = 1LL;
  }
  v10 = (void *)-[objc_class objectForKeyedSubscript:]( (&moves->super.isa)[v9],  "objectForKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  if (v10) {
    uint64_t v11 = [v10 unsignedIntegerValue];
  }
  else {
LABEL_6:
  }
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  return  -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]( objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange),  "initWithObject:type:index:associatedIndex:",  a5,  a3,  a4,  v11);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSOrderedCollectionDifference;
  -[NSOrderedCollectionDifference dealloc](&v3, sel_dealloc);
}

- (NSOrderedCollectionDifference)init
{
  return -[NSOrderedCollectionDifference initWithChanges:](self, "initWithChanges:", MEMORY[0x189604A58]);
}

- (NSOrderedCollectionDifference)initWithChanges:(NSArray *)changes
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
  if (!v5)
  {
    NSUInteger v14 = +[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet");
    unint64_t v15 = +[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet");
    uint64_t v17 = 0LL;
    uint64_t v16 = 0LL;
    return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:]( self,  "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:",  v14,  v17,  v15,  v16,  changes);
  }

  uint64_t v6 = v5;
  unsigned __int8 v7 = 0;
  unsigned __int8 v8 = 0;
  uint64_t v9 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(changes);
      }
      uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v12 = [v11 changeType];
      uint64_t v13 = [v11 object];
      if (v12 == 1)
      {
        if ((v8 & (v13 != 0)) != 0) {
          goto LABEL_18;
        }
        v7 |= v13 != 0;
      }

      else
      {
        if ((v7 & (v13 != 0)) != 0)
        {
LABEL_18:
          NSUInteger v14 = +[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet");
          unint64_t v15 = +[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet");
          uint64_t v17 = MEMORY[0x189604A58];
LABEL_19:
          uint64_t v16 = MEMORY[0x189604A58];
          return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:]( self,  "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:",  v14,  v17,  v15,  v16,  changes);
        }

        v8 |= v13 != 0;
      }
    }

    uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( changes,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
    if (v6) {
      continue;
    }
    break;
  }

  NSUInteger v14 = +[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet");
  unint64_t v15 = +[NSIndexSet indexSet](&OBJC_CLASS___NSIndexSet, "indexSet");
  uint64_t v16 = 0LL;
  if ((v8 & 1) != 0) {
    uint64_t v17 = MEMORY[0x189604A58];
  }
  else {
    uint64_t v17 = 0LL;
  }
  if ((v7 & 1) != 0) {
    goto LABEL_19;
  }
  return -[NSOrderedCollectionDifference initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:]( self,  "initWithInsertIndexes:insertedObjects:removeIndexes:removedObjects:additionalChanges:",  v14,  v17,  v15,  v16,  changes);
}

- (NSArray)insertions
{
  v9[4] = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)MEMORY[0x186E1FF60](self, a2);
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  v9[3] = 0LL;
  uint64_t v4 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  -[NSIndexSet count](self->_insertIndexes, "count"));
  insertIndexes = self->_insertIndexes;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__NSOrderedCollectionDifference_insertions__block_invoke;
  v8[3] = &unk_189CA1C08;
  v8[4] = v4;
  v8[5] = self;
  v8[6] = v9;
  -[NSIndexSet enumerateIndexesUsingBlock:](insertIndexes, "enumerateIndexesUsingBlock:", v8);
  uint64_t v6 = (void *)[v4 copy];
  _Block_object_dispose(v9, 8);
  objc_autoreleasePoolPop(v3);
  return (NSArray *)v6;
}

uint64_t __43__NSOrderedCollectionDifference_insertions__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "addObject:",  objc_msgSend( *(id *)(a1 + 40),  "_changeWithType:index:object:",  0,  a2,  objc_msgSend( *(id *)(*(void *)(a1 + 40) + 16),  "objectAtIndex:",  (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))++)));
}

- (NSArray)removals
{
  v9[4] = *MEMORY[0x1895F89C0];
  objc_super v3 = (void *)MEMORY[0x186E1FF60](self, a2);
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2020000000LL;
  v9[3] = 0LL;
  uint64_t v4 = (void *)objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  -[NSIndexSet count](self->_removeIndexes, "count"));
  removeIndexes = self->_removeIndexes;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __41__NSOrderedCollectionDifference_removals__block_invoke;
  v8[3] = &unk_189CA1C08;
  v8[4] = v4;
  v8[5] = self;
  v8[6] = v9;
  -[NSIndexSet enumerateIndexesUsingBlock:](removeIndexes, "enumerateIndexesUsingBlock:", v8);
  uint64_t v6 = (void *)[v4 copy];
  _Block_object_dispose(v9, 8);
  objc_autoreleasePoolPop(v3);
  return (NSArray *)v6;
}

uint64_t __41__NSOrderedCollectionDifference_removals__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "addObject:",  objc_msgSend( *(id *)(a1 + 40),  "_changeWithType:index:object:",  1,  a2,  objc_msgSend( *(id *)(*(void *)(a1 + 40) + 32),  "objectAtIndex:",  (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))++)));
}

- (BOOL)hasChanges
{
  NSUInteger v3 = -[NSIndexSet count](self->_removeIndexes, "count");
  return v3 + -[NSIndexSet count](self->_insertIndexes, "count") != 0;
}

- (NSOrderedCollectionDifference)differenceByTransformingChangesWithBlock:(void *)block
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v5 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  -[NSIndexSet count](self->_insertIndexes, "count") + -[NSIndexSet count](self->_removeIndexes, "count"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  unint64_t v6 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(self);
        }
        objc_msgSend( v5,  "addObject:",  (*((uint64_t (**)(void *, void))block + 2))(block, *(void *)(*((void *)&v13 + 1) + 8 * v9++)));
      }

      while (v7 != v9);
      unint64_t v7 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
    }

    while (v7);
  }

  v10 =  -[NSOrderedCollectionDifference initWithChanges:]( objc_alloc(&OBJC_CLASS___NSOrderedCollectionDifference),  "initWithChanges:",  v5);

  return v10;
}

- (void)_enumerateChangesInDiffOrderWithBlock:(id)a3
{
  NSUInteger v5 = -[NSIndexSet count](self->_removeIndexes, "count");
  NSUInteger v6 = -[NSIndexSet count](self->_insertIndexes, "count");
  NSUInteger v7 = -[NSIndexSet firstIndex](self->_removeIndexes, "firstIndex");
  NSUInteger v8 = -[NSIndexSet firstIndex](self->_insertIndexes, "firstIndex");
  if (v5 | v6)
  {
    NSUInteger v9 = v8;
    NSUInteger v10 = 0LL;
    NSUInteger v11 = 0LL;
    do
    {
      if (v7 - v10 <= v9 - v11)
      {
        (*((void (**)(id, id))a3 + 2))( a3,  -[NSOrderedCollectionDifference _changeWithType:index:object:]( self,  "_changeWithType:index:object:",  1LL,  v7,  -[NSArray objectAtIndex:](self->_removeObjects, "objectAtIndex:", v10++)));
        NSUInteger v7 = -[NSIndexSet indexGreaterThanIndex:](self->_removeIndexes, "indexGreaterThanIndex:", v7);
      }

      else
      {
        (*((void (**)(id, id))a3 + 2))( a3,  -[NSOrderedCollectionDifference _changeWithType:index:object:]( self,  "_changeWithType:index:object:",  0LL,  v9,  -[NSArray objectAtIndex:](self->_insertObjects, "objectAtIndex:", v11++)));
        NSUInteger v9 = -[NSIndexSet indexGreaterThanIndex:](self->_insertIndexes, "indexGreaterThanIndex:", v9);
      }
    }

    while (v10 < v5 || v11 < v6);
  }

- (NSOrderedCollectionDifference)inverseDifference
{
  NSUInteger v3 = (void *)MEMORY[0x186E1FF60](self, a2);
  uint64_t v4 =  -[NSOrderedCollectionDifference differenceByTransformingChangesWithBlock:]( self,  "differenceByTransformingChangesWithBlock:",  &__block_literal_global_62);
  objc_autoreleasePoolPop(v3);
  return v4;
}

NSOrderedCollectionChange *__50__NSOrderedCollectionDifference_inverseDifference__block_invoke( uint64_t a1,  void *a2)
{
  return  -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]( [NSOrderedCollectionChange alloc],  "initWithObject:type:index:associatedIndex:",  [a2 object],  objc_msgSend(a2, "changeType") != 1,  objc_msgSend(a2, "index"),  objc_msgSend(a2, "associatedIndex"));
}

- (unint64_t)hash
{
  unint64_t v3 = -[NSIndexSet hash](self->_insertIndexes, "hash");
  unint64_t v4 = -[NSIndexSet hash](self->_removeIndexes, "hash") + v3;
  uint64_t v5 = v4 ^ (-[NSArray hash](self->_removeObjects, "hash") << 8);
  uint64_t v6 = v5 ^ (-[NSArray hash](self->_insertObjects, "hash") << 16);
  return v6 ^ (-[_NSOrderedCollectionDifferenceMoves hash](self->_moves, "hash") << 24);
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v5 = -[NSIndexSet isEqual:](self->_removeIndexes, "isEqual:", *((void *)a3 + 3));
    if (v5)
    {
      removeObjects = self->_removeObjects;
      if (removeObjects == *((NSArray **)a3 + 4) || (int v5 = -[NSArray isEqual:](removeObjects, "isEqual:")) != 0)
      {
        int v5 = -[NSIndexSet isEqual:](self->_insertIndexes, "isEqual:", *((void *)a3 + 1));
        if (v5)
        {
          insertObjects = self->_insertObjects;
          if (insertObjects == *((NSArray **)a3 + 2) || (int v5 = -[NSArray isEqual:](insertObjects, "isEqual:")) != 0)
          {
            moves = self->_moves;
            LOBYTE(v5) = moves == *((_NSOrderedCollectionDifferenceMoves **)a3 + 5)
                      || -[_NSOrderedCollectionDifferenceMoves isEqual:](moves, "isEqual:");
          }
        }
      }
    }
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)description
{
  NSUInteger v3 = -[NSIndexSet count](self->_removeIndexes, "count");
  NSUInteger v4 = -[NSIndexSet count](self->_insertIndexes, "count");
  int v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  NSUInteger v7 = @"s";
  if (v4 == 1) {
    NSUInteger v8 = &stru_189CA6A28;
  }
  else {
    NSUInteger v8 = @"s";
  }
  if (v3 == 1) {
    NSUInteger v7 = &stru_189CA6A28;
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p>(%lu insertion%@, %lu removal%@)",  v6,  self,  v4,  v8,  v3,  v7);
}

- (id)debugDescription
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  BOOL v3 = -[NSOrderedCollectionDifference hasChanges](self, "hasChanges");
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  unint64_t v4 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v44,  v43,  16LL);
  if (v4)
  {
    uint64_t v5 = *(void *)v45;
LABEL_3:
    uint64_t v6 = 0LL;
    while (1)
    {
      if (*(void *)v45 != v5) {
        objc_enumerationMutation(self);
      }
      [*(id *)(*((void *)&v44 + 1) + 8 * v6) object];
      if (v4 == ++v6)
      {
        unint64_t v4 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v44,  v43,  16LL);
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }

  else if (v3)
  {
LABEL_11:
    NSUInteger v7 = (NSMutableString *)(id)objc_opt_new();
    v37[0] = 0LL;
    v37[1] = v37;
    v37[2] = 0x2020000000LL;
    v37[3] = 0LL;
    v36[0] = 0LL;
    v36[1] = v36;
    v36[2] = 0x2020000000LL;
    v36[3] = 0LL;
    uint64_t v30 = 0LL;
    v31 = &v30;
    uint64_t v32 = 0x3052000000LL;
    v33 = __Block_byref_object_copy__20;
    uint64_t v34 = __Block_byref_object_dispose__20;
    uint64_t v35 = 0LL;
    v29[0] = 0LL;
    v29[1] = v29;
    v29[2] = 0x2020000000LL;
    v29[3] = 0LL;
    v28[0] = 0LL;
    v28[1] = v28;
    v28[2] = 0x2020000000LL;
    v28[3] = 0LL;
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x2020000000LL;
    v27[3] = 0LL;
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x2020000000LL;
    v26[3] = 0LL;
    v25[0] = 0LL;
    v25[1] = v25;
    v25[2] = 0x2020000000LL;
    v23[0] = 0LL;
    v23[1] = v23;
    v23[2] = 0x2020000000LL;
    char v24 = 0;
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    __int128 v15 = ___diffStr_block_invoke;
    __int128 v16 = &unk_189CA1C70;
    uint64_t v17 = v7;
    id v18 = v29;
    NSUInteger v19 = v27;
    __int128 v20 = v28;
    __int128 v21 = v26;
    __int128 v22 = &v30;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = ___diffStr_block_invoke_2;
    v13[3] = &unk_189CA1C98;
    v13[6] = v26;
    v13[7] = v23;
    v13[8] = v25;
    v13[9] = &v30;
    v13[4] = v14;
    v13[5] = v27;
    v13[10] = v29;
    v13[11] = v28;
    v13[12] = v36;
    v13[13] = v37;
    -[NSOrderedCollectionDifference _enumerateChangesInDiffOrderWithBlock:]( self,  "_enumerateChangesInDiffOrderWithBlock:",  v13);
    if (v31[5]) {
      v15((uint64_t)v14);
    }
    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v37, 8);
    return v7;
  }

  NSUInteger v7 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@ ("),  -[NSOrderedCollectionDifference description](self, "description");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  unint64_t v8 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v39,  v38,  16LL);
  if (v8)
  {
    uint64_t v9 = *(void *)v40;
    NSUInteger v10 = @"\n";
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(self);
        }
        -[NSMutableString appendFormat:]( v7,  "appendFormat:",  @"\n\t%@",  [*(id *)(*((void *)&v39 + 1) + 8 * i) debugDescription]);
      }

      unint64_t v8 = -[NSOrderedCollectionDifference countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v39,  v38,  16LL);
    }

    while (v8);
  }

  else
  {
    NSUInteger v10 = &stru_189CA6A28;
  }

  -[NSMutableString appendFormat:](v7, "appendFormat:", @"%@"), v10);
  return v7;
}

@end