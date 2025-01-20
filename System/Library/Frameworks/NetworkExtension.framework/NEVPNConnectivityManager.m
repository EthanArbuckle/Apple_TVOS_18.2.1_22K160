@interface NEVPNConnectivityManager
- (BOOL)hasRelayConfigurations;
- (BOOL)usesPolicyBasedRouting;
- (NEVPNConnectivityManager)initWithDelegate:(id)a3;
- (NEVPNConnectivityManagerDelegate)delegate;
- (id)toggleVPNConnectivity:(BOOL)a3;
- (unint64_t)connectivityState;
- (unint64_t)visibilityStyle;
- (void)cancelSessions:(void *)a3 withCompletionHandler:;
- (void)dealloc;
- (void)refreshConfigurations;
- (void)refreshConnectivityState;
- (void)sessionStatusDidChange:(id)a3;
- (void)setConnectivityState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasRelayConfigurations:(BOOL)a3;
- (void)setUsesPolicyBasedRouting:(BOOL)a3;
- (void)setVisibilityStyle:(unint64_t)a3;
@end

@implementation NEVPNConnectivityManager

- (NEVPNConnectivityManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___NEVPNConnectivityManager;
  v5 = -[NEVPNConnectivityManager init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[NEConfigurationManager initForAllUsers](objc_alloc(&OBJC_CLASS___NEConfigurationManager), "initForAllUsers");
    configManager = v6->_configManager;
    v6->_configManager = v7;

    *(_OWORD *)&v6->_visibilityStyle = xmmword_187873270;
    v6->_hasRelayConfigurations = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create("Connectivity manager queue", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v6);
    v12 = v6->_configManager;
    v13 = v6->_queue;
    uint64_t v14 = MEMORY[0x1895F87A8];
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __45__NEVPNConnectivityManager_initWithDelegate___block_invoke;
    v19[3] = &unk_18A08FD30;
    objc_copyWeak(&v20, &location);
    -[NEConfigurationManager setChangedQueue:andHandler:](v12, "setChangedQueue:andHandler:", v13, v19);
    v15 = (dispatch_queue_s *)v6->_queue;
    block[0] = v14;
    block[1] = 3221225472LL;
    block[2] = __45__NEVPNConnectivityManager_initWithDelegate___block_invoke_29;
    block[3] = &unk_18A090390;
    v18 = v6;
    dispatch_async(v15, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 56LL, 1);
    objc_setProperty_atomic(self, v4, 0LL, 56LL);
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](self, v3, 0LL);
  }

  else
  {
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](0LL, 0LL, 0LL);
    id v3 = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NEVPNConnectivityManager;
  -[NEVPNConnectivityManager dealloc](&v5, sel_dealloc);
}

- (id)toggleVPNConnectivity:(BOOL)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    -[NEVPNConnectivityManager setConnectivityState:](self, "setConnectivityState:", 1LL);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v4, 56LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v6 = Property;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (!v7)
    {
LABEL_31:

      id v26 = objc_alloc(MEMORY[0x189607870]);
      uint64_t v27 = *MEMORY[0x189607688];
      uint64_t v56 = *MEMORY[0x1896075E0];
      v57 = @"No enabled VPN configurations are available";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v28 = (void *)[v26 initWithDomain:v27 code:2 userInfo:v6];
      goto LABEL_59;
    }

    uint64_t v10 = v7;
    uint64_t v11 = *(void *)v52;
    *(void *)&__int128 v9 = 138412290LL;
    __int128 v45 = v9;
LABEL_6:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v52 != v11) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
      if (v13)
      {
        if (objc_msgSend( objc_getProperty(*(id *)(*((void *)&v51 + 1) + 8 * v12), v8, 8, 1),  "isEnabled"))
        {
          id v14 = objc_getProperty(v13, v8, 8LL, 1);
LABEL_12:
          objc_msgSend(v14, "VPN", v45);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            ne_log_obj();
            v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              if (v13) {
                id v18 = objc_getProperty(v13, v17, 8LL, 1);
              }
              else {
                id v18 = 0LL;
              }
              [v18 name];
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v45;
              v59 = v19;
              _os_log_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEFAULT, "Starting %@", buf, 0xCu);
            }

            if (v13 && v13[2])
            {
              ne_session_start();
              v28 = 0LL;
              goto LABEL_59;
            }

            ne_log_obj();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              if (v13) {
                id v22 = objc_getProperty(v13, v21, 8LL, 1);
              }
              else {
                id v22 = 0LL;
              }
              [v22 name];
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v45;
              v59 = v23;
              _os_log_error_impl(&dword_1876B1000, v20, OS_LOG_TYPE_ERROR, "No ne_session available for %@", buf, 0xCu);
            }
          }
        }
      }

      else
      {
        char v24 = [0 isEnabled];
        id v14 = 0LL;
        if ((v24 & 1) != 0) {
          goto LABEL_12;
        }
      }

      if (v10 == ++v12)
      {
        uint64_t v25 = [v6 countByEnumeratingWithState:&v51 objects:v60 count:16];
        uint64_t v10 = v25;
        if (!v25) {
          goto LABEL_31;
        }
        goto LABEL_6;
      }
    }
  }

  -[NEVPNConnectivityManager setConnectivityState:](self, "setConnectivityState:", 3LL);
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  if (self) {
    id v30 = objc_getProperty(self, v29, 56LL, 1);
  }
  else {
    id v30 = 0LL;
  }
  id v6 = v30;
  v28 = (void *)[v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v28)
  {
    uint64_t v33 = *(void *)v48;
    *(void *)&__int128 v32 = 138412290LL;
    __int128 v46 = v32;
    do
    {
      v34 = 0LL;
      do
      {
        if (*(void *)v48 != v33) {
          objc_enumerationMutation(v6);
        }
        v35 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v34);
        if (v35)
        {
          if (!objc_msgSend( objc_getProperty(*(id *)(*((void *)&v47 + 1) + 8 * (void)v34), v31, 8, 1),  "isEnabled")) {
            goto LABEL_48;
          }
          id v36 = objc_getProperty(v35, v31, 8LL, 1);
        }

        else
        {
          char v42 = [0 isEnabled];
          id v36 = 0LL;
          if ((v42 & 1) == 0) {
            goto LABEL_48;
          }
        }

        objc_msgSend(v36, "VPN", v46, (void)v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          if (v35 && v35[2])
          {
            ne_session_stop();
          }

          else
          {
            ne_log_obj();
            v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              if (v35) {
                id v40 = objc_getProperty(v35, v39, 8LL, 1);
              }
              else {
                id v40 = 0LL;
              }
              [v40 name];
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v46;
              v59 = v41;
              _os_log_error_impl(&dword_1876B1000, v38, OS_LOG_TYPE_ERROR, "No ne_session available for %@", buf, 0xCu);
            }
          }
        }

- (void)sessionStatusDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  ne_log_obj();
  objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id Property = objc_getProperty(v4, v6, 8LL, 1);
    }
    else {
      id Property = 0LL;
    }
    [Property name];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      id v10 = objc_getProperty(v4, v8, 8LL, 1);
    }
    else {
      id v10 = 0LL;
    }
    [v10 identifier];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEFAULT, "Session status of %@ (%@) changed", (uint8_t *)&v13, 0x16u);
  }

  -[NEVPNConnectivityManager refreshConnectivityState](self, v12);
}

- (NEVPNConnectivityManagerDelegate)delegate
{
  return (NEVPNConnectivityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)visibilityStyle
{
  return self->_visibilityStyle;
}

- (void)setVisibilityStyle:(unint64_t)a3
{
  self->_visibilityStyle = a3;
}

- (unint64_t)connectivityState
{
  return self->_connectivityState;
}

- (void)setConnectivityState:(unint64_t)a3
{
  self->_connectivityState = a3;
}

- (BOOL)hasRelayConfigurations
{
  return self->_hasRelayConfigurations;
}

- (void)setHasRelayConfigurations:(BOOL)a3
{
  self->_hasRelayConfigurations = a3;
}

- (BOOL)usesPolicyBasedRouting
{
  return self->_usesPolicyBasedRouting;
}

- (void)setUsesPolicyBasedRouting:(BOOL)a3
{
  self->_usesPolicyBasedRouting = a3;
}

- (void).cxx_destruct
{
}

- (void)refreshConnectivityState
{
  uint64_t v87 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = a1;
    v80[0] = 0LL;
    v80[1] = v80;
    v80[2] = 0x2020000000LL;
    v80[3] = 0LL;
    uint64_t v76 = 0LL;
    v77 = &v76;
    uint64_t v78 = 0x2020000000LL;
    uint64_t v79 = 2LL;
    v74[0] = 0LL;
    v74[1] = v74;
    v74[2] = 0x2020000000LL;
    char v75 = 1;
    uint64_t v70 = 0LL;
    v71 = &v70;
    uint64_t v72 = 0x2020000000LL;
    char v73 = 0;
    id v3 = objc_getProperty(a1, a2, 56LL, 1);
    __int128 v53 = (void *)[v3 copy];
    self = v2;

    uint64_t v4 = [v53 count];
    if (v4)
    {
      if (v4 == 1)
      {
        [v53 firstObject];
        objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v7 = v5;
        if (v5) {
          id Property = objc_getProperty(v5, v6, 8LL, 1);
        }
        else {
          id Property = 0LL;
        }
        id v9 = Property;
        [v9 relay];
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {

          uint64_t v4 = 2LL;
        }

        else
        {
          [v53 firstObject];
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          int v13 = v11;
          if (v11) {
            id v14 = objc_getProperty(v11, v12, 8LL, 1);
          }
          else {
            id v14 = 0LL;
          }
          id v15 = v14;
          [v15 VPN];
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          int v17 = [v16 isEnabled];

          if (v17) {
            uint64_t v4 = 1LL;
          }
          else {
            uint64_t v4 = 2LL;
          }
        }
      }

      else
      {
        uint64_t v4 = 2LL;
      }
    }

    v77[3] = v4;
    group = dispatch_group_create();
    if (v77[3])
    {
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v19 = v53;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v66 objects:v86 count:16];
      if (!v21) {
        goto LABEL_38;
      }
      uint64_t v22 = *(void *)v67;
      while (1)
      {
        uint64_t v23 = 0LL;
        do
        {
          if (*(void *)v67 != v22) {
            objc_enumerationMutation(v19);
          }
          char v24 = *(void **)(*((void *)&v66 + 1) + 8 * v23);
          if (v24) {
            id v25 = objc_getProperty(*(id *)(*((void *)&v66 + 1) + 8 * v23), v20, 8LL, 1);
          }
          else {
            id v25 = 0LL;
          }
          id v26 = v25;
          [v26 appVPN];
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {

LABEL_27:
            v77[3] = 2LL;
            goto LABEL_28;
          }

          if (v24) {
            id v30 = objc_getProperty(v24, v28, 8LL, 1);
          }
          else {
            id v30 = 0LL;
          }
          id v31 = v30;
          [v31 alwaysOnVPN];
          __int128 v32 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v33 = v32 == 0LL;

          if (!v33) {
            goto LABEL_27;
          }
LABEL_28:
          if (v24) {
            id v34 = objc_getProperty(v24, v29, 8LL, 1);
          }
          else {
            id v34 = 0LL;
          }
          id v35 = v34;
          [v35 relay];
          id v36 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v37 = v36 == 0LL;

          if (!v37) {
            *((_BYTE *)v71 + 24) = 1;
          }
          ++v23;
        }

        while (v21 != v23);
        uint64_t v38 = [v19 countByEnumeratingWithState:&v66 objects:v86 count:16];
        uint64_t v21 = v38;
        if (!v38)
        {
LABEL_38:

          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          id obj = v19;
          uint64_t v39 = [obj countByEnumeratingWithState:&v62 objects:v85 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v63;
            do
            {
              for (uint64_t i = 0LL; i != v39; ++i)
              {
                if (*(void *)v63 != v40) {
                  objc_enumerationMutation(obj);
                }
                char v42 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                if (v42 && v42[2])
                {
                  ne_log_obj();
                  uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    id v45 = objc_getProperty(v42, v44, 8LL, 1);
                    [v45 name];
                    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();
                    id v48 = objc_getProperty(v42, v47, 8LL, 1);
                    [v48 identifier];
                    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v82 = v46;
                    __int16 v83 = 2112;
                    v84 = v49;
                    _os_log_impl(&dword_1876B1000, v43, OS_LOG_TYPE_DEFAULT, "Fetching status of %@ (%@)", buf, 0x16u);
                  }

                  dispatch_group_enter(group);
                  id v51 = objc_getProperty(self, v50, 48LL, 1);
                  block[9] = MEMORY[0x1895F87A8];
                  block[10] = 3221225472LL;
                  block[11] = __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke;
                  block[12] = &unk_18A08E5C8;
                  v59 = v80;
                  v60 = v74;
                  uint64_t v61 = &v76;
                  block[13] = v42;
                  block[14] = self;
                  v58 = group;
                  ne_session_get_status();
                }
              }

              uint64_t v39 = [obj countByEnumeratingWithState:&v62 objects:v85 count:16];
            }

            while (v39);
          }

          v2 = self;
          break;
        }
      }
    }

    __int128 v52 = (dispatch_queue_s *)objc_getProperty(v2, v18, 48LL, 1);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_39;
    block[3] = &unk_18A08E5F0;
    void block[4] = v2;
    block[5] = &v76;
    block[6] = v80;
    block[7] = &v70;
    block[8] = v74;
    dispatch_group_notify(group, v52, block);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(v74, 8);
    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(v80, 8);
  }

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke(uint64_t a1, int a2)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 8LL, 1);
    }
    [Property name];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = *(id *)(a1 + 32);
    if (v9) {
      id v9 = objc_getProperty(v9, v7, 8LL, 1);
    }
    [v9 identifier];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    uint64_t v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v10;
    __int16 v41 = 2080;
    uint64_t v42 = ne_session_status_to_string();
    _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_DEFAULT, "VPN %@ (%@) is %s", buf, 0x20u);
  }

  objc_opt_self();
  else {
    uint64_t v12 = qword_187872F28[a2 - 1];
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v14 = *(void *)(v13 + 24);
  if (v12 == v14 || v14 == 2)
  {
    goto LABEL_29;
  }

  if (v12 == 1)
  {
    *(void *)(v13 + 24) = 1LL;
LABEL_29:
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
    {
      id v19 = *(id *)(a1 + 32);
      if (v19) {
        id v19 = objc_getProperty(v19, v11, 8LL, 1);
      }
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v19 usesPolicyBasedRouting];
    }

    goto LABEL_33;
  }

  if (v12 != 3)
  {
    if (v12 != 2) {
      goto LABEL_33;
    }
    id v16 = *(id *)(a1 + 32);
    if (v16) {
      id v16 = objc_getProperty(v16, v11, 8LL, 1);
    }
    [v16 relay];
    int v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17) {
      uint64_t v18 = 5LL;
    }
    else {
      uint64_t v18 = 2LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v18;
    goto LABEL_29;
  }

  if (v14 != 1) {
    *(void *)(v13 + 24) = 3LL;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) != 1LL) {
    goto LABEL_49;
  }
  id v20 = *(void **)(a1 + 32);
  if (!v20) {
    goto LABEL_49;
  }
  if (!v20[2]) {
    goto LABEL_49;
  }
  uint64_t v21 = objc_msgSend(objc_getProperty(v20, v11, 8, 1), "VPN");
  if (!v21) {
    goto LABEL_49;
  }
LABEL_33:
  uint64_t v23 = (void *)v21;
  id v24 = *(id *)(a1 + 32);
  if (v24) {
    id v24 = objc_getProperty(v24, v22, 8LL, 1);
  }
  [v24 VPN];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  int v26 = [v25 isOnDemandEnabled];

  if (v26)
  {
    ne_log_obj();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = *(id *)(a1 + 32);
      if (v29) {
        id v29 = objc_getProperty(v29, v28, 8LL, 1);
      }
      [v29 name];
      id v31 = (void *)objc_claimAutoreleasedReturnValue();
      id v32 = *(id *)(a1 + 32);
      if (v32) {
        id v32 = objc_getProperty(v32, v30, 8LL, 1);
      }
      [v32 identifier];
      BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = v31;
      __int16 v39 = 2112;
      uint64_t v40 = v33;
      _os_log_impl(&dword_1876B1000, v27, OS_LOG_TYPE_DEFAULT, "Fetching extended status of %@ (%@)", buf, 0x16u);
    }

    id v35 = *(void **)(a1 + 40);
    if (v35) {
      objc_getProperty(v35, v34, 48LL, 1);
    }
    id v36 = *(id *)(a1 + 48);
    ne_session_get_info();
  }

  else
  {
LABEL_49:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_39(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) setVisibilityStyle:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setConnectivityState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [*(id *)(a1 + 32) setHasRelayConfigurations:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  [*(id *)(a1 + 32) setUsesPolicyBasedRouting:0];
  if ((unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) - 1LL) <= 1) {
    [*(id *)(a1 + 32) setUsesPolicyBasedRouting:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  }
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    unint64_t v4 = [v3 connectivityState];
    if (v3)
    {
      if (v4 > 5) {
        objc_super v5 = @"NEVPNConnectivityStateInactive";
      }
      else {
        objc_super v5 = off_18A08E650[v4];
      }
    }

    else
    {
      objc_super v5 = 0LL;
    }

    uint64_t v6 = [*(id *)(a1 + 32) visibilityStyle];
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL)) {
      uint64_t v7 = ", has relays";
    }
    else {
      uint64_t v7 = "";
    }
    int v8 = [*(id *)(a1 + 32) usesPolicyBasedRouting];
    id v9 = "does not use";
    int v13 = 138413058;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    if (v8) {
      id v9 = "uses";
    }
    uint64_t v16 = v6;
    __int16 v17 = 2082;
    uint64_t v18 = v7;
    __int16 v19 = 2080;
    id v20 = v9;
    _os_log_impl( &dword_1876B1000,  v2,  OS_LOG_TYPE_DEFAULT,  "VPN connectivity state is now %@, visibility state is now %ld%{public}s, %s policy-based routing",  (uint8_t *)&v13,  0x2Au);
  }

  [*(id *)(a1 + 32) delegate];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_DEFAULT,  "NEVPNConnectivityManager: invoking delegate",  (uint8_t *)&v13,  2u);
    }

    [v10 connectivityManagerDidChange:*(void *)(a1 + 32)];
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "NEVPNConnectivityManager: delegate is nil",  (uint8_t *)&v13,  2u);
    }
  }
}

void __52__NEVPNConnectivityManager_refreshConnectivityState__block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  objc_super v5 = v3;
  if (v3)
  {
    uint64_t v6 = MEMORY[0x1895ADD58](v3);
    uint64_t v7 = MEMORY[0x1895F9250];
    if (v6 == MEMORY[0x1895F9250])
    {
      uint64_t v8 = xpc_dictionary_get_value(v5, "VPN");
      id v9 = (void *)v8;
      if (v8 && MEMORY[0x1895ADD58](v8) == v7)
      {
        int64_t int64 = xpc_dictionary_get_int64(v9, "OnDemandAction");
        ne_log_obj();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id Property = *(id *)(a1 + 32);
          if (Property) {
            id Property = objc_getProperty(Property, v12, 8LL, 1);
          }
          [Property name];
          __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = *(id *)(a1 + 32);
          if (v16) {
            id v16 = objc_getProperty(v16, v14, 8LL, 1);
          }
          [v16 identifier];
          __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
          int v39 = 134218498;
          int64_t v40 = int64;
          __int16 v41 = 2112;
          uint64_t v42 = v15;
          __int16 v43 = 2112;
          v44 = v17;
          _os_log_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Got on demand action of %ld for %@ (%@)",  (uint8_t *)&v39,  0x20u);
        }
      }
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) == 1LL)
  {
    id v18 = *(id *)(a1 + 32);
    if (v18) {
      id v18 = objc_getProperty(v18, v4, 8LL, 1);
    }
    [v18 VPN];
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 protocol];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 type];

    if (v21 == 4)
    {
      id v23 = *(id *)(a1 + 32);
      if (v23) {
        id v23 = objc_getProperty(v23, v22, 8LL, 1);
      }
      [v23 VPN];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 protocol];
      id v25 = (void *)objc_claimAutoreleasedReturnValue();

      [v25 providerBundleIdentifier];
      int v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 pluginType];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v28 = +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v26,  v27,  5LL,  0LL);

      [v25 providerBundleIdentifier];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 pluginType];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = +[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:]( &OBJC_CLASS___NELaunchServices,  "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:",  v29,  v30,  2LL,  0LL);

      if (!(v28 | v31))
      {
        ne_log_obj();
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = *(id *)(a1 + 32);
          if (v34) {
            id v34 = objc_getProperty(v34, v33, 8LL, 1);
          }
          [v34 name];
          id v36 = (void *)objc_claimAutoreleasedReturnValue();
          id v37 = *(id *)(a1 + 32);
          if (v37) {
            id v37 = objc_getProperty(v37, v35, 8LL, 1);
          }
          [v37 identifier];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          int v39 = 138412546;
          int64_t v40 = (int64_t)v36;
          __int16 v41 = 2112;
          uint64_t v42 = v38;
          _os_log_impl( &dword_1876B1000,  v32,  OS_LOG_TYPE_DEFAULT,  "Provider is not available for %@ (%@)",  (uint8_t *)&v39,  0x16u);
        }

        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 2LL;
      }
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)cancelSessions:(void *)a3 withCompletionHandler:
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (a1)
  {
    if ([v5 count])
    {
      ne_log_obj();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1876B1000, v7, OS_LOG_TYPE_DEFAULT, "Canceling sessions", buf, 2u);
      }

      id v9 = objc_getProperty(a1, v8, 48LL, 1);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke;
      block[3] = &unk_18A08FB50;
      id v12 = v5;
      id v13 = v9;
      uint64_t v14 = v6;
      id v10 = (dispatch_queue_s *)v9;
      dispatch_async(v10, block);
    }

    else if (v6)
    {
      v6[2](v6);
    }
  }
}

void __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  v2 = dispatch_group_create();
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  uint64_t v4 = MEMORY[0x1895F87A8];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        SEL v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        dispatch_group_enter(v2);
        v16[0] = v4;
        v16[1] = 3221225472LL;
        v16[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_2;
        v16[3] = &unk_18A090390;
        __int16 v17 = v2;
        id v10 = v16;
        if (v8)
        {
          id Property = (dispatch_queue_s *)objc_getProperty(v8, v9, 40LL, 1);
          block[0] = v4;
          block[1] = 3221225472LL;
          block[2] = __56__NEVPNConnectivitySession_cancelWithCompletionHandler___block_invoke;
          block[3] = &unk_18A0908C8;
          void block[4] = v8;
          id v23 = v10;
          dispatch_async(Property, block);
        }
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v5);
  }

  v14[0] = v4;
  v14[1] = 3221225472LL;
  v14[2] = __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_18A090940;
  id v12 = *(dispatch_queue_s **)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  dispatch_group_notify(v2, v12, v14);
}

void __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __65__NEVPNConnectivityManager_cancelSessions_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __45__NEVPNConnectivityManager_initWithDelegate___block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "NEVPNConnectivityManager: Configurations changed", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[NEVPNConnectivityManager refreshConfigurations](WeakRetained, v4);
}

void __45__NEVPNConnectivityManager_initWithDelegate___block_invoke_29(uint64_t a1, const char *a2)
{
}

- (void)refreshConfigurations
{
  if (a1)
  {
    id v3 = objc_getProperty(a1, a2, 56LL, 1);
    objc_setProperty_atomic(a1, v4, 0LL, 56LL);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke;
    v5[3] = &unk_18A090390;
    v5[4] = a1;
    -[NEVPNConnectivityManager cancelSessions:withCompletionHandler:](a1, v3, v5);
  }

void __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40LL, 1);
  }
  id v5 = Property;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = objc_getProperty(v6, v4, 48LL, 1);
    uint64_t v8 = *(void *)(a1 + 32);
  }

  else
  {
    uint64_t v8 = 0LL;
    id v7 = 0LL;
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_2;
  v9[3] = &unk_18A090328;
  v9[4] = v8;
  [v5 loadConfigurationsWithCompletionQueue:v7 handler:v9];
}

void __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    ne_log_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = (uint64_t)v6;
      _os_log_error_impl( &dword_1876B1000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to load NetworkExtension configurations: %@",  buf,  0xCu);
    }
  }

  else
  {
    [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_15831];
    v35 = id v36 = v5;
    objc_msgSend(v5, "filteredArrayUsingPredicate:");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v43 = [v8 count];
      _os_log_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEFAULT, "Loaded %lu VPN configurations", buf, 0xCu);
    }

    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
          id v16 = objc_alloc(&OBJC_CLASS___NEVPNConnectivitySession);
          __int128 v18 = v16;
          __int128 v19 = *(void **)(a1 + 32);
          if (v19)
          {
            id Property = objc_getProperty(*(id *)(a1 + 32), v17, 48LL, 1);
            id v16 = v18;
            __int128 v21 = v15;
            uint64_t v22 = v19;
          }

          else
          {
            __int128 v21 = v15;
            uint64_t v22 = 0LL;
            id Property = 0LL;
          }

          id v23 = -[NEVPNConnectivitySession initWithConfiguration:delegate:queue:](v16, v21, v22, Property);
          ne_log_obj();
          id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = v24;
          if (v23)
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(objc_getProperty(v23, v26, 8, 1), "name");
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(objc_getProperty(v23, v28, 8, 1), "identifier");
              id v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = (uint64_t)v27;
              __int16 v44 = 2112;
              uint64_t v45 = v29;
              _os_log_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_DEFAULT,  "Now tracking VPN configuration %@ (%@)",  buf,  0x16u);
            }

            [v10 addObject:v23];
          }

          else
          {
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              [v15 name];
              id v30 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 identifier];
              uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              uint64_t v43 = (uint64_t)v30;
              __int16 v44 = 2112;
              uint64_t v45 = v31;
              _os_log_error_impl( &dword_1876B1000,  v25,  OS_LOG_TYPE_ERROR,  "Failed to track VPN configuration %@ (%@)",  buf,  0x16u);
            }
          }

          ++v14;
        }

        while (v12 != v14);
        uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        uint64_t v12 = v32;
      }

      while (v32);
    }

    id v34 = *(void **)(a1 + 32);
    if (v34)
    {
      objc_setProperty_atomic(v34, v33, v10, 56LL);
      id v34 = *(void **)(a1 + 32);
    }

    id v6 = 0LL;
    -[NEVPNConnectivityManager refreshConnectivityState](v34, v33);

    id v5 = v36;
    id v7 = (os_log_s *)v35;
  }
}

BOOL __49__NEVPNConnectivityManager_refreshConfigurations__block_invoke_45(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v2 VPN];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      BOOL v4 = 1LL;
    }

    else
    {
      [v2 appVPN];
      id v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        BOOL v4 = 1LL;
      }

      else
      {
        [v2 alwaysOnVPN];
        id v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          BOOL v4 = 1LL;
        }

        else
        {
          [v2 relay];
          id v7 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v4 = v7 != 0LL;
        }
      }
    }
  }

  else
  {
    BOOL v4 = 0LL;
  }

  return v4;
}

@end