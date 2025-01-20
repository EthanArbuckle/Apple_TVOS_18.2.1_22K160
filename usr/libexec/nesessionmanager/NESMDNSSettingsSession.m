@interface NESMDNSSettingsSession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (NESMDNSSettingsSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (int)type;
- (void)dealloc;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)install;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)uninstall;
@end

@implementation NESMDNSSettingsSession

- (NESMDNSSettingsSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___NESMDNSSettingsSession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v29, "initWithConfiguration:andServer:", v6, a4);
  v9 = v7;
  if (!v7)
  {
LABEL_6:
    uint64_t v23 = ne_log_obj(v7, v8);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ initialized DNS settings session", buf, 0xCu);
    }

    v25 = v9;
    goto LABEL_12;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dnsSettings]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 settings]);

  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 dnsSettings]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 settings]);
    settings = v9->_settings;
    v9->_settings = (NEDNSSettings *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 dnsSettings]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 onDemandRules]);
    onDemandRules = v9->_onDemandRules;
    v9->_onDemandRules = (NSArray *)v18;

    v9->_MCNotifyToken = -1;
    v20 = objc_alloc(&OBJC_CLASS___NESMPolicySession);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v22 = [v6 grade];
    if (v20) {
      v20 = (NESMPolicySession *)sub_10002E7FC((id *)&v20->super.isa, v21, 7, v22, (void *)1, (void *)1);
    }
    -[NESMSession setPolicySession:](v9, "setPolicySession:", v20);

    sub_10007AFD4(v9);
    goto LABEL_6;
  }

  uint64_t v26 = ne_log_obj(v12, v13);
  v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@ settings is nil", buf, 0xCu);
  }

  v25 = 0LL;
LABEL_12:

  return v25;
}

- (int)type
{
  return 7;
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  return !a3 || (a3 & 0xFFFFFFFD) == 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 384LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v14 = Property;
  if (v14 == v10)
  {
    unsigned int v15 = [v9 isEqualToString:@"bestAvailableNetworkDescription"];

    if (!v15) {
      goto LABEL_59;
    }
    v17 = objc_alloc_init(&OBJC_CLASS___NEOnDemandRuleConnect);
    if (self) {
      id v18 = objc_getProperty(self, v16, 384LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue([v18 bestAvailableNetworkDescription]);
    if (v20)
    {
      if (self) {
        id v21 = objc_getProperty(self, v19, 384LL, 1);
      }
      else {
        id v21 = 0LL;
      }
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 networkDescriptionArray]);
      id v23 = [v22 indexOfObject:v20];

      if (self) {
        id v25 = objc_getProperty(self, v24, 368LL, 1);
      }
      else {
        id v25 = 0LL;
      }
      id v26 = [v25 count];
      if (v26 > v23)
      {
        if (self) {
          id v28 = objc_getProperty(self, v27, 368LL, 1);
        }
        else {
          id v28 = 0LL;
        }
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 objectAtIndex:v23]);

        v17 = (NEOnDemandRuleConnect *)v29;
      }

      uint64_t v30 = ne_log_obj(v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        if (-[NEOnDemandRuleConnect action](v17, "action") == (id)3)
        {
          v55 = v20;
          v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v56 = v17;
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[NEOnDemandRuleConnect connectionRules](v17, "connectionRules"));
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          id v39 = [v38 countByEnumeratingWithState:&v57 objects:v61 count:16];
          if (v39)
          {
            id v41 = v39;
            uint64_t v42 = *(void *)v58;
            do
            {
              for (i = 0LL; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v58 != v42) {
                  objc_enumerationMutation(v38);
                }
                v44 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)i);
                if (objc_msgSend(v44, "action", v55) == (id)2)
                {
                  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 matchDomains]);
                  -[NSMutableArray addObjectsFromArray:](v37, "addObjectsFromArray:", v45);
                }
              }

              id v41 = [v38 countByEnumeratingWithState:&v57 objects:v61 count:16];
            }

            while (v41);
          }

          if (self) {
            id v46 = objc_getProperty(self, v40, 376LL, 1);
          }
          else {
            id v46 = 0LL;
          }
          v20 = v55;
          v17 = v56;
          unsigned int v47 = -[NSMutableArray isEqual:](v37, "isEqual:", v46, v55);
          int v49 = v47 ^ 1;
          if (self && (v47 & 1) == 0) {
            objc_setProperty_atomic(self, v48, v37, 376LL);
          }
        }

        else if (self)
        {
          int v49 = objc_getProperty(self, v36, 376LL, 1) != 0LL;
          objc_setProperty_atomic(self, v50, 0LL, 376LL);
        }

        else
        {
          int v49 = 0;
        }

        if (-[NESMSession status](self, "status") != 1
          && (-[NEOnDemandRuleConnect action](v17, "action") == (id)2
           || -[NEOnDemandRuleConnect action](v17, "action") == (id)4))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          [v51 requestUninstallForSession:self];
        }

        else
        {
          if (-[NESMSession status](self, "status") == 3
            || -[NEOnDemandRuleConnect action](v17, "action") != (id)1
            && -[NEOnDemandRuleConnect action](v17, "action") != (id)3)
          {
            if (-[NESMSession status](self, "status") == 3) {
              int v52 = v49;
            }
            else {
              int v52 = 0;
            }
            if (v52 == 1)
            {
              v53 = self;
              char v54 = 0;
            }

            else
            {
              if (!self || !self->_configurationUpdatePending) {
                goto LABEL_58;
              }
              self->_configurationUpdatePending = 0;
              v53 = self;
              char v54 = 1;
            }

            sub_10007DDF0(v53, v54);
LABEL_58:

            goto LABEL_59;
          }

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          [v51 requestInstallForSession:self withParentSession:0 exclusive:0];
        }

        goto LABEL_58;
      }

      *(_DWORD *)buf = 138412546;
      v63 = self;
      __int16 v64 = 2112;
      v65 = v17;
      v32 = "%@ Matched DNS On Demand rule %@";
      v33 = (os_log_s *)v31;
      uint32_t v34 = 22;
    }

    else
    {
      uint64_t v35 = ne_log_obj(0LL, v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v35);
      if (!os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v63 = self;
      v32 = "%@ Matched no DNS On Demand rule";
      v33 = (os_log_s *)v31;
      uint32_t v34 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    goto LABEL_22;
  }

LABEL_59:
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%@ handling start for DNS settings session",  buf,  0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMDNSSettingsSession;
  -[NESMSession handleStartMessage:](&v9, "handleStartMessage:", v4);

  sub_10007E22C(self, v8);
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = ne_log_obj(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%@ handling stop for DNS settings session",  buf,  0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NESMDNSSettingsSession;
  -[NESMSession handleStopMessageWithReason:](&v8, "handleStopMessageWithReason:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  [v7 requestUninstallForSession:self];
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v15.receiver = self,
        v15.super_class = (Class)&OBJC_CLASS___NESMDNSSettingsSession,
        -[NESMSession handleUpdateConfiguration:](&v15, "handleUpdateConfiguration:", v4)))
  {
    if (self) {
      self->_configurationUpdatePending = 1;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dnsSettings]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 settings]);
    if (self) {
      objc_setProperty_atomic(self, v6, v7, 360LL);
    }

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dnsSettings]);
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 onDemandRules]);
    v11 = v9;
    if (self)
    {
      objc_setProperty_atomic(self, v10, v9, 368LL);

      sub_10007E22C(self, v12);
    }

    else
    {
    }

    BOOL v13 = 1;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 == 1)
  {
    block[7] = v3;
    block[8] = v4;
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NESMSession queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007E154;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_async(v6, block);
  }

- (void)install
{
  uint64_t v3 = ne_log_obj(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ installing DNS settings session",  (uint8_t *)&v9,  0xCu);
  }

  sub_10007DDF0(self, 1);
  if (self && (id Property = objc_getProperty(self, v6, 360LL, 1)) != 0LL)
  {
    -[NESMSession setStatus:](self, "setStatus:", 3LL);
  }

  else
  {
    uint64_t v7 = ne_log_obj(Property, v6);
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ settings is not, not moving to connected",  (uint8_t *)&v9,  0xCu);
    }
  }

- (void)uninstall
{
  uint64_t v3 = ne_log_obj(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ uninstalling DNS settings session",  (uint8_t *)&v10,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002BCE0((uint64_t)v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dnsSettings]);
  unsigned __int8 v8 = [v7 isEnabled];

  if ((v8 & 1) == 0) {
    sub_10007DCD8(self, v9);
  }
  -[NESMSession setStatus:](self, "setStatus:", 1LL);
}

- (void)dealloc
{
  int MCNotifyToken = self->_MCNotifyToken;
  if ((MCNotifyToken & 0x80000000) == 0)
  {
    notify_cancel(MCNotifyToken);
    self->_int MCNotifyToken = -1;
  }

  sub_10007DCD8(self, a2);
  -[NESMDNSSettingsSession uninstall](self, "uninstall");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NESMDNSSettingsSession;
  -[NESMSession dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

@end