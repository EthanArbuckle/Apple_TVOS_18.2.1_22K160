@interface RMProtocolCommandRequest_StatusReason
+ (id)failedWithUnknownPayloadKeys:(id)a3;
+ (id)reasonWithError:(id)a3;
@end

@implementation RMProtocolCommandRequest_StatusReason

+ (id)reasonWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:RMErrorUserInfoKeyDescriptionKey]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSDebugDescriptionErrorKey]);
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
    v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = (id)objc_claimAutoreleasedReturnValue([v4 localizedFailureReason]);
    }
    id v10 = v13;
  }

  if ([v6 length])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 buildWithCode:v6 description:v10 details:0]);
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"An unknown error occurred: %@",  v10));
    v21[0] = @"Domain";
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    v21[1] = @"Code";
    v22[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 code]));
    v22[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  2LL));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[RMModelAnyPayload buildFromDictionary:]( &OBJC_CLASS___RMModelAnyPayload,  "buildFromDictionary:",  v18));
    v14 = (void *)objc_claimAutoreleasedReturnValue([a1 buildWithCode:@"Error.Unknown" description:v15 details:v19]);
  }

  return v14;
}

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

@end