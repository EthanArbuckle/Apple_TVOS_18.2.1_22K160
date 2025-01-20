@interface OwnsCheckTask
- (OwnsCheckTask)init;
- (void)main;
@end

@implementation OwnsCheckTask

- (OwnsCheckTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OwnsCheckTask;
  return -[Task init](&v3, "init");
}

- (void)main
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___OwnsCheckTaskRequestEncoder);
  id v4 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[OwnsCheckTaskRequestEncoder initWithBag:](v3, "initWithBag:", v5);

  if (!*(void *)&self->super._success)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_activeiTunesAccount"));
    v9 = *(void **)&self->super._success;
    *(void *)&self->super._success = v8;

    if (!*(void *)&self->super._success)
    {
      uint64_t v43 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, @"Could not determine account", 0LL);
      id v26 = (id)objc_claimAutoreleasedReturnValue(v43);
      uint64_t v21 = 0LL;
      goto LABEL_24;
    }
  }

  -[OwnsCheckTaskRequestEncoder setAccount:](v6, "setAccount:");
  id v10 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  *(void *)buf = 0LL;
  id v12 = sub_100255E30((uint64_t)v11, (uint64_t)@"bundle-owns-check", buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = (uint64_t)*(id *)buf;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  v16 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v17 = v16;
  if (v15) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v15, @"guid");
  }
  error = self->super._error;
  if (error)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSError componentsJoinedByString:](error, "componentsJoinedByString:", @","));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, @"bids");
  }

  if (v13)
  {
    id v20 = sub_1001ECDD8(v13, v17);
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  if (!(v21 | v14))
  {
    uint64_t v22 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, @"Could not create url", 0LL);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v22);
  }

  id v23 = (id) v14;

  id v24 = v23;
  id v26 = v24;
  if (v21 && !v24)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[OwnsCheckTaskRequestEncoder requestWithMethod:URL:parameters:]( v6,  "requestWithMethod:URL:parameters:",  2LL,  v21,  0LL));
    id v45 = 0LL;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 resultWithError:&v45]);
    id v29 = v45;

    id v30 = sub_1001F4ADC((uint64_t)&OBJC_CLASS___AMSProcessInfo);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = sub_1001A5534((uint64_t)&OBJC_CLASS___AMSURLSession, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 dataTaskPromiseWithRequest:v28]);
    id v44 = v29;
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 resultWithError:&v44]);
    id v26 = v44;

    uint64_t v36 = ASDLogHandleForCategory(14LL);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    v38 = v37;
    if (v26)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Error doing sbysnc. error: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Owns check completed sucessfully", buf, 2u);
      }

      v39 = (void *)objc_claimAutoreleasedReturnValue([v35 object]);
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"ownsCheck"]);

      if (!v40) {
        goto LABEL_22;
      }
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 object]);
      v41 = (ACAccount *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", @"ownsCheck"));
      account = self->_account;
      self->_account = v41;
    }

LABEL_22:
  }

- (void).cxx_destruct
{
}

@end