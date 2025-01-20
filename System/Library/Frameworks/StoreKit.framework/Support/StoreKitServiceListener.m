@interface StoreKitServiceListener
+ (void)start;
- (StoreKitServiceListener)init;
- (void)_invalidateUnfinishedTransactionsForBundleID:(id)a3 logKey:(id)a4;
- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5;
- (void)pushService:(id)a3 didReceiveMessage:(id)a4;
@end

@implementation StoreKitServiceListener

+ (void)start
{
  if (qword_10032E8A8 != -1) {
    dispatch_once(&qword_10032E8A8, &stru_1002E92D0);
  }
}

- (StoreKitServiceListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___StoreKitServiceListener;
  v2 = -[StoreKitServiceListener init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___SSEventMonitor);
    eventMonitor = v2->_eventMonitor;
    v2->_eventMonitor = v3;

    -[SSEventMonitor setDelegate:](v2->_eventMonitor, "setDelegate:", v2);
  }

  return v2;
}

- (void)eventMonitor:(id)a3 receivedEventWithName:(id)a4 userInfo:(id)a5
{
  id v7 = a5;
  if ([a4 isEqualToString:SSEventNamePurchaseSucceeded])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lib_logUUID"));

    if (qword_10032E8B8 != -1) {
      dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
    }
    v10 = (os_log_s *)qword_100328688;
    if (os_log_type_enabled((os_log_t)qword_100328688, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v84 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Received purchase success event",  buf,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tcr_dataForKey:", @"response"));
    if (!v11)
    {
      if (qword_10032E8B8 != -1) {
        dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
      }
      v17 = (os_log_s *)qword_100328688;
      if (os_log_type_enabled((os_log_t)qword_100328688, OS_LOG_TYPE_ERROR)) {
        sub_100261C50((uint64_t)v9, v17, v18, v19, v20, v21, v22, v23);
      }
      goto LABEL_18;
    }

    v78 = v9;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___SSPurchaseResponse);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v12,  objc_opt_class(&OBJC_CLASS___NSDictionary),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v82 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v11,  &v82));
    id v16 = v82;

    if (v16)
    {
      if (qword_10032E8B8 != -1) {
        dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
      }
      if (os_log_type_enabled((os_log_t)qword_100328688, OS_LOG_TYPE_ERROR)) {
        sub_100261F04();
      }
    }

    else
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___SSPurchaseResponse);
      if ((objc_opt_isKindOfClass(v15, v24) & 1) == 0)
      {
        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v15, v31) & 1) != 0)
        {
          if (qword_10032E8B8 != -1) {
            dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
          }
          v32 = (os_log_s *)qword_100328688;
          if (os_log_type_enabled((os_log_t)qword_100328688, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543619;
            v84 = v9;
            __int16 v85 = 2113;
            v86 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Ignoring purchase success event because the response is a dictionary. Likely from a gift card redemption. Response: %{private}@",  buf,  0x16u);
          }
        }

        else
        {
          if (qword_10032E8B8 != -1) {
            dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
          }
          v33 = (void *)qword_100328688;
          if (os_log_type_enabled((os_log_t)qword_100328688, OS_LOG_TYPE_ERROR)) {
            sub_100261E70((uint64_t)v9, v33, (uint64_t)v15);
          }
        }

        goto LABEL_13;
      }

      id v16 = (id)objc_claimAutoreleasedReturnValue([v15 purchase]);
      if (v16)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v15 URLResponse]);
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bodyData]);

        if ([v26 length])
        {
          id v81 = 0LL;
          v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v26,  0LL,  0LL,  &v81));
          v28 = (os_log_s *)v81;
          if (v28)
          {
            v29 = sub_10005463C(4u);
            v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              sub_100261E08();
            }
          }

          else
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tcr_stringForKey:", @"jingleAction"));
            unsigned __int8 v42 = [v77 isEqualToString:@"inAppBuy"];
            v43 = sub_10005463C(4u);
            v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
            BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
            if ((v42 & 1) != 0)
            {
              v73 = v27;
              if (v45)
              {
                *(_DWORD *)buf = 138543362;
                v84 = v9;
                _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Purchase response is for an in app buy",  buf,  0xCu);
              }

              v46 = (void *)objc_claimAutoreleasedReturnValue([v16 buyParameters]);
              v47 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBuyParams buyParamsWithString:]( &OBJC_CLASS___AMSBuyParams,  "buyParamsWithString:",  v46));

              v48 = (void *)objc_claimAutoreleasedReturnValue([v47 dictionary]);
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "tcr_numberForKey:", @"appAdamId"));

              v71 = (os_log_s *)v47;
              v76 = (void *)objc_claimAutoreleasedReturnValue([v47 parameterForKey:@"bid"]);
              v72 = v49;
              if (v49
                && (id v74 = objc_msgSend( [LSApplicationRecord alloc],  "initWithStoreItemIdentifier:error:",  objc_msgSend(v49, "longLongValue"),  0)) != 0 || objc_msgSend(v76, "length")
                && (id v74 = [[LSApplicationRecord alloc] initWithBundleIdentifier:v76 allowPlaceholder:0 error:0]) != 0)
              {
                v50 = sub_10005463C(4u);
                v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                v9 = v78;
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  v52 = (void *)objc_claimAutoreleasedReturnValue([v74 bundleIdentifier]);
                  *(_DWORD *)buf = 138543618;
                  v84 = v78;
                  __int16 v85 = 2114;
                  v86 = v52;
                  _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Writing receipt to app %{public}@",  buf,  0x16u);
                }

                v53 = sub_10002653C(v73, v78);
                uint64_t v54 = objc_claimAutoreleasedReturnValue(v53);
                if (v54)
                {
                  v55 = (void *)objc_claimAutoreleasedReturnValue([v74 URL]);
                  +[WriteReceipt writeReceiptData:forBundleURL:logKey:error:]( &OBJC_CLASS___WriteReceipt,  "writeReceiptData:forBundleURL:logKey:error:",  v54,  v55,  v78,  0LL);
                }

                v69 = (void *)v54;
                -[StoreKitServiceListener _invalidateUnfinishedTransactionsForBundleID:logKey:]( self,  "_invalidateUnfinishedTransactionsForBundleID:logKey:",  v76,  v78);
                v56 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
                v57 = (void *)objc_claimAutoreleasedReturnValue([v74 URL]);
                v58 = -[Client initWithURL:overridesDictionary:](v56, "initWithURL:overridesDictionary:", v57, 0LL);

                v68 = v58;
                if (v58)
                {
                  v59 = (void *)objc_claimAutoreleasedReturnValue( +[ReceiptManager managerForClient:]( &OBJC_CLASS___ReceiptManager,  "managerForClient:",  v58));
                  v60 = (void *)objc_claimAutoreleasedReturnValue([v59 lastUpdated]);

                  v61 = sub_10005463C(4u);
                  v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
                  BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
                  v70 = (os_log_s *)v59;
                  if (v60)
                  {
                    v27 = v73;
                    v30 = (os_log_s *)v77;
                    if (v63)
                    {
                      *(_DWORD *)buf = 138543618;
                      v84 = v78;
                      __int16 v85 = 2114;
                      v86 = v76;
                      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Syncing transactions for app using StoreKit 2 %{public}@",  buf,  0x16u);
                    }

                    v79[0] = _NSConcreteStackBlock;
                    v79[1] = 3221225472LL;
                    v79[2] = sub_100055090;
                    v79[3] = &unk_1002E7E20;
                    v80 = v78;
                    [v59 syncReceiptsWithReason:1 completionHandler:v79];
                    v62 = v80;
                  }

                  else
                  {
                    v27 = v73;
                    v30 = (os_log_s *)v77;
                    if (v63)
                    {
                      *(_DWORD *)buf = 138543618;
                      v84 = v78;
                      __int16 v85 = 2114;
                      v86 = v76;
                      _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Skipping transaction sync for app not using StoreKit 2 %{public}@",  buf,  0x16u);
                    }
                  }

                  v44 = v71;
                  v65 = (os_log_s *)v74;
                }

                else
                {
                  v65 = (os_log_s *)v74;
                  v66 = sub_10005463C(4u);
                  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                    sub_100261DA0();
                  }
                  v27 = v73;
                  v30 = (os_log_s *)v77;
                  v44 = v71;
                }
              }

              else
              {
                v64 = sub_10005463C(4u);
                v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                v27 = v73;
                v9 = v78;
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  v67 = self;
                  v65 = v75;
                  sub_100261D18((uint64_t)v78, (uint64_t)v67, v75);
                  v30 = (os_log_s *)v77;
                  v44 = v71;
                }

                else
                {
                  v30 = (os_log_s *)v77;
                  v44 = v71;
                  v65 = v75;
                }
              }
            }

            else
            {
              if (v45)
              {
                *(_DWORD *)buf = 138543362;
                v84 = v9;
                _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Purchase response is not for an in app buy",  buf,  0xCu);
              }

              v30 = (os_log_s *)v77;
            }

            v28 = 0LL;
          }
        }

        else
        {
          v41 = sub_10005463C(4u);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v84 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Purchase response has no data",  buf,  0xCu);
          }
        }
      }

      else
      {
        if (qword_10032E8B8 != -1) {
          dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
        }
        v34 = (os_log_s *)qword_100328688;
        if (os_log_type_enabled((os_log_t)qword_100328688, OS_LOG_TYPE_ERROR)) {
          sub_100261CB4((uint64_t)v9, v34, v35, v36, v37, v38, v39, v40);
        }
      }
    }

LABEL_13:
LABEL_18:
  }
}

- (void)pushService:(id)a3 didReceiveMessage:(id)a4
{
  id v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lib_logUUID"));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForUserInfoKey:@"2"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = v7;
  }

  else
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
    {
LABEL_43:
      v32 = 0LL;
      goto LABEL_44;
    }

    v53 = v7;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
  }

  v11 = v9;
  if (!v9) {
    goto LABEL_43;
  }
  v33 = v7;
  if (qword_10032E8B8 != -1) {
    dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
  }
  uint64_t v12 = (void *)qword_100328690;
  if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    *(_DWORD *)buf = 138543874;
    v48 = v6;
    __int16 v49 = 2048;
    id v50 = [v4 actionType];
    __int16 v51 = 2114;
    id v52 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Received push action %ld for %{public}@",  buf,  0x20u);
  }

  uint64_t v35 = v4;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v43;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v17);
        id v41 = 0LL;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v18,  0LL,  &v41));
        id v20 = v41;
        if (v19)
        {
          uint64_t v21 = objc_alloc(&OBJC_CLASS____TtC9storekitd6Client);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 URL]);
          uint64_t v23 = -[Client initWithURL:overridesDictionary:](v21, "initWithURL:overridesDictionary:", v22, 0LL);

          if (v23)
          {
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[ReceiptManager managerForClient:](&OBJC_CLASS___ReceiptManager, "managerForClient:", v23));
            if ([v35 actionType] == (id)37)
            {
              if (qword_10032E8B8 != -1) {
                dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
              }
              v25 = (os_log_s *)qword_100328690;
              if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v48 = v6;
                __int16 v49 = 2114;
                id v50 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Updating subscription status for %{public}@",  buf,  0x16u);
              }

              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472LL;
              v39[2] = sub_10005578C;
              v39[3] = &unk_1002E79F8;
              v40[0] = v6;
              v40[1] = v18;
              [v24 syncSubscriptionStatusWithReason:2 completionHandler:v39];
              v26 = (id *)v40;
              goto LABEL_37;
            }

            if ([v35 actionType] == (id)36)
            {
              if (qword_10032E8B8 != -1) {
                dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
              }
              uint64_t v31 = (os_log_s *)qword_100328690;
              if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v48 = v6;
                __int16 v49 = 2114;
                id v50 = v18;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Updating transaction history for %{public}@",  buf,  0x16u);
              }

              v37[0] = _NSConcreteStackBlock;
              v37[1] = 3221225472LL;
              v37[2] = sub_100055814;
              v37[3] = &unk_1002E79F8;
              v38[0] = v6;
              v38[1] = v18;
              [v24 syncReceiptsWithReason:2 completionHandler:v37];
              v26 = (id *)v38;
LABEL_37:
              -[StoreKitServiceListener _invalidateUnfinishedTransactionsForBundleID:logKey:]( self,  "_invalidateUnfinishedTransactionsForBundleID:logKey:",  v18,  v6);
            }
          }

          else
          {
            if (qword_10032E8B8 != -1) {
              dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
            }
            v28 = (void *)qword_100328690;
            if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_ERROR))
            {
              v29 = v28;
              v30 = (void *)objc_claimAutoreleasedReturnValue([v19 URL]);
              *(_DWORD *)buf = 138543618;
              v48 = v6;
              __int16 v49 = 2114;
              id v50 = v30;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[%{public}@] Could not initialize client with URL %{public}@",  buf,  0x16u);
            }
          }

          goto LABEL_40;
        }

        if (qword_10032E8B8 != -1) {
          dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
        }
        v27 = (os_log_s *)qword_100328690;
        if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v48 = v6;
          __int16 v49 = 2114;
          id v50 = v18;
          __int16 v51 = 2114;
          id v52 = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%{public}@] Could not find bundle record for %{public}@ - %{public}@",  buf,  0x20u);
        }

- (void)_invalidateUnfinishedTransactionsForBundleID:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10032E8B8 != -1) {
    dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
  }
  uint64_t v8 = (void *)qword_100328690;
  if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)uint64_t v18 = 138543874;
    *(void *)&v18[4] = objc_opt_class(self);
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = v7;
    *(_WORD *)&v18[22] = 2114;
    id v19 = v6;
    id v10 = *(id *)&v18[4];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Marking cache stale in response to push for client: %{public}@",  v18,  0x20u);
  }

  if (!+[LoadUnfinishedInAppTransactionsTask invalidateCacheForBundleID:withLogKey:]( &OBJC_CLASS___LoadUnfinishedInAppTransactionsTask,  "invalidateCacheForBundleID:withLogKey:",  v6,  v7,  *(_OWORD *)v18,  *(void *)&v18[16],  v19))
  {
    if (qword_10032E8B8 != -1) {
      dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
    }
    v11 = (void *)qword_100328690;
    if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_ERROR)) {
      sub_100262124(v11, (uint64_t)self, (uint64_t)v7);
    }
  }

  if (qword_10032E8B8 != -1) {
    dispatch_once(&qword_10032E8B8, &stru_1002E92F0);
  }
  uint64_t v12 = (void *)qword_100328690;
  if (os_log_type_enabled((os_log_t)qword_100328690, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    id v14 = (void *)objc_opt_class(self);
    *(_DWORD *)uint64_t v18 = 138543618;
    *(void *)&v18[4] = v14;
    *(_WORD *)&v18[12] = 2114;
    *(void *)&v18[14] = v7;
    id v15 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Sending unfinished transactions notification in response to push",  v18,  0x16u);
  }

  uint64_t v16 = sub_100033540((uint64_t)v6);
  id v17 = objc_claimAutoreleasedReturnValue(v16);
  notify_post((const char *)[v17 UTF8String]);
}

- (void).cxx_destruct
{
}

@end