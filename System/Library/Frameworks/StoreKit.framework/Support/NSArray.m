@interface NSArray
- (NSString)tcr_keyPath;
- (id)_tcr_associatedReader;
- (id)lib_batchedWithMaxSize:(unint64_t)a3;
- (id)lib_categorizeItemsUsingBlock:(id)a3;
- (id)lib_filterUsingBlock:(id)a3;
- (id)lib_firstObjectPassingTest:(id)a3;
- (id)lib_firstResultApplyingTransform:(id)a3;
- (id)lib_flatMapAndFilterUsingBlock:(id)a3;
- (id)lib_mapAndFilterUsingBlock:(id)a3;
- (id)tcr_dictionaryEnumerator;
- (id)tcr_numberEnumerator;
- (id)tcr_stringEnumerator;
@end

@implementation NSArray

- (NSString)tcr_keyPath
{
  return -[NSArray componentsJoinedByString:](self, "componentsJoinedByString:", @".");
}

- (id)tcr_dictionaryEnumerator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v3 = [v2 enumeratorForObjectsOfClass:objc_opt_class(NSDictionary)];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)tcr_numberEnumerator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v3 = [v2 enumeratorForObjectsOfClass:objc_opt_class(NSNumber)];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)tcr_stringEnumerator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray _tcr_associatedReader](self, "_tcr_associatedReader"));
  id v3 = [v2 enumeratorForObjectsOfClass:objc_opt_class(NSString)];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)_tcr_associatedReader
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSArray;
  id v3 = -[NSArray _tcr_associatedReader](&v8, "_tcr_associatedReader");
  v4 = (TypeCheckedArrayReader *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TypeCheckedArrayReader);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v6 = -[TypeCheckedArrayReader initWithArray:]( objc_alloc(&OBJC_CLASS___TypeCheckedArrayReader),  "initWithArray:",  self);

    -[NSArray _tcr_associateWithReader:](self, "_tcr_associateWithReader:", v6);
    v4 = v6;
  }

  return v4;
}

- (id)lib_categorizeItemsUsingBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v6 = self;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v12 = v4[2](v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v19));
          v15 = v14;
          if (v14)
          {
            [v14 addObject:v11];
          }

          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v11));
            [v5 setObject:v16 forKeyedSubscript:v13];
          }
        }
      }

      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v8);
  }

  v17 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v5,  1LL);
  return v17;
}

- (id)lib_firstObjectPassingTest:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000614D8;
  v8[3] = &unk_1002E9988;
  id v4 = a3;
  id v9 = v4;
  NSUInteger v5 = -[NSArray indexOfObjectPassingTest:](self, "indexOfObjectPassingTest:", v8);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    v6 = 0LL;
  }
  else {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v5));
  }

  return v6;
}

- (id)lib_firstResultApplyingTransform:(id)a3
{
  id v4 = (uint64_t (**)(id, void))a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  NSUInteger v5 = self;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9));
        uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          goto LABEL_11;
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v12 = 0LL;
LABEL_11:

  return v12;
}

- (id)lib_flatMapAndFilterUsingBlock:(id)a3
{
  id v4 = a3;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_1000616C8;
  uint64_t v12 = &unk_1002E99B0;
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self, "count")));
  id v14 = v4;
  id v5 = v13;
  id v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v9);
  id v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

- (id)lib_mapAndFilterUsingBlock:(id)a3
{
  id v4 = a3;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = sub_100061888;
  uint64_t v12 = &unk_1002E99D8;
  id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSArray count](self, "count")));
  id v14 = v4;
  id v5 = v13;
  id v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v9);
  id v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

- (id)lib_filterUsingBlock:(id)a3
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = sub_1000619D0;
  __int128 v15 = sub_1000619E0;
  id v16 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000619E8;
  v8[3] = &unk_1002E9A00;
  id v4 = a3;
  id v9 = v4;
  uint64_t v10 = &v11;
  void v8[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v8);
  if (v12[5]) {
    id v5 = (NSArray *)v12[5];
  }
  else {
    id v5 = self;
  }
  id v6 = -[NSArray copy](v5, "copy");

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)lib_batchedWithMaxSize:(unint64_t)a3
{
  unint64_t v5 = -[NSArray count](self, "count");
  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v5)
  {
    uint64_t v7 = 0LL;
    do
    {
      if (v5 >= a3) {
        unint64_t v8 = a3;
      }
      else {
        unint64_t v8 = v5;
      }
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self, "subarrayWithRange:", v7, v8));
      v5 -= v8;
      v7 += v8;
      -[NSMutableArray addObject:](v6, "addObject:", v9);
    }

    while (v5);
  }

  return v6;
}

@end