@interface SAPhoneSearchCompleted
- (int64_t)resultCallbackCode;
@end

@implementation SAPhoneSearchCompleted

- (int64_t)resultCallbackCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAPhoneSearchCompleted phoneSearchResults](self, "phoneSearchResults"));
  id v3 = [v2 count];
  v4 = (int64_t *)&SAPhonePhoneSearchHasResultsErrorCode;
  if (!v3) {
    v4 = (int64_t *)&SAPhonePhoneSearchHasNoResultsErrorCode;
  }
  int64_t v5 = *v4;

  return v5;
}

@end