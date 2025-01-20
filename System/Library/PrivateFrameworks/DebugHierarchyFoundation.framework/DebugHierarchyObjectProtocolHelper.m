@interface DebugHierarchyObjectProtocolHelper
+ (BOOL)classImplementsRequiredAdditionalGroupMethods:(Class)a3;
+ (BOOL)classImplementsRequiredChildGroupMethods:(Class)a3;
+ (BOOL)classImplements_debugHierarchyValueForPropertyWithName:(Class)a3;
+ (BOOL)classOverrides_debugHierarchyPropertyDescriptions:(Class)a3;
+ (BOOL)objectImplements_debugHierarchyVisibility:(id)a3;
+ (BOOL)v1_objectImplementsRequiredAdditionalGroupMethods:(id)a3;
+ (BOOL)v1_objectImplementsRequiredChildGroupMethods:(id)a3;
+ (id)childObjectsForObject:(id)a3 withType:(id)a4 outGroupingID:(id *)a5 outOptions:(id *)a6;
+ (id)debugHierarchyAdditionalGroupingIDsOfClass:(Class)a3;
+ (id)debugHierarchyChildGroupingIDOfClass:(Class)a3;
+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4 vendingClass:(Class)a5 onObject:(id)a6;
+ (id)debugHierarchyPropertyDescriptionsOfClass:(Class)a3;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 vendingClass:(Class)a5 outOptions:(id *)a6 outError:(id *)a7;
+ (int64_t)debugHierarchyVisibilityOfObject:(id)a3;
+ (void)enumerateAdditionalGroupsAndObjectsOfObject:(id)a3 withType:(id)a4 withBlock:(id)a5;
+ (void)updateDebugHierarchyValueForPropertyWithDescription:(id)a3 onObject:(id)a4;
@end

@implementation DebugHierarchyObjectProtocolHelper

+ (BOOL)classImplementsRequiredChildGroupMethods:(Class)a3
{
  int isClass = object_isClass(a3);
  if (isClass)
  {
    if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyChildGroupingID")
      && DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyObjectsInGroupWithID:onObject:outOptions:"))
    {
      LOBYTE(isClass) = 1;
    }

    else if ((objc_opt_respondsToSelector(a3, "fallback_debugHierarchyChildGroupingID") & 1) != 0)
    {
      LOBYTE(isClass) = objc_opt_respondsToSelector( a3,  "fallback_debugHierarchyObjectsInGroupWithID:onObject:outOptions:");
    }

    else
    {
      LOBYTE(isClass) = 0;
    }
  }

  return isClass & 1;
}

+ (BOOL)classImplementsRequiredAdditionalGroupMethods:(Class)a3
{
  int isClass = object_isClass(a3);
  if (isClass)
  {
    if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyAdditionalGroupingIDs")
      && DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyObjectsInGroupWithID:onObject:outOptions:"))
    {
      LOBYTE(isClass) = 1;
    }

    else if ((objc_opt_respondsToSelector(a3, "fallback_debugHierarchyAdditionalGroupingIDs") & 1) != 0)
    {
      LOBYTE(isClass) = objc_opt_respondsToSelector( a3,  "fallback_debugHierarchyObjectsInGroupWithID:onObject:outOptions:");
    }

    else
    {
      LOBYTE(isClass) = 0;
    }
  }

  return isClass & 1;
}

+ (BOOL)classImplements_debugHierarchyValueForPropertyWithName:(Class)a3
{
  int isClass = object_isClass(a3);
  if (isClass)
  {
    if ((objc_opt_respondsToSelector(a3, "debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:") & 1) != 0) {
      LOBYTE(isClass) = 1;
    }
    else {
      LOBYTE(isClass) = objc_opt_respondsToSelector( a3,  "fallback_debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:");
    }
  }

  return isClass & 1;
}

+ (BOOL)classOverrides_debugHierarchyPropertyDescriptions:(Class)a3
{
  else {
    return DBHIsClassOverridingSelector(a3, (uint64_t)"fallback_debugHierarchyPropertyDescriptions");
  }
}

+ (BOOL)objectImplements_debugHierarchyVisibility:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "debugHierarchyVisibility") & 1) != 0) {
    char v4 = 1;
  }
  else {
    char v4 = objc_opt_respondsToSelector(v3, "fallback_debugHierarchyVisibility");
  }

  return v4 & 1;
}

+ (int64_t)debugHierarchyVisibilityOfObject:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "debugHierarchyVisibility") & 1) != 0)
  {
    id v4 = [v3 debugHierarchyVisibility];
  }

  else
  {
    if ((objc_opt_respondsToSelector(v3, "fallback_debugHierarchyVisibility") & 1) == 0)
    {
      int64_t v5 = 1LL;
      goto LABEL_7;
    }

    id v4 = objc_msgSend(v3, "fallback_debugHierarchyVisibility");
  }

  int64_t v5 = (int64_t)v4;
LABEL_7:

  return v5;
}

+ (id)debugHierarchyChildGroupingIDOfClass:(Class)a3
{
  if (DBHIsClassOverridingSelector(a3, (uint64_t)"debugHierarchyChildGroupingID"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class debugHierarchyChildGroupingID](a3, "debugHierarchyChildGroupingID"));
  }

  else if (DBHIsClassOverridingSelector(a3, (uint64_t)"fallback_debugHierarchyChildGroupingID"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class fallback_debugHierarchyChildGroupingID](a3, "fallback_debugHierarchyChildGroupingID"));
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)debugHierarchyAdditionalGroupingIDsOfClass:(Class)a3
{
  if (DBHIsClassOverridingSelector(a3, (uint64_t)"debugHierarchyAdditionalGroupingIDs"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class debugHierarchyAdditionalGroupingIDs](a3, "debugHierarchyAdditionalGroupingIDs"));
  }

  else if (DBHIsClassOverridingSelector(a3, (uint64_t)"fallback_debugHierarchyAdditionalGroupingIDs"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class fallback_debugHierarchyAdditionalGroupingIDs]( a3,  "fallback_debugHierarchyAdditionalGroupingIDs"));
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 outOptions:(id *)a4 vendingClass:(Class)a5 onObject:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if ((objc_opt_respondsToSelector(a5, "debugHierarchyObjectsInGroupWithID:onObject:outOptions:") & 1) != 0)
  {
    v17 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class debugHierarchyObjectsInGroupWithID:onObject:outOptions:]( a5,  "debugHierarchyObjectsInGroupWithID:onObject:outOptions:",  v9,  v10,  &v17));
    v12 = v17;
  }

  else if ((objc_opt_respondsToSelector(a5, "fallback_debugHierarchyObjectsInGroupWithID:onObject:outOptions:") & 1) != 0)
  {
    v16 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class fallback_debugHierarchyObjectsInGroupWithID:onObject:outOptions:]( a5,  "fallback_debugHierarchyObjectsInGroupWithID:onObject:outOptions:",  v9,  v10,  &v16));
    v12 = v16;
  }

  else
  {
    if ((objc_opt_respondsToSelector(v10, "debugHierarchyObjectsInGroupWithID:outOptions:") & 1) == 0)
    {
      id v13 = 0LL;
      v11 = 0LL;
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    v15 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 debugHierarchyObjectsInGroupWithID:v9 outOptions:&v15]);
    v12 = v15;
  }

  id v13 = v12;
  if (a4) {
LABEL_8:
  }
    *a4 = v13;
LABEL_9:

  return v11;
}

+ (id)debugHierarchyPropertyDescriptionsOfClass:(Class)a3
{
  if (DBHIsClassOverridingNSObjectSelector(a3, (uint64_t)"debugHierarchyPropertyDescriptions"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class debugHierarchyPropertyDescriptions](a3, "debugHierarchyPropertyDescriptions"));
  }

  else if ((objc_opt_respondsToSelector(a3, "fallback_debugHierarchyPropertyDescriptions") & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class fallback_debugHierarchyPropertyDescriptions]( a3,  "fallback_debugHierarchyPropertyDescriptions"));
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 vendingClass:(Class)a5 outOptions:(id *)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  if ((objc_opt_respondsToSelector(a5, "debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:") & 1) != 0)
  {
    v21 = 0LL;
    id v22 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:]( a5,  "debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:",  v11,  v12,  &v22,  &v21));
    id v14 = v22;
    v15 = v21;
    goto LABEL_5;
  }

  if ((objc_opt_respondsToSelector(a5, "fallback_debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:") & 1) != 0)
  {
    v19 = 0LL;
    id v20 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class fallback_debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:]( a5,  "fallback_debugHierarchyValueForPropertyWithName:onObject:outOptions:outError:",  v11,  v12,  &v20,  &v19));
    id v14 = v20;
    v15 = v19;
LABEL_5:
    id v16 = v15;
    if (!a7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if ((objc_opt_respondsToSelector(v12, "debugHierarchyValueForPropertyWithName:") & 1) != 0) {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 debugHierarchyValueForPropertyWithName:v11]);
  }
  else {
    id v13 = 0LL;
  }
  id v14 = 0LL;
  id v16 = 0LL;
  if (!a7) {
    goto LABEL_7;
  }
LABEL_6:
  *a7 = v16;
LABEL_7:
  if (a6) {
    *a6 = v14;
  }
  id v17 = v13;

  return v17;
}

+ (void)updateDebugHierarchyValueForPropertyWithDescription:(id)a3 onObject:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v7 = (void *)objc_opt_class(v5, v6);
  if ((objc_opt_respondsToSelector(v7, "updateDebugHierarchyValueForPropertyWithDescription:onObject:") & 1) != 0)
  {
    [v7 updateDebugHierarchyValueForPropertyWithDescription:v8 onObject:v5];
  }

  else if ((objc_opt_respondsToSelector(v7, "fallback_updateDebugHierarchyValueForPropertyWithDescription:onObject:") & 1) != 0)
  {
    objc_msgSend(v7, "fallback_updateDebugHierarchyValueForPropertyWithDescription:onObject:", v8, v5);
  }
}

+ (id)childObjectsForObject:(id)a3 withType:(id)a4 outGroupingID:(id *)a5 outOptions:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (+[DebugHierarchyObjectProtocolHelper v1_objectImplementsRequiredChildGroupMethods:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "v1_objectImplementsRequiredChildGroupMethods:",  v9))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 debugHierarchyChildGroupingID]);
    id v21 = 0LL;
    Class v13 = (Class)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:",  v12,  &v21,  0LL,  v9));
    id v14 = v21;
    v15 = v12;
    if (v13) {
      goto LABEL_9;
    }
  }

  else
  {
    id v12 = 0LL;
    id v14 = 0LL;
  }

  if (+[DebugHierarchyObjectProtocolHelper classImplementsRequiredChildGroupMethods:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "classImplementsRequiredChildGroupMethods:",  objc_opt_class(v9, v11)))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 closestTypeVendingAChildGroupingID]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v16 childGroupingID]);

    id v17 = (NSString *)objc_claimAutoreleasedReturnValue([v16 name]);
    Class v13 = NSClassFromString(v17);

    if (v13)
    {
      id v20 = v14;
      Class v13 = (Class)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:",  v15,  &v20,  v13,  v9));
      id v18 = v20;

      id v14 = v18;
    }

LABEL_9:
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  Class v13 = 0LL;
  v15 = v12;
  if (a5) {
LABEL_10:
  }
    *a5 = v15;
LABEL_11:
  if (a6) {
    *a6 = v14;
  }

  return v13;
}

+ (void)enumerateAdditionalGroupsAndObjectsOfObject:(id)a3 withType:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v30 = a4;
  id v8 = (void (**)(id, void, void *, id))a5;
  if (+[DebugHierarchyObjectProtocolHelper classImplementsRequiredAdditionalGroupMethods:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "classImplementsRequiredAdditionalGroupMethods:",  objc_opt_class(v7, v9)))
  {
    id v10 = v30;
    if (v10)
    {
      do
      {
        v31 = v10;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 additionalGroupingIDs]);
        BOOL v12 = [v11 count] == 0;

        if (!v12)
        {
          Class v13 = (NSString *)objc_claimAutoreleasedReturnValue([v31 name]);
          Class v14 = NSClassFromString(v13);

          __int128 v40 = 0u;
          __int128 v41 = 0u;
          __int128 v38 = 0u;
          __int128 v39 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v31 additionalGroupingIDs]);
          id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v39;
            do
            {
              id v18 = 0LL;
              do
              {
                if (*(void *)v39 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)v18);
                id v37 = 0LL;
                id v20 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:",  v19,  &v37,  v14,  v7));
                id v21 = v37;
                v8[2](v8, v19, v20, v21);

                id v18 = (char *)v18 + 1;
              }

              while (v16 != v18);
              id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
            }

            while (v16);
          }
        }

        uint64_t v22 = objc_claimAutoreleasedReturnValue([v31 parentType]);

        id v10 = (id)v22;
      }

      while (v22);
    }
  }

  if (+[DebugHierarchyObjectProtocolHelper v1_objectImplementsRequiredAdditionalGroupMethods:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "v1_objectImplementsRequiredAdditionalGroupMethods:",  v7))
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v23 = (id)objc_claimAutoreleasedReturnValue([v7 debugHierarchyAdditionalGroupingIDs]);
    id v24 = [v23 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        v26 = 0LL;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v26);
          id v32 = 0LL;
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[DebugHierarchyObjectProtocolHelper debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:]( &OBJC_CLASS___DebugHierarchyObjectProtocolHelper,  "debugHierarchyObjectsInGroupWithID:outOptions:vendingClass:onObject:",  v27,  &v32,  0LL,  v7));
          id v29 = v32;
          v8[2](v8, v27, v28, v29);

          v26 = (char *)v26 + 1;
        }

        while (v24 != v26);
        id v24 = [v23 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }

      while (v24);
    }
  }
}

+ (BOOL)v1_objectImplementsRequiredChildGroupMethods:(id)a3
{
  id v3 = a3;

  return v4;
}

+ (BOOL)v1_objectImplementsRequiredAdditionalGroupMethods:(id)a3
{
  id v3 = a3;

  return v4;
}

@end