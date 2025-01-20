@interface CLIOptionSet
- (CLIOptionSet)init;
- (CLIOptionSet)initWithOptions:(id)a3;
- (id)_copiedSet;
- (id)description;
- (void)_registerOption:(id)a3;
@end

@implementation CLIOptionSet

- (CLIOptionSet)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLIOptionSet;
  v2 = -[CLIOptionSet init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    options = v2->_options;
    v2->_options = v3;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    shortAliasToOptionDict = v2->_shortAliasToOptionDict;
    v2->_shortAliasToOptionDict = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    longAliasToOptionDict = v2->_longAliasToOptionDict;
    v2->_longAliasToOptionDict = v7;
  }

  return v2;
}

- (CLIOptionSet)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = -[CLIOptionSet init](self, "init");
  if (v5)
  {
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    options = v5->_options;
    v5->_options = v6;

    v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    shortAliasToOptionDict = v5->_shortAliasToOptionDict;
    v5->_shortAliasToOptionDict = v8;

    objc_super v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    longAliasToOptionDict = v5->_longAliasToOptionDict;
    v5->_longAliasToOptionDict = v10;

    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v12 = v4;
    id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        v16 = 0LL;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          -[CLIOptionSet _registerOption:]( v5,  "_registerOption:",  *(void *)(*((void *)&v18 + 1) + 8LL * (void)v16),  (void)v18);
          v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v14);
    }
  }

  return v5;
}

- (void)_registerOption:(id)a3
{
  id v12 = a3;
  [v12 _finalize];
  if (-[NSMutableSet containsObject:](self->_options, "containsObject:", v12))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2 object:self file:@"CLIOptionParsing.m" lineNumber:296 description:@"Option was registered twice."];
  }

  -[NSMutableSet addObject:](self->_options, "addObject:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v12 shortName]);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shortAliasToOptionDict,  "objectForKeyedSubscript:",  v5));

    if (v6)
    {
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v10 handleFailureInMethod:a2, self, @"CLIOptionParsing.m", 302, @"Short option '-%@' is duplicated", v5 object file lineNumber description];
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_shortAliasToOptionDict,  "setObject:forKeyedSubscript:",  v12,  v5);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v12 longName]);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_longAliasToOptionDict,  "objectForKeyedSubscript:",  v7));

    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      [v11 handleFailureInMethod:a2, self, @"CLIOptionParsing.m", 309, @"Long option '--%@' is duplicated", v7 object file lineNumber description];
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_longAliasToOptionDict,  "setObject:forKeyedSubscript:",  v12,  v7);
  }
}

- (id)_copiedSet
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = self->_options;
  id v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "copy", (void)v11);
        -[NSMutableSet addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v6);
  }

  return v3;
}

- (id)description
{
  return -[NSMutableSet description](self->_options, "description");
}

- (void).cxx_destruct
{
}

@end