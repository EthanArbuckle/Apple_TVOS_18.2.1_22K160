@interface MTDictionaryDiff
- (MTDictionaryDiff)init;
- (MTDictionaryDiff)initWithProperties:(id)a3;
- (NSDictionary)dictionary;
- (NSMutableArray)callbacks;
- (NSSet)properties;
- (void)addCallback:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation MTDictionaryDiff

- (MTDictionaryDiff)init
{
  return -[MTDictionaryDiff initWithProperties:](self, "initWithProperties:", 0LL);
}

- (MTDictionaryDiff)initWithProperties:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTDictionaryDiff;
  v6 = -[MTDictionaryDiff init](&v10, "init");
  if (v6)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    callbacks = v6->_callbacks;
    v6->_callbacks = v7;

    objc_storeStrong((id *)&v6->_properties, a3);
  }

  return v6;
}

- (void)setDictionary:(id)a3
{
  v4 = (NSDictionary *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff dictionary](self, "dictionary"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v22 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff properties](self, "properties"));
  id v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    uint64_t v20 = *(void *)v29;
    v21 = v4;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, v20, v21));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v10));
        if (v11 != v12 && ([v11 isEqual:v12] & 1) == 0)
        {
          v13 = v5;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff callbacks](v22, "callbacks"));
          id v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v25;
            do
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v14);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8LL * (void)j) + 16LL))();
              }

              id v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }

            while (v16);
          }

          id v5 = v13;
          uint64_t v8 = v20;
          v4 = v21;
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v7);
  }

  dictionary = v22->_dictionary;
  v22->_dictionary = v4;
}

- (void)addCallback:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff callbacks](self, "callbacks"));
  id v5 = objc_retainBlock(v4);

  [v6 addObject:v5];
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSSet)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end