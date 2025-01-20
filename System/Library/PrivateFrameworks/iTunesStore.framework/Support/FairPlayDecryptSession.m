@interface FairPlayDecryptSession
- (FairPlayDecryptSession)initWithDPInfo:(id)a3;
- (id)decryptBytes:(id)a3 error:(id *)a4;
- (id)identifier;
- (void)dealloc;
@end

@implementation FairPlayDecryptSession

- (FairPlayDecryptSession)initWithDPInfo:(id)a3
{
  v4 = -[FairPlayDecryptSession init](self, "init");
  if (v4)
  {
    if ([a3 length])
    {
      v4->_dpInfo = (NSData *)a3;
      v4->_identifier = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.itunesstored.fairplay.decryptfile.%@",  -[NSUUID UUIDString](+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"), "UUIDString"));
    }

    else
    {
      id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v5) {
        id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v6 = [v5 shouldLog];
      else {
        LODWORD(v7) = v6;
      }
      v8 = (os_log_s *)[v5 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v7 = v7;
      }
      else {
        v7 &= 2u;
      }
      if ((_DWORD)v7)
      {
        int v12 = 138412290;
        uint64_t v13 = objc_opt_class(v4);
        uint64_t v9 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "[%@] No DPInfo provided",  &v12,  12);
        if (v9)
        {
          v10 = (void *)v9;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
          free(v10);
          SSFileLog(v5, @"%@");
        }
      }

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  decryptSession = self->_decryptSession;
  if (decryptSession)
  {
    sub_100023100((uint64_t)decryptSession);
    self->_decryptSession = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___FairPlayDecryptSession;
  -[FairPlayDecryptSession dealloc](&v4, "dealloc");
}

- (id)decryptBytes:(id)a3 error:(id *)a4
{
  id v26 = 0LL;
  p_decryptSession = &self->_decryptSession;
  decryptSession = self->_decryptSession;
  if (decryptSession) {
    goto LABEL_17;
  }
  if (!sub_100023074(self->_dpInfo, p_decryptSession))
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    int v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v27 = 138412290;
      uint64_t v28 = objc_opt_class(self);
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Could not begin decrypt",  &v27,  12);
      if (v13)
      {
        v14 = (void *)v13;
        v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        v24 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    if (a4) {
      *a4 = (id)ISError(15LL, 0LL, 0LL);
    }
  }

  self->_dpInfo = 0LL;
  decryptSession = self->_decryptSession;
  if (decryptSession)
  {
LABEL_17:
    if ((sub_10002311C((uint64_t)decryptSession, a3, (NSData **)&v26) & 1) == 0)
    {
      id v16 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v16) {
        id v16 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v17 = objc_msgSend(v16, "shouldLog", v24);
      else {
        LODWORD(v18) = v17;
      }
      v19 = (os_log_s *)[v16 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v18 = v18;
      }
      else {
        v18 &= 2u;
      }
      if ((_DWORD)v18)
      {
        uint64_t v20 = objc_opt_class(self);
        int v27 = 138412290;
        uint64_t v28 = v20;
        LODWORD(v25) = 12;
        uint64_t v21 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "%@: Decrypt failed",  &v27,  v25);
        if (v21)
        {
          v22 = (void *)v21;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v21, 4LL);
          free(v22);
          SSFileLog(v16, @"%@");
        }
      }

      if (a4) {
        *a4 = (id)ISError(15LL, 0LL, 0LL);
      }
    }
  }

  return v26;
}

- (id)identifier
{
  return self->_identifier;
}

@end