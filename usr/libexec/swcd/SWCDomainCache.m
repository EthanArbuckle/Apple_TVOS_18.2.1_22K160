@interface SWCDomainCache
- (BOOL)isValid;
- (id)_entriesForDomain:(id)a3;
- (id)_entriesForDomain:(id)a3 operationMode:(char)a4;
- (id)_entriesFromDomain:(id)a3;
- (id)entriesForDomain:(id)a3;
- (void)clear;
- (void)updateCachedDomainsForEntries:(id)a3;
@end

@implementation SWCDomainCache

- (void)updateCachedDomainsForEntries:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
  unsigned int v6 = [v5 isFastCheckEnabled];

  if (v6)
  {
    if (!self->_cachedEntries)
    {
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      cachedEntries = self->_cachedEntries;
      self->_cachedEntries = v7;
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v22 = v4;
    id obj = v4;
    id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain", v22));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v14));
          v16 = v15;
          if (v15)
          {
            id v17 = [v15 mutableCopy];
            [v17 addObject:v13];
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedEntries,  "setObject:forKeyedSubscript:",  v17,  v14);
          }

          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedEntries,  "setObject:forKeyedSubscript:",  v13,  v14);
          }

          if ([v14 isWildcard])
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v14 nonWildcardDomain]);
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v18));
            v20 = v19;
            if (v19)
            {
              id v21 = [v19 mutableCopy];
              [v21 addObject:v13];
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedEntries,  "setObject:forKeyedSubscript:",  v21,  v18);
            }

            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_cachedEntries,  "setObject:forKeyedSubscript:",  v13,  v18);
            }
          }
        }

        id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v10);
    }

    id v4 = v22;
  }
}

- (id)entriesForDomain:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:operationMode:](self, "_entriesForDomain:operationMode:", v4, 0LL));
  unsigned int v6 = v5;
  if (*(_WORD *)&self->_hasDeveloperModeDomains)
  {
    if (v5) {
      v7 = (NSMutableOrderedSet *)[v5 mutableCopy];
    }
    else {
      v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    }
    uint64_t v11 = v7;
    if (self->_hasDeveloperModeDomains)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[SWCDomainCache _entriesForDomain:operationMode:]( self,  "_entriesForDomain:operationMode:",  v4,  1LL));
      -[NSMutableOrderedSet unionOrderedSet:](v11, "unionOrderedSet:", v8);
      if (self->_hasManagedModeDomains)
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SWCDomainCache _entriesForDomain:operationMode:]( self,  "_entriesForDomain:operationMode:",  v4,  3LL));
        -[NSMutableOrderedSet unionOrderedSet:](v11, "unionOrderedSet:", v9);
      }
    }

    if (self->_hasManagedModeDomains)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SWCDomainCache _entriesForDomain:operationMode:]( self,  "_entriesForDomain:operationMode:",  v4,  2LL));
      -[NSMutableOrderedSet unionOrderedSet:](v11, "unionOrderedSet:", v10);
    }
  }

  else
  {
    uint64_t v11 = v5;
  }

  return v11;
}

- (id)_entriesForDomain:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v4));
  if (v5 || ![v4 isWildcard])
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"."]);
    if ((unint64_t)[v8 count] >= 3)
    {
      id v22 = v6;
      if ([v8 count] == (id)2)
      {
LABEL_13:
        id v7 = v5;
        unsigned int v6 = v22;
      }

      else
      {
        id v9 = 0LL;
        while (1)
        {
          ++v9;
          id v10 = &stru_100031DB8;
          if (v9 < (char *)[v8 count] - 1)
          {
            uint64_t v11 = v9;
            v12 = &stru_100031DB8;
            do
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v11]);
              id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingFormat:]( v12,  "stringByAppendingFormat:",  @"%@.",  v13));

              ++v11;
              v12 = v10;
            }

            while (v11 < (char *)[v8 count] - 1);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", (char *)objc_msgSend(v8, "count") - 1));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", @"%@", v14));

          v16 = objc_alloc(&OBJC_CLASS____SWCDomain);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 port]);
          v18 = -[_SWCDomain initWithHost:port:wildcard:modeOfOperation:]( v16,  "initWithHost:port:wildcard:modeOfOperation:",  v15,  v17,  1,  [v4 modeOfOperation]);

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v18));
          if (v19) {
            break;
          }
        }

        v20 = v19;
        if (v5)
        {
          id v7 = [v5 mutableCopy];
          [v7 unionOrderedSet:v20];
        }

        else
        {
          id v7 = v19;
        }

        unsigned int v6 = v22;
      }
    }

    else
    {
      id v7 = v5;
    }
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 nonWildcardDomain]);
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v6));
  }

  return v7;
}

- (id)_entriesForDomain:(id)a3 operationMode:(char)a4
{
  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a3 domainRequiringModeOfOperation:a4]);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:](self, "_entriesForDomain:", v5));
  }

  else
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:](self, "_entriesForDomain:", a3));
  }

  return v6;
}

- (void)clear
{
  cachedEntries = self->_cachedEntries;
  self->_cachedEntries = 0LL;
}

- (BOOL)isValid
{
  return -[NSMutableDictionary count](self->_cachedEntries, "count") != 0LL;
}

- (id)_entriesFromDomain:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedEntries, "objectForKeyedSubscript:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SWCEntry);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v3));
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
    {
      id v7 = 0LL;
      goto LABEL_7;
    }

    id v5 = v3;
  }

  id v7 = v5;
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
}

@end