@interface RMCommandPayload
+ (id)keyPathsForValuesAffectingManagementSourceIdentifier;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)managementSourceIdentifier;
- (id)reportDetails;
@end

@implementation RMCommandPayload

+ (id)keyPathsForValuesAffectingManagementSourceIdentifier
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"managementSource.identifier");
}

- (NSString)managementSourceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload managementSource](self, "managementSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

- (BOOL)validateForInsert:(id *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___RMCommandPayload;
  id v22 = 0LL;
  unsigned __int8 v6 = -[RMCommandPayload validateForInsert:](&v21, "validateForInsert:", &v22);
  id v7 = v22;
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
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload managementSource](self, "managementSource"));
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMissingMandatoryPropertyErrorWithPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createMissingMandatoryPropertyErrorWithPropertyNamed:onObject:",  @"managementSource",  self));
    -[NSMutableArray addObject:](v5, "addObject:", v14);
  }

  v15 = v5;
  id v16 = -[NSMutableArray count](v15, "count");
  id v17 = v16;
  if (a3 && v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:]( &OBJC_CLASS___RMErrorUtilities,  "createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:",  v15));
    v19 = v18;
    if (v18) {
      *a3 = v18;
    }
  }

  return v17 == 0LL;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v33 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___RMCommandPayload;
  id v40 = 0LL;
  unsigned __int8 v4 = -[RMCommandPayload validateForUpdate:](&v39, "validateForUpdate:", &v40);
  id v5 = v40;
  unsigned __int8 v6 = v5;
  if ((v4 & 1) != 0) {
    goto LABEL_9;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if (![v7 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }

  id v8 = [v6 code];

  if (v8 != (id)1560)
  {
LABEL_8:
    -[NSMutableArray addObject:](v33, "addObject:", v6);
    goto LABEL_9;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSDetailedErrorsKey]);

  if ([v10 count]) {
    -[NSMutableArray addObjectsFromArray:](v33, "addObjectsFromArray:", v10);
  }

LABEL_9:
  v30 = v6;
  v31 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload changedValues](self, "changedValues"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload committedValuesForKeys:](self, "committedValuesForKeys:"));
  v42[0] = @"identifier";
  v42[1] = @"managementSource";
  v42[2] = @"payload";
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 3LL));
  id v13 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v17]);
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v17]);
          if (([v18 isEqual:v19] & 1) == 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
            unsigned __int8 v21 = [v18 isEqual:v20];

            if ((v21 & 1) == 0)
            {
              id v22 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createCannotChangeValueErrorForPropertyNamed:onObject:",  v17,  self));
              -[NSMutableArray addObject:](v33, "addObject:", v22);
            }
          }
        }
      }

      id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v14);
  }

  v23 = v33;
  id v24 = -[NSMutableArray count](v23, "count");
  id v25 = v24;
  if (v31 && v24)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:]( &OBJC_CLASS___RMErrorUtilities,  "createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:",  v23));
    v27 = v26;
    if (v26) {
      id *v31 = v26;
    }
  }

  return v25 == 0LL;
}

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload type](self, "type"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"type");

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload identifier](self, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"identifier");

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMCommandPayload state](self, "state"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v6 status]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"state.status");

  id v8 = -[NSMutableDictionary copy](v3, "copy");
  return v8;
}

@end