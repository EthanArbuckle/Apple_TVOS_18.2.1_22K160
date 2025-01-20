@interface NSDictionary
- (BOOL)aap_BOOLValueForKey:(id)a3;
- (id)aap_arrayValueForKey:(id)a3 expectedContainingObjectsType:(Class)a4;
- (id)aap_stringValueForKey:(id)a3;
@end

@implementation NSDictionary

- (BOOL)aap_BOOLValueForKey:(id)a3
{
  id v3 = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (!v3) {
    return [v3 BOOLValue];
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    return [v3 BOOLValue];
  }
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
    sub_122FC();
  }
  return 0;
}

- (id)aap_stringValueForKey:(id)a3
{
  id v3 = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (v3)
  {
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_12368();
      }
      return 0LL;
    }
  }

  return v3;
}

- (id)aap_arrayValueForKey:(id)a3 expectedContainingObjectsType:(Class)a4
{
  id result = -[NSDictionary objectForKey:](self, "objectForKey:");
  if (result)
  {
    id v7 = result;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v7 count]);
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v10 = [v7 countByEnumeratingWithState:&v17 objects:v29 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v7);
            }
            uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
            if ((objc_opt_isKindOfClass(v14, a4) & 1) != 0)
            {
              -[NSMutableArray addObject:](v9, "addObject:", v14);
            }

            else
            {
              v15 = (os_log_s *)AFSiriLogContextPlugin;
              if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
              {
                v16 = NSStringFromClass(a4);
                *(_DWORD *)buf = 136315906;
                v22 = "-[NSDictionary(AAPIntentsInfoSync) aap_arrayValueForKey:expectedContainingObjectsType:]";
                __int16 v23 = 2114;
                id v24 = a3;
                __int16 v25 = 2114;
                v26 = v16;
                __int16 v27 = 2112;
                id v28 = v7;
                _os_log_error_impl( &dword_0,  v15,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: Value in array for key %{public}@ is not of expected class %{public}@: %@, skipping",  buf,  0x2Au);
              }
            }
          }

          id v11 = [v7 countByEnumeratingWithState:&v17 objects:v29 count:16];
        }

        while (v11);
      }

      return v9;
    }

    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_123D4();
      }
      return 0LL;
    }
  }

  return result;
}

  ;
}

@end