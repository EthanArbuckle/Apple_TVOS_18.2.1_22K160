@interface RMModelManagementTestCommandCommand
- (BOOL)rm_requestExecutesWithoutReturning;
- (void)rm_executeRequestOnBehalfOfManagementChannel:(id)a3 completionHandler:(id)a4;
@end

@implementation RMModelManagementTestCommandCommand

- (void)rm_executeRequestOnBehalfOfManagementChannel:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMModelManagementTestCommandCommand payloadReturnStatus](self, "payloadReturnStatus"));
  unsigned int v7 = [v6 isEqualToString:@"Executed"];

  if (v7)
  {
    v18 = @"Echo";
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMModelManagementTestCommandCommand payloadEcho](self, "payloadEcho"));
    v19 = v8;
    __int16 v9 = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMModelManagementTestCommandCommand unknownPayloadKeys](self, "unknownPayloadKeys"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allObjects]);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMModelManagementTestCommandCommand payloadReturnStatus](self, "payloadReturnStatus"));
    int v14 = [v13 isEqualToString:@"Failed"];

    __int16 v9 = 2;
    if ((v14 & 1) != 0)
    {
      v10 = 0LL;
      v12 = 0LL;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RMModelManagementTestCommandCommand payloadReturnStatus](self, "payloadReturnStatus"));
      unsigned int v16 = [v15 isEqualToString:@"Pending"];

      v10 = 0LL;
      v12 = 0LL;
      if (v16) {
        __int16 v9 = 3;
      }
      else {
        __int16 v9 = 2;
      }
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RMModelManagementTestCommandCommand commandIdentifier](self, "commandIdentifier"));
  (*((void (**)(id, void *, void, void *, void, void *, void))v5 + 2))( v5,  v17,  v9,  v10,  0LL,  v12,  0LL);
}

- (BOOL)rm_requestExecutesWithoutReturning
{
  return 0;
}

@end