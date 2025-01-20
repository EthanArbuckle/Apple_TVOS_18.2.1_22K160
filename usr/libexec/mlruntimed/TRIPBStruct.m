@interface TRIPBStruct
+ (id)mlr_structWithDictionary:(id)a3;
@end

@implementation TRIPBStruct

+ (id)mlr_structWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_opt_new(&OBJC_CLASS___TRIPBStruct);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[TRIPBValue mlr_valueWithObject:](&OBJC_CLASS___TRIPBValue, "mlr_valueWithObject:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v4 fields]);
        [v13 setObject:v12 forKeyedSubscript:v10];
      }

      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  return v4;
}

@end