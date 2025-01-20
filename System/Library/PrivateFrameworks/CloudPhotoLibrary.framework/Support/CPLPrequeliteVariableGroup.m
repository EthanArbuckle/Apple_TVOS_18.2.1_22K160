@interface CPLPrequeliteVariableGroup
+ (CPLPrequeliteVariableGroup)variableGroupWithVariables:(id)a3;
+ (CPLPrequeliteVariableGroup)variableGroupWithVariablesAndGroups:(id)a3;
- (BOOL)shouldNotCacheValue;
- (CPLPrequeliteVariableGroup)initWithVariables:(id)a3;
- (NSArray)variables;
- (PQLInjecting)definitionInjection;
- (PQLInjecting)injectionForDefaultValues;
- (PQLInjecting)injectionForDefaultValuesUpdate;
- (PQLInjecting)namesInjection;
- (id)_defaultValuesObject;
- (id)injectionForUpdates:(id)a3;
- (id)injectionForValues:(id)a3;
- (id)valuesInSet:(id)a3;
- (id)valuesInSet:(id)a3 startingAtIndex:(int)a4;
- (void)setShouldNotCacheValue:(BOOL)a3;
@end

@implementation CPLPrequeliteVariableGroup

+ (CPLPrequeliteVariableGroup)variableGroupWithVariables:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithVariables:v4];

  return (CPLPrequeliteVariableGroup *)v5;
}

+ (CPLPrequeliteVariableGroup)variableGroupWithVariablesAndGroups:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___CPLPrequeliteVariable);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }

        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "variables", (void)v16));
          -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v13);
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([a1 variableGroupWithVariables:v5]);
  return (CPLPrequeliteVariableGroup *)v14;
}

- (CPLPrequeliteVariableGroup)initWithVariables:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___CPLPrequeliteVariableGroup;
  id v5 = -[CPLPrequeliteVariableGroup init](&v41, "init");
  if (v5)
  {
    id v6 = (NSArray *)[v4 copy];
    variables = v5->_variables;
    v34 = v5;
    v5->_variables = v6;

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v35 = v4;
    id obj = v4;
    id v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      char v14 = 1;
      uint64_t v15 = *(void *)v38;
      do
      {
        __int128 v16 = 0LL;
        do
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(obj);
          }
          __int128 v17 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v16);
          if ((v14 & 1) != 0)
          {
            __int128 v18 = v9;
            __int128 v19 = "?";
            uint64_t v20 = 1LL;
          }

          else
          {
            -[NSMutableData appendBytes:length:](v8, "appendBytes:length:", ", ", 2LL);
            -[NSMutableData appendBytes:length:](v9, "appendBytes:length:", ", ?", 3LL);
            -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", ", ", 2LL);
            __int128 v18 = v11;
            __int128 v19 = ", ";
            uint64_t v20 = 2LL;
          }

          -[NSMutableData appendBytes:length:](v18, "appendBytes:length:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v17 sql]);
          -[NSMutableData appendData:](v8, "appendData:", v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue([v17 sql]);
          -[NSMutableData appendData:](v10, "appendData:", v22);

          -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", " = ?", 4LL);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v17 columnDefinition]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 sql]);
          -[NSMutableData appendData:](v11, "appendData:", v24);

          char v14 = 0;
          __int128 v16 = (char *)v16 + 1;
        }

        while (v13 != v16);
        id v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        char v14 = 0;
      }

      while (v13);
    }

    v25 = -[PQLRawInjection initWithData:](objc_alloc(&OBJC_CLASS___PQLRawInjection), "initWithData:", v8);
    id v5 = v34;
    namesInjection = v34->_namesInjection;
    v34->_namesInjection = v25;

    sqlForValues = v34->_sqlForValues;
    v34->_sqlForValues = &v9->super;
    v28 = v9;

    sqlForUpdates = v34->_sqlForUpdates;
    v34->_sqlForUpdates = &v10->super;
    v30 = v10;

    v31 = -[PQLRawInjection initWithData:](objc_alloc(&OBJC_CLASS___PQLRawInjection), "initWithData:", v11);
    definitionInjection = v34->_definitionInjection;
    v34->_definitionInjection = v31;

    id v4 = v35;
  }

  return v5;
}

- (void)setShouldNotCacheValue:(BOOL)a3
{
  BOOL v3 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = self->_variables;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setShouldNotCacheValue:", v3, (void)v10);
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  self->_shouldNotCacheValue = v3;
}

- (id)_defaultValuesObject
{
  p_id defaultValuesObject = &self->_defaultValuesObject;
  id defaultValuesObject = self->_defaultValuesObject;
  if (defaultValuesObject) {
    return defaultValuesObject;
  }
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = self->_variables;
  id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        __int128 v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "defaultValue", (void)v16));
        if (v12)
        {
          if (!v8) {
            uint64_t v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          }
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 variableName]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v12, v13);
        }
      }

      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (v8) {
    char v14 = v8;
  }
  else {
    char v14 = (NSMutableDictionary *)&__NSDictionary0__struct;
  }
  objc_storeStrong(p_defaultValuesObject, v14);
  id v15 = *p_defaultValuesObject;

  return v15;
}

- (id)injectionForValues:(id)a3
{
  id v4 = a3;
  id v5 = -[_CPLObjectInjection initWithVariables:object:sql:]( objc_alloc(&OBJC_CLASS____CPLObjectInjection),  "initWithVariables:object:sql:",  self->_variables,  v4,  self->_sqlForValues);

  return v5;
}

- (PQLInjecting)injectionForDefaultValues
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariableGroup _defaultValuesObject](self, "_defaultValuesObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariableGroup injectionForValues:](self, "injectionForValues:", v3));

  return (PQLInjecting *)v4;
}

- (id)valuesInSet:(id)a3 startingAtIndex:(int)a4
{
  id v6 = a3;
  id v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSArray count](self->_variables, "count"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v8 = self->_variables;
  id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = a4;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        char v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueFromSet:atIndex:", v6, (char *)i + v11, (void)v17));
        if (v15) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v14);
        }
      }

      id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      uint64_t v11 = (v11 + (_DWORD)i);
    }

    while (v10);
  }

  return v7;
}

- (id)valuesInSet:(id)a3
{
  return -[CPLPrequeliteVariableGroup valuesInSet:startingAtIndex:](self, "valuesInSet:startingAtIndex:", a3, 0LL);
}

- (id)injectionForUpdates:(id)a3
{
  id v4 = a3;
  id v5 = -[_CPLObjectInjection initWithVariables:object:sql:]( objc_alloc(&OBJC_CLASS____CPLObjectInjection),  "initWithVariables:object:sql:",  self->_variables,  v4,  self->_sqlForUpdates);

  return v5;
}

- (PQLInjecting)injectionForDefaultValuesUpdate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariableGroup _defaultValuesObject](self, "_defaultValuesObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPrequeliteVariableGroup injectionForUpdates:](self, "injectionForUpdates:", v3));

  return (PQLInjecting *)v4;
}

- (NSArray)variables
{
  return self->_variables;
}

- (BOOL)shouldNotCacheValue
{
  return self->_shouldNotCacheValue;
}

- (PQLInjecting)namesInjection
{
  return self->_namesInjection;
}

- (PQLInjecting)definitionInjection
{
  return self->_definitionInjection;
}

- (void).cxx_destruct
{
}

@end