@interface PBCarMVerificationOperation
- (BOOL)_sendNewCodeShowingDialogs:(BOOL)a3 error:(id *)a4;
- (BOOL)_verifySMSCode:(id)a3 error:(id *)a4;
- (NSDictionary)failureClientInfo;
- (NSString)customerMessage;
- (NSString)customerTitle;
- (id)_copySMSCodeFromUser;
- (id)_copySendCodeResponseWithError:(id *)a3;
- (id)_copyVerifyResponseWithCode:(id)a3 error:(id *)a4;
- (id)codeHandler;
- (id)sendNewCodeBlock;
- (void)presentCodeEntryAlertWithTitle:(id)a3 message:(id)a4 newCodeLabel:(id)a5 submitLabel:(id)a6 newCodeRequestHandler:(id)a7 completion:(id)a8;
- (void)presentFailureAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)run;
- (void)setCodeHandler:(id)a3;
- (void)setCustomerMessage:(id)a3;
- (void)setCustomerTitle:(id)a3;
- (void)setFailureClientInfo:(id)a3;
- (void)setSendNewCodeBlock:(id)a3;
- (void)textEntry:(id)a3 didSelectButtonAtIndex:(unint64_t)a4;
- (void)textEntryDidCancel:(id)a3;
@end

@implementation PBCarMVerificationOperation

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation failureClientInfo](self, "failureClientInfo"));

  if (v3)
  {
    uint64_t v4 = ISErrorDomain;
    unint64_t v5 = 1LL;
    while (1)
    {
      id v6 = -[PBCarMVerificationOperation _copySMSCodeFromUser](self, "_copySMSCodeFromUser");
      if (!v6) {
        break;
      }
      v7 = v6;
      BOOL v8 = v5 < 3;
      id v21 = 0LL;
      BOOL v9 = -[PBCarMVerificationOperation _verifySMSCode:error:](self, "_verifySMSCode:error:", v6, &v21);
      id v10 = v21;
      -[PBCarMVerificationOperation setSuccess:](self, "setSuccess:", v9);
      if (v10)
      {
        -[PBCarMVerificationOperation setError:](self, "setError:", v10);
        BOOL v8 = 0;
      }

      unsigned int v11 = -[PBCarMVerificationOperation success](self, "success");

      if (!v11)
      {
        ++v5;
        if (v8) {
          continue;
        }
      }

      return;
    }

    id v15 = sub_1000847E8();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      id v18 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@: User canceled CarM verification", buf, 0xCu);
    }

    uint64_t v12 = v4;
    uint64_t v14 = 16LL;
    v13 = 0LL;
  }

  else
  {
    uint64_t v12 = ISErrorDomain;
    v13 = @"No failure info provided";
    uint64_t v14 = 0LL;
  }

  uint64_t v19 = ISErrorWithDomain(v12, v14, 0LL, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[PBCarMVerificationOperation setError:](self, "setError:", v20);

  -[PBCarMVerificationOperation setSuccess:](self, "setSuccess:", 0LL);
}

- (id)_copySMSCodeFromUser
{
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = sub_1001190C4;
  v20 = sub_1001190D4;
  id v21 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation failureClientInfo](self, "failureClientInfo"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dictionaryForKey:", @"localization"));

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation customerTitle](self, "customerTitle"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation customerMessage](self, "customerMessage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"customerSendNewCodeButtonMessage"]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"customerSubmitButtonMessage"]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001190EC;
  v15[3] = &unk_1003CFF08;
  v15[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10011910C;
  v12[3] = &unk_1003D81D8;
  uint64_t v14 = &v16;
  BOOL v9 = dispatch_semaphore_create(0LL);
  v13 = v9;
  -[PBCarMVerificationOperation presentCodeEntryAlertWithTitle:message:newCodeLabel:submitLabel:newCodeRequestHandler:completion:]( self,  "presentCodeEntryAlertWithTitle:message:newCodeLabel:submitLabel:newCodeRequestHandler:completion:",  v5,  v6,  v7,  v8,  v15,  v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (BOOL)_sendNewCodeShowingDialogs:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v33 = 0LL;
  id v7 = -[PBCarMVerificationOperation _copySendCodeResponseWithError:](self, "_copySendCodeResponseWithError:", &v33);
  id v8 = v33;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    if (!v8)
    {
      uint64_t v21 = ISErrorWithDomain(ISErrorDomain, 3LL, 0LL, 0LL);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v21);
    }

    unsigned __int8 v22 = 0;
    if (a4) {
      goto LABEL_21;
    }
    goto LABEL_22;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kISFailureTypeKey]);
  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:kISDialogKey]);
    if (v11)
    {
      id v12 = [[ISDialog alloc] initWithDialogDictionary:v11];
      if (v12)
      {
        id v13 = sub_1000847E8();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          v35 = v15;
          id v16 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: Dialog returned while sending code",  buf,  0xCu);
        }

        if (v5)
        {
          dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 message]);
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472LL;
          v31[2] = sub_1001194B8;
          v31[3] = &unk_1003CFF08;
          dispatch_semaphore_t v32 = v17;
          v20 = v17;
          -[PBCarMVerificationOperation presentFailureAlertWithTitle:message:completion:]( self,  "presentFailureAlertWithTitle:message:completion:",  v18,  v19,  v31);

          dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        }
      }
    }

    else
    {
      id v12 = 0LL;
    }

LABEL_19:
    unsigned __int8 v22 = 0;
    goto LABEL_20;
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"success"]);
  char v23 = objc_opt_respondsToSelector(v11, "BOOLValue");
  id v24 = sub_1000847E8();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  v26 = v25;
  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10028314C((uint64_t)self);
    }

    if (!v8)
    {
      uint64_t v30 = ISErrorWithDomain(ISErrorDomain, 0LL, 0LL, 0LL);
      id v8 = (id)objc_claimAutoreleasedReturnValue(v30);
    }

    goto LABEL_19;
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v27 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138412546;
    v35 = v27;
    __int16 v36 = 2112;
    v37 = v11;
    id v28 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@: CarM send code status %@", buf, 0x16u);
  }

  unsigned __int8 v22 = [v11 BOOLValue];
LABEL_20:

  if (a4) {
LABEL_21:
  }
    *a4 = v8;
LABEL_22:

  return v22;
}

- (BOOL)_verifySMSCode:(id)a3 error:(id *)a4
{
  id v38 = 0LL;
  id v6 = -[PBCarMVerificationOperation _copyVerifyResponseWithCode:error:]( self,  "_copyVerifyResponseWithCode:error:",  a3,  &v38);
  id v7 = v38;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    -[PBCarMVerificationOperation setError:](self, "setError:", v7);
    unsigned __int8 v25 = 0;
    if (!a4) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kISFailureTypeKey]);
  if (v9)
  {
    id v10 = sub_1000847E8();
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10028322C((uint64_t)self);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"customerMessage"]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kISDialogKey]);
    if (v13) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v12 == 0LL;
    }
    if (!v14)
    {
      v43 = @"explanation";
      v44 = v12;
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    }

    if (v13)
    {
      id v15 = [[ISDialog alloc] initWithDialogDictionary:v13];
      if (v15)
      {
        id v16 = v15;
        v35 = v9;
        id v17 = sub_1000847E8();
        uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          v40 = v19;
          id v20 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%@: User entered wrong CarM SMS code",  buf,  0xCu);
        }

        dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
        unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v16 title]);
        char v23 = (void *)objc_claimAutoreleasedReturnValue([v16 message]);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472LL;
        v36[2] = sub_10011989C;
        v36[3] = &unk_1003CFF08;
        dispatch_semaphore_t v37 = v21;
        id v24 = v21;
        -[PBCarMVerificationOperation presentFailureAlertWithTitle:message:completion:]( self,  "presentFailureAlertWithTitle:message:completion:",  v22,  v23,  v36);

        dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v9 = v35;
      }
    }

    unsigned __int8 v25 = 0;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"success"]);
    char v26 = objc_opt_respondsToSelector(v12, "BOOLValue");
    id v27 = sub_1000847E8();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    v29 = v28;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138412546;
        v40 = v30;
        __int16 v41 = 2112;
        v42 = v12;
        id v31 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@: CarM verify code status %@", buf, 0x16u);
      }

      unsigned __int8 v25 = [v12 BOOLValue];
    }

    else
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1002831BC((uint64_t)self);
      }

      uint64_t v32 = ISErrorWithDomain(ISErrorDomain, 0LL, 0LL, 0LL);
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);

      unsigned __int8 v25 = 0;
      id v7 = (id)v33;
    }
  }

  if (a4) {
LABEL_26:
  }
    *a4 = v7;
LABEL_27:

  return v25;
}

- (id)_copySendCodeResponseWithError:(id *)a3
{
  BOOL v5 = objc_opt_new(&OBJC_CLASS___ISStoreURLOperation);
  id v6 = (void *)objc_opt_new(&OBJC_CLASS___ISProtocolDataProvider);
  [v6 setShouldProcessProtocol:0];
  -[ISStoreURLOperation setDataProvider:](v5, "setDataProvider:", v6);
  char v23 = @"guid";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 guid]);
  id v24 = v8;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v9,  100LL,  0LL,  0LL));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation failureClientInfo](self, "failureClientInfo"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_dictionaryForKey:", @"carrierBillingUrls"));

  id v13 = objc_opt_new(&OBJC_CLASS___SSMutableURLRequestProperties);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"sendCodeUrl"]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v14));
  -[SSMutableURLRequestProperties pb_configurePostRequestWithURL:data:]( v13,  "pb_configurePostRequestWithURL:data:",  v15,  v10);

  -[ISStoreURLOperation setShouldSendXTokenHeader:](v5, "setShouldSendXTokenHeader:", 1LL);
  -[ISStoreURLOperation setRequestProperties:](v5, "setRequestProperties:", v13);
  id v16 = sub_1000847E8();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10028329C(v17);
  }

  id v22 = 0LL;
  unsigned int v18 = -[PBCarMVerificationOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v22);
  id v19 = v22;
  id v20 = 0LL;
  if (v18) {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 output]);
  }
  if (a3) {
    *a3 = v19;
  }

  return v20;
}

- (id)_copyVerifyResponseWithCode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new(&OBJC_CLASS___ISStoreURLOperation);
  id v7 = (void *)objc_opt_new(&OBJC_CLASS___ISProtocolDataProvider);
  [v7 setShouldProcessProtocol:0];
  uint64_t v30 = v7;
  -[ISStoreURLOperation setDataProvider:](v6, "setDataProvider:", v7);
  v33[0] = @"guid";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 guid]);
  v33[1] = @"verificationCode";
  v34[0] = v9;
  v34[1] = v5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v34,  v33,  2LL));

  id v28 = (void *)v10;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v10,  100LL,  0LL,  0LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation failureClientInfo](self, "failureClientInfo"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_dictionaryForKey:", @"carrierBillingUrls"));

  BOOL v14 = objc_opt_new(&OBJC_CLASS___SSMutableURLRequestProperties);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"verifyCodeUrl"]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));
  -[SSMutableURLRequestProperties pb_configurePostRequestWithURL:data:]( v14,  "pb_configurePostRequestWithURL:data:",  v16,  v11);

  -[ISStoreURLOperation setShouldSendXTokenHeader:](v6, "setShouldSendXTokenHeader:", 1LL);
  -[ISStoreURLOperation setRequestProperties:](v6, "setRequestProperties:", v14);
  -[ISStoreURLOperation pb_configureMachineDataStyleToNone](v6, "pb_configureMachineDataStyleToNone");
  id v17 = sub_1000847E8();
  unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_1002832DC((uint64_t)v5, v18);
  }

  id v32 = 0LL;
  unsigned int v19 = -[PBCarMVerificationOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v6,  &v32);
  id v20 = v32;
  if (v19)
  {
    dispatch_semaphore_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ISStoreURLOperation response](v6, "response"));
    id v22 = v11;
    id v23 = v5;
    id v24 = -[PBMachineDataOperation initWithURLResponse:]( objc_alloc(&OBJC_CLASS___PBMachineDataOperation),  "initWithURLResponse:",  v21);
    id v31 = v20;
    -[PBCarMVerificationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v24, &v31);
    id v25 = v31;

    char v26 = (void *)objc_claimAutoreleasedReturnValue([v30 output]);
    id v5 = v23;
    unsigned int v11 = v22;

    id v20 = v25;
  }

  else
  {
    char v26 = 0LL;
  }

  if (a4) {
    *a4 = v20;
  }

  return v26;
}

- (void)presentCodeEntryAlertWithTitle:(id)a3 message:(id)a4 newCodeLabel:(id)a5 submitLabel:(id)a6 newCodeRequestHandler:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  -[PBCarMVerificationOperation setCodeHandler:](self, "setCodeHandler:", a8);
  -[PBCarMVerificationOperation setSendNewCodeBlock:](self, "setSendNewCodeBlock:", v18);

  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100119F58;
  v23[3] = &unk_1003D8200;
  objc_copyWeak(&v28, &location);
  id v24 = v14;
  id v25 = v15;
  id v26 = v17;
  id v27 = v16;
  id v19 = v16;
  id v20 = v17;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(&_dispatch_main_q, v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)presentFailureAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011A118;
  block[3] = &unk_1003D2F08;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v11;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)textEntry:(id)a3 didSelectButtonAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_sendCodeIndex == a4)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation sendNewCodeBlock](self, "sendNewCodeBlock"));

    if (v8)
    {
      id v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation sendNewCodeBlock](self, "sendNewCodeBlock"));
      v9[2]();
LABEL_8:
    }
  }

  else if (self->_submitIndex == a4)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 enteredValues]);
    id v9 = (void (**)(void))objc_claimAutoreleasedReturnValue([v10 firstObject]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation codeHandler](self, "codeHandler"));
    if (v11)
    {
      id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation codeHandler](self, "codeHandler"));
      ((void (**)(void, void (**)(void)))v12)[2](v12, v9);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 presentingViewController]);
    [v13 dismissViewControllerAnimated:1 completion:0];

    goto LABEL_8;
  }
}

- (void)textEntryDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation codeHandler](self, "codeHandler"));

  if (v5)
  {
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PBCarMVerificationOperation codeHandler](self, "codeHandler"));
    v6[2](v6, 0LL);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 presentingViewController]);
  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (id)codeHandler
{
  return self->_codeHandler;
}

- (void)setCodeHandler:(id)a3
{
}

- (id)sendNewCodeBlock
{
  return self->_sendNewCodeBlock;
}

- (void)setSendNewCodeBlock:(id)a3
{
}

- (NSString)customerTitle
{
  return self->_customerTitle;
}

- (void)setCustomerTitle:(id)a3
{
}

- (NSString)customerMessage
{
  return self->_customerMessage;
}

- (void)setCustomerMessage:(id)a3
{
}

- (NSDictionary)failureClientInfo
{
  return self->_failureClientInfo;
}

- (void)setFailureClientInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end