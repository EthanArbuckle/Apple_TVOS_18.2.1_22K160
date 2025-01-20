@interface MicroPaymentClient
+ (id)entityForContext:(id)a3;
- (id)mergeResponse:(id)a3 withOptions:(int64_t)a4;
- (id)replacePayment:(id)a3 withPurchaseResponse:(id)a4;
- (void)setValuesWithClientIdentity:(id)a3;
@end

@implementation MicroPaymentClient

+ (id)entityForContext:(id)a3
{
  return objc_msgSend( objc_msgSend( objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"),  "entitiesByName"),  "objectForKey:",  @"MicroPaymentClient");
}

- (id)mergeResponse:(id)a3 withOptions:(int64_t)a4
{
  char v4 = a4;
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((v4 & 1) != 0)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  else
  {
    v7 = 0LL;
    v8 = 0LL;
  }

  v58 = v7;
  if ((v4 & 2) != 0) {
    v61 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  }
  else {
    v61 = 0LL;
  }
  v53 = v8;
  id v9 = -[MicroPaymentClient payments](self, "payments");
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v57 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v60 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v79;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v79 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
        id v16 = [v15 transactionIdentifier];
        if (v16) {
          -[NSMutableDictionary setObject:forKey:](v60, "setObject:forKey:", v15, v16);
        }
        else {
          -[NSMutableArray addObject:](v10, "addObject:", v15);
        }
        if (objc_msgSend(objc_msgSend(v15, "supportsDeferredPayment"), "BOOLValue"))
        {
          id v17 = [v15 productIdentifier];
          if (v17) {
            -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v15, v17);
          }
        }

        -[NSMutableSet addObject:](v61, "addObject:", v15);
      }

      id v12 = [v9 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }

    while (v12);
  }

  id v55 = -[MicroPaymentClient managedObjectContext](self, "managedObjectContext");
  id v52 = +[MicroPayment paymentEntityFromContext:](&OBJC_CLASS___MicroPayment, "paymentEntityFromContext:");
  id v51 = [a3 requestType];
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id obj = [a3 payments];
  id v18 = [obj countByEnumeratingWithState:&v74 objects:v85 count:16];
  v19 = v58;
  if (v18)
  {
    id v20 = v18;
    uint64_t v59 = *(void *)v75;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v75 != v59) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)j);
        id v23 = [v22 objectForKey:@"transaction-id"];
        if (v23)
        {
          id v24 = -[NSMutableDictionary objectForKey:](v60, "objectForKey:", v23);
          if (v24) {
            goto LABEL_39;
          }
        }

        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v70,  v84,  16LL);
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v71;
LABEL_29:
          uint64_t v28 = 0LL;
          while (1)
          {
            if (*(void *)v71 != v27) {
              objc_enumerationMutation(v10);
            }
            id v24 = *(id *)(*((void *)&v70 + 1) + 8 * v28);
            if (v26 == (id)++v28)
            {
              id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v70,  v84,  16LL);
              v19 = v58;
              if (v26) {
                goto LABEL_29;
              }
              goto LABEL_37;
            }
          }

          v19 = v58;
          if (v24) {
            goto LABEL_39;
          }
        }

- (id)replacePayment:(id)a3 withPurchaseResponse:(id)a4
{
  id v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v40 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v39 = -[MicroPaymentClient managedObjectContext](self, "managedObjectContext");
  id v38 = +[MicroPayment paymentEntityFromContext:](&OBJC_CLASS___MicroPayment, "paymentEntityFromContext:");
  id v7 = [a4 payments];
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
        if (objc_msgSend(a3, "isEqualToResponse:compareAllFields:", v12, 0, v36))
        {
          [a3 mergeValuesFromResponse:v12];
          objc_msgSend( a3,  "setState:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
          -[NSMutableArray addObject:](v40, "addObject:", a3);
          id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v13) {
            id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v14 = [v13 shouldLog];
          else {
            LODWORD(v15) = v14;
          }
          id v16 = (os_log_s *)[v13 OSLogObject];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
            uint64_t v15 = v15;
          }
          else {
            v15 &= 2u;
          }
          if ((_DWORD)v15)
          {
            uint64_t v17 = objc_opt_class(self);
            int v46 = 138412290;
            uint64_t v47 = v17;
            LODWORD(v37) = 12;
            uint64_t v18 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Merged existing payment with response payment",  &v46,  v37);
            goto LABEL_27;
          }
        }

        else
        {
          v19 = -[MicroPayment initWithEntity:insertIntoManagedObjectContext:]( objc_alloc(&OBJC_CLASS___MicroPayment),  "initWithEntity:insertIntoManagedObjectContext:",  v38,  v39);
          -[MicroPayment mergeValuesFromResponse:](v19, "mergeValuesFromResponse:", v12);
          -[MicroPayment setClient:](v19, "setClient:", self);
          -[MicroPayment setState:]( v19,  "setState:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 2LL));
          -[NSMutableArray addObject:](v41, "addObject:", v19);

          id v13 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v13) {
            id v13 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v20 = [v13 shouldLog];
          else {
            LODWORD(v21) = v20;
          }
          v22 = (os_log_s *)[v13 OSLogObject];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
            uint64_t v21 = v21;
          }
          else {
            v21 &= 2u;
          }
          if ((_DWORD)v21)
          {
            uint64_t v23 = objc_opt_class(self);
            int v46 = 138412290;
            uint64_t v47 = v23;
            LODWORD(v37) = 12;
            uint64_t v18 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  1LL,  "%@: Merged in new payment from response",  &v46,  v37);
LABEL_27:
            id v24 = (void *)v18;
            if (v18)
            {
              id v25 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL);
              free(v24);
              v36 = v25;
              SSFileLog(v13, @"%@");
            }

            continue;
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v9);
  }

  if (a3 && !-[NSMutableArray count](v40, "count"))
  {
    id v26 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v26) {
      id v26 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    LODWORD(v27) = objc_msgSend(v26, "shouldLog", v36);
    uint64_t v28 = (os_log_s *)[v26 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v27 = v27;
    }
    else {
      v27 &= 2u;
    }
    if ((_DWORD)v27)
    {
      uint64_t v29 = objc_opt_class(self);
      int v46 = 138412290;
      uint64_t v47 = v29;
      LODWORD(v37) = 12;
      uint64_t v30 = _os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%@: Could not find payment to merge with existing payment",  &v46,  v37);
      if (v30)
      {
        uint64_t v31 = (void *)v30;
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
        free(v31);
        SSFileLog(v26, @"%@");
      }
    }

    id v32 = sub_100146868();
    objc_msgSend(a3, "setFailedWithError:", ISErrorWithDomain(v32, 0, 0, 0));
    -[NSMutableArray addObject:](v40, "addObject:", a3);
  }

  if ((sub_10003E244(v39) & 1) != 0)
  {
    id v33 = objc_alloc_init(&OBJC_CLASS___MicroPaymentClientMergeResults);
    id v34 = v41;
    -[MicroPaymentClientMergeResults setAddedPayments:](v33, "setAddedPayments:", v41);
    -[MicroPaymentClientMergeResults setChangedPayments:](v33, "setChangedPayments:", v40);
  }

  else
  {
    [v39 rollback];
    id v33 = 0LL;
    id v34 = v41;
  }

  return v33;
}

- (void)setValuesWithClientIdentity:(id)a3
{
}

@end