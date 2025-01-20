@interface OTSOSActualAdapter
+ (id)sosCKKSViewList;
- (BOOL)essential;
- (BOOL)joinAfterRestore:(id *)a3;
- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4;
- (BOOL)resetToOffering:(id *)a3;
- (BOOL)safariViewSyncingEnabled:(id *)a3;
- (BOOL)sosEnabled;
- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4;
- (CKKSListenerCollection)peerChangeListeners;
- (NSString)description;
- (NSString)providerID;
- (id)currentSOSSelf:(id *)a3;
- (id)currentState;
- (id)fetchSelfPeers:(id *)a3;
- (id)fetchTrustedPeers:(id *)a3;
- (id)initAsEssential:(BOOL)a3;
- (int)circleStatus:(id *)a3;
- (void)registerForPeerChangeUpdates:(id)a3;
- (void)sendSelfPeerChangedUpdate;
- (void)sendTrustedPeerSetChangedUpdate;
- (void)setEssential:(BOOL)a3;
- (void)setPeerChangeListeners:(id)a3;
@end

@implementation OTSOSActualAdapter

- (id)initAsEssential:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___OTSOSActualAdapter;
  v4 = -[OTSOSActualAdapter init](&v18, "init");
  v5 = v4;
  if (v4)
  {
    v4->_essential = a3;
    providerID = v4->_providerID;
    v4->_providerID = (NSString *)@"[OTSOSActualAdapter]";

    v7 = -[CKKSListenerCollection initWithName:]( objc_alloc(&OBJC_CLASS___CKKSListenerCollection),  "initWithName:",  @"ckks-sos");
    peerChangeListeners = v5->_peerChangeListeners;
    v5->_peerChangeListeners = v7;

    v9 = v5;
    int out_token = 0;
    v10 = (const char *)kSOSCCCircleOctagonKeysChangedNotification;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000797B4;
    v15[3] = &unk_100291E20;
    v13 = v9;
    v16 = v13;
    notify_register_dispatch(v10, &out_token, v12, v15);
  }

  return v5;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OTSOSActualAdapter e:%d>",  -[OTSOSActualAdapter essential](self, "essential"));
}

- (int)circleStatus:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    id v8 = 0LL;
    int v5 = SOSCCThisDeviceIsInCircle(&v8, v4);
    id v6 = v8;
    if (a3 && v8)
    {
      *a3 = v8;
    }

    else if (v8)
    {
      id v8 = 0LL;
      CFRelease(v6);
    }
  }

  else
  {
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    }
    return -1;
  }

  return v5;
}

- (id)currentSOSSelf:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    uint64_t v48 = 0LL;
    v49 = &v48;
    uint64_t v50 = 0x3032000000LL;
    v51 = sub_100078E78;
    v52 = sub_100078E88;
    id v53 = 0LL;
    uint64_t v42 = 0LL;
    v43 = &v42;
    uint64_t v44 = 0x3032000000LL;
    v45 = sub_100078E78;
    v46 = sub_100078E88;
    id v47 = 0LL;
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_100078E78;
    v40 = sub_100078E88;
    id v41 = 0LL;
    id obj = 0LL;
    uint64_t v35 = 0LL;
    unsigned int v5 = -[OTSOSActualAdapter circleStatus:](self, "circleStatus:", &obj);
    objc_storeStrong(&v41, obj);
    if (v5)
    {
      if (!v37[5])
      {
        uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  24LL,  @"Not in SOS circle, but no error returned"));
        v7 = (void *)v37[5];
        v37[5] = v6;
      }

      id v8 = sub_10001267C("SecError");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v5 + 1 > 4) {
          v10 = @"kSOSCCError";
        }
        else {
          v10 = off_100291C60[v5 + 1];
        }
        uint64_t v27 = v37[5];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Not in circle : %@ %@",  buf,  0x16u);
      }

      v11 = 0LL;
      if (a3) {
        *a3 = (id) v37[5];
      }
      goto LABEL_37;
    }

    v12 = (void *)sub_1001CC59C((CFTypeRef *)&v35);
    if (!v12 || v35)
    {
      v22 = (void *)v37[5];
      v37[5] = v35;

      if (!v37[5])
      {
        uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  24LL,  @"No SOS peer info available, but no error returned"));
        v24 = (void *)v37[5];
        v37[5] = v23;
      }

      v25 = sub_10001267C("SecError");
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Error fetching self peer : %@",  buf,  0xCu);
      }

      if (a3)
      {
        id v21 = (id) v37[5];
        goto LABEL_28;
      }
    }

    else
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000796F0;
      v33[3] = &unk_100284538;
      v33[4] = &v36;
      v33[5] = &v48;
      v33[6] = &v42;
      v13 = v33;
      CFTypeRef v54 = 0LL;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1001D39F0;
      v56 = &unk_100293708;
      v14 = v13;
      id v57 = v14;
      sub_1001C44A8(&v54, buf);
      CFTypeRef v15 = v54;
      if (v54)
      {
        CFTypeRef v54 = 0LL;
        CFRelease(v15);
      }

      if (!v37[5])
      {
        v28 = objc_alloc(&OBJC_CLASS___CKKSSOSSelfPeer);
        uint64_t v29 = v43[5];
        uint64_t v30 = v49[5];
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[OTSOSActualAdapter sosCKKSViewList](&OBJC_CLASS___OTSOSActualAdapter, "sosCKKSViewList"));
        v11 = -[CKKSSOSSelfPeer initWithSOSPeerID:encryptionKey:signingKey:viewList:]( v28,  "initWithSOSPeerID:encryptionKey:signingKey:viewList:",  v12,  v29,  v30,  v31);

        goto LABEL_36;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](&OBJC_CLASS___CKKSLockStateTracker, "globalTracker"));
      unsigned __int8 v17 = [v16 isLockedError:v37[5]];

      if ((v17 & 1) == 0)
      {
        objc_super v18 = sub_10001267C("SecError");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = v37[5];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: Error fetching self encryption keys: %@",  buf,  0xCu);
        }
      }

      if (a3)
      {
        id v21 = (id) v37[5];
LABEL_28:
        v11 = 0LL;
        *a3 = v21;
LABEL_36:

LABEL_37:
        _Block_object_dispose(&v36, 8);

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v48, 8);

        return v11;
      }
    }

    v11 = 0LL;
    goto LABEL_36;
  }

  v11 = 0LL;
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
  }
  return v11;
}

- (id)fetchSelfPeers:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter currentSOSSelf:](self, "currentSOSSelf:", a3));
    if (v5) {
      uint64_t v6 = -[CKKSSelves initWithCurrent:allSelves:]( objc_alloc(&OBJC_CLASS___CKKSSelves),  "initWithCurrent:allSelves:",  v5,  0LL);
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    }
  }

  return v6;
}

- (id)fetchTrustedPeers:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    uint64_t v17 = 0LL;
    objc_super v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    uint64_t v20 = sub_100078E78;
    id v21 = sub_100078E88;
    id v22 = (id)0xAAAAAAAAAAAAAAAALL;
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    uint64_t v11 = 0LL;
    v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    v14 = sub_100078E78;
    CFTypeRef v15 = sub_100078E88;
    id v16 = 0LL;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100079314;
    v10[3] = &unk_100284560;
    v10[4] = &v11;
    v10[5] = &v17;
    uint64_t v4 = v10;
    CFTypeRef v25 = 0LL;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001D4B8C;
    v23[3] = &unk_100293708;
    unsigned int v5 = v4;
    id v24 = v5;
    sub_1001C44A8(&v25, v23);
    CFTypeRef v6 = v25;
    if (v25)
    {
      CFTypeRef v25 = 0LL;
      CFRelease(v6);
    }

    if (a3)
    {
      v7 = (void *)v12[5];
      if (v7) {
        *a3 = v7;
      }
    }

    id v8 = (id)v18[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
    return v8;
  }

  else
  {
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    }
    return 0LL;
  }

- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 publicSigningKey]);
    if ([v7 _secKey])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 publicEncryptionKey]);
      id v9 = [v8 _secKey];

      if (v9)
      {
        uint64_t v80 = 0LL;
        v81 = &v80;
        uint64_t v82 = 0x2020000000LL;
        unint64_t v83 = 0xAAAAAAAAAAAAAAAALL;
        v10 = (void *)objc_claimAutoreleasedReturnValue([v6 signingKey]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 keyData]);

        unint64_t v83 = v11;
        uint64_t v76 = 0LL;
        v77 = &v76;
        uint64_t v78 = 0x2020000000LL;
        unint64_t v79 = 0xAAAAAAAAAAAAAAAALL;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionKey]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 keyData]);

        unint64_t v79 = v13;
        uint64_t v72 = 0LL;
        v73 = &v72;
        uint64_t v74 = 0x2020000000LL;
        unint64_t v75 = 0xAAAAAAAAAAAAAAAALL;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 publicSigningKey]);
        id v15 = [v14 _secKey];

        if (v15) {
          CFRetain(v15);
        }
        unint64_t v75 = (unint64_t)v15;
        uint64_t v68 = 0LL;
        v69 = &v68;
        uint64_t v70 = 0x2020000000LL;
        unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 publicEncryptionKey]);
        id v17 = [v16 _secKey];

        if (v17) {
          CFRetain(v17);
        }
        unint64_t v71 = (unint64_t)v17;
        uint64_t v64 = 0LL;
        v65 = &v64;
        uint64_t v66 = 0x2020000000LL;
        unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v6 signingKey]);
        id v19 = [v18 _secKey];

        if (v19) {
          CFRetain(v19);
        }
        unint64_t v67 = (unint64_t)v19;
        uint64_t v60 = 0LL;
        v61 = &v60;
        uint64_t v62 = 0x2020000000LL;
        unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionKey]);
        id v21 = [v20 _secKey];

        if (v21) {
          CFRetain(v21);
        }
        unint64_t v63 = (unint64_t)v21;
        id v23 = objc_msgSend((id)objc_opt_class(CKKSAnalytics, v22), "logger");
        id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        CFTypeRef v25 = (void *)objc_claimAutoreleasedReturnValue( [v24 startLogSystemMetricsForActivityNamed:@"OctagonSOSAdapterUpdateKeys"]);

        uint64_t v56 = 0LL;
        id v57 = &v56;
        uint64_t v58 = 0x2020000000LL;
        char v59 = -86;
        uint64_t v50 = 0LL;
        v51 = &v50;
        uint64_t v52 = 0x3032000000LL;
        id v53 = sub_100078E78;
        CFTypeRef v54 = sub_100078E88;
        id v55 = 0LL;
        uint64_t v26 = v81[3];
        uint64_t v27 = v77[3];
        uint64_t v28 = v65[3];
        uint64_t v29 = v61[3];
        uint64_t v30 = v73[3];
        uint64_t v31 = v69[3];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_100079168;
        v40[3] = &unk_100284588;
        id v32 = v25;
        id v41 = v32;
        uint64_t v42 = &v56;
        v43 = &v50;
        uint64_t v44 = &v80;
        v45 = &v76;
        v46 = &v72;
        id v47 = &v68;
        uint64_t v48 = &v64;
        v49 = &v60;
        v33 = v40;
        CFTypeRef v95 = 0LL;
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v85 = 3221225472LL;
        v86 = sub_1001D4840;
        v87 = &unk_100293758;
        uint64_t v89 = v26;
        uint64_t v90 = v27;
        uint64_t v91 = v30;
        uint64_t v92 = v31;
        v34 = v33;
        id v88 = v34;
        uint64_t v93 = v28;
        uint64_t v94 = v29;
        sub_1001C44A8(&v95, buf);
        CFTypeRef v35 = v95;
        if (v95)
        {
          CFTypeRef v95 = 0LL;
          CFRelease(v35);
        }

        if (a4) {
          *a4 = (id) v51[5];
        }
        BOOL v36 = *((_BYTE *)v57 + 24) != 0;

        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(&v56, 8);

        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);
        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&v72, 8);
        _Block_object_dispose(&v76, 8);
        _Block_object_dispose(&v80, 8);
        goto LABEL_23;
      }
    }

    else
    {
    }

    v37 = sub_10001267C("octagon-preload-keys");
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "no octagon keys available skipping updating SOS record",  buf,  2u);
    }

    BOOL v36 = 1;
  }

  else
  {
    BOOL v36 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    }
  }

- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 publicSigningKey]);
    if ([v7 _secKey])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 publicEncryptionKey]);
      id v9 = [v8 _secKey];

      if (v9)
      {
        uint64_t v91 = 0LL;
        uint64_t v92 = &v91;
        uint64_t v93 = 0x2020000000LL;
        unint64_t v94 = 0xAAAAAAAAAAAAAAAALL;
        v10 = (void *)objc_claimAutoreleasedReturnValue([v6 signingKey]);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 keyData]);

        unint64_t v94 = v11;
        uint64_t v87 = 0LL;
        id v88 = &v87;
        uint64_t v89 = 0x2020000000LL;
        unint64_t v90 = 0xAAAAAAAAAAAAAAAALL;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionKey]);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 keyData]);

        unint64_t v90 = v13;
        v85[0] = 0LL;
        v85[1] = v85;
        v85[2] = 0x2020000000LL;
        unint64_t v86 = 0xAAAAAAAAAAAAAAAALL;
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 publicSigningKey]);
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 keyData]);

        unint64_t v86 = v15;
        v83[0] = 0LL;
        v83[1] = v83;
        v83[2] = 0x2020000000LL;
        unint64_t v84 = 0xAAAAAAAAAAAAAAAALL;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 publicEncryptionKey]);
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 keyData]);

        unint64_t v84 = v17;
        uint64_t v79 = 0LL;
        uint64_t v80 = &v79;
        uint64_t v81 = 0x2020000000LL;
        unint64_t v82 = 0xAAAAAAAAAAAAAAAALL;
        objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v6 publicSigningKey]);
        id v19 = [v18 _secKey];

        if (v19) {
          CFRetain(v19);
        }
        unint64_t v82 = (unint64_t)v19;
        uint64_t v75 = 0LL;
        uint64_t v76 = &v75;
        uint64_t v77 = 0x2020000000LL;
        unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 publicEncryptionKey]);
        id v21 = [v20 _secKey];

        if (v21) {
          CFRetain(v21);
        }
        unint64_t v78 = (unint64_t)v21;
        uint64_t v71 = 0LL;
        uint64_t v72 = &v71;
        uint64_t v73 = 0x2020000000LL;
        unint64_t v74 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v6 signingKey]);
        id v23 = [v22 _secKey];

        if (v23) {
          CFRetain(v23);
        }
        unint64_t v74 = (unint64_t)v23;
        uint64_t v67 = 0LL;
        uint64_t v68 = &v67;
        uint64_t v69 = 0x2020000000LL;
        unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v6 encryptionKey]);
        id v25 = [v24 _secKey];

        if (v25) {
          CFRetain(v25);
        }
        uint64_t v44 = a4;
        unint64_t v70 = (unint64_t)v25;
        id v27 = objc_msgSend((id)objc_opt_class(CKKSAnalytics, v26), "logger");
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 startLogSystemMetricsForActivityNamed:@"OctagonSOSAdapterUpdateKeys"]);

        uint64_t v63 = 0LL;
        uint64_t v64 = &v63;
        uint64_t v65 = 0x2020000000LL;
        char v66 = -86;
        uint64_t v57 = 0LL;
        uint64_t v58 = &v57;
        uint64_t v59 = 0x3032000000LL;
        uint64_t v60 = sub_100078E78;
        v61 = sub_100078E88;
        id v62 = 0LL;
        uint64_t v30 = v92[3];
        uint64_t v31 = v88[3];
        uint64_t v32 = v80[3];
        uint64_t v33 = v76[3];
        uint64_t v34 = v72[3];
        uint64_t v35 = v68[3];
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_100078F9C;
        v45[3] = &unk_1002845B0;
        id v36 = v29;
        id v46 = v36;
        id v47 = &v63;
        uint64_t v48 = &v57;
        v49 = &v91;
        uint64_t v50 = &v87;
        v51 = v85;
        uint64_t v52 = v83;
        id v53 = &v79;
        CFTypeRef v54 = &v75;
        id v55 = &v71;
        uint64_t v56 = &v67;
        v37 = v45;
        CFTypeRef v106 = 0LL;
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v96 = 3221225472LL;
        v97 = sub_1001D41A4;
        v98 = &unk_100293758;
        uint64_t v100 = v30;
        uint64_t v101 = v31;
        uint64_t v102 = v32;
        uint64_t v103 = v33;
        uint64_t v38 = v37;
        id v99 = v38;
        uint64_t v104 = v34;
        uint64_t v105 = v35;
        sub_1001C44A8(&v106, buf);
        CFTypeRef v39 = v106;
        if (v106)
        {
          CFTypeRef v106 = 0LL;
          CFRelease(v39);
        }

        if (v44) {
          *uint64_t v44 = (id) v58[5];
        }
        BOOL v40 = *((_BYTE *)v64 + 24) != 0;

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(&v63, 8);

        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);
        _Block_object_dispose(v83, 8);
        _Block_object_dispose(v85, 8);
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(&v91, 8);
        goto LABEL_23;
      }
    }

    else
    {
    }

    id v41 = sub_10001267C("octagon-sos");
    uint64_t v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "no octagon keys available skipping updating SOS record",  buf,  2u);
    }

    BOOL v40 = 1;
  }

  else
  {
    BOOL v40 = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    }
  }

- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    CFTypeRef v14 = 0LL;
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    id v16 = sub_1001D4AEC;
    uint64_t v17 = &unk_1002936C0;
    BOOL v18 = v5;
    BOOL v6 = sub_1001C44A8(&v14, &buf);
    v7 = (void *)v14;
    if (!v6 || v14)
    {
      uint64_t v11 = sub_10001267C("SecError");
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: failed to update CKKS4All status in SOS: %@",  (uint8_t *)&buf,  0xCu);
      }

      if (a4 && v7) {
        *a4 = v7;
      }
    }

    else
    {
      id v8 = sub_10001267C("octagon-sos");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = @"not supported";
        if (v5) {
          v10 = @"supported";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "successfully updated CKKS4All status in SOS to '%@'",  (uint8_t *)&buf,  0xCu);
      }
    }
  }

  else
  {
    LOBYTE(v6) = 0;
    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    }
  }

  return v6;
}

- (void)registerForPeerChangeUpdates:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter peerChangeListeners](self, "peerChangeListeners"));
  [v5 registerListener:v4];
}

- (void)sendSelfPeerChangedUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter peerChangeListeners](self, "peerChangeListeners"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100078F90;
  v4[3] = &unk_1002845D8;
  v4[4] = self;
  [v3 iterateListeners:v4];
}

- (void)sendTrustedPeerSetChangedUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSActualAdapter peerChangeListeners](self, "peerChangeListeners"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100078F84;
  v4[3] = &unk_1002845D8;
  v4[4] = self;
  [v3 iterateListeners:v4];
}

- (id)currentState
{
  uint64_t v5 = 0LL;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_100078E78;
  id v9 = sub_100078E88;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100078E90;
  v4[3] = &unk_1002916D0;
  v4[4] = self;
  void v4[5] = &v5;
  +[SOSAccount performOnQuietAccountQueue:](&OBJC_CLASS___SOSAccount, "performOnQuietAccountQueue:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (BOOL)safariViewSyncingEnabled:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    CFTypeRef cf = 0LL;
    int v4 = SOSCCView(kSOSViewAutofillPasswords, 3LL, &cf);
    uint64_t v5 = (void *)cf;
    if (!cf) {
      return v4 == 1;
    }
    if (!a3)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v5);
LABEL_8:
      LOBYTE(v7) = 0;
      return v7;
    }
  }

  else
  {
    if (!a3) {
      goto LABEL_8;
    }
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
  }

  id v6 = v5;
  LOBYTE(v7) = 0;
  *a3 = v6;
  return v7;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  if (!-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    if (!a3)
    {
      LOBYTE(v4) = 0;
      return v4;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS unsupported on this platform"));
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }

  id v9 = 0LL;
  int v4 = SOSCCRequestToJoinCircleAfterRestore(&v9);
  uint64_t v5 = sub_10001267C("octagon-sos");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109378;
    int v11 = v4;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "SOSCCRequestToJoinCircleAfterRestore complete: %d %@",  buf,  0x12u);
  }

  if (a3)
  {
    id v7 = v9;
LABEL_8:
    *a3 = v7;
  }

  return v4;
}

- (BOOL)resetToOffering:(id *)a3
{
  if (!-[OTSOSActualAdapter sosEnabled](self, "sosEnabled"))
  {
    if (!a3)
    {
      LOBYTE(v4) = 0;
      return v4;
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  NSOSStatusErrorDomain,  -4LL,  @"SOS is not enabled for compatibility mode"));
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }

  id v9 = 0LL;
  int v4 = SOSCCResetToOffering(&v9);
  uint64_t v5 = sub_10001267C("octagon-sos");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109378;
    int v11 = v4;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "SOSCCResetToOffering complete: %d %@",  buf,  0x12u);
  }

  if (a3)
  {
    id v7 = v9;
LABEL_8:
    *a3 = v7;
  }

  return v4;
}

- (BOOL)essential
{
  return self->_essential;
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (CKKSListenerCollection)peerChangeListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPeerChangeListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sosCKKSViewList
{
  if (qword_1002DE8F8 != -1) {
    dispatch_once(&qword_1002DE8F8, &stru_100284510);
  }
  return (id)qword_1002DE8F0;
}

- (BOOL)sosEnabled
{
  if (dword_1002DEE98) {
    return dword_1002DEE98 == 2;
  }
  if (qword_1002DEB80 != -1) {
    dispatch_once(&qword_1002DEB80, &stru_10028EFC8);
  }
  if (!byte_1002DEB78)
  {
    if (qword_1002DEB60 != -1) {
      dispatch_once(&qword_1002DEB60, &stru_10028EF88);
    }
    if (byte_1002DDD08) {
      int v14 = 2;
    }
    else {
      int v14 = 1;
    }
    dword_1002DEE98 = v14;
    if (!byte_1002DDD08) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }

  v3 = sub_10001267C("sos-compatibility");
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "compatibility mode feature flag enabled, checking keychain for sos compatibility mode",  buf,  2u);
  }

  dword_1002DEE98 = 1;
  v35[0] = kSecClass;
  v35[1] = kSecUseDataProtectionKeychain;
  v36[0] = kSecClassGenericPassword;
  v36[1] = &__kCFBooleanTrue;
  v35[2] = kSecAttrSynchronizable;
  v35[3] = kSecAttrAccessGroup;
  v36[2] = &__kCFBooleanFalse;
  v36[3] = @"com.apple.security.sos";
  v35[4] = kSecAttrAccount;
  v35[5] = kSecReturnData;
  v36[4] = @"sos-compatibility-mode";
  v36[5] = &__kCFBooleanTrue;
  v35[6] = kSecMatchLimit;
  v35[7] = kSecAttrAccessible;
  v36[6] = kSecMatchLimitOne;
  v36[7] = kSecAttrAccessibleAfterFirstUnlock;
  v35[8] = kSecAttrSysBound;
  v36[8] = &off_1002AE028;
  uint64_t v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  9LL));
  CFTypeRef result = 0LL;
  OSStatus v6 = SecItemCopyMatching(v5, &result);
  if (v6 == -25308)
  {
    uint64_t v15 = sub_10001267C("sos-compatibility");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "keychain is locked, will keep compatibility mode set to UNKNOWN",  buf,  2u);
    }

    dword_1002DEE98 = 0;
    goto LABEL_43;
  }

  OSStatus v7 = v6;
  if (v6 == -25300)
  {
    uint64_t v17 = sub_10001267C("sos-compatibility");
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)__int128 buf = 0;
    id v19 = "could not find sos compatibility mode in the keychain, defaulting to OFF";
    goto LABEL_33;
  }

  if (v6)
  {
    uint64_t v20 = sub_10001267C("SecError");
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v34) = v7;
    id v19 = "sos-compatibility: failed to fetch sos compatibility mode from the keychain, error code: %d, defaulting to OFF";
    id v21 = v18;
    uint32_t v22 = 8;
    goto LABEL_34;
  }

  if (result)
  {
    CFTypeID v8 = CFGetTypeID(result);
    if (v8 == CFDataGetTypeID())
    {
      id v9 = (void *)result;
      id v10 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  result,  134217984LL);
      int v11 = v10;
      int v12 = 1;
      if (v10)
      {
        unsigned int v13 = -[NSString isEqualToString:](v10, "isEqualToString:", @"enabled");
        if (v13) {
          int v12 = 2;
        }
        else {
          int v12 = 1;
        }
      }

      else
      {
        unsigned int v13 = 0;
      }

      dword_1002DEE98 = v12;
      id v27 = sub_10001267C("sos-compatibility");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = @"enabled";
        if (!v13) {
          uint64_t v29 = @"disabled";
        }
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v34 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SOS compatibility mode is %@", buf, 0xCu);
      }

      if ((v13 & 1) == 0) {
        goto LABEL_43;
      }
LABEL_36:
      id v25 = objc_msgSend((id)objc_opt_class(CKKSAnalytics, a2), "logger");
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      [v26 logSuccessForEventNamed:@"SOSDeferralEventCompatibilityModeEnabled"];

      return 1LL;
    }
  }

  id v23 = sub_10001267C("SecError");
  BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    id v19 = "sos-compatibility: unexpected return type, defaulting to OFF";
LABEL_33:
    id v21 = v18;
    uint32_t v22 = 2;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v19, buf, v22);
  }

@end