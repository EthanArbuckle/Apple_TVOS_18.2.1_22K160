@interface SAGenericCommand
- (int64_t)resultCallbackCode;
@end

@implementation SAGenericCommand

- (int64_t)resultCallbackCode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAGenericCommand className](self, "className"));
  if ([v3 isEqualToString:SACommandFailedClassIdentifier])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGenericCommand properties](self, "properties"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:SACommandFailedErrorCodePListKey]);
    id v6 = [v5 integerValue];

    if (v6) {
      int64_t v7 = (int64_t)v6;
    }
    else {
      int64_t v7 = -1LL;
    }
    goto LABEL_16;
  }

  if ([v3 isEqualToString:SACommandSucceededClassIdentifier])
  {
LABEL_6:
    int64_t v7 = 0LL;
    goto LABEL_16;
  }

  if ([v3 isEqualToString:SAPhoneSearchCompletedClassIdentifier])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAGenericCommand properties](self, "properties"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:SAPhoneSearchCompletedPhoneSearchResultsPListKey]);

    id v10 = [v9 count];
    v11 = (int64_t *)&SAPhonePhoneSearchHasResultsErrorCode;
    if (!v10) {
      v11 = (int64_t *)&SAPhonePhoneSearchHasNoResultsErrorCode;
    }
    int64_t v7 = *v11;
  }

  else
  {
    if (([v3 isEqualToString:SACFFlowCompletedClassIdentifier] & 1) == 0
      && ![v3 isEqualToString:SACFProviderCompletedClassIdentifier])
    {
      goto LABEL_6;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAGenericCommand properties](self, "properties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:SACFAbstractClientCommandCompletedStatusPListKey]);
    id v14 = [v13 integerValue];

    if (v14 == (id)SACFSuccessErrorCode) {
      int64_t v7 = 0LL;
    }
    else {
      int64_t v7 = (int64_t)v14;
    }
  }

@end