@interface NESMRelaySession
+ (BOOL)hasRequiredFrameworks;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (BOOL)shouldBeIdleForStatus:(int)a3;
- (NESMRelaySession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)copyExtendedStatus;
- (int)type;
- (void)dealloc;
- (void)handleGetInfoMessage:(id)a3 withType:(int)a4;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)install;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)uninstall;
@end

@implementation NESMRelaySession

- (NESMRelaySession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NESMRelaySession;
  v7 = -[NESMSession initWithConfiguration:andServer:](&v24, "initWithConfiguration:andServer:", v6, a4);
  v9 = v7;
  if (!v7)
  {
LABEL_6:
    uint64_t v18 = ne_log_obj(v7, v8);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ initialized relay session", buf, 0xCu);
    }

    v20 = v9;
    goto LABEL_12;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 relay]);

  if (v10)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v6 relay]);
    relayConfig = v9->_relayConfig;
    v9->_relayConfig = (NERelayConfiguration *)v13;

    v15 = objc_alloc(&OBJC_CLASS___NESMPolicySession);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v17 = [v6 grade];
    if (v15) {
      v15 = (NESMPolicySession *)sub_10002E7FC((id *)&v15->super.isa, v16, 9, v17, (void *)2, (void *)1);
    }
    -[NESMSession setPolicySession:](v9, "setPolicySession:", v15);

    sub_10007AFD4(v9);
    goto LABEL_6;
  }

  uint64_t v21 = ne_log_obj(v11, v12);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ relay configuration is nil", buf, 0xCu);
  }

  v20 = 0LL;
LABEL_12:

  return v20;
}

- (int)type
{
  return 9;
}

- (BOOL)shouldBeIdleForStatus:(int)a3
{
  if (a3 == 3) {
    return !sub_100075298(self, a2);
  }
  else {
    return a3 < 2;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (self) {
    id Property = objc_getProperty(self, v11, 424LL, 1);
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
    id v17 = objc_alloc_init(&OBJC_CLASS___NEOnDemandRuleConnect);
    if (self) {
      id v18 = objc_getProperty(self, v16, 424LL, 1);
    }
    else {
      id v18 = 0LL;
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue([v18 bestAvailableNetworkDescription]);
    if (v58)
    {
      if (self) {
        id v20 = objc_getProperty(self, v19, 424LL, 1);
      }
      else {
        id v20 = 0LL;
      }
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 networkDescriptionArray]);
      id v22 = [v21 indexOfObject:v58];

      if (self) {
        id v24 = objc_getProperty(self, v23, 408LL, 1);
      }
      else {
        id v24 = 0LL;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 onDemandRules]);
      id v26 = [v25 count];

      if (v26 > v22)
      {
        if (self) {
          id v29 = objc_getProperty(self, v28, 408LL, 1);
        }
        else {
          id v29 = 0LL;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 onDemandRules]);
        uint64_t v31 = objc_claimAutoreleasedReturnValue([v30 objectAtIndex:v22]);

        id v17 = (NEOnDemandRuleConnect *)v31;
      }

      uint64_t v32 = ne_log_obj(v27, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        if (-[NEOnDemandRuleConnect action](v17, "action") == (id)3)
        {
          v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          v57 = v17;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NEOnDemandRuleConnect connectionRules](v17, "connectionRules"));
          __int128 v59 = 0u;
          __int128 v60 = 0u;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          id v41 = [v40 countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (v41)
          {
            id v43 = v41;
            uint64_t v44 = *(void *)v60;
            do
            {
              for (i = 0LL; i != v43; i = (char *)i + 1)
              {
                if (*(void *)v60 != v44) {
                  objc_enumerationMutation(v40);
                }
                v46 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
                if ([v46 action] == (id)2)
                {
                  v47 = (void *)objc_claimAutoreleasedReturnValue([v46 matchDomains]);
                  -[NSMutableArray addObjectsFromArray:](v39, "addObjectsFromArray:", v47);
                }
              }

              id v43 = [v40 countByEnumeratingWithState:&v59 objects:v63 count:16];
            }

            while (v43);
          }

          if (self) {
            id v48 = objc_getProperty(self, v42, 432LL, 1);
          }
          else {
            id v48 = 0LL;
          }
          unsigned int v49 = -[NSMutableArray isEqual:](v39, "isEqual:", v48);
          int v51 = v49 ^ 1;
          if (self && (v49 & 1) == 0) {
            objc_setProperty_atomic(self, v50, v39, 432LL);
          }

          id v17 = v57;
        }

        else if (self)
        {
          int v51 = objc_getProperty(self, v38, 432LL, 1) != 0LL;
          objc_setProperty_atomic(self, v52, 0LL, 432LL);
        }

        else
        {
          int v51 = 0;
        }

        if (-[NESMSession status](self, "status") != 1
          && (-[NEOnDemandRuleConnect action](v17, "action") == (id)2
           || -[NEOnDemandRuleConnect action](v17, "action") == (id)4))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          [v53 requestUninstallForSession:self];
        }

        else
        {
          if (-[NESMSession status](self, "status") == 3
            || -[NEOnDemandRuleConnect action](v17, "action") != (id)1
            && -[NEOnDemandRuleConnect action](v17, "action") != (id)3)
          {
            if (-[NESMSession status](self, "status") == 3) {
              int v54 = v51;
            }
            else {
              int v54 = 0;
            }
            if (v54 == 1)
            {
              v55 = self;
              char v56 = 0;
            }

            else
            {
              if (!self || !self->_configurationUpdatePending) {
                goto LABEL_58;
              }
              self->_configurationUpdatePending = 0;
              v55 = self;
              char v56 = 1;
            }

            sub_100074B54(v55, v56);
LABEL_58:

            goto LABEL_59;
          }

          v53 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
          [v53 requestInstallForSession:self withParentSession:0 exclusive:0];
        }

        goto LABEL_58;
      }

      *(_DWORD *)buf = 138412546;
      v65 = self;
      __int16 v66 = 2112;
      v67 = v17;
      v34 = "%@ Matched Relay On Demand rule %@";
      v35 = (os_log_s *)v33;
      uint32_t v36 = 22;
    }

    else
    {
      uint64_t v37 = ne_log_obj(0LL, v19);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if (!os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v65 = self;
      v34 = "%@ Matched no Relay On Demand rule";
      v35 = (os_log_s *)v33;
      uint32_t v36 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
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
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ handling start for relay session", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMRelaySession;
  -[NESMSession handleStartMessage:](&v9, "handleStartMessage:", v4);

  sub_1000766C0(self, v8);
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = ne_log_obj(self, a2);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ handling stop for relay session", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NESMRelaySession;
  -[NESMSession handleStopMessageWithReason:](&v9, "handleStopMessageWithReason:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  [v7 requestUninstallForSession:self];

  if (self) {
    objc_setProperty_atomic(self, v8, 0LL, 472LL);
  }
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v11.receiver = self,
        v11.super_class = (Class)&OBJC_CLASS___NESMRelaySession,
        -[NESMSession handleUpdateConfiguration:](&v11, "handleUpdateConfiguration:", v4)))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 relay]);
    v7 = v5;
    if (self)
    {
      objc_setProperty_atomic(self, v6, v5, 408LL);

      sub_1000766C0(self, v8);
    }

    else
    {
    }

    BOOL v9 = 1;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
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
    block[2] = sub_100076658;
    block[3] = &unk_1000BEC08;
    block[4] = self;
    dispatch_async(v6, block);
  }

- (void)install
{
  selfa = self;
  uint64_t v2 = ne_log_obj(self, a2);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v167 = selfa;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ installing relay session", buf, 0xCu);
  }

  sub_100074304(selfa, v4);
  sub_10007441C(selfa, v5);
  if (!selfa)
  {
    sub_100074B54(0LL, 1);
    goto LABEL_80;
  }

  id v7 = objc_getProperty(selfa, v6, 408LL, 1);
  if (!v7) {
    goto LABEL_18;
  }
  BOOL v9 = v7;
  if ((objc_msgSend(objc_getProperty(selfa, v8, 408, 1), "isEnabled") & 1) == 0)
  {

    goto LABEL_18;
  }

  id v11 = objc_msgSend(objc_getProperty(selfa, v10, 408, 1), "relays");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = [v12 count] == 0;

  if (v13)
  {
LABEL_18:
    objc_setProperty_atomic(selfa, v8, 0LL, 360LL);
    objc_setProperty_atomic(selfa, v29, 0LL, 368LL);
    goto LABEL_19;
  }

  __int128 v162 = 0u;
  __int128 v163 = 0u;
  __int128 v160 = 0u;
  __int128 v161 = 0u;
  id v14 = objc_msgSend(objc_getProperty(selfa, v8, 408, 1), "relays");
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = [v15 countByEnumeratingWithState:&v160 objects:buf count:16];
  if (!v16)
  {

    v155 = (void *)nw_array_create();
    int v28 = 0;
    goto LABEL_23;
  }

  uint64_t v17 = *(void *)v161;
  int v18 = 1;
  int v19 = 1;
  do
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v161 != v17) {
        objc_enumerationMutation(v15);
      }
      uint64_t v21 = *(void **)(*((void *)&v160 + 1) + 8LL * (void)i);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "HTTP3RelayURL", selfa));
      BOOL v23 = v22 != 0LL;

      id v24 = (void *)objc_claimAutoreleasedReturnValue([v21 HTTP2RelayURL]);
      LODWORD(v21) = v24 != 0LL;

      v19 &= v23;
      v18 &= v21;
    }

    id v16 = [v15 countByEnumeratingWithState:&v160 objects:buf count:16];
  }

  while (v16);

  if (((v19 | v18) & 1) != 0)
  {
    v155 = (void *)nw_array_create();
    int v28 = v18 & ~v19;
    if ((v19 & v18) == 0)
    {
      v153 = 0LL;
      int v154 = 0;
      goto LABEL_24;
    }

- (void)uninstall
{
  uint64_t v3 = ne_log_obj(self, a2);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    uint64_t v17 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%@ uninstalling relay session",  (uint8_t *)&v16,  0xCu);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession policySession](self, "policySession"));
  sub_10002BCE0((uint64_t)v5);

  sub_100074304(self, v6);
  sub_10007441C(self, v7);
  if (self)
  {
    id Property = objc_getProperty(self, v8, 440LL, 1);
    if (Property)
    {
      id v10 = (nw_connection_group *)Property;
      objc_setProperty_atomic(self, v11, 0LL, 440LL);
      self->_dnsListenerPort = 0;
      nw_connection_group_cancel(v10);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession configuration](self, "configuration"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 relay]);
  unsigned __int8 v14 = [v13 isEnabled];

  if ((v14 & 1) == 0) {
    sub_1000741EC(self, v15);
  }
  if (self) {
    objc_setProperty_atomic(self, v15, 0LL, 472LL);
  }
  -[NESMSession setStatus:](self, "setStatus:", 1LL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NESMRelaySession;
  -[NESMSession dealloc](&v3, "dealloc");
}

- (void)handleGetInfoMessage:(id)a3 withType:(int)a4
{
  xpc_object_t xdict = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (a4 == 2)
  {
    id v7 = -[NESMRelaySession copyExtendedStatus](self, "copyExtendedStatus");
    if (v7)
    {
      uint64_t v8 = v7;
      BOOL v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
      xpc_dictionary_set_value(reply, "SessionInfo", v9);
    }
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(xdict);
  SEL v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v11, reply);
}

- (id)copyExtendedStatus
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v53.receiver = self;
  v53.super_class = (Class)&OBJC_CLASS___NESMRelaySession;
  id v4 = -[NESMSession copyExtendedStatus](&v53, "copyExtendedStatus");
  v42 = -[NSMutableDictionary initWithDictionary:](v3, "initWithDictionary:", v4);

  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v5, 472LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v7 = Property;
  id v8 = [v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v50;
    do
    {
      id v12 = 0LL;
      do
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)v12);
        if (self) {
          id v14 = objc_getProperty(self, v9, 472LL, 1);
        }
        else {
          id v14 = 0LL;
        }
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13, v42));
        [v15 timeIntervalSinceNow];
        double v17 = v16;

        if (v17 > 86400.0)
        {
          if (self) {
            id v18 = objc_getProperty(self, v9, 472LL, 1);
          }
          else {
            id v18 = 0LL;
          }
          [v18 removeObjectForKey:v13];
        }

        id v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v19 = [v7 countByEnumeratingWithState:&v49 objects:v55 count:16];
      id v10 = v19;
    }

    while (v19);
  }

  if (self) {
    id v21 = objc_getProperty(self, v20, 472LL, 1);
  }
  else {
    id v21 = 0LL;
  }
  id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "keysSortedByValueUsingComparator:", &stru_1000BE5D0, v42));
  BOOL v23 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v22;
  id v24 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v46;
    do
    {
      uint64_t v27 = 0LL;
      do
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v45 + 1) + 8LL * (void)v27);
        SEL v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v28,  @"LastCause");
        if (self)
        {
          id v31 = objc_msgSend(objc_getProperty(self, v30, 472, 1), "objectForKeyedSubscript:", v28);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          [v32 timeIntervalSince1970];
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v33,  @"TimeEpoch");

          id v35 = objc_getProperty(self, v34, 472LL, 1);
        }

        else
        {
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([0 objectForKeyedSubscript:v28]);
          [v38 timeIntervalSince1970];
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v39,  @"TimeEpoch");

          id v35 = 0LL;
        }

        uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 objectForKeyedSubscript:v28]);
        id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 description]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v29,  "setObject:forKeyedSubscript:",  v37,  @"TimeString");

        -[NSMutableArray addObject:](v23, "addObject:", v29);
        uint64_t v27 = (char *)v27 + 1;
      }

      while (v25 != v27);
      id v40 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      id v25 = v40;
    }

    while (v40);
  }

  [v43 setObject:v23 forKeyedSubscript:@"SortedRelayErrors"];
  return v43;
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if ((int)v4 <= 1103)
  {
    if ((v4 & 0x80000000) == 0)
    {
      if (!(_DWORD)v4) {
        goto LABEL_21;
      }
      if ((_DWORD)v4 != 60 && (_DWORD)v4 != 1100) {
        goto LABEL_28;
      }
      goto LABEL_19;
    }

    uint64_t v4 = 17LL;
  }

  else
  {
    if ((int)v4 <= 1203)
    {
      if ((v4 - 1104) >= 2)
      {
        if ((_DWORD)v4 != 1106)
        {
          if ((_DWORD)v4 != 1200) {
            goto LABEL_28;
          }
LABEL_19:
          uint64_t v4 = 20LL;
          goto LABEL_21;
        }

        goto LABEL_20;
      }

- (void).cxx_destruct
{
}

+ (BOOL)hasRequiredFrameworks
{
  return 1;
}

@end