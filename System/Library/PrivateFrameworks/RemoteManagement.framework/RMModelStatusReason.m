@interface RMModelStatusReason
+ (id)activationFailed:(id)a3;
+ (id)assetIsNotReferencedByConfiguration:(id)a3;
+ (id)configurationFailed:(id)a3;
+ (id)configurationIsNotReferencedByAnActivation:(id)a3;
+ (id)failedWithUnknownDeclarationType:(id)a3;
+ (id)failedWithUnknownPayloadKeys:(id)a3;
+ (id)invalidPayloadForDeclaration:(id)a3;
+ (id)missingAssetIdentifiers:(id)a3 forConfiguration:(id)a4;
+ (id)missingConfigurationIdentifiers:(id)a3 forActivation:(id)a4;
+ (id)missingStateForDeclaration:(id)a3;
+ (id)predicateEvaluatedToFalseForActivation:(id)a3;
+ (id)predicateEvaluationFailedWithError:(id)a3 forActivation:(id)a4;
@end

@implementation RMModelStatusReason

+ (id)failedWithUnknownPayloadKeys:(id)a3
{
  v9 = @"UnknownPayloadKeys";
  id v10 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 buildWithCode:@"Error.UnknownPayloadKeys" description:@"Unknown Payload Keys" details:v6]);
  return v7;
}

+ (id)failedWithUnknownDeclarationType:(id)a3
{
  v9 = @"UnknownDeclarationType";
  id v10 = a3;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue( [a1 buildWithCode:@"Error.UnknownDeclarationType" description:@"Unknown Declaration Type" details:v6]);
  return v7;
}

+ (id)predicateEvaluatedToFalseForActivation:(id)a3
{
  id v3 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 predicateDescription]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activation’s (%@:%@) predicate (%@) evaluated to false.",  v16,  v15,  v5));
  v17[0] = @"Identifier";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v18[0] = v7;
  v17[1] = @"ServerToken";
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  v18[1] = v8;
  v17[2] = @"Predicate";
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 predicateDescription]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
  v18[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Info.Predicate",  v6,  v12));

  return v13;
}

+ (id)predicateEvaluationFailedWithError:(id)a3 forActivation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if ([v7 isEqualToString:RMErrorDomain] && (uint64_t)objc_msgSend(v5, "code") >= 2100)
  {
    uint64_t v8 = (uint64_t)[v5 code];

    if (v8 <= 2199)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelStatusReason reasonWithError:](&OBJC_CLASS___RMModelStatusReason, "reasonWithError:", v5));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 statusDetails]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dictKeys]);
      id v12 = [v11 mutableCopy];
      v13 = v12;
      if (v12) {
        v14 = (NSMutableDictionary *)v12;
      }
      else {
        v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      v18 = v14;

      v47[0] = @"Identifier";
      v33 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      v48[0] = v33;
      v47[1] = @"ServerToken";
      v34 = (void *)objc_claimAutoreleasedReturnValue([v6 serverToken]);
      v48[1] = v34;
      v47[2] = @"Predicate";
      v35 = (void *)objc_claimAutoreleasedReturnValue([v6 predicateDescription]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v35 description]);
      v48[2] = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));
      -[NSMutableDictionary setDictionary:](v18, "setDictionary:", v37);

      v31 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v18));
      id v44 = v9;
      [v9 setStatusDetails:v31];
      goto LABEL_14;
    }
  }

  else
  {
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:NSDebugDescriptionErrorKey]);
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    v20 = v19;
    if (v19) {
      v21 = v19;
    }
    else {
      v21 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v5 localizedFailureReason]);
    }
    v18 = v21;
  }

  uint64_t v40 = objc_claimAutoreleasedReturnValue([v6 identifier]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v6 serverToken]);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v6 predicateDescription]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v43 description]);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activation’s (%@:%@) predicate (%@) failed to evaluate: %@.",  v40,  v42,  v41,  v18));
  v45[0] = @"Identifier";
  v39 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  v46[0] = v39;
  v45[1] = @"ServerToken";
  v38 = (void *)objc_claimAutoreleasedReturnValue([v6 serverToken]);
  v46[1] = v38;
  v45[2] = @"Predicate";
  v23 = (void *)objc_claimAutoreleasedReturnValue([v6 predicateDescription]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
  v46[2] = v24;
  v45[3] = @"Domain";
  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  v46[3] = v25;
  v45[4] = @"Code";
  id v26 = v6;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 code]));
  v46[4] = v27;
  id v28 = v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v46,  v45,  5LL));
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v29));
  id v44 = (id)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.PredicateFailed",  v22,  v30));

  id v5 = v28;
  id v6 = v26;

  v31 = (void *)v40;
LABEL_14:

  return v44;
}

+ (id)missingAssetIdentifiers:(id)a3 forConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 serverToken]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Configuration (%@:%@) is missing assets.",  v7,  v8));
  v19[0] = @"Identifier";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v20[0] = v10;
  v19[1] = @"ServerToken";
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 serverToken]);

  v20[1] = v11;
  v19[2] = @"AssetIdentifiers";
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));

  v20[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.MissingAssets",  v9,  v16));

  return v17;
}

+ (id)missingConfigurationIdentifiers:(id)a3 forActivation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 serverToken]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activation (%@:%@) is missing configurations.",  v7,  v8));
  v19[0] = @"Identifier";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v20[0] = v10;
  v19[1] = @"ServerToken";
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 serverToken]);

  v20[1] = v11;
  v19[2] = @"ConfigurationIdentifiers";
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);

  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", @", "));

  v20[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.MissingConfigurations",  v9,  v16));

  return v17;
}

+ (id)invalidPayloadForDeclaration:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 entity]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload entity](&OBJC_CLASS___RMActivationPayload, "entity"));
  unsigned __int8 v6 = [v4 isKindOfEntity:v5];

  if ((v6 & 1) != 0)
  {
    v7 = @"Activation";
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayload entity](&OBJC_CLASS___RMAssetPayload, "entity"));
    unsigned __int8 v9 = [v4 isKindOfEntity:v8];

    if ((v9 & 1) != 0)
    {
      v7 = @"Asset";
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
      unsigned __int8 v11 = [v4 isKindOfEntity:v10];

      if ((v11 & 1) != 0) {
        v7 = @"Configuration";
      }
      else {
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 name]);
      }
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@:%@) has an invalid payload.",  v7,  v12,  v13));
  v21[0] = @"Identifier";
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v21[1] = @"ServerToken";
  v22[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  v22[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.InvalidPayload",  v14,  v18));

  return v19;
}

+ (id)missingStateForDeclaration:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 entity]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[RMActivationPayload entity](&OBJC_CLASS___RMActivationPayload, "entity"));
  unsigned __int8 v6 = [v4 isKindOfEntity:v5];

  if ((v6 & 1) != 0)
  {
    v7 = @"Activation";
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[RMAssetPayload entity](&OBJC_CLASS___RMAssetPayload, "entity"));
    unsigned __int8 v9 = [v4 isKindOfEntity:v8];

    if ((v9 & 1) != 0)
    {
      v7 = @"Asset";
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMConfigurationPayload entity](&OBJC_CLASS___RMConfigurationPayload, "entity"));
      unsigned __int8 v11 = [v4 isKindOfEntity:v10];

      if ((v11 & 1) != 0) {
        v7 = @"Configuration";
      }
      else {
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 name]);
      }
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (%@:%@) is missing state.",  v7,  v12,  v13));
  v21[0] = @"Identifier";
  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v21[1] = @"ServerToken";
  v22[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  v22[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.MissingState",  v14,  v18));

  return v19;
}

+ (id)activationFailed:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Activation “%@:%@” has errors.",  v4,  v5));
  v13[0] = @"Identifier";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13[1] = @"ServerToken";
  v14[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);

  v14[1] = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v9));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.ActivationFailed",  v6,  v10));

  return v11;
}

+ (id)configurationFailed:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Configuration “%@:%@” has errors.",  v4,  v5));
  v13[0] = @"Identifier";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13[1] = @"ServerToken";
  v14[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);

  v14[1] = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v9));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Error.ConfigurationFailed",  v6,  v10));

  return v11;
}

+ (id)configurationIsNotReferencedByAnActivation:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Configuration “%@:%@” is not referenced by an activation.",  v4,  v5));
  v13[0] = @"Identifier";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13[1] = @"ServerToken";
  v14[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);

  v14[1] = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v9));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Info.NotReferencedByActivation",  v6,  v10));

  return v11;
}

+ (id)assetIsNotReferencedByConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Asset “%@:%@” is not referenced by a configuration.",  v4,  v5));
  v13[0] = @"Identifier";
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);
  v13[1] = @"ServerToken";
  v14[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 serverToken]);

  v14[1] = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMModelAnyPayload buildFromDictionary:](&OBJC_CLASS___RMModelAnyPayload, "buildFromDictionary:", v9));
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelStatusReason buildWithCode:description:details:]( &OBJC_CLASS___RMModelStatusReason,  "buildWithCode:description:details:",  @"Info.NotReferencedByConfiguration",  v6,  v10));

  return v11;
}

@end