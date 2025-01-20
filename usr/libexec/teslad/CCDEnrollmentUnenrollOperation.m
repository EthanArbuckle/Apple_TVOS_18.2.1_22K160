@interface CCDEnrollmentUnenrollOperation
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentUnenrollOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v5 = a4;
  if (a3 == 401)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](&OBJC_CLASS___CCDError, "cloudConfigErrorInResponse:", v5));
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](&OBJC_CLASS___CCDError, "internalErrorWithCode:", 34000LL));
    }
    v10 = v9;
  }

  else
  {
    if (a3 == 400) {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](&OBJC_CLASS___CCDError, "cloudConfigErrorInResponse:", v5));
    }
    else {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](&OBJC_CLASS___CCDError, "teslaServiceDownError"));
    }
    v10 = (void *)v6;
  }

  return v10;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  return 0LL;
}

@end