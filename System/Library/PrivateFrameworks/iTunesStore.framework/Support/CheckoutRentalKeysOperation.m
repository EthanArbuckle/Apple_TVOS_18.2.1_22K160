@interface CheckoutRentalKeysOperation
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (BOOL)_haveValidRentalInformation;
- (BOOL)_performCheckout:(id *)a3;
- (BOOL)isBackgroundCheckout;
- (BOOL)shouldCheckoutWithPlay;
- (BOOL)shouldValidateRentalInfo;
- (CheckoutRentalKeysOperation)init;
- (CheckoutRentalKeysOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (CheckoutRentalKeysOperation)initWithSinfs:(id)a3;
- (CheckoutRentalKeysOperation)initWithStoreDownloadSinfs:(id)a3;
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSURLConnectionResponse)URLResponse;
- (id)_bodyData;
- (id)_copyAccountIdentifier;
- (id)_copyRentalIdentifier;
- (id)_primarySINF;
- (unint64_t)checkoutType;
- (void)_run;
- (void)_showErrorDialogForOutput:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setBackgroundCheckout:(BOOL)a3;
- (void)setCheckoutType:(unint64_t)a3;
- (void)setCheckoutWithPlay:(BOOL)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setShouldValidateRentalInfo:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation CheckoutRentalKeysOperation

- (CheckoutRentalKeysOperation)init
{
  return -[CheckoutRentalKeysOperation initWithSinfs:](self, "initWithSinfs:", 0LL);
}

- (CheckoutRentalKeysOperation)initWithSinfs:(id)a3
{
  if (![a3 count]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CheckoutRentalKeysOperation.m",  75LL,  @"Must have sinfs");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CheckoutRentalKeysOperation;
  v6 = -[CheckoutRentalKeysOperation init](&v8, "init");
  if (v6)
  {
    v6->_sinfs = (NSArray *)[a3 copy];
    v6->_shouldValidateRentalInfo = 1;
  }

  return v6;
}

- (CheckoutRentalKeysOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  if (![a3 unsignedLongLongValue] || !objc_msgSend(a4, "unsignedLongLongValue")) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CheckoutRentalKeysOperation.m",  84LL,  @"Must have account and rental key identifier");
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CheckoutRentalKeysOperation;
  objc_super v8 = -[CheckoutRentalKeysOperation init](&v10, "init");
  if (v8)
  {
    v8->_accountIdentifier = (NSNumber *)[a3 copy];
    v8->_rentalKeyIdentifier = (NSNumber *)[a4 copy];
    v8->_shouldValidateRentalInfo = 1;
  }

  return v8;
}

- (CheckoutRentalKeysOperation)initWithStoreDownloadSinfs:(id)a3
{
  v4 = -[DownloadDRM initWithSinfArray:](objc_alloc(&OBJC_CLASS___DownloadDRM), "initWithSinfArray:", a3);
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v6 = -[DownloadDRM sinfs](v4, "sinfs");
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      objc_super v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) dataForSinfDataKey:off_1003A24A8];
        if (v11) {
          -[NSMutableArray addObject:](v5, "addObject:", v11);
        }
        objc_super v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  v12 = -[CheckoutRentalKeysOperation initWithSinfs:](self, "initWithSinfs:", v5);

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CheckoutRentalKeysOperation;
  -[CheckoutRentalKeysOperation dealloc](&v3, "dealloc");
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)clientIdentifierHeader
{
  objc_super v3 = self->_clientIdentifierHeader;
  -[CheckoutRentalKeysOperation unlock](self, "unlock");
  return v3;
}

- (NSNumber)rentalKeyIdentifier
{
  return self->_rentalKeyIdentifier;
}

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  -[CheckoutRentalKeysOperation unlock](self, "unlock");
}

- (void)setUserAgent:(id)a3
{
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  -[CheckoutRentalKeysOperation unlock](self, "unlock");
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (SSURLConnectionResponse)URLResponse
{
  objc_super v3 = self->_urlResponse;
  -[CheckoutRentalKeysOperation unlock](self, "unlock");
  return v3;
}

- (NSString)userAgent
{
  objc_super v3 = self->_userAgent;
  -[CheckoutRentalKeysOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
}

- (id)_bodyData
{
  if (objc_msgSend(-[CheckoutRentalKeysOperation _primarySINF](self, "_primarySINF"), "length")
    || -[NSNumber unsignedLongLongValue](self->_accountIdentifier, "unsignedLongLongValue")
    && -[NSNumber unsignedLongLongValue](self->_rentalKeyIdentifier, "unsignedLongLongValue"))
  {
    objc_super v3 = sub_10002271C();
    if (!v3)
    {
      id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v20 = [v15 shouldLog];
      else {
        LODWORD(v21) = v20;
      }
      v22 = (os_log_s *)[v15 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v21 = v21;
      }
      else {
        v21 &= 2u;
      }
      if (!(_DWORD)v21) {
        goto LABEL_44;
      }
      int v64 = 138412290;
      uint64_t v65 = objc_opt_class(self);
      uint64_t v19 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%@: Could not get rental bag",  &v64,  12);
      goto LABEL_42;
    }

    v4 = v3;
    v62 = 0LL;
    v63 = 0LL;
    if ((sub_100022990(&v63, &v62) & 1) != 0)
    {
      id v5 = -[CheckoutRentalKeysOperation _copyAccountIdentifier](self, "_copyAccountIdentifier");
      if (v5)
      {
        v6 = v5;
        id v7 = -[CheckoutRentalKeysOperation _copyRentalIdentifier](self, "_copyRentalIdentifier");
        if (!v7)
        {
          id v43 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
          if (!v43) {
            id v43 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
          }
          unsigned int v44 = [v43 shouldLog];
          else {
            LODWORD(v45) = v44;
          }
          v46 = (os_log_s *)[v43 OSLogObject];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v45 = v45;
          }
          else {
            v45 &= 2u;
          }
          if ((_DWORD)v45)
          {
            uint64_t v47 = objc_opt_class(self);
            int v64 = 138412290;
            uint64_t v65 = v47;
            uint64_t v48 = _os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "%@: Could not get rental identifier",  &v64,  12);
            if (v48)
            {
              v49 = (void *)v48;
              v50 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v48,  4LL);
              free(v49);
              v60 = v50;
              SSFileLog(v43, @"%@");
            }
          }

          goto LABEL_68;
        }

        id v8 = v7;
        uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        objc_super v10 = @"play";
        if (MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) != 4
          && !-[CheckoutRentalKeysOperation shouldCheckoutWithPlay](self, "shouldCheckoutWithPlay"))
        {
          objc_super v10 = @"download-done";
        }

        -[NSMutableDictionary setObject:forKey:]( v9,  "setObject:forKey:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL),  v10);
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v6, @"dsid");
        id v11 = -[ISDevice guid](+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"), "guid");
        if (v11) {
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, @"guid");
        }
        id v12 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
        if (v12) {
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v12, @"hw.model");
        }
        if (v63) {
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v63, @"device-diversity");
        }
        if (v62) {
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v62, @"rbsync");
        }
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v4, @"rental-bag");
        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v8, @"rental-id");
        unint64_t v13 = -[CheckoutRentalKeysOperation checkoutType](self, "checkoutType");
        if (v13 == 1)
        {
          __int128 v14 = @"download";
        }

        else
        {
          if (v13 != 2)
          {
LABEL_94:
            id v51 = +[SSLogConfig sharedWriteToDiskConfig](&OBJC_CLASS___SSLogConfig, "sharedWriteToDiskConfig");
            if (!v51) {
              id v51 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
            }
            unsigned int v52 = [v51 shouldLog];
            else {
              LODWORD(v53) = v52;
            }
            v54 = (os_log_s *)[v51 OSLogObject];
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v53 = v53;
            }
            else {
              v53 &= 2u;
            }
            if ((_DWORD)v53)
            {
              uint64_t v55 = objc_opt_class(self);
              int v64 = 138412546;
              uint64_t v65 = v55;
              __int16 v66 = 2112;
              v67 = v9;
              uint64_t v56 = _os_log_send_and_compose_impl( v53,  0LL,  0LL,  0LL,  &_mh_execute_header,  v54,  0LL,  "%@: Rental checkout body: %@",  &v64,  22);
              if (v56)
              {
                v57 = (void *)v56;
                v58 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v56,  4LL);
                free(v57);
                v60 = v58;
                SSFileLog(v51, @"%@");
              }
            }

            v42 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  100LL,  0LL,  0LL,  v60);

            goto LABEL_106;
          }

          __int128 v14 = @"stream";
        }

        -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v14, @"checkout-type");
        goto LABEL_94;
      }

      id v25 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v25) {
        id v25 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v31 = [v25 shouldLog];
      else {
        LODWORD(v32) = v31;
      }
      v33 = (os_log_s *)[v25 OSLogObject];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v32 = v32;
      }
      else {
        v32 &= 2u;
      }
      if (!(_DWORD)v32)
      {
LABEL_67:
        v6 = 0LL;
        goto LABEL_68;
      }

      uint64_t v34 = objc_opt_class(self);
      int v64 = 138412290;
      uint64_t v65 = v34;
      uint64_t v30 = _os_log_send_and_compose_impl( v32,  0LL,  0LL,  0LL,  &_mh_execute_header,  v33,  0LL,  "%@: Could not get DSID",  &v64,  12);
    }

    else
    {
      id v25 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v25) {
        id v25 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v26 = [v25 shouldLog];
      else {
        LODWORD(v27) = v26;
      }
      v28 = (os_log_s *)[v25 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v27 = v27;
      }
      else {
        v27 &= 2u;
      }
      if (!(_DWORD)v27) {
        goto LABEL_67;
      }
      uint64_t v29 = objc_opt_class(self);
      int v64 = 138412290;
      uint64_t v65 = v29;
      uint64_t v30 = _os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &_mh_execute_header,  v28,  0LL,  "%@: Could not get rental bag request",  &v64,  12);
    }

    if (v30)
    {
      v35 = (void *)v30;
      v36 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v30, 4LL);
      free(v35);
      v60 = v36;
      SSFileLog(v25, @"%@");
    }

    goto LABEL_67;
  }

  id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v15) {
    id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v16 = [v15 shouldLog];
  else {
    LODWORD(v17) = v16;
  }
  v18 = (os_log_s *)[v15 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v17 = v17;
  }
  else {
    v17 &= 2u;
  }
  if (!(_DWORD)v17) {
    goto LABEL_44;
  }
  int v64 = 138412290;
  uint64_t v65 = objc_opt_class(self);
  uint64_t v19 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Invalid primary sinf",  &v64,  12);
LABEL_42:
  v23 = (void *)v19;
  if (v19)
  {
    v24 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v19, 4LL);
    free(v23);
    v60 = v24;
    SSFileLog(v15, @"%@");
  }

- (id)_copyAccountIdentifier
{
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    return -[NSNumber copy](accountIdentifier, "copy");
  }
  id v5 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", self->_sinfs);
  id v6 = -[SinfsArray copyValueForProperty:error:]( v5,  "copyValueForProperty:error:",  @"SinfPropertyAccountIdentifier",  0LL);

  return v6;
}

- (id)_copyRentalIdentifier
{
  rentalKeyIdentifier = self->_rentalKeyIdentifier;
  if (rentalKeyIdentifier) {
    return -[NSNumber copy](rentalKeyIdentifier, "copy");
  }
  id v5 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", self->_sinfs);
  id v6 = -[SinfsArray copyValueForProperty:error:]( v5,  "copyValueForProperty:error:",  @"SinfPropertyFairPlayKeyIdentifier",  0LL);

  return v6;
}

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKey:kISFailureTypeKey];
  id v8 = [a3 objectForKey:@"rental-bag-response"];
  if (v7)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v10 = [v9 shouldLog];
    else {
      LODWORD(v11) = v10;
    }
    id v12 = (os_log_s *)[v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = v11;
    }
    else {
      v11 &= 2u;
    }
    if ((_DWORD)v11)
    {
      int v45 = 138412546;
      uint64_t v46 = objc_opt_class(self);
      __int16 v47 = 2112;
      id v48 = v7;
      uint64_t v13 = _os_log_send_and_compose_impl( v11,  0LL,  0LL,  0LL,  &_mh_execute_header,  v12,  0LL,  "%@: Received failure type: %@",  &v45,  22);
      if (v13)
      {
        __int128 v14 = (void *)v13;
        id v15 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v13, 4LL);
        free(v14);
        id v43 = v15;
        SSFileLog(v9, @"%@");
      }
    }

    if ((objc_opt_respondsToSelector(v7, "intValue") & 1) != 0 && [v7 intValue] == 5102)
    {
      id v16 = objc_msgSend((id)ISError(15, 0, 0), "errorBySettingFatalError:", 1);
      -[CheckoutRentalKeysOperation _showErrorDialogForOutput:](self, "_showErrorDialogForOutput:", a3);
LABEL_34:
      BOOL v27 = 0;
      goto LABEL_35;
    }

    uint64_t v17 = ISError(2LL, 0LL, 0LL);
LABEL_33:
    id v16 = (id)v17;
    goto LABEL_34;
  }

  if (v8)
  {
    if (!sub_10002350C(v8)
      || (id v18 = [a3 objectForKey:@"device-diversity"]) != 0 && !sub_100023658(v18))
    {
      id v19 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v19) {
        id v19 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v20 = [v19 shouldLog];
      else {
        LODWORD(v21) = v20;
      }
      v22 = (os_log_s *)[v19 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v21 = v21;
      }
      else {
        v21 &= 2u;
      }
      if ((_DWORD)v21)
      {
        int v45 = 138412290;
        uint64_t v46 = objc_opt_class(self);
        uint64_t v23 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%@: Could not process rental bag keys",  &v45,  12);
        if (v23)
        {
          v24 = (void *)v23;
          id v25 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
          free(v24);
          id v43 = v25;
          SSFileLog(v19, @"%@");
        }
      }

      uint64_t v26 = ISError(15LL, 0LL, 0LL);
      uint64_t v17 = SSErrorBySettingUserInfoValue( v26,  SSErrorAllowRetryKey,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
      goto LABEL_33;
    }

    goto LABEL_60;
  }

  id v36 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v36) {
    id v36 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v37 = [v36 shouldLog];
  else {
    LODWORD(v38) = v37;
  }
  uint64_t v39 = (os_log_s *)[v36 OSLogObject];
  BOOL v27 = 1;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
    uint64_t v38 = v38;
  }
  else {
    v38 &= 2u;
  }
  if ((_DWORD)v38)
  {
    int v45 = 138412290;
    uint64_t v46 = objc_opt_class(self);
    uint64_t v40 = _os_log_send_and_compose_impl( v38,  0LL,  0LL,  0LL,  &_mh_execute_header,  v39,  1LL,  "%@: Succeeding because no rental bag data",  &v45,  12);
    if (v40)
    {
      uint64_t v41 = (void *)v40;
      v42 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v40, 4LL);
      free(v41);
      id v43 = v42;
      SSFileLog(v36, @"%@");
LABEL_60:
      id v16 = 0LL;
      BOOL v27 = 1;
      goto LABEL_35;
    }
  }

  id v16 = 0LL;
LABEL_35:
  id v28 = +[SSLogConfig sharedWriteToDiskConfig](&OBJC_CLASS___SSLogConfig, "sharedWriteToDiskConfig", v43);
  if (!v28) {
    id v28 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v29 = [v28 shouldLog];
  else {
    LODWORD(v30) = v29;
  }
  unsigned int v31 = (os_log_s *)[v28 OSLogObject];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v30 = v30;
  }
  else {
    v30 &= 2u;
  }
  if ((_DWORD)v30)
  {
    uint64_t v32 = objc_opt_class(self);
    int v45 = 138412546;
    uint64_t v46 = v32;
    __int16 v47 = 2112;
    id v48 = a3;
    LODWORD(v44) = 22;
    uint64_t v33 = _os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%@: Rental checkout response: %@",  &v45,  v44);
    if (v33)
    {
      uint64_t v34 = (void *)v33;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v33, 4LL);
      free(v34);
      SSFileLog(v28, @"%@");
    }
  }

  if (a4) {
    *a4 = v16;
  }
  return v27;
}

- (BOOL)_haveValidRentalInformation
{
  if (-[NSArray count](self->_sinfs, "count"))
  {
    objc_super v3 = -[SinfsArray initWithSINFs:](objc_alloc(&OBJC_CLASS___SinfsArray), "initWithSINFs:", self->_sinfs);
    v4 = -[SinfsArray copyValueForProperty:error:]( v3,  "copyValueForProperty:error:",  @"SinfPropertyRentalInformation",  0LL);

    if (!v4) {
      goto LABEL_40;
    }
  }

  else
  {
    v4 = sub_100022CFC( -[NSNumber unsignedLongLongValue](self->_accountIdentifier, "unsignedLongLongValue"),  -[NSNumber unsignedLongLongValue](self->_rentalKeyIdentifier, "unsignedLongLongValue"));
    if (!v4) {
      goto LABEL_40;
    }
  }

  if (!objc_msgSend( +[SSLogConfig sharedWriteToDiskConfig](SSLogConfig, "sharedWriteToDiskConfig"),  "shouldLog")) {
    goto LABEL_40;
  }
  id v5 = +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)-[ISFairPlayRentalInfo rentalStartTime](v4, "rentalStartTime")),  (double)-[ISFairPlayRentalInfo rentalDuration](v4, "rentalDuration"));
  id v6 = +[SSLogConfig sharedWriteToDiskConfig](&OBJC_CLASS___SSLogConfig, "sharedWriteToDiskConfig");
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  id v9 = (os_log_s *)[v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if ((_DWORD)v8)
  {
    uint64_t v10 = objc_opt_class(self);
    -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
    *(_DWORD *)uint64_t v32 = 138412802;
    *(void *)&v32[4] = v10;
    *(_WORD *)&v32[12] = 2048;
    *(void *)&v32[14] = v11;
    *(_WORD *)&v32[22] = 2112;
    uint64_t v33 = v5;
    uint64_t v12 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  2LL,  "%@: Rental period ends in %.2f seconds at %@",  v32,  32);
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      __int128 v14 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v12, 4LL);
      free(v13);
      uint64_t v30 = v14;
      SSFileLog(v6, @"%@");
    }
  }

  if (-[ISFairPlayRentalInfo playbackStartTime](v4, "playbackStartTime", v30) == -1)
  {
    id v16 = +[SSLogConfig sharedWriteToDiskConfig](&OBJC_CLASS___SSLogConfig, "sharedWriteToDiskConfig");
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v23 = [v16 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    id v25 = (os_log_s *)[v16 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      uint64_t v26 = objc_opt_class(self);
      unsigned int v27 = -[ISFairPlayRentalInfo playbackDuration](v4, "playbackDuration");
      *(_DWORD *)uint64_t v32 = 138412546;
      *(void *)&v32[4] = v26;
      *(_WORD *)&v32[12] = 2048;
      *(void *)&v32[14] = v27;
      LODWORD(v31) = 22;
      uint64_t v22 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  2LL,  "%@: Playback not started, duration is %lu",  v32,  v31,  *(_OWORD *)v32,  *(void *)&v32[16],  v33);
LABEL_38:
      id v28 = (void *)v22;
      if (v22)
      {
        +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v22, 4LL);
        free(v28);
        SSFileLog(v16, @"%@");
      }
    }
  }

  else
  {
    id v15 = +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)-[ISFairPlayRentalInfo playbackStartTime](v4, "playbackStartTime")),  (double)-[ISFairPlayRentalInfo playbackDuration](v4, "playbackDuration"));
    id v16 = +[SSLogConfig sharedWriteToDiskConfig](&OBJC_CLASS___SSLogConfig, "sharedWriteToDiskConfig");
    if (!v16) {
      id v16 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v17 = [v16 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    id v19 = (os_log_s *)[v16 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      uint64_t v20 = objc_opt_class(self);
      -[NSDate timeIntervalSinceNow](v15, "timeIntervalSinceNow");
      *(_DWORD *)uint64_t v32 = 138412802;
      *(void *)&v32[4] = v20;
      *(_WORD *)&v32[12] = 2048;
      *(void *)&v32[14] = v21;
      *(_WORD *)&v32[22] = 2112;
      LODWORD(v31) = 32;
      uint64_t v22 = _os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  2LL,  "%@: Rental playback period ends in %.2f seconds at %@",  v32,  v31,  *(_OWORD *)v32,  *(void *)&v32[16],  v15);
      goto LABEL_38;
    }
  }

- (BOOL)_performCheckout:(id *)a3
{
  uint64_t v24 = 0LL;
  id v5 = -[CheckoutRentalKeysOperation _bodyData](self, "_bodyData");
  if (!v5)
  {
    uint64_t v24 = (void *)ISError(15LL, 0LL, 0LL);
    if (!a3) {
      return (char)v5;
    }
    goto LABEL_23;
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___ISStoreURLOperation);
  id v7 = -[CheckoutRentalKeysOperation _copyAccountIdentifier](self, "_copyAccountIdentifier");
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = -[SSAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSAuthenticationContext),  "initWithAccountIdentifier:",  v7);
    [v6 setAuthenticationContext:v9];
  }

  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___DaemonProtocolDataProvider);
  [v6 setDataProvider:v10];
  if (-[CheckoutRentalKeysOperation isBackgroundCheckout](self, "isBackgroundCheckout")) {
    -[DaemonProtocolDataProvider setShouldProcessDialogs:](v10, "setShouldProcessDialogs:", 0LL);
  }
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
  -[SSMutableURLRequestProperties setCachePolicy:](v11, "setCachePolicy:", 1LL);
  -[SSMutableURLRequestProperties setClientIdentifier:]( v11,  "setClientIdentifier:",  -[CheckoutRentalKeysOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  -[SSMutableURLRequestProperties setHTTPBody:](v11, "setHTTPBody:", v5);
  -[SSMutableURLRequestProperties setHTTPMethod:](v11, "setHTTPMethod:", @"POST");
  -[SSMutableURLRequestProperties setURLBagKey:](v11, "setURLBagKey:", @"rental-checkout");
  uint64_t v12 = -[CheckoutRentalKeysOperation userAgent](self, "userAgent");
  -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:]( v11,  "setValue:forHTTPHeaderField:",  v12,  SSHTTPHeaderUserAgent);
  [v6 setRequestProperties:v11];

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
    int v25 = 138412290;
    uint64_t v26 = objc_opt_class(self);
    uint64_t v17 = _os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Checking out rental keys",  &v25,  12);
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      id v19 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v17, 4LL);
      free(v18);
      unsigned int v23 = v19;
      SSFileLog(v13, @"%@");
    }
  }

  if (-[CheckoutRentalKeysOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v6,  &v24,  v23))
  {
    id v20 = -[DaemonProtocolDataProvider output](v10, "output");
    LOBYTE(v5) = -[CheckoutRentalKeysOperation _handleResponse:error:](self, "_handleResponse:error:", v20, &v24);
    uint64_t v21 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v20,  100LL,  0LL,  0LL);
    -[CheckoutRentalKeysOperation lock](self, "lock");

    self->_urlResponse = -[SSURLConnectionResponse initWithURLResponse:bodyData:]( [SSURLConnectionResponse alloc],  "initWithURLResponse:bodyData:",  [v6 response],  v21);
    -[CheckoutRentalKeysOperation unlock](self, "unlock");
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  if (a3) {
LABEL_23:
  }
    *a3 = v24;
  return (char)v5;
}

- (id)_primarySINF
{
  id result = -[NSArray count](self->_sinfs, "count");
  if (result) {
    return -[NSArray objectAtIndex:](self->_sinfs, "objectAtIndex:", 0LL);
  }
  return result;
}

- (void)_run
{
  id v41 = 0LL;
  uint64_t v3 = SSErrorAllowRetryKey;
  uint64_t v4 = 1LL;
  while (1)
  {
    id v5 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v6 = [v5 shouldLog];
    else {
      LODWORD(v7) = v6;
    }
    uint64_t v8 = (os_log_s *)[v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      uint64_t v7 = v7;
    }
    else {
      v7 &= 2u;
    }
    if ((_DWORD)v7)
    {
      uint64_t v9 = objc_opt_class(self);
      int v42 = 138412802;
      uint64_t v43 = v9;
      __int16 v44 = 2048;
      uint64_t v45 = v4;
      __int16 v46 = 1024;
      int v47 = 3;
      LODWORD(v40) = 28;
      uint64_t v10 = _os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v8,  1LL,  "%@: Performing checkout attempt #%ld of %d",  &v42,  v40);
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v10, 4LL);
        free(v11);
        uint64_t v39 = v12;
        SSFileLog(v5, @"%@");
      }
    }

    if (-[CheckoutRentalKeysOperation _performCheckout:](self, "_performCheckout:", &v41, v39))
    {
      if (!self->_shouldValidateRentalInfo
        || -[CheckoutRentalKeysOperation _haveValidRentalInformation](self, "_haveValidRentalInformation"))
      {
        id v23 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
        if (!v23) {
          id v23 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v24 = [v23 shouldLog];
        else {
          LODWORD(v25) = v24;
        }
        uint64_t v26 = (os_log_s *)[v23 OSLogObject];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
          uint64_t v25 = v25;
        }
        else {
          v25 &= 2u;
        }
        if ((_DWORD)v25)
        {
          uint64_t v27 = objc_opt_class(self);
          int v42 = 138412290;
          uint64_t v43 = v27;
          LODWORD(v40) = 12;
          uint64_t v28 = _os_log_send_and_compose_impl( v25,  0LL,  0LL,  0LL,  &_mh_execute_header,  v26,  1LL,  "%@: Verified rental information",  &v42,  v40);
          if (v28)
          {
            unsigned int v29 = (void *)v28;
            uint64_t v30 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v28,  4LL);
            free(v29);
            uint64_t v39 = v30;
            SSFileLog(v23, @"%@");
          }
        }

        if (-[CheckoutRentalKeysOperation isBackgroundCheckout](self, "isBackgroundCheckout", v39)) {
          objc_msgSend( +[DistributedNotificationCenter defaultCenter](DistributedNotificationCenter, "defaultCenter"),  "postNotificationName:",  @"com.apple.itunesstored.RentalAdded");
        }
        uint64_t v22 = 1LL;
        goto LABEL_57;
      }

      goto LABEL_18;
    }

- (void)_showErrorDialogForOutput:(id)a3
{
  id v5 = [a3 objectForKey:@"customerMessage"];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0
    && [v5 length]
    && v5
    && ![a3 objectForKey:kISDialogKey]
    && !-[CheckoutRentalKeysOperation isBackgroundCheckout](self, "isBackgroundCheckout"))
  {
    objc_msgSend( +[ISOperationQueue mainQueue](ISOperationQueue, "mainQueue"),  "addOperation:",  +[ISDialogOperation operationWithError:]( ISDialogOperation,  "operationWithError:",  ISError(15, v5, 0)));
  }

- (BOOL)isBackgroundCheckout
{
  return self->_backgroundCheckout;
}

- (void)setBackgroundCheckout:(BOOL)a3
{
  self->_backgroundCheckout = a3;
}

- (BOOL)shouldValidateRentalInfo
{
  return self->_shouldValidateRentalInfo;
}

- (void)setShouldValidateRentalInfo:(BOOL)a3
{
  self->_shouldValidateRentalInfo = a3;
}

- (BOOL)shouldCheckoutWithPlay
{
  return self->_checkoutWithPlay;
}

- (void)setCheckoutWithPlay:(BOOL)a3
{
  self->_checkoutWithPlay = a3;
}

- (unint64_t)checkoutType
{
  return self->_checkoutType;
}

- (void)setCheckoutType:(unint64_t)a3
{
  self->_checkoutType = a3;
}

@end