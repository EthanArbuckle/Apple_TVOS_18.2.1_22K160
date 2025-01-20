@interface NSArray(NSKeyValueCoding)
- (NSDecimalNumber)_sumForKeyPath:()NSKeyValueCoding;
- (NSNumber)_countForKeyPath:()NSKeyValueCoding;
- (id)valueForKey:()NSKeyValueCoding;
- (id)valueForKeyPath:()NSKeyValueCoding;
- (uint64_t)_avgForKeyPath:()NSKeyValueCoding;
- (uint64_t)_distinctUnionOfArraysForKeyPath:()NSKeyValueCoding;
- (uint64_t)_distinctUnionOfObjectsForKeyPath:()NSKeyValueCoding;
- (uint64_t)_distinctUnionOfSetsForKeyPath:()NSKeyValueCoding;
- (uint64_t)setValue:()NSKeyValueCoding forKey:;
- (void)_maxForKeyPath:()NSKeyValueCoding;
- (void)_minForKeyPath:()NSKeyValueCoding;
- (void)_unionOfArraysForKeyPath:()NSKeyValueCoding;
- (void)_unionOfObjectsForKeyPath:()NSKeyValueCoding;
- (void)_unionOfSetsForKeyPath:()NSKeyValueCoding;
@end

@implementation NSArray(NSKeyValueCoding)

- (id)valueForKeyPath:()NSKeyValueCoding
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 length];
  if (!v5 || (uint64_t v6 = v5, [a3 characterAtIndex:0] != 64))
  {
    v27.receiver = a1;
    v27.super_class = (Class)&OBJC_CLASS___NSArray_0;
    return objc_msgSendSuper2(&v27, sel_valueForKeyPath_, a3);
  }

  uint64_t v7 = objc_msgSend(a3, "rangeOfString:options:range:", @".", 2, 0, v6);
  if (!v8)
  {
    v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0);
    goto LABEL_10;
  }

  uint64_t v9 = v7 + 1;
  v10 = (void *)objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v7 - 1, 0);
  uint64_t v11 = objc_msgSend(a3, "_newSubstringWithRange:zone:", v9, v6 - v9, 0);
  if (!v11)
  {
LABEL_10:
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_CLASS___NSArray_0;
    id v19 = objc_msgSendSuper2(&v28, sel_valueForKey_, v10);
    goto LABEL_11;
  }

  v12 = (void *)v11;
  uint64_t v13 = [v10 lengthOfBytesUsingEncoding:4];
  MEMORY[0x1895F8858](v13);
  v15 = (char *)&v26 - v14;
  objc_msgSend(v10, "getCString:maxLength:encoding:", (char *)&v26 - v14);
  v16 = (objc_class *)objc_opt_class();
  v17 = NSKeyValueMethodForPattern(v16, "%sForKeyPath:", v15);
  if (v17
    || (v18 = (objc_class *)objc_opt_class(), (v17 = NSKeyValueMethodForPattern(v18, "_%sForKeyPath:", v15)) != 0LL))
  {
    id v19 = method_invoke(a1, v17, v12);

LABEL_11:
    return v19;
  }

  id v21 = v10;
  v22 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"[<%@ %p> valueForKeyPath:]: this class does not implement the %@ operation.", objc_opt_class(), a1, v10), 0 reason userInfo];
  objc_exception_throw(v22);
  return -[NSObject valueForKeyPath:](v23, v24, v25);
}

- (id)valueForKey:()NSKeyValueCoding
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 length];
  if (v5
    && (uint64_t v6 = v5, [a3 characterAtIndex:0] == 64)
    && (uint64_t v7 = objc_msgSend(a3, "_newSubstringWithRange:zone:", 1, v6 - 1, 0)) != 0)
  {
    uint64_t v8 = (void *)v7;
    v20.receiver = a1;
    v20.super_class = (Class)&OBJC_CLASS___NSArray_0;
    id v9 = objc_msgSendSuper2(&v20, sel_valueForKey_, v7);
  }

  else
  {
    unint64_t v10 = [a1 count];
    uint64_t v11 = NSAllocateObjectArray(v10);
    uint64_t v12 = [MEMORY[0x189603FE8] null];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v13 = [a1 countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0LL;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(a1);
          }
          uint64_t v17 = [*(id *)(*((void *)&v22 + 1) + 8 * v16) valueForKey:a3];
          if (v17) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = v12;
          }
          v11[v14 + v16++] = v18;
        }

        while (v13 != v16);
        uint64_t v13 = [a1 countByEnumeratingWithState:&v22 objects:v21 count:16];
        v14 += v16;
      }

      while (v13);
    }

    id v9 = (id)[objc_alloc(MEMORY[0x189603F18]) initWithObjects:v11 count:v10];
    free(v11);
  }

  return v9;
}

- (NSDecimalNumber)_sumForKeyPath:()NSKeyValueCoding
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v5 = +[NSDecimalNumber zero](&OBJC_CLASS___NSDecimalNumber, "zero");
  if (v5)
  {
    -[NSDecimalNumber decimalValue](v5, "decimalValue");
  }

  else
  {
    __int128 v13 = 0uLL;
    int v14 = 0;
  }

  uint64_t v6 = [a1 count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      id v9 = (void *)[a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
      if (v9)
      {
        [v9 decimalValue];
        _NSDecimalAdd(&v13, &v13, &v11, 3LL);
      }
    }
  }

  __int128 v11 = v13;
  int v12 = v14;
  return +[NSDecimalNumber decimalNumberWithDecimal:](&OBJC_CLASS___NSDecimalNumber, "decimalNumberWithDecimal:", &v11);
}

- (uint64_t)_avgForKeyPath:()NSKeyValueCoding
{
  uint64_t result = [a1 count];
  if (result) {
    return objc_msgSend( (id)objc_msgSend(a1, "_sumForKeyPath:", a3),  "decimalNumberByDividingBy:",  +[NSDecimalNumber numberWithUnsignedInteger:]( NSDecimalNumber,  "numberWithUnsignedInteger:",  result));
  }
  return result;
}

- (NSNumber)_countForKeyPath:()NSKeyValueCoding
{
  return +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a1 count]);
}

- (void)_maxForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0LL;
  for (uint64_t i = 0LL; i != v6; ++i)
  {
    uint64_t v9 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
    if (v9)
    {
      unint64_t v10 = (void *)v9;
      if (!v7 || [v7 compare:v9] == -1) {
        uint64_t v7 = v10;
      }
    }
  }

  return v7;
}

- (void)_minForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0LL;
  for (uint64_t i = 0LL; i != v6; ++i)
  {
    uint64_t v9 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
    if (v9)
    {
      unint64_t v10 = (void *)v9;
      if (!v7 || [v7 compare:v9] == 1) {
        uint64_t v7 = v10;
      }
    }
  }

  return v7;
}

- (void)_unionOfObjectsForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  uint64_t v6 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:v5];
  if (v5)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      uint64_t v8 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
      if (v8) {
        [v6 addObject:v8];
      }
    }
  }

  return v6;
}

- (void)_unionOfArraysForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  uint64_t v6 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:v5];
  if (v5)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      uint64_t v8 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
      if (v8) {
        [v6 addObjectsFromArray:v8];
      }
    }
  }

  return v6;
}

- (void)_unionOfSetsForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  uint64_t v6 = (void *)[MEMORY[0x189603FA8] arrayWithCapacity:v5];
  if (v5)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      uint64_t v8 = (void *)[a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
      if (v8) {
        objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v8, "allObjects"));
      }
    }
  }

  return v6;
}

- (uint64_t)_distinctUnionOfArraysForKeyPath:()NSKeyValueCoding
{
  return objc_msgSend( (id)objc_msgSend(MEMORY[0x189604010], "setWithArray:", objc_msgSend(a1, "_unionOfArraysForKeyPath:")),  "allObjects");
}

- (uint64_t)_distinctUnionOfObjectsForKeyPath:()NSKeyValueCoding
{
  return objc_msgSend( (id)objc_msgSend(MEMORY[0x189604010], "setWithArray:", objc_msgSend(a1, "_unionOfObjectsForKeyPath:")),  "allObjects");
}

- (uint64_t)_distinctUnionOfSetsForKeyPath:()NSKeyValueCoding
{
  uint64_t v5 = [a1 count];
  uint64_t v6 = (void *)[MEMORY[0x189603FE0] setWithCapacity:v5];
  if (v5)
  {
    for (uint64_t i = 0LL; i != v5; ++i)
    {
      uint64_t v8 = [a1 _valueForKeyPath:a3 ofObjectAtIndex:i];
      if (v8) {
        [v6 unionSet:v8];
      }
    }
  }

  return [v6 allObjects];
}

- (uint64_t)setValue:()NSKeyValueCoding forKey:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a1);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setValue:a3 forKey:a4];
      }

      while (v8 != v10);
      uint64_t result = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
      uint64_t v8 = result;
    }

    while (result);
  }

  return result;
}

@end