@interface NSMemoryStoreInPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (void)dealloc;
- (void)setContext:(id)a3;
@end

@implementation NSMemoryStoreInPredicateOperator

- (void)setContext:(id)a3
{
  context = self->_context;
  if (context != a3)
  {

    self->_context = (NSManagedObjectContext *)a3;
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMemoryStoreInPredicateOperator;
  -[NSMemoryStoreInPredicateOperator dealloc](&v3, sel_dealloc);
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (a3 = (id)[a3 objectID]) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v7 = [a4 count];
    v28 = &v26;
    if (v7 <= 1) {
      uint64_t v8 = 1LL;
    }
    else {
      uint64_t v8 = v7;
    }
    if (v7 >= 0x201) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v8;
    }
    v10 = (char *)&v26 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    unint64_t v27 = v7;
    id v29 = a3;
    if (v7 > 0x200) {
      v10 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)&v26 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), 8 * v8);
    }
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v34 = 0u;
    __int128 v33 = 0u;
    uint64_t v11 = [a4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0LL;
      uint64_t v14 = *(void *)v34;
      v30 = v10;
      do
      {
        uint64_t v15 = 0LL;
        uint64_t v31 = v13;
        v16 = &v10[8 * v13];
        do
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(a4);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v17 = (void *)[v17 objectID];
          }

          context = self->_context;
          if (context)
          {
            v19 = (id *)*((void *)context->_additionalPrivateIvars + 1);
            if (v19)
            {
              uint64_t v20 = [*v19 objectForKey:v17];
              if (v20) {
                v17 = (void *)v20;
              }
            }
          }

          *(void *)&v16[8 * v15++] = v17;
        }

        while (v12 != v15);
        uint64_t v12 = [a4 countByEnumeratingWithState:&v33 objects:v37 count:16];
        uint64_t v13 = v31 + v15;
        v10 = v30;
      }

      while (v12);
    }

    unint64_t v21 = v27;
    if (v27)
    {
      id v22 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v10 count:v27];
      BOOL v23 = v21 >= 0x201;
      a3 = v29;
      if (v23) {
        NSZoneFree(0LL, v10);
      }
    }

    else
    {
      id v22 = (id)NSArray_EmptyArray;
      a3 = v29;
    }

    a4 = v22;
  }

  else
  {
    id v22 = 0LL;
  }

  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___NSMemoryStoreInPredicateOperator;
  BOOL v24 = -[NSPredicateOperator performPrimitiveOperationUsingObject:andObject:]( &v32,  sel_performPrimitiveOperationUsingObject_andObject_,  a3,  a4);

  return v24;
}

@end