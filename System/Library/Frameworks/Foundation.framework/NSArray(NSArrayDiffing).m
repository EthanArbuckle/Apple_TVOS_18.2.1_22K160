@interface NSArray(NSArrayDiffing)
- (NSOrderedCollectionDifference)differenceFromArray:()NSArrayDiffing withOptions:usingEquivalenceTest:;
- (id)arrayByApplyingDifference:()NSArrayDiffing;
- (uint64_t)differenceFromArray:()NSArrayDiffing;
- (uint64_t)differenceFromArray:()NSArrayDiffing withOptions:;
@end

@implementation NSArray(NSArrayDiffing)

- (id)arrayByApplyingDifference:()NSArrayDiffing
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = (id)[a1 mutableCopy];
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 changeType];
        unint64_t v11 = [v9 index];
        unint64_t v12 = [v4 count];
        if (v10 == 1)
        {
          if (v11 >= v12) {
            return 0LL;
          }
          objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v9, "index"));
        }

        else
        {
          if (v11 > v12) {
            return 0LL;
          }
          id result = (id)[v9 object];
          if (!result) {
            return result;
          }
          objc_msgSend(v4, "insertObject:atIndex:", objc_msgSend(v9, "object"), objc_msgSend(v9, "index"));
        }
      }

      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  return (id)[v4 copy];
}

- (NSOrderedCollectionDifference)differenceFromArray:()NSArrayDiffing withOptions:usingEquivalenceTest:
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v84 = (void *)MEMORY[0x189603F70];
    uint64_t v85 = *MEMORY[0x189603A60];
    v86 = @"Cannot diff nil parameter";
    goto LABEL_104;
  }

  if ((a4 & 4) != 0 && a5 != &__block_literal_global_28)
  {
    v84 = (void *)MEMORY[0x189603F70];
    uint64_t v85 = *MEMORY[0x189603A60];
    v86 = @"Inferring moves is not supported when using a custom equivalence test";
LABEL_104:
    objc_exception_throw((id)[v84 exceptionWithName:v85 reason:v86 userInfo:0]);
  }

  uint64_t v7 = _myersDescent(a1, a3, (uint64_t)a5);
  v8 = v7;
  char v93 = a4;
  if ((a4 & 4) != 0)
  {
    uint64_t v97 = objc_opt_new();
    uint64_t v88 = objc_opt_new();
    uint64_t v96 = objc_opt_new();
    uint64_t v92 = objc_opt_new();
    uint64_t v9 = -1LL;
  }

  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSPointerArray count](v7, "count") - 1);
    uint64_t v92 = -1LL;
    uint64_t v96 = -1LL;
    uint64_t v97 = -1LL;
    uint64_t v88 = -1LL;
  }

  context = (void *)MEMORY[0x186E1FF60]();
  unint64_t v10 = [a3 count];
  unint64_t v11 = [a1 count];
  uint64_t v12 = -[NSPointerArray count](v8, "count");
  v89 = v8;
  if (v12 >= 2)
  {
    uint64_t v13 = v12;
    v14 = &off_189C61000;
    do
    {
      uint64_t v15 = -[NSPointerArray pointerAtIndex:](v8, "pointerAtIndex:", v13 - 1);
      uint64_t v16 = v10 - v11;
      uint64_t v17 = 1LL;
      if (v10 - v11 != 1 - v13)
      {
        if (v16 == v13 - 1) {
          goto LABEL_14;
        }
        uint64_t v18 = 1 - v16;
        if (v16 >= 2) {
          uint64_t v18 = v16 - 2;
        }
        unint64_t v19 = *(void *)(v15 + 8 * v18);
        uint64_t v17 = 1LL;
        if (v19 >= *(void *)(v15 + 8 * (v16 ^ (v16 >> 63)))) {
LABEL_14:
        }
          uint64_t v17 = -1LL;
      }

      uint64_t v20 = v17 + v16;
      uint64_t v21 = v20 - 1;
      if (v20 < 1) {
        uint64_t v21 = -v20;
      }
      unint64_t v22 = *(void *)(v15 + 8 * v21);
      unint64_t v23 = v22 - v20;
      BOOL v24 = v11 > v23;
      BOOL v25 = v10 > v22;
      unint64_t v26 = v11;
      BOOL v27 = v10 > v22 && v11 > v23;
      if (v27)
      {
        do
        {
          --v10;
          BOOL v24 = --v26 > v23;
          BOOL v25 = v10 > v22;
        }

        while (v10 > v22 && v26 > v23);
      }

      BOOL v28 = v10 == v22 && v24;
      BOOL v29 = v26 == v23 && v25;
      if (!v28 && !v29) {
        __assert_rtn( "_generateElements",  "NSArray+NSArrayDiffing.m",  145,  "(x == prev_x && y > prev_y) || (y == prev_y && x > prev_x)");
      }
      unint64_t v10 = v22;
      unint64_t v11 = v23;
      if (v26 == v23)
      {
        if ((v93 & 4) != 0)
        {
          uint64_t v33 = [a3 objectAtIndexedSubscript:v22];
          v34 = +[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v33);
          if ([(id)v92 objectForKeyedSubscript:v34]) {
            uint64_t v35 = [MEMORY[0x189603FE8] null];
          }
          else {
            uint64_t v35 = [v14[355] numberWithUnsignedInteger:v10];
          }
          [(id)v92 setObject:v35 forKeyedSubscript:v34];
          uint64_t v42 = [v14[355] numberWithUnsignedInteger:v10];
          v43 = (void *)v88;
LABEL_52:
          [v43 setObject:v33 forKeyedSubscript:v42];
          v8 = v89;
          goto LABEL_53;
        }

        v30 = objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange);
        if ((v93 & 2) != 0) {
          uint64_t v31 = 0LL;
        }
        else {
          uint64_t v31 = [a3 objectAtIndexedSubscript:v10];
        }
        v38 = v30;
        uint64_t v39 = 1LL;
        unint64_t v40 = v10;
      }

      else
      {
        if ((v93 & 4) != 0)
        {
          uint64_t v33 = [a1 objectAtIndexedSubscript:v23];
          v36 = +[NSValue valueWithNonretainedObject:](&OBJC_CLASS___NSValue, "valueWithNonretainedObject:", v33);
          if ([(id)v96 objectForKeyedSubscript:v36]) {
            uint64_t v37 = [MEMORY[0x189603FE8] null];
          }
          else {
            uint64_t v37 = [v14[355] numberWithUnsignedInteger:v11];
          }
          [(id)v96 setObject:v37 forKeyedSubscript:v36];
          uint64_t v42 = [v14[355] numberWithUnsignedInteger:v11];
          v43 = (void *)v97;
          goto LABEL_52;
        }

        v32 = objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange);
        if ((v93 & 1) != 0) {
          uint64_t v31 = 0LL;
        }
        else {
          uint64_t v31 = [a1 objectAtIndexedSubscript:v11];
        }
        v38 = v32;
        uint64_t v39 = 0LL;
        unint64_t v40 = v11;
      }

      v41 = -[NSOrderedCollectionChange initWithObject:type:index:](v38, "initWithObject:type:index:", v31, v39, v40);
      [(id)v9 addObject:v41];

      v14 = &off_189C61000;
LABEL_53:
      BOOL v27 = v13-- <= 2;
    }

    while (!v27);
  }

  objc_autoreleasePoolPop(context);
  v44 = (void *)v9;
  if ((v93 & 4) != 0)
  {
    if (a5 != &__block_literal_global_28) {
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSArray<NSOrderedCollectionChange *> *_generateElements(NSArray *, NSArray *, NSPointerArray *, NSOrderedColle ctionDifferenceCalculationOptions, BOOL (^)(id, id))"),  @"NSArray+NSArrayDiffing.m",  186LL,  @"Implementation does not support inferring moves using a custom equality test");
    }
    v44 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", -[NSPointerArray count](v8, "count") - 1);
    v45 = (void *)objc_opt_new();
    v99 = (void *)objc_opt_new();
    v87 = (void *)MEMORY[0x186E1FF60]();
    v46 = (void *)[(id)v92 keysOfEntriesPassingTest:&__block_literal_global_36];
    objc_msgSend( (id)v96,  "removeObjectsForKeys:",  objc_msgSend((id)objc_msgSend((id)v96, "keysOfEntriesPassingTest:", &__block_literal_global_37_0), "allObjects"));
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    __int128 v111 = 0u;
    __int128 v112 = 0u;
    id obja = v46;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v111 objects:v110 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      contexta = *(void **)v112;
      do
      {
        for (uint64_t i = 0LL; i != v48; ++i)
        {
          v50 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          uint64_t v51 = [v50 nonretainedObjectValue];
          uint64_t v52 = [(id)v96 objectForKeyedSubscript:v50];
          if (v52)
          {
            v53 = (void *)v52;
            uint64_t v54 = objc_msgSend((id)objc_msgSend((id)v92, "objectForKeyedSubscript:", v50), "unsignedIntegerValue");
            uint64_t v55 = [v53 unsignedIntegerValue];
            v56 = objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange);
            if ((v93 & 2) != 0) {
              uint64_t v57 = 0LL;
            }
            else {
              uint64_t v57 = v51;
            }
            v58 = -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]( v56,  "initWithObject:type:index:associatedIndex:",  v57,  1LL,  v54,  v55);
            v59 = objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange);
            uint64_t v60 = 0LL;
            if ((v93 & 1) == 0) {
              uint64_t v60 = [(id)v97 objectForKeyedSubscript:v53];
            }
            v61 = -[NSOrderedCollectionChange initWithObject:type:index:associatedIndex:]( v59,  "initWithObject:type:index:associatedIndex:",  v60,  0LL,  v55,  v54);
            [v44 addObject:v58];
            [v44 addObject:v61];
            [v99 addIndex:v54];
            [v45 addIndex:v55];
          }
        }

        uint64_t v48 = [obja countByEnumeratingWithState:&v111 objects:v110 count:16];
      }

      while (v48);
    }

    objc_autoreleasePoolPop(v87);
    __int128 v108 = 0u;
    __int128 v109 = 0u;
    __int128 v106 = 0u;
    __int128 v107 = 0u;
    uint64_t v62 = [(id)v88 countByEnumeratingWithState:&v106 objects:v105 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v107;
      do
      {
        for (uint64_t j = 0LL; j != v63; ++j)
        {
          if (*(void *)v107 != v64) {
            objc_enumerationMutation((id)v88);
          }
          v66 = *(void **)(*((void *)&v106 + 1) + 8 * j);
          uint64_t v67 = [v66 unsignedIntegerValue];
          if (([v99 containsIndex:v67] & 1) == 0)
          {
            v68 = objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange);
            if ((v93 & 2) != 0) {
              uint64_t v69 = 0LL;
            }
            else {
              uint64_t v69 = [(id)v88 objectForKeyedSubscript:v66];
            }
            v70 = -[NSOrderedCollectionChange initWithObject:type:index:]( v68,  "initWithObject:type:index:",  v69,  1LL,  v67);
            [v44 addObject:v70];
          }
        }

        uint64_t v63 = [(id)v88 countByEnumeratingWithState:&v106 objects:v105 count:16];
      }

      while (v63);
    }

    __int128 v103 = 0u;
    __int128 v104 = 0u;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    uint64_t v71 = [(id)v97 countByEnumeratingWithState:&v101 objects:v100 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v102;
      do
      {
        for (uint64_t k = 0LL; k != v72; ++k)
        {
          if (*(void *)v102 != v73) {
            objc_enumerationMutation((id)v97);
          }
          v75 = *(void **)(*((void *)&v101 + 1) + 8 * k);
          uint64_t v76 = [v75 unsignedIntegerValue];
          if (([v45 containsIndex:v76] & 1) == 0)
          {
            v77 = objc_alloc(&OBJC_CLASS___NSOrderedCollectionChange);
            if ((v93 & 1) != 0) {
              uint64_t v78 = 0LL;
            }
            else {
              uint64_t v78 = [(id)v97 objectForKeyedSubscript:v75];
            }
            v79 = -[NSOrderedCollectionChange initWithObject:type:index:]( v77,  "initWithObject:type:index:",  v78,  0LL,  v76);
            [v44 addObject:v79];
          }
        }

        uint64_t v72 = [(id)v97 countByEnumeratingWithState:&v101 objects:v100 count:16];
      }

      while (v72);
    }

    v8 = v89;
  }

  uint64_t v80 = -[NSPointerArray count](v8, "count");
  if (v80)
  {
    uint64_t v81 = v80 - 1;
    do
    {
      v82 = -[NSPointerArray pointerAtIndex:](v8, "pointerAtIndex:", v81);
      -[NSPointerArray removePointerAtIndex:](v8, "removePointerAtIndex:", v81);
      free(v82);
      --v81;
    }

    while (v81 != -1);
  }

  return  -[NSOrderedCollectionDifference initWithChanges:]( objc_alloc(&OBJC_CLASS___NSOrderedCollectionDifference),  "initWithChanges:",  v44);
}

- (uint64_t)differenceFromArray:()NSArrayDiffing withOptions:
{
  return [a1 differenceFromArray:a3 withOptions:a4 usingEquivalenceTest:&__block_literal_global_28];
}

- (uint64_t)differenceFromArray:()NSArrayDiffing
{
  return [a1 differenceFromArray:a3 withOptions:0];
}

@end