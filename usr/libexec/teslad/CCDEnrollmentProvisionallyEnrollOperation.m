@interface CCDEnrollmentProvisionallyEnrollOperation
- (BOOL)_validateEnrollmentResponse:(id)a3 error:(id *)a4;
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentProvisionallyEnrollOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v5 = a4;
  if (a3 == 403 || a3 == 401)
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
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[CCDError invalidDeviceError](&OBJC_CLASS___CCDError, "invalidDeviceError"));
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
  id v7 = a3;
  v10 = *(void **)(DEPLogObjects(v7, v8, v9) + 8);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = v10;
    v12 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);
  }

  id v22 = 0LL;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  1LL,  &v22));
  v14 = (NSString *)v22;
  v17 = v14;
  if (v14)
  {
    v18 = *(os_log_s **)(DEPLogObjects(v14, v15, v16) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Error: %@", buf, 0xCu);
    }

    id v19 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](&OBJC_CLASS___CCDError, "badFormatError"));
    }
  }

  else
  {
    if (-[CCDEnrollmentProvisionallyEnrollOperation _validateEnrollmentResponse:error:]( self,  "_validateEnrollmentResponse:error:",  v13,  a5))
    {
      v20 = v13;
    }

    else
    {
      v20 = 0LL;
    }

    id v19 = v20;
  }

  return v19;
}

- (BOOL)_validateEnrollmentResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v8 = *(os_log_s **)(DEPLogObjects(v5, v6, v7) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Validating enrollment response", v37, 2u);
  }

  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"enrollment_type"]);
  v12 = *(os_log_s **)(DEPLogObjects(v9, v10, v11) + 8);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    uint64_t v16 = @"No enrollment type received";
    if (v9) {
      uint64_t v16 = v9;
    }
    *(_DWORD *)v37 = 138543362;
    *(void *)&v37[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Enrollment type: %{public}@", v37, 0xCu);
  }

  if (!v9)
  {
    v21 = *(os_log_s **)(DEPLogObjects(v13, v14, v15) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v37 = 138543362;
      *(void *)&v37[4] = @"enrollment_type";
      id v22 = "No enrollment type information. There needs to be a %{public}@ section in the response.";
      v23 = v21;
      uint32_t v24 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, v37, v24);
    }

@end