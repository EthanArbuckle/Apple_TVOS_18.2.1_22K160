@interface LoadMatchStatusOperation
- (LoadMatchStatusOperation)initWithAccountIdentifier:(id)a3;
- (NSString)userAgent;
- (id)_newMatchStatusOperationWithURLBag:(id)a3;
- (unint64_t)matchStatus;
- (void)dealloc;
- (void)run;
- (void)setUserAgent:(id)a3;
@end

@implementation LoadMatchStatusOperation

- (LoadMatchStatusOperation)initWithAccountIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LoadMatchStatusOperation;
  v4 = -[LoadMatchStatusOperation init](&v6, "init");
  if (v4) {
    v4->_accountID = (NSNumber *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LoadMatchStatusOperation;
  -[LoadMatchStatusOperation dealloc](&v3, "dealloc");
}

- (unint64_t)matchStatus
{
  unint64_t matchStatus = self->_matchStatus;
  -[LoadMatchStatusOperation unlock](self, "unlock");
  return matchStatus;
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[LoadMatchStatusOperation unlock](self, "unlock");
}

- (NSString)userAgent
{
  objc_super v3 = self->_userAgent;
  -[LoadMatchStatusOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  unint64_t v39 = 0LL;
  id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v3) {
    id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  objc_super v6 = (os_log_s *)[v3 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if ((_DWORD)v5)
  {
    uint64_t v7 = objc_opt_class(self);
    accountID = self->_accountID;
    int v40 = 138412546;
    uint64_t v41 = v7;
    __int16 v42 = 2112;
    unint64_t v43 = (unint64_t)accountID;
    uint64_t v9 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Loading match status for account: %@",  &v40,  22);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
      free(v10);
      v36 = v11;
      SSFileLog(v3, @"%@");
    }
  }

  v12 = +[SSURLBagContext contextWithBagType:](&OBJC_CLASS___SSURLBagContext, "contextWithBagType:", 0LL, v36);
  -[SSURLBagContext setIgnoresCaches:](v12, "setIgnoresCaches:", 1LL);
  -[SSURLBagContext setUserIdentifier:](v12, "setUserIdentifier:", self->_accountID);
  v13 = -[LoadMatchStatusOperation userAgent](self, "userAgent");
  -[SSURLBagContext setValue:forHTTPHeaderField:](v12, "setValue:forHTTPHeaderField:", v13, SSHTTPHeaderUserAgent);
  id v14 = -[LoadMatchStatusOperation loadedURLBagWithContext:returningError:]( self,  "loadedURLBagWithContext:returningError:",  v12,  &v39);
  if (v14)
  {
    v15 = v14;
    id v16 = [v14 valueForKey:@"isMatchServiceEnabled"];
    if ((objc_opt_respondsToSelector(v16, "BOOLValue") & 1) != 0) {
      unint64_t v17 = [v16 BOOLValue];
    }
    else {
      unint64_t v17 = 0LL;
    }
    id v18 = [v15 valueForKey:@"cloud-welcome"];
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0) {
      v17 |= 2uLL;
    }
    id v20 = -[LoadMatchStatusOperation _newMatchStatusOperationWithURLBag:]( self,  "_newMatchStatusOperationWithURLBag:",  v15);
    if (v20)
    {
      v21 = v20;
      if (-[LoadMatchStatusOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v20,  &v39))
      {
        id v22 = objc_msgSend( objc_msgSend(objc_msgSend(v21, "dataProvider"), "output"),  "objectForKey:",  @"isMatchSubscriber");

        id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v23) {
          id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v24 = [v23 shouldLog];
        else {
          LODWORD(v25) = v24;
        }
        v26 = (os_log_s *)[v23 OSLogObject];
        uint64_t v27 = 1LL;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
          uint64_t v25 = v25;
        }
        else {
          v25 &= 2u;
        }
        if (!(_DWORD)v25) {
          goto LABEL_47;
        }
        uint64_t v28 = objc_opt_class(self);
        v29 = self->_accountID;
        int v40 = 138412802;
        uint64_t v41 = v28;
        __int16 v42 = 2048;
        unint64_t v43 = v17;
        __int16 v44 = 2112;
        v45 = v29;
        LODWORD(v38) = 32;
        uint64_t v30 = 1LL;
        v31 = (void *)_os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  1LL,  "%@: Loaded match status: %ld for account: %@",  &v40,  v38);
        if (!v31) {
          goto LABEL_47;
        }
LABEL_46:
        v35 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v31, 4LL);
        free(v31);
        v37 = v35;
        SSFileLog(v23, @"%@");
        uint64_t v27 = v30;
        goto LABEL_47;
      }
    }
  }

  else
  {
    unint64_t v17 = 0LL;
  }

  id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v23) {
    id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v32 = [v23 shouldLog];
  else {
    LODWORD(v27) = v32;
  }
  v33 = (os_log_s *)[v23 OSLogObject];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v27 = v27;
  }
  else {
    v27 &= 2u;
  }
  if ((_DWORD)v27)
  {
    uint64_t v34 = objc_opt_class(self);
    int v40 = 138412546;
    uint64_t v41 = v34;
    __int16 v42 = 2112;
    unint64_t v43 = v39;
    LODWORD(v38) = 22;
    v31 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%@: Could not load match status: %@",  &v40,  v38);
    uint64_t v30 = 0LL;
    uint64_t v27 = 0LL;
    if (v31) {
      goto LABEL_46;
    }
  }

- (id)_newMatchStatusOperationWithURLBag:(id)a3
{
  id v4 = [a3 valueForKey:@"getMatchStatusSrv"];
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0) {
    return 0LL;
  }
  id v6 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  objc_msgSend( v6,  "setDataProvider:",  +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v6 setUseUserSpecificURLBag:1];
  uint64_t v7 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  self->_accountID);
  v8 = -[LoadMatchStatusOperation userAgent](self, "userAgent");
  uint64_t v9 = SSHTTPHeaderUserAgent;
  -[SSMutableAuthenticationContext setValue:forHTTPHeaderField:]( v7,  "setValue:forHTTPHeaderField:",  v8,  SSHTTPHeaderUserAgent);
  [v6 setAuthenticationContext:v7];

  v10 = -[SSMutableURLRequestProperties initWithURL:]( objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties),  "initWithURL:",  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
  -[SSMutableURLRequestProperties setITunesStoreRequest:](v10, "setITunesStoreRequest:", 1LL);
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v10,  "setValue:forHTTPHeaderField:",  -[LoadMatchStatusOperation userAgent](self, "userAgent"),  v9);
  [v6 setRequestProperties:v10];

  return v6;
}

@end