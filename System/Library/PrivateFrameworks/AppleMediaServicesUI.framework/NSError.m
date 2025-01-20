@interface NSError
- (BOOL)amsd_isCKChangeTokenExpiredError;
- (BOOL)amsd_isCKManateeUnavailable;
- (BOOL)amsd_isCKMissingManateeIdentity;
- (BOOL)amsd_isCKPartialFailureError;
- (BOOL)amsd_isCKServerRecordChangedError;
- (BOOL)amsd_isCKThrottledError;
- (BOOL)amsd_isCKUnknownItemError;
@end

@implementation NSError

- (BOOL)amsd_isCKChangeTokenExpiredError
{
  return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 21LL);
}

- (BOOL)amsd_isCKMissingManateeIdentity
{
  return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 112LL);
}

- (BOOL)amsd_isCKManateeUnavailable
{
  return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 110LL);
}

- (BOOL)amsd_isCKPartialFailureError
{
  return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 2LL);
}

- (BOOL)amsd_isCKServerRecordChangedError
{
  return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 14LL);
}

- (BOOL)amsd_isCKThrottledError
{
  else {
    return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 6LL);
  }
}

- (BOOL)amsd_isCKUnknownItemError
{
  return -[NSError ams_hasDomain:code:](self, "ams_hasDomain:code:", CKErrorDomain, 11LL);
}

@end