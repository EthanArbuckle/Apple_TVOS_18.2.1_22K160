@interface RMPersistentActiveIdentifiers
+ (BOOL)supportsSecureCoding;
- (NSDictionary)uniqueIdentifiersByConfigurationType;
- (RMPersistentActiveIdentifiers)initWithCoder:(id)a3;
- (RMPersistentActiveIdentifiers)initWithConfigurationPayloads:(id)a3;
- (RMPersistentActiveIdentifiers)initWithUniqueIdentifiersByConfigurationType:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUniqueIdentifiersByConfigurationType:(id)a3;
@end

@implementation RMPersistentActiveIdentifiers

- (RMPersistentActiveIdentifiers)initWithConfigurationPayloads:(id)a3
{
  v20 = self;
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id obj = v3;
  id v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "declarationType", v20));
        v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v7));
        if (!v8)
        {
          v8 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v8, v7);
        }

        v9 = -[RMDeclarationUniqueIdentifier initWithDeclarationPayload:]( objc_alloc(&OBJC_CLASS___RMDeclarationUniqueIdentifier),  "initWithDeclarationPayload:",  v6);
        -[NSMutableSet addObject:](v8, "addObject:", v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue([v6 assetReferences]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:@"asset"]);

        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (j = 0LL; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = -[RMDeclarationUniqueIdentifier initWithDeclarationPayload:]( objc_alloc(&OBJC_CLASS___RMDeclarationUniqueIdentifier),  "initWithDeclarationPayload:",  *(void *)(*((void *)&v24 + 1) + 8LL * (void)j));
              -[NSMutableSet addObject:](v8, "addObject:", v17);
            }

            id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }

          while (v14);
        }
      }

      id v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v23);
  }

  v18 = -[RMPersistentActiveIdentifiers initWithUniqueIdentifiersByConfigurationType:]( v20,  "initWithUniqueIdentifiersByConfigurationType:",  v4);
  return v18;
}

- (RMPersistentActiveIdentifiers)initWithUniqueIdentifiersByConfigurationType:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RMPersistentActiveIdentifiers;
  v5 = -[RMPersistentActiveIdentifiers init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    uniqueIdentifiersByConfigurationType = v5->_uniqueIdentifiersByConfigurationType;
    v5->_uniqueIdentifiersByConfigurationType = v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMPersistentActiveIdentifiers)initWithCoder:(id)a3
{
  id v4 = a3;
  v10[0] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v10[1] = objc_opt_class(&OBJC_CLASS___NSString);
  v10[2] = objc_opt_class(&OBJC_CLASS___NSSet);
  v10[3] = objc_opt_class(&OBJC_CLASS___RMDeclarationUniqueIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 4LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v6 forKey:@"uniqueIdentifiersByConfigurationType"]);
  if (v7)
  {
    self =  -[RMPersistentActiveIdentifiers initWithUniqueIdentifiersByConfigurationType:]( self,  "initWithUniqueIdentifiersByConfigurationType:",  v7);
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[RMPersistentActiveIdentifiers uniqueIdentifiersByConfigurationType]( self,  "uniqueIdentifiersByConfigurationType"));
  [v4 encodeObject:v5 forKey:@"uniqueIdentifiersByConfigurationType"];
}

- (NSDictionary)uniqueIdentifiersByConfigurationType
{
  return self->_uniqueIdentifiersByConfigurationType;
}

- (void)setUniqueIdentifiersByConfigurationType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end