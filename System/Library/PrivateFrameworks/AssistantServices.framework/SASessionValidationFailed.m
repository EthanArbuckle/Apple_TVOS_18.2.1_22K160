@interface SASessionValidationFailed
- (BOOL)ad_shouldRetry;
- (int64_t)ad_afErrorCode;
@end

@implementation SASessionValidationFailed

- (BOOL)ad_shouldRetry
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASessionValidationFailed errorCode](self, "errorCode"));
  if (([v2 isEqualToString:SAValidationFailedErrorCodeInvalidSessionInfoValue] & 1) != 0
    || ([v2 isEqualToString:SAValidationFailedErrorCodeInvalidValidationDataValue] & 1) != 0
    || ([v2 isEqualToString:SAValidationFailedErrorCodeInvalidFingerprintValue] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }

  else
  {
    unsigned __int8 v3 = [v2 isEqualToString:SAValidationFailedErrorCodeAppleConnectServerUnreachableValue];
  }

  return v3;
}

- (int64_t)ad_afErrorCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SASessionValidationFailed errorCode](self, "errorCode"));
  else {
    int64_t v3 = 3LL;
  }

  return v3;
}

@end