@interface TypeCheckedDictionaryReader
- (TypeCheckedDictionaryReader)initWithDictionary:(id)a3;
- (id)valueOfClass:(Class)a3 forKey:(id)a4;
- (id)valueOfClass:(Class)a3 forKeyPath:(id)a4;
@end

@implementation TypeCheckedDictionaryReader

- (TypeCheckedDictionaryReader)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TypeCheckedDictionaryReader;
  v5 = -[TypeCheckedDictionaryReader init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dictionary, v4);
  }

  return v6;
}

- (id)valueOfClass:(Class)a3 forKey:(id)a4
{
  p_dictionary = &self->_dictionary;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_dictionary);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained objectForKeyedSubscript:v6]);

  if ((objc_opt_isKindOfClass(v8, a3) & 1) != 0) {
    v9 = v8;
  }
  else {
    v9 = 0LL;
  }
  id v10 = v9;

  return v10;
}

- (id)valueOfClass:(Class)a3 forKeyPath:(id)a4
{
  id v6 = a4;
  v7 = (char *)[v6 rangeOfString:@"." options:4];
  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TypeCheckedDictionaryReader valueOfClass:forKey:](self, "valueOfClass:forKey:", a3, v6));
    goto LABEL_20;
  }

  v9 = v7;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 substringToIndex:v7]);
  id WeakRetained = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_keyPathCache,  "objectForKeyedSubscript:",  v10));
  if (!WeakRetained)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dictionary);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue([v10 componentsSeparatedByString:@"."]);
    id v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v29 = 16LL;
      v30 = self;
      v31 = v9;
      v32 = a3;
      id v33 = v6;
      uint64_t v17 = *(void *)v35;
      char v18 = 1;
      while (2)
      {
        v19 = 0LL;
        v20 = WeakRetained;
        do
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v19);
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
          char isKindOfClass = objc_opt_isKindOfClass(v20, v22);
          id WeakRetained = (id)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:v21]);

          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(WeakRetained, v24) & 1) == 0)
          {

            id v8 = 0LL;
            id v6 = v33;
            goto LABEL_19;
          }

          v18 &= isKindOfClass ^ 1;
          v19 = (char *)v19 + 1;
          v20 = WeakRetained;
        }

        while (v16 != v19);
        id v16 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v16) {
          continue;
        }
        break;
      }

      id v6 = v33;
      a3 = v32;
      self = v30;
      if ((v18 & 1) == 0) {
        goto LABEL_25;
      }
    }

    else
    {
    }

    keyPathCache = self->_keyPathCache;
    if (!keyPathCache)
    {
      v27 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  5LL);
      v28 = self->_keyPathCache;
      self->_keyPathCache = v27;

      keyPathCache = self->_keyPathCache;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( keyPathCache,  "setObject:forKeyedSubscript:",  WeakRetained,  v10,  v29,  v30,  v31,  v32);
LABEL_25:
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", v9 + 1, v29, v30, v31, v32));
  id v13 = (id)objc_claimAutoreleasedReturnValue([WeakRetained objectForKeyedSubscript:v12]);

  if ((objc_opt_isKindOfClass(v13, a3) & 1) != 0) {
    v14 = v13;
  }
  else {
    v14 = 0LL;
  }
  id v8 = v14;
LABEL_19:

LABEL_20:
  return v8;
}

- (void).cxx_destruct
{
}

@end