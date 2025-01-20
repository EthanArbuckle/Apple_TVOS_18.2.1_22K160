@interface PushRegisterTask
- (void)main;
@end

@implementation PushRegisterTask

- (void)main
{
  v3 = *(void **)&self->super._success;
  if (v3)
  {
    else {
      id v4 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v10 = objc_alloc_init(&OBJC_CLASS___AMSURLRequestEncoder);
    -[AMSURLRequestEncoder setBag:](v10, "setBag:", v9);
    -[AMSURLRequestEncoder setAccount:](v10, "setAccount:", *(void *)&self->super._success);
    -[AMSURLRequestEncoder setRequestEncoding:](v10, "setRequestEncoding:", 2LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    [v11 setObject:self->_account forKeyedSubscript:@"environment"];
    [v11 setObject:self->super._error forKeyedSubscript:@"token"];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceName](&OBJC_CLASS___AMSDevice, "deviceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4 allowLossyConversion:1]);
    [v11 setObject:v13 forKeyedSubscript:@"device-name-data"];

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice serialNumber](&OBJC_CLASS___AMSDevice, "serialNumber"));
    [v11 setObject:v14 forKeyedSubscript:@"serial-number"];

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
    [v11 setObject:v15 forKeyedSubscript:@"guid"];

    id v60 = 0LL;
    id v16 = sub_100255E30((uint64_t)v9, (uint64_t)@"push-notifications/register-success", &v60);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = v60;
    if (v18)
    {
      uint64_t v19 = ASDLogHandleForCategory(26LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        token = self->_token;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = token;
        __int16 v62 = 2114;
        id v63 = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "[%@] Encountered error while registering push token: %{public}@",  buf,  0x16u);
      }

      uint64_t v21 = ASDErrorWithSafeUserInfo(v18);
      id v22 = (id)objc_claimAutoreleasedReturnValue(v21);
      if (v17) {
        goto LABEL_12;
      }
    }

    else
    {
      id v22 = 0LL;
      if (v17)
      {
LABEL_12:
        v23 = (void *)objc_claimAutoreleasedReturnValue( -[AMSURLRequestEncoder requestWithMethod:URL:parameters:]( v10,  "requestWithMethod:URL:parameters:",  4LL,  v17,  v11));
        *(void *)buf = 0LL;
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 resultWithError:buf]);
        v25 = (os_log_s *)*(id *)buf;

        uint64_t v26 = ASDErrorWithSafeUserInfo(v25);
        id v22 = (id)objc_claimAutoreleasedReturnValue(v26);
        goto LABEL_17;
      }
    }

    uint64_t v27 = ASDLogHandleForCategory(26LL);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v54 = self->_token;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v54;
      _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "[%@] Could not find URL for registering push token",  buf,  0xCu);
    }

    v24 = 0LL;
LABEL_17:

    id v8 = v22;
    if (!v24)
    {
      uint64_t v35 = ASDLogHandleForCategory(26LL);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v55 = self->_token;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v55;
        _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "[%@] Failed to create push register request.",  buf,  0xCu);
      }

      if (!v8)
      {
        objc_opt_self(&OBJC_CLASS___NSError);
        uint64_t v37 = ASDErrorWithDescription(ASDErrorDomain, 1100LL, @"Failed to create register request.");
        id v8 = (id)objc_claimAutoreleasedReturnValue(v37);
      }

      -[Task completeWithError:](self, "completeWithError:", v8);
      goto LABEL_40;
    }

    id v28 = sub_1001E636C((uint64_t)&OBJC_CLASS___AMSURLSession);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 dataTaskPromiseWithRequest:v24]);
    id v59 = 0LL;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v30 resultWithError:&v59]);
    id v32 = v59;
    if (v32)
    {
      uint64_t v33 = ASDLogHandleForCategory(26LL);
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v53 = self->_token;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v53;
        __int16 v62 = 2114;
        id v63 = v32;
        _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "[%@] Failed register push token call with error: %{public}@",  buf,  0x16u);
      }

      -[Task completeWithError:](self, "completeWithError:", v32);
    }

    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v31 object]);

      if (v38)
      {
        id v39 = [v31 responseStatusCode];
        uint64_t v40 = ASDLogHandleForCategory(26LL);
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        v42 = v41;
        if (v39 == (id)200)
        {
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v43 = self->_token;
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "[%@] Successfully registered push token",  buf,  0xCu);
          }

          -[Task completeWithSuccess](self, "completeWithSuccess");
          goto LABEL_39;
        }

        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v57 = self->_token;
          id v58 = [v31 responseStatusCode];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v57;
          __int16 v62 = 2050;
          id v63 = v58;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "[%@] Failed register push token call with unknown error and status code: %{public}ld",  buf,  0x16u);
        }

        objc_opt_self(&OBJC_CLASS___NSError);
        uint64_t v46 = ASDErrorDomain;
        v47 = @"Push register request failed.";
        uint64_t v48 = 1101LL;
      }

      else
      {
        uint64_t v44 = ASDLogHandleForCategory(26LL);
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v56 = self->_token;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v56;
          _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "[%@] Did not receive response from register push call",  buf,  0xCu);
        }

        objc_opt_self(&OBJC_CLASS___NSError);
        uint64_t v46 = ASDErrorDomain;
        v47 = @"Push register request received no response.";
        uint64_t v48 = 1102LL;
      }

      uint64_t v49 = ASDErrorWithDescription(v46, v48, v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      -[Task completeWithError:](self, "completeWithError:", v50);
    }

- (void).cxx_destruct
{
}

@end