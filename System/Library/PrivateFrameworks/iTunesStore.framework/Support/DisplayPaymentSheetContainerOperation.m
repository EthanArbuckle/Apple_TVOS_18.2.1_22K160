@interface DisplayPaymentSheetContainerOperation
- (DisplayPaymentSheetContainerOperation)initWithDisplayPaymentSheetOperation:(id)a3;
- (void)_loadURLBag;
- (void)_postMetricsEventForError:(id)a3;
- (void)dealloc;
- (void)run;
@end

@implementation DisplayPaymentSheetContainerOperation

- (DisplayPaymentSheetContainerOperation)initWithDisplayPaymentSheetOperation:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DisplayPaymentSheetContainerOperation;
  v6 = -[DisplayPaymentSheetContainerOperation init](&v12, "init");
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstored.DisplayPaymentSheetContainerOperation", 0LL);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_displayPaymentSheetOperation, a3);
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    semaphore = v6->_semaphore;
    v6->_semaphore = (OS_dispatch_semaphore *)v9;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DisplayPaymentSheetContainerOperation;
  -[DisplayPaymentSheetContainerOperation dealloc](&v3, "dealloc");
}

- (void)run
{
  uint64_t v89 = 0LL;
  v90 = &v89;
  uint64_t v91 = 0x2020000000LL;
  char v92 = 0;
  if (!self->_displayPaymentSheetOperation)
  {
    uint64_t v58 = SSError( SSErrorDomain,  137LL,  @"DisplayPaymentSheetContainerOperation Error",  @"No argument operation supplied");
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue(v58);
    id v43 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v43) {
      id v43 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    LODWORD(v59) = [v43 shouldLog];
    unsigned int v60 = [v43 shouldLogToDisk];
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 OSLogObject]);
    v62 = v61;
    if (v60) {
      LODWORD(v59) = v59 | 2;
    }
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      uint64_t v59 = v59;
    }
    else {
      v59 &= 2u;
    }
    if ((_DWORD)v59)
    {
      v63 = (void *)objc_opt_class(self);
      int v93 = 138543362;
      id v94 = v63;
      id v64 = v63;
      v65 = (void *)_os_log_send_and_compose_impl( v59,  0LL,  0LL,  0LL,  &_mh_execute_header,  v62,  16LL,  "%{public}@: Failed to load display payment sheet operation",  &v93,  12);

      if (!v65) {
        goto LABEL_77;
      }
      v62 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v65,  4LL));
      free(v65);
      SSFileLog(v43, @"%@");
    }

    goto LABEL_77;
  }

  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v4) = [v3 shouldLog];
  unsigned int v5 = [v3 shouldLogToDisk];
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  dispatch_queue_t v7 = v6;
  if (v5) {
    LODWORD(v4) = v4 | 2;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v4 = v4;
  }
  else {
    v4 &= 2u;
  }
  if ((_DWORD)v4)
  {
    v8 = (void *)objc_opt_class(self);
    int v93 = 138543362;
    id v94 = v8;
    id v9 = v8;
    v10 = (void *)_os_log_send_and_compose_impl( v4,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%{public}@: Preparing to display payment sheet",  &v93,  12);

    if (!v10) {
      goto LABEL_13;
    }
    dispatch_queue_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    v78 = v7;
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v12 = objc_msgSend(v11, "shouldLog", v78);
  unsigned int v13 = [v11 shouldLogToDisk];
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  v15 = v14;
  if (v13) {
    v12 |= 2u;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v16 = v12;
  }
  else {
    uint64_t v16 = v12 & 2;
  }
  if (!(_DWORD)v16) {
    goto LABEL_26;
  }
  id v17 = (id)objc_opt_class(self);
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[DisplayPaymentSheetOperation localAuthOptions]( self->_displayPaymentSheetOperation,  "localAuthOptions"));
  if (v18) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  int v93 = 138543618;
  id v94 = v17;
  __int16 v95 = 2114;
  v96 = v19;
  LODWORD(v81) = 22;
  v20 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%{public}@:  - LocalAuth Options: %{public}@",  &v93,  v81);

  if (v20)
  {
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
    free(v20);
    v79 = v15;
    SSFileLog(v11, @"%@");
LABEL_26:
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v21) {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v22 = objc_msgSend(v21, "shouldLog", v79);
  unsigned int v23 = [v21 shouldLogToDisk];
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
  v25 = v24;
  if (v23) {
    v22 |= 2u;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v26 = v22;
  }
  else {
    uint64_t v26 = v22 & 2;
  }
  if (!(_DWORD)v26) {
    goto LABEL_40;
  }
  id v27 = (id)objc_opt_class(self);
  v28 = (void *)objc_claimAutoreleasedReturnValue( -[DisplayPaymentSheetOperation authenticationContext]( self->_displayPaymentSheetOperation,  "authenticationContext"));
  if (v28) {
    v29 = @"YES";
  }
  else {
    v29 = @"NO";
  }
  int v93 = 138543618;
  id v94 = v27;
  __int16 v95 = 2114;
  v96 = v29;
  LODWORD(v81) = 22;
  v30 = (void *)_os_log_send_and_compose_impl( v26,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%{public}@:  - AuthKit Context:   %{public}@",  &v93,  v81);

  if (v30)
  {
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v30,  4LL));
    free(v30);
    v80 = v25;
    SSFileLog(v21, @"%@");
LABEL_40:
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v31) {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v32 = objc_msgSend(v31, "shouldLog", v80);
  unsigned int v33 = [v31 shouldLogToDisk];
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
  v35 = v34;
  if (v33) {
    v32 |= 2u;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v36 = v32;
  }
  else {
    uint64_t v36 = v32 & 2;
  }
  if ((_DWORD)v36)
  {
    id v37 = (id)objc_opt_class(self);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue( -[DisplayPaymentSheetOperation accountIdentifier]( self->_displayPaymentSheetOperation,  "accountIdentifier"));
    int v93 = 138543618;
    id v94 = v37;
    __int16 v95 = 2112;
    v96 = v38;
    LODWORD(v81) = 22;
    v39 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &_mh_execute_header,  v35,  0LL,  "%{public}@:  - Account ID:        %@",  &v93,  v81);

    if (!v39) {
      goto LABEL_52;
    }
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v39,  4LL));
    free(v39);
    SSFileLog(v31, @"%@");
  }

LABEL_52:
  v40 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", objc_opt_class(self));
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  objc_initWeak(&location, self->_semaphore);
  displayPaymentSheetOperation = self->_displayPaymentSheetOperation;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100173730;
  v84[3] = &unk_100350528;
  objc_copyWeak(&v87, &location);
  id v43 = v41;
  id v85 = v43;
  v86 = &v89;
  -[DisplayPaymentSheetOperation setContainerCompletionHandler:]( displayPaymentSheetOperation,  "setContainerCompletionHandler:",  v84);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v44 addOperation:self->_displayPaymentSheetOperation];

  semaphore = self->_semaphore;
  dispatch_time_t v46 = dispatch_time(0LL, 180000000000LL);
  uint64_t v47 = dispatch_semaphore_wait((dispatch_semaphore_t)semaphore, v46);
  v48 = self->_displayPaymentSheetOperation;
  if (v47)
  {
    -[DisplayPaymentSheetOperation dismiss](v48, "dismiss");
    uint64_t v49 = SSError( SSErrorDomain,  152LL,  @"DisplayPaymentSheetContainerOperation Error",  @"Operation timed out");
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v51) {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v52 = [v51 shouldLog];
    unsigned int v53 = [v51 shouldLogToDisk];
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([v51 OSLogObject]);
    v55 = v54;
    if (v53) {
      v52 |= 2u;
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      uint64_t v56 = v52;
    }
    else {
      uint64_t v56 = v52 & 2;
    }
    if ((_DWORD)v56)
    {
      int v93 = 138543362;
      id v94 = v43;
      LODWORD(v81) = 12;
      v57 = (void *)_os_log_send_and_compose_impl( v56,  0LL,  0LL,  0LL,  &_mh_execute_header,  v55,  16LL,  "%{public}@: Display payment sheet operation timed out.",  &v93,  v81);

      if (!v57)
      {
LABEL_64:

        dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
        goto LABEL_65;
      }

      v55 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v57,  4LL));
      free(v57);
      SSFileLog(v51, @"%@");
    }

    goto LABEL_64;
  }

  if (-[DisplayPaymentSheetOperation success](v48, "success"))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation error](self->_displayPaymentSheetOperation, "error"));
    BOOL v67 = v66 == 0LL;

    if (v67)
    {
      v50 = 0LL;
      goto LABEL_65;
    }
  }

  v50 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation error](self->_displayPaymentSheetOperation, "error"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v68) {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v69 = [v68 shouldLog];
  unsigned int v70 = [v68 shouldLogToDisk];
  v71 = (os_log_s *)objc_claimAutoreleasedReturnValue([v68 OSLogObject]);
  v72 = v71;
  if (v70) {
    v69 |= 2u;
  }
  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
    uint64_t v73 = v69;
  }
  else {
    uint64_t v73 = v69 & 2;
  }
  if (!(_DWORD)v73) {
    goto LABEL_90;
  }
  int v93 = 138543618;
  id v94 = v43;
  __int16 v95 = 2114;
  v96 = v50;
  LODWORD(v81) = 22;
  v74 = (void *)_os_log_send_and_compose_impl( v73,  0LL,  0LL,  0LL,  &_mh_execute_header,  v72,  16LL,  "%{public}@: Display payment sheet operation failed with error: %{public}@",  &v93,  v81);

  if (v74)
  {
    v72 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v74,  4LL));
    free(v74);
    SSFileLog(v68, @"%@");
LABEL_90:
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v50, "domain"));
  if ([v75 isEqualToString:SSErrorDomain])
  {
    if (-[__CFString code](v50, "code") == (id)151)
    {
    }

    else
    {
      BOOL v76 = -[__CFString code](v50, "code") == (id)152;

      if (!v76) {
        goto LABEL_65;
      }
    }

    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001738C0;
    block[3] = &unk_10034AD58;
    block[4] = self;
    v50 = v50;
    v83 = v50;
    dispatch_async(dispatchQueue, block);

    goto LABEL_65;
  }

LABEL_65:
  objc_destroyWeak(&v87);
  objc_destroyWeak(&location);
LABEL_77:

  -[DisplayPaymentSheetContainerOperation setSuccess:](self, "setSuccess:", *((unsigned __int8 *)v90 + 24));
  -[DisplayPaymentSheetContainerOperation setError:](self, "setError:", v50);

  _Block_object_dispose(&v89, 8);
}

- (void)_loadURLBag
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___ISLoadURLBagOperation);
  id v16 = 0LL;
  unsigned int v4 = -[DisplayPaymentSheetContainerOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v3,  &v16);
  id v5 = v16;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0LL;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v15 = (ISURLBag *)objc_claimAutoreleasedReturnValue(-[ISLoadURLBagOperation URLBag](v3, "URLBag"));
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_18;
  }

  urlBag = (ISURLBag *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!urlBag) {
    urlBag = (ISURLBag *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = -[ISURLBag shouldLog](urlBag, "shouldLog");
  else {
    LODWORD(v10) = v9;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ISURLBag OSLogObject](urlBag, "OSLogObject"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_16;
  }
  unsigned int v12 = (void *)objc_opt_class(self);
  int v17 = 138543618;
  v18 = v12;
  __int16 v19 = 2114;
  v20 = v6;
  id v13 = v12;
  v14 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "%{public}@: Failed to load URL bag with error: %{public}@",  &v17,  22);

  if (v14)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    SSFileLog(urlBag, @"%@");
LABEL_16:
  }

- (void)_postMetricsEventForError:(id)a3
{
  id v4 = a3;
  urlBag = self->_urlBag;
  if (urlBag
    || (-[DisplayPaymentSheetContainerOperation _loadURLBag](self, "_loadURLBag"), (urlBag = self->_urlBag) != 0LL))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ISURLBag valueForKey:](urlBag, "valueForKey:", SSMetricsURLBagKey));
    if ([v6 count])
    {
      BOOL v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  SSMetricsDialogEventIdPaymentSheet,  SSAuthorizationMetricsKeyDialogID);
      -[NSMutableDictionary setObject:forKey:]( v7,  "setObject:forKey:",  &off_10036D980,  SSAuthorizationMetricsKeyEventType);
      if (v4) {
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v4, SSAuthorizationMetricsKeyError);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DisplayPaymentSheetOperation paymentSheet](self->_displayPaymentSheetOperation, "paymentSheet"));
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 buyParams]);

      if (v9) {
        -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, SSAuthorizationMetricsKeyBuyParams);
      }
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[SSAuthorizationMetricsController authorizationDialogEventForParameters:]( &OBJC_CLASS___SSAuthorizationMetricsController,  "authorizationDialogEventForParameters:",  v7));
      id v11 = [[SSMetricsConfiguration alloc] initWithGlobalConfiguration:v6];
      unsigned int v12 = objc_alloc_init(&OBJC_CLASS___SSMetricsController);
      -[SSMetricsController setGlobalConfiguration:](v12, "setGlobalConfiguration:", v11);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_100173F24;
      v22[3] = &unk_10034B1C8;
      v22[4] = self;
      -[SSMetricsController insertEvent:withCompletionHandler:](v12, "insertEvent:withCompletionHandler:", v10, v22);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1001740BC;
      v21[3] = &unk_10034B1C8;
      v21[4] = self;
      -[SSMetricsController flushUnreportedEventsWithCompletionHandler:]( v12,  "flushUnreportedEventsWithCompletionHandler:",  v21);
    }

    else
    {
      BOOL v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
      if (!v7) {
        BOOL v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v13 = -[NSMutableDictionary shouldLog](v7, "shouldLog");
      else {
        LODWORD(v14) = v13;
      }
      unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary OSLogObject](v7, "OSLogObject"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        uint64_t v14 = v14;
      }
      else {
        v14 &= 2u;
      }
      if ((_DWORD)v14)
      {
        int v23 = 138543362;
        id v24 = (id)objc_opt_class(self);
        id v15 = v24;
        id v16 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  16LL,  "%{public}@: Metrics failed with no bag key",  &v23,  12);

        if (!v16) {
          goto LABEL_10;
        }
        unsigned int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
        free(v16);
        SSFileLog(v7, @"%@");
      }
    }
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v6) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v6 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    BOOL v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class(self);
      id v19 = v24;
      v20 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "%{public}@: Metrics failed with no bag",  &v23,  12);

      if (!v20) {
        goto LABEL_11;
      }
      BOOL v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v6, @"%@");
    }
  }

- (void).cxx_destruct
{
}

@end