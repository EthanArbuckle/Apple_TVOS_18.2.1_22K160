@interface VSSPDeserializer
+ (id)propertyNamesOfClass:(Class)a3;
- (id)propertyNames;
- (id)toJSONDictionary;
@end

@implementation VSSPDeserializer

- (id)toJSONDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[VSSPDeserializer propertyNames](self, "propertyNames"));
  id v4 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v59;
    uint64_t v44 = *(void *)v59;
    v45 = self;
    v43 = v3;
    do
    {
      v7 = 0LL;
      id v46 = v5;
      do
      {
        if (*(void *)v59 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSSPDeserializer valueForKey:](self, "valueForKey:", v8));
        if ([v9 conformsToProtocol:&OBJC_PROTOCOL___VSSPDeserializable])
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 toJSONDictionary]);
          goto LABEL_8;
        }

        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
        if ((objc_opt_isKindOfClass(v9, v13) & 1) != 0)
        {
          uint64_t v48 = v8;
          v49 = v7;
          id v15 = v9;
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v15 count]));
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          __int128 v57 = 0u;
          id v17 = v15;
          id v18 = [v17 countByEnumeratingWithState:&v54 objects:v63 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v55;
            do
            {
              for (i = 0LL; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v55 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8LL * (void)i);
                v23 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v22]);
                if ([v23 conformsToProtocol:&OBJC_PROTOCOL___VSSPDeserializable])
                {
                  uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 toJSONDictionary]);

                  v23 = (void *)v24;
                }

                if (v22) {
                  BOOL v25 = v23 == 0LL;
                }
                else {
                  BOOL v25 = 1;
                }
                if (!v25) {
                  [v16 setObject:v23 forKey:v22];
                }
              }

              id v19 = [v17 countByEnumeratingWithState:&v54 objects:v63 count:16];
            }

            while (v19);
          }

          id v12 = [v16 copy];
          v3 = v43;
          goto LABEL_38;
        }

        uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray, v14);
        if ((objc_opt_isKindOfClass(v9, v26) & 1) != 0)
        {
          uint64_t v48 = v8;
          v49 = v7;
          id v28 = v9;
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v28 count]));
          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          id v30 = v28;
          id v31 = [v30 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v51;
            do
            {
              for (j = 0LL; j != v32; j = (char *)j + 1)
              {
                if (*(void *)v51 != v33) {
                  objc_enumerationMutation(v30);
                }
                id v35 = *(id *)(*((void *)&v50 + 1) + 8LL * (void)j);
                if ([v35 conformsToProtocol:&OBJC_PROTOCOL___VSSPDeserializable])
                {
                  uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 toJSONDictionary]);

                  id v35 = (id)v36;
                }

                if (v35) {
                  [v29 addObject:v35];
                }
              }

              id v32 = [v30 countByEnumeratingWithState:&v50 objects:v62 count:16];
            }

            while (v32);
          }

          id v12 = [v29 copy];
LABEL_38:
          self = v45;
          id v5 = v46;
          uint64_t v6 = v44;
          uint64_t v8 = v48;
          v7 = v49;
LABEL_39:

          v9 = v12;
          goto LABEL_40;
        }

        uint64_t v37 = objc_opt_class(&OBJC_CLASS___NSURL, v27);
        if ((objc_opt_isKindOfClass(v9, v37) & 1) != 0)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 absoluteString]);
LABEL_8:
          id v12 = (id)v11;
          goto LABEL_39;
        }

        uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSNumber, v38);
        if ((objc_opt_isKindOfClass(v9, v39) & 1) != 0)
        {
          uint64_t v11 = objc_claimAutoreleasedReturnValue([v9 stringValue]);
          goto LABEL_8;
        }

- (id)propertyNames
{
  uint64_t v2 = objc_opt_class(self, a2);
  return +[VSSPDeserializer propertyNamesOfClass:](&OBJC_CLASS___VSSPDeserializer, "propertyNamesOfClass:", v2);
}

+ (id)propertyNamesOfClass:(Class)a3
{
  v3 = class_copyPropertyList(a3, &outCount);
  id v4 = objc_alloc(&OBJC_CLASS___NSMutableSet);
  id v5 = -[NSMutableSet initWithCapacity:](v4, "initWithCapacity:", outCount);
  if (outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      v7 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  property_getName(v3[i]),  4LL);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      -[NSMutableSet addObject:](v5, "addObject:", v8);
    }
  }

  free(v3);
  id v9 = -[NSMutableSet copy](v5, "copy");

  return v9;
}

@end