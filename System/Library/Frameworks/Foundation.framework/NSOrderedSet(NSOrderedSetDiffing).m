@interface NSOrderedSet(NSOrderedSetDiffing)
- (NSOrderedCollectionDifference)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:;
- (id)orderedSetByApplyingDifference:()NSOrderedSetDiffing;
- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing;
- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:usingEquivalenceTest:;
@end

@implementation NSOrderedSet(NSOrderedSetDiffing)

- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:usingEquivalenceTest:
{
  if (a5) {
    return objc_msgSend( (id)objc_msgSend(a1, "array"),  "differenceFromArray:withOptions:usingEquivalenceTest:",  objc_msgSend(a3, "array"),  a4,  a5);
  }
  else {
    return [a1 differenceFromOrderedSet:a3 withOptions:a4];
  }
}

- (NSOrderedCollectionDifference)differenceFromOrderedSet:()NSOrderedSetDiffing withOptions:
{
  if (!a3)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"Cannot diff nil parameter" userInfo:0]);
    return (NSOrderedCollectionDifference *)-[NSOrderedSet(NSOrderedSetDiffing) differenceFromOrderedSet:]();
  }

  v7 = a3;
  v8 = a1;
  v9 = (void *)MEMORY[0x189603FA8];
  uint64_t v10 = [a1 count];
  uint64_t v11 = [v7 count];
  unint64_t v12 = v10 - v11;
  if (v10 - v11 < 0) {
    unint64_t v12 = v11 - v10;
  }
  if (v12 >= 0x10)
  {
    uint64_t v14 = [v8 count];
    uint64_t v15 = [v7 count];
    if (v14 - v15 >= 0) {
      uint64_t v13 = v14 - v15;
    }
    else {
      uint64_t v13 = v15 - v14;
    }
  }

  else
  {
    uint64_t v13 = 16LL;
  }

  v16 = (void *)[v9 arrayWithCapacity:v13];
  if ([v7 count])
  {
    unint64_t v17 = 0LL;
    unint64_t v18 = 0LL;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    v63 = v16;
    v64 = v7;
    v65 = v8;
    char v62 = a4;
    while (2)
    {
      uint64_t v21 = -v19;
      uint64_t v22 = -v20;
      unint64_t v23 = v17;
      unint64_t v24 = v18;
      v25 = v4;
      uint64_t v59 = v22;
      uint64_t v60 = -v19;
      while (2)
      {
        uint64_t v26 = 0LL;
        unint64_t v27 = v21 + v23;
        unint64_t v28 = v22 + v24;
        while (1)
        {
          v4 = v25;
          unint64_t v17 = v23 + v26;
          unint64_t v18 = v24 + v26;
          if (v23 + v26 >= [v65 count]) {
            goto LABEL_73;
          }
          uint64_t v29 = v28 + v26;
          if (v28 + v26) {
            v4 = (void *)[v64 objectAtIndexedSubscript:v24 + v26];
          }
          uint64_t v30 = v27 + v26;
          if (v27 + v26) {
            v5 = (void *)[v65 objectAtIndexedSubscript:v23 + v26];
          }
          v25 = v4;
          if (v4 != v5) {
            break;
          }
          ++v26;
          unint64_t v18 = v24 + v26;
          v5 = v4;
          if (v24 + v26 >= [v64 count])
          {
            unint64_t v17 = v23 + v26;
LABEL_73:
            v16 = v63;
            v7 = v64;
            v8 = v65;
            a4 = v62;
            goto LABEL_74;
          }
        }

        uint64_t v31 = v58;
        if (v29) {
          uint64_t v31 = [v4 hash];
        }
        uint64_t v32 = v57;
        if (v30) {
          uint64_t v32 = [v5 hash];
        }
        uint64_t v58 = v31;
        if (v31 == v32)
        {
          if ([v4 isEqual:v5])
          {
            v24 += v26 + 1;
            v23 += v26 + 1;
            unint64_t v33 = [v64 count];
            uint64_t v57 = v31;
            uint64_t v22 = v59;
            uint64_t v21 = v60;
            if (v24 < v33) {
              continue;
            }
            unint64_t v18 = v24;
            unint64_t v17 = v23;
            goto LABEL_73;
          }

          uint64_t v32 = v31;
        }

        break;
      }

      uint64_t v57 = v32;
      unint64_t v34 = v56;
      if (v29) {
        unint64_t v34 = [v65 indexOfObject:v4];
      }
      unint64_t v56 = v34;
      if (v30)
      {
        uint64_t v35 = [v64 indexOfObject:v5];
        unint64_t v34 = v56;
        unint64_t v55 = v35;
      }

      unint64_t v36 = v23 + v26;
      unint64_t v18 = v24 + v26;
      unint64_t v61 = v24 + v26;
      if (v34 == 0x7FFFFFFFFFFFFFFFLL || v34 < v36)
      {
        if ((v62 & 2) != 0) {
          v41 = 0LL;
        }
        else {
          v41 = v4;
        }
        if ((v62 & 4) != 0) {
          uint64_t v42 = v34;
        }
        else {
          uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
        }
        objc_msgSend( v63,  "addObject:",  +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:]( NSOrderedCollectionChange,  "changeWithObject:type:index:associatedIndex:",  v41,  1,  v24 + v26,  v42,  v55));
        unint64_t v18 = v24 + v26 + 1;
        uint64_t v38 = v55;
        if (v55 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v37 = v23;
          v7 = v64;
          uint64_t v19 = v36;
        }

        else
        {
          uint64_t v19 = v23 + v26;
          unint64_t v17 = v23 + v26;
          unint64_t v37 = v23;
          v7 = v64;
          if (v55 > v24 + v26) {
            goto LABEL_70;
          }
        }
      }

      else
      {
        unint64_t v37 = v23;
        uint64_t v38 = v55;
        v7 = v64;
        uint64_t v19 = v36;
        if (v55 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v18 = v24 + v26;
          if (v55 >= v61)
          {
            if (v56 - v37 - v26 >= v55 - v24 - v26)
            {
              if ((v62 & 2) != 0) {
                v43 = 0LL;
              }
              else {
                v43 = v4;
              }
              if ((v62 & 4) != 0) {
                uint64_t v44 = v56;
              }
              else {
                uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
              }
              objc_msgSend( v63,  "addObject:",  +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:]( NSOrderedCollectionChange,  "changeWithObject:type:index:associatedIndex:",  v43,  1,  v61,  v44,  v55));
              unint64_t v18 = v24 + v26 + 1;
              unint64_t v17 = v36;
            }

            else
            {
              if ((v62 & 1) != 0) {
                v39 = 0LL;
              }
              else {
                v39 = v5;
              }
              if ((v62 & 4) != 0) {
                uint64_t v40 = v55;
              }
              else {
                uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
              }
              objc_msgSend( v63,  "addObject:",  +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:]( NSOrderedCollectionChange,  "changeWithObject:type:index:associatedIndex:",  v39,  0,  v36,  v40,  v55));
              unint64_t v17 = v37 + v26 + 1;
              unint64_t v18 = v24 + v26;
            }

            goto LABEL_70;
          }
        }
      }

      if ((v62 & 1) != 0) {
        v45 = 0LL;
      }
      else {
        v45 = v5;
      }
      if ((v62 & 4) != 0) {
        uint64_t v46 = v38;
      }
      else {
        uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
      }
      objc_msgSend( v63,  "addObject:",  +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:]( NSOrderedCollectionChange,  "changeWithObject:type:index:associatedIndex:",  v45,  0,  v19,  v46,  v55));
      unint64_t v17 = v37 + v26 + 1;
LABEL_70:
      unint64_t v47 = [v7 count];
      a4 = v62;
      v16 = v63;
      v8 = v65;
      uint64_t v20 = v61;
      if (v18 < v47) {
        continue;
      }
      goto LABEL_74;
    }
  }

  unint64_t v18 = 0LL;
  unint64_t v17 = 0LL;
LABEL_74:
  while (v18 < [v7 count])
  {
    uint64_t v48 = [v7 objectAtIndexedSubscript:v18];
    if ((a4 & 4) != 0) {
      uint64_t v49 = [v8 indexOfObject:v48];
    }
    else {
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((a4 & 2) != 0) {
      uint64_t v50 = 0LL;
    }
    else {
      uint64_t v50 = v48;
    }
    objc_msgSend( v16,  "addObject:",  +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:]( NSOrderedCollectionChange,  "changeWithObject:type:index:associatedIndex:",  v50,  1,  v18++,  v49));
  }

  for (; v17 < [v8 count]; ++v17)
  {
    uint64_t v51 = [v8 objectAtIndexedSubscript:v17];
    if ((a4 & 4) != 0) {
      uint64_t v52 = [v7 indexOfObject:v51];
    }
    else {
      uint64_t v52 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((a4 & 1) != 0) {
      uint64_t v53 = 0LL;
    }
    else {
      uint64_t v53 = v51;
    }
    objc_msgSend( v16,  "addObject:",  +[NSOrderedCollectionChange changeWithObject:type:index:associatedIndex:]( NSOrderedCollectionChange,  "changeWithObject:type:index:associatedIndex:",  v53,  0,  v17,  v52));
  }

  return  -[NSOrderedCollectionDifference initWithChanges:]( objc_alloc(&OBJC_CLASS___NSOrderedCollectionDifference),  "initWithChanges:",  v16);
}

- (uint64_t)differenceFromOrderedSet:()NSOrderedSetDiffing
{
  return [a1 differenceFromOrderedSet:a3 withOptions:0];
}

- (id)orderedSetByApplyingDifference:()NSOrderedSetDiffing
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

@end