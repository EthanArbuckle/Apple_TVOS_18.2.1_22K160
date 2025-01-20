@interface PreparePurchaseTask
- (void)completeWithError:(id)a3;
- (void)main;
@end

@implementation PreparePurchaseTask

- (void)completeWithError:(id)a3
{
  v4 = *(void **)&self->super._success;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 account]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
  v8 = sub_1002EBF84((uint64_t)&OBJC_CLASS___StoreItemResponse, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [*(id *)&self->super._success setItemResponse:v9];

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PreparePurchaseTask;
  -[Task completeWithError:](&v10, "completeWithError:", v5);
}

- (void)main
{
  if (+[RestoreKeeper activeRestoreSupportEnabled]( &OBJC_CLASS____TtC9appstored13RestoreKeeper,  "activeRestoreSupportEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RestoreKeeper shared](&OBJC_CLASS____TtC9appstored13RestoreKeeper, "shared"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success bundleID]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success logKey]);
    id v123 = (id)objc_claimAutoreleasedReturnValue([v3 restoringCoordinatorForBundleID:v4 logKey:v5]);

    if (v123)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RestoreKeeper shared](&OBJC_CLASS____TtC9appstored13RestoreKeeper, "shared"));
      id v7 = [*(id *)&self->super._success isUserInitiated];
      v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success logKey]);
      [v6 handleActiveRestoreWithCoordinator:v123 userInitiated:v7 logKey:v8];

      uint64_t v9 = ASDErrorWithDescription(ASDErrorDomain, 747LL, @"Active Restore in Progress");
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      -[PreparePurchaseTask completeWithError:](self, "completeWithError:", v10);

      return;
    }
  }

  if (([*(id *)&self->super._success isRemoteInstall] & 1) == 0)
  {
    id v11 = *(id *)&self->super._success;
    objc_opt_self(&OBJC_CLASS___PreparePurchaseTask);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 itemID]);

    if (!v12
      || (v13 = (void *)objc_claimAutoreleasedReturnValue([v11 itemID]),
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationProxy proxyForItemID:](&OBJC_CLASS___ApplicationProxy, "proxyForItemID:", v13)),
          v13,
          !v14))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);

      if (!v15)
      {
        v14 = 0LL;
        goto LABEL_29;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[ApplicationProxy proxyForBundleID:](&OBJC_CLASS___ApplicationProxy, "proxyForBundleID:", v16));
    }

    if ([v14 isInstalled])
    {
      if (v14)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);

        if (!v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleID]);
          [v11 setBundleID:v18];
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleURL]);

        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleURL]);
          [v11 setBundleURL:v20];
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([v14 ratingRank]);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber, v22);
        if ((objc_opt_isKindOfClass(v21, v23) & 1) != 0)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue([v11 buyParams]);
          v25 = (void *)objc_claimAutoreleasedReturnValue([v21 stringValue]);
          [v24 setParameter:v25 forKey:AMSBuyParamPropertyInstalledSoftwareRating];
        }

        id v124 = v21;
        unsigned int v26 = [v14 isArcade];
        if (v26)
        {
          uint64_t v27 = ASDLogHandleForCategory(25LL);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logKey]);
            *(_DWORD *)buf = 138412290;
            v127 = v29;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%@] Preparing purchase for Arcade app.",  buf,  0xCu);
          }
        }

        [v11 setCoordinatorIntent:2];
        uint64_t v30 = ASDLogHandleForCategory(25LL);
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 logKey]);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
          *(_DWORD *)buf = 138412546;
          v127 = v32;
          __int16 v128 = 2114;
          id v129 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[%@][%{public}@] Installed app found. Setting coordinator intent to IXCoordinatorIntentUpdating",  buf,  0x16u);
        }

        id v34 = sub_100237D18((uint64_t)&OBJC_CLASS___AppUpdatesDatabaseStore);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        objc_msgSend(v11, "setDiscoveredUpdate:", sub_100238CE4((BOOL)v35, 3, v11));

        if ([v11 discoveredUpdate])
        {
          if ([v11 isDiscretionary])
          {
            [v11 setPurchaseType:1];
            v36 = &off_1003EAF90;
            if (v26) {
              v36 = &off_1003EAEF8;
            }
          }

          else
          {
            [v11 setPurchaseType:4];
            if (v26)
            {
              [v11 setArcade:1];
              v36 = &off_1003EAF00;
            }

            else
            {
              v36 = &off_1003EAFA0;
            }
          }

          [v11 setLogCode:*v36];
        }

        if ([v14 hasMIDBasedSINF]
          && +[UpdatesManager isTVProviderApp:]( UpdatesManager,  "isTVProviderApp:",  [v14 storeItemID]))
        {
          [v11 setPurchaseType:2];
          [v11 setLogCode:@"PTV"];
          [v11 setMetricsType:&off_10040CDC0];
          [v11 setMachineBased:1];
          v42 = (void *)objc_claimAutoreleasedReturnValue([v11 buyParams]);
          v43 = (void *)objc_claimAutoreleasedReturnValue([v42 parameterForKey:AMSBuyParamPropertyAppExtVrsId]);

          v44 = (void *)objc_claimAutoreleasedReturnValue([v11 buyParams]);
          uint64_t v45 = AMSBuyParamPropertyExternalVersionId;
          v46 = (void *)objc_claimAutoreleasedReturnValue([v44 parameterForKey:AMSBuyParamPropertyExternalVersionId]);

          if (!v46 && v43)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue([v11 buyParams]);
            [v47 setParameter:v43 forKey:v45];
          }

          [v11 updateGeneratedProperties];
        }

        v48 = (void *)objc_claimAutoreleasedReturnValue([v14 appStoreToolsBuildVersion]);
        id v49 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
        id v51 = sub_100255EC0( (uint64_t)v50,  (uint64_t)@"invalid-build-tools/delta-incompatible-versions",  &__NSArray0__struct);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

        if (([v52 containsObject:v48] & 1) == 0)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v14 storeExternalVersionID]));
          [v11 setInstalledExternalVersionID:v53];

          v54 = (void *)objc_claimAutoreleasedReturnValue([v14 thinningVariantID]);
          [v11 setInstalledVariantID:v54];
        }

        id v41 = v14;
        id v55 = v11;
        objc_opt_self(&OBJC_CLASS___PreparePurchaseTask);
        if ([v41 hasMIDBasedSINF])
        {
          uint64_t v56 = ASDLogHandleForCategory(25LL);
          v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
          if (!os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
          {
LABEL_82:

LABEL_83:
            goto LABEL_84;
          }

          v58 = (os_log_s *)objc_claimAutoreleasedReturnValue([v55 logKey]);
          v59 = (void *)objc_claimAutoreleasedReturnValue([v41 bundleID]);
          *(_DWORD *)buf = 138412546;
          v127 = v58;
          __int16 v128 = 2114;
          id v129 = v59;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v57,  OS_LOG_TYPE_ERROR,  "[%@] Will not update purchase for MID-based app with bundleID: %{public}@",  buf,  0x16u);

LABEL_81:
          goto LABEL_82;
        }

        v60 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "ams_activeiTunesAccount"));

        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "ams_DSID"));
        if (!v58) {
          goto LABEL_81;
        }
        uint64_t v61 = objc_claimAutoreleasedReturnValue([v41 purchaserDSID]);
        v121 = (void *)v61;
        v122 = v55;
        if (!v61) {
          goto LABEL_71;
        }
        if (-[os_log_s isEqual:](v58, "isEqual:", v61))
        {
          [v55 setAccount:v57];
          uint64_t v62 = ASDLogHandleForCategory(25LL);
          v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
          v120 = v63;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            v117 = v58;
            v64 = (os_log_s *)objc_claimAutoreleasedReturnValue([v55 logKey]);
            *(_DWORD *)buf = 138412290;
            v127 = v64;
            _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "[%@] Using active account that matches the purchaser.",  buf,  0xCu);
            goto LABEL_78;
          }

- (void).cxx_destruct
{
}

@end