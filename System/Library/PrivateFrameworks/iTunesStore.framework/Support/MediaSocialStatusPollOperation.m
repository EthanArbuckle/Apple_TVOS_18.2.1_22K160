@interface MediaSocialStatusPollOperation
- (MediaSocialStatusPollOperation)initWithStatusPollRequests:(id)a3;
- (NSArray)statusPollRequests;
- (id)_requestURL;
- (id)responseBlock;
- (void)main;
- (void)setResponseBlock:(id)a3;
@end

@implementation MediaSocialStatusPollOperation

- (MediaSocialStatusPollOperation)initWithStatusPollRequests:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MediaSocialStatusPollOperation;
  v5 = -[MediaSocialStatusPollOperation init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    statusPollRequests = v5->_statusPollRequests;
    v5->_statusPollRequests = v6;
  }

  return v5;
}

- (id)responseBlock
{
  id v3 = [self->_responseBlock copy];
  -[MediaSocialStatusPollOperation unlock](self, "unlock");
  id v4 = objc_retainBlock(v3);

  return v4;
}

- (void)setResponseBlock:(id)a3
{
  id v6 = a3;
  -[MediaSocialStatusPollOperation lock](self, "lock");
  if (self->_responseBlock != v6)
  {
    id v4 = [v6 copy];
    id responseBlock = self->_responseBlock;
    self->_id responseBlock = v4;
  }

  -[MediaSocialStatusPollOperation unlock](self, "unlock");
}

- (NSArray)statusPollRequests
{
  id v3 = -[NSArray copy](self->_statusPollRequests, "copy");
  -[MediaSocialStatusPollOperation unlock](self, "unlock");
  return (NSArray *)v3;
}

- (void)main
{
  v2 = self;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialStatusPollOperation _requestURL](self, "_requestURL"));
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v4 = v2->_statusPollRequests;
  id v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v78,  v87,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v79;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v79 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v78 + 1) + 8 * (void)i) activityIdentifier]);
        if (v9) {
          -[NSMutableArray addObject:](v3, "addObject:", v9);
        }
      }

      id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v78,  v87,  16LL);
    }

    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @","));
  if (!v69)
  {
    uint64_t v33 = SSError(SSErrorDomain, 124LL, 0LL, 0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = 0LL;
    goto LABEL_42;
  }

  v11 = v2;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v2->_statusPollRequests, "firstObject"));
  id v13 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DaemonProtocolDataProvider provider](&OBJC_CLASS___DaemonProtocolDataProvider, "provider"));
  [v13 setDataProvider:v14];

  v15 = objc_alloc(&OBJC_CLASS___SSAuthenticationContext);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v12 accountIdentifier]);
  v17 = -[SSAuthenticationContext initWithAccountIdentifier:](v15, "initWithAccountIdentifier:", v16);

  [v13 setAuthenticationContext:v17];
  v18 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  v69);
  -[SSMutableURLRequestProperties setAllowedRetryCount:](v18, "setAllowedRetryCount:", 0LL);
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v18, "setITunesStoreRequest:", 1LL);
  -[SSMutableURLRequestProperties setTimeoutInterval:](v18, "setTimeoutInterval:", 30.0);
  -[SSMutableURLRequestProperties setValue:forRequestParameter:]( v18,  "setValue:forRequestParameter:",  v10,  @"activities");
  SSVAddMediaSocialHeadersToURLRequestProperties(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v12 sourceApplicationIdentifier]);
  v20 = v19;
  if (v19)
  {
    id v21 = sub_100147FA8(v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v18,  "setValue:forHTTPHeaderField:",  v22,  SSHTTPHeaderUserAgent);
  }

  v68 = v13;
  [v13 setRequestProperties:v18];
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v23) {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v24) = [v23 shouldLog];
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
    uint64_t v24 = v24;
  }
  else {
    v24 &= 2u;
  }
  if (!(_DWORD)v24)
  {
    v32 = v12;
    v2 = v11;
    goto LABEL_25;
  }

  v26 = v18;
  v27 = v17;
  v28 = v10;
  v29 = (void *)objc_opt_class(v11);
  id obja = v29;
  v66 = v12;
  v30 = (void *)objc_claimAutoreleasedReturnValue([v12 activityIdentifier]);
  int v83 = 138412546;
  v84 = v29;
  v10 = v28;
  v17 = v27;
  v18 = v26;
  __int16 v85 = 2112;
  v86 = v30;
  v31 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  1LL,  "%@: Polling status for activity: %@",  &v83,  22);

  v2 = v11;
  v32 = v66;

  if (v31)
  {
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
    free(v31);
    v59 = v25;
    SSFileLog(v23, @"%@");
LABEL_25:
  }

  id v77 = 0LL;
  v36 = v68;
  unsigned int v37 = -[MediaSocialStatusPollOperation runSubOperation:returningError:]( v2,  "runSubOperation:returningError:",  v68,  &v77);
  id v38 = v77;
  v35 = 0LL;
  if (v37)
  {
    v65 = v10;
    v39 = v32;
    v35 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v68 dataProvider]);
    uint64_t v41 = objc_claimAutoreleasedReturnValue([v40 output]);

    v42 = (void *)v41;
    v43 = &ACSLocateCachingServer_ptr;
    uint64_t v44 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v42, v44) & 1) != 0)
    {
      id v64 = v38;
      v45 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:@"activities"]);
      uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v45, v46) & 1) != 0)
      {
        v60 = v42;
        v61 = v18;
        v70 = v35;
        v62 = v17;
        v63 = v2;
        v67 = v39;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        obj = v2->_statusPollRequests;
        id v47 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v73,  v82,  16LL);
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v74;
          do
          {
            for (j = 0LL; j != v48; j = (char *)j + 1)
            {
              if (*(void *)v74 != v49) {
                objc_enumerationMutation(obj);
              }
              v51 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)j);
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "activityIdentifier", v59));
              v53 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:v52]);
              uint64_t v54 = objc_opt_class(v43[360]);
              if ((objc_opt_isKindOfClass(v53, v54) & 1) != 0)
              {
                v55 = v43;
                v56 = objc_alloc_init(&OBJC_CLASS___MediaSocialPostResponse);
                -[MediaSocialPostResponse setActivityIdentifier:](v56, "setActivityIdentifier:", v52);
                [v51 pollingInterval];
                -[MediaSocialPostResponse setPollingInterval:](v56, "setPollingInterval:");
                [v51 pollingDuration];
                -[MediaSocialPostResponse setPollDuration:](v56, "setPollDuration:");
                -[MediaSocialPostResponse setPostIdentifier:]( v56,  "setPostIdentifier:",  [v51 postIdentifier]);
                -[MediaSocialPostResponse setValuesWithResponseDictionary:]( v56,  "setValuesWithResponseDictionary:",  v53);
                -[NSMutableDictionary setObject:forKey:](v70, "setObject:forKey:", v56, v52);

                v43 = v55;
              }
            }

            id v48 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v73,  v82,  16LL);
          }

          while (v48);
        }

        v17 = v62;
        v2 = v63;
        v39 = v67;
        v36 = v68;
        v42 = v60;
        v18 = v61;
        v35 = v70;
      }

      id v38 = v64;
    }

    v32 = v39;
    v10 = v65;
  }

  v34 = 0LL;
LABEL_42:
  uint64_t v57 = objc_claimAutoreleasedReturnValue(-[MediaSocialStatusPollOperation responseBlock](v2, "responseBlock", v59));
  v58 = (void *)v57;
  if (v57)
  {
    (*(void (**)(uint64_t, NSMutableDictionary *, void *))(v57 + 16))(v57, v35, v34);
    -[MediaSocialStatusPollOperation setResponseBlock:](v2, "setResponseBlock:", 0LL);
  }
}

- (id)_requestURL
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MediaSocialStatusPollOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v3,  0LL));
  id v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKey:SSVURLBagKeyMusicConnect]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"activityStatus"]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
        v10 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v8);
      }
      else {
        v10 = 0LL;
      }
    }

    else
    {
      v10 = 0LL;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end