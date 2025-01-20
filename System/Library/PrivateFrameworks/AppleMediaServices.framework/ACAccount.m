@interface ACAccount
- (NSArray)amsd_recordZoneNames;
- (void)amsd_addRecordZoneName:(id)a3 homeUserIdentifier:(id)a4 showProfile:(BOOL)a5;
- (void)amsd_markRecordZoneNameHidden:(id)a3;
- (void)amsd_removeAllRecordZoneNames;
- (void)amsd_removeRecordZoneName:(id)a3;
- (void)amsd_setPrivateListeningEnabled:(BOOL)a3;
@end

@implementation ACAccount

- (NSArray)amsd_recordZoneNames
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"homeUserIdentifiers"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccount objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  @"homeUserHiddenIdentifiers"));
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    id v12 = v9;
  }
  else {
    id v12 = 0LL;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allKeys]);
  -[NSMutableSet addObjectsFromArray:](v3, "addObjectsFromArray:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v3, "allObjects"));
  return (NSArray *)v14;
}

- (void)amsd_addRecordZoneName:(id)a3 homeUserIdentifier:(id)a4 showProfile:(BOOL)a5
{
  BOOL v5 = a5;
  id v29 = a3;
  id v8 = a4;
  if (v5) {
    v9 = @"homeUserIdentifiers";
  }
  else {
    v9 = @"homeUserHiddenIdentifiers";
  }
  if (v5) {
    uint64_t v10 = @"homeUserHiddenIdentifiers";
  }
  else {
    uint64_t v10 = @"homeUserIdentifiers";
  }
  uint64_t v11 = v9;
  id v12 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v12));
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0) {
    id v16 = v13;
  }
  else {
    id v16 = 0LL;
  }

  if (v16) {
    v17 = v16;
  }
  else {
    v17 = &__NSDictionary0__struct;
  }
  id v18 = v17;

  id v19 = [v18 mutableCopy];
  [v19 removeObjectForKey:v29];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v11));
  uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDictionary, v21);
  if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0) {
    id v23 = v20;
  }
  else {
    id v23 = 0LL;
  }

  if (v23) {
    v24 = v23;
  }
  else {
    v24 = &__NSDictionary0__struct;
  }
  id v25 = v24;

  id v26 = [v25 mutableCopy];
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:v29]);

  if (!v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    [v26 setObject:v28 forKeyedSubscript:v29];
  }
}

- (void)amsd_removeAllRecordZoneNames
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount amsd_recordZoneNames](self, "amsd_recordZoneNames", 0LL));
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[ACAccount amsd_removeRecordZoneName:]( self,  "amsd_removeRecordZoneName:",  *(void *)(*((void *)&v9 + 1) + 8LL * (void)v8));
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

- (void)amsd_removeRecordZoneName:(id)a3
{
  id v4 = a3;
  v24[0] = @"homeUserIdentifiers";
  v24[1] = @"homeUserHiddenIdentifiers";
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 2LL));
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9));
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0) {
          id v13 = v10;
        }
        else {
          id v13 = 0LL;
        }

        if (v13) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = &__NSDictionary0__struct;
        }
        id v15 = v14;

        id v16 = [v15 mutableCopy];
        [v16 removeObjectForKey:v4];
        unsigned __int8 v17 = [v15 isEqualToDictionary:v16];

        if ((v17 & 1) == 0) {
          -[ACAccount setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v16, v9);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v6);
  }
}

- (void)amsd_markRecordZoneNameHidden:(id)a3
{
  id v20 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount objectForKeyedSubscript:](self, "objectForKeyedSubscript:", @"homeUserIdentifiers"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    id v7 = v4;
  }
  else {
    id v7 = 0LL;
  }

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &__NSDictionary0__struct;
  }
  id v9 = v8;

  id v10 = [v9 mutableCopy];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v20]);
  [v10 removeObjectForKey:v20];
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccount objectForKeyedSubscript:]( self,  "objectForKeyedSubscript:",  @"homeUserHiddenIdentifiers"));
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0) {
      id v15 = v12;
    }
    else {
      id v15 = 0LL;
    }

    if (v15) {
      id v16 = v15;
    }
    else {
      id v16 = &__NSDictionary0__struct;
    }
    id v17 = v16;

    id v18 = [v17 mutableCopy];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v20]);

    if (!v19) {
      [v18 setObject:v11 forKeyedSubscript:v20];
    }
    if (([v17 isEqualToDictionary:v18] & 1) == 0) {
      -[ACAccount setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v18,  @"homeUserHiddenIdentifiers");
    }
  }
}

- (void)amsd_setPrivateListeningEnabled:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  -[ACAccount setObject:forKeyedSubscript:]( self,  "setObject:forKeyedSubscript:",  v4,  @"musicPrivateListeningEnabled");
}

@end