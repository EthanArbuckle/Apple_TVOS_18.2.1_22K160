@interface ExpiredUpdateRecoveryTask
- (void)main;
@end

@implementation ExpiredUpdateRecoveryTask

- (void)main
{
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  v38 = sub_1001D9ADC;
  v39 = sub_1001D9AEC;
  id v40 = 0LL;
  id v3 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1001D9AF4;
  v34[3] = &unk_1003EBC50;
  v34[4] = self;
  v34[5] = &v35;
  [v4 readUsingSession:v34];

  v5 = (void *)v36[5];
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 purchaseInfoForUpdateUserInitiated:LOBYTE(self->_installID)]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_externalID));
    [v6 setRefreshInstallID:v7];

    [v6 setBundleID:*(void *)&self->super._success];
    [v6 setExternalID:self->super._error];
    [v6 setItemID:self->_bundleID];
    [v6 setLogCode:self->_itemID];
    [v6 setMetricsType:&off_10040C358];
    [v6 updateGeneratedProperties];
    uint64_t v8 = ASDLogHandleForCategory(2LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 logKey]);
      *(_DWORD *)buf = 138412290;
      v42 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] Initiating re-purchase for expired update",  buf,  0xCu);
    }

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    objc_initWeak(&location, self);
    id v12 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1001D9B40;
    v28[3] = &unk_1003EBC78;
    id v14 = v6;
    id v29 = v14;
    v30 = self;
    objc_copyWeak(&v32, &location);
    v15 = v11;
    v31 = v15;
    sub_100199B84((uint64_t)v13, v14, v28);

    dispatch_time_t v16 = dispatch_time(0LL, 120000000000LL);
    if (dispatch_semaphore_wait(v15, v16))
    {
      uint64_t v17 = ASDLogHandleForCategory(2LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
        *(_DWORD *)buf = 138412290;
        v42 = v27;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "[%@] Timeout while waiting to re-purchase expired update",  buf,  0xCu);
      }

      uint64_t v19 = ASDErrorWithDescription(ASDErrorDomain, 515LL, @"Took too long to re-purchase update");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      -[Task completeWithError:](self, "completeWithError:", v20);
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  else
  {
    if (*(void *)&self->super._success)
    {
      uint64_t v21 = ASDLogHandleForCategory(2LL);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(void **)&self->super._success;
        *(_DWORD *)buf = 138543362;
        v42 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Could not find non-installed update for bundle ID %{public}@",  buf,  0xCu);
      }

      uint64_t v24 = 916LL;
    }

    else
    {
      uint64_t v25 = ASDLogHandleForCategory(2LL);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "_bundleID == nil", buf, 2u);
      }

      uint64_t v24 = 650LL;
    }

    uint64_t v26 = ASDErrorWithDescription(ASDErrorDomain, v24, @"No update found");
    id v14 = (id)objc_claimAutoreleasedReturnValue(v26);
    -[Task completeWithError:](self, "completeWithError:", v14);
  }

  _Block_object_dispose(&v35, 8);
}

- (void).cxx_destruct
{
}

@end