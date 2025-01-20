@interface IDSDXPCOffGridMessenger
- (BOOL)_isDeviceOnline;
- (BOOL)isCTClientActive;
- (IDSDXPCOffGridMessenger)initWithQueue:(id)a3;
- (IMNetworkConnectionMonitor)connectionMonitor;
- (NSMutableDictionary)clientRemoteObjectsByService;
- (OS_dispatch_queue)queue;
- (id)identifierFromMessage:(id)a3 senderURI:(id)a4 receiverURI:(id)a5 senderKey:(id)a6 ratchetCounter:(unsigned int)a7 authTag:(id)a8;
- (id)peerIDManager;
- (void)decryptOffGridMessage:(id)a3 completion:(id)a4;
- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6;
- (void)encryptOffGridMessage:(id)a3 completion:(id)a4;
- (void)incomingOffGridMessage:(id)a3 completion:(id)a4;
- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4;
- (void)monitorConnection:(id)a3;
- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 service:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sendFetchRequestForHandles:(id)a3 fromHandle:(id)a4 completion:(id)a5;
- (void)setClientRemoteObjectsByService:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setupOffGridMessengerClient:(id)a3 withUUID:(id)a4 forService:(id)a5;
@end

@implementation IDSDXPCOffGridMessenger

- (IDSDXPCOffGridMessenger)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IDSDXPCOffGridMessenger;
  v6 = -[IDSDXPCOffGridMessenger init](&v11, "init");
  if (v6)
  {
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Created IDSDXPCOffGridMessenger {self: %p}",  buf,  0xCu);
    }

    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[IMNetworkConnectionMonitor initWithRemoteHost:delegate:]( objc_alloc(&OBJC_CLASS___IMNetworkConnectionMonitor),  "initWithRemoteHost:delegate:",  0LL,  0LL);
    connectionMonitor = v6->_connectionMonitor;
    v6->_connectionMonitor = v8;
  }

  return v6;
}

- (void)monitorConnection:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "IDSDXPCOffGridMessenger monitoring new connection {self: %p, connection: %@}",  (uint8_t *)&v6,  0x16u);
  }
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance");
}

- (BOOL)isCTClientActive
{
  return 0;
}

- (void)setupOffGridMessengerClient:(id)a3 withUUID:(id)a4 forService:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([a3 remoteObjectProxy]);
    objc_super v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 134218498;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = v8;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Adding OffGrid messenger client {self: %p, uuid: %@, service: %@}",  (uint8_t *)&v29,  0x20u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
      if (!v13)
      {
        v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        -[IDSDXPCOffGridMessenger setClientRemoteObjectsByService:](self, "setClientRemoteObjectsByService:", v14);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v9]);

      if (!v16)
      {
        v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
        [v18 setObject:v17 forKeyedSubscript:v9];
      }

      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v9));
      [v19 setObject:v10 forKeyedSubscript:v8];
    }

    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v29 = 134218498;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error creating proxy for OffGrid messenger client {self: %p, uuid: %@, service: %@}",  (uint8_t *)&v29,  0x20u);
    }
  }

  else
  {
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 134218498;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Removing OffGrid messenger client {self: %p, uuid: %@, service: %@}",  (uint8_t *)&v29,  0x20u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v9]);
    [v22 setObject:0 forKeyedSubscript:v8];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:v9]);
    id v25 = [v24 count];

    if (!v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
      [v26 setObject:0 forKeyedSubscript:v9];
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOffGridMessenger clientRemoteObjectsByService](self, "clientRemoteObjectsByService"));
    id v28 = [v27 count];

    if (!v28) {
      -[IDSDXPCOffGridMessenger setClientRemoteObjectsByService:](self, "setClientRemoteObjectsByService:", 0LL);
    }
  }
}

- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Client request to donate handles for messaging keys { destinationURIs: %@ fromURI: %@ options: %@ }",  buf,  0x20u);
  }

  if (!v9 || ![v9 count])
  {
    uint64_t v20 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    id v32 = @"DestinationURIs cannot be nil or empty";
    v21 = &v32;
    v22 = &v31;
LABEL_10:
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v22,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  1LL,  v23));

    v12[2](v12, 0LL, v17);
    goto LABEL_11;
  }

  if (!v10
    || (v14 = (void *)objc_claimAutoreleasedReturnValue([v10 prefixedURI]),
        id v15 = [v14 length],
        v14,
        !v15))
  {
    uint64_t v20 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v30 = @"FromURI cannot be nil or empty";
    v21 = &v30;
    v22 = &v29;
    goto LABEL_10;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 senderKeyDistributionManager]);

  id v18 = [v11 priority];
  id v19 = [v11 isInitialDonation];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1002A718C;
  v24[3] = &unk_1008F9038;
  id v25 = v9;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  [v17 processDonatedHandlesForMessagingKeysWithUris:v25 fromURI:v26 priority:v18 isInitialDonation:v19 completion:v24];

LABEL_11:
}

- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 service:(id)a5 options:(id)a6 completion:(id)a7
{
  v12 = (char *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 allObjects]);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v18));

  unsigned __int8 v19 = [v15 cached];
  if (-[IDSDXPCOffGridMessenger _isDeviceOnline](self, "_isDeviceOnline"))
  {
    char v66 = v19;
  }

  else
  {
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Forcing cached results as we are offline",  buf,  2u);
    }

    char v66 = 1;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 serviceWithIdentifier:v14]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v21 registeredAccountsOnService:v23]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:]( &OBJC_CLASS___IDSQueryUtilities,  "accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:",  v24,  v13,  &__NSArray0__struct,  0LL));
  v68 = v25;
  if (v25)
  {
    v67 = v12;
    id v26 = v13;
    id v27 = v25;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 primaryRegistration]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 registrationCert]);

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities prefixedAliasStringToQueryFrom:withPreferredFromURI:]( &OBJC_CLASS___IDSQueryUtilities,  "prefixedAliasStringToQueryFrom:withPreferredFromURI:",  v27,  0LL));
    NSErrorUserInfoKey v31 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v30,  v14));

    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    v65 = v24;
    if (v31 && v29)
    {
      v63 = v26;
      v64 = (void *)v29;
      v73 = v17;
      v60 = (void (**)(void, void, void))v16;
      id v61 = v15;
      id v62 = v14;
      if (v33)
      {
        *(_DWORD *)buf = 138412290;
        v86 = v67;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Checking cache to get shortHandles for destinationURIs {%@}",  buf,  0xCu);
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 senderKeyDistributionManager]);

      __int128 v80 = 0u;
      __int128 v81 = 0u;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      obj = v67;
      id v36 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v79;
        do
        {
          for (i = 0LL; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v79 != v38) {
              objc_enumerationMutation(obj);
            }
            v40 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
            else {
              id v41 = v40;
            }
            v42 = v41;
            id v43 = objc_alloc_init(&OBJC_CLASS___IDSOffGridDeliveryQueryResult);
            [v43 setUri:v40];
            if ([v40 isTokenURI])
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue([v40 pushToken]);
              v45 = (void *)objc_claimAutoreleasedReturnValue([v40 tokenFreeURI]);
              [v35 markLastActivePeerToken:v44 localURI:v31 remoteURI:v45];
            }

            objc_msgSend(v43, "setHasUsableSenderKey:", objc_msgSend(v35, "hasUsableSenderKeyFor:from:", v42, v31));
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
            v47 = (void *)objc_claimAutoreleasedReturnValue([v46 shortHandleForURI:v42 fromURI:v31]);

            if (v47)
            {
              [v43 setShortHandle:v47];
              [v43 setStatus:1];
              [v72 removeObject:v40];
            }

            else
            {
              v48 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridMessenger]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridMessenger"));
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v86 = (const char *)v40;
                _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Missing short handle for %@ - returning status invalid",  buf,  0xCu);
              }

              [v43 setStatus:2];
            }

            -[NSMutableDictionary setObject:forKey:](v73, "setObject:forKey:", v43, v40);
          }

          id v37 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
        }

        while (v37);
      }

      if ((v66 & 1) != 0 || ![v72 count])
      {
        id v16 = v60;
        v17 = v73;
        ((void (**)(void, NSMutableDictionary *, void))v60)[2](v60, v73, 0LL);
        v12 = v67;
        id v14 = v62;
        id v13 = v63;
        id v15 = v61;
      }

      else
      {
        v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog IDSOffGridMessenger]( &OBJC_CLASS___IDSFoundationLog,  "IDSOffGridMessenger"));
        v12 = v67;
        id v14 = v62;
        id v13 = v63;
        id v15 = v61;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = (const char *)v72;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Still need to query shortHandles for uris {%@}",  buf,  0xCu);
        }

        id obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "__imArrayByApplyingBlock:", &stru_1008FF890));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
        uint64_t v69 = IDSServiceNameiMessage;
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_1002A7C4C;
        v74[3] = &unk_1008FF8B8;
        id v16 = v60;
        v77 = v60;
        v17 = v73;
        v75 = v73;
        id v76 = v72;
        LOBYTE(v59) = 0;
        [v50 startQueryForURIs:obja fromIdentity:v64 fromURI:v31 fromService:v69 forSending:0 forRefresh:0 isForced:v59 reason:@"ShortHandles" completionBlock:v74];
      }

      v54 = v64;
      v24 = v65;
    }

    else
    {
      if (v33)
      {
        v55 = @"NO";
        *(_DWORD *)buf = 136315906;
        v86 = "-[IDSDXPCOffGridMessenger resultsForDestinationURIs:senderURI:service:options:completion:]";
        if (v29) {
          v55 = @"YES";
        }
        __int16 v87 = 2112;
        id v88 = v14;
        __int16 v89 = 2112;
        v90 = v31;
        __int16 v91 = 2112;
        v92 = v55;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s: No registered account found for service %@. localURI {%@} cert {%@}",  buf,  0x2Au);
      }

      uint64_t v56 = IDSOffGridDeliveryErrorDomain;
      NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
      v84 = @"Failed to query due to nil local uri or cert";
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
      v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v56,  6LL,  v57));

      (*((void (**)(id, NSMutableDictionary *, void *))v16 + 2))(v16, v17, v58);
      v24 = v65;
      v54 = (void *)v29;
      id v13 = v26;
      v12 = v67;
    }
  }

  else
  {
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v86 = "-[IDSDXPCOffGridMessenger resultsForDestinationURIs:senderURI:service:options:completion:]";
      __int16 v87 = 2112;
      id v88 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "%s: No account found for service %@.",  buf,  0x16u);
    }

    uint64_t v52 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
    v94 = @"Failed to as there was no account found";
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v94,  &v93,  1LL));
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v52,  6LL,  v53));

    (*((void (**)(id, NSMutableDictionary *, void *))v16 + 2))(v16, v17, v54);
  }
}

- (void)encryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___IDSOffGridEncryptionProperties);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 persistenceManager]);

  v48 = (void *)v9;
  id v10 = -[IDSSenderKeyEncryptionController initWithPersistenceManager:]( objc_alloc(&OBJC_CLASS___IDSSenderKeyEncryptionController),  "initWithPersistenceManager:",  v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientURI]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 senderURI]);
  v47 = v10;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSenderKeyEncryptionController paddyEncryptData:to:from:]( v10,  "paddyEncryptData:to:from:",  v11,  v12,  v13));

  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 encryptedData]);
  if (!v15
    || (id v16 = (void *)v15,
        v17 = (void *)objc_claimAutoreleasedReturnValue([v14 error]),
        v17,
        v16,
        v17))
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 error]);
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v18);
  }

  v49 = (void (**)(void, void, void, void))v6;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v14 keyIndex]));
  [v7 setRatchetCounter:v19];

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v14 keyID]);
  uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subdataWithRange:", 0, 1));

  v50 = (void *)v21;
  [v7 setEncryptionKeyID:v21];
  v22 = (void *)objc_claimAutoreleasedReturnValue([v14 authTag]);
  [v7 setAuthTag:v22];

  [v7 setSegmentNumber:&off_1009478A8];
  [v7 setTotalSegments:&off_1009478A8];
  id v23 = objc_alloc(&OBJC_CLASS___IDSOffGridEncryptedMessage);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v14 encryptedData]);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 senderURI]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientURI]);
  id v27 = [v23 initWithMessage:v24 senderURI:v25 recipientURI:v26 encryptionProperties:v7];

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 message]);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v5 senderURI]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientURI]);
  NSErrorUserInfoKey v31 = (void *)objc_claimAutoreleasedReturnValue([v14 key]);
  id v32 = [v14 keyIndex];
  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue([v14 authTag]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue( -[IDSDXPCOffGridMessenger identifierFromMessage:senderURI:receiverURI:senderKey:ratchetCounter:authTag:]( self,  "identifierFromMessage:senderURI:receiverURI:senderKey:ratchetCounter:authTag:",  v28,  v29,  v30,  v31,  v32,  v33));
  [v27 setIdentifier:v34];

  __int16 v35 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
  [v27 setService:v35];

  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v5 senderURI]);
    id v46 = v7;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v5 recipientURI]);
    v44 = (void *)objc_claimAutoreleasedReturnValue([v14 encryptedData]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v44 debugDescription]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v50 debugDescription]);
    id v41 = (void *)objc_claimAutoreleasedReturnValue([v14 authTag]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 debugDescription]);
    *(_DWORD *)buf = 138413314;
    uint64_t v52 = v37;
    __int16 v53 = 2112;
    v54 = v38;
    __int16 v55 = 2112;
    uint64_t v56 = v39;
    __int16 v57 = 2112;
    v58 = v40;
    __int16 v59 = 2112;
    v60 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Encrypted off grid message {sURI: %@, rURI: %@, data: %@, kID: %@, (aTag: %@)}",  buf,  0x34u);

    id v7 = v46;
  }

  id v43 = (void *)objc_claimAutoreleasedReturnValue([v27 identifier]);
  ((void (**)(void, id, void *, void))v49)[2](v49, v27, v43, 0LL);
}

- (void)decryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v34 = self;
  id v38 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 persistenceManager]);

  id v37 = (void *)v7;
  id v8 = -[IDSSenderKeyEncryptionController initWithPersistenceManager:]( objc_alloc(&OBJC_CLASS___IDSSenderKeyEncryptionController),  "initWithPersistenceManager:",  v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v38 encryptionProperties]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 authTag]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v38 encryptionProperties]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 ratchetCounter]);

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v38 encryptionProperties]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 encryptionKeyID]);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v38 message]);
  id v16 = [v12 unsignedIntValue];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v38 senderURI]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v38 recipientURI]);
  id v36 = v8;
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( -[IDSSenderKeyEncryptionController paddyDecryptData:keyIndex:keyIDByte:from:to:]( v8,  "paddyDecryptData:keyIndex:keyIDByte:from:to:",  v15,  v16,  v14,  v17,  v18));

  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 decryptedData]);
  if (!v20
    || (uint64_t v21 = (void *)v20,
        v22 = (void *)objc_claimAutoreleasedReturnValue([v19 error]),
        v22,
        v21,
        v22))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "error", v34));
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0LL, 0LL, v23);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "decryptedData", v34));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v38 senderURI]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 originalRecipientURI]);
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 key]);
  id v28 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v35,  "identifierFromMessage:senderURI:receiverURI:senderKey:ratchetCounter:authTag:",  v24,  v25,  v26,  v27,  objc_msgSend(v12, "unsignedIntValue"),  v10));

  id v29 = objc_alloc(&OBJC_CLASS___IDSOffGridMessage);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v19 decryptedData]);
  NSErrorUserInfoKey v31 = (void *)objc_claimAutoreleasedReturnValue([v38 senderURI]);
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v19 originalRecipientURI]);
  id v33 = [v29 initWithMessage:v30 senderURI:v31 recipientURI:v32];

  (*((void (**)(id, id, void *, void))v5 + 2))(v5, v33, v28, 0LL);
}

- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
    id v8 = -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  IDSOffGridDeliveryErrorDomain,  1LL,  0LL);
    (*((void (**)(id, void, void, NSError *))a5 + 2))(v6, 0LL, 0LL, v8);
  }

- (void)sendFetchRequestForHandles:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v6 = a5;
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSError);
    id v8 = -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  IDSOffGridDeliveryErrorDomain,  1LL,  0LL);
    (*((void (**)(id, void, NSError *))a5 + 2))(v6, 0LL, v8);
  }

- (void)incomingOffGridMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v8 = IDSServiceNameiMessageLite;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjectsByService,  "objectForKeyedSubscript:",  IDSServiceNameiMessageLite,  0LL));
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjectsByService,  "objectForKeyedSubscript:",  v8));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

        [v16 incomingOffGridMessage:v6 completion:v7];
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v8 = IDSServiceNameiMessageLite;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjectsByService,  "objectForKeyedSubscript:",  IDSServiceNameiMessageLite,  0LL));
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v13);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientRemoteObjectsByService,  "objectForKeyedSubscript:",  v8));
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

        [v16 incomingOffGridSummaryMessage:v6 completion:v7];
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }
}

- (BOOL)_isDeviceOnline
{
  return -[IMNetworkConnectionMonitor isImmediatelyReachable]( self->_connectionMonitor,  "isImmediatelyReachable");
}

- (id)identifierFromMessage:(id)a3 senderURI:(id)a4 receiverURI:(id)a5 senderKey:(id)a6 ratchetCounter:(unsigned int)a7 authTag:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  unsigned int v31 = a7;
  id v17 = a8;
  __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v13 && v14 && v15 && v16 && v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v17;
      __int16 v36 = 2048;
      uint64_t v37 = a7;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Will generate offgrid message identifier from senderURI: %@, receiverURI: %@, authTag: %@, ratchetCounter: %ld",  buf,  0x2Au);
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    [v20 appendData:v13];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 unprefixedURI]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dataUsingEncoding:4]);
    [v20 appendData:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 unprefixedURI]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 dataUsingEncoding:4]);
    [v20 appendData:v24];

    [v20 appendData:v16];
    [v20 appendData:v17];
    [v20 appendBytes:&v31 length:4];
    *(void *)&__int128 v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v25;
    *(_OWORD *)&buf[16] = v25;
    __int128 v18 = v20;
    CC_SHA256(-[os_log_s bytes](v18, "bytes"), (CC_LONG)-[os_log_s length](v18, "length"), buf);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &buf[16], 16LL));
    v34[0] = 0xAAAAAAAAAAAAAAAALL;
    v34[1] = 0xAAAAAAAAAAAAAAAALL;
    [v26 getBytes:v34 length:16];
    id v27 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v34);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v27, "UUIDString"));
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSOffGridMessenger](&OBJC_CLASS___IDSFoundationLog, "IDSOffGridMessenger"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v32 = 138412290;
      id v33 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Generated offgrid message identifier: %@",  v32,  0xCu);
    }
  }

  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Error: cannot generate offgrid message identifier - one or more fields are null.",  buf,  2u);
    }

    id v28 = 0LL;
  }

  return v28;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)clientRemoteObjectsByService
{
  return self->_clientRemoteObjectsByService;
}

- (void)setClientRemoteObjectsByService:(id)a3
{
}

- (IMNetworkConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end