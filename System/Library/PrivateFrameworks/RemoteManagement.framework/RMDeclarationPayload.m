@interface RMDeclarationPayload
+ (BOOL)isSignificantChange:(id)a3;
+ (id)keyPathsForValuesAffectingManagementSourceIdentifier;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)description;
- (NSString)managementSourceIdentifier;
- (id)reportDetails;
- (signed)_currentLoadState;
- (void)_validateLoadStateWithErrors:(id)a3;
- (void)_validateManagementSourceWithErrors:(id)a3;
- (void)_validateSetOncePropertiesWithErrors:(id)a3;
@end

@implementation RMDeclarationPayload

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload entity](self, "entity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload serverToken](self, "serverToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ { identifier = %@, token = %@ }>",  v4,  v5,  v6));

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingManagementSourceIdentifier
{
  return +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"managementSource.identifier");
}

- (NSString)managementSourceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload managementSource](self, "managementSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);

  return (NSString *)v3;
}

+ (BOOL)isSignificantChange:(id)a3
{
  return 1;
}

- (BOOL)validateForInsert:(id *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___RMDeclarationPayload;
  id v20 = 0LL;
  unsigned __int8 v6 = -[RMDeclarationPayload validateForInsert:](&v19, "validateForInsert:", &v20);
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
  -[RMDeclarationPayload _validateManagementSourceWithErrors:](self, "_validateManagementSourceWithErrors:", v5);
  -[RMDeclarationPayload _validateLoadStateWithErrors:](self, "_validateLoadStateWithErrors:", v5);
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
  v19.super_class = (Class)&OBJC_CLASS___RMDeclarationPayload;
  id v20 = 0LL;
  unsigned __int8 v6 = -[RMDeclarationPayload validateForUpdate:](&v19, "validateForUpdate:", &v20);
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
  -[RMDeclarationPayload _validateSetOncePropertiesWithErrors:](self, "_validateSetOncePropertiesWithErrors:", v5);
  -[RMDeclarationPayload _validateLoadStateWithErrors:](self, "_validateLoadStateWithErrors:", v5);
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload managementSource](self, "managementSource"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMissingMandatoryPropertyErrorWithPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createMissingMandatoryPropertyErrorWithPropertyNamed:onObject:",  @"managementSource",  self));
    [v6 addObject:v5];
  }
}

- (void)_validateSetOncePropertiesWithErrors:(id)a3
{
  id v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload changedValues](self, "changedValues"));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v20 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload committedValuesForKeys:](self, "committedValuesForKeys:"));
  v28[0] = @"declarationType";
  v28[1] = @"identifier";
  v28[2] = @"managementSource";
  v28[3] = @"payload";
  v28[4] = @"state";
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 5LL));
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
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
              id v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createCannotChangeValueErrorForPropertyNamed:onObject:",  v10,  v20));
              [v21 addObject:v15];
            }
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v7);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"serverToken"]);
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"serverToken"]);
    if (-[RMDeclarationPayload _currentLoadState](v20, "_currentLoadState")
      && ([v16 isEqual:v17] & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:onObject:]( &OBJC_CLASS___RMErrorUtilities,  "createCannotChangeValueErrorForPropertyNamed:onObject:",  @"serverToken",  v20));
      [v21 addObject:v18];
    }
  }
}

- (signed)_currentLoadState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload changedValues](self, "changedValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"loadState"]);

  if (v4)
  {
    uint64_t v10 = @"loadState";
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload committedValuesForKeys:](self, "committedValuesForKeys:", v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"loadState"]);

    signed __int16 v8 = (unsigned __int16)[v7 integerValue];
  }

  else
  {
    signed __int16 v8 = (unsigned __int16)-[RMDeclarationPayload loadState](self, "loadState");
  }

  return v8;
}

- (void)_validateLoadStateWithErrors:(id)a3
{
  id v11 = a3;
  id v4 = -[RMDeclarationPayload loadState](self, "loadState");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload payload](self, "payload"));
  id v6 = (void *)v5;
  BOOL v7 = (_DWORD)v4 == 4 || (_DWORD)v4 == 1;
  if (v7 && !v5)
  {
    signed __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", v4));
    v9 = &off_10001E838;
LABEL_11:
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createMismatchedValuesErrorForPropertyNamed:onObject:expected:actual:]( &OBJC_CLASS___RMErrorUtilities,  "createMismatchedValuesErrorForPropertyNamed:onObject:expected:actual:",  @"loadState",  self,  v9,  v8));
    [v11 addObject:v10];

    goto LABEL_12;
  }

  if (!(_DWORD)v4 && v5)
  {
    signed __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](&OBJC_CLASS___NSNumber, "numberWithShort:", 0LL));
    v9 = &off_10001E850;
    goto LABEL_11;
  }

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload declarationType](self, "declarationType"));

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload declarationType](self, "declarationType"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  v5,  @"declarationType");
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload identifier](self, "identifier"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"identifier");

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload serverToken](self, "serverToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"serverToken");

  unsigned int v8 = -[RMDeclarationPayload loadState](self, "loadState");
  if (v8 > 3) {
    v9 = @"unknown";
  }
  else {
    v9 = *(&off_10001C568 + (int)v8);
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v9, @"loadState");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload state](self, "state"));
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___RMReportDetails])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload state](self, "state"));
    char v12 = objc_opt_respondsToSelector(v11, "reportDetails");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload state](self, "state"));
      unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 reportDetails]);
      id v15 = @"state";
LABEL_13:
      -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v15);

      goto LABEL_14;
    }
  }

  else
  {
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload state](self, "state"));
  if (![v13 conformsToProtocol:&OBJC_PROTOCOL___RMDeclarationPayloadActivatableState])
  {
LABEL_14:

    goto LABEL_15;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload state](self, "state"));
  char v17 = objc_opt_respondsToSelector(v16, "active");

  if ((v17 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeclarationPayload state](self, "state"));
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 active]));
    id v15 = @"active";
    goto LABEL_13;
  }

@end