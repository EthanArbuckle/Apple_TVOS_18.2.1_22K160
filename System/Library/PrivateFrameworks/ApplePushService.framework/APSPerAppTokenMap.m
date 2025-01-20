@interface APSPerAppTokenMap
- (APSPerAppTokenMap)init;
- (BOOL)flagForTopic:(id)a3 identifier:(id)a4;
- (BOOL)hasMissingTokens;
- (BOOL)isEmpty;
- (id)allPerAppTokens;
- (id)debugDescription;
- (id)description;
- (id)identifiersForTopic:(id)a3;
- (id)infoForTopic:(id)a3 identifier:(id)a4;
- (id)tokenForTopic:(id)a3 identifier:(id)a4;
- (id)tokensForTopic:(id)a3;
- (id)topics;
- (void)enumerateMissingTokensUsingBlock:(id)a3;
- (void)enumerateTokensUsingBlock:(id)a3;
- (void)enumerateTokensWithInfoUsingBlock:(id)a3;
- (void)removeAllTokens;
- (void)removeIdentifier:(id)a3 forTopic:(id)a4;
- (void)setFlag:(BOOL)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)setToken:(id)a3 forInfo:(id)a4;
- (void)setToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
@end

@implementation APSPerAppTokenMap

- (APSPerAppTokenMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___APSPerAppTokenMap;
  v2 = -[APSPerAppTokenMap init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    perAppTokenMap = v2->_perAppTokenMap;
    v2->_perAppTokenMap = v3;
  }

  return v2;
}

- (void)removeIdentifier:(id)a3 forTopic:(id)a4
{
  id v6 = a4;
  v7 = &stru_100123240;
  if (a3) {
    v7 = (__CFString *)a3;
  }
  v14 = v7;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_enumerating)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"illegal modification during enumeration",  0LL));
    objc_exception_throw(v13);
    __break(1u);
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_perAppTokenMap, "objectForKey:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v14]);
    v11 = v10;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v10 perAppToken]);
      if (!v12) {
        --v8->_missingTokens;
      }
      [v9 removeObjectForKey:v14];
    }

    objc_sync_exit(v8);
  }

- (void)setToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[APSAppTokenInfo alloc] initUnextendedAppTokenWithTopic:v9 identifier:v8];

  -[APSPerAppTokenMap setToken:forInfo:](self, "setToken:forInfo:", v10, v11);
}

- (void)setToken:(id)a3 forInfo:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)v7;
  id v9 = &stru_100123240;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  id v11 = self;
  objc_sync_enter(v11);
  if (!v11->_enumerating)
  {
    perAppTokenMap = v11->_perAppTokenMap;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](perAppTokenMap, "objectForKey:", v13));

    if (!v14)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL));
      v15 = v11->_perAppTokenMap;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 topic]);
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v14, v16);
    }

    v17 = (APSPerAppTokenMapEntry *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v10]);
    v18 = v17;
    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSPerAppTokenMapEntry perAppToken](v17, "perAppToken"));

      if (v23 && !v19)
      {
        uint64_t v20 = -1LL;
LABEL_15:
        v11->_missingTokens += v20;
        goto LABEL_16;
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSPerAppTokenMapEntry perAppToken](v18, "perAppToken"));

      if (v23 || !v21) {
        goto LABEL_16;
      }
    }

    else
    {
      v18 = objc_alloc_init(&OBJC_CLASS___APSPerAppTokenMapEntry);
      [v14 setObject:v18 forKey:v10];
      if (v23)
      {
LABEL_16:
        -[APSPerAppTokenMapEntry setPerAppToken:](v18, "setPerAppToken:", v23);
        -[APSPerAppTokenMapEntry setInfo:](v18, "setInfo:", v6);

        objc_sync_exit(v11);
        return;
      }
    }

    uint64_t v20 = 1LL;
    goto LABEL_15;
  }

  id v22 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"illegal modification during enumeration",  0LL));
  objc_exception_throw(v22);
  __break(1u);
}

- (void)removeAllTokens
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_enumerating)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"illegal modification during enumeration",  0LL));
    objc_exception_throw(v12);
    __break(1u);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  obj = v2->_perAppTokenMap;
  id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
  if (v3)
  {
    uint64_t v14 = *(void *)v20;
    do
    {
      v4 = 0LL;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(obj);
        }
        v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v2->_perAppTokenMap,  "objectForKey:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v4)));
        __int128 v17 = 0u;
        __int128 v18 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        id v6 = [v5 copy];
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v16;
          do
          {
            id v9 = 0LL;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v9)]);
              id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 perAppToken]);
              if (v11)
              {
                [v10 setPerAppToken:0];
                ++v2->_missingTokens;
              }

              id v9 = (char *)v9 + 1;
            }

            while (v7 != v9);
            id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }

          while (v7);
        }

        v4 = (char *)v4 + 1;
      }

      while (v4 != v3);
      id v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v19,  v24,  16LL);
    }

    while (v3);
  }

  objc_sync_exit(v2);
}

- (id)tokenForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = (__CFString *)a4;
  objc_sync_enter(v7);
  id v9 = &stru_100123240;
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7->_perAppTokenMap, "objectForKey:", v6));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 perAppToken]);

  objc_sync_exit(v7);
  return v13;
}

- (id)infoForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = (__CFString *)a4;
  objc_sync_enter(v7);
  id v9 = &stru_100123240;
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7->_perAppTokenMap, "objectForKey:", v6));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);
  id v13 = v12;
  if (v12) {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 info]);
  }
  else {
    uint64_t v14 = 0LL;
  }

  objc_sync_exit(v7);
  return v14;
}

- (BOOL)flagForTopic:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = self;
  uint64_t v8 = (__CFString *)a4;
  objc_sync_enter(v7);
  id v9 = &stru_100123240;
  if (v8) {
    id v9 = v8;
  }
  id v10 = v9;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7->_perAppTokenMap, "objectForKey:", v6));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);
  unsigned __int8 v13 = [v12 flag];

  objc_sync_exit(v7);
  return v13;
}

- (void)setFlag:(BOOL)a3 forTopic:(id)a4 identifier:(id)a5
{
  BOOL v6 = a3;
  id v14 = a4;
  uint64_t v8 = self;
  id v9 = (__CFString *)a5;
  objc_sync_enter(v8);
  id v10 = &stru_100123240;
  if (v9) {
    id v10 = v9;
  }
  id v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_perAppTokenMap, "objectForKey:", v14));
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);
  [v13 setFlag:v6];

  objc_sync_exit(v8);
}

- (id)allPerAppTokens
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( &OBJC_CLASS___NSMutableSet,  "setWithCapacity:",  -[NSMutableDictionary count](v2->_perAppTokenMap, "count")));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v4 = v2->_perAppTokenMap;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[APSPerAppTokenMap tokensForTopic:]( v2,  "tokensForTopic:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v7),  (void)v10));
        [v3 unionSet:v8];

        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v5);
  }

  objc_sync_exit(v2);
  return v3;
}

- (id)tokensForTopic:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( &OBJC_CLASS___NSMutableSet,  "setWithCapacity:",  -[NSMutableDictionary count](v5->_perAppTokenMap, "count")));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_perAppTokenMap, "objectForKey:", v4));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues", 0));
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      __int128 v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) perAppToken]);
        if (v12) {
          [v6 addObject:v12];
        }

        __int128 v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v9);
  }

  objc_sync_exit(v5);
  return v6;
}

- (BOOL)hasMissingTokens
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_missingTokens > 0;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isEmpty
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = -[NSMutableDictionary count](v2->_perAppTokenMap, "count") == 0LL;
  objc_sync_exit(v2);

  return v3;
}

- (id)topics
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_perAppTokenMap, "allKeys"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  objc_sync_exit(v2);
  return v4;
}

- (id)identifiersForTopic:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_perAppTokenMap, "objectForKey:", v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

  objc_sync_exit(v5);
  return v8;
}

- (void)enumerateMissingTokensUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (-[APSPerAppTokenMap hasMissingTokens](v5, "hasMissingTokens"))
  {
    v5->_enumerating = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100074A30;
    v6[3] = &unk_10011F918;
    id v7 = v4;
    -[APSPerAppTokenMap enumerateTokensUsingBlock:](v5, "enumerateTokensUsingBlock:", v6);
    v5->_enumerating = 0;
  }

  objc_sync_exit(v5);
}

- (void)enumerateTokensUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, uint64_t, char *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_enumerating = 1;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  obj = v5->_perAppTokenMap;
  __int128 v21 = v5;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
  if (v6)
  {
    uint64_t v19 = *(void *)v28;
    do
    {
      id v18 = v6;
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_perAppTokenMap, "objectForKey:", v8));
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v24;
          while (2)
          {
            for (j = 0LL; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)j);
              char v22 = 0;
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v14]);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 perAppToken]);
              v4[2](v4, v16, v8, v14, &v22);
              if (v22)
              {
                v21->_enumerating = 0;

                __int128 v17 = v21;
                goto LABEL_18;
              }
            }

            id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        id v5 = v21;
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v27,  v32,  16LL);
    }

    while (v6);
  }

  __int128 v17 = v21;
  v21->_enumerating = 0;
LABEL_18:
  objc_sync_exit(v17);
}

- (void)enumerateTokensWithInfoUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_enumerating = 1;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  obj = v5->_perAppTokenMap;
  id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
  if (v6)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      id v17 = v6;
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v5->_perAppTokenMap,  "objectForKey:",  *(void *)(*((void *)&v25 + 1) + 8LL * (void)i),  v17));
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v22;
          while (2)
          {
            uint64_t v12 = 0LL;
            do
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v12);
              char v20 = 0;
              uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v13]);
              __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 perAppToken]);
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 info]);
              v4[2](v4, v15, v16, &v20);

              if (v20)
              {
                v5->_enumerating = 0;

                goto LABEL_18;
              }

              uint64_t v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v25,  v30,  16LL);
    }

    while (v6);
  }

  v5->_enumerating = 0;
LABEL_18:
  objc_sync_exit(v5);
}

- (id)debugDescription
{
  return -[NSMutableDictionary debugDescription](self->_perAppTokenMap, "debugDescription");
}

- (id)description
{
  return (id)APSPrettyPrintCollection(self->_perAppTokenMap, 0LL, 0LL, 0LL);
}

- (void).cxx_destruct
{
}

@end