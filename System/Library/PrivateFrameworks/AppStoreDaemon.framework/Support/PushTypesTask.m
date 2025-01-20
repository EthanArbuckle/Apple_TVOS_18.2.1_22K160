@interface PushTypesTask
- (void)main;
@end

@implementation PushTypesTask

- (void)main
{
  if (self && self->_logKey) {
    goto LABEL_79;
  }
  objc_opt_self(&OBJC_CLASS___NSError);
  uint64_t v4 = ASDErrorWithDescription(ASDErrorDomain, 1103LL, @"No account found.");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v5) {
    goto LABEL_14;
  }
  if (self)
  {
LABEL_79:
    if (self->_account) {
      goto LABEL_4;
    }
    logKey = self->_logKey;
  }

  else
  {
    logKey = 0LL;
  }

  if ((-[LogKey isActive](logKey, "isActive") & 1) == 0)
  {
    objc_opt_self(&OBJC_CLASS___NSError);
    uint64_t v7 = ASDErrorWithDescription(ASDErrorDomain, 1104LL, @"Attempting to add push type for inactive account.");
    uint64_t v5 = objc_claimAutoreleasedReturnValue(v7);
    if (v5) {
      goto LABEL_14;
    }
  }

  if (self && (self->_account || self->_environment)) {
    goto LABEL_4;
  }
  uint64_t v8 = ASDErrorWithDescription(ASDErrorDomain, 1105LL, @"No push token registered.");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v8);
  if (v5)
  {
LABEL_14:
    v9 = (void *)v5;
    v10 = 0LL;
    goto LABEL_58;
  }

  if (self)
  {
LABEL_4:
    else {
      id v3 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v12 = objc_alloc_init(&OBJC_CLASS___AMSURLRequestEncoder);
    -[AMSURLRequestEncoder setBag:](v12, "setBag:", v11);
    -[AMSURLRequestEncoder setAccount:](v12, "setAccount:", self->_logKey);
    -[AMSURLRequestEncoder setRequestEncoding:](v12, "setRequestEncoding:", 2LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v91 = @"media-kinds";
    v92 = &off_10040DDC8;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
    [v13 setObject:v14 forKeyedSubscript:@"parameters"];

    [v13 setObject:@"purchase" forKeyedSubscript:@"notification-type"];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
    [v13 setObject:v15 forKeyedSubscript:@"guid"];

    if (self->_account)
    {
      v16 = @"push-notification-types/remove-push-notification-type-url";
      uint64_t v83 = 0LL;
      v17 = (id *)&v83;
      v18 = &v83;
    }

    else
    {
      v16 = @"push-notification-types/add-push-notification-type-url";
      uint64_t v84 = 0LL;
      v17 = (id *)&v84;
      v18 = &v84;
    }

    id v19 = sub_100255E30((uint64_t)v11, (uint64_t)v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (__CFString *)*v17;
    if (v21)
    {
      uint64_t v22 = ASDLogHandleForCategory(26LL);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v49 = *(void **)&self->super._success;
        *(_DWORD *)buf = 138412546;
        v86 = v49;
        __int16 v87 = 2114;
        v88 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "[%@] Error while registering for push: %{public}@",  buf,  0x16u);
      }

      uint64_t v24 = ASDErrorWithSafeUserInfo(v21);
      id v25 = (id)objc_claimAutoreleasedReturnValue(v24);
      if (v20) {
        goto LABEL_23;
      }
    }

    else
    {
      id v25 = 0LL;
      if (v20)
      {
LABEL_23:
        v26 = (void *)objc_claimAutoreleasedReturnValue( -[AMSURLRequestEncoder requestWithMethod:URL:parameters:]( v12,  "requestWithMethod:URL:parameters:",  4LL,  v20,  v13));
        id v82 = 0LL;
        v10 = (void *)objc_claimAutoreleasedReturnValue([v26 resultWithError:&v82]);
        v27 = (__CFString *)v82;

        uint64_t v28 = ASDErrorWithSafeUserInfo(v27);
        id v25 = (id)objc_claimAutoreleasedReturnValue(v28);
LABEL_31:

        goto LABEL_32;
      }
    }

    if (self->_account) {
      v29 = @"Remove";
    }
    else {
      v29 = @"Add";
    }
    v27 = v29;
    uint64_t v30 = ASDLogHandleForCategory(26LL);
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v51 = *(void **)&self->super._success;
      *(_DWORD *)buf = 138412546;
      v86 = v51;
      __int16 v87 = 2112;
      v88 = v27;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "[%@] Could not find URL to %@ push type",  buf,  0x16u);
    }

    v10 = 0LL;
    goto LABEL_31;
  }

  id v25 = 0LL;
  v10 = 0LL;
LABEL_32:
  id v32 = v25;
  v9 = v32;
  if (!v10)
  {
    objc_opt_self(&OBJC_CLASS___NSError);
    uint64_t v33 = ASDErrorWithDescription(ASDErrorDomain, 1100LL, @"Failed to create push types request");
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);

    v9 = (void *)v34;
    if (!v34) {
      goto LABEL_36;
    }
LABEL_58:
    self->super._error = (NSError *)1;
    -[Task completeWithError:](self, "completeWithError:", v9);

    goto LABEL_59;
  }

  if (v32) {
    goto LABEL_58;
  }
LABEL_36:
  id v35 = sub_1001E636C((uint64_t)&OBJC_CLASS___AMSURLSession);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 dataTaskPromiseWithRequest:v10]);
  id v81 = 0LL;
  v38 = (void *)objc_claimAutoreleasedReturnValue([v37 resultWithError:&v81]);
  id v39 = v81;
  v40 = v39;
  if (v39)
  {
    uint64_t v41 = ASDErrorWithSafeUserInfo(v39);
    uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
LABEL_38:
    v9 = (void *)v42;
    goto LABEL_57;
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v38 object]);

  if (!v43)
  {
    objc_opt_self(&OBJC_CLASS___NSError);
    uint64_t v48 = ASDErrorWithDescription(ASDErrorDomain, 1102LL, @"Received no response for push types call.");
    uint64_t v42 = objc_claimAutoreleasedReturnValue(v48);
    goto LABEL_38;
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue([v38 object]);
  id v45 = sub_1001DF39C(v44, @"status", (id)0x7FFFFFFFFFFFFFFFLL);
  if (v45)
  {
    if (v45 == (id)-2LL)
    {
      if (!self || (account = self->_account) == 0LL)
      {
        uint64_t v54 = ASDLogHandleForCategory(26LL);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v57 = (void *)objc_opt_class(self, v56);
          environment = self->_environment;
          v75 = *(__CFString **)&self->super._success;
          id v77 = v57;
          id v58 = sub_1001D4008(environment);
          uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);
          *(_DWORD *)buf = 138543874;
          v86 = v57;
          __int16 v87 = 2112;
          v88 = v75;
          __int16 v89 = 2114;
          uint64_t v90 = v59;
          v60 = (void *)v59;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%@] Registering push token: %{public}@",  buf,  0x20u);
        }

        v78 = objc_alloc(&OBJC_CLASS___PushRegisterTask);
        if (self) {
          v61 = self->_logKey;
        }
        else {
          v61 = 0LL;
        }
        v62 = self->_environment;
        responseType = (void *)self->_responseType;
        v63 = *(void **)&self->super._success;
        v64 = v61;
        v65 = sub_1002517EC((id *)&v78->super.super.super.isa, v64, v62, responseType, v63);

        v66 = v65;
        id v80 = 0LL;
        LOBYTE(v65) = -[Task runSubTask:returningError:](self, "runSubTask:returningError:", v65, &v80);
        id v52 = v80;
        if ((v65 & 1) != 0)
        {
          v9 = 0LL;
          self->super._error = (NSError *)3;
        }

        else
        {
          uint64_t v67 = ASDLogHandleForCategory(26LL);
          v68 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v70 = (void *)objc_opt_class(self, v69);
            v71 = *(__CFString **)&self->super._success;
            *(_DWORD *)buf = 138543874;
            v86 = v70;
            __int16 v87 = 2112;
            v88 = v71;
            __int16 v89 = 2114;
            uint64_t v90 = (uint64_t)v52;
            v79 = v66;
            id v72 = v70;
            _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%@] Registration failed with error: %{public}@",  buf,  0x20u);

            v66 = v79;
          }

          uint64_t v73 = ASDErrorWithUnderlyingErrorAndDescription( v52,  ASDErrorDomain,  1105LL,  @"No push token registered.");
          v9 = (void *)objc_claimAutoreleasedReturnValue(v73);
        }

        goto LABEL_55;
      }

      uint64_t v47 = ASDErrorDomain;
    }

    else
    {
      uint64_t v47 = ASDErrorDomain;
      if (!self) {
        goto LABEL_53;
      }
      account = self->_account;
    }

    if (account)
    {
      v50 = @"remove";
LABEL_54:
      id v52 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to %@ push types. Server status: %ld",  v50,  v45));
      uint64_t v53 = ASDErrorWithDescription(v47, 1101LL, v52);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v53);
LABEL_55:

      goto LABEL_56;
    }

- (void).cxx_destruct
{
}

@end