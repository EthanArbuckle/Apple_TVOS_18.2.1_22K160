@interface DebugHierarchyPropertyActionLegacyV1
- (id)_serializePropertyDescription:(id)a3;
- (void)performInContext:(id)a3 withObject:(id)a4;
@end

@implementation DebugHierarchyPropertyActionLegacyV1

- (void)performInContext:(id)a3 withObject:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  if (-[DebugHierarchyPropertyAction isTargetingObject:](self, "isTargetingObject:", v6)
    && DBHIsInstanceOverridingNSObjectSelector(v6, (uint64_t)"debugHierarchyPropertyDescriptions"))
  {
    v27 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 debugHierarchyPropertyDescriptions]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
    id v31 = [v8 count];

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (!v9) {
      goto LABEL_27;
    }
    uint64_t v30 = *(void *)v37;
    while (1)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v36 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"propertyName"]);
        if (v31)
        {
          unsigned int v13 = -[DebugHierarchyPropertyAction propertyNamesAreExclusive](self, "propertyNamesAreExclusive");
          __int128 v34 = 0u;
          __int128 v35 = 0u;
          __int128 v32 = 0u;
          __int128 v33 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyPropertyAction propertyNames](self, "propertyNames"));
          id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v33;
LABEL_11:
            uint64_t v17 = 0LL;
            while (1)
            {
              if (*(void *)v33 != v16) {
                objc_enumerationMutation(v14);
              }
              if (v15 == (id)++v17)
              {
                id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
                if (v15) {
                  goto LABEL_11;
                }
                goto LABEL_17;
              }
            }

            unsigned __int8 v18 = -[DebugHierarchyPropertyAction propertyNamesAreExclusive](self, "propertyNamesAreExclusive");

            if ((v18 & 1) != 0) {
              goto LABEL_25;
            }
          }

          else
          {
LABEL_17:

            if (!v13) {
              goto LABEL_25;
            }
          }
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"propertyOptions"]);
        id v20 = [v19 unsignedIntegerValue];

        if (DebugHierarchyBitMaskComparison( (uint64_t)v20,  -[DebugHierarchyPropertyAction options](self, "options"),  -[DebugHierarchyPropertyAction optionsComparisonStyle](self, "optionsComparisonStyle"))
          && DBHIsInstanceOverridingNSObjectSelector(v27, (uint64_t)"debugHierarchyValueForPropertyWithName:"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v27 debugHierarchyValueForPropertyWithName:v12]);
          if (v21)
          {
            id v22 = [v11 mutableCopy];
            [v22 setObject:v21 forKeyedSubscript:@"propertyValue"];
            id v23 = [v22 copy];

            id v11 = v23;
          }
        }

        v24 = (void *)objc_claimAutoreleasedReturnValue( -[DebugHierarchyPropertyActionLegacyV1 _serializePropertyDescription:]( self,  "_serializePropertyDescription:",  v11));
        [v29 addObject:v24];

LABEL_25:
      }

      id v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (!v9)
      {
LABEL_27:

        id v25 = [v29 copy];
        [v26 addProperties:v25 toObject:v27];

        id v6 = v27;
        break;
      }
    }
  }
}

- (id)_serializePropertyDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  id v18 = 0LL;
  id v5 = DBGSerializePropertyDescriptionAsJSON(v4, &v18);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v18;

  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"propertyName"]);
    id v9 = (id)v8;
    v10 = @"<nil>";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v20[0] = &off_27608;
    v19[0] = @"fetchStatus";
    v19[1] = @"errorDescription";
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    v19[2] = @"propertyName";
    v20[1] = v12;
    v20[2] = v11;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
  }

  else
  {
    id v9 = [v6 mutableCopy];
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"propertyValue"]);

    if (v14) {
      uint64_t v15 = 4LL;
    }
    else {
      uint64_t v15 = 1LL;
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v15));
    [v9 setObject:v16 forKeyedSubscript:@"fetchStatus"];

    id v13 = [v9 copy];
  }

  return v13;
}

@end