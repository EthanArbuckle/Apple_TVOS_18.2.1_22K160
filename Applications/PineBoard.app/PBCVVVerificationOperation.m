@interface PBCVVVerificationOperation
- (BOOL)_verifyCVVCode:(id)a3 error:(id *)a4;
- (NSString)customerMessage;
- (NSString)customerTitle;
- (NSURL)verifyURL;
- (id)_copyCVVCodeFromUser;
- (id)_copyResponseWithCode:(id)a3 error:(id *)a4;
- (id)completion;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)presentFailureAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)run;
- (void)setCompletion:(id)a3;
- (void)setCustomerMessage:(id)a3;
- (void)setCustomerTitle:(id)a3;
- (void)setVerifyURL:(id)a3;
- (void)textEntry:(id)a3 didSelectButtonAtIndex:(unint64_t)a4;
- (void)textEntryDidCancel:(id)a3;
@end

@implementation PBCVVVerificationOperation

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation verifyURL](self, "verifyURL"));

  if (v3)
  {
    uint64_t v4 = ISErrorDomain;
    unint64_t v5 = 1LL;
    while (1)
    {
      id v6 = -[PBCVVVerificationOperation _copyCVVCodeFromUser](self, "_copyCVVCodeFromUser");
      if (!v6) {
        break;
      }
      v7 = v6;
      BOOL v8 = v5 < 3;
      id v21 = 0LL;
      BOOL v9 = -[PBCVVVerificationOperation _verifyCVVCode:error:](self, "_verifyCVVCode:error:", v6, &v21);
      id v10 = v21;
      -[PBCVVVerificationOperation setSuccess:](self, "setSuccess:", v9);
      if (v10)
      {
        -[PBCVVVerificationOperation setError:](self, "setError:", v10);
        BOOL v8 = 0;
      }

      unsigned int v11 = -[PBCVVVerificationOperation success](self, "success");

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
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@: User canceled CVV check", buf, 0xCu);
    }

    uint64_t v12 = v4;
    uint64_t v14 = 16LL;
    v13 = 0LL;
  }

  else
  {
    uint64_t v12 = ISErrorDomain;
    v13 = @"No verify URL provided";
    uint64_t v14 = 0LL;
  }

  uint64_t v19 = ISErrorWithDomain(v12, v14, 0LL, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[PBCVVVerificationOperation setError:](self, "setError:", v20);

  -[PBCVVVerificationOperation setSuccess:](self, "setSuccess:", 0LL);
}

- (id)_copyCVVCodeFromUser
{
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_100165538;
  v16 = sub_100165548;
  id v17 = 0LL;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation customerTitle](self, "customerTitle"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation customerMessage](self, "customerMessage"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100165560;
  v9[3] = &unk_1003D81D8;
  unsigned int v11 = &v12;
  id v6 = v3;
  id v10 = v6;
  -[PBCVVVerificationOperation presentAlertWithTitle:message:completion:]( self,  "presentAlertWithTitle:message:completion:",  v4,  v5,  v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_verifyCVVCode:(id)a3 error:(id *)a4
{
  id v35 = 0LL;
  id v6 = -[PBCVVVerificationOperation _copyResponseWithCode:error:](self, "_copyResponseWithCode:error:", a3, &v35);
  id v7 = v35;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    -[PBCVVVerificationOperation setError:](self, "setError:", v7);
    LOBYTE(v12) = 0;
    if (!a4) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kISFailureTypeKey]);
  id v10 = v9;
  if (v9)
  {
    if (([v9 isEqualToString:@"5202"] & 1) != 0
      || [v10 isEqualToString:@"2025"])
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:kISDialogKey]);
      if (v11)
      {
        id v12 = [[ISDialog alloc] initWithDialogDictionary:v11];
        if (!v12) {
          goto LABEL_25;
        }
        id v13 = sub_1000847E8();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          v37 = v15;
          id v16 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@: User entered wrong CVV code",  buf,  0xCu);
        }

        dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v12 message]);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_100165938;
        v33[3] = &unk_1003CFF08;
        dispatch_semaphore_t v34 = v17;
        v20 = v17;
        -[PBCVVVerificationOperation presentFailureAlertWithTitle:message:completion:]( self,  "presentFailureAlertWithTitle:message:completion:",  v18,  v19,  v33);

        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
      }

      LOBYTE(v12) = 0;
    }

    else
    {
      unsigned int v25 = [v10 isEqualToString:@"5200"];
      id v26 = sub_1000847E8();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v25)
      {
        if (v28) {
          sub_10028812C((uint64_t)self);
        }

        uint64_t v29 = ISErrorDomain;
        uint64_t v30 = 5LL;
      }

      else
      {
        if (v28) {
          sub_10028819C((uint64_t)self);
        }

        uint64_t v29 = ISErrorDomain;
        uint64_t v30 = 0LL;
      }

      uint64_t v31 = ISErrorWithDomain(v29, v30, 0LL, 0LL);
      LOBYTE(v12) = 0;
      unsigned int v11 = v7;
      id v7 = (id)objc_claimAutoreleasedReturnValue(v31);
    }
  }

  else
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"jingleDocType"]);
    LOBYTE(v12) = [v11 isEqualToString:@"success"];
    if ((v12 & 1) == 0)
    {
      id v21 = sub_1000847E8();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1002880BC((uint64_t)self);
      }

      uint64_t v23 = ISErrorWithDomain(ISErrorDomain, 0LL, 0LL, 0LL);
      uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);

      id v7 = (id)v24;
    }
  }

- (id)_copyResponseWithCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new(&OBJC_CLASS___ISStoreURLOperation);
  uint64_t v8 = (void *)objc_opt_new(&OBJC_CLASS___ISProtocolDataProvider);
  [v8 setShouldProcessProtocol:0];
  uint64_t v29 = v8;
  -[ISStoreURLOperation setDataProvider:](v7, "setDataProvider:", v8);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  v32[0] = @"guid";
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
  v33[0] = v10;
  v33[1] = v6;
  v32[1] = @"cvm";
  v32[2] = @"machineName";
  v33[2] = @"Apple-TV";
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  3LL));

  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v11,  100LL,  0LL,  0LL));
  id v13 = objc_opt_new(&OBJC_CLASS___SSMutableURLRequestProperties);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation verifyURL](self, "verifyURL"));
  BOOL v28 = (void *)v12;
  -[SSMutableURLRequestProperties pb_configurePostRequestWithURL:data:]( v13,  "pb_configurePostRequestWithURL:data:",  v14,  v12);

  -[ISStoreURLOperation setNeedsAuthentication:](v7, "setNeedsAuthentication:", 1LL);
  -[ISStoreURLOperation setRequestProperties:](v7, "setRequestProperties:", v13);
  -[ISStoreURLOperation pb_configureMachineDataStyleToNone](v7, "pb_configureMachineDataStyleToNone");
  id v15 = sub_1000847E8();
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10028820C(v16);
  }

  id v31 = 0LL;
  unsigned int v17 = -[PBCVVVerificationOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v31);
  id v18 = v31;
  if (v17)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[ISStoreURLOperation response](v7, "response"));
    v27 = v11;
    v20 = v9;
    id v21 = a4;
    id v22 = v6;
    uint64_t v23 = -[PBMachineDataOperation initWithURLResponse:]( objc_alloc(&OBJC_CLASS___PBMachineDataOperation),  "initWithURLResponse:",  v19);
    id v30 = v18;
    -[PBCVVVerificationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v23, &v30);
    id v24 = v30;

    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v29 output]);
    id v6 = v22;
    a4 = v21;
    BOOL v9 = v20;
    unsigned int v11 = v27;

    id v18 = v24;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  unsigned int v25 = 0LL;
  if (a4) {
LABEL_7:
  }
    *a4 = v18;
LABEL_8:

  return v25;
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  -[PBCVVVerificationOperation setCompletion:](self, "setCompletion:", a5);
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100165CFC;
  v12[3] = &unk_1003D0378;
  objc_copyWeak(&v15, &location);
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(&_dispatch_main_q, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)presentFailureAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100165ED4;
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
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation completion](self, "completion"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 enteredValues]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

    id v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation completion](self, "completion"));
    ((void (**)(void, void *))v9)[2](v9, v8);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 presentingViewController]);
  [v10 dismissViewControllerAnimated:1 completion:0];
}

- (void)textEntryDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation completion](self, "completion"));

  if (v5)
  {
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PBCVVVerificationOperation completion](self, "completion"));
    v6[2](v6, 0LL);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 presentingViewController]);
  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
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

- (NSURL)verifyURL
{
  return self->_verifyURL;
}

- (void)setVerifyURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end