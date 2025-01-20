@interface RedownloadRecoveryTask
- (void)main;
@end

@implementation RedownloadRecoveryTask

- (void)main
{
  id v32 = 0LL;
  if (self)
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___ASDPurchaseHistoryQuery);
    [v3 setAccountID:*(void *)&self->super._success];
    clientID = self->_clientID;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &clientID, 1LL));
    [v3 setStoreIDs:v4];

    id v5 = sub_1001C66BC((uint64_t)&OBJC_CLASS___PurchaseHistoryManager);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = sub_1001C69E0((uint64_t)v6, v3, &v32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

    if (v9)
    {
      v10 = objc_alloc_init(&OBJC_CLASS___PurchaseInfo);
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_logKey));
      -[PurchaseInfo setRecoveryCount:](v10, "setRecoveryCount:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 redownloadParams]);
      BOOL v13 = v12 != 0LL;
      if (v12)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBuyParams buyParamsWithString:](&OBJC_CLASS___AMSBuyParams, "buyParamsWithString:", v12));
        -[PurchaseInfo setBuyParams:](v10, "setBuyParams:", v14);

        -[PurchaseInfo setBundleID:](v10, "setBundleID:", self->super._error);
        -[PurchaseInfo setExternalID:](v10, "setExternalID:", self->_bundleID);
        -[PurchaseInfo setItemID:](v10, "setItemID:", self->_clientID);
        -[PurchaseInfo setLogCode:](v10, "setLogCode:", self->_installID);
        -[PurchaseInfo setMetricsType:](v10, "setMetricsType:", &off_10040C388);
        v15 = -[AMSProcessInfo initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___AMSProcessInfo),  "initWithBundleIdentifier:",  self->_accountID);
        -[PurchaseInfo setClientInfo:](v10, "setClientInfo:", v15);

        -[PurchaseInfo setPurchaseType:](v10, "setPurchaseType:", 0LL);
        v16 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  self->super._error,  0LL,  0LL);
        if (v16) {
          uint64_t v17 = 2LL;
        }
        else {
          uint64_t v17 = 1LL;
        }
        -[PurchaseInfo setCoordinatorIntent:](v10, "setCoordinatorIntent:", v17);
        if (LOBYTE(self->_recoveryCount))
        {
          -[PurchaseInfo setPriority:](v10, "setPriority:", 0LL);
          -[PurchaseInfo setCoordinatorImportance:](v10, "setCoordinatorImportance:", 2LL);
        }

        else
        {
          -[PurchaseInfo setPriority:](v10, "setPriority:", -2LL);
          -[PurchaseInfo setCoordinatorImportance:](v10, "setCoordinatorImportance:", 1LL);
          -[PurchaseInfo setDiscretionary:](v10, "setDiscretionary:", 1LL);
          -[PurchaseInfo setSuppressDialogs:](v10, "setSuppressDialogs:", 1LL);
          -[PurchaseInfo setSuppressEvaluatorDialogs:](v10, "setSuppressEvaluatorDialogs:", 1LL);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo buyParams](v10, "buyParams"));
          [v19 setObject:@"1" forKeyedSubscript:AMSBuyParamPropertyIsBackground];
        }

        -[PurchaseInfo setExpectedSoftwarePlatform:](v10, "setExpectedSoftwarePlatform:", self->_logCode);
        -[PurchaseInfo updateGeneratedProperties](v10, "updateGeneratedProperties");
        uint64_t v20 = ASDLogHandleForCategory(2LL);
        v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo logKey](v10, "logKey"));
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%@] Initiating re-purchase for failed install",  buf,  0xCu);
        }

        id v23 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1001DE718;
        v34 = &unk_1003EBE48;
        v35 = v10;
        sub_100199B84((uint64_t)v24, v35, buf);
      }

      else
      {
        uint64_t v18 = ASDErrorWithUserInfoAndFormat(811LL, 0LL, @"Buy params not found for redownload");
        id v32 = (id)objc_claimAutoreleasedReturnValue(v18);
      }
    }

    else
    {
      BOOL v13 = 0;
    }

    v25 = v32;
  }

  else
  {
    v25 = 0LL;
    BOOL v13 = 0;
  }

  id v26 = v25;
  uint64_t v27 = ASDLogHandleForCategory(2LL);
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v13)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      itemID = self->_itemID;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = itemID;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%@] Started recovery re-purchase",  buf,  0xCu);
    }

    -[Task completeWithSuccess](self, "completeWithSuccess");
  }

  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = self->_itemID;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[%@] Cannot start recovery re-purchase: %{public}@",  buf,  0x16u);
    }

    -[Task completeWithError:](self, "completeWithError:", v26);
  }
}

- (void).cxx_destruct
{
}

@end