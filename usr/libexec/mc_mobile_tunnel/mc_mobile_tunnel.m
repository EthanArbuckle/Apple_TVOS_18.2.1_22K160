void sub_100004F48(id a1)
{
  MMTConnectionManager *v1;
  void *v2;
  v1 = objc_opt_new(&OBJC_CLASS___MMTConnectionManager);
  v2 = (void *)qword_100014B90;
  qword_100014B90 = (uint64_t)v1;
}

void sub_1000050E4(uint64_t a1)
{
  v3 = -[MMTConnection initWithLockdownConnection:]( objc_alloc(&OBJC_CLASS___MMTConnection),  "initWithLockdownConnection:",  *(void *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activeConnections]);
  [v2 addObject:v3];

  -[MMTConnection start](v3, "start");
}

void sub_10000526C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) activeConnections]);
  [v2 removeObject:*(void *)(a1 + 32)];
}

void sub_100005464( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100005480(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained parser]);
  [v1 setEscalationBlock:0];

  id v2 = objc_opt_new(&OBJC_CLASS___MTChaperoneParser);
  [WeakRetained setParser:v2];
}

id sub_100005554(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextCommand];
}

LABEL_25:
      v29 = *(void **)DMCLogObjects(v24);
      if (v23 == v7)
      {
        if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          v31 = -[MMTConnection lockdownConnection](self, "lockdownConnection");
          *(_DWORD *)buf = 134218242;
          *(void *)v39 = v31;
          *(_WORD *)&v39[8] = 2112;
          v40 = (char *)v21;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Received message on connection %p: %@",  buf,  0x16u);
        }

        v32 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization DMCSafePropertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "DMCSafePropertyListWithData:options:format:error:",  v21,  0LL,  0LL,  0LL));
        if (v32)
        {
          v17 = (void *)v32;
          v33 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          isKindOfClass = objc_opt_isKindOfClass(v17, v33);
          if ((isKindOfClass & 1) != 0)
          {
LABEL_34:
            v36 = *(os_log_s **)DMCLogObjects(isKindOfClass);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)v39 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "Received message: %{public}@",  buf,  0xCu);
            }

            goto LABEL_40;
          }
        }

        v35 = *(os_log_s **)DMCLogObjects(v32);
        isKindOfClass = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
        if ((_DWORD)isKindOfClass)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "The message did not contain a dictionary.",  buf,  2u);
        }

        v17 = 0LL;
        goto LABEL_34;
      }

      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v26 = "Received message has the wrong byte count -- rejecting.";
        v27 = (os_log_s *)v29;
        goto LABEL_38;
      }
    }

    else
    {
      v25 = *(os_log_s **)DMCLogObjects(0LL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v26 = "Cannot allocate message buffer.";
        v27 = v25;
LABEL_38:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, 2u);
      }
    }

    v17 = 0LL;
LABEL_40:

    return v17;
  }

  v16 = *(os_log_s **)DMCLogObjects(4LL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v9 = "Message cannot be zero length";
    v10 = v16;
    v11 = 2;
    goto LABEL_13;
  }

LABEL_14:
  v17 = 0LL;
  return v17;
}

LABEL_20:
    v19 = 0;
    goto LABEL_21;
  }

  v19 = 0;
LABEL_22:

  return v19;
}

id sub_100006234(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextCommand];
}

void sub_10000623C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000062D8;
  v7[3] = &unk_100010730;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_1000062D8(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "parseErrorFromResponse:"));
    uint64_t v3 = kMDMPSettingsStatusKey;
    v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:kMDMPSettingsStatusKey]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    if (v4)
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          v10 = 0LL;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 40) parseErrorFromResponse:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)]);
            [v5 addObject:v11];

            v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }

        while (v8);
      }

      [v2 setObject:v5 forKey:v3];
    }

    [*(id *)(a1 + 40) sendMessage:v2];
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) workQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000064BC;
    block[3] = &unk_100010780;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(v12, block);
  }
}

id sub_1000064BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeNextCommand];
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  v1 = *(os_log_s **)DMCLogObjects(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mc_mobile_tunnel starting.", (uint8_t *)v15, 2u);
  }

  dispatch_queue_attr_t v2 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v2);
  dispatch_queue_t v4 = dispatch_queue_create("mc_mobile_tunnel Catalyst Queue", v3);
  CATSetCatalystQueue();

  uint64_t v5 = getpwnam("mobile");
  if (v5) {
    uid_t pw_uid = v5->pw_uid;
  }
  else {
    uid_t pw_uid = 501;
  }
  geteuid();
  uint64_t v7 = seteuid(pw_uid);
  if ((_DWORD)v7) {
    sub_10000B744(v7);
  }
  uint64_t v8 = lockdown_checkin_xpc("com.apple.mobile.MCInstall", 0LL, &_dispatch_main_q, &stru_1000107E8);
  if ((_DWORD)v8)
  {
    int v13 = v8;
    __int128 v14 = *(os_log_s **)DMCLogObjects(v8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109120;
      v15[1] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to checkin with lockdown: 0x%08x",  (uint8_t *)v15,  8u);
    }

    exit(1);
  }

  objc_autoreleasePoolPop(v0);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v9 run];

  v11 = *(os_log_s **)DMCLogObjects(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "mc_mobile_tunnel shutting down.",  (uint8_t *)v15,  2u);
  }

  return 0LL;
}

void sub_100006720(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MMTConnectionManager sharedInstance](&OBJC_CLASS___MMTConnectionManager, "sharedInstance", a3));
  [v4 createConnectionForLockdownConnection:a2];
}

LABEL_8:
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000699C;
    v16[3] = &unk_100010810;
    v16[4] = self;
    __int128 v17 = v10;
    v18 = v11;
    v19 = v12;
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MTChaperoneParser;
    -[MTChaperoneParser _processRequest:accessRights:assertion:completionBlock:]( &v15,  "_processRequest:accessRights:assertion:completionBlock:",  v17,  a4,  v18,  v16);

    goto LABEL_9;
  }

  -[MTChaperoneParser commandDefaultMDMOptionsCompletionBlock:](self, "commandDefaultMDMOptionsCompletionBlock:", v12);
LABEL_9:
}

void sub_10000699C(void *a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCTPStatusKey]);
  if (![v3 isEqualToString:kMCTPStatusError])
  {
LABEL_9:
    (*(void (**)(void))(a1[7] + 16LL))();
    goto LABEL_10;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:kMCTPErrorObjectKey]);
  if (!v4) {
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
  if (([v6 isEqualToString:MDMErrorDomain] & 1) == 0)
  {

    goto LABEL_9;
  }

  id v7 = [v5 code];

  if (v7 != (id)12021) {
    goto LABEL_9;
  }
LABEL_7:
  [*(id *)(a1[4] + 8) processRequest:a1[5] assertion:a1[6] completionBlock:a1[7]];
LABEL_10:
}

id sub_100006B34(uint64_t a1)
{
  dispatch_queue_attr_t v2 = objc_alloc(&OBJC_CLASS___NSSet);
  v17[0] = kMDMPRequestTypeDeviceInformation;
  v17[1] = kMDMPRequestTypeProfileList;
  v17[2] = kMDMPRequestTypeRemoveProfile;
  v17[3] = kMDMPRequestTypeInstallProfile;
  v17[4] = kMDMPRequestTypeDeviceLock;
  v17[5] = kMDMPRequestTypeEraseDevice;
  v17[6] = kMDMPRequestTypeRestartDevice;
  v17[7] = kMDMPRequestTypeShutDownDevice;
  v17[8] = kMDMPRequestTypeCertificateList;
  v17[9] = kMDMPRequestTypeProvisioningProfileList;
  v17[10] = kMDMPRequestTypeInstallProvisioningProfile;
  v17[11] = kMDMPRequestTypeRemoveProvisioningProfile;
  v17[12] = kMDMPRequestTypeInstalledApplicationList;
  v17[13] = kMDMPRequestTypeValidateApplications;
  v17[14] = kMDMPRequestTypeRestrictions;
  v17[15] = kMDMPRequestTypeSecurityInfo;
  v17[16] = kMDMPRequestTypeClearPasscode;
  v17[17] = kMDMPRequestTypeClearRestrictionsPassword;
  v17[18] = kMDMPRequestTypeSettings;
  v17[19] = kMDMPRequestTypeRequestMirroring;
  v17[20] = kMDMPRequestTypeStopMirroring;
  v17[21] = kMDMPRequestTypeActivationLockBypassCode;
  v17[22] = kMDMPRequestTypeClearActivationLockBypassCode;
  v17[23] = kMDMPRequestTypeDeviceConfigured;
  v17[24] = kMDMPRequestTypeScheduleOSUpdate;
  v17[25] = kMDMPRequestTypeScheduleOSUpdateScan;
  v17[26] = kMDMPRequestTypeAvailableOSUpdates;
  v17[27] = kMDMPRequestTypeOSUpdateStatus;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 28LL));
  id v4 = -[NSSet initWithArray:](v2, "initWithArray:", v3);
  uint64_t v5 = (void *)qword_100014BB0;
  qword_100014BB0 = (uint64_t)v4;

  id v6 = objc_alloc(&OBJC_CLASS___NSSet);
  v16[0] = @"DefaultMDMOptions";
  v16[1] = @"SetDefaultMDMOptions";
  v16[2] = @"ProceedWithKeybagMigration";
  v16[3] = kMDMPRequestTypeInstallProfileSilent;
  v16[4] = kMDMPRequestTypeRequestUnlockToken;
  v16[5] = @"GetProfileList";
  v16[6] = @"InstallProfile";
  v16[7] = @"RemoveProfile";
  v16[8] = @"StoreProfile";
  v16[9] = @"GetStoredProfile";
  v16[10] = @"GetCloudConfiguration";
  v16[11] = @"SetCloudConfiguration";
  v16[12] = @"Flush";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 13LL));
  id v8 = -[NSSet initWithArray:](v6, "initWithArray:", v7);
  uint64_t v9 = (void *)qword_100014BB8;
  qword_100014BB8 = (uint64_t)v8;

  v15.receiver = *(id *)(a1 + 32);
  v15.super_class = (Class)&OBJC_CLASS___MTChaperoneParser;
  id v10 = objc_msgSendSuper2(&v15, "_allCommands");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = [v11 mutableCopy];
  int v13 = (void *)qword_100014BA8;
  qword_100014BA8 = (uint64_t)v12;

  [(id)qword_100014BA8 intersectSet:qword_100014BB0];
  return [(id)qword_100014BA8 unionSet:qword_100014BB8];
}

void sub_100006F98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10000760C(id a1)
{
  if (IOMainPort(bootstrap_port, (mach_port_t *)&dword_100014BC8))
  {
    uint64_t v1 = *(os_log_s **)DMCLogObjects();
    if (!os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      return;
    }
    __int16 v4 = 0;
    id v2 = "Cannot create IO port to read NVRAM values.";
    uint64_t v3 = (uint8_t *)&v4;
    goto LABEL_4;
  }

  dword_100014BCC = IORegistryEntryFromPath(dword_100014BC8, "IODeviceTree:/options");
  if (!dword_100014BCC)
  {
    uint64_t v1 = *(os_log_s **)DMCLogObjects();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      __int16 v5 = 0;
      id v2 = "Cannot create IO Registry entry.";
      uint64_t v3 = (uint8_t *)&v5;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, v2, v3, 2u);
    }
  }

void sub_100007B24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100007B7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = (id)objc_claimAutoreleasedReturnValue( +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }

id sub_100007BE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitUntilKeybagRollingHasBeenPerformedCompletionBlock:*(void *)(a1 + 40) timeRemaining:*(double *)(a1 + 48) - *(double *)(a1 + 56)];
}

void sub_100007BFC(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DMCKeybagErrorDomain,  37001LL,  0LL));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](&OBJC_CLASS___MTChaperoneParser, "responseWithError:", v4));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_100007C7C(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DMCKeybagErrorDomain,  37000LL,  0LL));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](&OBJC_CLASS___MTChaperoneParser, "responseWithError:", v4));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

LABEL_19:
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
    return v23;
  }

  v27[0] = kMCTPStatusKey;
  v27[1] = v22;
  v28[0] = kMCTPStatusAcknowledged;
  v28[1] = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));

  return v23;
}

LABEL_18:
  }

  if (v13) {
    v28 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithError:", v13));
  }
  else {
    v28 = objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  }
  v29 = (void *)v28;

  return v29;
}

void sub_100008AF0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = *(void **)DMCLogObjects(v2);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v5 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError DMCVerboseDescription](v3, "DMCVerboseDescription"));
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Store profile error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }
}

LABEL_10:
}

void sub_100008D1C(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"ProfileData"];
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void sub_10000909C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    goto LABEL_9;
  }

  if (![*(id *)(a1 + 32) _isXPCInterruptionError:v3]
    || (uint64_t)[*(id *)(a1 + 32) setCloudConfigurationCommandRetryCount] > 2)
  {
    [*(id *)(a1 + 32) setSetCloudConfigurationCommandRetryCount:0];
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithError:", v3));
LABEL_9:
    id v5 = (void *)v6;
    goto LABEL_10;
  }

  uint64_t v4 = *(os_log_s **)DMCLogObjects( objc_msgSend( *(id *)(a1 + 32),  "setSetCloudConfigurationCommandRetryCount:",  (char *)objc_msgSend(*(id *)(a1 + 32), "setCloudConfigurationCommandRetryCount") + 1));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Couldn't communicate with the helper application, retrying the commandSetCloudConfiguration",  v8,  2u);
  }

  [*(id *)(a1 + 32) _commandSetCloudConfiguration:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
  id v5 = 0LL;
LABEL_10:
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v5);
  }
}

void sub_100009570(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMCTPErrorObjectKey]);
  if (v4
    && [*(id *)(a1 + 32) _isXPCInterruptionError:v4]
    && (uint64_t)[*(id *)(a1 + 32) downloadAndApplyCloudConfigurationCommandRetryCount] <= 2)
  {
    id v5 = *(os_log_s **)DMCLogObjects( objc_msgSend( *(id *)(a1 + 32),  "setDownloadAndApplyCloudConfigurationCommandRetryCount:",  (char *)objc_msgSend(*(id *)(a1 + 32), "downloadAndApplyCloudConfigurationCommandRetryCount")
                         + 1));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Couldn't communicate with the helper application, retrying the commandDownloadAndApplyCloudConfiguration",  buf,  2u);
    }

    [*(id *)(a1 + 32) _commandDownloadAndApplyCloudConfiguration:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
  }

  else
  {
    [*(id *)(a1 + 32) setDownloadAndApplyCloudConfigurationCommandRetryCount:0];
    uint64_t v6 = *(void **)(a1 + 48);
    if (v6)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000096D4;
      v9[3] = &unk_100010988;
      id v11 = v6;
      id v10 = v3;
      dispatch_async(v8, v9);
    }
  }
}

uint64_t sub_1000096D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_1000096E4(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1[4] _configuratorCloudConfigurationErrorWithCloudConfigDetails:v5 error:a2]);
  if (v6)
  {
    uint64_t v7 = (void (**)(id, void *))a1[6];
    id v8 = [(id)objc_opt_class(a1[4]) responseWithError:v6];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7[2](v7, v9);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:@"MDMUsername"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([a1[5] objectForKeyedSubscript:@"MDMPassword"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kCCConfigurationURLKey]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v12));

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kCCAnchorCertificatesKey]);
    uint64_t v15 = certificatesFromDERCertificateDataArray();
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000098B0;
    v19[3] = &unk_100010AB0;
    id v17 = a1[6];
    id v18 = a1[4];
    id v21 = v17;
    v19[4] = v18;
    id v20 = v5;
    +[MDMMCInterface retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completion:]( &OBJC_CLASS___MDMMCInterface,  "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completion:",  v13,  v10,  v11,  v16,  v19);
  }
}

void sub_1000098B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [(id)objc_opt_class(*(void *)(a1 + 32)) responseWithError:v5];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000099BC;
    v13[3] = &unk_100010A88;
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    id v16 = v11;
    v13[4] = v12;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    +[MDMMCInterface storeCloudConfigurationDetails:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeCloudConfigurationDetails:completion:",  v10,  v13);
  }
}

void sub_1000099BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [(id)objc_opt_class(*(void *)(a1 + 32)) responseWithError:v3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100009ABC;
    v11[3] = &unk_100010A60;
    id v12 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = v9;
    uint64_t v13 = v10;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v8, v11);
  }
}

void sub_100009ABC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100009B5C;
  v6[3] = &unk_100010A38;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v8 = v3;
  v6[4] = v4;
  id v7 = v5;
  +[MDMMCInterface storeProfileData:completion:](&OBJC_CLASS___MDMMCInterface, "storeProfileData:completion:", v2, v6);
}

void sub_100009B5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [(id)objc_opt_class(*(void *)(a1 + 32)) responseWithError:v3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100009C38;
    v9[3] = &unk_100010960;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    id v12 = *(id *)(a1 + 48);
    +[MDMMCInterface installStoredProfileDataWithCompletion:]( &OBJC_CLASS___MDMMCInterface,  "installStoredProfileDataWithCompletion:",  v9);
  }
}

void sub_100009C38(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    +[MDMMCInterface storeCloudConfigurationDetails:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeCloudConfigurationDetails:completion:",  *(void *)(a1 + 32),  &stru_1000109D0);
    +[MDMMCInterface storeProfileData:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeProfileData:completion:",  0LL,  &stru_100010A10);
    id v3 = [(id)objc_opt_class(*(void *)(a1 + 40)) responseWithError:v6];
  }

  else
  {
    id v4 = [*(id *)(a1 + 32) mutableCopy];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationWasAppliedKey];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey];
    +[MDMMCInterface storeCloudConfigurationDetails:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeCloudConfigurationDetails:completion:",  v4,  &stru_1000109F0);

    +[MDMMCInterface storeProfileData:completion:]( &OBJC_CLASS___MDMMCInterface,  "storeProfileData:completion:",  0LL,  &stru_100010A10);
    id v3 = [(id)objc_opt_class(*(void *)(a1 + 40)) responseWithStatus:kMCTPStatusAcknowledged];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(v3);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100009D74(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = *(os_log_s **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Failed to revert to original cloud configuration. This means that AwaitDeviceConfigured will remain set to YES. Error: %{public}@",  (uint8_t *)&v4,  0xCu);
  }
}

void sub_100009E18(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = *(os_log_s **)DMCLogObjects();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Failed to set ConfigurationWasApplied to YES. Error: %{public}@",  (uint8_t *)&v4,  0xCu);
    }
  }
}

void sub_100009EC0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = v2;
  if (v2)
  {
    int v4 = *(void **)DMCLogObjects(v2);
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError DMCVerboseDescription](v3, "DMCVerboseDescription"));
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Clearing store profile error. Error: %{public}@",  (uint8_t *)&v7,  0xCu);
    }
  }
}

void sub_10000A020(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[MTIPCUTunnelParser responseWithError:](&OBJC_CLASS___MTIPCUTunnelParser, "responseWithError:", v3));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  }
  id v5 = (void *)v4;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000A108;
    v9[3] = &unk_100010988;
    id v11 = v6;
    id v10 = v5;
    dispatch_async(v8, v9);
  }
}

void sub_10000A108(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
  uint64_t v2 = *(os_log_s **)DMCLogObjects(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Even more Logging", v3, 2u);
  }

void sub_10000A380(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)DMCLogObjects(v3);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 DMCVerboseDescription]);
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Could not erase device: %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

LABEL_17:
  CFRelease(v9);
LABEL_18:
  -[MTIPCUTunnelParser setChallenge:](self, "setChallenge:", 0LL, *(void *)v28);
  v27 = *(os_log_s **)DMCLogObjects(-[MTIPCUTunnelParser setChallengeCertificate:](self, "setChallengeCertificate:", 0LL));
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Escalation rejected.", buf, 2u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  @"SignedRequestRejected"));
LABEL_21:
  if (v6) {
    v6[2](v6, v22);
  }
}

void sub_10000AB54(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000AC04;
    v7[3] = &unk_100010988;
    id v9 = v4;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t sub_10000AC04(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000AC14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _configuratorProvisionalEnrollmentErrorWithDetails:v5 error:a2]);
  if (v10)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [(id)objc_opt_class(*(void *)(a1 + 32)) responseWithError:v10];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTIPCUTunnelParser responseWithStatus:]( &OBJC_CLASS___MTIPCUTunnelParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
    id v8 = v9;
    if (v5) {
      [v9 setObject:v5 forKeyedSubscript:@"ProvisionalEnrollmentDetails"];
    }
    (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v8);
  }
}

void sub_10000B708( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_10000B744(uint64_t a1)
{
  uint64_t v1 = *(os_log_s **)DMCLogObjects(a1);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "seteuid failed. Exiting.", v2, 2u);
  }

  abort();
}

void sub_10000B798()
{
}

void sub_10000B818()
{
}

void sub_10000B898()
{
}

void sub_10000B918()
{
}

void sub_10000B998()
{
}

id objc_msgSend_profileIdentifierForProfileData_allowEmptyPayload_outIsSupervisionProfile_outProfileSigner_outMayInstallCloudProfile_outError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "profileIdentifierForProfileData:allowEmptyPayload:outIsSupervisionProfile:outProfileSigner:outMayInstallCloud Profile:outError:");
}

id objc_msgSend_retrieveCloudConfigurationFromURL_username_password_anchorCertificates_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveCloudConfigurationFromURL:username:password:anchorCertificates:completion:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}