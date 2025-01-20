@interface IDSIDStatusQueryController
+ (id)sharedInstance;
- (BOOL)allowProxyQueries;
- (BOOL)hasValidStatusForURI:(id)a3 fromURI:(id)a4 fromService:(id)a5;
- (IDSIDStatusDependencyProvider)dependencyProvider;
- (IDSIDStatusQueryController)init;
- (IDSIDStatusQueryController)initWithShouldAllowProxyQueries:(BOOL)a3 peerIDManager:(id)a4 userDefaults:(id)a5 statusDepencencyProvider:(id)a6;
- (IDSPeerIDManager)peerIDManager;
- (IMUserDefaults)userDefaults;
- (NSString)plistCachePath;
- (id)_cachedResultsForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5;
- (id)_loadLegacyCache;
- (id)_lookupDateForURI:(id)a3 fromService:(id)a4;
- (id)_negativeTTLForURI:(id)a3 fromService:(id)a4;
- (id)_plistFilePath;
- (id)_validExpiryForURI:(id)a3 fromService:(id)a4;
- (id)currentCache;
- (id)currentCacheForService:(id)a3;
- (id)idStatusCacheForService:(id)a3;
- (id)idStatusCaches;
- (unsigned)_IDStatusForURI:(id)a3 fromService:(id)a4;
- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5;
- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5 respectExpiry:(BOOL)a6;
- (void)_flush;
- (void)_loadCache;
- (void)_loadIfNeeded;
- (void)_lookupIDStatusForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12;
- (void)_pruneExpiredStatusUnknownEntries;
- (void)_purgeTimerFiredOnMain;
- (void)_saveCache;
- (void)_sendIDStatusChanges:(id)a3 forService:(id)a4 URI:(id)a5 success:(BOOL)a6 error:(id)a7;
- (void)_setPurgeTimer;
- (void)_updateCacheWithStatusUpdates:(id)a3 fromURI:(id)a4 fromService:(id)a5 success:(BOOL)a6 hadError:(BOOL)a7 negativeCacheHints:(id)a8;
- (void)_wipeLegacyCache;
- (void)addCompletionBlock:(id)a3 forUniqueIdentifier:(id)a4;
- (void)clearCache;
- (void)clearIDStatusCacheIfNeeded;
- (void)dealloc;
- (void)infoForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 infoType:(unint64_t)a7 infoOptions:(id)a8 lightQuery:(BOOL)a9 allowQuery:(BOOL)a10 reason:(id)a11 completion:(id)a12;
- (void)noteIncomingID:(id)a3 fromService:(id)a4;
- (void)remoteDevicesForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10;
- (void)removeCachedEntriesForService:(id)a3;
- (void)removeCachedIDStatusForURI:(id)a3 service:(id)a4;
- (void)removeCompletionBlockForUniqueIdentifier:(id)a3;
- (void)requestIDStatusForID:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10;
- (void)requestIDStatusForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12;
- (void)setAllowProxyQueries:(BOOL)a3;
- (void)setCachedIDStatus:(unsigned int)a3 ForID:(id)a4 fromURI:(id)a5 fromService:(id)a6;
- (void)setDependencyProvider:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPlistCachePath:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation IDSIDStatusQueryController

+ (id)sharedInstance
{
  if (qword_1009C0830 != -1) {
    dispatch_once(&qword_1009C0830, &stru_1008FF308);
  }
  return (id)qword_1009C0838;
}

- (IDSIDStatusQueryController)initWithShouldAllowProxyQueries:(BOOL)a3 peerIDManager:(id)a4 userDefaults:(id)a5 statusDepencencyProvider:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___IDSIDStatusQueryController;
  v14 = -[IDSIDStatusQueryController init](&v33, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_peerIDManager, a4);
    objc_storeStrong((id *)&v15->_userDefaults, a5);
    objc_storeStrong((id *)&v15->_dependencyProvider, a6);
    v15->_allowProxyQueries = a3;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v15);
    peerIDManager = v15->_peerIDManager;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10027638C;
    v30[3] = &unk_1008FBDD0;
    objc_copyWeak(&v31, &location);
    -[IDSPeerIDManager addCompletionBlock:forToken:]( peerIDManager,  "addCompletionBlock:forToken:",  v30,  @"IDSIDStatusQueryController");
    v17 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
    lock = v15->_lock;
    v15->_lock = v17;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1002768D0;
    v28[3] = &unk_1008F8A78;
    objc_copyWeak(&v29, &location);
    id v19 = [v28 copy];
    id purgeCancelBlock = v15->_purgeCancelBlock;
    v15->_id purgeCancelBlock = v19;

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100276910;
    v25[3] = &unk_1008F93E0;
    objc_copyWeak(&v27, &location);
    v21 = v15;
    v26 = v21;
    id v22 = [v25 copy];
    id purgeEnqueueBlock = v21->_purgeEnqueueBlock;
    v21->_id purgeEnqueueBlock = v22;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)_purgeTimerFiredOnMain
{
  uint64_t v3 = im_primary_queue(self, a2);
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100276A38;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v4, block);
}

- (IDSIDStatusQueryController)init
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMUserDefaults sharedDefaults](&OBJC_CLASS___IMUserDefaults, "sharedDefaults"));
  v5 = objc_alloc_init(&OBJC_CLASS___IDSIDStatusDependencyProvider);
  v6 = -[IDSIDStatusQueryController initWithShouldAllowProxyQueries:peerIDManager:userDefaults:statusDepencencyProvider:]( self,  "initWithShouldAllowProxyQueries:peerIDManager:userDefaults:statusDepencencyProvider:",  0LL,  v3,  v4,  v5);

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSIDStatusQueryController;
  -[IDSIDStatusQueryController dealloc](&v3, "dealloc");
}

- (void)_updateCacheWithStatusUpdates:(id)a3 fromURI:(id)a4 fromService:(id)a5 success:(BOOL)a6 hadError:(BOOL)a7 negativeCacheHints:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v97 = a5;
  id v90 = a8;
  v95 = v11;
  v98 = v12;
  if ([v11 count])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 prefixedURI]);
    id v14 = [v13 length];

    if (v14)
    {
      if ([v97 length])
      {
        -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
        -[NSRecursiveLock lock](self->_lock, "lock");
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v97));
        v15 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKey:v97]);
        v93 = -[NSMutableDictionary initWithDictionary:](v15, "initWithDictionary:", v16);

        -[IDSIDStatusDependencyProvider currentTime](self->_dependencyProvider, "currentTime");
        double v18 = v17;
        id v19 = v97;
        unsigned int v89 = [v97 isEqualToString:@"com.apple.madrid"];
        if (v89)
        {
          uint64_t v20 = OSLogHandleForIDSCategory("IDQuery");
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Will add valid expiry", buf, 2u);
          }

          id v19 = v97;
          if (os_log_shim_legacy_logging_enabled(v22))
          {
            MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Will add valid expiry");
            IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Will add valid expiry");
            id v19 = v97;
            if ((_IMWillLog(@"IDQuery", v23) & 1) != 0)
            {
              _IMAlwaysLog(0LL, @"IDQuery", @"Will add valid expiry");
              id v19 = v97;
            }
          }
        }

        uint64_t v24 = OSLogHandleForIDSCategory("IDQuery");
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v108 = v11;
          __int16 v109 = 2048;
          double v110 = v18;
          __int16 v111 = 2112;
          id v112 = v12;
          __int16 v113 = 2112;
          id v114 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Caching ID query responses: %@   date: %f   from URI: %@   from Service: %@ addValidExpiry",  buf,  0x2Au);
        }

        if (os_log_shim_legacy_logging_enabled(v26))
        {
          MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Caching ID query responses: %@   date: %f   from URI: %@   from Service: %@ addValidExpiry");
          id v84 = v12;
          id v85 = v97;
          double v83 = v18;
          id v82 = v11;
          IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Caching ID query responses: %@   date: %f   from URI: %@   from Service: %@ addValidExpiry");
          if ((_IMWillLog(@"IDQuery", v27) & 1) != 0)
          {
            id v84 = v12;
            id v85 = v97;
            double v83 = v18;
            id v82 = v11;
            _IMAlwaysLog( 0LL,  @"IDQuery",  @"Caching ID query responses: %@   date: %f   from URI: %@   from Service: %@ addValidExpiry");
          }
        }

        __int128 v103 = 0u;
        __int128 v104 = 0u;
        __int128 v101 = 0u;
        __int128 v102 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys", v82, *(void *)&v83, v84, v85));
        id v96 = [obj countByEnumeratingWithState:&v101 objects:v106 count:16];
        if (v96)
        {
          uint64_t v92 = *(void *)v102;
          do
          {
            for (i = 0LL; i != v96; i = (char *)i + 1)
            {
              if (*(void *)v102 != v92) {
                objc_enumerationMutation(obj);
              }
              id v29 = *(void **)(*((void *)&v101 + 1) + 8LL * (void)i);
              v99 = (void *)objc_claimAutoreleasedReturnValue([v95 objectForKey:v29]);
              unsigned int v30 = [v99 unsignedIntValue];
              unsigned int v31 = [v29 isEqualToURI:v98];
              if (v30 == 2) {
                unsigned int v32 = v31;
              }
              else {
                unsigned int v32 = 0;
              }
              if (v32 == 1)
              {
                uint64_t v33 = OSLogHandleForIDSCategory("IDQuery");
                v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Trying to cache Invalid for ourselves, ignoring...",  buf,  2u);
                }

                if (os_log_shim_legacy_logging_enabled(v35))
                {
                  MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Trying to cache Invalid for ourselves, ignoring...");
                  IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Trying to cache Invalid for ourselves, ignoring...");
                  if ((_IMWillLog(@"IDQuery", v36) & 1) != 0) {
                    _IMAlwaysLog(0LL, @"IDQuery", @"Trying to cache Invalid for ourselves, ignoring...");
                  }
                }
              }

              else
              {
                v37 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
                v38 = (void *)objc_claimAutoreleasedReturnValue([v29 prefixedURI]);
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v93, "objectForKey:", v38));
                CFMutableDictionaryRef theDict = -[NSMutableDictionary initWithDictionary:](v37, "initWithDictionary:", v39);

                v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
                -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v40, @"LookupDate");

                uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSNumber, v41);
                id v43 = v29;
                v44 = (void *)objc_claimAutoreleasedReturnValue([v90 objectForKey:v43]);
                if ((objc_opt_isKindOfClass(v44, v42) & 1) != 0)
                {
                  id v45 = v44;
                }

                else
                {
                  if (v44)
                  {
                    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
                    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v108 = v43;
                      __int16 v109 = 2112;
                      double v110 = *(double *)&v42;
                      _os_log_fault_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_FAULT,  "Failed type check! {key: %@, class: %@}",  buf,  0x16u);
                    }
                  }

                  id v45 = 0LL;
                }

                if (v45) {
                  CFDictionarySetValue(theDict, @"NegativeTTL", v45);
                }

                v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController peerIDManager](self, "peerIDManager"));
                id v105 = v43;
                v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v105,  1LL));
                v49 = (void *)objc_claimAutoreleasedReturnValue([v47 endpointsForURIs:v48 service:v97 fromURI:v98]);
                v50 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:v43]);
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "__imArrayByApplyingBlock:", &stru_1008FF350));
                v52 = (void *)objc_claimAutoreleasedReturnValue([v51 sortedArrayUsingComparator:&stru_1008FF390]);
                v53 = (void *)objc_claimAutoreleasedReturnValue([v52 firstObject]);

                if (v53) {
                  unsigned int v54 = v89;
                }
                else {
                  unsigned int v54 = 0;
                }
                if (v54 == 1)
                {
                  [v53 timeIntervalSinceNow];
                  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
                }

                else
                {
                  v55 = 0LL;
                }

                v56 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](theDict, "objectForKey:", @"IDStatus"));
                id v57 = [v56 intValue];

                v58 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController peerIDManager](self, "peerIDManager"));
                [v58 timeToCacheURI:v43 fromURI:v98 service:v97 forStatus:v57];
                double v60 = v59;

                +[IDSBagUtilities timeToCacheResultsForIDStatus:forService:]( &OBJC_CLASS___IDSBagUtilities,  "timeToCacheResultsForIDStatus:forService:",  0LL,  v97);
                if (v30)
                {
                  if (v30 == 1)
                  {
                    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
                    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v64, @"IDStatus");

                    if (v55) {
                      -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v55, @"ValidExpiry");
                    }
                  }

                  else if (v30 == 2)
                  {
                    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 2LL));
                    -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v62, @"IDStatus");
                  }
                }

                else
                {
                  v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v18 + v61 - v60));
                  -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v63, @"LookupDate");
                }

                v65 = (void *)objc_claimAutoreleasedReturnValue([v43 prefixedURI]);
                -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", theDict, v65);

                if (!v30 && !a6 && !a7)
                {
                  uint64_t v66 = OSLogHandleForIDSCategory("IDQuery");
                  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  " => Ignoring update to unknown, just updating the cache",  buf,  2u);
                  }

                  if (os_log_shim_legacy_logging_enabled(v68))
                  {
                    MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Ignoring update to unknown, just updating the cache");
                    IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Ignoring update to unknown, just updating the cache");
                    if ((_IMWillLog(@"IDQuery", v69) & 1) != 0) {
                      _IMAlwaysLog( 0LL,  @"IDQuery",  @" => Ignoring update to unknown, just updating the cache");
                    }
                  }
                }
              }
            }

            id v96 = [obj countByEnumeratingWithState:&v101 objects:v106 count:16];
          }

          while (v96);
        }

        if (-[NSMutableDictionary count](v93, "count")) {
          [v86 setObject:v93 forKey:v97];
        }
        else {
          [v86 removeObjectForKey:v97];
        }
        -[IDSIDStatusQueryController clearIDStatusCacheIfNeeded](self, "clearIDStatusCacheIfNeeded");
        -[IDSIDStatusQueryController _setPurgeTimer](self, "_setPurgeTimer");
        -[NSRecursiveLock unlock](self->_lock, "unlock");
      }

      else
      {
        uint64_t v78 = OSLogHandleForIDSCategory("IDQuery");
        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "No fromService, ignoring...", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled(v80))
        {
          MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"No fromService, ignoring...");
          IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"No fromService, ignoring...");
          if ((_IMWillLog(@"IDQuery", v81) & 1) != 0) {
            _IMAlwaysLog(0LL, @"IDQuery", @"No fromService, ignoring...");
          }
        }
      }
    }

    else
    {
      uint64_t v74 = OSLogHandleForIDSCategory("IDQuery");
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "No fromURI, ignoring...", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled(v76))
      {
        MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"No fromURI, ignoring...");
        IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"No fromURI, ignoring...");
        if ((_IMWillLog(@"IDQuery", v77) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @"No fromURI, ignoring...");
        }
      }
    }
  }

  else
  {
    uint64_t v70 = OSLogHandleForIDSCategory("IDQuery");
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "No updates, ignoring...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v72))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"No updates, ignoring...");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"No updates, ignoring...");
      if ((_IMWillLog(@"IDQuery", v73) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"No updates, ignoring...");
      }
    }
  }
}

- (unsigned)_IDStatusForURI:(id)a3 fromService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (sub_100277954((unint64_t)[v6 FZIDType], v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v7]);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 prefixedURI]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"IDStatus"]);
    unsigned int v13 = [v12 intValue];
  }

  else
  {
    unsigned int v13 = 2;
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");

  return v13;
}

- (void)removeCachedEntriesForService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
    -[NSRecursiveLock lock](self->_lock, "lock");
    uint64_t v5 = OSLogHandleForIDSCategory("IDQuery");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing cached entries {service: %@}",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v7))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Removing cached entries {service: %@}");
      id v10 = v4;
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Removing cached entries {service: %@}");
      if ((_IMWillLog(@"IDQuery", v8) & 1) != 0)
      {
        id v10 = v4;
        _IMAlwaysLog(0LL, @"IDQuery", @"Removing cached entries {service: %@}");
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v4, v10));
    [v9 removeObjectForKey:v4];

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (void)removeCachedIDStatusForURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
    -[NSRecursiveLock lock](self->_lock, "lock");
    v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v8));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);
    id v12 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v11);

    if (!v12 || !-[NSMutableDictionary count](v12, "count"))
    {
      uint64_t v13 = OSLogHandleForIDSCategory("IDQuery");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found no idStatusCache for the service: %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v15))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Found no idStatusCache for the service: %@");
        uint64_t v33 = v8;
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Found no idStatusCache for the service: %@");
        if ((_IMWillLog(@"IDQuery", v16) & 1) != 0)
        {
          uint64_t v33 = v8;
          _IMAlwaysLog(0LL, @"IDQuery", @"Found no idStatusCache for the service: %@");
        }
      }
    }

    double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prefixedURI", v33));
    double v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v17));

    if (v18)
    {
      uint64_t v19 = OSLogHandleForIDSCategory("IDQuery");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v37 = v6;
        __int16 v38 = 2112;
        v39 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Removing cached idStatus forURI: %@ service: %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v21))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Removing cached idStatus forURI: %@ service: %@");
        id v34 = v6;
        uint64_t v35 = v8;
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Removing cached idStatus forURI: %@ service: %@");
        if ((_IMWillLog(@"IDQuery", v22) & 1) != 0)
        {
          id v34 = v6;
          uint64_t v35 = v8;
          _IMAlwaysLog(0LL, @"IDQuery", @"Removing cached idStatus forURI: %@ service: %@");
        }
      }

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "prefixedURI", v34, v35));
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v23);
    }

    else
    {
      uint64_t v28 = OSLogHandleForIDSCategory("IDQuery");
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v37 = v6;
        __int16 v38 = 2112;
        v39 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "No idStatus to remove forURI: %@ service: %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v30))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"No idStatus to remove forURI: %@ service: %@");
        id v34 = v6;
        uint64_t v35 = v8;
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"No idStatus to remove forURI: %@ service: %@");
        if ((_IMWillLog(@"IDQuery", v31) & 1) != 0)
        {
          id v34 = v6;
          uint64_t v35 = v8;
          _IMAlwaysLog(0LL, @"IDQuery", @"No idStatus to remove forURI: %@ service: %@");
        }
      }
    }

    unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue( -[IDSIDStatusQueryController idStatusCacheForService:]( self,  "idStatusCacheForService:",  v8,  v34,  v35));
    [v32 setObject:v12 forKey:v8];

    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }

  else
  {
    uint64_t v24 = OSLogHandleForIDSCategory("IDQuery");
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "removeCachedIDStatusForURI needs a forURI and service -- returning",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v26))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"removeCachedIDStatusForURI needs a forURI and service -- returning");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"removeCachedIDStatusForURI needs a forURI and service -- returning");
      if ((_IMWillLog(@"IDQuery", v27) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"removeCachedIDStatusForURI needs a forURI and service -- returning");
      }
    }
  }
}

- (void)noteIncomingID:(id)a3 fromService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  if ([v7 length])
  {
    id v8 = [v6 FZIDType];
    if ([v7 length])
    {
      if ((sub_100277954((unint64_t)v8, v6) & 1) != 0)
      {
        -[NSRecursiveLock lock](self->_lock, "lock");
        if (-[IDSIDStatusQueryController _IDStatusForURI:fromService:](self, "_IDStatusForURI:fromService:", v6, v7) == 2)
        {
          v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v7));
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
          id v12 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v11);

          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 prefixedURI]);
          -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v7));
          [v14 setObject:v12 forKey:v7];
        }

        -[NSRecursiveLock unlock](self->_lock, "unlock");
      }

      else
      {
        uint64_t v27 = OSLogHandleForIDSCategory("IDQuery");
        uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v29))
        {
          MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
          IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
          if ((_IMWillLog(@"IDQuery", v30) & 1) != 0) {
            _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this");
          }
        }
      }
    }

    else
    {
      uint64_t v19 = OSLogHandleForIDSCategory("IDQuery");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v21))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
        if ((_IMWillLog(@"IDQuery", v22) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this");
        }
      }

      uint64_t v23 = OSLogHandleForIDSCategory("IDQuery");
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v25))
      {
        MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From Service: %@");
        IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From Service: %@");
        if ((_IMWillLog(@"IDQuery", v26) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @" => From Service: %@");
        }
      }
    }
  }

  else
  {
    uint64_t v15 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No fromService, ignoring...", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v17))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"No fromService, ignoring...");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"No fromService, ignoring...");
      if ((_IMWillLog(@"IDQuery", v18) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"No fromService, ignoring...");
      }
    }
  }
}

- (id)_cachedResultsForURIs:(id)a3 fromURI:(id)a4 fromService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[IDSIDStatusQueryController cachedIDStatusForID:fromURI:fromService:]( self,  "cachedIDStatusForID:fromURI:fromService:",  v16,  v9,  v10,  v19)));
        -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v17, v16);
      }

      id v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v13);
  }

  -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v11, v10);
  return v19;
}

- (id)_lookupDateForURI:(id)a3 fromService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"LookupDate"]);
  id v13 = [v12 copy];

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v13;
}

- (id)_validExpiryForURI:(id)a3 fromService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"ValidExpiry"]);
  id v13 = [v12 copy];

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v13;
}

- (id)_negativeTTLForURI:(id)a3 fromService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  -[NSRecursiveLock lock](self->_lock, "lock");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 prefixedURI]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v10]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"NegativeTTL"]);
  id v13 = [v12 copy];

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v13;
}

- (BOOL)hasValidStatusForURI:(id)a3 fromURI:(id)a4 fromService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[IDSIDStatusQueryController _IDStatusForURI:fromService:](self, "_IDStatusForURI:fromService:", v8, v10) == 2)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[IDSIDStatusQueryController _lookupDateForURI:fromService:]( self,  "_lookupDateForURI:fromService:",  v8,  v10));
    [v11 doubleValue];
    double v13 = v12;
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
    double v16 = vabdd_f64(Current, v13);
    [v15 timeToCacheURI:v8 fromURI:v9 service:v10 forStatus:2];
    double v18 = v17;

    BOOL v19 = v16 >= v18 || v11 == 0LL;
    BOOL v20 = v19;
    if (!v19)
    {
      uint64_t v21 = OSLogHandleForIDSCategory("IDQuery");
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        int v27 = 2;
        __int16 v28 = 2048;
        double v29 = Current;
        __int16 v30 = 2048;
        double v31 = v13;
        __int16 v32 = 2048;
        double v33 = v16;
        __int16 v34 = 2048;
        double v35 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  " => Not looking up... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f",  buf,  0x30u);
      }

      if (os_log_shim_legacy_logging_enabled(v23))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Not looking up... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Not looking up... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f");
        if ((_IMWillLog(@"IDQuery", v24) & 1) != 0) {
          _IMAlwaysLog( 0LL,  @"IDQuery",  @" => Not looking up... current status: %d  current time: %f   last looked up: %f  difference: %f  difference needed: %f");
        }
      }
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)_lookupIDStatusForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12
{
  BOOL v207 = a8;
  BOOL v191 = a7;
  id v199 = a3;
  id v197 = a4;
  id v209 = a5;
  id v211 = a6;
  v195 = (__CFString *)a11;
  id v16 = a12;
  v212 = self;
  if (!self->_allowProxyQueries)
  {
    if (![v199 count]
      || (id v67 = v16,
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v209 prefixedURI]),
          id v69 = [v68 length],
          v68,
          id v16 = v67,
          !v197)
      || !v69)
    {
      if (v16) {
        (*((void (**)(id, void, id, id, void, void))v16 + 2))(v16, 0LL, v209, v211, 0LL, 0LL);
      }
      goto LABEL_207;
    }
  }

  v196 = v16;
  double v17 = (void *)objc_claimAutoreleasedReturnValue(+[IDSTrafficMonitor sharedInstance](&OBJC_CLASS___IDSTrafficMonitor, "sharedInstance"));
  [v17 noteQueryRequestForService:v211 requestor:@"unknown"];

  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  v202 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v206 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v201 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[NSRecursiveLock lock](self->_lock, "lock");
  __int128 v229 = 0u;
  __int128 v230 = 0u;
  __int128 v227 = 0u;
  __int128 v228 = 0u;
  id obj = v199;
  id v19 = [obj countByEnumeratingWithState:&v227 objects:v242 count:16];
  if (!v19)
  {
    int v204 = 0;
    goto LABEL_79;
  }

  int v204 = 0;
  uint64_t v20 = *(void *)v228;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v228 != v20) {
        objc_enumerationMutation(obj);
      }
      __int128 v22 = *(void **)(*((void *)&v227 + 1) + 8LL * (void)i);
      id v23 = objc_msgSend( v22,  "FZIDType",  *(void *)&v180,  *(void *)&v187,  *(void *)&v188,  *(void *)&v189,  *(void *)&v190);
      -[NSMutableArray addObject:](v18, "addObject:", v22);
      if ((sub_100277954((unint64_t)v23, v22) & 1) == 0)
      {
        uint64_t v28 = OSLogHandleForIDSCategory("IDQuery");
        double v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v235 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v30))
        {
          MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
          double v180 = *(double *)&v22;
          IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
          if ((_IMWillLog(@"IDQuery", v31) & 1) != 0)
          {
            double v180 = *(double *)&v22;
            _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this");
          }
        }

        continue;
      }

      if (a9 && sub_10027B358())
      {
        uint64_t v24 = OSLogHandleForIDSCategory("IDQuery");
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v235 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  " => Forcing query for URI: %@",  buf,  0xCu);
        }

        if (os_log_shim_legacy_logging_enabled(v26))
        {
          MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => Forcing query for URI: %@");
          double v180 = *(double *)&v22;
          IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => Forcing query for URI: %@");
          if ((_IMWillLog(@"IDQuery", v27) & 1) != 0)
          {
            double v180 = *(double *)&v22;
            _IMAlwaysLog(0LL, @"IDQuery", @" => Forcing query for URI: %@");
          }
        }

- (void)requestIDStatusForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 forceQuery:(BOOL)a9 bypassLimit:(BOOL)a10 reason:(id)a11 completionBlock:(id)a12
{
  BOOL v43 = a7;
  BOOL v44 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a11;
  id v21 = a12;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  if (self->_allowProxyQueries) {
    goto LABEL_2;
  }
  if ([v19 length])
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v18 prefixedURI]);
    id v23 = [v22 length];
    if (v17 && v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v18 prefixedURI]);
      unsigned int v25 = [v24 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

      if (!v25) {
        goto LABEL_2;
      }
    }

    else
    {
    }
  }

  uint64_t v26 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this request",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v28))
  {
    MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this request");
    id v42 = v16;
    IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this request");
    if ((_IMWillLog(@"IDQuery", v29) & 1) != 0)
    {
      id v42 = v16;
      _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this request");
    }
  }

  uint64_t v30 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v18;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v32))
  {
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From URI: %@");
    id v42 = v18;
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From URI: %@");
    if ((_IMWillLog(@"IDQuery", v33) & 1) != 0)
    {
      id v42 = v18;
      _IMAlwaysLog(0LL, @"IDQuery", @" => From URI: %@");
    }
  }

  uint64_t v34 = OSLogHandleForIDSCategory("IDQuery");
  double v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v46 = v19;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v36))
  {
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From Service: %@");
    id v42 = v19;
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From Service: %@");
    if ((_IMWillLog(@"IDQuery", v37) & 1) != 0)
    {
      id v42 = v19;
      _IMAlwaysLog(0LL, @"IDQuery", @" => From Service: %@");
    }
  }

  if (!v17)
  {
    uint64_t v38 = OSLogHandleForIDSCategory("IDQuery");
    double v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  " *** Missing identity, failing query",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v40))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" *** Missing identity, failing query");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" *** Missing identity, failing query");
      if ((_IMWillLog(@"IDQuery", v41) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" *** Missing identity, failing query");
      }
    }
  }

  if (v21)
  {
    (*((void (**)(id, void, id, id, void, void))v21 + 2))(v21, 0LL, v18, v19, 0LL, 0LL);
    goto LABEL_3;
  }

- (void)requestIDStatusForID:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10
{
  BOOL v10 = a7;
  id v16 = a10;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  uint64_t v24 = IMSingleObjectArray(a3, v21, v22, v23);
  id v26 = (id)objc_claimAutoreleasedReturnValue(v24);
  LOWORD(v25) = 0;
  -[IDSIDStatusQueryController requestIDStatusForIDs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:]( self,  "requestIDStatusForIDs:fromIdentity:fromURI:fromService:lightQuery:allowQuery:forceQuery:bypassLimit:reason:completionBlock:",  v26,  v20,  v19,  v18,  v10,  v10,  v25,  v17,  v16);
}

- (void)setCachedIDStatus:(unsigned int)a3 ForID:(id)a4 fromURI:(id)a5 fromService:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  id v13 = [v10 FZIDType];
  if ([v12 length]
    && (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 prefixedURI]),
        id v15 = [v14 length],
        v14,
        v15))
  {
    if ((sub_100277954((unint64_t)v13, v10) & 1) != 0)
    {
      id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v8));
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v10);

      -[IDSIDStatusQueryController _updateCacheWithStatusUpdates:fromURI:fromService:success:hadError:negativeCacheHints:]( self,  "_updateCacheWithStatusUpdates:fromURI:fromService:success:hadError:negativeCacheHints:",  v16,  v11,  v12,  1LL,  0LL,  0LL);
    }

    else
    {
      uint64_t v30 = OSLogHandleForIDSCategory("IDQuery");
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID for: %@   ignoring this",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v32))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID for: %@   ignoring this");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID for: %@   ignoring this");
        if ((_IMWillLog(@"IDQuery", v33) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID for: %@   ignoring this");
        }
      }
    }
  }

  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory("IDQuery");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID for: %@   ignoring this",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v20))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID for: %@   ignoring this");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID for: %@   ignoring this");
      if ((_IMWillLog(@"IDQuery", v21) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID for: %@   ignoring this");
      }
    }

    uint64_t v22 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v24))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From URI: %@");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From URI: %@");
      if ((_IMWillLog(@"IDQuery", v25) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" => From URI: %@");
      }
    }

    uint64_t v26 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v28))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From Service: %@");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From Service: %@");
      if ((_IMWillLog(@"IDQuery", v29) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" => From Service: %@");
      }
    }
  }
}

- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5
{
  return -[IDSIDStatusQueryController cachedIDStatusForID:fromURI:fromService:respectExpiry:]( self,  "cachedIDStatusForID:fromURI:fromService:respectExpiry:",  a3,  a4,  a5,  0LL);
}

- (unsigned)cachedIDStatusForID:(id)a3 fromURI:(id)a4 fromService:(id)a5 respectExpiry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  id v13 = [v10 FZIDType];
  if (![v12 length]
    || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 prefixedURI]),
        id v15 = [v14 length],
        v14,
        !v15))
  {
    uint64_t v30 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v32))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this");
      if ((_IMWillLog(@"IDQuery", v33) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this");
      }
    }

    uint64_t v34 = OSLogHandleForIDSCategory("IDQuery");
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v11;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v36))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From URI: %@");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From URI: %@");
      if ((_IMWillLog(@"IDQuery", v37) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" => From URI: %@");
      }
    }

    uint64_t v38 = OSLogHandleForIDSCategory("IDQuery");
    double v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v12;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v40))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From Service: %@");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From Service: %@");
      if ((_IMWillLog(@"IDQuery", v41) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @" => From Service: %@");
      }
    }

    goto LABEL_25;
  }

  if ((sub_100277954((unint64_t)v13, v10) & 1) != 0)
  {
    uint64_t v16 = -[IDSIDStatusQueryController _IDStatusForURI:fromService:](self, "_IDStatusForURI:fromService:", v10, v12);
    uint64_t v17 = v16;
    if (v6 && (_DWORD)v16)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[IDSIDStatusQueryController _lookupDateForURI:fromService:]( self,  "_lookupDateForURI:fromService:",  v10,  v12));
      id v19 = v18;
      if (v18)
      {
        [v18 doubleValue];
        double v21 = v20;
        -[IDSIDStatusDependencyProvider currentTime](self->_dependencyProvider, "currentTime");
        double v23 = v22;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[IDSIDStatusQueryController _negativeTTLForURI:fromService:]( self,  "_negativeTTLForURI:fromService:",  v10,  v12));
        uint64_t v25 = objc_claimAutoreleasedReturnValue( -[IDSIDStatusQueryController _validExpiryForURI:fromService:]( self,  "_validExpiryForURI:fromService:",  v10,  v12));
        uint64_t v26 = (void *)v25;
        if (v24)
        {
          uint64_t v27 = v24;
        }

        else
        {
          if (!v25 || !sub_10027B3C0())
          {
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController peerIDManager](self, "peerIDManager"));
            [v47 timeToCacheURI:v10 fromURI:v11 service:v12 forStatus:v17];
            double v29 = v48;

            goto LABEL_37;
          }

          uint64_t v27 = v26;
        }

        [v27 doubleValue];
        double v29 = v28;
LABEL_37:
        double v49 = vabdd_f64(v23, v21);
        if (v49 < v29)
        {

          goto LABEL_32;
        }

        uint64_t v50 = OSLogHandleForIDSCategory("IDQuery");
        uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          id v55 = v10;
          __int16 v56 = 2112;
          id v57 = v11;
          __int16 v58 = 2048;
          double v59 = v49;
          __int16 v60 = 2048;
          double v61 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  " => Expired status -- returning unknown {URI: %@, fromURI: %@, difference: %f, timeNeeded: %f}",  buf,  0x2Au);
        }

        if (os_log_shim_legacy_logging_enabled(v52))
        {
          MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Expired status -- returning unknown {URI: %@, fromURI: %@, difference: %f, timeNeeded: %f}");
          IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Expired status -- returning unknown {URI: %@, fromURI: %@, difference: %f, timeNeeded: %f}");
          if ((_IMWillLog(@"IDQuery", v53) & 1) != 0) {
            _IMAlwaysLog( 0LL,  @"IDQuery",  @" => Expired status -- returning unknown {URI: %@, fromURI: %@, difference: %f, timeNeeded: %f}");
          }
        }
      }

- (id)currentCache
{
  uint64_t v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSRecursiveLock lock](self->_lock, "lock");
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  double v20 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCaches](self, "idStatusCaches"));
  id v23 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  id v3 = 0LL;
  id v4 = 0LL;
  if (v23)
  {
    uint64_t v22 = *(void *)v40;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v5;
        BOOL v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        id v28 = v6;
        id v27 = [v28 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v27)
        {
          uint64_t v26 = *(void *)v36;
          do
          {
            uint64_t v7 = 0LL;
            uint64_t v8 = v4;
            do
            {
              if (*(void *)v36 != v26) {
                objc_enumerationMutation(v28);
              }
              uint64_t v29 = *(void *)(*((void *)&v35 + 1) + 8 * v7);
              uint64_t v30 = v7;
              id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:"));

              id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              __int128 v33 = 0u;
              __int128 v34 = 0u;
              __int128 v31 = 0u;
              __int128 v32 = 0u;
              id v3 = v9;
              id v10 = [v3 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v10)
              {
                id v11 = v10;
                uint64_t v12 = *(void *)v32;
                do
                {
                  for (i = 0LL; i != v11; i = (char *)i + 1)
                  {
                    if (*(void *)v32 != v12) {
                      objc_enumerationMutation(v3);
                    }
                    uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
                    id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v14]);
                    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"IDStatus"]);
                    id v17 = [v16 copy];

                    if (v17) {
                      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, v14);
                    }
                  }

                  id v11 = [v3 countByEnumeratingWithState:&v31 objects:v43 count:16];
                }

                while (v11);
              }

              -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v4, v29);
              uint64_t v7 = v30 + 1;
              uint64_t v8 = v4;
            }

            while ((id)(v30 + 1) != v27);
            id v27 = [v28 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }

          while (v27);
        }

        uint64_t v5 = v24 + 1;
      }

      while ((id)(v24 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }

    while (v23);
  }

  -[NSRecursiveLock unlock](v20->_lock, "unlock");
  uint64_t v18 = v25;

  return v18;
}

- (id)currentCacheForService:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
    -[NSRecursiveLock lock](self->_lock, "lock");
    double v20 = self;
    double v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCacheForService:](self, "idStatusCacheForService:", v4));
    id v22 = v4;
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v13]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"IDStatus"]);
          id v16 = [v15 copy];

          if (v16) {
            -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v16, v13);
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v10);
    }

    id v17 = v21;
    id v4 = v22;
    -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v7, v22);
    -[NSRecursiveLock unlock](v20->_lock, "unlock");
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (void)remoteDevicesForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 lightQuery:(BOOL)a7 allowQuery:(BOOL)a8 reason:(id)a9 completionBlock:(id)a10
{
  BOOL v45 = a7;
  BOOL v46 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = a10;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  if (!self->_allowProxyQueries)
  {
    if ([v17 length])
    {
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v16 prefixedURI]);
      id v21 = [v20 length];
      if (v15 && v21)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 prefixedURI]);
        unsigned int v23 = [v22 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

        if (!v23) {
          goto LABEL_31;
        }
      }

      else
      {
      }
    }

    uint64_t v24 = OSLogHandleForIDSCategory("IDQuery");
    __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this request",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v26))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this request");
      id v44 = v14;
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this request");
      if ((_IMWillLog(@"IDQuery", v27) & 1) != 0)
      {
        id v44 = v14;
        _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this request");
      }
    }

    uint64_t v28 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v16;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v30))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From URI: %@");
      id v44 = v16;
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From URI: %@");
      if ((_IMWillLog(@"IDQuery", v31) & 1) != 0)
      {
        id v44 = v16;
        _IMAlwaysLog(0LL, @"IDQuery", @" => From URI: %@");
      }
    }

    uint64_t v32 = OSLogHandleForIDSCategory("IDQuery");
    __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v34))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From Service: %@");
      id v44 = v17;
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From Service: %@");
      if ((_IMWillLog(@"IDQuery", v35) & 1) != 0)
      {
        id v44 = v17;
        _IMAlwaysLog(0LL, @"IDQuery", @" => From Service: %@");
      }
    }

    if (!v15)
    {
      uint64_t v36 = OSLogHandleForIDSCategory("IDQuery");
      __int128 v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  " *** Missing identity, failing query",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v38))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" *** Missing identity, failing query");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" *** Missing identity, failing query");
        if ((_IMWillLog(@"IDQuery", v39) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @" *** Missing identity, failing query");
        }
      }
    }

    if (v19) {
      (*((void (**)(id, void, id, id, void, void))v19 + 2))(v19, 0LL, v16, v17, 0LL, 0LL);
    }
  }

- (void)infoForIDs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 infoType:(unint64_t)a7 infoOptions:(id)a8 lightQuery:(BOOL)a9 allowQuery:(BOOL)a10 reason:(id)a11 completion:(id)a12
{
  id v51 = a3;
  id v54 = a4;
  id v53 = a5;
  id v18 = a6;
  id v19 = a8;
  id v52 = a11;
  id v20 = a12;
  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  id v21 = self;
  if (!self->_allowProxyQueries)
  {
    if ([v18 length])
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v53 prefixedURI]);
      id v23 = [v22 length];
      if (v54 && v23)
      {
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v53 prefixedURI]);
        unsigned int v25 = [v24 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias];

        if (!v25) {
          goto LABEL_31;
        }
      }

      else
      {
      }
    }

    uint64_t v26 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  " => Bogus ID query for: %@   ignoring this request",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v28))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this request");
      id v47 = v51;
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" => Bogus ID query for: %@   ignoring this request");
      if ((_IMWillLog(@"IDQuery", v29) & 1) != 0)
      {
        id v47 = v51;
        _IMAlwaysLog(0LL, @"IDQuery", @" => Bogus ID query for: %@   ignoring this request");
      }
    }

    uint64_t v30 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v53;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " => From URI: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v32))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From URI: %@");
      id v47 = v53;
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From URI: %@");
      if ((_IMWillLog(@"IDQuery", v33) & 1) != 0)
      {
        id v47 = v53;
        _IMAlwaysLog(0LL, @"IDQuery", @" => From URI: %@");
      }
    }

    uint64_t v34 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v18;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, " => From Service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v36))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @" => From Service: %@");
      id v47 = v18;
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @" => From Service: %@");
      if ((_IMWillLog(@"IDQuery", v37) & 1) != 0)
      {
        id v47 = v18;
        _IMAlwaysLog(0LL, @"IDQuery", @" => From Service: %@");
      }
    }

    if (!v54)
    {
      uint64_t v38 = OSLogHandleForIDSCategory("IDQuery");
      uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  " *** Missing identity, failing query",  buf,  2u);
      }

      if (os_log_shim_legacy_logging_enabled(v40))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @" *** Missing identity, failing query");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @" *** Missing identity, failing query");
        if ((_IMWillLog(@"IDQuery", v41) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @" *** Missing identity, failing query");
        }
      }
    }

    if (v20) {
      (*((void (**)(id, void, id, id, void, void))v20 + 2))(v20, 0LL, v53, v18, 0LL, 0LL);
    }
  }

- (void)_sendIDStatusChanges:(id)a3 forService:(id)a4 URI:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v39 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v38 = v12;
  if ([v12 length]
    && (id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 prefixedURI]),
        id v16 = [v15 length],
        v15,
        v16))
  {
    uint64_t v17 = OSLogHandleForIDSCategory("IDQuery");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      id v19 = @"NO";
      id v46 = v39;
      if (v8) {
        id v19 = @"YES";
      }
      __int16 v47 = 2112;
      id v48 = v12;
      __int16 v49 = 2112;
      id v50 = v13;
      __int16 v51 = 2112;
      id v52 = v19;
      __int16 v53 = 2112;
      id v54 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Sending id status changes %@ for service %@ URI %@ success %@ error %@",  buf,  0x34u);
    }

    if (os_log_shim_legacy_logging_enabled(v20))
    {
      id v21 = v8 ? @"YES" : @"NO";
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Sending id status changes %@ for service %@ URI %@ success %@ error %@");
      uint64_t v36 = v21;
      id v37 = v14;
      uint64_t v34 = v38;
      id v35 = v13;
      id v33 = v39;
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Sending id status changes %@ for service %@ URI %@ success %@ error %@");
      if ((_IMWillLog(@"IDQuery", v22) & 1) != 0)
      {
        uint64_t v36 = v21;
        id v37 = v14;
        uint64_t v34 = v38;
        id v35 = v13;
        id v33 = v39;
        _IMAlwaysLog( 0LL,  @"IDQuery",  @"Sending id status changes %@ for service %@ URI %@ success %@ error %@");
      }
    }

    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v23 = -[NSMutableDictionary copy](self->_completionBlocks, "copy", v33, v34, v35, v36, v37);
    id v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v24)
    {
      unsigned int v25 = 0LL;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (i = 0LL; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_completionBlocks,  "objectForKey:",  *(void *)(*((void *)&v40 + 1) + 8LL * (void)i)));

          unsigned int v25 = v28;
          if (v28) {
            ((void (**)(void, id, id, void *, BOOL, id))v28)[2](v28, v39, v13, v38, v8, v14);
          }
        }

        id v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }

      while (v24);
    }
  }

  else
  {
    uint64_t v29 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Empty service or URI to send ID status changes",  buf,  2u);
    }

    if (os_log_shim_legacy_logging_enabled(v31))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Empty service or URI to send ID status changes");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Empty service or URI to send ID status changes");
      if ((_IMWillLog(@"IDQuery", v32) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"Empty service or URI to send ID status changes");
      }
    }
  }
}

- (void)addCompletionBlock:(id)a3 forUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [v6 copy];
      if (v8)
      {
        completionBlocks = self->_completionBlocks;
        if (!completionBlocks)
        {
          CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          uint64_t v11 = self->_completionBlocks;
          self->_completionBlocks = Mutable;

          completionBlocks = self->_completionBlocks;
        }

        id v12 = objc_retainBlock(v8);
        -[NSMutableDictionary setObject:forKey:](completionBlocks, "setObject:forKey:", v12, v7);
      }

      uint64_t v13 = OSLogHandleForIDSCategory("IDQuery");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = self->_completionBlocks;
        *(_DWORD *)buf = 138412546;
        id v27 = v7;
        __int16 v28 = 2112;
        uint64_t v29 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Completion block for uniqueID %@ added %@",  buf,  0x16u);
      }

      if (os_log_shim_legacy_logging_enabled(v16))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Completion block for uniqueID %@ added %@");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Completion block for uniqueID %@ added %@");
        if ((_IMWillLog(@"IDQuery", v17) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @"Completion block for uniqueID %@ added %@");
        }
      }
    }

    else
    {
      uint64_t v22 = OSLogHandleForIDSCategory("IDQuery");
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Empty completion block for uniqueID %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v24))
      {
        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Empty completion block for uniqueID %@");
        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Empty completion block for uniqueID %@");
        if ((_IMWillLog(@"IDQuery", v25) & 1) != 0) {
          _IMAlwaysLog(0LL, @"IDQuery", @"Empty completion block for uniqueID %@");
        }
      }
    }
  }

  else
  {
    uint64_t v18 = OSLogHandleForIDSCategory("IDQuery");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Empty uniqueID %@ for adding completion block",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v20))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Empty uniqueID %@ for adding completion block");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Empty uniqueID %@ for adding completion block");
      if ((_IMWillLog(@"IDQuery", v21) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"Empty uniqueID %@ for adding completion block");
      }
    }
  }
}

- (void)removeCompletionBlockForUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_completionBlocks, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_completionBlocks, "count"))
    {
      completionBlocks = self->_completionBlocks;
      self->_completionBlocks = 0LL;
    }

    uint64_t v6 = OSLogHandleForIDSCategory("IDQuery");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Removed completion block for uniqueID %@",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Removed completion block for uniqueID %@");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Removed completion block for uniqueID %@");
      if ((_IMWillLog(@"IDQuery", v9) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"Removed completion block for uniqueID %@");
      }
    }
  }

  else
  {
    uint64_t v10 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Empty uniqueID %@ for removing completion block",  buf,  0xCu);
    }

    if (os_log_shim_legacy_logging_enabled(v12))
    {
      MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Empty uniqueID %@ for removing completion block");
      IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Empty uniqueID %@ for removing completion block");
      if ((_IMWillLog(@"IDQuery", v13) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"Empty uniqueID %@ for removing completion block");
      }
    }
  }
}

- (void)clearCache
{
  uint64_t v2 = im_primary_queue(self, a2);
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_async(v3, self->_purgeCancelBlock);

  -[NSRecursiveLock lock](self->_lock, "lock");
  uint64_t v4 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "**** Forcing deleting of peer cache ****",  buf,  2u);
  }

  if (os_log_shim_legacy_logging_enabled(v6))
  {
    MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"**** Forcing deleting of peer cache ****");
    IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"**** Forcing deleting of peer cache ****");
    if ((_IMWillLog(@"IDQuery", v7) & 1) != 0) {
      _IMAlwaysLog(0LL, @"IDQuery", @"**** Forcing deleting of peer cache ****");
    }
  }

  -[IDSIDStatusQueryController _loadIfNeeded](self, "_loadIfNeeded");
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCaches](self, "idStatusCaches"));
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v9);
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
        id v12 = [v11 _copyForEnumerating];

        id v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v26;
          do
          {
            id v15 = 0LL;
            do
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v15);
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](&OBJC_CLASS___NSDictionary, "dictionary"));
              [v10 setObject:v17 forKey:v16];

              id v15 = (char *)v15 + 1;
            }

            while (v13 != v15);
            id v13 = [v12 countByEnumeratingWithState:&v25 objects:v34 count:16];
          }

          while (v13);
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v9 != v8);
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v8);
  }

  uint64_t v18 = OSLogHandleForIDSCategory("IDQuery");
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Forcing flush of peer cache", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v20))
  {
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Forcing flush of peer cache");
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Forcing flush of peer cache");
    if ((_IMWillLog(@"IDQuery", v21) & 1) != 0) {
      _IMAlwaysLog(0LL, @"IDQuery", @"Forcing flush of peer cache");
    }
  }

  -[IDSIDStatusQueryController _flush](self, "_flush");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_flush
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, self->_purgeCancelBlock);

  -[NSRecursiveLock lock](self->_lock, "lock");
  self->_loaded = 0;
  uint64_t v5 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forcing save of peer cache", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v7))
  {
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Forcing save of peer cache");
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Forcing save of peer cache");
    if ((_IMWillLog(@"IDQuery", v8) & 1) != 0) {
      _IMAlwaysLog(0LL, @"IDQuery", @"Forcing save of peer cache");
    }
  }

  -[IDSIDStatusQueryController _saveCache](self, "_saveCache");
  uint64_t v9 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Forcing flush of peer cache", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v11))
  {
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Forcing flush of peer cache");
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Forcing flush of peer cache");
    if ((_IMWillLog(@"IDQuery", v12) & 1) != 0) {
      _IMAlwaysLog(0LL, @"IDQuery", @"Forcing flush of peer cache");
    }
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController idStatusCaches](self, "idStatusCaches", 0LL));
  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) removeAllObjects];
        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v14);
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_setPurgeTimer
{
  uint64_t v3 = im_primary_queue(self, a2);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_async(v4, self->_purgeEnqueueBlock);
}

- (void)_loadIfNeeded
{
  if (!self->_loaded)
  {
    self->_loaded = 1;
    -[IDSIDStatusQueryController _loadCache](self, "_loadCache");
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
  -[IDSIDStatusQueryController _setPurgeTimer](self, "_setPurgeTimer");
}

- (void)_pruneExpiredStatusUnknownEntries
{
  id v56 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_standardIDStatusCache, "mutableCopy");
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  unint64_t v61 = self;
  id obj = self->_standardIDStatusCache;
  id v59 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v76,  16LL);
  if (v59)
  {
    uint64_t v58 = *(void *)v68;
    do
    {
      for (i = 0LL; i != v59; i = (char *)i + 1)
      {
        if (*(void *)v68 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = *(void **)(*((void *)&v67 + 1) + 8LL * (void)i);
        uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString, v3);
        if ((objc_opt_isKindOfClass(v62, v4) & 1) != 0)
        {
          if (([v62 isEqualToString:@"CacheVersion"] & 1) == 0)
          {
            id v57 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v61->_standardIDStatusCache,  "objectForKeyedSubscript:",  v62));
            uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
            if ((objc_opt_isKindOfClass(v57, v6) & 1) != 0)
            {
              id v7 = [v57 mutableCopy];
              __int128 v65 = 0u;
              __int128 v66 = 0u;
              __int128 v63 = 0u;
              __int128 v64 = 0u;
              id v8 = v57;
              id v9 = [v8 countByEnumeratingWithState:&v63 objects:v75 count:16];
              if (v9)
              {
                uint64_t v10 = *(void *)v64;
                do
                {
                  for (j = 0LL; j != v9; j = (char *)j + 1)
                  {
                    if (*(void *)v64 != v10) {
                      objc_enumerationMutation(v8);
                    }
                    uint64_t v12 = *(void *)(*((void *)&v63 + 1) + 8LL * (void)j);
                    id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v12, v53, v54));
                    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary, v14);
                    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
                    {
                      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"IDStatus"]);
                      uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber, v17);
                      if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
                      {
                        if (![v16 intValue])
                        {
                          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"LookupDate"]);
                          uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v20);
                          if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
                          {
                            [v19 doubleValue];
                            double v23 = v22;
                            -[IDSIDStatusDependencyProvider currentTime](v61->_dependencyProvider, "currentTime");
                            double v25 = v24;
                            +[IDSBagUtilities timeToCacheResultsForIDStatus:forService:]( &OBJC_CLASS___IDSBagUtilities,  "timeToCacheResultsForIDStatus:forService:",  0LL,  v62);
                            if (vabdd_f64(v25, v23) >= v26)
                            {
                              [v7 removeObjectForKey:v12];
                              uint64_t v27 = OSLogHandleForIDSCategory("IDQuery");
                              __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
                              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412546;
                                uint64_t v72 = v12;
                                __int16 v73 = 2112;
                                uint64_t v74 = v13;
                                _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Removing entry with unknown status {URI: %@, URIDict: %@}",  buf,  0x16u);
                              }

                              if (os_log_shim_legacy_logging_enabled(v29))
                              {
                                MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Removing entry with unknown status {URI: %@, URIDict: %@}");
                                uint64_t v53 = v12;
                                id v54 = v13;
                                IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Removing entry with unknown status {URI: %@, URIDict: %@}");
                                if ((_IMWillLog(@"IDQuery", v30) & 1) != 0)
                                {
                                  uint64_t v53 = v12;
                                  id v54 = v13;
                                  _IMAlwaysLog( 0LL,  @"IDQuery",  @"Removing entry with unknown status {URI: %@, URIDict: %@}");
                                }
                              }
                            }
                          }

                          else
                          {
                            [v7 removeObjectForKey:v12];
                            uint64_t v39 = OSLogHandleForIDSCategory("IDQuery");
                            __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Corrupted entry in cache (lookUpDate). Removing entry",  buf,  2u);
                            }

                            if (os_log_shim_legacy_logging_enabled(v41))
                            {
                              MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Corrupted entry in cache (lookUpDate). Removing entry");
                              IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Corrupted entry in cache (lookUpDate). Removing entry");
                              if ((_IMWillLog(@"IDQuery", v42) & 1) != 0) {
                                _IMAlwaysLog( 0LL,  @"IDQuery",  @"Corrupted entry in cache (lookUpDate). Removing entry");
                              }
                            }
                          }
                        }
                      }

                      else
                      {
                        [v7 removeObjectForKey:v12];
                        uint64_t v35 = OSLogHandleForIDSCategory("IDQuery");
                        uint64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
                        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Corrupted entry in cache (status). Removing entry",  buf,  2u);
                        }

                        if (os_log_shim_legacy_logging_enabled(v37))
                        {
                          MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Corrupted entry in cache (status). Removing entry");
                          IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Corrupted entry in cache (status). Removing entry");
                          if ((_IMWillLog(@"IDQuery", v38) & 1) != 0) {
                            _IMAlwaysLog( 0LL,  @"IDQuery",  @"Corrupted entry in cache (status). Removing entry");
                          }
                        }
                      }
                    }

                    else
                    {
                      [v7 removeObjectForKey:v12];
                      uint64_t v31 = OSLogHandleForIDSCategory("IDQuery");
                      __int128 v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Corrupted entry in cache (missing dict). Removing entry",  buf,  2u);
                      }

                      if (os_log_shim_legacy_logging_enabled(v33))
                      {
                        MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Corrupted entry in cache (missing dict). Removing entry");
                        IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Corrupted entry in cache (missing dict). Removing entry");
                        if ((_IMWillLog(@"IDQuery", v34) & 1) != 0) {
                          _IMAlwaysLog( 0LL,  @"IDQuery",  @"Corrupted entry in cache (missing dict). Removing entry");
                        }
                      }
                    }
                  }

                  id v9 = [v8 countByEnumeratingWithState:&v63 objects:v75 count:16];
                }

                while (v9);
              }

              id v43 = [v7 copy];
              -[NSMutableDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v43, v62);
            }

            else
            {
              -[NSMutableDictionary removeObjectForKey:](v56, "removeObjectForKey:", v62);
              uint64_t v48 = OSLogHandleForIDSCategory("IDQuery");
              __int16 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Non-dict value in cache (service) -- Removing",  buf,  2u);
              }

              if (os_log_shim_legacy_logging_enabled(v50))
              {
                MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Non-dict value in cache (service) -- Removing");
                IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Non-dict value in cache (service) -- Removing");
                if ((_IMWillLog(@"IDQuery", v51) & 1) != 0) {
                  _IMAlwaysLog(0LL, @"IDQuery", @"Non-dict value in cache (service) -- Removing");
                }
              }
            }
          }
        }

        else
        {
          -[NSMutableDictionary removeObjectForKey:](v56, "removeObjectForKey:", v62);
          uint64_t v44 = OSLogHandleForIDSCategory("IDQuery");
          id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Non-string key in cache (service) -- Removing",  buf,  2u);
          }

          if (os_log_shim_legacy_logging_enabled(v46))
          {
            MarcoLogMadridLevel( @"IDSDaemonQueries",  0LL,  @"IDQuery",  @"Non-string key in cache (service) -- Removing");
            IMLogString( 0LL,  @"IDSIDQuery",  @"IDS",  @"IDQuery",  @"Non-string key in cache (service) -- Removing");
            if ((_IMWillLog(@"IDQuery", v47) & 1) != 0) {
              _IMAlwaysLog(0LL, @"IDQuery", @"Non-string key in cache (service) -- Removing");
            }
          }
        }
      }

      id v59 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v67,  v76,  16LL);
    }

    while (v59);
  }

  standardIDStatusCache = v61->_standardIDStatusCache;
  v61->_standardIDStatusCache = v56;
}

- (id)_plistFilePath
{
  plistCachePath = self->_plistCachePath;
  if (plistCachePath) {
    return plistCachePath;
  }
  uint64_t v4 = NSHomeDirectory();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11[0] = v5;
  v11[1] = @"/Library/IdentityServices/";
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v6));

  v10[0] = v7;
  v10[1] = @"idstatuscache.plist";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v10, 2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v8));

  return v9;
}

- (void)_loadCache
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController _plistFilePath](self, "_plistFilePath"));
  uint64_t v4 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](v4, "valueForKey:", @"CacheVersion"));
  if (v6
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && (int)[v6 intValue] > 0)
  {
    if (v4) {
      goto LABEL_9;
    }
  }

  else
  {
  }

  uint64_t v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController _loadLegacyCache](self, "_loadLegacyCache"));
  if (v4)
  {
    -[IDSIDStatusQueryController _wipeLegacyCache](self, "_wipeLegacyCache");
LABEL_9:
    p_standardIDStatusCache = (id *)&self->_standardIDStatusCache;
    standardIDStatusCache = self->_standardIDStatusCache;
    if (standardIDStatusCache)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](standardIDStatusCache, "addEntriesFromDictionary:", v4);
    }

    else
    {
      uint64_t v12 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v4);
      id v13 = *p_standardIDStatusCache;
      id *p_standardIDStatusCache = v12;
    }

    goto LABEL_15;
  }

  p_standardIDStatusCache = (id *)&self->_standardIDStatusCache;
  if (!self->_standardIDStatusCache)
  {
    uint64_t v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v11 = *p_standardIDStatusCache;
    id *p_standardIDStatusCache = v10;
  }

  uint64_t v4 = 0LL;
LABEL_15:
  -[IDSIDStatusQueryController _pruneExpiredStatusUnknownEntries](self, "_pruneExpiredStatusUnknownEntries");
  uint64_t v14 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = [*p_standardIDStatusCache count];
    *(_DWORD *)buf = 67109120;
    unsigned int v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded cache: %d items", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v17))
  {
    id v19 = [*p_standardIDStatusCache count];
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Loaded cache: %d items");
    id v20 = objc_msgSend(*p_standardIDStatusCache, "count", v19);
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Loaded cache: %d items");
    if ((_IMWillLog(@"IDQuery", v18) & 1) != 0)
    {
      objc_msgSend(*p_standardIDStatusCache, "count", v20);
      _IMAlwaysLog(0LL, @"IDQuery", @"Loaded cache: %d items");
    }
  }
}

- (id)_loadLegacyCache
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController userDefaults](self, "userDefaults"));
  id v4 = [v3 copyKeyListForAppID:@"com.apple.identityservices.idstatuscache"];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController userDefaults](self, "userDefaults"));
    id v6 = [v5 copyValueForKey:@"CacheVersion" appID:@"com.apple.identityservices.idstatuscache"];

    if (v6
      && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber, v7), (objc_opt_isKindOfClass(v6, v8) & 1) != 0)
      && (int)[v6 intValue] >= 1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController userDefaults](self, "userDefaults"));
      id v10 = [v9 copyMultipleForCurrentKeys:v4 appID:@"com.apple.identityservices.idstatuscache"];
    }

    else
    {
      id v10 = 0LL;
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_wipeLegacyCache
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController userDefaults](self, "userDefaults"));
  id v4 = [v3 copyKeyListForAppID:@"com.apple.identityservices.idstatuscache"];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController userDefaults](self, "userDefaults"));
    [v5 setMultiple:0 remove:v4 appID:@"com.apple.identityservices.idstatuscache"];

    uint64_t v6 = OSLogHandleForIDSCategory("IDQuery");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finished wipe of legacy cache", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v8))
    {
      MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Finished wipe of legacy cache");
      IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Finished wipe of legacy cache");
      if ((_IMWillLog(@"IDQuery", v9) & 1) != 0) {
        _IMAlwaysLog(0LL, @"IDQuery", @"Finished wipe of legacy cache");
      }
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController userDefaults](self, "userDefaults"));
    [v10 synchronizeAppID:@"com.apple.identityservices.idstatuscache"];
  }

  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_saveCache
{
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = OSLogHandleForIDSCategory("IDQuery");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = -[NSMutableDictionary count](self->_standardIDStatusCache, "count");
    *(_DWORD *)buf = 67109120;
    unsigned int v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving cache: %d items", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled(v7))
  {
    id v12 = -[NSMutableDictionary count](self->_standardIDStatusCache, "count");
    MarcoLogMadridLevel(@"IDSDaemonQueries", 0LL, @"IDQuery", @"Saving cache: %d items");
    id v11 = -[NSMutableDictionary count](self->_standardIDStatusCache, "count", v12);
    IMLogString(0LL, @"IDSIDQuery", @"IDS", @"IDQuery", @"Saving cache: %d items");
    if ((_IMWillLog(@"IDQuery", v8) & 1) != 0)
    {
      id v11 = -[NSMutableDictionary count](self->_standardIDStatusCache, "count", v11);
      _IMAlwaysLog(0LL, @"IDQuery", @"Saving cache: %d items");
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSIDStatusQueryController _plistFilePath](self, "_plistFilePath", v11));
  id v10 = -[NSMutableDictionary mutableCopy](self->_standardIDStatusCache, "mutableCopy");
  [v10 setObject:&off_1009476C8 forKey:@"CacheVersion"];
  [v10 writeToFile:v9 atomically:1];

  objc_autoreleasePoolPop(v3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (id)idStatusCacheForService:(id)a3
{
  id v4 = a3;
  if (qword_1009C0848 != -1) {
    dispatch_once(&qword_1009C0848, &stru_1008FF470);
  }
  if (byte_1009C0840 && IDSShouldUseRestrictedLoggingForService(v4))
  {
    restrictedIDStatusCache = self->_restrictedIDStatusCache;
    p_restrictedIDStatusCache = &self->_restrictedIDStatusCache;
    uint64_t v5 = restrictedIDStatusCache;
    if (!restrictedIDStatusCache) {
      goto LABEL_8;
    }
  }

  else
  {
    standardIDStatusCache = self->_standardIDStatusCache;
    p_restrictedIDStatusCache = &self->_standardIDStatusCache;
    uint64_t v5 = standardIDStatusCache;
    if (!standardIDStatusCache)
    {
LABEL_8:
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      id v10 = *p_restrictedIDStatusCache;
      *p_restrictedIDStatusCache = (NSMutableDictionary *)Mutable;

      uint64_t v5 = *p_restrictedIDStatusCache;
    }
  }

  id v11 = v5;

  return v11;
}

- (void)clearIDStatusCacheIfNeeded
{
  if (!-[NSMutableDictionary count](self->_restrictedIDStatusCache, "count"))
  {
    restrictedIDStatusCache = self->_restrictedIDStatusCache;
    self->_restrictedIDStatusCache = 0LL;
  }

  if (!-[NSMutableDictionary count](self->_standardIDStatusCache, "count"))
  {
    standardIDStatusCache = self->_standardIDStatusCache;
    self->_standardIDStatusCache = 0LL;
  }

- (id)idStatusCaches
{
  restrictedIDStatusCache = self->_restrictedIDStatusCache;
  if (!self->_standardIDStatusCache)
  {
    if (!restrictedIDStatusCache) {
      return &__NSArray0__struct;
    }
    unsigned int v6 = self->_restrictedIDStatusCache;
    p_standardIDStatusCache = &v6;
    goto LABEL_7;
  }

  if (!restrictedIDStatusCache)
  {
    standardIDStatusCache = self->_standardIDStatusCache;
    p_standardIDStatusCache = &standardIDStatusCache;
LABEL_7:
    uint64_t v4 = 1LL;
    return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  p_standardIDStatusCache,  v4));
  }

  v8[0] = self->_standardIDStatusCache;
  v8[1] = restrictedIDStatusCache;
  p_standardIDStatusCache = (NSMutableDictionary **)v8;
  uint64_t v4 = 2LL;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  p_standardIDStatusCache,  v4));
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (IDSIDStatusDependencyProvider)dependencyProvider
{
  return self->_dependencyProvider;
}

- (void)setDependencyProvider:(id)a3
{
}

- (NSString)plistCachePath
{
  return self->_plistCachePath;
}

- (void)setPlistCachePath:(id)a3
{
}

- (BOOL)allowProxyQueries
{
  return self->_allowProxyQueries;
}

- (void)setAllowProxyQueries:(BOOL)a3
{
  self->_allowProxyQueries = a3;
}

- (void).cxx_destruct
{
}

@end