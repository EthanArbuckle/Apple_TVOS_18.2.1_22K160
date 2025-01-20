@interface URLRequestEncoder
- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4;
@end

@implementation URLRequestEncoder

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    id v10 = [v7 mutableCopy];

    id v11 = v10;
    id v7 = v11;
    if (self)
    {
      if (sub_100294530((uint64_t)self->_requestProperties))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
        [v7 setObject:v12 forKeyedSubscript:@"guid"];
      }

      id v13 = v7;
      if ((unint64_t)(sub_100293F44((uint64_t)self->_requestProperties) - 3) >= 0xFFFFFFFFFFFFFFFELL)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
        id v15 = sub_100293A2C((uint64_t)self->_requestProperties);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ams_DSID"));
        id v38 = 0LL;
        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 keybagSyncDataWithAccountID:v17 transactionType:1 error:&v38]);
        id v19 = v38;

        if (v19)
        {
          uint64_t v20 = ASDLogHandleForCategory(28LL);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v31 = sub_100293A2C((uint64_t)self->_requestProperties);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ams_DSID"));
            *(_DWORD *)buf = 138543362;
            v40 = v33;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Error generating keybag for account: %{public}@",  buf,  0xCu);
          }
        }

        if ([v18 length])
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue([v18 base64EncodedStringWithOptions:0]);
          if (v22) {
            [v13 setObject:v22 forKeyedSubscript:@"kbsync"];
          }
        }
      }
    }

    else
    {

      id v34 = v7;
    }
  }

  id v23 = [v6 mutableCopy];
  [v23 setCachePolicy:sub_100294154((uint64_t)self->_requestProperties)];
  requestProperties = self->_requestProperties;
  if (requestProperties) {
    requestProperties = objc_getProperty(requestProperties, v24, 104LL, 1);
  }
  id v26 = requestProperties;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1001DE044;
  v36[3] = &unk_1003EBE20;
  id v37 = v23;
  id v27 = v23;
  [v26 enumerateKeysAndObjectsUsingBlock:v36];

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___URLRequestEncoder;
  id v28 = -[URLRequestEncoder requestByEncodingRequest:parameters:](&v35, "requestByEncodingRequest:parameters:", v27, v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  return v29;
}

- (void).cxx_destruct
{
}

@end