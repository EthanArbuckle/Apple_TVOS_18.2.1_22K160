@interface PHInCallUIUtilities
+ (BOOL)hasMultipleSenderIdentities;
+ (BOOL)isExplicitTransferSupportedForSubscriptionLabelIdentifier:(id)a3;
+ (BOOL)isSpringBoardPasscodeLocked;
+ (BOOL)layoutIsLocked:(id)a3;
+ (BOOL)shouldRequestPasscodeUnlockForMMICode:(id)a3;
+ (id)fbsOrientationObserver;
+ (id)handleNavigationControllerIfNecessary:(id)a3;
+ (id)sharedInstance;
+ (id)telephonyClient;
+ (int64_t)deviceOrientationForBSInterfaceOrientation:(int64_t)a3;
+ (int64_t)frontboardOrientation;
+ (int64_t)interfaceOrientationForDeviceOrientation:(int64_t)a3;
- (BOOL)isSpringBoardLocked;
- (PHInCallUIUtilities)init;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)setSpringBoardLocked:(BOOL)a3;
@end

@implementation PHInCallUIUtilities

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009F1C;
  block[3] = &unk_1000F6B58;
  block[4] = a1;
  if (qword_100116940 != -1) {
    dispatch_once(&qword_100116940, block);
  }
  return (id)qword_100116938;
}

- (PHInCallUIUtilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PHInCallUIUtilities;
  v2 = -[PHInCallUIUtilities init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBSDisplayLayoutMonitor sharedMonitorForDisplayType:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "sharedMonitorForDisplayType:",  0LL));
    v4 = (void *)objc_opt_class(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLayout]);
    if ([v4 layoutIsLocked:v5])
    {
      BOOL v6 = 1;
    }

    else
    {
      uint64_t v12 = 0LL;
      v13 = &v12;
      uint64_t v14 = 0x2020000000LL;
      v7 = (unsigned int (*)(void))off_100116978;
      v15 = off_100116978;
      if (!off_100116978)
      {
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472LL;
        v11[2] = sub_10000AD6C;
        v11[3] = &unk_1000F6AB0;
        v11[4] = &v12;
        sub_10000AD6C((uint64_t)v11);
        v7 = (unsigned int (*)(void))v13[3];
      }

      _Block_object_dispose(&v12, 8);
      if (!v7)
      {
        v9 = (_Unwind_Exception *)sub_1000BB424();
        _Block_object_dispose(&v12, 8);
        _Unwind_Resume(v9);
      }

      BOOL v6 = v7(0LL) != 0;
    }

    v2->_springBoardLocked = v6;

    [v3 addObserver:v2];
  }

  return v2;
}

+ (id)telephonyClient
{
  if (qword_100116950 != -1) {
    dispatch_once(&qword_100116950, &stru_1000F6B78);
  }
  return (id)qword_100116948;
}

+ (int64_t)interfaceOrientationForDeviceOrientation:(int64_t)a3
{
  else {
    return a3;
  }
}

+ (int64_t)deviceOrientationForBSInterfaceOrientation:(int64_t)a3
{
  else {
    return qword_1000C3A00[a3 - 2];
  }
}

+ (id)handleNavigationControllerIfNecessary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v3 topViewController]);
  }
  else {
    id v5 = v3;
  }
  BOOL v6 = v5;

  return v6;
}

+ (BOOL)shouldRequestPasscodeUnlockForMMICode:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"*#06#"])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 telephonyClient]);
    id v38 = 0LL;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getSubscriptionInfoWithError:&v38]);
    id v7 = v38;

    if (v7)
    {
      id v8 = sub_100011210();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1000BB504();
      }
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 subscriptions]);
      id v12 = [v11 count];

      if (v12)
      {
        v32 = (os_log_s *)[[CTBundle alloc] initWithBundleType:2];
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        v13 = (void *)objc_claimAutoreleasedReturnValue([v6 subscriptions]);
        id v14 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          v30 = v6;
          id v31 = v4;
          id v7 = 0LL;
          uint64_t v16 = *(void *)v35;
          while (2)
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
              if ((objc_msgSend(v18, "isSimHidden", v30, v31) & 1) == 0)
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue([a1 telephonyClient]);
                id v33 = v7;
                id v20 = [v19 copyCarrierBundleValueWithDefault:v18 key:@"ShowIMEIsInLockScreen" bundleType:v32 error:&v33];
                id v21 = v33;

                if (v21)
                {
                  id v22 = sub_100011210();
                  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)v40 = v21;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Received error: %@ while querying -copyCarrierBundleValueWithDefault",  buf,  0xCu);
                  }
                }

                else
                {
                  if ((objc_opt_respondsToSelector(v20, "BOOLValue") & 1) != 0) {
                    unsigned int v24 = [v20 BOOLValue];
                  }
                  else {
                    unsigned int v24 = 0;
                  }
                  id v25 = sub_100011210();
                  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue([v18 uuid]);
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v40 = v24;
                    *(_WORD *)&v40[4] = 2112;
                    *(void *)&v40[6] = v20;
                    __int16 v41 = 2112;
                    v42 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Received regionWantsPasscodeBypassForIMEI: %d from carrierBundleValue: %@ subscription: %@",  buf,  0x1Cu);
                  }

                  if ((v24 & 1) != 0)
                  {

                    BOOL v9 = 0;
                    id v7 = 0LL;
                    goto LABEL_34;
                  }
                }

                id v7 = v21;
              }
            }

            id v15 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
            if (v15) {
              continue;
            }
            break;
          }

          BOOL v9 = 1;
LABEL_34:
          BOOL v6 = v30;
          id v4 = v31;
        }

        else
        {
          id v7 = 0LL;
          BOOL v9 = 1;
        }

        goto LABEL_37;
      }

      id v28 = sub_100011210();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1000BB4A4();
      }
      id v7 = 0LL;
    }

    BOOL v9 = 1;
LABEL_37:

    goto LABEL_38;
  }

  id v10 = sub_100011210();
  id v7 = (id)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Code is not for IMEI, should request passcode unlock",  buf,  2u);
  }

  BOOL v9 = 1;
LABEL_38:

  return v9;
}

+ (BOOL)isSpringBoardPasscodeLocked
{
  return 0;
}

+ (BOOL)layoutIsLocked:(id)a3
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "elements", 0));
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = FBSDisplayLayoutElementLockScreenIdentifier;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) identifier]);
        unsigned __int8 v10 = [v9 isEqualToString:v7];

        if ((v10 & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

+ (BOOL)hasMultipleSenderIdentities
{
  if (qword_100116958 != -1) {
    dispatch_once(&qword_100116958, &stru_1000F6B98);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100116960 prioritizedSenderIdentities]);
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

+ (id)fbsOrientationObserver
{
  if (qword_100116970 != -1) {
    dispatch_once(&qword_100116970, &stru_1000F6BB8);
  }
  return (id)qword_100116968;
}

+ (BOOL)isExplicitTransferSupportedForSubscriptionLabelIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 telephonyClient]);
  id v44 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getSubscriptionInfoWithError:&v44]);
  id v7 = v44;

  if (v7)
  {
    id v8 = sub_100011210();
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_1000BB5C4();
    }
    goto LABEL_30;
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 subscriptions]);
  id v10 = [v9 count];

  id v11 = sub_100011210();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  __int128 v13 = v12;
  if (!v10)
  {
    id v38 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000BB564();
    }
    goto LABEL_29;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 subscriptions]);
    *(_DWORD *)buf = 138412290;
    id v46 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "ShowExplicitCallTransferButton: all the subscriptions are: %@",  buf,  0xCu);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 subscriptions]);
  id v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v40,  v51,  16LL);
  id v38 = v15;
  if (!v16)
  {
LABEL_29:
    id v7 = 0LL;
LABEL_30:
    BOOL v34 = 0;
    goto LABEL_31;
  }

  id v17 = v16;
  id v37 = a1;
  v18 = 0LL;
  uint64_t v19 = *(void *)v41;
  id v36 = v4;
  while (2)
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v41 != v19) {
        objc_enumerationMutation(v15);
      }
      id v21 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
      id v22 = sub_100011210();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "ShowExplicitCallTransferButton: checking subscription: %@",  buf,  0xCu);
      }

      if (([v21 isSimHidden] & 1) == 0)
      {
        unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue([v21 labelID]);
        unsigned int v25 = [v24 isEqualToString:v4];

        if (v25)
        {
          id v26 = [[CTBundle alloc] initWithBundleType:1];
          v27 = (void *)objc_claimAutoreleasedReturnValue([v37 telephonyClient]);
          id v39 = v18;
          id v28 = [v27 copyCarrierBundleValue:v21 keyHierarchy:&off_1000FD570 bundleType:v26 error:&v39];
          id v7 = v39;

          uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0
            || (uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v28, v30) & 1) != 0))
          {
            unsigned __int8 v31 = [v28 BOOLValue];
          }

          else
          {
            unsigned __int8 v31 = 0;
          }

          id v32 = sub_100011210();
          id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v46 = v28;
            __int16 v47 = 2112;
            v48 = v21;
            __int16 v49 = 2112;
            id v50 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "ShowExplicitCallTransferButton: retrieved ShowExplicitCallTransferButton value %@ for subscription %@ with error %@",  buf,  0x20u);
          }

          if ((v31 & 1) != 0)
          {
            BOOL v34 = 1;
            id v4 = v36;
            goto LABEL_31;
          }

          v18 = v7;
          id v4 = v36;
          __int128 v15 = v38;
        }
      }
    }

    id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v40,  v51,  16LL);
    if (v17) {
      continue;
    }
    break;
  }

  BOOL v34 = 0;
  id v7 = v18;
LABEL_31:

  return v34;
}

+ (int64_t)frontboardOrientation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 fbsOrientationObserver]);
  BOOL v3 = (char *)[v2 activeInterfaceOrientation];
  else {
    int64_t v4 = qword_1000C3A18[(void)(v3 - 1)];
  }

  return v4;
}

- (BOOL)isSpringBoardLocked
{
  return self->_springBoardLocked;
}

- (void)setSpringBoardLocked:(BOOL)a3
{
  self->_springBoardLocked = a3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  unsigned __int8 v7 = [(id)objc_opt_class(self) layoutIsLocked:v6];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000ACEC;
  v8[3] = &unk_1000F6A28;
  v8[4] = self;
  unsigned __int8 v9 = v7;
  dispatch_async(&_dispatch_main_q, v8);
}

@end