@interface DebugHierarchyMetaDataAction
- (BOOL)matchesEnumsForProviderClass:(Class)a3;
- (BOOL)matchesOptionsForProviderClass:(Class)a3;
- (BOOL)metaDataProviderClassesForEnumsAreExclusive;
- (BOOL)metaDataProviderClassesForOptionsAreExclusive;
- (NSArray)metaDataProviderClassesForEnums;
- (NSArray)metaDataProviderClassesForOptions;
- (id)keysToArchiveViaKVC;
- (void)performInContext:(id)a3;
- (void)setMetaDataProviderClassesForEnums:(id)a3;
- (void)setMetaDataProviderClassesForEnums:(id)a3 exclusive:(BOOL)a4;
- (void)setMetaDataProviderClassesForEnumsAreExclusive:(BOOL)a3;
- (void)setMetaDataProviderClassesForOptions:(id)a3;
- (void)setMetaDataProviderClassesForOptions:(id)a3 exclusive:(BOOL)a4;
- (void)setMetaDataProviderClassesForOptionsAreExclusive:(BOOL)a3;
@end

@implementation DebugHierarchyMetaDataAction

- (void)setMetaDataProviderClassesForEnums:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyMetaDataAction setMetaDataProviderClassesForEnums:](self, "setMetaDataProviderClassesForEnums:", a3);
  -[DebugHierarchyMetaDataAction setMetaDataProviderClassesForEnumsAreExclusive:]( self,  "setMetaDataProviderClassesForEnumsAreExclusive:",  v4);
}

- (void)setMetaDataProviderClassesForOptions:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyMetaDataAction setMetaDataProviderClassesForOptions:]( self,  "setMetaDataProviderClassesForOptions:",  a3);
  -[DebugHierarchyMetaDataAction setMetaDataProviderClassesForOptionsAreExclusive:]( self,  "setMetaDataProviderClassesForOptionsAreExclusive:",  v4);
}

- (id)keysToArchiveViaKVC
{
  v3[0] = @"metaDataProviderClassesForEnums";
  v3[1] = @"metaDataProviderClassesForEnumsAreExclusive";
  v3[2] = @"metaDataProviderClassesForOptions";
  v3[3] = @"metaDataProviderClassesForOptionsAreExclusive";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  4LL));
}

- (void)performInContext:(id)a3
{
  id v4 = a3;
  id v5 = DebugHierarchyMetaDataProviderClasses();
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(v5);
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        if (-[DebugHierarchyMetaDataAction matchesEnumsForProviderClass:](self, "matchesEnumsForProviderClass:", v9)
          && +[DebugHierarchyMetaDataProviderProtocolHelper classImplementsRequiredEnumDescriptionMethods:]( &OBJC_CLASS___DebugHierarchyMetaDataProviderProtocolHelper,  "classImplementsRequiredEnumDescriptionMethods:",  v9))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyMetaDataProviderProtocolHelper debugHierarchyEnumDescriptionsOnClass:]( &OBJC_CLASS___DebugHierarchyMetaDataProviderProtocolHelper,  "debugHierarchyEnumDescriptionsOnClass:",  v9));
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
          if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
            id v14 = (id)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"metaDataEnums"]);

            if (v14)
            {
              [v14 addEntriesFromDictionary:v10];
            }

            else
            {
              id v14 = [v10 mutableCopy];
              v15 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
              [v15 setObject:v14 forKeyedSubscript:@"metaDataEnums"];
            }
          }
        }

        if (-[DebugHierarchyMetaDataAction matchesOptionsForProviderClass:]( self,  "matchesOptionsForProviderClass:",  v9)
          || +[DebugHierarchyMetaDataProviderProtocolHelper classImplementsRequiredOptionDescriptionMethods:]( &OBJC_CLASS___DebugHierarchyMetaDataProviderProtocolHelper,  "classImplementsRequiredOptionDescriptionMethods:",  v9))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyMetaDataProviderProtocolHelper debugHierarchyOptionDescriptionsOnClass:]( &OBJC_CLASS___DebugHierarchyMetaDataProviderProtocolHelper,  "debugHierarchyOptionDescriptionsOnClass:",  v9));
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v17);
          if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
            id v20 = (id)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"metaDataOptions"]);

            if (v20)
            {
              [v20 addEntriesFromDictionary:v16];
            }

            else
            {
              id v20 = [v16 mutableCopy];
              v21 = (void *)objc_claimAutoreleasedReturnValue([v4 metaData]);
              [v21 setObject:v20 forKeyedSubscript:@"metaDataOptions"];
            }
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v6);
  }
}

- (BOOL)matchesEnumsForProviderClass:(Class)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyMetaDataAction metaDataProviderClassesForEnums]( self,  "metaDataProviderClassesForEnums"));

  if (!v5) {
    return 1;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyMetaDataAction metaDataProviderClassesForEnums]( self,  "metaDataProviderClassesForEnums"));
  uint64_t v7 = NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = [v6 containsObject:v8];

  return v9 ^ -[DebugHierarchyMetaDataAction metaDataProviderClassesForEnumsAreExclusive]( self,  "metaDataProviderClassesForEnumsAreExclusive") ^ 1;
}

- (BOOL)matchesOptionsForProviderClass:(Class)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyMetaDataAction metaDataProviderClassesForOptions]( self,  "metaDataProviderClassesForOptions"));

  if (!v5) {
    return 1;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyMetaDataAction metaDataProviderClassesForOptions]( self,  "metaDataProviderClassesForOptions"));
  uint64_t v7 = NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned __int8 v9 = [v6 containsObject:v8];

  return v9 ^ -[DebugHierarchyMetaDataAction metaDataProviderClassesForOptionsAreExclusive]( self,  "metaDataProviderClassesForOptionsAreExclusive") ^ 1;
}

- (NSArray)metaDataProviderClassesForEnums
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setMetaDataProviderClassesForEnums:(id)a3
{
}

- (BOOL)metaDataProviderClassesForEnumsAreExclusive
{
  return self->_metaDataProviderClassesForEnumsAreExclusive;
}

- (void)setMetaDataProviderClassesForEnumsAreExclusive:(BOOL)a3
{
  self->_metaDataProviderClassesForEnumsAreExclusive = a3;
}

- (NSArray)metaDataProviderClassesForOptions
{
  return (NSArray *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMetaDataProviderClassesForOptions:(id)a3
{
}

- (BOOL)metaDataProviderClassesForOptionsAreExclusive
{
  return self->_metaDataProviderClassesForOptionsAreExclusive;
}

- (void)setMetaDataProviderClassesForOptionsAreExclusive:(BOOL)a3
{
  self->_metaDataProviderClassesForOptionsAreExclusive = a3;
}

- (void).cxx_destruct
{
}

@end