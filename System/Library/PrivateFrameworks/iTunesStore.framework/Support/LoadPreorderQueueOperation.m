@interface LoadPreorderQueueOperation
- (LoadPreorderQueueOperation)initWithAccountIdentifier:(id)a3;
- (NSArray)preorderItems;
- (NSNumber)accountIdentifier;
- (id)_newURLOperation;
- (void)dealloc;
- (void)run;
@end

@implementation LoadPreorderQueueOperation

- (LoadPreorderQueueOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LoadPreorderQueueOperation;
  v4 = -[LoadPreorderQueueOperation init](&v6, "init");
  if (v4) {
    v4->_accountID = (NSNumber *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadPreorderQueueOperation;
  -[LoadPreorderQueueOperation dealloc](&v3, "dealloc");
}

- (NSNumber)accountIdentifier
{
  return self->_accountID;
}

- (NSArray)preorderItems
{
  objc_super v3 = self->_items;
  -[LoadPreorderQueueOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  id v3 = -[LoadPreorderQueueOperation _newURLOperation](self, "_newURLOperation");
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    unsigned int v6 = v5;
  }
  v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v6 & 2;
  }
  if ((_DWORD)v9)
  {
    int v58 = 138412290;
    uint64_t v59 = objc_opt_class(self);
    uint64_t v10 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Loading preorder queue",  &v58,  12);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
      free(v11);
      v48 = v12;
      *(void *)&double v8 = SSFileLog(v4, @"%@").n128_u64[0];
    }
  }

  v56 = 0LL;
  id v13 = -[LoadPreorderQueueOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v56,  v8,  v48);
  if ((v13 & 1) != 0)
  {
    id v14 = objc_msgSend(objc_msgSend(v3, "dataProvider"), "output");
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      id v17 = [v14 objectForKey:@"items"];
      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
      {
        id v51 = v3;
        v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        id v20 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v53;
          do
          {
            for (i = 0LL; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v53 != v22) {
                objc_enumerationMutation(v17);
              }
              uint64_t v24 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
              uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
              {
                id v26 = [[SSItem alloc] initWithItemDictionary:v24];
                if (v26)
                {
                  v27 = v26;
                  -[NSMutableArray addObject:](v19, "addObject:", v26);
                }
              }
            }

            id v21 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
          }

          while (v21);
        }

        id v28 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v28) {
          id v28 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v29 = [v28 shouldLog];
        else {
          unsigned int v30 = v29;
        }
        v31 = (os_log_s *)[v28 OSLogObject];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
          uint64_t v33 = v30;
        }
        else {
          uint64_t v33 = v30 & 2;
        }
        if ((_DWORD)v33)
        {
          uint64_t v34 = objc_opt_class(self);
          id v35 = -[NSMutableArray count](v19, "count");
          int v58 = 138412546;
          uint64_t v59 = v34;
          __int16 v60 = 2048;
          id v61 = v35;
          LODWORD(v50) = 22;
          uint64_t v36 = _os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  1LL,  "%@: Loaded %lu preorder items",  &v58,  v50);
          if (v36)
          {
            v37 = (void *)v36;
            v38 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v36,  4LL);
            free(v37);
            v49 = v38;
            *(void *)&double v32 = SSFileLog(v28, @"%@").n128_u64[0];
          }
        }

        -[LoadPreorderQueueOperation lock](self, "lock", v32, v49);

        self->_items = (NSArray *)-[NSMutableArray copy](v19, "copy");
        -[LoadPreorderQueueOperation unlock](self, "unlock");

        id v3 = v51;
      }
    }
  }

  else
  {
    id v39 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v39) {
      id v39 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v40 = [v39 shouldLog];
    else {
      unsigned int v41 = v40;
    }
    v42 = (os_log_s *)[v39 OSLogObject];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v43 = v41;
    }
    else {
      uint64_t v43 = v41 & 2;
    }
    if ((_DWORD)v43)
    {
      uint64_t v44 = objc_opt_class(self);
      int v58 = 138412546;
      uint64_t v59 = v44;
      __int16 v60 = 2112;
      id v61 = v56;
      LODWORD(v50) = 22;
      uint64_t v45 = _os_log_send_and_compose_impl( v43,  0LL,  0LL,  0LL,  &_mh_execute_header,  v42,  0LL,  "%@: Could not load preorder queue: %@",  &v58,  v50);
      if (v45)
      {
        v46 = (void *)v45;
        v47 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v45, 4LL);
        free(v46);
        v49 = v47;
        *(void *)&double v16 = SSFileLog(v39, @"%@").n128_u64[0];
      }
    }
  }

  -[LoadPreorderQueueOperation setError:](self, "setError:", v56, v16, v49);
  -[LoadPreorderQueueOperation setSuccess:](self, "setSuccess:", v13);
}

- (id)_newURLOperation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  [v3 setNeedsAuthentication:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v3 setDataProvider:v4];

  unsigned int v5 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  self->_accountID);
  [v3 setAuthenticationContext:v5];

  unsigned int v6 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setCachePolicy:](v6, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setURLBagKey:](v6, "setURLBagKey:", @"p2-pre-order-queue");
  [v3 setRequestProperties:v6];

  return v3;
}

@end