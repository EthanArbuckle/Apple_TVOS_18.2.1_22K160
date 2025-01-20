@interface LowDataEvaluatorTask
- (void)main;
@end

@implementation LowDataEvaluatorTask

- (void)main
{
  v3 = objc_alloc_init(&OBJC_CLASS___LowDataNetworkEvaluator);
  uint64_t v5 = sub_1001C94A0((uint64_t)v3, *(void **)&self->super._success);
  if (v5 == 4)
  {
    id Property = *(id *)&self->super._success;
    if (Property) {
      id Property = objc_getProperty(Property, v4, 24LL, 1);
    }
    id v7 = Property;
    id v8 = sub_1001D19F0((uint64_t)&OBJC_CLASS___NetworkMonitor);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    uint64_t v10 = *(void *)&self->super._success;
    if (v10 && (*(_BYTE *)(v10 + 8) & 1) != 0)
    {
      uint64_t v21 = ASDLogHandleForCategory(2LL);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = *(id *)&self->super._success;
        if (v23) {
          id v23 = objc_getProperty(v23, v22, 32LL, 1);
        }
        id v24 = v23;
        *(_DWORD *)buf = 138412290;
        id v45 = v24;
        v25 = "[%@]: Requires unconstrained network, but not prompting for automatic download.";
        goto LABEL_23;
      }
    }

    else
    {
      if ([v9 isConstrained])
      {
        id v11 = sub_1002CA5CC((uint64_t)&OBJC_CLASS___LowDataModePromptDialogRequest, *(void **)&self->super._success);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        id v43 = 0LL;
        id v13 = sub_100277E88((uint64_t)&OBJC_CLASS___InteractiveRequestPresenter, v12, &v43);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = (os_log_s *)v43;
        if (v15)
        {
          uint64_t v16 = ASDLogHandleForCategory(2LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = *(id *)&self->super._success;
            if (v19) {
              id v19 = objc_getProperty(v19, v18, 32LL, 1);
            }
            id v20 = v19;
            *(_DWORD *)buf = 138412546;
            id v45 = v20;
            __int16 v46 = 2114;
            uint64_t v47 = (uint64_t)v15;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@]: Error delivering dialog request: %{public}@",  buf,  0x16u);
          }

          uint64_t v5 = 4LL;
        }

        else
        {
          if (!v14)
          {
            uint64_t v5 = 4LL;
            goto LABEL_14;
          }

          v34 = (void *)objc_claimAutoreleasedReturnValue([v14 selectedActionIdentifier]);
          unsigned int v35 = [v34 isEqualToString:@"LowDataModePromptActionDownload"];

          uint64_t v36 = ASDLogHandleForCategory(2LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
          BOOL v37 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v37)
            {
              id v39 = *(id *)&self->super._success;
              if (v39) {
                id v39 = objc_getProperty(v39, v38, 32LL, 1);
              }
              id v40 = v39;
              *(_DWORD *)buf = 138412290;
              id v45 = v40;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@]: We were asked to download now. Ignoring constrained network.",  buf,  0xCu);
            }

            uint64_t v5 = 1LL;
          }

          else
          {
            if (v37)
            {
              id v41 = *(id *)&self->super._success;
              if (v41) {
                id v41 = objc_getProperty(v41, v38, 32LL, 1);
              }
              id v42 = v41;
              *(_DWORD *)buf = 138412290;
              id v45 = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@]: We were asked to cancel download. Denying network access.",  buf,  0xCu);
            }

            uint64_t v5 = 2LL;
          }
        }

LABEL_14:
LABEL_25:

        goto LABEL_26;
      }

      uint64_t v26 = ASDLogHandleForCategory(2LL);
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = *(id *)&self->super._success;
        if (v28) {
          id v28 = objc_getProperty(v28, v27, 32LL, 1);
        }
        id v24 = v28;
        *(_DWORD *)buf = 138412290;
        id v45 = v24;
        v25 = "[%@]: Requires unconstrained network, but not prompting for current network.";
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
      }
    }

    uint64_t v5 = 4LL;
    goto LABEL_25;
  }

- (void).cxx_destruct
{
}

@end