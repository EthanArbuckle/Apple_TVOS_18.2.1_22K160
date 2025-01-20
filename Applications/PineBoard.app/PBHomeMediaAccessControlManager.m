@interface PBHomeMediaAccessControlManager
+ (id)sharedInstance;
- (PBHomeMediaAccessControlManager)init;
- (id)_init;
- (void)_handleAirPlaySettingsDidChange;
- (void)_handleHomeAccessoryUpdate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PBHomeMediaAccessControlManager

+ (id)sharedInstance
{
  if (qword_100470828 != -1) {
    dispatch_once(&qword_100470828, &stru_1003D4560);
  }
  return (id)qword_100470820;
}

- (PBHomeMediaAccessControlManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Unimplemented",  @"-[PBHomeMediaAccessControlManager init] not supported, use +sharedInstance instead",  0LL));
  objc_exception_throw(v2);
  return (PBHomeMediaAccessControlManager *)-[PBHomeMediaAccessControlManager _init](v3, v4);
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBHomeMediaAccessControlManager;
  id v2 = -[PBHomeMediaAccessControlManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = TVCSHomeLog();
    SEL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AP: init", v11, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v5 addObserver:v2 forKeyPath:@"localAccessory" options:0 context:off_10046ABB0];

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
    [v6 addObserver:v2 forKeyPath:@"securityType" options:0 context:off_10046ABB8];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
    [v7 addObserver:v2 forKeyPath:@"accessType" options:0 context:off_10046ABB8];

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
    [v8 addObserver:v2 forKeyPath:@"password" options:0 context:off_10046ABB8];

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
    [v9 reloadHomeConfiguration];
  }

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10046ABB0 == a6)
  {
    -[PBHomeMediaAccessControlManager _handleHomeAccessoryUpdate](self, "_handleHomeAccessoryUpdate");
  }

  else if (off_10046ABB8 == a6)
  {
    if (!self->_updatingAirPlaySettings) {
      -[PBHomeMediaAccessControlManager _handleAirPlaySettingsDidChange](self, "_handleAirPlaySettingsDidChange");
    }
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBHomeMediaAccessControlManager;
    -[PBHomeMediaAccessControlManager observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_handleHomeAccessoryUpdate
{
  self->_updatingAirPlaySettings = 1;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
  uint64_t v4 = ((uint64_t (*)(void))TVCSHomeLog)();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100279A08(v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localAccessory]);

  if (v7)
  {
    v8 = (TVCSHome *)objc_claimAutoreleasedReturnValue([v7 home]);
    hmHome = self->_hmHome;
    self->_hmHome = v8;

    id v10 = -[TVCSHome minimumMediaUserPrivilege](self->_hmHome, "minimumMediaUserPrivilege");
    if (v10 == (id)2)
    {
      uint64_t v15 = ((uint64_t (*)(void))TVCSHomeLog)();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1002799D8(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }

    else
    {
      if (v10 != (id)1)
      {
        if (!v10)
        {
          uint64_t v11 = -[TVCSHome isMediaPeerToPeerEnabled](self->_hmHome, "isMediaPeerToPeerEnabled") ^ 1;
LABEL_20:
          if ([v3 accessType] != (id)v11)
          {
            uint64_t v32 = ((uint64_t (*)(void))TVCSHomeLog)();
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              v34 = off_1003D4620[v11];
              unint64_t v35 = (unint64_t)-[TVCSHome minimumMediaUserPrivilege](self->_hmHome, "minimumMediaUserPrivilege");
              if (v35 > 2) {
                v36 = 0LL;
              }
              else {
                v36 = off_1003D4650[v35];
              }
              unsigned int v37 = -[TVCSHome isMediaPeerToPeerEnabled](self->_hmHome, "isMediaPeerToPeerEnabled");
              v38 = @"NO";
              *(_DWORD *)v58 = 138412802;
              *(void *)&v58[4] = v34;
              *(_WORD *)&v58[12] = 2112;
              if (v37) {
                v38 = @"YES";
              }
              *(void *)&v58[14] = v36;
              __int16 v59 = 2112;
              v60 = v38;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "AP: Changing local access type to: %@ (privilege: %@ P2P: %@)",  v58,  0x20u);
            }

            [v3 setAccessType:v11];
          }

          id v39 = objc_msgSend(v3, "accessType", *(_OWORD *)v58);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHome mediaPassword](self->_hmHome, "mediaPassword"));

          BOOL v41 = (unint64_t)v39 > 1 || v40 == 0LL;
          int v42 = v41;
          if (v41) {
            uint64_t v43 = 0LL;
          }
          else {
            uint64_t v43 = 2LL;
          }
          if ((id)v43 != [v3 securityType])
          {
            uint64_t v44 = ((uint64_t (*)(void))TVCSHomeLog)();
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              v46 = @"PBSAirPlaySecurityTypePassword";
              if (v42) {
                v46 = @"PBSAirPlaySecurityTypeNone";
              }
              v47 = v46;
              *(_DWORD *)v58 = 138412290;
              *(void *)&v58[4] = v47;
              _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "AP: Changing local security type to: %@",  v58,  0xCu);
            }

            [v3 setSecurityType:v43];
          }

          v48 = (void *)objc_claimAutoreleasedReturnValue([v3 password]);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHome mediaPassword](self->_hmHome, "mediaPassword"));
          unsigned __int8 v50 = [v48 isEqualToString:v49];

          if ((v50 & 1) == 0)
          {
            uint64_t v51 = ((uint64_t (*)(void))TVCSHomeLog)();
            v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHome mediaPassword](self->_hmHome, "mediaPassword"));
              v54 = @"non-null";
              if (!v53) {
                v54 = @"null";
              }
              *(_DWORD *)v58 = 138412290;
              *(void *)&v58[4] = v54;
              _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "AP: Updating Password - %@",  v58,  0xCu);
            }

            v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHome mediaPassword](self->_hmHome, "mediaPassword"));
            [v3 setPassword:v55];
          }

          goto LABEL_50;
        }

- (void)_handleAirPlaySettingsDidChange
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAirPlaySettings sharedInstance](&OBJC_CLASS___PBSAirPlaySettings, "sharedInstance"));
  uint64_t v4 = TVCSHomeLog(v3);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = (unint64_t)[v3 accessType];
    if (v6 > 2) {
      v7 = 0LL;
    }
    else {
      v7 = off_1003D4620[v6];
    }
    unint64_t v8 = (unint64_t)[v3 securityType];
    if (v8 > 2) {
      v9 = 0LL;
    }
    else {
      v9 = off_1003D4638[v8];
    }
    hmHome = self->_hmHome;
    unint64_t v11 = (unint64_t)-[TVCSHome minimumMediaUserPrivilege](hmHome, "minimumMediaUserPrivilege");
    if (v11 > 2) {
      id v12 = 0LL;
    }
    else {
      id v12 = off_1003D4650[v11];
    }
    unsigned int v13 = -[TVCSHome isMediaPeerToPeerEnabled](self->_hmHome, "isMediaPeerToPeerEnabled");
    *(_DWORD *)buf = 138413314;
    v14 = @"NO";
    uint64_t v43 = v7;
    __int16 v44 = 2112;
    if (v13) {
      v14 = @"YES";
    }
    v45 = v9;
    __int16 v46 = 2112;
    v47 = hmHome;
    __int16 v48 = 2112;
    v49 = v12;
    __int16 v50 = 2112;
    uint64_t v51 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "AP: AP settings updated: access type: %@ security type: %@ || home: %@ privilege: %@ P2P: %@",  buf,  0x34u);
  }

  id v15 = [v3 accessType];
  if (v15 == (id)2)
  {
    uint64_t v17 = 1LL;
  }

  else
  {
    if (v15 == (id)1)
    {
      uint64_t v17 = 0LL;
      uint64_t v16 = 0LL;
      goto LABEL_22;
    }

    if (!v15)
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = 1LL;
      goto LABEL_22;
    }

    uint64_t v17 = 0LL;
  }

  uint64_t v16 = 1LL;
LABEL_22:
  uint64_t v18 = self->_hmHome;
  if (v18)
  {
    id v19 = -[TVCSHome minimumMediaUserPrivilege](v18, "minimumMediaUserPrivilege");
    if (v19 != (id)v16
      || (id v19 = -[TVCSHome isMediaPeerToPeerEnabled](self->_hmHome, "isMediaPeerToPeerEnabled"),
          (_DWORD)v17 != (_DWORD)v19))
    {
      uint64_t v20 = TVCSHomeLog(v19);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v22 = (unint64_t)-[TVCSHome minimumMediaUserPrivilege](self->_hmHome, "minimumMediaUserPrivilege");
        if (v22 > 2) {
          uint64_t v23 = 0LL;
        }
        else {
          uint64_t v23 = off_1003D4650[v22];
        }
        unsigned int v26 = -[TVCSHome isMediaPeerToPeerEnabled](self->_hmHome, "isMediaPeerToPeerEnabled");
        uint64_t v27 = @"NO";
        if (v26) {
          uint64_t v27 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v43 = v23;
        __int16 v44 = 2112;
        v45 = (__CFString *)v27;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "AP: Updating Home with privilege: %@ P2P: %@",  buf,  0x16u);
      }

      uint64_t v28 = self->_hmHome;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_10009731C;
      v40[3] = &unk_1003D4580;
      char v41 = v17;
      -[TVCSHome updateMediaPeerToPeerEnabled:completionHandler:]( v28,  "updateMediaPeerToPeerEnabled:completionHandler:",  v17,  v40);
      uint64_t v29 = self->_hmHome;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_100097418;
      v39[3] = &unk_1003D45A0;
      v39[4] = v16;
      -[TVCSHome updateMinimumMediaUserPrivilege:completionHandler:]( v29,  "updateMinimumMediaUserPrivilege:completionHandler:",  v16,  v39);
    }

    if ([v3 accessType] && objc_msgSend(v3, "accessType") != (id)1)
    {
      id v30 = [v3 accessType];
      if (v30 != (id)2) {
        goto LABEL_39;
      }
    }

    else
    {
      id v30 = [v3 securityType];
      if (v30 == (id)2)
      {
LABEL_39:
        uint64_t v31 = TVCSHomeLog(v30);
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "AP: Updating password", buf, 2u);
        }

        v33 = self->_hmHome;
        v34 = (void *)objc_claimAutoreleasedReturnValue([v3 password]);
        -[TVCSHome updateMediaPassword:completionHandler:]( v33,  "updateMediaPassword:completionHandler:",  v34,  &stru_1003D45E0);
LABEL_42:

        goto LABEL_48;
      }
    }

    unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVCSHome mediaPassword](self->_hmHome, "mediaPassword"));

    uint64_t v37 = TVCSHomeLog(v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v37);
    BOOL v38 = os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT);
    if (!v35)
    {
      if (v38)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v34,  OS_LOG_TYPE_DEFAULT,  "AP: HK password was already nil",  buf,  2u);
      }

      goto LABEL_42;
    }

    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "AP: Removing password", buf, 2u);
    }

    -[TVCSHome updateMediaPassword:completionHandler:]( self->_hmHome,  "updateMediaPassword:completionHandler:",  0LL,  &stru_1003D4600);
  }

  else
  {
    uint64_t v24 = TVCSHomeLog(0LL);
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "AP: no Home detected", buf, 2u);
    }
  }

- (void).cxx_destruct
{
}

@end