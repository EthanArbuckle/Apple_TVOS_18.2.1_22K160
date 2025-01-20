@interface StateAccess
- (NSUserDefaults)aspCarryDefaults;
- (StateAccess)init;
- (id)getAllKeys;
- (id)getValueForKey:(id)a3 expectedType:(int)a4;
- (id)getValueForKey:(id)a3 inDomain:(id)a4 expectedType:(int)a5;
- (void)deleteKey:(id)a3;
- (void)setAspCarryDefaults:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4 inDomain:(id)a5;
@end

@implementation StateAccess

- (StateAccess)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___StateAccess;
  v2 = -[StateAccess init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    aspCarryDefaults = v2->_aspCarryDefaults;
    v2->_aspCarryDefaults = (NSUserDefaults *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)deleteKey:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  [v5 removeObjectForKey:v4];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  [v8 setObject:v7 forKey:v6];
}

- (void)setValue:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 persistentDomainForName:v9]);

  if (v12) {
    v13 = (NSMutableDictionary *)[v12 mutableCopy];
  }
  else {
    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v14 = v13;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  [v15 setPersistentDomain:v14 forName:v9];

  objc_autoreleasePoolPop(v10);
}

- (id)getValueForKey:(id)a3 expectedType:(int)a4
{
  id v6 = a3;
  v10[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v10[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v10[2] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v10[3] = objc_opt_class(&OBJC_CLASS___NSArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  if (a4 <= 3 && (objc_opt_isKindOfClass(v8, v10[a4]) & 1) == 0)
  {

    id v8 = 0LL;
  }

  return v8;
}

- (id)getValueForKey:(id)a3 inDomain:(id)a4 expectedType:(int)a5
{
  id v8 = a4;
  id v9 = a3;
  v14[0] = objc_opt_class(&OBJC_CLASS___NSString);
  v14[1] = objc_opt_class(&OBJC_CLASS___NSNumber);
  v14[2] = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v14[3] = objc_opt_class(&OBJC_CLASS___NSArray);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 persistentDomainForName:v8]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);
  if (a5 <= 3 && (objc_opt_isKindOfClass(v12, v14[a5]) & 1) == 0)
  {

    v12 = 0LL;
  }

  return v12;
}

- (id)getAllKeys
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StateAccess aspCarryDefaults](self, "aspCarryDefaults"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionaryRepresentation]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  return v4;
}

- (NSUserDefaults)aspCarryDefaults
{
  return self->_aspCarryDefaults;
}

- (void)setAspCarryDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end