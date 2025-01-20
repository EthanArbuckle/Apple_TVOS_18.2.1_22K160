@interface CCDEnrollmentUploadPushTokenOperation
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentUploadPushTokenOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x190)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](&OBJC_CLASS___CCDError, "cloudConfigErrorInResponse:", a4));
    v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](&OBJC_CLASS___CCDError, "internalErrorWithCode:", 34000LL));
    }
    v7 = v6;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](&OBJC_CLASS___CCDError, "teslaServiceDownError"));
  }

  return v7;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v11 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  1LL,  &v11));
  id v6 = v11;
  v9 = *(os_log_s **)(DEPLogObjects(v6, v7, v8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Upload push token Response: %{public}@",  buf,  0xCu);
  }

  return v5;
}

@end