@interface SAHLShowActivity
- (id)_ad_transformedHealthSuccessResponse;
- (id)_ad_transformedShowActivityRequest;
@end

@implementation SAHLShowActivity

- (id)_ad_transformedShowActivityRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAHLShowActivity activityDataType](self, "activityDataType"));
  if ([v3 isEqualToString:SAHLActivityDataTypeExerciseValue])
  {
    uint64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:SAHLActivityDataTypeMoveValue])
  {
    uint64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:SAHLActivityDataTypeStandValue])
  {
    uint64_t v4 = 3LL;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAHLShowActivity activityView](self, "activityView"));
  id v6 = objc_msgSend( [STShowActivityRequest alloc],  "_initWithDataType:view:",  v4,  objc_msgSend(v5, "isEqualToString:", SAHLActivityViewDetailValue));

  return v6;
}

- (id)_ad_transformedHealthSuccessResponse
{
  return objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
}

@end