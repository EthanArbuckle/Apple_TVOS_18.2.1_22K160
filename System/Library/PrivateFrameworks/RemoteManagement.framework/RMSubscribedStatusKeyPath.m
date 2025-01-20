@interface RMSubscribedStatusKeyPath
+ (id)fetchRequestWithKeyPaths:(id)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)reportDetails;
- (void)_validateManagementSourceWithErrors:(id)a3;
- (void)_validateSetOncePropertiesWithErrors:(id)a3;
- (void)awakeFromInsert;
@end

@implementation RMSubscribedStatusKeyPath

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RMSubscribedStatusKeyPath;
  -[RMSubscribedStatusKeyPath awakeFromInsert](&v4, "awakeFromInsert");
  v3 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[RMSubscribedStatusKeyPath setPrimitiveValue:forKey:]( self,  "setPrimitiveValue:forKey:",  v3,  @"lastReceivedDate");
}

- (BOOL)validateForInsert:(id *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RMSubscribedStatusKeyPath;
  id v20 = 0LL;
  unsigned __int8 v6 = -[RMSubscribedStatusKeyPath validateForInsert:](&v19, "validateForInsert:", &v20);
  id v7 = v20;
  v8 = v7;
  if ((v6 & 1) != 0) {
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if (![v9 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }

  id v10 = [v8 code];

  if (v10 != (id)1560)
  {
LABEL_8:
    -[NSMutableArray addObject:](v5, "addObject:", v8);
    goto LABEL_9;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSDetailedErrorsKey]);

  if ([v12 count]) {
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v12);
  }

LABEL_9:
  -[RMSubscribedStatusKeyPath _validateManagementSourceWithErrors:](self, "_validateManagementSourceWithErrors:", v5);
  v13 = v5;
  id v14 = -[NSMutableArray count](v13, "count");
  id v15 = v14;
  if (a3 && v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:]( &OBJC_CLASS___RMErrorUtilities,  "createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:",  v13));
    v17 = v16;
    if (v16) {
      *a3 = v16;
    }
  }

  return v15 == 0LL;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RMSubscribedStatusKeyPath;
  id v20 = 0LL;
  unsigned __int8 v6 = -[RMSubscribedStatusKeyPath validateForUpdate:](&v19, "validateForUpdate:", &v20);
  id v7 = v20;
  v8 = v7;
  if ((v6 & 1) != 0) {
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if (![v9 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }

  id v10 = [v8 code];

  if (v10 != (id)1560)
  {
LABEL_8:
    -[NSMutableArray addObject:](v5, "addObject:", v8);
    goto LABEL_9;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSDetailedErrorsKey]);

  if ([v12 count]) {
    -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v12);
  }

LABEL_9:
  -[RMSubscribedStatusKeyPath _validateSetOncePropertiesWithErrors:](self, "_validateSetOncePropertiesWithErrors:", v5);
  v13 = v5;
  id v14 = -[NSMutableArray count](v13, "count");
  id v15 = v14;
  if (a3 && v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:]( &OBJC_CLASS___RMErrorUtilities,  "createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:",  v13));
    v17 = v16;
    if (v16) {
      *a3 = v16;
    }
  }

  return v15 == 0LL;
}

- (void)_validateManagementSourceWithErrors:(id)a3
{
  id v6 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath managementSource](self, "managementSource"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMissingMandatoryPropertyErrorWithPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createMissingMandatoryPropertyErrorWithPropertyNamed:onObject:",  @"managementSource",  self));
    [v6 addObject:v5];
  }
}

- (void)_validateSetOncePropertiesWithErrors:(id)a3
{
  id v18 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath changedValues](self, "changedValues"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  v17 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath committedValuesForKeys:](self, "committedValuesForKeys:"));
  v25 = @"managementSource";
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v25,  1LL));
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v10]);
          if (([v11 isEqual:v12] & 1) == 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            unsigned __int8 v14 = [v11 isEqual:v13];

            if ((v14 & 1) == 0)
            {
              id v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createCannotChangeValueErrorForPropertyNamed:onObject:",  v10,  v17));
              [v18 addObject:v15];
            }
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v7);
  }
}

+ (id)fetchRequestWithKeyPaths:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K IN %@)",  @"keyPath",  v4));

  [v5 setPredicate:v6];
  return v5;
}

- (id)reportDetails
{
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath lastAcknowledgedDate](self, "lastAcknowledgedDate"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v5,  @"lastAcknowledgedDate");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath lastReceivedDate](self, "lastReceivedDate"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, @"lastReceivedDate");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath keyPath](self, "keyPath"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, @"keyPath");

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath lastAcknowledgedDate](self, "lastAcknowledgedDate"));
  if (v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath lastAcknowledgedDate](self, "lastAcknowledgedDate"));
    self = (RMSubscribedStatusKeyPath *)objc_claimAutoreleasedReturnValue(-[RMSubscribedStatusKeyPath lastReceivedDate](self, "lastReceivedDate"));
    uint64_t v9 = [v2 isEqualToDate:self] ^ 1;
  }

  else
  {
    uint64_t v9 = 1LL;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, @"needsSync");

  if (v8)
  {
  }

  return v4;
}

@end