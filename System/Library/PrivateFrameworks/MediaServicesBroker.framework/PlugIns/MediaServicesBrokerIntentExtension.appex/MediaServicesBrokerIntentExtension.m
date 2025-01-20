LABEL_48:
          v88 = sub_10000CCD4();
          v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
            sub_10000CD44(v89, v90, v91, v92, v93, v94, v95, v96);
          }

          v97 = -[MSBServiceUnavailableIntentHandler initWithReason:]( objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler),  "initWithReason:",  2LL);
          v98 = self->_serviceUnavailable;
          self->_serviceUnavailable = v97;

          goto LABEL_51;
        }

        v43 = (void *)objc_claimAutoreleasedReturnValue([v5 privateUpdateMediaAffinityIntentData]);
        v164 = (void *)objc_claimAutoreleasedReturnValue([v43 privateMediaIntentData]);

        v41 = (id *)&CMSExtensionEndpointIntentUpdateMediaAffinity;
      }
    }

    v45 = (NSString *)*v41;
    protocolEndpoint = self->_protocolEndpoint;
    self->_protocolEndpoint = v45;
    goto LABEL_27;
  }

LABEL_8:
  if (!self->_serviceUnavailable)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CMSCloudExtensionSession config](self->_serviceSession, "config"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 configForEndpoint:self->_protocolEndpoint]);
    v18 = v17 == 0LL;

    if (v18)
    {
      v19 = sub_10000CCD4();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_protocolEndpoint;
        v22 = (void *)objc_opt_class(v5);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v22;
        v23 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Service has no support for endpoint %{public}@ to handle a %{public}@",  buf,  0x16u);
      }

      v24 = -[MSBServiceUnavailableIntentHandler initWithReason:]( objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler),  "initWithReason:",  4LL);
      v25 = self->_serviceUnavailable;
      self->_serviceUnavailable = v24;
    }

    if (!self->_serviceUnavailable) {
      goto LABEL_52;
    }
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[IntentHandler networkActivity](self, "networkActivity"));
  [v26 completeActivity:3];

LABEL_51:
  self = (IntentHandler *)self->_serviceUnavailable;
LABEL_52:
  v80 = self;
LABEL_53:

  return v80;
}

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100005A28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t sub_100005AD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005AE0(uint64_t a1)
{
}

void sub_100005AE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10000CCD4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000CFEC();
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 externalContentIdentifier]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionIdentifier]);
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v5 userActivityPersistentIdentifier]);
      v13 = (void *)WeakRetained[19];
      WeakRetained[19] = v12;

      uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 userAccountHomeUserID]);
      v15 = (void *)WeakRetained[18];
      WeakRetained[18] = v14;

      uint64_t v16 = objc_claimAutoreleasedReturnValue([v5 applicationBundleID]);
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      id v19 = objc_alloc(&OBJC_CLASS___CMSPlayerContext);
      LODWORD(v20) = 1.0;
      id v21 = [v19 initForActivity:WeakRetained[19] queue:v11 content:v10 speed:v20];
      uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
      v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      id v24 = sub_10000CCD4();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_10000CF40(a1 + 40, a1 + 48, v25);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }

    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }
}

void sub_100005C98(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    id v9 = sub_10000CCD4();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D04C();
    }
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v12 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 9, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100005D48(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setMediaServicePublicDBInfo:v4];
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 serviceID]);

  [v5 setAppServiceID:v6];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100005DB0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_10000CCD4();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v7 serviceName]);
      int v14 = 138477827;
      v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Fetched service info %{private}@",  (uint8_t *)&v14,  0xCu);
    }

    [*(id *)(a1 + 32) setResolvedHomeUserID:v8];
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000D0AC();
    }
  }

  [*(id *)(a1 + 32) setMediaService:v7];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100005EE8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000CCD4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138477827;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Fetched homeUserID %{private}@",  (uint8_t *)&v13,  0xCu);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10000D10C();
  }

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) endpointIdentifier]);
  [v10 getCachedServiceInfo:v11 homeUserID:v5 endpointID:v12 completion:*(void *)(a1 + 56)];
}

void sub_100006008(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = -[CMSNetworkActivity initWithLabel:parentUUID:]( objc_alloc(&OBJC_CLASS___CMSNetworkActivity),  "initWithLabel:parentUUID:",  *(unsigned int *)(a1 + 56),  v5);
  [*(id *)(a1 + 40) setNetworkActivity:v8];
  id v9 = sub_10000CCD4();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(_DWORD *)(a1 + 56);
    int v12 = 138413058;
    int v13 = v8;
    __int16 v14 = 1024;
    int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Using network activity %@ with label %d from Siri parent %@ (error %@)",  (uint8_t *)&v12,  0x26u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000613C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sub_10000CCD4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000D16C();
    }
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void sub_1000061BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000CCD4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got configuration: %@", (uint8_t *)&v26, 0xCu);
    }

    id v10 = -[CMSCloudExtensionSession initWithConfiguration:authProviderDelegate:]( objc_alloc(&OBJC_CLASS___CMSCloudExtensionSession),  "initWithConfiguration:authProviderDelegate:",  v5,  *(void *)(a1 + 32));
    int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mediaService]);
    int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authCredential]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 authHeader]);
    -[MSBServiceUnavailableIntentHandler setAuthHeader:](v10, "setAuthHeader:", v13);

    -[MSBServiceUnavailableIntentHandler setQosClass:](v10, "setQosClass:", 33LL);
    -[MSBServiceUnavailableIntentHandler setIntentPlayerContext:]( v10,  "setIntentPlayerContext:",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sessionIdentifier]);
    -[MSBServiceUnavailableIntentHandler setSessionIdentifier:](v10, "setSessionIdentifier:", v14);

    int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) endpointIdentifier]);
    -[MSBServiceUnavailableIntentHandler setEndpointIdentifier:](v10, "setEndpointIdentifier:", v15);

    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) speakerHomeUserID]);
    -[MSBServiceUnavailableIntentHandler setRequesterHomeUserID:](v10, "setRequesterHomeUserID:", v16);

    id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) homeKitAllowExplicitContentSetting];
    id v18 = sub_10000CCD4();
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v17) {
        double v20 = @"YES";
      }
      else {
        double v20 = @"NO";
      }
      int v26 = 138412290;
      v27 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Informing 3P server, Allow Explicit Content Setting: %@",  (uint8_t *)&v26,  0xCu);
    }

    -[MSBServiceUnavailableIntentHandler setAllowExplicitContent:](v10, "setAllowExplicitContent:", v17);
    id v21 = [*(id *)(a1 + 32) _resolveUpdateListeningHistorySetting:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v22 = sub_10000CCD4();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v21) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      int v26 = 138412290;
      v27 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Informing 3P server, Overall Update Listening History: %@",  (uint8_t *)&v26,  0xCu);
    }

    -[MSBServiceUnavailableIntentHandler setUpdateUserTasteProfile:](v10, "setUpdateUserTasteProfile:", v21);
    [*(id *)(a1 + 32) setServiceSession:v10];
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000D1CC();
    }

    v25 = *(void **)(a1 + 32);
    id v10 = -[MSBServiceUnavailableIntentHandler initWithReason:]( objc_alloc(&OBJC_CLASS___MSBServiceUnavailableIntentHandler),  "initWithReason:",  3LL);
    [v25 setServiceUnavailable:v10];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

LABEL_23:
      v13.receiver = self;
      v13.super_class = (Class)&OBJC_CLASS___IntentHandler;
      int v11 = -[IntentHandler respondsToSelector:](&v13, "respondsToSelector:", a3);
LABEL_32:
      uint64_t v9 = v11;
      goto LABEL_33;
    }
  }

  else
  {
    if (!-[NSString isEqualToString:]( self->_protocolEndpoint,  "isEqualToString:",  CMSExtensionEndpointIntentUpdateMediaAffinity)) {
      goto LABEL_23;
    }
    if ("confirmUpdateMediaAffinity:completion:" == a3)
    {
      id v10 = &CMSProtocolUpdateMediaAffinityIntentHandlingConfirmMethodName;
      goto LABEL_31;
    }

    if ("resolveMediaItemsForUpdateMediaAffinity:withCompletion:" != a3)
    {
      if ("resolveAffinityTypeForUpdateMediaAffinity:withCompletion:" == a3)
      {
        id v10 = &CMSProtocolUpdateMediaAffinityIntentHandlingResolveAffinityTypeMethodName;
        goto LABEL_31;
      }

      goto LABEL_23;
    }
  }

  uint64_t v9 = 1;
LABEL_33:

  return v9;
}

void sub_100006870(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 authCredential]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 authToken]);

  if (!v8)
  {
LABEL_7:
    int v12 = 0LL;
    goto LABEL_8;
  }

  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 40LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 authCredential]);
  [v9 setAuthCredential:v10];

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 authCredential]);
  int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 authHeader]);

  if (!v12)
  {
    id v13 = sub_10000CCD4();
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000D22C(v5, v14);
    }

    if (!v6) {
      id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CMSCloudExtensionSessionErrorDomain,  9LL,  0LL));
    }
    goto LABEL_7;
  }

void sub_100006D4C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = sub_10000CCD4();
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  int v15 = v14;
  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 72);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v25 timeIntervalSinceDate:*(void *)(a1 + 56)];
      uint64_t v27 = v26;
      [*(id *)(*(void *)(a1 + 40) + 16) durationForMethod:*(void *)(a1 + 32)];
      uint64_t v29 = v28;
      [*(id *)(*(void *)(a1 + 40) + 16) totalDuration];
      uint64_t v30 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316419;
      uint64_t v49 = v24;
      __int16 v50 = 2048;
      uint64_t v51 = v27;
      __int16 v52 = 2048;
      uint64_t v53 = v29;
      __int16 v54 = 2048;
      uint64_t v55 = v31;
      __int16 v56 = 2114;
      uint64_t v57 = v30;
      __int16 v58 = 2113;
      id v59 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s Duration local %.3fs remote %.3fs/%.3fs for Result of %{public}@: %{private}@",  buf,  0x3Eu);
    }

    goto LABEL_25;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10000D434();
  }

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  unsigned int v17 = [v16 isEqualToString:CMSCloudExtensionSessionErrorDomain];

  if (!v17)
  {
LABEL_23:
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "protocolException", *(_OWORD *)&v42));

    if (!v40) {
      [*(id *)(a1 + 40) setProtocolException:v12];
    }
LABEL_25:
    [*(id *)(a1 + 40) reportAnalyticsForMethod:*(void *)(a1 + 32) forEventType:kCMSInterfaceAnalyticsDataRequestTSTypeServerCall];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
    v41 = *(void **)(a1 + 40);
    if (v12) {
      [v41 reportAnalyticsFail];
    }
    else {
      [v41 reportAnalyticsForMethod:*(void *)(a1 + 32) forEventType:kCMSInterfaceAnalyticsDataRequestTSTypeSuccessEnd];
    }
    goto LABEL_28;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 userInfo]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:CMSCloudExtensionSessionErrorUserDataExceptionKey]);

  if ([v12 code] != (id)8) {
    goto LABEL_22;
  }
  double v20 = (void *)objc_claimAutoreleasedReturnValue([v19 cmsOptionalNumberForKey:@"reason"]);
  id v21 = [v20 integerValue];

  if (v21 == (id)108)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v19 cmsOptionalNumberForKey:@"retryWithDelay"]);
    [v32 doubleValue];
    double v34 = v33;

    id v35 = sub_10000CCD4();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v34 < 0.0 || v34 > 5.0)
    {
      if (v37) {
        sub_10000D3D4();
      }
    }

    else
    {
      if (v37) {
        sub_10000D374();
      }

      dispatch_time_t v38 = dispatch_time(0LL, (uint64_t)(v34 * 1000000000.0));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100007190;
      block[3] = &unk_1000146A0;
      uint64_t v47 = *(void *)(a1 + 72);
      int8x16_t v42 = *(int8x16_t *)(a1 + 32);
      id v39 = (id)v42.i64[0];
      int8x16_t v44 = vextq_s8(v42, v42, 8uLL);
      id v45 = *(id *)(a1 + 48);
      id v46 = *(id *)(a1 + 64);
      dispatch_after(v38, &_dispatch_main_q, block);
    }

    goto LABEL_22;
  }

  if (v21 != (id)100)
  {
LABEL_22:

    goto LABEL_23;
  }

  id v22 = sub_10000CCD4();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10000D30C();
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
LABEL_28:
}

id sub_100007190(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performMethodInContext:*(void *)(a1 + 64) methodName:*(void *)(a1 + 40) params:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_100007334(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v6 completeActivity:3];

    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[INPlayMediaMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INPlayMediaMediaItemResolutionResult,  "unsupportedForReason:",  7LL));
    int v15 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }

  else
  {
    id v10 = [v5 cmsOptionalArrayOfDecodedClass:objc_opt_class(INPlayMediaMediaItemResolutionResult) forKey:@"resolutionResult"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([*(id *)(a1 + 32) _isResolutionResultTerminal:v8])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      else {
        uint64_t v12 = 2LL;
      }
      [v11 completeActivity:v12];
    }

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolPlayMediaIntentHandlingResolveMediaItemsMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
    }

    else
    {
      id v13 = sub_10000CCD4();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000D4A0();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

void sub_1000076A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INBooleanResolutionResult) forKey:@"resolutionResult"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolPlayMediaIntentHandlingResolvePlayShuffledMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 48)) {
        id v13 = "YES";
      }
      else {
        id v13 = "NO";
      }
      int v15 = 136315650;
      __int16 v16 = "-[IntentHandler resolvePlayShuffledForPlayMedia:withCompletion:]_block_invoke";
      if (v6) {
        id v14 = v6;
      }
      else {
        id v14 = v5;
      }
      __int16 v17 = 2080;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackShuffledValue: %s because of unusable result: %@",  (uint8_t *)&v15,  0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[INBooleanResolutionResult successWithResolvedValue:]( &OBJC_CLASS___INBooleanResolutionResult,  "successWithResolvedValue:",  *(unsigned __int8 *)(a1 + 48)));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_1000079D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INPlaybackRepeatModeResolutionResult) forKey:@"resolutionResult"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolPlayMediaIntentHandlingResolvePlaybackRepeatModeMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      if (v6) {
        id v14 = v6;
      }
      else {
        id v14 = v5;
      }
      int v15 = 136315650;
      __int16 v16 = "-[IntentHandler resolvePlaybackRepeatModeForPlayMedia:withCompletion:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackRepeatMode: %d because of unusable result: %@",  (uint8_t *)&v15,  0x1Cu);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[INPlaybackRepeatModeResolutionResult successWithResolvedPlaybackRepeatMode:]( &OBJC_CLASS___INPlaybackRepeatModeResolutionResult,  "successWithResolvedPlaybackRepeatMode:",  *(void *)(a1 + 48)));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_100007D08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INBooleanResolutionResult) forKey:@"resolutionResult"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolPlayMediaIntentHandlingResolveResumePlaybackMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 48)) {
        uint64_t v13 = "YES";
      }
      else {
        uint64_t v13 = "NO";
      }
      int v15 = 136315650;
      __int16 v16 = "-[IntentHandler resolveResumePlaybackForPlayMedia:withCompletion:]_block_invoke";
      if (v6) {
        id v14 = v6;
      }
      else {
        id v14 = v5;
      }
      __int16 v17 = 2080;
      int v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackResumePlaybackValue: %s because of unusable result: %@",  (uint8_t *)&v15,  0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[INBooleanResolutionResult successWithResolvedValue:]( &OBJC_CLASS___INBooleanResolutionResult,  "successWithResolvedValue:",  *(unsigned __int8 *)(a1 + 48)));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_100008040(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INPlaybackQueueLocationResolutionResult) forKey:@"resolutionResult"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolPlayMediaIntentHandlingResolvePlaybackQueueLocationMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      if (v6) {
        id v14 = v6;
      }
      else {
        id v14 = v5;
      }
      int v15 = 136315650;
      __int16 v16 = "-[IntentHandler resolvePlaybackQueueLocationForPlayMedia:withCompletion:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackQueueLocation: %d because of unusable result: %@",  (uint8_t *)&v15,  0x1Cu);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[INPlaybackQueueLocationResolutionResult successWithResolvedPlaybackQueueLocation:]( &OBJC_CLASS___INPlaybackQueueLocationResolutionResult,  "successWithResolvedPlaybackQueueLocation:",  *(void *)(a1 + 48)));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_100008374(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INDoubleResolutionResult) forKey:@"resolutionResult"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = -[INPlayMediaPlaybackSpeedResolutionResult initWithDoubleResolutionResult:]( objc_alloc(&OBJC_CLASS___INPlayMediaPlaybackSpeedResolutionResult),  "initWithDoubleResolutionResult:",  v8);
    (*(void (**)(uint64_t, INPlayMediaPlaybackSpeedResolutionResult *))(v9 + 16))(v9, v10);

    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolPlayMediaIntentHandlingResolvePlaybackSpeedMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v11 = sub_10000CCD4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      if (v6) {
        id v18 = v6;
      }
      else {
        id v18 = v5;
      }
      int v19 = 136315650;
      id v20 = "-[IntentHandler resolvePlaybackSpeedForPlayMedia:withCompletion:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackPlaybackSpeed: %@ because of unusable result: %@",  (uint8_t *)&v19,  0x20u);
    }

    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = objc_alloc(&OBJC_CLASS___INPlayMediaPlaybackSpeedResolutionResult);
    [*(id *)(a1 + 40) doubleValue];
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[INDoubleResolutionResult successWithResolvedValue:]( &OBJC_CLASS___INDoubleResolutionResult,  "successWithResolvedValue:"));
    __int16 v16 = -[INPlayMediaPlaybackSpeedResolutionResult initWithDoubleResolutionResult:]( v14,  "initWithDoubleResolutionResult:",  v15);
    (*(void (**)(uint64_t, INPlayMediaPlaybackSpeedResolutionResult *))(v13 + 16))(v13, v16);
  }
}

void sub_10000922C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, char a42)
{
}

void sub_1000092D8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a4)
  {
    id v10 = sub_10000CCD4();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000D5E8((uint64_t)WeakRetained, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v7;
  id v20 = v7;

  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v8;
  id v23 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000093A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10000CCD4();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Overriding Config Info: %@",  (uint8_t *)&v14,  0xCu);
    }

    id v10 = *(void **)(a1 + 32);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 configUrl]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 absoluteString]);
    objc_msgSend(v10, "na_safeSetObject:forKey:", v12, kCachedEndpointConfigurationURL);

    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 configDictionary]);
    objc_msgSend(v13, "na_safeSetObject:forKey:", v9, kCachedEndpointConfigurationDictionary);
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10000D658();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000950C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 56)) {
      goto LABEL_10;
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v7 completeActivity:2];
LABEL_9:

    goto LABEL_10;
  }

  id v4 = sub_10000CCD4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000D6B8();
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
  [v6 completeActivity:3];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  id v8 = [v3 code];

  if (v8 == (id)1003)
  {
    uint64_t v9 = -[INPlayMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INPlayMediaIntentResponse),  "initWithCode:userActivity:",  11LL,  0LL);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

    id v5 = 0;
    goto LABEL_11;
  }

  if (!-[NSString isEqualToString:](self->_speakerHomeUserID, "isEqualToString:", self->_resolvedHomeUserID))
  {
    uint64_t v9 = sub_10000CCD4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = 136315138;
      uint64_t v18 = "-[IntentHandler _resolveUpdateListeningHistorySetting:]";
      id v8 = "%s Music Playback Account is not the same as the speaker";
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  if ((+[CMSFeatureStatus isHomeMediaSettingsEnabled]( &OBJC_CLASS___CMSFeatureStatus,  "isHomeMediaSettingsEnabled") & 1) != 0)
  {
    id v5 = 1;
  }

  else
  {
    id v11 = sub_10000CCD4();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      resolvedHomeUserID = self->_resolvedHomeUserID;
      appBundleIdentifier = self->_appBundleIdentifier;
      id v15 = [v4 serviceUpdateListeningHistory];
      uint64_t v16 = @"NO";
      uint64_t v17 = 136315907;
      uint64_t v18 = "-[IntentHandler _resolveUpdateListeningHistorySetting:]";
      id v20 = resolvedHomeUserID;
      int v19 = 2113;
      if (v15) {
        uint64_t v16 = @"YES";
      }
      uint64_t v21 = 2113;
      uint64_t v22 = appBundleIdentifier;
      id v23 = 2112;
      id v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s User (%{private}@) Preference for %{private}@, Update Listening history : %@",  (uint8_t *)&v17,  0x2Au);
    }

    id v5 = [v4 serviceUpdateListeningHistory];
  }

void sub_100009ADC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100009B00(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handlePlayMediaIntent:*(void *)(a1 + 32) result:v7 error:v6 prepareQueueOnly:0 completion:*(void *)(a1 + 40)];
}

void sub_100009CEC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v6 completeActivity:3];

    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[INAddMediaMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INAddMediaMediaItemResolutionResult,  "unsupportedForReason:",  7LL));
    id v15 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }

  else
  {
    id v10 = [v5 cmsOptionalArrayOfDecodedClass:objc_opt_class(INAddMediaMediaItemResolutionResult) forKey:@"resolutionResult"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([*(id *)(a1 + 32) _isResolutionResultTerminal:v8])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      else {
        uint64_t v12 = 2LL;
      }
      [v11 completeActivity:v12];
    }

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolAddMediaIntentHandlingResolveMediaItemsMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
    }

    else
    {
      id v13 = sub_10000CCD4();
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000D788();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

void sub_10000A05C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INAddMediaMediaDestinationResolutionResult) forKey:@"resolutionResult"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolAddMediaIntentHandlingResolveMediaDestinationMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      if (v6) {
        id v16 = v6;
      }
      else {
        id v16 = v5;
      }
      int v17 = 136315650;
      uint64_t v18 = "-[IntentHandler resolveMediaDestinationForAddMedia:withCompletion:]_block_invoke";
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackMediaDestination: %@ because of unusable result: %@",  (uint8_t *)&v17,  0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = objc_alloc(&OBJC_CLASS___INAddMediaMediaDestinationResolutionResult);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[INMediaDestinationResolutionResult successWithResolvedMediaDestination:]( &OBJC_CLASS___INMediaDestinationResolutionResult,  "successWithResolvedMediaDestination:",  *(void *)(a1 + 40)));
    int v14 = -[INAddMediaMediaDestinationResolutionResult initWithMediaDestinationResolutionResult:]( v12,  "initWithMediaDestinationResolutionResult:",  v13);
    (*(void (**)(uint64_t, INAddMediaMediaDestinationResolutionResult *))(v11 + 16))(v11, v14);
  }
}

void sub_10000A384(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INAddMediaMediaItemResolutionResult) forKey:@"response"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolAddMediaIntentHandlingConfirmMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D7F4();
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v11 completeActivity:3];

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = -[INAddMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INAddMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
    (*(void (**)(uint64_t, INAddMediaIntentResponse *))(v12 + 16))(v12, v13);
  }
}

void sub_10000A640(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = sub_10000CCD4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000D8DC(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v15 completeActivity:3];

    uint64_t v16 = *(void *)(a1 + 40);
    int v17 = -[INAddMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INAddMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
    (*(void (**)(uint64_t, INAddMediaIntentResponse *))(v16 + 16))(v16, v17);
  }

  else
  {
    id v18 = [v5 cmsOptionalDecodedClass:objc_opt_class(INAddMediaIntentResponse) forKey:@"response"];
    int v17 = (INAddMediaIntentResponse *)objc_claimAutoreleasedReturnValue(v18);
    if (v17)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      [v19 completeActivity:2];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolAddMediaIntentHandlingHandleMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
    }

    else
    {
      id v20 = sub_10000CCD4();
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10000D870();
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      [v22 completeActivity:3];

      uint64_t v23 = *(void *)(a1 + 40);
      id v24 = -[INAddMediaIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INAddMediaIntentResponse),  "initWithCode:userActivity:",  5LL,  0LL);
      (*(void (**)(uint64_t, INAddMediaIntentResponse *))(v23 + 16))(v23, v24);
    }
  }
}

void sub_10000A96C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v6 completeActivity:3];

    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[INUpdateMediaAffinityMediaItemResolutionResult unsupportedForReason:]( &OBJC_CLASS___INUpdateMediaAffinityMediaItemResolutionResult,  "unsupportedForReason:",  7LL));
    uint64_t v15 = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }

  else
  {
    id v10 = [v5 cmsOptionalArrayOfDecodedClass:objc_opt_class(INUpdateMediaAffinityMediaItemResolutionResult) forKey:@"resolutionResult"];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ([*(id *)(a1 + 32) _isResolutionResultTerminal:v8])
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      else {
        uint64_t v12 = 2LL;
      }
      [v11 completeActivity:v12];
    }

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolUpdateMediaAffinityIntentHandlingResolveMediaItemsMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
    }

    else
    {
      id v13 = sub_10000CCD4();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000D94C();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }
  }
}

void sub_10000ACC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INMediaAffinityTypeResolutionResult) forKey:@"resolutionResult"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolUpdateMediaAffinityIntentHandlingResolveAffinityTypeMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      if (v6) {
        id v14 = v6;
      }
      else {
        id v14 = v5;
      }
      int v15 = 136315650;
      uint64_t v16 = "-[IntentHandler resolveAffinityTypeForUpdateMediaAffinity:withCompletion:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = v13;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%s Completing as fallbackMediaAffinityType: %d because of unusable result: %@",  (uint8_t *)&v15,  0x1Cu);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[INMediaAffinityTypeResolutionResult successWithResolvedMediaAffinityType:]( &OBJC_CLASS___INMediaAffinityTypeResolutionResult,  "successWithResolvedMediaAffinityType:",  *(void *)(a1 + 48)));
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

void sub_10000AFC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 cmsOptionalDecodedClass:objc_opt_class(INUpdateMediaAffinityIntentResponse) forKey:@"response"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolUpdateMediaAffinityIntentHandlingConfirmMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
  }

  else
  {
    id v9 = sub_10000CCD4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D9B8();
    }

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v11 completeActivity:3];

    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = -[INUpdateMediaAffinityIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INUpdateMediaAffinityIntentResponse),  "initWithCode:userActivity:",  4LL,  0LL);
    (*(void (**)(uint64_t, INUpdateMediaAffinityIntentResponse *))(v12 + 16))(v12, v13);
  }
}

void sub_10000B280(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = sub_10000CCD4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000DAA0(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
    [v15 completeActivity:3];

    uint64_t v16 = *(void *)(a1 + 40);
    __int16 v17 = -[INUpdateMediaAffinityIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INUpdateMediaAffinityIntentResponse),  "initWithCode:userActivity:",  4LL,  0LL);
    (*(void (**)(uint64_t, INUpdateMediaAffinityIntentResponse *))(v16 + 16))(v16, v17);
  }

  else
  {
    id v18 = [v5 cmsOptionalDecodedClass:objc_opt_class(INUpdateMediaAffinityIntentResponse) forKey:@"response"];
    __int16 v17 = (INUpdateMediaAffinityIntentResponse *)objc_claimAutoreleasedReturnValue(v18);
    if (v17)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      [v19 completeActivity:2];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      [*(id *)(a1 + 32) reportAnalyticsForMethod:CMSProtocolUpdateMediaAffinityIntentHandlingHandleMethodName forEventType:kCMSInterfaceAnalyticsDataRequestTSTypePostProcess];
    }

    else
    {
      id v20 = sub_10000CCD4();
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10000DA34();
      }

      id v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) networkActivity]);
      [v22 completeActivity:3];

      uint64_t v23 = *(void *)(a1 + 40);
      id v24 = -[INUpdateMediaAffinityIntentResponse initWithCode:userActivity:]( objc_alloc(&OBJC_CLASS___INUpdateMediaAffinityIntentResponse),  "initWithCode:userActivity:",  4LL,  0LL);
      (*(void (**)(uint64_t, INUpdateMediaAffinityIntentResponse *))(v23 + 16))(v23, v24);
    }
  }
}

LABEL_11:
  return v5;
}

void sub_10000C21C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000C22C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000C244(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_10000C284( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000C2C0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v42 - 176), 8) = a1;
}
}

id sub_10000CCD4()
{
  if (qword_100019C78 != -1) {
    dispatch_once(&qword_100019C78, &stru_100014870);
  }
  return (id)qword_100019C70;
}

void sub_10000CD14(id a1)
{
  os_log_t v1 = os_log_create("com.apple.msbextension", "log");
  v2 = (void *)qword_100019C70;
  qword_100019C70 = (uint64_t)v1;
}

void sub_10000CD44( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CDB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CE24( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CE58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CE8C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 136315395;
  id v4 = "-[IntentHandler handlerForIntent:]";
  __int16 v5 = 2113;
  uint64_t v6 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s Session will be configured with PlayerContext: %{private}@",  (uint8_t *)&v3,  0x16u);
  sub_10000C23C();
}

void sub_10000CF18()
{
  __assert_rtn( "-[IntentHandler handlerForIntent:]",  "IntentHandler.m",  148,  "_appBundleIdentifier == nil || [_appBundleIdentifier isEqualToString:appBundleIdentifier]");
}

void sub_10000CF40(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8LL) + 40LL);
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8LL) + 40LL);
  int v5 = 136315651;
  uint64_t v6 = "-[IntentHandler handlerForIntent:]_block_invoke";
  __int16 v7 = 2113;
  uint64_t v8 = v3;
  __int16 v9 = 2113;
  uint64_t v10 = v4;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s Now playing for %{private}@: %{private}@",  (uint8_t *)&v5,  0x20u);
}

void sub_10000CFEC()
{
}

void sub_10000D04C()
{
}

void sub_10000D0AC()
{
}

void sub_10000D10C()
{
}

void sub_10000D16C()
{
}

void sub_10000D1CC()
{
}

void sub_10000D22C(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 authCredential]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 tokenType]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 authCredential]);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 authToken]);
  int v9 = 138412546;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  sub_10000C244( (void *)&_mh_execute_header,  a2,  v8,  "No auth header for authAccessTokenType %@, token: %@",  (uint8_t *)&v9);
}

void sub_10000D30C()
{
}

void sub_10000D374()
{
}

void sub_10000D3D4()
{
}

void sub_10000D434()
{
  uint64_t v3 = v0;
  sub_10000C244((void *)&_mh_execute_header, v1, (uint64_t)v1, "%s Error: %@", v2);
  sub_10000C23C();
}

void sub_10000D4A0()
{
}

void sub_10000D50C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D57C()
{
}

void sub_10000D5E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D658()
{
}

void sub_10000D6B8()
{
}

void sub_10000D718()
{
}

void sub_10000D788()
{
}

void sub_10000D7F4()
{
  v1[0] = 136315394;
  sub_10000C270();
  sub_10000C244( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s Completing as INAddMediaIntentResponseCodeFailure because of unusable result: %@",  (uint8_t *)v1);
  sub_10000C23C();
}

void sub_10000D870()
{
}

void sub_10000D8DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D94C()
{
}

void sub_10000D9B8()
{
  v1[0] = 136315394;
  sub_10000C270();
  sub_10000C244( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s Completing as INUpdateMediaAffinityIntentResponseCodeFailure because of unusable result: %@",  (uint8_t *)v1);
  sub_10000C23C();
}

void sub_10000DA34()
{
}

void sub_10000DAA0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DB10()
{
}

void sub_10000DB7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DBEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DC5C()
{
}

void sub_10000DC88()
{
}

void sub_10000DCB4()
{
}

void sub_10000DCE0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DD50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DDC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DE30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:keyID:publicKey:URLSessionConfig uration:languageCode:completion:");
}

id objc_msgSend_requestAuthRenewalForMediaService_homeUserID_parentNetworkActivity_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:");
}

id objc_msgSend_sendPlaybackQueueWithUserActivityDictionary_forIntentID_toDestination_withIntentData_prepareQueue_withCompletion_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sendPlaybackQueueWithUserActivityDictionary:forIntentID:toDestination:withIntentData:prepareQueue:withCompletion:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}