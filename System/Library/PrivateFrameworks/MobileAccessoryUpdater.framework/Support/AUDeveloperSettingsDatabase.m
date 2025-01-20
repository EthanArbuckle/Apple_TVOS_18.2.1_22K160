@interface AUDeveloperSettingsDatabase
+ (id)sharedDatabase;
- (AUDeveloperSettingsDatabase)init;
- (BOOL)isSeedParticipationEnabled:(id)a3;
- (BOOL)isValidLocationType:(unint64_t)a3;
- (NSDictionary)accessoriesDictionary;
- (id)seedParticipationDictionary;
- (unint64_t)urlLocationTypeForAccessory:(id)a3;
- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6;
- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4;
- (void)migrateExistingDefaults;
- (void)removeAccessoryWithSerialNumber:(id)a3;
- (void)setAccessoriesDictionary:(id)a3;
- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4;
@end

@implementation AUDeveloperSettingsDatabase

+ (id)sharedDatabase
{
  if (qword_10008E328 != -1) {
    dispatch_once(&qword_10008E328, &stru_1000750B8);
  }
  return (id)qword_10008E320;
}

- (AUDeveloperSettingsDatabase)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AUDeveloperSettingsDatabase;
  v2 = -[AUDeveloperSettingsDatabase init](&v6, "init");
  if (v2)
  {
    os_log_t v3 = os_log_create((const char *)[@"com.apple.AUDeveloperSettings" UTF8String], "default");
    log = v2->_log;
    v2->_log = v3;

    -[AUDeveloperSettingsDatabase migrateExistingDefaults](v2, "migrateExistingDefaults");
  }

  return v2;
}

- (void)setAccessoriesDictionary:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_100047DA4((uint64_t)v4, log);
  }
  +[NSUserDefaults AUDeveloperSettingsSetObject:withKey:]( &OBJC_CLASS___NSUserDefaults,  "AUDeveloperSettingsSetObject:withKey:",  v4,  @"accessories");
}

- (NSDictionary)accessoriesDictionary
{
  os_log_t v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults AUDeveloperSettingsObjectWithKey:]( &OBJC_CLASS___NSUserDefaults,  "AUDeveloperSettingsObjectWithKey:",  @"accessories"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    if (v3) {
      goto LABEL_8;
    }
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100047EA8();
    }
  }

  os_log_t v3 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
LABEL_8:
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100047E3C();
  }
  return v3;
}

- (BOOL)isSeedParticipationEnabled:(id)a3
{
  return (id)-[AUDeveloperSettingsDatabase urlLocationTypeForAccessory:](self, "urlLocationTypeForAccessory:", a3) == (id)3;
}

- (unint64_t)urlLocationTypeForAccessory:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"assetLocation"]);
  unint64_t v8 = sub_100002E68(v7);

  return v8;
}

- (void)updateAccessory:(id)a3 locationType:(unint64_t)a4
{
  id v6 = a3;
  if (-[AUDeveloperSettingsDatabase isValidLocationType:](self, "isValidLocationType:", a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"));
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);
    id v9 = [v8 mutableCopy];

    v10 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", sub_100002E44(a4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v9 setObject:v11 forKeyedSubscript:@"assetLocation"];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v13 = log;
      v14 = sub_100002E44(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"name"]);
      int v17 = 136315650;
      v18 = "-[AUDeveloperSettingsDatabase updateAccessory:locationType:]";
      __int16 v19 = 2080;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Updating location = %s for accessoryName = %@",  (uint8_t *)&v17,  0x20u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v9));
    -[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]( self,  "addAccessoryWithSerialNumber:info:",  v6,  v16);
  }
}

- (void)addAccessoryWithSerialNumber:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"));
    id v9 = [v8 mutableCopy];

    [v9 setObject:v7 forKeyedSubscript:v6];
    -[AUDeveloperSettingsDatabase setAccessoriesDictionary:](self, "setAccessoriesDictionary:", v9);
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "-[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "%s: Not adding empty serial number with info = %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)removeAccessoryWithSerialNumber:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"));
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  -[AUDeveloperSettingsDatabase setAccessoriesDictionary:](self, "setAccessoriesDictionary:", v6);
}

- (BOOL)isValidLocationType:(unint64_t)a3
{
  return a3 < 7;
}

- (void)migrateExistingDefaults
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AUDeveloperSettingsDatabase seedParticipationDictionary](self, "seedParticipationDictionary"));
  id v3 = [v2 mutableCopy];

  if ([v3 count])
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v23 = v3;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
          char isKindOfClass = objc_opt_isKindOfClass(v10, v11);

          if ((isKindOfClass & 1) != 0)
          {
            id v26 = 0LL;
            unint64_t v27 = 4LL;
            id v25 = 0LL;
            -[AUDeveloperSettingsDatabase accessoryNameForIdentifier:name:serialNumber:fusingType:]( self,  "accessoryNameForIdentifier:name:serialNumber:fusingType:",  v9,  &v26,  &v25,  &v27);
            id v13 = v26;
            id v14 = v25;
            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[AUDeveloperSettingsDatabase accessoriesDictionary](self, "accessoriesDictionary"));
              v16 = (void *)objc_claimAutoreleasedReturnValue([v15 allKeys]);
              unsigned __int8 v17 = [v16 containsObject:v14];

              if ((v17 & 1) == 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v9]);
                [v18 setObject:v19 forKeyedSubscript:@"assetLocation"];

                if (v13) {
                  [v18 setObject:v13 forKeyedSubscript:@"name"];
                }
                if (v27 <= 2)
                {
                  v20 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  sub_100002D0C(v27));
                  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
                  [v18 setObject:v21 forKeyedSubscript:@"fusing"];
                }

                v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v18));
                -[AUDeveloperSettingsDatabase addAccessoryWithSerialNumber:info:]( self,  "addAccessoryWithSerialNumber:info:",  v14,  v22);
              }
            }
          }
        }

        id v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v6);
    }

    id v3 = v23;
  }
}

- (id)seedParticipationDictionary
{
  id v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults AUDeveloperSettingsObjectWithKey:]( &OBJC_CLASS___NSUserDefaults,  "AUDeveloperSettingsObjectWithKey:",  @"seedParticipation"));
  if (!v3) {
    id v3 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  }
  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100047F20();
  }
  return v3;
}

- (void)accessoryNameForIdentifier:(id)a3 name:(id *)a4 serialNumber:(id *)a5 fusingType:(unint64_t *)a6
{
  id v14 = (id)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"+"]);
  BOOL v9 = [v14 count] == (id)3;
  v10 = v14;
  if (v9)
  {
    if (a6)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:0]);
      *a6 = sub_100002D30(v11);
    }

    if (a5)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:1]);
      *a5 = [v12 copy];
    }

    v10 = v14;
    if (a4)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:2]);
      *a4 = [v13 copy];

      v10 = v14;
    }
  }
}

- (void).cxx_destruct
{
}

  ;
}

@end