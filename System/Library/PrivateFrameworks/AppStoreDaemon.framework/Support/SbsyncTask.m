@interface SbsyncTask
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)main;
@end

@implementation SbsyncTask

- (void)main
{
  if (!*(void *)&self->_userInitiated)
  {
    v3 = -[LogKey initWithCategory:]( objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey),  "initWithCategory:",  @"Sbsync/Default");
    v4 = *(void **)&self->_userInitiated;
    *(void *)&self->_userInitiated = v3;
  }

  id v5 = sub_100224A74((uint64_t)&OBJC_CLASS___SbsyncTask, 0LL);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = ASDLogHandleForCategory(4LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)&self->_userInitiated;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    __int16 v168 = 2114;
    v169 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%@] Starting with subscriptionInfo: %{public}@",  buf,  0x16u);
  }

  if (*(void *)&self->super._success) {
    v10 = @"Signout";
  }
  else {
    v10 = @"Ocelot";
  }
  v11 = v10;
  uint64_t v12 = ASDLogHandleForCategory(4LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)&self->_userInitiated;
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v14;
    __int16 v168 = 2114;
    v169 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@] Starting with sbsyncType: %{public}@",  buf,  0x16u);
  }

  v155 = v11;

  v15 = objc_alloc(&OBJC_CLASS___SbsyncTaskRequestEncoder);
  id v16 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = -[SbsyncTaskRequestEncoder initWithBag:](v15, "initWithBag:", v17);

  if (self->_initialSubscriptionStatus)
  {
    uint64_t v19 = ASDLogHandleForCategory(4LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)&self->_userInitiated;
      initialSubscriptionStatus = (void *)self->_initialSubscriptionStatus;
      id v23 = v21;
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(initialSubscriptionStatus, "ams_DSID"));
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v21;
      __int16 v168 = 2114;
      v169 = v24;
      v25 = "[%@] Starting with provided account: %{public}@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
    }
  }

  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    int64_t v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ams_activeiTunesAccount"));
    v28 = (void *)self->_initialSubscriptionStatus;
    self->_initialSubscriptionStatus = v27;

    uint64_t v29 = ASDLogHandleForCategory(4LL);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(void **)&self->_userInitiated;
      v31 = (void *)self->_initialSubscriptionStatus;
      id v23 = v30;
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "ams_DSID"));
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v30;
      __int16 v168 = 2114;
      v169 = v24;
      v25 = "[%@] Starting with active account: %{public}@";
      goto LABEL_15;
    }
  }

  int64_t v32 = self->_initialSubscriptionStatus;
  if (v32 && v6)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)self->_initialSubscriptionStatus, "ams_DSID"));
    self->super._error = (NSError *)sub_100224BAC((uint64_t)&OBJC_CLASS___SbsyncTask, v33, v6);

    int64_t v32 = self->_initialSubscriptionStatus;
  }

  if (v32) {
    -[SbsyncTaskRequestEncoder setAccount:](v18, "setAccount:");
  }
  id v34 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  uint64_t v36 = objc_claimAutoreleasedReturnValue([v35 URLForKey:@"subscription-keybag-refresh"]);

  v154 = (void *)v36;
  v156 = v6;
  if (v36)
  {
    v37 = 0LL;
  }

  else
  {
    uint64_t v38 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 507LL, @"Could not find bag key for sbsync", 0LL);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v38);
  }

  v157 = v18;
  id v39 = v37;

  id v40 = v39;
  v41 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
  if (v42) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v42, @"guid");
  }
  v158 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)self->_initialSubscriptionStatus, "ams_DSID"));
  uint64_t v44 = *(void *)&self->super._success;
  id v45 = *(id *)&self->_userInitiated;
  id v46 = v43;
  objc_opt_self(&OBJC_CLASS___SbsyncTask);
  uint64_t v166 = 0LL;
  unsigned int v165 = 0;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
  id v164 = 0LL;
  id v48 = [v47 fairplayContextWithError:&v164];
  id v49 = v164;

  if (v44 == 1) {
    uint64_t v50 = 314LL;
  }
  else {
    uint64_t v50 = 313LL;
  }
  uint64_t v51 = ASDLogHandleForCategory(4LL);
  v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v45;
    __int16 v168 = 2048;
    v169 = (__CFString *)v50;
    _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "[%@] Getting sbsync data with transactionType: %ld",  buf,  0x16u);
  }

  id v53 = [v46 longLongValue];
  sub_10011189C((uint64_t)v48, (uint64_t)v53, v50, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, (uint64_t)&v166, (uint64_t)&v165);
  if ((_DWORD)v54)
  {
    uint64_t v55 = ASDErrorDomain;
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to generate sbsync data. Fairplay error status: %d",  v54));
    uint64_t v57 = ASDErrorWithTitleAndMessage(v55, 507LL, v56, 0LL);
    uint64_t v58 = objc_claimAutoreleasedReturnValue(v57);

    v59 = 0LL;
    id v49 = (id)v58;
    v60 = v158;
  }

  else
  {
    v60 = v158;
    if (v165)
    {
      v61 = objc_alloc(&OBJC_CLASS___NSData);
      v59 = -[NSData initWithBytesNoCopy:length:deallocator:]( v61,  "initWithBytesNoCopy:length:deallocator:",  v166,  v165,  &stru_1003ED600);
    }

    else
    {
      v59 = 0LL;
    }
  }

  id v62 = v49;

  id v63 = v62;
  if (v59)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](v59, "base64EncodedStringWithOptions:", 0LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v60, "setObject:forKeyedSubscript:", v64, @"sbsync");
  }

  if (*(void *)&self->super._success == 1LL) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v60,  "setObject:forKeyedSubscript:",  @"opt-out",  @"action");
  }
  id v65 = v40;
  if (v63) {
    id v65 = v63;
  }

  v66 = (__CFString *)v65;
  if (v66)
  {
    BOOL v67 = 0;
    v68 = v156;
    goto LABEL_88;
  }

  if (*(double *)&self->_account <= 0.0)
  {
    id v75 = (id)objc_claimAutoreleasedReturnValue( -[SbsyncTaskRequestEncoder requestWithMethod:bagURL:parameters:]( v157,  "requestWithMethod:bagURL:parameters:",  4LL,  v154,  v60));
    id v162 = 0LL;
    v74 = (void *)objc_claimAutoreleasedReturnValue([v75 resultWithError:&v162]);
    v77 = (__CFString *)v162;
  }

  else
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v69 timeIntervalSinceReferenceDate];
    double v71 = v70 - *(double *)&self->_subscriptionStatus;

    double v72 = *(double *)&self->_account - v71;
    if (v72 <= 0.0)
    {
      uint64_t v78 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 515LL, @"Timed out before creating request", 0LL);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue(v78);
      v74 = 0LL;
      goto LABEL_54;
    }

    v73 = (void *)objc_claimAutoreleasedReturnValue( -[SbsyncTaskRequestEncoder requestWithMethod:bagURL:parameters:]( v157,  "requestWithMethod:bagURL:parameters:",  4LL,  v154,  v60));
    id v163 = 0LL;
    v74 = (void *)objc_claimAutoreleasedReturnValue([v73 resultWithTimeout:&v163 error:v72]);
    id v75 = v163;

    if (!v75)
    {
      v66 = 0LL;
      goto LABEL_52;
    }

    else {
      uint64_t v76 = ASDErrorWithSafeUserInfo(v75);
    }
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue(v76);
  }

  v66 = v77;
LABEL_52:

LABEL_54:
  id v79 = *(id *)&self->_timeout;
  if (v79)
  {
    v80 = v79;
    int has_internal_content = os_variant_has_internal_content("com.apple.appstored");

    if (has_internal_content)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->_timeout stringValue]);
      [v74 setValue:v82 forHTTPHeaderField:@"X-iTMS-ValidityDurationInSeconds"];
    }
  }

  v153 = v74;
  if (!v66)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue( -[NSNumber dataTaskPromiseWithRequest:]( self->_subscriptionDuration,  "dataTaskPromiseWithRequest:",  v74));
    v85 = v84;
    if (*(double *)&self->_account == 0.0)
    {
      id v160 = 0LL;
      v83 = (void *)objc_claimAutoreleasedReturnValue([v84 resultWithError:&v160]);
      id v98 = v160;
      v90 = v98;
      if (v98)
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue([v98 userInfo]);
        v100 = (void *)objc_claimAutoreleasedReturnValue([v99 objectForKeyedSubscript:@"AMSServerErrorCode"]);

        if (v100 && [v100 isEqualToNumber:&off_10040C7A8])
        {
          uint64_t v101 = ASDErrorWithDescription(ASDErrorDomain, 551LL, @"Slot limit reached");
          uint64_t v102 = objc_claimAutoreleasedReturnValue(v101);
        }

        else
        {
          uint64_t v104 = ASDErrorWithSafeUserInfo(v90);
          uint64_t v102 = objc_claimAutoreleasedReturnValue(v104);
        }

        v66 = (__CFString *)v102;
        p_superclass = (__objc2_class **)(&OBJC_METACLASS___SystemAppLookupItem + 8);

        goto LABEL_84;
      }

      v66 = 0LL;
      goto LABEL_83;
    }

    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v86 timeIntervalSinceReferenceDate];
    double v88 = v87 - *(double *)&self->_subscriptionStatus;

    if (*(double *)&self->_account - v88 <= 0.0)
    {
      uint64_t v103 = ASDErrorWithTitleAndMessage(ASDErrorDomain, 515LL, @"Timed out before requesting data", 0LL);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue(v103);
      v83 = 0LL;
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___SystemAppLookupItem + 8);
      goto LABEL_85;
    }

    id v161 = 0LL;
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "resultWithTimeout:error:", &v161));
    id v89 = v161;
    v90 = v89;
    p_superclass = (__objc2_class **)(&OBJC_METACLASS___SystemAppLookupItem + 8);
    if (!v89)
    {
      v66 = 0LL;
LABEL_84:

LABEL_85:
      if (v66) {
        goto LABEL_86;
      }
      v109 = (void *)objc_claimAutoreleasedReturnValue([v83 object]);
      v119 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:@"subKeyBag"]);

      if (!v119)
      {
        uint64_t v139 = ASDLogHandleForCategory(4LL);
        v140 = (os_log_s *)objc_claimAutoreleasedReturnValue(v139);
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v141 = *(void *)&self->_userInitiated;
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v141;
          _os_log_impl( (void *)&_mh_execute_header,  v140,  OS_LOG_TYPE_DEFAULT,  "[%@] Subscribed status unchanged due to sbKeyBag not in response",  buf,  0xCu);
        }

        v66 = 0LL;
        self->_logKey = (_TtC9appstored6LogKey *)self->super._error;
        BOOL v67 = 1;
        goto LABEL_87;
      }

      v152 = (void *)objc_claimAutoreleasedReturnValue([v109 objectForKeyedSubscript:@"subKeyBag"]);
      v120 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v152,  0LL);
      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)self->_initialSubscriptionStatus, "ams_DSID"));
      v122 = p_superclass + 274;
      id v123 = *(id *)&self->_userInitiated;
      id v159 = v121;
      id v124 = v123;
      v125 = v120;
      uint64_t v148 = objc_opt_self(v122);
      uint64_t v126 = ASDLogHandleForCategory(4LL);
      v127 = (os_log_s *)objc_claimAutoreleasedReturnValue(v126);
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v124;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "[%@] Importing sbKeyBag", buf, 0xCu);
      }

      v151 = v124;

      v128 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
      *(void *)buf = 0LL;
      [v128 fairplayContextWithError:buf];
      id v129 = *(id *)buf;

      v150 = v129;
      uint64_t v130 = ASDErrorWithSafeUserInfo(v129);
      v131 = (void *)objc_claimAutoreleasedReturnValue(v130);
      uint64_t v166 = 0LL;
      LODWORD(v164) = 0;
      v132 = v125;
      -[NSData bytes](v132, "bytes");
      -[NSData length](v132, "length");

      sub_10013AD40();
      if ((_DWORD)v133)
      {
        uint64_t v134 = ASDErrorDomain;
        v135 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Failed to import sbsync data. Fairplay error status: %d",  v133));
        uint64_t v136 = ASDErrorWithTitleAndMessage(v134, 507LL, v135, 0LL);
        uint64_t v137 = objc_claimAutoreleasedReturnValue(v136);

        BOOL v149 = 0LL;
        v131 = (void *)v137;
      }

      else
      {
        if (!v166)
        {
          BOOL v149 = 0LL;
          goto LABEL_107;
        }

        v142 = sub_100224FD8(v148, v166, v164);
        v135 = (void *)objc_claimAutoreleasedReturnValue(v142);
        BOOL v149 = sub_100224BAC((uint64_t)&OBJC_CLASS___SbsyncTask, v159, v135);
        sub_10017F6D0(v166);
      }

LABEL_107:
      id v143 = v131;
      BOOL v67 = v143 == 0LL;

      v66 = (__CFString *)v143;
      if (!v143) {
        self->_logKey = (_TtC9appstored6LogKey *)v149;
      }
      uint64_t v144 = ASDLogHandleForCategory(4LL);
      v145 = (os_log_s *)objc_claimAutoreleasedReturnValue(v144);
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v146 = *(void *)&self->_userInitiated;
        logKey = self->_logKey;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v146;
        __int16 v168 = 2048;
        v169 = (__CFString *)logKey;
        _os_log_impl( (void *)&_mh_execute_header,  v145,  OS_LOG_TYPE_DEFAULT,  "[%@] Subscribed status updated to: %ld",  buf,  0x16u);
      }

      goto LABEL_87;
    }

    if (ASDErrorIsEqual(v89, AMSErrorDomain, 1LL))
    {
      uint64_t v92 = ASDErrorDomain;
      uint64_t v93 = ASDErrorWithUnderlyingErrorAndDescription(v90, ASDErrorDomain, 515LL, @"Timed out requesting data");
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
      if ((self->_syncType & 0x100) != 0)
      {
        v95 = @"Timed waiting for user to repsond to dialog";
        uint64_t v96 = v92;
        uint64_t v97 = 550LL;
      }

      else
      {
        v95 = @"Timed out creating request";
        uint64_t v96 = v92;
        uint64_t v97 = 515LL;
      }
    }

    else
    {
      v105 = (void *)objc_claimAutoreleasedReturnValue([v90 userInfo]);
      v94 = (void *)objc_claimAutoreleasedReturnValue([v105 objectForKeyedSubscript:@"AMSServerErrorCode"]);

      if (!v94 || ![v94 isEqualToNumber:&off_10040C7A8])
      {
        uint64_t v106 = ASDErrorWithSafeUserInfo(v90);
        uint64_t v107 = objc_claimAutoreleasedReturnValue(v106);
LABEL_82:
        v66 = (__CFString *)v107;

LABEL_83:
        p_superclass = &OBJC_METACLASS___SystemAppLookupItem.superclass;
        goto LABEL_84;
      }

      uint64_t v96 = ASDErrorDomain;
      v95 = @"Slot limit reached";
      uint64_t v97 = 551LL;
    }

    uint64_t v108 = ASDErrorWithDescription(v96, v97, v95);
    uint64_t v107 = objc_claimAutoreleasedReturnValue(v108);
    goto LABEL_82;
  }

  v83 = 0LL;
LABEL_86:
  v109 = 0LL;
  BOOL v67 = 0;
LABEL_87:

  v68 = v156;
LABEL_88:
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v110 timeIntervalSinceReferenceDate];
  double v112 = v111 - *(double *)&self->_subscriptionStatus;

  uint64_t v113 = ASDLogHandleForCategory(4LL);
  v114 = (os_log_s *)objc_claimAutoreleasedReturnValue(v113);
  v115 = v114;
  if (v67)
  {
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v116 = *(void *)&self->_userInitiated;
      v117 = self->_logKey;
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v116;
      __int16 v168 = 2048;
      v169 = (__CFString *)v117;
      __int16 v170 = 2048;
      double v171 = v112;
      _os_log_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_DEFAULT,  "[%@] Successfully completed with subscription status: %ld time: %f",  buf,  0x20u);
    }

    notify_post("com.apple.appstored.ASDArcadeSubscriptionBagUpdatedNotification");
  }

  else
  {
    if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    {
      uint64_t v138 = *(void *)&self->_userInitiated;
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v138;
      __int16 v168 = 2114;
      v169 = v66;
      __int16 v170 = 2048;
      double v171 = v112;
      _os_log_error_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_ERROR,  "[%@] Encountered error: %{public}@ time: %f",  buf,  0x20u);
    }
  }

  objc_setProperty_atomic_copy(self, v118, v66, 32LL);
  LOBYTE(self->super._keepAlive) = v67;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = off_1003DA120;
  if (self)
  {
    BYTE1(self->_syncType) = 1;
    if (LOBYTE(self->_syncType)) {
      uint64_t v14 = &off_1003D9DB0;
    }
  }

  id v15 = objc_alloc_init(*v14);
  uint64_t v16 = ASDLogHandleForCategory(4LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      uint64_t v18 = *(void *)&self->_userInitiated;
    }
    else {
      uint64_t v18 = 0LL;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v23 = v18;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] Presenting dialog request: %{public}@",  buf,  0x16u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100224EA8;
  v20[3] = &unk_1003EBDA8;
  v20[4] = self;
  id v21 = v13;
  id v19 = v13;
  [v15 presentDialogRequest:v12 resultHandler:v20];
}

- (void).cxx_destruct
{
}

@end