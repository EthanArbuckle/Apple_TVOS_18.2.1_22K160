@interface PB2SVerificationOperation
- (BOOL)_sendCodeToDevice:(id)a3 error:(id *)a4 showDialogs:(BOOL)a5;
- (BOOL)_sendCodeToSelectedDevice;
- (BOOL)_verify2SVCode:(id)a3 error:(id *)a4;
- (NSArray)devices;
- (NSDictionary)URLs;
- (NSDictionary)selectedDevice;
- (NSDictionary)sendCodeLocalization;
- (NSString)customerMessage;
- (NSString)customerTitle;
- (id)_copy2SVCodeFromUser;
- (id)_copyDeviceFromUser;
- (id)_copyDevicesResponseWithError:(id *)a3;
- (id)_copySendCodeResponseForDevice:(id)a3 error:(id *)a4;
- (id)_copyVerifyResponseWithCode:(id)a3 fromDevice:(id)a4 error:(id *)a5;
- (id)codeHandler;
- (id)sendNewCode;
- (void)_displayDeviceListWithCompletionHandler:(id)a3;
- (void)presentCodeEntryAlertWithTitle:(id)a3 message:(id)a4 newCodeLabel:(id)a5 submitLabel:(id)a6 newCodeRequestHandler:(id)a7 completion:(id)a8;
- (void)presentDevicesAlertWithTitle:(id)a3 message:(id)a4 deviceList:(id)a5 completion:(id)a6;
- (void)presentFailureAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)run;
- (void)setCodeHandler:(id)a3;
- (void)setCustomerMessage:(id)a3;
- (void)setCustomerTitle:(id)a3;
- (void)setDevices:(id)a3;
- (void)setSelectedDevice:(id)a3;
- (void)setSendCodeLocalization:(id)a3;
- (void)setSendNewCode:(id)a3;
- (void)setSerializedURLs:(id)a3;
- (void)setURLs:(id)a3;
- (void)textEntry:(id)a3 didSelectButtonAtIndex:(unint64_t)a4;
- (void)textEntryDidCancel:(id)a3;
@end

@implementation PB2SVerificationOperation

- (void)setSerializedURLs:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 dataUsingEncoding:4]);
  if (v4) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v4,  0LL,  0LL,  0LL));
  }
  else {
    v5 = 0LL;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
    -[PB2SVerificationOperation setURLs:](self, "setURLs:", v5);
  }
}

- (void)run
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation URLs](self, "URLs"));

  if (v3)
  {
    unint64_t v4 = 0LL;
    uint64_t v5 = ISErrorDomain;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation selectedDevice](self, "selectedDevice"));

        if (!v6) {
          break;
        }
        BOOL v9 = ++v4 < 3;
        id v10 = -[PB2SVerificationOperation _copy2SVCodeFromUser](self, "_copy2SVCodeFromUser");
        if (v10)
        {
          v11 = v10;
          id v24 = 0LL;
          BOOL v12 = -[PB2SVerificationOperation _verify2SVCode:error:](self, "_verify2SVCode:error:", v10, &v24);
          id v13 = v24;
          -[PB2SVerificationOperation setSuccess:](self, "setSuccess:", v12);
          if (v13)
          {
            -[PB2SVerificationOperation setError:](self, "setError:", v13);
            BOOL v9 = 0;
          }

          unsigned int v14 = -[PB2SVerificationOperation success](self, "success");

          if (v14 || !v9) {
            return;
          }
        }

        else
        {
          -[PB2SVerificationOperation setSelectedDevice:](self, "setSelectedDevice:", 0LL);
          if (v4 > 2) {
            return;
          }
        }
      }

      id v7 = -[PB2SVerificationOperation _copyDeviceFromUser](self, "_copyDeviceFromUser");
      if (!v7) {
        break;
      }
      v8 = v7;
      -[PB2SVerificationOperation setSelectedDevice:](self, "setSelectedDevice:", v7);
      if (!-[PB2SVerificationOperation _sendCodeToSelectedDevice](self, "_sendCodeToSelectedDevice")) {
        -[PB2SVerificationOperation setSelectedDevice:](self, "setSelectedDevice:", 0LL);
      }
    }

    id v15 = sub_1000847E8();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_opt_class(self);
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      id v18 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@: User canceled 2SV check", buf, 0xCu);
    }

    uint64_t v19 = v5;
    uint64_t v20 = 16LL;
    v21 = 0LL;
  }

  else
  {
    uint64_t v19 = ISErrorDomain;
    v21 = @"No verify URL provided";
    uint64_t v20 = 0LL;
  }

  uint64_t v22 = ISErrorWithDomain(v19, v20, 0LL, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  -[PB2SVerificationOperation setError:](self, "setError:", v23);

  -[PB2SVerificationOperation setSuccess:](self, "setSuccess:", 0LL);
}

- (id)_copyDeviceFromUser
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  BOOL v12 = sub_10012D8E0;
  id v13 = sub_10012D8F0;
  id v14 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10012D908;
  v6[3] = &unk_1003D8918;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0LL);
  id v7 = v3;
  -[PB2SVerificationOperation _displayDeviceListWithCompletionHandler:]( self,  "_displayDeviceListWithCompletionHandler:",  v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)_copy2SVCodeFromUser
{
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_10012D8E0;
  v23 = sub_10012D8F0;
  id v24 = 0LL;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation sendCodeLocalization](self, "sendCodeLocalization"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"customerTitleMessage"]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation sendCodeLocalization](self, "sendCodeLocalization"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"customerCodeSentToMessage"]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation sendCodeLocalization](self, "sendCodeLocalization"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"customerSendNewCodeButtonMessage"]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation sendCodeLocalization](self, "sendCodeLocalization"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"customerSubmitButtonMessage"]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10012DB50;
  v18[3] = &unk_1003CFF08;
  v18[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10012DB94;
  v15[3] = &unk_1003D81D8;
  v17 = &v19;
  BOOL v12 = v3;
  v16 = v12;
  -[PB2SVerificationOperation presentCodeEntryAlertWithTitle:message:newCodeLabel:submitLabel:newCodeRequestHandler:completion:]( self,  "presentCodeEntryAlertWithTitle:message:newCodeLabel:submitLabel:newCodeRequestHandler:completion:",  v5,  v7,  v9,  v11,  v18,  v15);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void)_displayDeviceListWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v55 = 0LL;
  id v5 = -[PB2SVerificationOperation _copyDevicesResponseWithError:](self, "_copyDevicesResponseWithError:", &v55);
  id v6 = v55;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kISFailureTypeKey]);
    if (!v8)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 objectForKey:@"localization"]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"devices"]);
      id v10 = v14;
      if (v14 && [v14 count])
      {
        id v37 = v6;
        v38 = (void *)v9;
        uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v15 = v10;
        id v16 = [v15 countByEnumeratingWithState:&v43 objects:v56 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v44 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v43 + 1) + 8 * (void)i) objectForKey:@"label"]);
              [(id)v11 addObject:v20];
            }

            id v17 = [v15 countByEnumeratingWithState:&v43 objects:v56 count:16];
          }

          while (v17);
        }

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"customerVerifyIdentityMessage"]);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"customerChooseDeviceMessage"]);
        v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v21,  v22));

        uint64_t v9 = (uint64_t)v38;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v38 objectForKey:@"customerTitleMessage"]);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_10012E234;
        v40[3] = &unk_1003D8940;
        id v10 = v15;
        id v41 = v10;
        id v42 = v4;
        -[PB2SVerificationOperation presentDevicesAlertWithTitle:message:deviceList:completion:]( self,  "presentDevicesAlertWithTitle:message:deviceList:completion:",  v24,  v23,  v11,  v40);

        v8 = 0LL;
        id v6 = v37;
      }

      else
      {
        id v33 = sub_1000847E8();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          v58 = v35;
          id v36 = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%@: User has no 2SV enrolled devices",  buf,  0xCu);
        }

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10012E214;
        v47[3] = &unk_1003D0110;
        id v48 = v4;
        dispatch_async(&_dispatch_main_q, v47);
        uint64_t v11 = (uint64_t)v48;
      }

      goto LABEL_29;
    }

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v5 objectForKey:kISDialogKey]);
    id v10 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"customerTitleMessage"]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v5 objectForKey:@"customerMessage"]);
    if (v9 | v11)
    {
      if (v9)
      {
        id v25 = [[ISDialog alloc] initWithDialogDictionary:v9];
LABEL_21:
        v26 = v25;
        if (v25)
        {
          uint64_t v39 = v9;
          id v27 = sub_1000847E8();
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = 138412290;
            v58 = v29;
            id v30 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%@: Dialog returned while getting device list",  buf,  0xCu);
          }

          v31 = (void *)objc_claimAutoreleasedReturnValue([v26 title]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v26 message]);
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472LL;
          v49[2] = sub_10012E1F4;
          v49[3] = &unk_1003D0110;
          id v50 = v4;
          -[PB2SVerificationOperation presentFailureAlertWithTitle:message:completion:]( self,  "presentFailureAlertWithTitle:message:completion:",  v31,  v32,  v49);

          uint64_t v9 = v39;
        }

LABEL_29:
        goto LABEL_30;
      }
    }

    else
    {
      id v12 = sub_1000847E8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100284228((uint64_t)self);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10012E1D4;
      block[3] = &unk_1003D0110;
      id v52 = v4;
      dispatch_async(&_dispatch_main_q, block);
    }

    id v25 = [[ISDialog alloc] initWithTitle:v10 message:v11];
    goto LABEL_21;
  }

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_10012E1B4;
  v53[3] = &unk_1003D0110;
  id v54 = v4;
  dispatch_async(&_dispatch_main_q, v53);
  v8 = v54;
LABEL_30:
}

- (BOOL)_sendCodeToSelectedDevice
{
  dispatch_semaphore_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation selectedDevice](self, "selectedDevice"));
  if (v3)
  {
    id v8 = 0LL;
    BOOL v4 = -[PB2SVerificationOperation _sendCodeToDevice:error:showDialogs:]( self,  "_sendCodeToDevice:error:showDialogs:",  v3,  &v8,  1LL);
    id v5 = v8;
    if (v5)
    {
      id v6 = v5;
      -[PB2SVerificationOperation setError:](self, "setError:", v5);
    }
  }

  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_sendCodeToDevice:(id)a3 error:(id *)a4 showDialogs:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  -[PB2SVerificationOperation setSendCodeLocalization:](self, "setSendCodeLocalization:", 0LL);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"deviceId"]);

  id v38 = 0LL;
  id v10 = -[PB2SVerificationOperation _copySendCodeResponseForDevice:error:]( self,  "_copySendCodeResponseForDevice:error:",  v9,  &v38);
  id v11 = v38;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kISFailureTypeKey]);
    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kISDialogKey]);
      if (v14)
      {
        id v15 = [[ISDialog alloc] initWithDialogDictionary:v14];
        id v16 = v15;
        unsigned __int8 v17 = 0;
        if (v5 && v15)
        {
          v35 = v13;
          id v18 = sub_1000847E8();
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = 138412290;
            v40 = v20;
            id v21 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%@: Dialog returned while sending code",  buf,  0xCu);
          }

          dispatch_semaphore_t v22 = dispatch_semaphore_create(0LL);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v16 title]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 message]);
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_10012E708;
          v36[3] = &unk_1003CFF08;
          dispatch_semaphore_t v37 = v22;
          id v25 = v22;
          -[PB2SVerificationOperation presentFailureAlertWithTitle:message:completion:]( self,  "presentFailureAlertWithTitle:message:completion:",  v23,  v24,  v36);

          dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
          unsigned __int8 v17 = 0;
          id v13 = v35;
        }
      }

      else
      {
        id v16 = 0LL;
        unsigned __int8 v17 = 0;
      }
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"success"]);
      uint64_t v27 = objc_opt_respondsToSelector(v14, "BOOLValue");
      id v28 = sub_1000847E8();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      id v30 = v29;
      if ((v27 & 1) != 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412546;
          v40 = v31;
          __int16 v41 = 2112;
          id v42 = v14;
          id v32 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@: 2SV send code status %@", buf, 0x16u);
        }

        unsigned __int8 v17 = [v14 BOOLValue];
        id v13 = 0LL;
      }

      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_100284298((uint64_t)self);
        }

        id v13 = 0LL;
        if (!v11)
        {
          uint64_t v33 = ISErrorWithDomain(ISErrorDomain, 0LL, 0LL, 0LL);
          id v11 = (id)objc_claimAutoreleasedReturnValue(v33);
        }

        unsigned __int8 v17 = 0;
      }

      id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"localization"]);
      -[PB2SVerificationOperation setSendCodeLocalization:](self, "setSendCodeLocalization:", v16);
    }

    if (a4) {
LABEL_25:
    }
      *a4 = v11;
  }

  else
  {
    if (!v11)
    {
      uint64_t v26 = ISErrorWithDomain(ISErrorDomain, 3LL, 0LL, 0LL);
      id v11 = (id)objc_claimAutoreleasedReturnValue(v26);
    }

    unsigned __int8 v17 = 0;
    if (a4) {
      goto LABEL_25;
    }
  }

  return v17;
}

- (BOOL)_verify2SVCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation selectedDevice](self, "selectedDevice"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"deviceId"]);

  id v41 = 0LL;
  id v9 = -[PB2SVerificationOperation _copyVerifyResponseWithCode:fromDevice:error:]( self,  "_copyVerifyResponseWithCode:fromDevice:error:",  v6,  v8,  &v41);

  id v10 = v41;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    -[PB2SVerificationOperation setError:](self, "setError:", v10);
    unsigned __int8 v27 = 0;
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kISFailureTypeKey]);
  if (v12)
  {
    id v13 = sub_1000847E8();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100284378((uint64_t)self);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"customerMessage"]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kISDialogKey]);
    if (!v16 && v15)
    {
      __int128 v46 = @"explanation";
      v47 = v15;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    }

    if (v16)
    {
      id v17 = [[ISDialog alloc] initWithDialogDictionary:v16];
      if (v17)
      {
        id v18 = v17;
        dispatch_semaphore_t v37 = v15;
        id v38 = v12;
        id v19 = sub_1000847E8();
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = (void *)objc_opt_class(self);
          *(_DWORD *)buf = 138412290;
          __int128 v43 = v21;
          id v22 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%@: User entered wrong 2SV code",  buf,  0xCu);
        }

        dispatch_semaphore_t v23 = dispatch_semaphore_create(0LL);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v18 title]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 message]);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_10012EB2C;
        v39[3] = &unk_1003CFF08;
        dispatch_semaphore_t v40 = v23;
        uint64_t v26 = v23;
        -[PB2SVerificationOperation presentFailureAlertWithTitle:message:completion:]( self,  "presentFailureAlertWithTitle:message:completion:",  v24,  v25,  v39);

        dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
        id v15 = v37;
        uint64_t v12 = v38;
      }
    }

    unsigned __int8 v27 = 0;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"success"]);
    char v28 = objc_opt_respondsToSelector(v15, "BOOLValue");
    id v29 = sub_1000847E8();
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    v31 = v30;
    if ((v28 & 1) != 0)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v32 = (void *)objc_opt_class(self);
        *(_DWORD *)buf = 138412546;
        __int128 v43 = v32;
        __int16 v44 = 2112;
        __int128 v45 = v15;
        id v33 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@: 2SV verify code status %@", buf, 0x16u);
      }

      unsigned __int8 v27 = [v15 BOOLValue];
    }

    else
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_100284308((uint64_t)self);
      }

      uint64_t v34 = ISErrorWithDomain(ISErrorDomain, 0LL, 0LL, 0LL);
      uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);

      unsigned __int8 v27 = 0;
      id v10 = (id)v35;
    }
  }

  if (a4) {
LABEL_24:
  }
    *a4 = v10;
LABEL_25:

  return v27;
}

- (id)_copyDevicesResponseWithError:(id *)a3
{
  BOOL v5 = objc_opt_new(&OBJC_CLASS___ISStoreURLOperation);
  id v6 = (void *)objc_opt_new(&OBJC_CLASS___ISProtocolDataProvider);
  [v6 setShouldProcessProtocol:0];
  -[ISStoreURLOperation setDataProvider:](v5, "setDataProvider:", v6);
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___SSMutableURLRequestProperties);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation URLs](self, "URLs"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"deviceListUrl"]);
  -[SSMutableURLRequestProperties pb_configureRequestWithURL:](v7, "pb_configureRequestWithURL:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 guid]);
  -[SSMutableURLRequestProperties pb_setGUIDRequestParameterValue:](v7, "pb_setGUIDRequestParameterValue:", v11);

  -[ISStoreURLOperation setNeedsAuthentication:](v5, "setNeedsAuthentication:", 1LL);
  -[ISStoreURLOperation setRequestProperties:](v5, "setRequestProperties:", v7);
  id v12 = sub_1000847E8();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1002843E8(v13);
  }

  id v18 = 0LL;
  unsigned int v14 = -[PB2SVerificationOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v5,  &v18);
  id v15 = v18;
  id v16 = 0LL;
  if (v14) {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 output]);
  }
  if (a3) {
    *a3 = v15;
  }

  return v16;
}

- (id)_copySendCodeResponseForDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___ISStoreURLOperation);
  id v8 = (void *)objc_opt_new(&OBJC_CLASS___ISProtocolDataProvider);
  [v8 setShouldProcessProtocol:0];
  -[ISStoreURLOperation setDataProvider:](v7, "setDataProvider:", v8);
  v23[0] = @"guid";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 guid]);
  v23[1] = @"hsaDeviceId";
  v24[0] = v10;
  v24[1] = v6;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v11,  100LL,  0LL,  0LL));
  id v13 = objc_opt_new(&OBJC_CLASS___SSMutableURLRequestProperties);
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation URLs](self, "URLs"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"sendCodeUrl"]);
  -[SSMutableURLRequestProperties pb_configurePostRequestWithURL:data:]( v13,  "pb_configurePostRequestWithURL:data:",  v15,  v12);

  -[ISStoreURLOperation setNeedsAuthentication:](v7, "setNeedsAuthentication:", 1LL);
  -[ISStoreURLOperation setRequestProperties:](v7, "setRequestProperties:", v13);
  id v16 = sub_1000847E8();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100284428((uint64_t)v6, v17);
  }

  id v22 = 0LL;
  unsigned int v18 = -[PB2SVerificationOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v7,  &v22);
  id v19 = v22;
  uint64_t v20 = 0LL;
  if (v18) {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 output]);
  }
  if (a4) {
    *a4 = v19;
  }

  return v20;
}

- (id)_copyVerifyResponseWithCode:(id)a3 fromDevice:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = v8;
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___ISStoreURLOperation);
  id v12 = (void *)objc_opt_new(&OBJC_CLASS___ISProtocolDataProvider);
  [v12 setShouldProcessProtocol:0];
  uint64_t v35 = v12;
  -[ISStoreURLOperation setDataProvider:](v11, "setDataProvider:", v12);
  v38[0] = @"guid";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 guid]);
  v39[0] = v14;
  v39[1] = v10;
  v38[1] = @"hsaDeviceId";
  v38[2] = @"hsaCode";
  v39[2] = v9;
  uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  3LL));

  id v33 = (void *)v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v15,  100LL,  0LL,  0LL));
  id v17 = objc_opt_new(&OBJC_CLASS___SSMutableURLRequestProperties);
  unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation URLs](self, "URLs"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:@"verifyCodeUrl"]);
  -[SSMutableURLRequestProperties pb_configurePostRequestWithURL:data:]( v17,  "pb_configurePostRequestWithURL:data:",  v19,  v16);

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[ISDevice sharedInstance](&OBJC_CLASS___ISDevice, "sharedInstance"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 guid]);
  -[SSMutableURLRequestProperties pb_setGUIDRequestParameterValue:](v17, "pb_setGUIDRequestParameterValue:", v21);

  -[ISStoreURLOperation setNeedsAuthentication:](v11, "setNeedsAuthentication:", 1LL);
  -[ISStoreURLOperation setRequestProperties:](v11, "setRequestProperties:", v17);
  -[ISStoreURLOperation pb_configureMachineDataStyleToNone](v11, "pb_configureMachineDataStyleToNone");
  id v22 = sub_1000847E8();
  dispatch_semaphore_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10028449C((uint64_t)v9, (uint64_t)v10, v23);
  }

  id v37 = 0LL;
  unsigned int v24 = -[PB2SVerificationOperation runSubOperation:returningError:]( self,  "runSubOperation:returningError:",  v11,  &v37);
  id v25 = v37;
  if (v24)
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ISStoreURLOperation response](v11, "response"));
    id v27 = v10;
    char v28 = v9;
    id v29 = -[PBMachineDataOperation initWithURLResponse:]( objc_alloc(&OBJC_CLASS___PBMachineDataOperation),  "initWithURLResponse:",  v26);
    id v36 = v25;
    -[PB2SVerificationOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v29, &v36);
    id v30 = v36;

    v31 = (void *)objc_claimAutoreleasedReturnValue([v35 output]);
    id v9 = v28;
    id v10 = v27;

    id v25 = v30;
  }

  else
  {
    v31 = 0LL;
  }

  if (a5) {
    *a5 = v25;
  }

  return v31;
}

- (void)presentDevicesAlertWithTitle:(id)a3 message:(id)a4 deviceList:(id)a5 completion:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012F2FC;
  v13[3] = &unk_1003D32D8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v9 = v17;
  id v10 = v16;
  id v11 = v15;
  id v12 = v14;
  dispatch_async(&_dispatch_main_q, v13);
}

- (void)presentCodeEntryAlertWithTitle:(id)a3 message:(id)a4 newCodeLabel:(id)a5 submitLabel:(id)a6 newCodeRequestHandler:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  -[PB2SVerificationOperation setCodeHandler:](self, "setCodeHandler:", a8);
  -[PB2SVerificationOperation setSendNewCode:](self, "setSendNewCode:", v18);

  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  void v23[2] = sub_10012F80C;
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
  block[2] = sub_10012F9CC;
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
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation sendNewCode](self, "sendNewCode"));

    if (v8)
    {
      id v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation sendNewCode](self, "sendNewCode"));
      v9[2]();
LABEL_8:
    }
  }

  else if (self->_submitIndex == a4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 enteredValues]);
    id v9 = (void (**)(void))objc_claimAutoreleasedReturnValue([v10 firstObject]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation codeHandler](self, "codeHandler"));
    if (v11)
    {
      id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation codeHandler](self, "codeHandler"));
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
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation codeHandler](self, "codeHandler"));

  if (v5)
  {
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[PB2SVerificationOperation codeHandler](self, "codeHandler"));
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

- (id)sendNewCode
{
  return self->_sendNewCode;
}

- (void)setSendNewCode:(id)a3
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

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSDictionary)URLs
{
  return self->_URLs;
}

- (void)setURLs:(id)a3
{
}

- (NSDictionary)selectedDevice
{
  return self->_selectedDevice;
}

- (void)setSelectedDevice:(id)a3
{
}

- (NSDictionary)sendCodeLocalization
{
  return self->_sendCodeLocalization;
}

- (void)setSendCodeLocalization:(id)a3
{
}

- (void).cxx_destruct
{
}

@end