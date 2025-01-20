@interface SDLogAgentCollectionContainer
- (BOOL)addRulesFromHelperReply:(id)a3;
- (BOOL)flattenReturnedDirectoryPaths;
- (id)createRulesFromPaths:(id)a3;
- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3;
@end

@implementation SDLogAgentCollectionContainer

- (id)createRulesFromPaths:(id)a3
{
  id v4 = a3;
  if (-[SDLogAgentCollectionContainer flattenReturnedDirectoryPaths](self, "flattenReturnedDirectoryPaths"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithMutablePaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithMutablePaths:",  v4));
    v26 = v5;
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v18 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v14 = [v13 fileExistsAtPath:v12 isDirectory:&v20];

          if (v14)
          {
            if (v20)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogDirectory logRuleWithDirectory:]( &OBJC_CLASS___SDUnitLogDirectory,  "logRuleWithDirectory:",  v12));
              [v5 addObject:v15];
            }

            else
            {
              [v19 addObject:v12];
            }
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }

      while (v9);
    }

    if ([v19 count])
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[SDUnitLogPathArray logRuleWithMutablePaths:]( &OBJC_CLASS___SDUnitLogPathArray,  "logRuleWithMutablePaths:",  v19));
      [v5 addObject:v16];
    }

    id v6 = [v5 copy];

    id v4 = v18;
  }

  return v6;
}

- (BOOL)addRulesFromHelperReply:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "resultPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  id v6 = v5;
  if (v5)
  {
    id v7 = sub_10002172C(v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentCollectionContainer createRulesFromPaths:](self, "createRulesFromPaths:", v8));
    id v10 = [v9 count];
    BOOL v11 = v10 != 0LL;
    if (v10) {
      -[SDLogCollectionContainer addRules:](self, "addRules:", v9);
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)flattenReturnedDirectoryPaths
{
  return self->_flattenReturnedDirectoryPaths;
}

- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3
{
  self->_flattenReturnedDirectoryPaths = a3;
}

@end