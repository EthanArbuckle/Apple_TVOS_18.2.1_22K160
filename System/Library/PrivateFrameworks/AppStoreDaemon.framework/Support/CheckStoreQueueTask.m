@interface CheckStoreQueueTask
- (void)main;
@end

@implementation CheckStoreQueueTask

- (void)main
{
  v2 = self;
  v116 = (void *)objc_claimAutoreleasedReturnValue([(id)self->_reason account]);
  if (v116
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore")),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_activeiTunesAccount")),
        v3,
        (v116 = (void *)v4) != 0LL))
  {
    uint64_t v5 = ASDLogHandleForCategory(25LL);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)&v2->super._success;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "ams_DSID"));
      *(_DWORD *)buf = 138412546;
      v129 = v7;
      __int16 v130 = 2114;
      id v131 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] Loading queue for account: %{public}@",  buf,  0x16u);
    }

    if (v2->_logKey == (_TtC9appstored6LogKey *)1) {
      v9 = (SilentRequestPresenter *)objc_claimAutoreleasedReturnValue([(id)v2->_reason requestPresenter]);
    }
    else {
      v9 = objc_opt_new(&OBJC_CLASS___SilentRequestPresenter);
    }
    v10 = v9;
    v11 = objc_alloc(&OBJC_CLASS___LoadStoreQueueTask);
    error = v2->super._error;
    v13 = (void *)objc_claimAutoreleasedReturnValue([(id)v2->_reason account]);
    v14 = sub_100309A94((id *)&v11->super.super.super.isa, error, v13, v10, *(void **)&v2->super._success);

    id v125 = 0LL;
    LODWORD(v11) = -[Task runSubTask:returningError:](v2, "runSubTask:returningError:", v14, &v125);
    id v16 = v125;
    if ((_DWORD)v11)
    {
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v121 = 0u;
      __int128 v122 = 0u;
      if (v14) {
        id Property = objc_getProperty(v14, v15, 80LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v18 = Property;
      id v119 = [v18 countByEnumeratingWithState:&v121 objects:v127 count:16];
      if (v119)
      {
        v108 = v14;
        v109 = v10;
        char v114 = 0;
        v115 = 0LL;
        uint64_t v118 = *(void *)v122;
        v110 = v2;
        v20 = v16;
        id v117 = v18;
        while (1)
        {
          v21 = 0LL;
          do
          {
            if (*(void *)v122 != v118) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v121 + 1) + 8LL * (void)v21);
            if (v22) {
              id v23 = objc_getProperty(*(id *)(*((void *)&v121 + 1) + 8LL * (void)v21), v19, 224LL, 1);
            }
            else {
              id v23 = 0LL;
            }
            id v24 = v23;
            unsigned __int8 v25 = [v24 isEqualToString:@"software"];

            if ((v25 & 1) != 0)
            {
              uint64_t v26 = objc_claimAutoreleasedReturnValue([(id)v2->_reason itemID]);
              if (v26)
              {
                v28 = (void *)v26;
                id v29 = v22 ? objc_getProperty(v22, v27, 208LL, 1) : 0LL;
                id v30 = v29;
                v31 = (void *)objc_claimAutoreleasedReturnValue([(id)v2->_reason itemID]);
                unsigned int v32 = [v30 isEqualToNumber:v31];

                if (v32)
                {
                  v33 = (PurchaseInfo *)(id)v2->_reason;
                  int v34 = 1;
                  char v114 = 1;
                  if (!v33) {
                    goto LABEL_24;
                  }
LABEL_54:
                  v76 = objc_alloc(&OBJC_CLASS___PurchaseImportTask);
                  v126 = v22;
                  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v126,  1LL));
                  v78 = sub_1001CCCA4((id *)&v76->super.super.super.isa, v77, v33, (void *)v2->_queueType);

                  if (v34) {
                    char v79 = !-[PurchaseInfo isDiscretionary](v33, "isDiscretionary");
                  }
                  else {
                    char v79 = 0;
                  }
                  sub_1001CCE1C((uint64_t)v78, v79);
                  id v120 = v20;
                  v80 = v20;
                  unsigned __int8 v81 = -[Task runSubTask:returningError:](v2, "runSubTask:returningError:", v78, &v120);
                  id v82 = v120;

                  if ((v81 & 1) != 0)
                  {
                    ++v115;
                    id v18 = v117;
                  }

                  else
                  {
                    uint64_t v83 = ASDLogHandleForCategory(25LL);
                    v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
                    id v18 = v117;
                    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                    {
                      v85 = (void *)objc_claimAutoreleasedReturnValue(-[PurchaseInfo logKey](v33, "logKey"));
                      *(_DWORD *)buf = 138412546;
                      v129 = v85;
                      __int16 v130 = 2114;
                      id v131 = v82;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_ERROR,  "[%@] Importing queued purchase failed: %{public}@",  buf,  0x16u);

                      v2 = v110;
                    }
                  }

                  v20 = v82;
                  goto LABEL_63;
                }
              }

              id v40 = v22;
              objc_opt_self(&OBJC_CLASS___CheckStoreQueueTask);
              if (v22) {
                id v42 = objc_getProperty(v40, v41, 96LL, 1);
              }
              else {
                id v42 = 0LL;
              }
              id v43 = v42;

              v44 = (void *)objc_claimAutoreleasedReturnValue( +[ApplicationProxy proxyForBundleID:]( &OBJC_CLASS___ApplicationProxy,  "proxyForBundleID:",  v43));
              v45 = v40;
              id v46 = v44;
              id v47 = v116;
              v48 = objc_alloc_init(&OBJC_CLASS___PurchaseInfo);
              v33 = v48;
              if (v22)
              {
                id v50 = objc_getProperty(v45, v49, 96LL, 1);
                -[PurchaseInfo setBundleID:](v33, "setBundleID:", v50);

                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                -[PurchaseInfo setExternalID:](v33, "setExternalID:", v51);

                id v53 = objc_getProperty(v45, v52, 208LL, 1);
              }

              else
              {
                -[PurchaseInfo setBundleID:](v48, "setBundleID:", 0LL);
                v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
                -[PurchaseInfo setExternalID:](v33, "setExternalID:", v86);

                id v53 = 0LL;
              }

              id v54 = v53;
              -[PurchaseInfo setItemID:](v33, "setItemID:", v54);

              -[PurchaseInfo setAccount:](v33, "setAccount:", v47);
              if (v22)
              {
                if ((v45[16] & 1) != 0)
                {
                  uint64_t v57 = ASDLogHandleForCategory(25LL);
                  v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    v60 = *(void **)&v2->super._success;
                    id v61 = objc_getProperty(v45, v59, 96LL, 1);
                    *(_DWORD *)buf = 138412546;
                    v129 = v60;
                    __int16 v130 = 2114;
                    id v131 = v61;
                    _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "[%@] Queue check contains a redownload with bundleID: %{public}@",  buf,  0x16u);
                  }

                  v55 = &off_10040BE30;
                  v56 = @"QRD";
                }

                else
                {
                  v55 = &off_10040BE48;
                  v56 = @"QDA";
                  if ((v45[8] & 1) == 0) {
                    goto LABEL_36;
                  }
                }
              }

              else
              {
LABEL_36:
                v55 = &off_10040BE60;
                v56 = @"BYQ";
              }

              -[PurchaseInfo setMetricsType:](v33, "setMetricsType:", v55, v108, v109);
              -[PurchaseInfo setLogCode:](v33, "setLogCode:", v56);
              logKey = v2->_logKey;
              if (logKey)
              {
                uint64_t v63 = 2LL;
              }

              else
              {
                -[PurchaseInfo setDiscretionary:](v33, "setDiscretionary:", 1LL);
                -[PurchaseInfo setSuppressDialogs:](v33, "setSuppressDialogs:", 1LL);
                uint64_t v63 = 1LL;
              }

              -[PurchaseInfo setCoordinatorImportance:](v33, "setCoordinatorImportance:", v63);
              -[PurchaseInfo setCoordinatorIntent:](v33, "setCoordinatorIntent:", 1LL);
              if (v46 && [v46 isInstalled])
              {
                uint64_t v64 = ASDLogHandleForCategory(25LL);
                v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v112 = *(void **)&v2->super._success;
                  v113 = v20;
                  if (v22)
                  {
                    id v67 = objc_getProperty(v45, v66, 96LL, 1);
                    id v69 = objc_getProperty(v45, v68, 112LL, 1);
                    v111 = v67;
                  }

                  else
                  {
                    id v67 = 0LL;
                    v111 = 0LL;
                    id v69 = 0LL;
                  }

                  id v70 = v69;
                  v71 = (void *)objc_claimAutoreleasedReturnValue([v46 bundleVersion]);
                  id v72 = [v46 storeExternalVersionID];
                  *(_DWORD *)buf = 138413314;
                  v129 = v112;
                  __int16 v130 = 2114;
                  id v131 = v67;
                  __int16 v132 = 2114;
                  id v133 = v70;
                  __int16 v134 = 2114;
                  v135 = v71;
                  __int16 v136 = 2048;
                  id v137 = v72;
                  _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "[%@] Queue check found update for %{public}@ to %{public}@. Installed version = %{public}@ (%lld)",  buf,  0x34u);

                  v2 = v110;
                  v20 = v113;
                }

                v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v46 storeExternalVersionID]));
                -[PurchaseInfo setInstalledExternalVersionID:](v33, "setInstalledExternalVersionID:", v73);

                v74 = (void *)objc_claimAutoreleasedReturnValue([v46 thinningVariantID]);
                -[PurchaseInfo setInstalledVariantID:](v33, "setInstalledVariantID:", v74);

                if (logKey) {
                  uint64_t v75 = 2LL;
                }
                else {
                  uint64_t v75 = 1LL;
                }
                -[PurchaseInfo setUpdateType:](v33, "setUpdateType:", v75);
                -[PurchaseInfo setCoordinatorIntent:](v33, "setCoordinatorIntent:", 2LL);
              }

              -[PurchaseInfo updateGeneratedProperties](v33, "updateGeneratedProperties");

              int v34 = 0;
              if (!v33)
              {
LABEL_24:
                id v18 = v117;
                goto LABEL_63;
              }

              goto LABEL_54;
            }

            uint64_t v35 = ASDLogHandleForCategory(25LL);
            v33 = (PurchaseInfo *)objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEBUG))
            {
              v37 = *(void **)&v2->super._success;
              if (v22) {
                id v38 = objc_getProperty(v22, v36, 224LL, 1);
              }
              else {
                id v38 = 0LL;
              }
              id v39 = v38;
              *(_DWORD *)buf = 138412546;
              v129 = v37;
              __int16 v130 = 2114;
              id v131 = v39;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_DEBUG,  "[%@] Skipping over unsupported '%{public}@' for other clients to collect",  buf,  0x16u);

              id v18 = v117;
            }

- (void).cxx_destruct
{
}

@end