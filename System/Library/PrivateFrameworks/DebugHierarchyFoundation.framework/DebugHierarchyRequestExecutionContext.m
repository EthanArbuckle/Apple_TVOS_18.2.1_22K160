@interface DebugHierarchyRequestExecutionContext
+ (id)contextWithRequest:(id)a3;
- (BOOL)hasAlreadyFetchedDebugHierarchyObject:(id)a3;
- (DebugHierarchyRequest)request;
- (DebugHierarchyRequestExecutionContext)initWithRequest:(id)a3;
- (DebugHierarchyRuntimeInfo)contextRuntimeInfo;
- (NSMutableDictionary)identifierToObjectDescriptionMap;
- (NSMutableDictionary)metaData;
- (NSMutableDictionary)topLevelGroups;
- (NSMutableDictionary)topLevelPropertyDescriptions;
- (id)globalRuntimeInfo;
- (id)recursiveDescription;
- (id)requestResponse;
- (id)runtimeTypeWithName:(id)a3;
- (void)_addDebugHierarchyObject:(id)a3 withDict:(id)a4 toTopLevelGroupWithID:(id)a5;
- (void)_addDebugHierarchyObjectDict:(id)a3 toGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6;
- (void)_collectRuntimeInformationForObjectType:(id)a3;
- (void)addDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 fetchStatus:(int64_t)a5 toGroupWithID:(id)a6 asDirectChild:(BOOL)a7 belowParent:(id)a8;
- (void)addProperties:(id)a3 toObject:(id)a4;
- (void)addReferencedDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 toGroupWithID:(id)a5 asDirectChild:(BOOL)a6 belowParent:(id)a7;
- (void)logRequestErrorWithTitle:(id)a3 message:(id)a4 fromMethod:(const char *)a5;
- (void)setContextRuntimeInfo:(id)a3;
- (void)setIdentifierToObjectDescriptionMap:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setRequest:(id)a3;
- (void)setTopLevelGroups:(id)a3;
- (void)setTopLevelPropertyDescriptions:(id)a3;
@end

@implementation DebugHierarchyRequestExecutionContext

+ (id)contextWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithRequest:v4];

  return v5;
}

- (DebugHierarchyRequestExecutionContext)initWithRequest:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DebugHierarchyRequestExecutionContext;
  v6 = -[DebugHierarchyRequestExecutionContext init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    topLevelGroups = v7->_topLevelGroups;
    v7->_topLevelGroups = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    topLevelPropertyDescriptions = v7->_topLevelPropertyDescriptions;
    v7->_topLevelPropertyDescriptions = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    identifierToObjectDescriptionMap = v7->_identifierToObjectDescriptionMap;
    v7->_identifierToObjectDescriptionMap = (NSMutableDictionary *)v12;

    v14 = objc_alloc_init(&OBJC_CLASS___DebugHierarchyRuntimeInfo);
    contextRuntimeInfo = v7->_contextRuntimeInfo;
    v7->_contextRuntimeInfo = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    metaData = v7->_metaData;
    v7->_metaData = (NSMutableDictionary *)v16;
  }

  return v7;
}

- (BOOL)hasAlreadyFetchedDebugHierarchyObject:(id)a3
{
  if (a3) {
    id v4 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", a3);
  }
  else {
    id v4 = 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutionContext identifierToObjectDescriptionMap]( self,  "identifierToObjectDescriptionMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  BOOL v7 = v6 != 0LL;

  return v7;
}

- (void)addDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 fetchStatus:(int64_t)a5 toGroupWithID:(id)a6 asDirectChild:(BOOL)a7 belowParent:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  if (v14)
  {
    BOOL v27 = a7;
    v17 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v14);
    objc_super v19 = (objc_class *)objc_opt_class(v14, v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[DebugHierarchyRequestExecutionContext _collectRuntimeInformationForObjectType:]( self,  "_collectRuntimeInformationForObjectType:",  v14);
    v28[0] = @"objectID";
    v28[1] = @"className";
    v29[0] = v17;
    v29[1] = v21;
    v28[2] = @"fetchStatus";
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a5));
    v29[2] = v22;
    v28[3] = @"visibility";
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a4));
    v29[3] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  4LL));

    id v25 = [v24 mutableCopy];
    if (v16)
    {
      if (v27)
      {
        -[DebugHierarchyRequestExecutionContext _addDebugHierarchyObjectDict:toGroupWithID:asDirectChild:belowParent:]( self,  "_addDebugHierarchyObjectDict:toGroupWithID:asDirectChild:belowParent:",  v25,  v15,  1LL,  v16);
      }

      else
      {
        -[DebugHierarchyRequestExecutionContext _addDebugHierarchyObject:withDict:toTopLevelGroupWithID:]( self,  "_addDebugHierarchyObject:withDict:toTopLevelGroupWithID:",  v14,  v25,  v15);
        -[DebugHierarchyRequestExecutionContext addReferencedDebugHierarchyObject:withVisibility:toGroupWithID:asDirectChild:belowParent:]( self,  "addReferencedDebugHierarchyObject:withVisibility:toGroupWithID:asDirectChild:belowParent:",  v14,  a4,  v15,  0LL,  v16);
      }
    }

    else
    {
      -[DebugHierarchyRequestExecutionContext _addDebugHierarchyObject:withDict:toTopLevelGroupWithID:]( self,  "_addDebugHierarchyObject:withDict:toTopLevelGroupWithID:",  v14,  v25,  v15);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutionContext identifierToObjectDescriptionMap]( self,  "identifierToObjectDescriptionMap"));
    [v26 setObject:v25 forKeyedSubscript:v17];
  }

  else
  {
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DebugHierarchyObject must not be nil. Will be ignored."));
    -[DebugHierarchyRequestExecutionContext logRequestErrorWithTitle:message:fromMethod:]( self,  "logRequestErrorWithTitle:message:fromMethod:",  @"Unexpected nil object.",  v17,  "-[DebugHierarchyRequestExecutionContext addDebugHierarchyObject:withVisibility:fetchStatus:toGroupWithID:asDirectC hild:belowParent:]");
  }
}

- (void)addReferencedDebugHierarchyObject:(id)a3 withVisibility:(int64_t)a4 toGroupWithID:(id)a5 asDirectChild:(BOOL)a6 belowParent:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  if (a3) {
    a3 = (id)CFStringCreateWithFormat(0LL, 0LL, @"%p", a3);
  }
  v17[0] = a3;
  v16[0] = @"objectID";
  v16[1] = @"propertyVisibility";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a4));
  v16[2] = @"propertyLogicalType";
  v17[1] = v14;
  v17[2] = @"DebugHierarchyLogicalPropertyTypePointer";
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));

  -[DebugHierarchyRequestExecutionContext _addDebugHierarchyObjectDict:toGroupWithID:asDirectChild:belowParent:]( self,  "_addDebugHierarchyObjectDict:toGroupWithID:asDirectChild:belowParent:",  v15,  v12,  v8,  v13);
}

- (void)_addDebugHierarchyObject:(id)a3 withDict:(id)a4 toTopLevelGroupWithID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext topLevelGroups](self, "topLevelGroups"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"debugHierarchyObjects"]);
    [v13 addObject:v9];
    id v15 = (objc_class *)objc_opt_class(v8, v14);
    id v16 = v15;
    if (v15)
    {
      if (object_isClass(v15))
      {
        v17 = NSStringFromClass(v16);
        id v16 = (objc_class *)objc_claimAutoreleasedReturnValue(v17);
      }

      else
      {
        id v16 = 0LL;
      }
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext runtimeTypeWithName:](self, "runtimeTypeWithName:", v16));

    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 closestTypeVendingAChildGroupingID]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 childGroupingID]);
    id v24 = [v23 length];

    if (v24)
    {
      id v25 = (NSString *)objc_claimAutoreleasedReturnValue([v22 name]);
      Class v26 = NSClassFromString(v25);

      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v22 childGroupingID]);
      uint64_t v62 = 0LL;
      id v24 = (id)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:",  v27,  &v62,  v26,  v8));
    }

    if ([v24 count])
    {
      id v52 = v12;
      id v53 = v8;
      v54 = v10;
      v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v24 count]));
      id v60 = v24;
      if ([v24 count])
      {
        v28 = v24;
        unint64_t v29 = 0LL;
        do
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:v29]);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v29));
          if (v30) {
            v32 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v30);
          }
          else {
            v32 = 0LL;
          }
          [v61 setObject:v31 forKeyedSubscript:v32];

          ++v29;
          v28 = v24;
        }

        while ((unint64_t)[v24 count] > v29);
      }

      v51 = v21;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet"));
      if ([v13 count])
      {
        unint64_t v33 = 0LL;
        v56 = v22;
        id v57 = v9;
        v55 = v13;
        do
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v33]);
          v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:@"objectID"]);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v35]);
          v37 = v36;
          if (v36)
          {
            id v38 = [v36 unsignedIntegerValue];
            v39 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"childGroup"]);
            if (v39)
            {
              v40 = v39;
              v59 = v35;
              v41 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"debugHierarchyObjects"]);
              if ([v41 count])
              {
                unint64_t v42 = 0LL;
                while (1)
                {
                  v43 = (void *)objc_claimAutoreleasedReturnValue([v41 objectAtIndexedSubscript:v42]);
                  v44 = (void *)objc_claimAutoreleasedReturnValue([v43 objectForKeyedSubscript:@"objectID"]);
                  v45 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKeyedSubscript:v44]);

                  id v46 = [v45 unsignedIntegerValue];
                  if (v46 > v38) {
                    break;
                  }
                }

                id v49 = [v41 count];
                else {
                  id v50 = (id)v42;
                }
                [v41 insertObject:v34 atIndex:v50];
              }

              else
              {
LABEL_24:
                [v41 addObject:v34];
              }

              id v13 = v55;
              v35 = v59;

              v22 = v56;
              id v9 = v57;
            }

            else
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v34));
              id v48 = DBGGroupDict(v54, v47);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v48);

              [v9 setObject:v40 forKeyedSubscript:@"childGroup"];
            }

            [v58 addIndex:v33];
          }

          ++v33;
        }

        while ((unint64_t)[v13 count] > v33);
      }

      [v13 removeObjectsAtIndexes:v58];

      id v8 = v53;
      id v10 = v54;
      v21 = v51;
      id v12 = v52;
      id v24 = v60;
    }
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v9));
    id v18 = DBGGroupDict(v10, v13);
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v12 = [v19 mutableCopy];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext topLevelGroups](self, "topLevelGroups"));
    [v20 setObject:v12 forKeyedSubscript:v10];
  }
}

- (void)_addDebugHierarchyObjectDict:(id)a3 toGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v12) {
    uint64_t v14 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v12);
  }
  else {
    uint64_t v14 = 0LL;
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutionContext identifierToObjectDescriptionMap]( self,  "identifierToObjectDescriptionMap"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

  if (v16)
  {
    if (v7)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"childGroup"]);
      id v19 = (id)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"debugHierarchyObjects"]);
      if (!v17)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v10));

        id v35 = DBGGroupDict(v11, v34);
        id v17 = (id)objc_claimAutoreleasedReturnValue(v35);
        [v16 setObject:v17 forKeyedSubscript:@"childGroup"];
        id v19 = v34;
LABEL_48:

        goto LABEL_49;
      }

      v20 = (objc_class *)objc_opt_class(v13, v18);
      v21 = v20;
      if (v20)
      {
        if (object_isClass(v20))
        {
          v22 = NSStringFromClass(v21);
          v21 = (objc_class *)objc_claimAutoreleasedReturnValue(v22);
        }

        else
        {
          v21 = 0LL;
        }
      }

      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext runtimeTypeWithName:](self, "runtimeTypeWithName:", v21));

      v37 = (void *)objc_claimAutoreleasedReturnValue([v33 closestTypeVendingAChildGroupingID]);
      id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 childGroupingID]);
      v56 = v38;
      if ([v38 length])
      {
        id v53 = v37;
        v54 = v33;
        v58 = v16;
        id v60 = v14;
        v39 = (NSString *)objc_claimAutoreleasedReturnValue([v37 name]);
        Class v40 = NSClassFromString(v39);

        id v65 = 0LL;
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:",  v38,  &v65,  v40,  v13));
        id v42 = v65;
        v43 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"objectID"]);
        if ([v41 count])
        {
          id v51 = v42;
          id v52 = v17;
          unint64_t v44 = 0LL;
          while (1)
          {
            uint64_t v45 = objc_claimAutoreleasedReturnValue([v41 objectAtIndexedSubscript:v44]);
            id v46 = (void *)v45;
            v47 = v45 ? (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v45) : 0LL;
            unsigned int v48 = -[__CFString isEqualToString:](v47, "isEqualToString:", v43);

            if (v48) {
              break;
            }
            if ((unint64_t)[v41 count] <= ++v44)
            {
              unint64_t v44 = 0LL;
              break;
            }
          }

          id v17 = v52;
          id v42 = v51;
        }

        else
        {
          unint64_t v44 = 0LL;
        }

        id v16 = v58;
        uint64_t v14 = v60;
        v37 = v53;
        unint64_t v33 = v54;
      }

      else
      {
        unint64_t v44 = 0LL;
      }

      id v49 = [v19 count];
      else {
        id v50 = (id)v44;
      }
      [v19 insertObject:v10 atIndex:v50];

LABEL_47:
      goto LABEL_48;
    }

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"additionalGroups"]);
    id v25 = &CFArrayCreate_ptr;
    if (v24)
    {
      id v57 = v16;
      v59 = v14;
      id v55 = v10;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      id v17 = v24;
      id v26 = [v17 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v62;
LABEL_14:
        uint64_t v29 = 0LL;
        while (1)
        {
          if (*(void *)v62 != v28) {
            objc_enumerationMutation(v17);
          }
          v30 = *(void **)(*((void *)&v61 + 1) + 8 * v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:@"groupingID"]);
          unsigned __int8 v32 = [v31 isEqualToString:v11];

          if ((v32 & 1) != 0) {
            break;
          }
          if (v27 == (id)++v29)
          {
            id v27 = [v17 countByEnumeratingWithState:&v61 objects:v66 count:16];
            if (v27) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }

        id v19 = v30;

        if (!v19) {
          goto LABEL_23;
        }
        unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"debugHierarchyObjects"]);
        id v10 = v55;
        [v33 addObject:v55];
        id v16 = v57;
        uint64_t v14 = v59;
        goto LABEL_27;
      }

- (void)addProperties:(id)a3 toObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if (v7) {
      id v8 = (__CFString *)CFStringCreateWithFormat(0LL, 0LL, @"%p", v7);
    }
    else {
      id v8 = 0LL;
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutionContext identifierToObjectDescriptionMap]( self,  "identifierToObjectDescriptionMap"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

    if (v10)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"properties"]);
      if ([v11 count]) {
        id v12 = (id)objc_claimAutoreleasedReturnValue([v11 arrayByAddingObjectsFromArray:v6]);
      }
      else {
        id v12 = v6;
      }
      v22 = v12;

      [v10 setObject:v22 forKeyedSubscript:@"properties"];
    }

    else
    {
      id v23 = v7;
      id v13 = v8;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v24 = v6;
      id obj = v6;
      id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"propertyName"]);
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v13,  v19));

            v21 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutionContext topLevelPropertyDescriptions]( self,  "topLevelPropertyDescriptions"));
            [v21 setObject:v18 forKeyedSubscript:v20];
          }

          id v15 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }

        while (v15);
      }

      id v7 = v23;
      id v6 = v24;
      id v8 = v13;
      id v10 = 0LL;
    }
  }
}

- (void)logRequestErrorWithTitle:(id)a3 message:(id)a4 fromMethod:(const char *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a5,  4LL));
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[DebugHierarchyLogEntry errorLogEntryWithTitle:message:methodSignature:]( &OBJC_CLASS___DebugHierarchyLogEntry,  "errorLogEntryWithTitle:message:methodSignature:",  v9,  v8,  v10));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext request](self, "request"));
  [v11 addLogEntry:v12];
}

- (id)requestResponse
{
  v13[0] = @"version";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 2.0));
  v14[0] = v3;
  v13[1] = @"request";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext request](self, "request"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dictionaryRepresentation]);
  v14[1] = v5;
  v13[2] = @"metaData";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext metaData](self, "metaData"));
  v14[2] = v6;
  v13[3] = @"classInformation";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext contextRuntimeInfo](self, "contextRuntimeInfo"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 serializedRepresentation]);
  v14[3] = v8;
  v13[4] = @"topLevelGroups";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext topLevelGroups](self, "topLevelGroups"));
  v14[4] = v9;
  v13[5] = @"topLevelPropertyDescriptions";
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyRequestExecutionContext topLevelPropertyDescriptions]( self,  "topLevelPropertyDescriptions"));
  v14[5] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  6LL));

  return v11;
}

- (id)recursiveDescription
{
  id v6 = @"topLevelGroups";
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext topLevelGroups](self, "topLevelGroups"));
  id v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 generateJSONStringWithError:0]);

  return v4;
}

- (id)globalRuntimeInfo
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugHierarchyTargetHub sharedHub](&OBJC_CLASS___DebugHierarchyTargetHub, "sharedHub"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 runtimeInfo]);

  return v3;
}

- (id)runtimeTypeWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext contextRuntimeInfo](self, "contextRuntimeInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 typeWithName:v4]);

  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext globalRuntimeInfo](self, "globalRuntimeInfo"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v7 typeWithName:v4]);
  }

  return v6;
}

- (void)_collectRuntimeInformationForObjectType:(id)a3
{
  id v4 = a3;
  id v6 = (objc_class *)objc_opt_class(v4, v5);
  if (v6 && (id v7 = v6, object_isClass(v6)))
  {
    id v8 = NSStringFromClass(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext globalRuntimeInfo](self, "globalRuntimeInfo"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 typeWithName:v9]);
  if (v11)
  {
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext contextRuntimeInfo](self, "contextRuntimeInfo"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 typeWithName:v9]);

    if (!v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      uint64_t v16 = objc_opt_class(v4, v15);
      if (v16)
      {
        id v17 = (void *)v16;
        unsigned int v18 = 0;
        do
        {
          [v14 addObject:v17];
          id v19 = [v17 superclass];
          if (!v19) {
            break;
          }
          id v17 = v19;
        }

        while (v18++ < 0x3E7);
      }

      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v14 reverseObjectEnumerator]);
      id v22 = [v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v22)
      {
        id v23 = v22;
        id v42 = v14;
        v43 = v9;
        id v44 = v4;
        uint64_t v45 = v21;
        id v24 = 0LL;
        uint64_t v50 = *(void *)v56;
        id v46 = self;
        do
        {
          id v25 = 0LL;
          id v47 = v23;
          do
          {
            if (*(void *)v56 != v50) {
              objc_enumerationMutation(v21);
            }
            __int128 v26 = *(objc_class **)(*((void *)&v55 + 1) + 8LL * (void)v25);
            if (v26 && object_isClass(*(id *)(*((void *)&v55 + 1) + 8LL * (void)v25)))
            {
              __int128 v27 = NSStringFromClass(v26);
              __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            }

            else
            {
              __int128 v28 = 0LL;
            }

            __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext contextRuntimeInfo](self, "contextRuntimeInfo"));
            v30 = (void *)objc_claimAutoreleasedReturnValue([v29 typeWithName:v28]);

            if (v30)
            {
              v31 = v24;
              id v24 = v30;
            }

            else
            {
              id v49 = v28;
              unsigned __int8 v32 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyRuntimeType typeWithName:]( &OBJC_CLASS___DebugHierarchyRuntimeType,  "typeWithName:",  v28));
              unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyChildGroupingIDOfClass:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyChildGroupingIDOfClass:",  v26));
              [v32 setChildGroupingID:v33];

              v34 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyAdditionalGroupingIDsOfClass:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyAdditionalGroupingIDsOfClass:",  v26));
              [v32 setAdditionalGroupingIDs:v34];

              v31 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectInterface propertyDescriptionsForClass:inContext:]( &OBJC_CLASS___DebugHierarchyObjectInterface,  "propertyDescriptionsForClass:inContext:",  v26,  self));
              if ([v31 count])
              {
                id v48 = v24;
                __int128 v53 = 0u;
                __int128 v54 = 0u;
                __int128 v51 = 0u;
                __int128 v52 = 0u;
                id v35 = v31;
                id v36 = [v35 countByEnumeratingWithState:&v51 objects:v59 count:16];
                if (v36)
                {
                  id v37 = v36;
                  uint64_t v38 = *(void *)v52;
                  do
                  {
                    for (i = 0LL; i != v37; i = (char *)i + 1)
                    {
                      if (*(void *)v52 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      Class v40 = -[DebugHierarchyProperty initWithPropertyDescription:]( objc_alloc(&OBJC_CLASS___DebugHierarchyProperty),  "initWithPropertyDescription:",  *(void *)(*((void *)&v51 + 1) + 8LL * (void)i));
                      [v32 addInstanceProperty:v40];
                    }

                    id v37 = [v35 countByEnumeratingWithState:&v51 objects:v59 count:16];
                  }

                  while (v37);
                }

                v21 = v45;
                self = v46;
                id v24 = v48;
              }

              v41 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyRequestExecutionContext contextRuntimeInfo](self, "contextRuntimeInfo"));
              [v41 addType:v32 toParentType:v24];

              id v24 = v32;
              id v23 = v47;
              __int128 v28 = v49;
            }

            id v25 = (char *)v25 + 1;
          }

          while (v25 != v23);
          id v23 = [v21 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }

        while (v23);

        id v9 = v43;
        id v4 = v44;
        id v14 = v42;
      }
    }
  }
}

- (DebugHierarchyRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSMutableDictionary)topLevelGroups
{
  return self->_topLevelGroups;
}

- (void)setTopLevelGroups:(id)a3
{
}

- (NSMutableDictionary)topLevelPropertyDescriptions
{
  return self->_topLevelPropertyDescriptions;
}

- (void)setTopLevelPropertyDescriptions:(id)a3
{
}

- (NSMutableDictionary)identifierToObjectDescriptionMap
{
  return self->_identifierToObjectDescriptionMap;
}

- (void)setIdentifierToObjectDescriptionMap:(id)a3
{
}

- (DebugHierarchyRuntimeInfo)contextRuntimeInfo
{
  return self->_contextRuntimeInfo;
}

- (void)setContextRuntimeInfo:(id)a3
{
}

- (NSMutableDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end