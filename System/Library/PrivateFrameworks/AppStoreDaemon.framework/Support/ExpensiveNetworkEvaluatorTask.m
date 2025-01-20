@interface ExpensiveNetworkEvaluatorTask
- (void)main;
@end

@implementation ExpensiveNetworkEvaluatorTask

- (void)main
{
  v3 = sub_1001BB300((uint64_t)&OBJC_CLASS___ExpensiveNetworkEvaluator, self->super._error);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v6 = sub_1001BB3D8((uint64_t)v4, *(void **)&self->super._success);
  if (v6 == 4)
  {
    id Property = *(id *)&self->super._success;
    if (Property) {
      id Property = objc_getProperty(Property, v5, 24LL, 1);
    }
    id v8 = Property;
    id v9 = sub_1001D19F0((uint64_t)&OBJC_CLASS___NetworkMonitor);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    uint64_t v11 = *(void *)&self->super._success;
    if (v11 && (*(_BYTE *)(v11 + 8) & 1) != 0)
    {
      uint64_t v30 = ASDLogHandleForCategory(2LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = *(id *)&self->super._success;
        if (v32) {
          id v32 = objc_getProperty(v32, v31, 32LL, 1);
        }
        id v33 = v32;
        v34 = v33;
        uint64_t v35 = *(void *)&self->super._success;
        if (v35) {
          uint64_t v35 = *(void *)(v35 + 16);
        }
        *(_DWORD *)buf = 138412546;
        id v56 = v33;
        __int16 v57 = 2048;
        uint64_t v58 = v35;
        v36 = "[%@]: Download of size %{iec-bytes}llu exceeds cellular limit, but not prompting for automatic download.";
        goto LABEL_33;
      }
    }

    else
    {
      unsigned __int8 v12 = [v10 isExpensiveOrCellular];
      uint64_t v13 = ASDLogHandleForCategory(2LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if ((v12 & 1) != 0)
      {
        if (v15)
        {
          id v17 = *(id *)&self->super._success;
          if (v17) {
            id v17 = objc_getProperty(v17, v16, 32LL, 1);
          }
          id v18 = v17;
          v19 = v18;
          uint64_t v20 = *(void *)&self->super._success;
          if (v20) {
            uint64_t v20 = *(void *)(v20 + 16);
          }
          *(_DWORD *)buf = 138412546;
          id v56 = v18;
          __int16 v57 = 2048;
          uint64_t v58 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%@]: Download of size %{iec-bytes}llu exceeds cellular limit, asking how to proceed.",  buf,  0x16u);
        }

        id v21 = sub_1002EC1D0( (uint64_t)&OBJC_CLASS___CellularDataPromptDialogRequest,  *(void **)&self->super._success,  (int)-[NSError isRoaming](self->super._error, "isRoaming"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        id v54 = 0LL;
        id v23 = sub_100277E88((uint64_t)&OBJC_CLASS___InteractiveRequestPresenter, v22, &v54);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v14 = (os_log_s *)v54;
        if (v14)
        {
          uint64_t v25 = ASDLogHandleForCategory(2LL);
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = *(id *)&self->super._success;
            if (v28) {
              id v28 = objc_getProperty(v28, v27, 32LL, 1);
            }
            id v29 = v28;
            *(_DWORD *)buf = 138412546;
            id v56 = v29;
            __int16 v57 = 2114;
            uint64_t v58 = (uint64_t)v14;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@]: Error delivering dialog request: %{public}@",  buf,  0x16u);
          }

          uint64_t v6 = 4LL;
        }

        else
        {
          if (!v24)
          {
            uint64_t v6 = 4LL;
            goto LABEL_20;
          }

          v45 = (void *)objc_claimAutoreleasedReturnValue([v24 selectedActionIdentifier]);
          unsigned int v46 = [v45 isEqualToString:@"CelularDataPromptActionDownloadNow"];

          uint64_t v47 = ASDLogHandleForCategory(2LL);
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          BOOL v48 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          if (v46)
          {
            if (v48)
            {
              id v50 = *(id *)&self->super._success;
              if (v50) {
                id v50 = objc_getProperty(v50, v49, 32LL, 1);
              }
              id v51 = v50;
              *(_DWORD *)buf = 138412290;
              id v56 = v51;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@]: We were asked to download now.  Not requiring inexpensive data.",  buf,  0xCu);
            }

            uint64_t v6 = 1LL;
          }

          else
          {
            if (v48)
            {
              id v52 = *(id *)&self->super._success;
              if (v52) {
                id v52 = objc_getProperty(v52, v49, 32LL, 1);
              }
              id v53 = v52;
              *(_DWORD *)buf = 138412290;
              id v56 = v53;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@]: We were asked to download later.  Requiring inexpensive data.",  buf,  0xCu);
            }

            uint64_t v6 = 2LL;
          }
        }

LABEL_20:
LABEL_35:

        goto LABEL_36;
      }

      if (v15)
      {
        id v37 = *(id *)&self->super._success;
        if (v37) {
          id v37 = objc_getProperty(v37, v16, 32LL, 1);
        }
        id v38 = v37;
        v34 = v38;
        uint64_t v39 = *(void *)&self->super._success;
        if (v39) {
          uint64_t v39 = *(void *)(v39 + 16);
        }
        *(_DWORD *)buf = 138412546;
        id v56 = v38;
        __int16 v57 = 2048;
        uint64_t v58 = v39;
        v36 = "[%@]: Download of size %{iec-bytes}llu exceeds cellular limit, but not prompting for inexpensive network.";
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);
      }
    }

    uint64_t v6 = 4LL;
    goto LABEL_35;
  }

- (void).cxx_destruct
{
}

@end