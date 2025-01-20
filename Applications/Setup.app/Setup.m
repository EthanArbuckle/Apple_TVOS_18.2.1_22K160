}

LABEL_27:
    if (!v17)
    {
      v29 = sub_10002B004();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Present a view controller for this step..",  (uint8_t *)&v38,  2u);
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "aa_primaryAppleAccount"));
      if (v32)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue([v10 tapToSetupDeviceInfo]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 homeKitInfo]);

        v35 = sub_10002B004();
        v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 138412290;
          v39 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "We have a valid iCloud account on this device so will pass along any HomeKit info received over TTSU. homeKitInfo=%@",  (uint8_t *)&v38,  0xCu);
        }
      }

      else
      {
        v34 = 0LL;
      }

      -[SATVAirplay2Step _showAirplay2ViewControllerWithHomeKitInfo:isUpdateFlow:]( self,  "_showAirplay2ViewControllerWithHomeKitInfo:isUpdateFlow:",  v34,  [v10 isUpdate]);

      goto LABEL_37;
    }

    v8 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
LABEL_28:
    v25 = v8;
    goto LABEL_42;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  if (![v18 isUpdate])
  {
    if ([v18 isExpressTapToSetupEnabledForItemTypes:4])
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue([v18 tapToSetupDeviceInfo]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 buildVersion]);
      v29 = +[SATVSiriDiagnosticsStep _shouldTrustSiriDataSharingFromiOSBuild:]( &OBJC_CLASS___SATVSiriDiagnosticsStep,  "_shouldTrustSiriDataSharingFromiOSBuild:",  v28);

      if ((_DWORD)v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v18 tapToSetupDeviceInfo]);
        v29 = TVCSBoolForTriStateBool([v30 isSiriDataSharingEnabled], 0);
      }

      v31 = (os_log_s *)qword_100109A30;
      if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
      {
        v34[0] = 67109120;
        v34[1] = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup is enabled and Siri diagnostics was shown to the user. Will apply setting and skip step. enableDiagnostics=%{BOOL}d",  (uint8_t *)v34,  8u);
      }

      v23 = objc_claimAutoreleasedReturnValue(-[SATVSiriDiagnosticsStep _handleSiriDiagnosticsConsent:](self, "_handleSiriDiagnosticsConsent:", v29));
      goto LABEL_35;
    }

LABEL_28:
    -[SATVAirplay2Step _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 1LL);
    [v17 didEnterStateBackwards];
LABEL_37:
    v9 = 0LL;
LABEL_38:

    goto LABEL_39;
  }

  v7 = sub_10002B004();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v38) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  (uint8_t *)&v38,  2u);
  }

  -[SATVAirplay2Step _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 0LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKBasicStepResult,  "managedConfigurationSkipResult"));
LABEL_39:

  return v9;
}

void sub_100004F18(_Unwind_Exception *a1)
{
}

void sub_100004F48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100004F94(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithDidSetupHomeTheater:a2];
}

void sub_100005AC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100005AE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[3];
    if (v4 == *(void **)(a1 + 32))
    {
      id v9 = v4;
      v10 = (os_log_s *)qword_100109720;
      if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        id v12 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Starting touch remote setup manager. {manager_ptr=%p}",  (uint8_t *)&v11,  0xCu);
      }

      [v9 setUserInterfaceDelegate:*(void *)(a1 + 40)];
      [v9 start];
    }

    else
    {
      v5 = (os_log_s *)qword_100109720;
      if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_INFO))
      {
        v6 = *(void **)(a1 + 32);
        uint64_t v7 = v3[3];
        int v11 = 134218240;
        id v12 = v6;
        __int16 v13 = 2048;
        uint64_t v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Ignoring clean up completion, touch remote setup manager doesn't match. {expectedManager_ptr=%p, actualManager_ptr=%p}",  (uint8_t *)&v11,  0x16u);
      }
    }
  }

  else
  {
    v8 = (os_log_s *)qword_100109720;
    if (os_log_type_enabled((os_log_t)qword_100109720, OS_LOG_TYPE_ERROR)) {
      sub_100075FB0(v8);
    }
  }
}

void sub_100005EE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100005F04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndReset];
}

void sub_10000604C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    if (v3[7])
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVInternationalUtility sharedInstance]( &OBJC_CLASS___SATVInternationalUtility,  "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 localizedString:*(void *)(a1 + 40) forLanguage:*(void *)(*(void *)(a1 + 32) + 56)]);
    }

    else
    {
      id v6 = sub_10000D7CC(*(void **)(a1 + 40), @"Localizable");
      v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    }

    if (*(void *)(*(void *)(a1 + 32) + 56LL))
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[SATVInternationalUtility sharedInstance]( &OBJC_CLASS___SATVInternationalUtility,  "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedString:*(void *)(a1 + 48) forLanguage:*(void *)(*(void *)(a1 + 32) + 56)]);
    }

    else
    {
      id v9 = sub_10000D7CC(*(void **)(a1 + 48), @"Localizable");
      v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
    }

    if (*(void *)(*(void *)(a1 + 32) + 56LL))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[SATVInternationalUtility sharedInstance]( &OBJC_CLASS___SATVInternationalUtility,  "sharedInstance"));
      int v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedString:*(void *)(a1 + 56) forLanguage:*(void *)(*(void *)(a1 + 32) + 56)]);
    }

    else
    {
      id v12 = sub_10000D7CC(*(void **)(a1 + 56), @"Localizable");
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v5,  v8,  1LL));
    objc_initWeak(&location, *(id *)(a1 + 32));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100006388;
    v24[3] = &unk_1000C9418;
    objc_copyWeak(&v25, &location);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  1LL,  v24));
    [v13 addAction:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internalNavigationController]);
    v16 = *(void **)(a1 + 32);
    if (v15) {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 internalNavigationController]);
    }
    else {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 presentingViewController]);
    }
    [v17 presentViewController:v13 animated:1 completion:0];

    *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 1;
    if ((+[TVSBluetoothRemoteUtilities isAnyRemoteConnected]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "isAnyRemoteConnected") & 1) == 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000063E4;
      block[3] = &unk_1000C93A0;
      objc_copyWeak(&v23, &location);
      dispatch_block_t v18 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
      uint64_t v19 = *(void *)(a1 + 32);
      v20 = *(void **)(v19 + 64);
      *(void *)(v19 + 64) = v18;

      dispatch_time_t v21 = dispatch_time(0LL, 8000000000LL);
      dispatch_after(v21, &_dispatch_main_q, *(dispatch_block_t *)(*(void *)(a1 + 32) + 64LL));
      objc_destroyWeak(&v23);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  else
  {
    [v3 _dismissAndReset];
  }

void sub_100006368( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100006388(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[8];
    v5 = v2;
    if (v3)
    {
      dispatch_block_cancel(v3);
      v4 = (void *)v5[8];
      v5[8] = 0LL;

      int v2 = v5;
    }

    [v2 _dismissAndReset];
    int v2 = v5;
  }
}

void sub_1000063E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndReset];
}

id sub_100006564(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

void sub_100007B80(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

void sub_100007BB4(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) internationalUtility]);
  [v1 commitRegion];
}

void sub_100008668(_Unwind_Exception *a1)
{
}

void sub_100008698(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_1000086E4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithConsent:a2];
}

void sub_100008B74(_Unwind_Exception *a1)
{
}

void sub_100008BA4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100008BF0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult resultWithSuccess:]( &OBJC_CLASS___TVSKBasicStepResult,  "resultWithSuccess:",  a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v4 step:WeakRetained didCompleteWithResult:v3];
  }
}

id sub_100009060(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showLoginViewController];
}

void sub_1000092FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100009320(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    else {
      BOOL v9 = 0;
    }

    if (!v6 || v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v5 accountAltDSIDsByService]);
      id v16 = sub_100009670();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v32 = v5;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = v9;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Completed AISSetupViewController. {report=%@, userSkipped=%{BOOL}d, signedInAccounts=%@}",  buf,  0x1Cu);
      }

      uint64_t v18 = AIDAServiceTypeCloud;
      uint64_t v19 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:AIDAServiceTypeCloud]);
      if (v19
        && (v20 = (void *)v19,
            uint64_t v21 = AIDAServiceTypeStore,
            v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:AIDAServiceTypeStore]),
            v22,
            v20,
            v22))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v18]);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v21]);

        uint64_t v25 = 3LL;
        if (v23 == v24) {
          uint64_t v25 = 1LL;
        }
      }

      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v18]);
        BOOL v27 = v26 != 0LL;

        uint64_t v25 = 2LL * v27;
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000096B0;
      block[3] = &unk_1000C94F8;
      void block[4] = WeakRetained;
      block[5] = v25;
      dispatch_async(&_dispatch_main_q, block);
    }

    else
    {
      id v10 = sub_100009670();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
        *(_DWORD *)buf = 138543874;
        id v32 = v12;
        __int16 v33 = 2048;
        *(void *)v34 = [v6 code];
        *(_WORD *)&v34[8] = 2114;
        *(void *)&v34[10] = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Failed AISSetupViewController. {errorDomain=%{public}@, errorCode=%ld, error=%{public}@}",  buf,  0x20u);
      }

      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      else {
        BOOL v14 = 0;
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100009720;
      v28[3] = &unk_1000C9520;
      BOOL v29 = v14;
      v28[4] = WeakRetained;
      dispatch_async(&_dispatch_main_q, v28);
    }
  }
}

id sub_100009670()
{
  if (qword_100109740 != -1) {
    dispatch_once(&qword_100109740, &stru_1000C9588);
  }
  return (id)qword_100109738;
}

void sub_1000096B0(uint64_t a1)
{
  v4 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);
  if (v4) {
    v4[2](v4, *(void *)(a1 + 40));
  }
  int v2 = *(void **)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 setupViewController]);
  objc_msgSend(v2, "bs_removeChildViewController:", v3);
}

void sub_100009720(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  int v2 = *(void **)(a1 + 32);
  if (v1)
  {
    id v3 = (void (**)(void))objc_claimAutoreleasedReturnValue([v2 menuHandler]);
    if (v3)
    {
      v4 = v3;
      v3[2]();
      id v3 = v4;
    }
  }

  else
  {
    [v2 reset];
  }

void sub_100009824(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVManualViewController");
  int v2 = (void *)qword_100109738;
  qword_100109738 = (uint64_t)v1;
}

LABEL_16:
    BOOL v9 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
LABEL_17:
    v24 = v9;
    goto LABEL_18;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVRecognizeMyVoiceStep _primaryUserProfile](self, "_primaryUserProfile"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 iCloudAltDSID]);

  if (!v13)
  {
    id v23 = sub_10002B1C4();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      v22 = "No iCloud account. Will skip.";
      goto LABEL_15;
    }

    goto LABEL_16;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
  id v16 = objc_opt_class(&OBJC_CLASS___SATVRecognizeMyVoiceContainerViewController, v15);
  v17 = v14;
  uint64_t v18 = v17;
  if (v16)
  {
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
  }

  v26 = v19;

  BOOL v27 = [v4 isNavigationFlowForward];
  v28 = sub_10002B1C4();
  BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (!v27)
  {
    if (v30)
    {
      *(_WORD *)v54 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Navigation flow is backwards..", v54, 2u);
    }

    if (v26 && !self->_shouldSkipBackwardsNavigation) {
      v24 = 0LL;
    }
    else {
      v24 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    }
    self->_shouldSkipBackwardsNavigation = 0;
    goto LABEL_53;
  }

  if (v30)
  {
    *(_WORD *)v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Navigation flow is forwards..", v54, 2u);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 stepConfiguration]);
  __int16 v33 = objc_opt_class(&OBJC_CLASS___TVSKBooleanSettingStepConfiguration, v32);
  v34 = v31;
  v35 = v34;
  if (v33)
  {
    if ((objc_opt_isKindOfClass(v34, v33) & 1) != 0) {
      v36 = v35;
    }
    else {
      v36 = 0LL;
    }
  }

  else
  {
    v36 = 0LL;
  }

  v37 = v36;

  if (v37) {
    v38 = v37;
  }
  else {
    v38 = (id)objc_claimAutoreleasedReturnValue( +[TVSKBooleanSettingStepConfiguration defaultConfiguration]( &OBJC_CLASS___TVSKBooleanSettingStepConfiguration,  "defaultConfiguration"));
  }
  v39 = v38;

  v40 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 tapToSetupDeviceInfo]);
  v42 = (void *)objc_claimAutoreleasedReturnValue([v41 homeKitInfo]);

  v43 = (void *)objc_claimAutoreleasedReturnValue([v40 tapToSetupDeviceInfo]);
  v44 = [v43 isSiriVoiceProfileAvailable];

  if (v44)
  {
    if (-[SATVRecognizeMyVoiceStep _isHomeRecognizeMyVoiceEnabled:](self, "_isHomeRecognizeMyVoiceEnabled:", v42))
    {
      v45 = sub_10002B1C4();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v54 = 0;
        v47 = "Home has RMV enabled. Will enable and skip.";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v47, v54, 2u);
        goto LABEL_48;
      }

      goto LABEL_48;
    }

    if ([v39 shouldAutomaticallyEnable])
    {
      v51 = sub_10002B1C4();
      v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v54 = 0;
        v47 = "RMV is configured to automatically enable. Will enable and skip.";
        goto LABEL_47;
      }

  if (v4 | v8)
  {
LABEL_20:
    v20 = objc_alloc_init(&OBJC_CLASS___PBSCreateUserProfileAttributes);
    [v20 setType:0];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "aa_altDSID"));
    [v20 setICloudAltDSID:v21];

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "ams_altDSID"));
    [v20 setITunesAltDSID:v22];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_altDSID"));
    [v20 setGameCenterAltDSID:v23];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 preferredLanguages]);
    [v20 setPreferredLanguages:v25];

    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 preferredInputModeList]);
    [v20 setPreferredInputModes:v26];

    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVSKTapToSetupHomeKitInfo currentUserIdentifiers](self->_homeKitInfo, "currentUserIdentifiers"));
    v28 = sub_10001F6A0();
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v27 count];
      homeKitInfo = self->_homeKitInfo;
      *(_DWORD *)buf = 134218240;
      v40 = (uint64_t)v30;
      v41 = 2048;
      v42 = homeKitInfo;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Known home user identifiers for primary profile. {count=%ld, homeKitInfo_ptr=%p}",  buf,  0x16u);
    }

    [v20 setKnownHomeUserIdentifiers:v27];
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance"));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10001FB60;
    v33[3] = &unk_1000C99D8;
    v33[4] = self;
    [v32 createUserProfileWithAttributes:v20 completionHandler:v33];
  }

  else
  {
    uint64_t v18 = sub_10001F6A0();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No iCloud or iTunes signed in, primary profile won't be created.",  buf,  2u);
    }

    -[SATVCreatePrimaryProfileStep _stepDidComplete](self, "_stepDidComplete");
  }
}

LABEL_48:
      v50 = 1LL;
      -[SATVRecognizeMyVoiceStep _enableRecognizeMyVoice:](self, "_enableRecognizeMyVoice:", 1LL);
      goto LABEL_49;
    }

    if (![v39 shouldAutomaticallyDisable])
    {
      v24 = 0LL;
      goto LABEL_50;
    }

    v52 = sub_10002B1C4();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "RMV is configured to automatically disable. Will disable and skip.",  v54,  2u);
    }

    -[SATVRecognizeMyVoiceStep _enableRecognizeMyVoice:](self, "_enableRecognizeMyVoice:", 0LL);
  }

  else
  {
    v48 = sub_10002B1C4();
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Voice profile unavailable. Will skip.",  v54,  2u);
    }
  }

  v50 = 0LL;
LABEL_49:
  v24 = objc_claimAutoreleasedReturnValue( -[SATVRecognizeMyVoiceStep _handleRecognizeMyVoiceEnabled:]( self,  "_handleRecognizeMyVoiceEnabled:",  v50,  *(void *)v54));
LABEL_50:

LABEL_53:
  if (!(v24 | v26)) {
    -[SATVRecognizeMyVoiceStep _showRecognizeMyVoiceViewController](self, "_showRecognizeMyVoiceViewController");
  }
LABEL_18:

  return (id)v24;
}

void sub_10000ABFC(_Unwind_Exception *a1)
{
}

void sub_10000AC3C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _completeStepWithRecognizeMyVoiceEnabled:a2];
    id WeakRetained = v4;
  }
}

void sub_10000AC7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    int v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10000ACC8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setShouldSkipBackwardsNavigation:1];
    [v2 _completeStepWithRecognizeMyVoiceEnabled:0];
    id WeakRetained = v2;
  }
}

LABEL_17:
    if ([v9 isRMVEnabled])
    {
      v17 = sub_10002B1C4();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Matched home has RMV enabled.", buf, 2u);
      }

      uint64_t v19 = 1;
      goto LABEL_25;
    }
  }

  v20 = sub_10002B1C4();
  BOOL v9 = (id)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Home not found or does not have RMV enabled.",  buf,  2u);
  }

  uint64_t v19 = 0;
LABEL_25:

  return v19;
}

  else {
    uint64_t v19 = v11;
  }
  if ((v19 & 1) == 0)
  {
    v24 = sub_10002AF94();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[SATVNetworkReachability _performReachabilityRequestWithRetryCount:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: retrying", buf, 0xCu);
    }

    v26 = dispatch_time(0LL, 5000000000LL);
    global_queue = dispatch_get_global_queue(0LL, 0LL);
    v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003DF68;
    block[3] = &unk_1000CA328;
    BOOL v29 = *(void *)(a1 + 56);
    void block[4] = WeakRetained;
    id v32 = v29;
    v31 = *(id *)(a1 + 32);
    dispatch_after(v26, v28, block);

    goto LABEL_30;
  }

    if (!v12) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }

  if (((v9 ^ 1 | v11) & 1) != 0)
  {
    if (((v9 | v14) & 1) == 0)
    {
      id v12 = 2LL * (v13 == (id)1);
      goto LABEL_17;
    }
  }

  else if (v12 == 1)
  {
    v15 = @"EXPRESS_SETUP_SIRI_INFO";
LABEL_23:
    id v16 = sub_10000D7CC(v15, @"Localizable");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v12 = (uint64_t)[[TVSKExpressTapToSetupItem alloc] initWithTypes:v12 descriptionText:v17 imageSymbolName:@"mic.fill" imageSymbolScale:2];

    goto LABEL_24;
  }

void sub_10000B15C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10002B1C4();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100075FF0(a1, (uint64_t)v3, v6);
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(_BYTE *)(a1 + 40)) {
      v8 = @"enabled";
    }
    else {
      v8 = @"disabled";
    }
    int v9 = 138412546;
    id v10 = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RMV %@ for %@", (uint8_t *)&v9, 0x16u);
  }
}

void sub_10000B4E0(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___SATVLegalPresentation);
  id v2 = (void *)qword_100109748;
  qword_100109748 = (uint64_t)v1;
}

void sub_10000B8EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000B928(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _warrantyAccepted];
    id WeakRetained = v2;
  }
}

void sub_10000B958(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained warrantyDelegate]);
    [v2 didRefuseWarranty];

    id WeakRetained = v3;
  }
}

void sub_10000BA4C(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___SATVInternationalUtility);
  id v2 = (void *)qword_100109758;
  qword_100109758 = (uint64_t)v1;
}

void sub_10000BD68(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _pairingHelpStringWithString:a2]);
  [v2 addObject:v3];
}

LABEL_20:
  return v17;
}

    v8 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
LABEL_21:
    v20 = v8;
    goto LABEL_22;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 setupSession]);
  if ([v16 isExpressTapToSetupEnabledForItemTypes:32])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 tapToSetupDeviceInfo]);
    uint64_t v18 = TVCSBoolForTriStateBool([v17 isAppAnalyticSubmissionsAllowed], 0);

    uint64_t v19 = (os_log_s *)qword_100109928;
    if (os_log_type_enabled((os_log_t)qword_100109928, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup is enabled and app analytics was shown to the user. Will apply app analytics setting and sk ip step. enableAppAnalytics=%{BOOL}d",  (uint8_t *)v23,  8u);
    }

    v20 = objc_claimAutoreleasedReturnValue(-[SATVAppAnalyticsStep _handleDidConsentToAnalytics:](self, "_handleDidConsentToAnalytics:", v18));
  }

  else
  {
    v20 = 0LL;
  }

  if (!(v20 | v15))
  {
    v22 = (os_log_s *)qword_100109928;
    if (os_log_type_enabled((os_log_t)qword_100109928, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Will create and display a view controller for this step.",  (uint8_t *)v23,  2u);
    }

    -[SATVAppAnalyticsStep _showAppAnalyticsViewController](self, "_showAppAnalyticsViewController");
  }

LABEL_22:
  return (id)v20;
}
}

          -[SATVLoginStep _showLoginViewController](self, "_showLoginViewController", v18);
        }

void sub_10000D350(uint64_t a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob_button_menu"));
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _attributedStringWithImage:v10]);
  id v3 = (void *)qword_100109768;
  qword_100109768 = v2;

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob_button_plus"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _attributedStringWithImage:v4]);
  id v6 = (void *)qword_100109770;
  qword_100109770 = v5;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"oob_button_back"));
  uint64_t v8 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _attributedStringWithImage:v7]);
  int v9 = (void *)qword_100109778;
  qword_100109778 = v8;
}

void sub_10000D780( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000D798(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

  ;
}

void sub_10000D7B0(id obj)
{
}

id sub_10000D7C0()
{
  return (id)qword_100109788;
}

id sub_10000D7CC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v6 = v5;
  if (!qword_100109788) {
    goto LABEL_5;
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_1000CB560));
  if ([v7 isEqual:v3])
  {

LABEL_5:
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v3 value:&stru_1000CB560 table:v4]);
    goto LABEL_6;
  }

  if (!v7) {
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

void sub_10000D9C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10000D9DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000DA80;
  v5[3] = &unk_1000C9640;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000DA80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id, BOOL))v4 + 2))(v4, *(void *)(a1 + 32) == 0LL);
    id v3 = v4;
  }
}

uint64_t sub_10000DAE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000F0BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000F0E0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F158;
  block[3] = &unk_1000C93A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_10000F158(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showEraseDeviceAlert];
}

void sub_10000F260( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10000F284(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000F2FC;
  block[3] = &unk_1000C93A0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_10000F2FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _leaveRemoteManagementAndErase];
}

void sub_10000F3C8(_Unwind_Exception *a1)
{
}

void sub_10000F3EC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = sub_10000D7CC(@"REMOTE_MANAGEMENT_LEAVE_FAILED_ALERT_TITLE", @"Localizable");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v5 = sub_10000D7CC(@"REMOTE_MANAGEMENT_LEAVE_FAILED_ALERT_BODY", @"Localizable");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

    id v8 = sub_10000D7CC(@"OK", @"Localizable");
    int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  1LL,  0LL));

    [v7 addAction:WeakRetained];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10000F5A0;
    v14[3] = &unk_1000C9640;
    objc_copyWeak(&v16, (id *)(a1 + 32));
    id v15 = v7;
    id v11 = v7;
    dispatch_async(&_dispatch_main_q, v14);

    objc_destroyWeak(&v16);
  }

  else
  {
    id v12 = sub_10002AF94();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Unenroll is successfull. Erasing the device...",  buf,  2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _obliterate];
  }
}

void sub_10000F5A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
  [v2 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
}

void sub_10000F634(id a1, NSError *a2)
{
  id v2 = sub_10002AF94();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Obliterate failed after remote management unenroll",  v4,  2u);
  }
}

LABEL_8:
}

    BOOL v14 = 0;
    goto LABEL_9;
  }

  id v8 = sub_10002AF94();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      v17 = 0;
      id v11 = "Sync has already been enabled OR disabled which means we have advertised this to the user before. Skip showing the prompt..";
      id v12 = (uint8_t *)&v17;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (v10)
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "We haven't yet advertised One Home Screen to the user yet. We need to show the prompt..",  v16,  2u);
  }

  BOOL v14 = 1;
LABEL_9:

  return v14;
}

    [v4 terminateWithSuccess];
    goto LABEL_9;
  }

  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Suspending!", buf, 2u);
  }

  [v4 suspend];
  id v11 = dispatch_time(0LL, 3000000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000185F4;
  block[3] = &unk_1000C9468;
  __int16 v13 = v4;
  dispatch_after(v11, &_dispatch_main_q, block);

LABEL_9:
}
}
}

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v12 deactivateScreenSaver];
}

    (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 1LL);
    goto LABEL_12;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100078320();
  }

  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
LABEL_12:
}

        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAuthenticationView gridFocusGuide](self, "gridFocusGuide"));
        id v12 = v11;
        __int16 v13 = 0LL;
        goto LABEL_9;
      }

      id v7 = v6;
    }

    goto LABEL_8;
  }

        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
        id v12 = v11;
        __int16 v13 = 0LL;
        goto LABEL_9;
      }

      id v7 = v6;
    }

    goto LABEL_8;
  }
}

void sub_100010184( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000101A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained activeInterface]);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100010228;
    v4[3] = &unk_1000C9490;
    v4[4] = v2;
    [v3 commitChangesWithCompletion:v4];
  }
}

id sub_100010228(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteNetworkConfigurationWizard:0];
}

void sub_100010470( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100010494(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
    id v3 = [v2 popToViewController:v5 animated:1];

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 tableView]);
    [v4 reloadData];

    id WeakRetained = v5;
  }
}

void sub_100011500(_Unwind_Exception *a1)
{
}

void sub_100011530(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10001157C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithEnableLocationServices:a2 locationServicesAuthorizationInfo:0];
}

LABEL_7:
  return v9;
}

LABEL_33:
  if (v4) {
    self->_length = v33;
  }
  path1a = CGPathCreateMutable();
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v126 = v10;
  v66 = [v126 countByEnumeratingWithState:&v143 objects:v157 count:16];
  if (v66)
  {
    v67 = v66;
    v68 = *(void *)v144;
    do
    {
      for (j = 0LL; j != v67; j = (char *)j + 1)
      {
        if (*(void *)v144 != v68) {
          objc_enumerationMutation(v126);
        }
        v70 = *(void **)(*((void *)&v143 + 1) + 8LL * (void)j);
        if ([v70 count])
        {
          Mutable = CGPathCreateMutable();
          v72 = (void *)objc_claimAutoreleasedReturnValue([v70 objectAtIndexedSubscript:0]);
          [v72 n];
          v74 = -v73;
          [v72 n];
          v76 = atan2f(v74, -v75);
          [v72 p];
          v78 = v77;
          [v72 p];
          v80 = v79;
          [v72 r];
          CGPathAddArc(Mutable, 0LL, v78, v80, v81, v76, v76 + 3.14159265, 0);
          v141 = 0u;
          v142 = 0u;
          v139 = 0u;
          v140 = 0u;
          v82 = v70;
          v83 = [v82 countByEnumeratingWithState:&v139 objects:v156 count:16];
          if (v83)
          {
            v84 = v83;
            v85 = *(void *)v140;
            do
            {
              for (k = 0LL; k != v84; k = (char *)k + 1)
              {
                if (*(void *)v140 != v85) {
                  objc_enumerationMutation(v82);
                }
                v87 = *(void **)(*((void *)&v139 + 1) + 8LL * (void)k);
                [v87 p];
                v133 = v88;
                [v87 n];
                v90 = v89;
                [v87 r];
                v92 = vmla_n_f32(v133, v90, v91);
                CGPathAddLineToPoint(Mutable, 0LL, v92.f32[0], v92.f32[1]);
              }

              v84 = [v82 countByEnumeratingWithState:&v139 objects:v156 count:16];
            }

            while (v84);
          }

          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectAtIndexedSubscript:", (char *)objc_msgSend(v82, "count") - 1));
          [v93 n];
          v95 = v94;
          [v93 n];
          v97 = atan2f(v95, v96);
          [v93 p];
          v99 = v98;
          [v93 p];
          v101 = v100;
          [v93 r];
          CGPathAddArc(Mutable, 0LL, v99, v101, v102, v97, v97 + 3.14159265, 0);
          v137 = 0u;
          v138 = 0u;
          v135 = 0u;
          v136 = 0u;
          v103 = (void *)objc_claimAutoreleasedReturnValue([v82 reverseObjectEnumerator]);
          v104 = [v103 countByEnumeratingWithState:&v135 objects:v155 count:16];
          if (v104)
          {
            v105 = v104;
            v106 = *(void *)v136;
            do
            {
              for (m = 0LL; m != v105; m = (char *)m + 1)
              {
                if (*(void *)v136 != v106) {
                  objc_enumerationMutation(v103);
                }
                v108 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)m);
                [v108 p];
                v134 = v109;
                [v108 n];
                v111 = v110;
                [v108 r];
                v113 = vmls_lane_f32(v134, v111, v112, 0);
                CGPathAddLineToPoint(Mutable, 0LL, v113.f32[0], v113.f32[1]);
              }

              v105 = [v103 countByEnumeratingWithState:&v135 objects:v155 count:16];
            }

            while (v105);
          }

          CGPathAddPath(path1a, 0LL, Mutable);
          CGPathRelease(Mutable);
        }
      }

      v67 = [v126 countByEnumeratingWithState:&v143 objects:v157 count:16];
    }

    while (v67);
  }

  return path1a;
}

    if ([v4 isNavigationFlowForward])
    {
      v41 = (void *)qword_100109978;
      if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _deviceLanguage](&OBJC_CLASS___NSLocale, "_deviceLanguage"));
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v49 = v17;
        *(_WORD *)&v49[4] = 2114;
        *(void *)&v49[6] = v43;
        *(_WORD *)&v49[14] = 2114;
        *(void *)&v49[16] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Will create and show a view controller for this step. {isSiriAvailable=%{BOOL}d, currentSystemLanguage=%{publi c}@, TTSUDeviceSiriLanguage=%{public}@",  buf,  0x1Cu);
      }

      -[SATVSiriAndDictationStep _showViewControllerBasedOnSiriAvailability:TTSUDeviceSiriLanguage:]( self,  "_showViewControllerBasedOnSiriAvailability:TTSUDeviceSiriLanguage:",  v17,  v11);
    }

    id v8 = 0LL;
    goto LABEL_38;
  }

  id v7 = (os_log_s *)qword_100109978;
  if (os_log_type_enabled((os_log_t)qword_100109978, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Cloud config utility reporting that we should skip this step.",  buf,  2u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKConsentStepResult managedConfigurationSkipResult]( &OBJC_CLASS___TVSKConsentStepResult,  "managedConfigurationSkipResult"));
LABEL_41:

  return v8;
}

void sub_100012F58(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SATVBluetoothRemotePairingManager);
  id v2 = (void *)qword_100109798;
  qword_100109798 = (uint64_t)v1;
}

id sub_100013110(uint64_t a1, void *a2)
{
  return [a2 _forgetCurrentNetworkAndPushWiFiController];
}

LABEL_10:
    -[SATVNetworkValidationViewController _connectionSucceeded](self, "_connectionSucceeded");
    return;
  }

  if (v16)
  {
    v17 = 136315138;
    uint64_t v18 = "-[SATVNetworkValidationViewController _determineActiveInterface]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: No active interface, pushing WiFi controller",  (uint8_t *)&v17,  0xCu);
  }

  -[SATVNetworkValidationViewController _pushWiFiController](self, "_pushWiFiController");
}

  uint64_t v18 = sub_10002555C();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v20) {
      sub_100076DE4(v9);
    }
  }

  else
  {
    if (v20) {
      sub_100076EB0(v14, v19);
    }

    id v32 = @"statusCode";
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v14));
    __int16 v33 = v19;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    int v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.purplebuddy.activation",  1LL,  v21));
  }

  v22 = -[SATVLogBuilder initWithContext:name:]( objc_alloc(&OBJC_CLASS___SATVLogBuilder),  "initWithContext:name:",  @"TVSetup",  @"Activation");
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder logger](v22, "logger"));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_100076D60(v22, (uint64_t)v9);
  }

  v24 = (void *)a1[4];
  uint64_t v25 = v24[7];
  if (v25)
  {
    (*(void (**)(void, void, void, void, id))(v25 + 16))(v24[7], 0LL, 0LL, 0LL, v9);
    v24 = (void *)a1[4];
  }

  [v24 _cleanup];

LABEL_21:
  v26 = *(void *)(a1[6] + 8LL);
  BOOL v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = 0LL;
}

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000711D8;
    v14[3] = &unk_1000CB160;
    id v15 = (os_log_s *)v3;
    TMSetupTime(&_dispatch_main_q, v14, 60.0);
    id v7 = v15;
    goto LABEL_11;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 components:4 fromDate:v9]);

  id v10 = (uint64_t)-[os_log_s year](v7, "year");
  id v11 = sub_10002555C();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  __int16 v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10 < 2017)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Time does not look correct",  buf,  2u);
    }

    goto LABEL_10;
  }

  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Time looks reasonable - Skipping time set",  buf,  2u);
  }

  if (v3) {
    (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1LL, 0LL);
  }
LABEL_11:
}

id sub_100013D64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pushWiFiController];
}

void sub_100014074(_Unwind_Exception *a1)
{
}

void sub_10001409C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (!a2)
  {
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([WeakRetained wiFiInterface]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100014150;
    v7[3] = &unk_1000C9490;
    v7[4] = v4;
    [v6 commitChangesWithCompletion:v7];
    goto LABEL_5;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

  if (v5)
  {
    id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completionHandler]);
    v6[2](v6, 0LL);
LABEL_5:
  }
}

id sub_100014150(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wiFiInterface]);
  unsigned int v3 = [v2 isActive];

  if (v3) {
    return [*(id *)(a1 + 32) _connectionSucceeded];
  }
  id v5 = sub_10002AF94();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[SATVNetworkValidationViewController _pushWiFiController]_block_invoke_2";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: WiFi network has been associated but the interface is marked as not active. Will start monitoring the interface.",  (uint8_t *)&v7,  0xCu);
  }

  return [*(id *)(a1 + 32) _observeWiFiInterfaceChanges];
}

void sub_1000153D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _cycleAtBeginTime:CACurrentMediaTime()];
  }
}

void sub_100015A40(id a1)
{
  uint64_t v1 = (void *)qword_1001097B8;
  qword_1001097B8 = (uint64_t)@"DisplayMode";
}

void sub_100015AF8(id a1, SATVHelloViewController *a2)
{
}

void sub_100015EB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_100015F18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    if (WeakRetained[5])
    {
      [WeakRetained _removeProximityPairingBanner];
      [v2 _showProximityPairingStartedBanner];
    }

    else
    {
      [WeakRetained _removeHelloHeader];
      [v2 _showHelloHeader];
    }

    id WeakRetained = v2;
    if (v2[6])
    {
      [v2 _removePairingInstructionsFooter];
      [v2 _showPairingInstructionsFooter];
      id WeakRetained = v2;
    }
  }
}

void sub_100015F94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showProximityPairingStartedBanner];
}

void sub_100015FC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showProximityPairingFailedBanner];
}

void sub_100015FEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPairingSpinner:1];
}

void sub_100016FD0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pairingInstructionsFooterView]);
  [v2 setAlpha:0.0];

  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) headerViewCenterXConstraint]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  unsigned int v5 = [v4 _shouldReverseLayoutDirection];
  double v6 = -298.0;
  if (v5) {
    double v6 = 298.0;
  }
  [v3 setConstant:v6];

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v7 layoutIfNeeded];
}

id sub_10001707C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryToComplete];
}

id sub_1000171C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCompletionHandler];
}

id sub_100017BD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishBuddy];
}

void sub_100017F74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100017FB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishBuddyWhenReady];
}

id sub_1000183FC(uint64_t a1, void *a2)
{
  return [a2 _localeChanged];
}

id sub_1000185F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) terminateWithSuccess];
}

LABEL_6:
    -[TVSetupController respring](self, "respring");
    goto LABEL_7;
  }

  return v10;
}
}

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVPreviewTableViewController tableView](self, "tableView"));
  id v15 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTableViewTextCell);
  id v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 dequeueReusableCellWithIdentifier:v17 forIndexPath:v6]);

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 textLabel]);
  [v19 setText:v13];

  return v18;
}

void sub_1000190FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _cycleAtBeginTime:CACurrentMediaTime()];
  }
}

LABEL_14:
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult successResult]( &OBJC_CLASS___TVSKBasicStepResult,  "successResult",  *(void *)v17));
    goto LABEL_15;
  }

  if (([v4 isNavigationFlowForward] & 1) == 0)
  {
    BOOL v14 = (os_log_s *)qword_1001097C8;
    if (os_log_type_enabled((os_log_t)qword_1001097C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      id v15 = "Navigation flow is backwards. Finished executing the step.";
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v8 = [v7 isSupervised];

  int v9 = (void *)qword_1001097C8;
  if (os_log_type_enabled((os_log_t)qword_1001097C8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
    *(_DWORD *)v17 = 138412290;
    *(void *)&v17[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Is device supervised? : %@", v17, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSKBasicStepResult resultWithSuccess:]( &OBJC_CLASS___TVSKBasicStepResult,  "resultWithSuccess:",  1LL));
  uint64_t v13 = v12;
  if ((_DWORD)v8) {
    [v12 setFlowOptions:1];
  }
LABEL_15:

  return v13;
}

  -[SATVChooseOptionView setNeedsLayout](self, "setNeedsLayout");
}
}

void sub_10001A1B0(_Unwind_Exception *a1)
{
}

void sub_10001A1DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);

  if (v1)
  {
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);
    v2[2]();
  }
}

void sub_10001A23C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v2 = [v1 shouldSkipEnrollment];

  if (v2)
  {
    [WeakRetained _callCompletionHandler];
  }

  else
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _loadingCloudConfigViewController]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navController]);
    [v4 pushViewController:v3 animated:1];
  }
}

void sub_10001A3EC(_Unwind_Exception *a1)
{
}

void sub_10001A418(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  [v1 reset];

  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navController]);
  id v3 = [v2 popViewControllerAnimated:1];
}

void sub_10001A488(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (a2)
  {
    [WeakRetained _callCompletionHandler];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained cloudConfigFetchFailureHandler]);

    if (v4)
    {
      unsigned int v5 = (void (**)(void))objc_claimAutoreleasedReturnValue([v9 cloudConfigFetchFailureHandler]);
      v5[2]();
    }

    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    [v6 reset];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 navController]);
  id v8 = [v7 popViewControllerAnimated:1];
}

id sub_10001A6A8()
{
  v0 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  @"/System/Library/CoreServices/SystemVersion.plist");
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v0, "objectForKey:", @"ProductBuildVersion"));

  return v1;
}

id sub_10001A6F8()
{
  v0 = (void *)qword_1001097D8;
  if (!qword_1001097D8)
  {
    uint64_t v1 = (__CFString *)MGCopyAnswer(@"ProductVersion", 0LL);
    unsigned int v2 = (__CFString *)MGCopyAnswer(@"BuildVersion", 0LL);
    id v3 = (__CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
    if (!-[__CFString length](v1, "length"))
    {

      uint64_t v1 = @"1.0";
    }

    if (!-[__CFString length](v2, "length"))
    {

      unsigned int v2 = @"1A001a";
    }

    if (!-[__CFString length](v3, "length"))
    {

      id v3 = &stru_1000CB560;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"iOS %@ %@ %@ Setup Assistant",  v1,  v2,  v3));
    id v5 = [v4 copy];
    double v6 = (void *)qword_1001097D8;
    qword_1001097D8 = (uint64_t)v5;

    id v7 = sub_10002AF94();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = qword_1001097D8;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setup Assistant User-Agent = %@", buf, 0xCu);
    }

    v0 = (void *)qword_1001097D8;
  }

  return v0;
}

BOOL sub_10001A880()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 objectAtIndex:0]);
  NSLocaleLanguageDirection v2 = +[NSLocale characterDirectionForLanguage:](&OBJC_CLASS___NSLocale, "characterDirectionForLanguage:", v1);

  return v2 == NSLocaleLanguageDirectionRightToLeft;
}

uint64_t sub_10001A8E8()
{
  return 0LL;
}

id sub_10001A8F0()
{
  return +[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor");
}

id sub_10001A8FC(void *a1, double a2)
{
  id v3 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = 1LL;
  do
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%d", v3, v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _deviceSpecificImageNamed:](&OBJC_CLASS___UIImage, "_deviceSpecificImageNamed:", v6));

    if (!v7) {
      break;
    }
    [v4 addObject:v7];

    uint64_t v5 = (v5 + 1);
  }

  while ((_DWORD)v5 != 1025);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage animatedImageWithImages:duration:]( &OBJC_CLASS___UIImage,  "animatedImageWithImages:duration:",  v4,  a2));

  return v8;
}

id sub_10001A9E8()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v1 = [v0 fileExistsAtPath:@"/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"];

  return v1;
}

uint64_t sub_10001AB34()
{
  uint64_t result = sub_10002AF30();
  if ((_DWORD)result)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v2 = [v1 BOOLForKey:@"CLIMode"];

    return (uint64_t)v2;
  }

  return result;
}

uint64_t sub_10001AB80()
{
  uint64_t result = sub_10002AF30();
  if ((_DWORD)result)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    id v2 = [v1 BOOLForKey:@"SkipDisplaySteps"];

    return (uint64_t)v2;
  }

  return result;
}

SATVAirplay2HomeKitDataSourceHome *sub_10001BA50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[SATVAirplay2HomeKitDataSourceHome initWithHome:]( objc_alloc(&OBJC_CLASS___SATVAirplay2HomeKitDataSourceHome),  "initWithHome:",  v3);
  id v5 = *(id *)(a1 + 32);

  if (v5 == v3) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 24LL), v4);
  }
  return v4;
}

SATVAirplay2DataSourceObject *__cdecl sub_10001BBA8(id a1, TVCSRoom *a2)
{
  id v2 = a2;
  id v3 = -[SATVAirplay2HomeKitDataSourceRoom initWithRoom:]( objc_alloc(&OBJC_CLASS___SATVAirplay2HomeKitDataSourceRoom),  "initWithRoom:",  v2);

  return (SATVAirplay2DataSourceObject *)v3;
}

LABEL_11:
  return v8;
}
}

  return v8;
}

BOOL sub_10001C2B4(id a1, HMAccessory *a2)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMAccessory category](a2, "category"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 categoryType]);

  LOBYTE(v2) = [v3 isEqualToString:HMAccessoryCategoryTypeHomePod];
  return (char)v2;
}

uint64_t sub_10001C68C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001C6A0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (v5)
  {
    objc_msgSend( (id)objc_opt_class(a1[4], v6),  "_moveOrAddLocalAccessoryToRoomWithName:inHome:completionHandler:",  a1[5],  v5,  a1[6]);
  }

  else
  {
    id v8 = sub_10002B004();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100076470();
    }

    id v11 = objc_msgSend((id)objc_opt_class(a1[4], v10), "_errorWithCode:underlyingError:", 0, v7);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    (*(void (**)(void))(a1[7] + 16LL))();
  }
}

void sub_10001C94C(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 32))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10001C9CC;
    v3[3] = &unk_1000C98E8;
    id v4 = *(id *)(a1 + 32);
    char v5 = a2;
    dispatch_async(&_dispatch_main_q, v3);
  }

uint64_t sub_10001C9CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void sub_10001C9E0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10002B004();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[SATVAirplay2HomeKitDataSource updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:completionHandler:]_block_invoke_3";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Update audio destination completed. success=%{BOOL}d, error=%@",  (uint8_t *)&v8,  0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001CEDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "airplay2DataSourceDidUpdate:") & 1) != 0) {
    [v3 airplay2DataSourceDidUpdate:*(void *)(a1 + 32)];
  }
}

void sub_10001D0A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "airplay2DataSource:readyStateDidChange:") & 1) != 0) {
    [v3 airplay2DataSource:*(void *)(a1 + 32) readyStateDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

uint64_t sub_10001D2B4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001D2C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 56) _moveOrAddLocalAccessoryToRoom:a2 inHome:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }

  else
  {
    id v6 = sub_10002B004();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000764DC();
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) _errorWithCode:1 underlyingError:v5]);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

uint64_t sub_10001D4FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001D510(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10002B004();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100076548();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "+[SATVAirplay2HomeKitDataSource _moveOrAddLocalAccessoryToRoom:inHome:completionHandler:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Configure local accessory complete.",  (uint8_t *)&v7,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10001D754( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10001E380(_Unwind_Exception *a1)
{
}

void sub_10001E3B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10001E3FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTapToSetupConsentWithDeviceInfo:0];
}

LABEL_55:
        }

        v44 = [obj countByEnumeratingWithState:&v94 objects:v103 count:16];
      }

      while (v44);
    }

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v59 = (void *)objc_claimAutoreleasedReturnValue([v43 preferredLanguages]);
    v60 = [v59 countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v60)
    {
      v61 = v60;
      v62 = *(void *)v91;
      while (2)
      {
        for (k = 0LL; k != v61; k = (char *)k + 1)
        {
          if (*(void *)v91 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v90 + 1) + 8LL * (void)k);
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale scriptCodeFromLanguage:](&OBJC_CLASS___NSLocale, "scriptCodeFromLanguage:", v64));
          if ([v65 isEqual:@"Latn"])
          {
            v70 = sub_10002B074();
            v71 = (os_log_s *)objc_claimAutoreleasedReturnValue(v70);
            v69 = "RLResponse24@NSURLRequest32";
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v108 = (uint64_t)v64;
              _os_log_impl( (void *)&_mh_execute_header,  v71,  OS_LOG_TYPE_DEFAULT,  "English will not be explicitly added because %{public}@ is a Latin script",  buf,  0xCu);
            }

            v68 = v86;
            goto LABEL_71;
          }
        }

        v61 = [v59 countByEnumeratingWithState:&v90 objects:v102 count:16];
        if (v61) {
          continue;
        }
        break;
      }
    }

    v66 = sub_10002B074();
    v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "Explicitly adding English because no Latin script languages were transferred",  buf,  2u);
    }

    [v87 addPreferredLanguage:@"en" withVariants:0];
    v68 = v86;
    v69 = "v40@0:8@RemoteUIController16@NSHTTPURLResponse24@NSURLRequest32" + 39;
LABEL_71:
    v72 = (void *)objc_claimAutoreleasedReturnValue([v3 keyboards]);
    v73 = [v72 count];
    v74 = sub_10002B074();
    v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
    v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
    if (v73)
    {
      if (v76)
      {
        *(_DWORD *)buf = *((void *)v69 + 92);
        v108 = (uint64_t)v72;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Candidate keyboards for import: %{public}@",  buf,  0xCu);
      }

      v77 = v87;
      [v87 addInputModesIfNeeded:v72];
    }

    else
    {
      if (v76)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "No keyboards to import", buf, 2u);
      }

      v77 = v87;
    }

    v78 = sub_10002B074();
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue([v77 preferredInputModeList]);
      *(_DWORD *)buf = *((void *)v69 + 92);
      v108 = (uint64_t)v80;
      _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Keyboard list to be committed: %{public}@",  buf,  0xCu);

      v77 = v87;
    }

    [v77 applyInputModesChanges];
    v81 = sub_10002B074();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue([v77 preferredLanguages]);
      *(_DWORD *)buf = *((void *)v69 + 92);
      v108 = (uint64_t)v83;
      _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Preferred language list to be committed: %{public}@",  buf,  0xCu);

      v77 = v87;
    }

    [v77 applyPreferredLanguagesChanges];
  }
}

void sub_10001F67C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_10001F6A0()
{
  if (qword_1001097E8 != -1) {
    dispatch_once(&qword_1001097E8, &stru_1000C9A20);
  }
  return (id)qword_1001097E0;
}

void sub_10001F6E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _createPrimaryProfileWithiCloudAccount:*(void *)(a1 + 32)];
}

void sub_10001FB60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sub_10001F6A0();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      *(_DWORD *)buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Primary profile created. {identifier=%{public}@, userProfile=%@}",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100076628(v6, v9);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001FCB4;
  block[3] = &unk_1000C9468;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);
}

id sub_10001FCB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stepDidComplete];
}

uint64_t sub_10001FF44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002008C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVCreatePrimaryProfileStep");
  id v2 = (void *)qword_1001097E0;
  qword_1001097E0 = (uint64_t)v1;
}

  ;
}

void sub_1000200E8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100020108(uint64_t a1, uint64_t a2)
{
  return objc_opt_class(v2, a2);
}

  ;
}

  ;
}

id sub_100020B64(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) setHidden:*(_BYTE *)(a1 + 40) == 0];
  [*(id *)(*(void *)(a1 + 32) + 24) setHidden:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  if (*(_BYTE *)(a1 + 40))
  {
    [v2 startAnimating];
    uint64_t v3 = 1LL;
  }

  else
  {
    [v2 stopAnimating];
    uint64_t v3 = 4LL;
  }

  [*(id *)(*(void *)(a1 + 32) + 16) setTextAlignment:v3];
  return [*(id *)(a1 + 32) setNeedsLayout];
}

LABEL_31:
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
    goto LABEL_32;
  }

  v24 = [v12 passwordPromptSetting];
  if (v24)
  {
    uint64_t v25 = (uint64_t)v24;
    v26 = (void *)qword_1001097F0;
    if (os_log_type_enabled((os_log_t)qword_1001097F0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v27 = v26;
      v28 = sub_100049F54(v25);
      BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      *(_DWORD *)buf = 138412290;
      v35 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Configuration has a non default password setting. Will apply and exit. setting=%@",  buf,  0xCu);
    }

    sub_100049FDC(v25);
    goto LABEL_31;
  }

  if (!v19) {
    -[SATVPasswordSettingStep _showPasswordSettingPromptViewController]( self,  "_showPasswordSettingPromptViewController");
  }
LABEL_16:
  uint64_t v21 = 0LL;
LABEL_32:

  return v21;
}
}

void sub_1000214D4(_Unwind_Exception *a1)
{
}

void sub_100021504(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100021550(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStep];
}

void sub_100021BBC(_Unwind_Exception *a1)
{
}

void sub_100021BEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100021C38(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enableFlyoverAndCompleteStep:a2];
}

LABEL_12:
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[SATVTapToSetupViewController view](self, "view"));
  [v16 setNeedsLayout];
}

  id v16 = sub_10002B004();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v18 = &stru_1000CB560;
    }
    else {
      uint64_t v18 = @" not";
    }
    uint64_t v19 = MGGetProductType();
    v20 = _os_feature_enabled_impl("Home", "cce7c4ecef404121ae8971");
    uint64_t v21 = [v13 count];
    *(_DWORD *)buf = 136316418;
    id v32 = "-[SATVAirplay2ViewController _showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:inHome:]";
    __int16 v33 = 2112;
    v34 = v18;
    v35 = 1024;
    *(_DWORD *)v36 = v19;
    *(_WORD *)&v36[4] = 1024;
    *(_DWORD *)&v36[6] = v20;
    *(_WORD *)v37 = 2112;
    *(void *)&v37[2] = v10;
    v38 = 2048;
    v39 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Will%@ show home theater picker. productType=0x%X, featureEnabled=%{BOOL}d, room=%@, homeTheaterSpeakersInRoomCount=%lu",  buf,  0x36u);
  }

  if (v8)
  {
    v22 = -[SATVAirplay2HomeTheaterSpeakerPickerContainerViewController initWithSpeakers:]( objc_alloc(&OBJC_CLASS___SATVAirplay2HomeTheaterSpeakerPickerContainerViewController),  "initWithSpeakers:",  v13);
    objc_initWeak((id *)buf, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10004B9C0;
    v29[3] = &unk_1000CA6F0;
    objc_copyWeak(&v30, (id *)buf);
    -[SATVAirplay2HomeTheaterSpeakerPickerContainerViewController setCompletionHandler:]( v22,  "setCompletionHandler:",  v29);
    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    v26 = sub_10004BA1C;
    BOOL v27 = &unk_1000C93A0;
    objc_copyWeak(&v28, (id *)buf);
    -[SATVAirplay2HomeTheaterSpeakerPickerContainerViewController setMenuHandler:](v22, "setMenuHandler:", &v24);
    -[SATVAirplay2ViewController setAnimationStateInCurrentResourceWithAnimationType:]( self,  "setAnimationStateInCurrentResourceWithAnimationType:",  0LL,  v24,  v25,  v26,  v27);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2ViewController _childNavigationController](self, "_childNavigationController"));
    [v23 pushViewController:v22 animated:1];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    -[SATVAirplay2ViewController _updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:]( self,  "_updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:",  0LL);
  }
}

  v99 = UIRectCenteredXInRect(v90, v167, v91, v159, v93, v30, v6, v52);
  v101 = v100;
  *(double *)&v180 = v99;
  *((void *)&v180 + 1) = v102;
  v181 = v103;
  v182 = v100;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
  [v104 frame];
  v105 = CGRectGetMaxY(v203);

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView useSeparateIDsButton](self, "useSeparateIDsButton"));
  if ([v106 isHidden])
  {
    v204.origin.x = v93;
    v204.origin.y = v30;
    v204.size.width = v6;
    v204.size.height = v52;
    MinY = CGRectGetMaxY(v204);
  }

  else
  {
    v205.size.width = v161;
    v205.origin.x = v163;
    v205.origin.y = v150;
    v205.size.height = v151;
    MinY = CGRectGetMinY(v205);
  }

  v108 = MinY;

  v109 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView useSeparateIDsButton](self, "useSeparateIDsButton"));
  v110 = [v109 isHidden];

  v111 = 0.0;
  if (v110)
  {
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView skipButton](self, "skipButton"));
    v113 = [v112 isHidden];

    if ((v113 & 1) == 0)
    {
      v114 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView skipButton](self, "skipButton"));
      [v114 frame];
      v111 = CGRectGetHeight(v206);
    }
  }

  *((double *)&v180 + 1) = v105 + round((v108 - v105 - v101 - v111) * 0.5);
  v98 = v157;
  y = *(double *)&v165;
LABEL_19:
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView titleLabel](self, "titleLabel"));
  objc_msgSend(v115, "setFrame:", x, y, width, v98);

  v116 = v184.origin.x;
  v117 = v184.origin.y;
  v118 = v184.size.width;
  v119 = v184.size.height;
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v120, "setFrame:", v116, v117, v118, v119);

  v121 = v183.origin.x;
  v122 = v183.origin.y;
  v123 = v183.size.width;
  v124 = v183.size.height;
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView textField](self, "textField"));
  objc_msgSend(v125, "setFrame:", v121, v122, v123, v124);

  v126 = v180;
  v127 = v181;
  v128 = v182;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView continueButton](self, "continueButton"));
  objc_msgSend(v129, "setFrame:", v126, v127, v128);

  v130 = v177;
  v131 = v178;
  v132 = v179;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView useSeparateIDsButton](self, "useSeparateIDsButton"));
  objc_msgSend(v133, "setFrame:", v130, v131, v132);

  v134 = v174;
  v135 = v175;
  v136 = v176;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView skipButton](self, "skipButton"));
  objc_msgSend(v137, "setFrame:", v134, v135, v136);
}

id sub_100022A34(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
}

LABEL_22:
  return (id)v22;
}

  -[NSMutableArray addObject:](v13, "addObject:", OBPrivacyAnalyticsAppIdentifier, (void)v16);
  if ((v9 & 0x10) != 0) {
LABEL_16:
  }
    -[NSMutableArray addObject:](v13, "addObject:", OBPrivacyAnalyticsDeviceIdentifier, (void)v16);
LABEL_17:
  if (-[NSMutableArray count](v13, "count", (void)v16))
  {
    __int16 v14 = -[NSMutableArray copy](v13, "copy");
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:]( &OBJC_CLASS___OBPrivacyPresenter,  "presenterForPrivacyUnifiedAboutWithIdentifiers:",  v14));

    [v15 setPresentingViewController:self];
    [v15 present];
  }
}

void sub_1000236CC(_Unwind_Exception *a1)
{
}

void sub_1000236FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100023748(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithDiagnosticsConsent:a2];
}

id sub_10002555C()
{
  if (qword_100109818 != -1) {
    dispatch_once(&qword_100109818, &stru_1000C9A40);
  }
  return (id)qword_100109810;
}

void sub_10002559C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.activation", "Activation");
  uint64_t v2 = (void *)qword_100109810;
  qword_100109810 = (uint64_t)v1;
}

void sub_100025E08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_100025E20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100025E30(uint64_t a1)
{
}

void sub_100025E38(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_10002555C();
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Buddy Activate: URL Session complete", buf, 2u);
  }

  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_100076F24();
  }
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v12);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    uint64_t v14 = (uint64_t)[v8 statusCode];
    if (v9) {
      goto LABEL_10;
    }
  }

  else
  {
    uint64_t v14 = 200LL;
    if (v9) {
      goto LABEL_10;
    }
  }

  if (v14 == 200)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100026134;
    block[3] = &unk_1000C9A70;
    v17 = (void *)a1[5];
    void block[4] = a1[4];
    id v29 = v17;
    id v30 = v7;
    dispatch_async(v16, block);

    id v9 = 0LL;
    goto LABEL_21;
  }

void sub_100026134(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v14 = 0LL;
  id v5 = [v2 _newActivationRequestWithOptions:v3 sessionData:v4 error:&v14];
  id v6 = v14;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000261E8;
  v10[3] = &unk_1000C9A70;
  uint64_t v7 = a1[4];
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(&_dispatch_main_q, v10);
}

void sub_1000261E8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    objc_storeStrong((id *)(v3 + 72), v2);
    id v4 = sub_10002555C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 24LL);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URL]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
      *(_DWORD *)buf = 67109378;
      int v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Activate, AllowAnyHTTPSCert=%d, with URL: %@\n",  buf,  0x12u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) session]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataTaskWithRequest:*(void *)(a1 + 32)]);

    [v10 resume];
  }

  else
  {
    id v11 = *(void **)(v3 + 56);
    if (v11)
    {
      id v12 = objc_retainBlock(v11);
      [*(id *)(a1 + 40) _cleanup];
      (*((void (**)(id, void, void, void, void))v12 + 2))(v12, 0LL, 0LL, 0LL, *(void *)(a1 + 48));
    }
  }

void sub_100026474(uint64_t a1)
{
  id v14 = 0LL;
  id v15 = 0LL;
  int v2 = MAECreateSessionRequestWithError(&v15, 0LL, &v14);
  id v3 = v15;
  id v4 = v14;
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    int v6 = *(void **)(a1 + 32);
    if (v6[6])
    {
      objc_msgSend(v3, "setURL:");
      int v6 = *(void **)(a1 + 32);
    }

    [v6 _sendSessionRequest:v3 withOptions:*(void *)(a1 + 40)];
  }

  else
  {
    id v7 = sub_10002555C();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100076F4C(v4);
    }

    id v9 = -[SATVLogBuilder initWithContext:name:]( objc_alloc(&OBJC_CLASS___SATVLogBuilder),  "initWithContext:name:",  @"TVSetup",  @"Activation");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder logger](v9, "logger"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100076D60(v9, (uint64_t)v4);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100026604;
    v11[3] = &unk_1000C9AC0;
    id v13 = *(id *)(a1 + 56);
    id v12 = v4;
    dispatch_async(&_dispatch_main_q, v11);
  }
}

uint64_t sub_100026604(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

void sub_100026CC4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

id sub_100026CF4()
{
  return [v0 code];
}

id sub_100027988()
{
  if (qword_100109838 != -1) {
    dispatch_once(&qword_100109838, &stru_1000C9B78);
  }
  return (id)qword_100109830;
}

void sub_100027A9C(_Unwind_Exception *a1)
{
}

id sub_100027AB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _eventPayload]);

  return v2;
}

void sub_100027B84(id a1)
{
  os_log_t v1 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVAccountUpdationStep);
  uint64_t v2 = NSStringFromClass(v1);
  v86 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v87[0] = v86;
  v88[0] = TVSKMetricsPayloadKeyStepPrefixAccountUpdation;
  id v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVActivationStep);
  id v4 = NSStringFromClass(v3);
  v85 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v87[1] = v85;
  v88[1] = TVSKMetricsPayloadKeyStepPrefixActivation;
  uint64_t v5 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVAirplay2Step);
  int v6 = NSStringFromClass(v5);
  v84 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v87[2] = v84;
  v88[2] = TVSKMetricsPayloadKeyStepPrefixHomeKit;
  id v7 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVAppAnalyticsStep);
  id v8 = NSStringFromClass(v7);
  v83 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v87[3] = v83;
  v88[3] = TVSKMetricsPayloadKeyStepPrefixAppAnalytics;
  id v9 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodStep);
  id v10 = NSStringFromClass(v9);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v87[4] = v82;
  v88[4] = TVSKMetricsPayloadKeyStepPrefixChooseSetupMethod;
  id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVCloudConfigStep);
  id v12 = NSStringFromClass(v11);
  v81 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v87[5] = v81;
  v88[5] = TVSKMetricsPayloadKeyStepPrefixCloudConfig;
  id v13 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVDiagnosticsStep);
  id v14 = NSStringFromClass(v13);
  v80 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v87[6] = v80;
  v88[6] = TVSKMetricsPayloadKeyStepPrefixDiagnostics;
  id v15 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVDisplayAssistantStep);
  id v16 = NSStringFromClass(v15);
  v79 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v87[7] = v79;
  v88[7] = TVSKMetricsPayloadKeyStepPrefixDisplayAssistant;
  v17 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVExpressTapToSetupStep);
  id v18 = NSStringFromClass(v17);
  v78 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v87[8] = v78;
  v88[8] = TVSKMetricsPayloadKeyStepPrefixExpressTapToSetup;
  uint64_t v19 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVFlyoverStep);
  BOOL v20 = NSStringFromClass(v19);
  v77 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v87[9] = v77;
  v88[9] = TVSKMetricsPayloadKeyStepPrefixAerials;
  uint64_t v21 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATViCloudHomeScreenSyncStep);
  v22 = NSStringFromClass(v21);
  v76 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v87[10] = v76;
  v88[10] = TVSKMetricsPayloadKeyStepPrefixHomeScreenSync;
  id v23 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVLanguageStep);
  v24 = NSStringFromClass(v23);
  v75 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v87[11] = v75;
  v88[11] = TVSKMetricsPayloadKeyStepPrefixLanguage;
  uint64_t v25 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVLocationServicesStep);
  uint64_t v26 = NSStringFromClass(v25);
  v74 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v87[12] = v74;
  v88[12] = TVSKMetricsPayloadKeyStepPrefixLocationServices;
  BOOL v27 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVLoginStep);
  v28 = NSStringFromClass(v27);
  v73 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v87[13] = v73;
  v88[13] = TVSKMetricsPayloadKeyStepPrefixLogin;
  id v29 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVManagedConfigurationUpdateStep);
  id v30 = NSStringFromClass(v29);
  v72 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v87[14] = v72;
  v88[14] = TVSKMetricsPayloadKeyStepPrefixManagedConfigurationUpdate;
  v31 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVNetworkValidationStep);
  id v32 = NSStringFromClass(v31);
  v71 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v87[15] = v71;
  v88[15] = TVSKMetricsPayloadKeyStepPrefixNetworkValidation;
  __int16 v33 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVPasswordSettingStep);
  v34 = NSStringFromClass(v33);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v87[16] = v70;
  v88[16] = TVSKMetricsPayloadKeyStepPrefixPasswordSetting;
  v35 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVPrivacyStep);
  v36 = NSStringFromClass(v35);
  v69 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v87[17] = v69;
  v88[17] = TVSKMetricsPayloadKeyStepPrefixPrivacy;
  v37 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVRecognizeMyVoiceStep);
  v38 = NSStringFromClass(v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v87[18] = v39;
  v88[18] = TVSKMetricsPayloadKeyStepPrefixRecognizeMyVoice;
  v40 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVRegionStep);
  v41 = NSStringFromClass(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v87[19] = v42;
  v88[19] = TVSKMetricsPayloadKeyStepPrefixRegion;
  v43 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVRegionDisplayModeStep);
  v44 = NSStringFromClass(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v87[20] = v45;
  v88[20] = TVSKMetricsPayloadKeyStepPrefixRegionDisplayMode;
  v46 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVHelloStep);
  v47 = NSStringFromClass(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v87[21] = v48;
  v88[21] = TVSKMetricsPayloadKeyStepPrefixRemotePairing;
  v49 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVSiriAndDictationStep);
  v50 = NSStringFromClass(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v87[22] = v51;
  v88[22] = TVSKMetricsPayloadKeyStepPrefixSiriAndDictation;
  v52 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVSiriDiagnosticsStep);
  v53 = NSStringFromClass(v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v87[23] = v54;
  v88[23] = TVSKMetricsPayloadKeyStepPrefixSiriDiagnostics;
  v55 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTermsAndConditionsStep);
  v56 = NSStringFromClass(v55);
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v87[24] = v57;
  v88[24] = TVSKMetricsPayloadKeyStepPrefixTermsAndConditions;
  v58 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVTimeZoneStep);
  v59 = NSStringFromClass(v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v87[25] = v60;
  v88[25] = TVSKMetricsPayloadKeyStepPrefixTimeZone;
  v61 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVVideoSubscriberAccountStep);
  v62 = NSStringFromClass(v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  v87[26] = v63;
  v88[26] = TVSKMetricsPayloadKeyStepPrefixVideoSubscriberAccount;
  v64 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVWhatsNewStep);
  v65 = NSStringFromClass(v64);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  v87[27] = v66;
  v88[27] = TVSKMetricsPayloadKeyStepPrefixWhatsNew;
  uint64_t v67 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  28LL));
  v68 = (void *)qword_100109820;
  qword_100109820 = v67;
}

void sub_1000287A4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@Step_%@", v5, a2));
  [*(id *)(a1 + 40) setObject:v6 forKey:v7];
}

void sub_1000288A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "MetricsController");
  uint64_t v2 = (void *)qword_100109830;
  qword_100109830 = (uint64_t)v1;
}

void sub_10002A288( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10002A2AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLoginViewController:0];
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained profileConnection]);
    [v8 storeProfileData:v6 configurationSource:1 purpose:1];
  }

  if (!v5)
  {
    id v13 = sub_10002AF94();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Successfully retrieved cloud config. Installing profile data.",  buf,  2u);
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue([WeakRetained profileConnection]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10002A764;
    v24[3] = &unk_1000C9BC8;
    void v24[4] = WeakRetained;
    [v15 installProfileDataStoredForPurpose:1 completionBlock:v24];
    goto LABEL_16;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if (![v9 isEqualToString:MCCloudConfigErrorDomain])
  {

    goto LABEL_13;
  }

  id v10 = [v5 code];

  if (v10 != (id)33000)
  {
LABEL_13:
    id v16 = sub_10002AF94();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Error enrolling: %@", buf, 0xCu);
    }

    [WeakRetained setLoading:0];
    id v18 = sub_10000D7CC(@"CLOUD_CONFIG_ERROR_FAILED_RETRIEVE_ENTERPRISE_CONFIG_APPLETV", @"Localizable");
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained cloudUtility]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 organizationName]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v19, v21, v22));

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10002A73C;
    v25[3] = &unk_1000C9BA0;
    v25[4] = WeakRetained;
    id v26 = v23;
    id v15 = v23;
    dispatch_async(&_dispatch_main_q, v25);

LABEL_16:
    goto LABEL_17;
  }

  id v11 = sub_10002AF94();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "MDM server requires credentials", buf, 2u);
  }

  [WeakRetained setNeedCredentials:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A620;
  block[3] = &unk_1000C9BA0;
  void block[4] = WeakRetained;
  id v28 = v5;
  dispatch_async(&_dispatch_main_q, block);

LABEL_17:
}

void sub_10002A620(uint64_t a1)
{
  uint64_t v2 = -[SATVCloudLoginViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___SATVCloudLoginViewController),  "initWithNibName:bundle:",  0LL,  0LL);
  [*(id *)(a1 + 32) setLoginViewController:v2];

  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) cloudUtility]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 organizationName]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginViewController]);
  [v5 setOrganizationName:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kMCErrorLoginPromptKey]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginViewController]);
  [v8 setCustomPrompt:v7];

  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginViewController]);
  [v10 pushViewController:v9 animated:1];
}

id sub_10002A73C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSubtitleTitle:*(void *)(a1 + 40)];
}

void sub_10002A764(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10002A7E4;
  v6[3] = &unk_1000C9BA0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(&_dispatch_main_q, v6);
}

void sub_10002A7E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = sub_10002AF94();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "MDM: Failed to install profile data. Enrollment failed.",  buf,  2u);
    }

    [*(id *)(a1 + 40) setLoading:0];
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizedRecoverySuggestion]);
    id v7 = [v6 length];

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizedDescription]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizedRecoverySuggestion]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v8,  v9));
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) localizedDescription]);
    }

    [*(id *)(a1 + 40) _hideActivityIndicator];
    [*(id *)(a1 + 40) _setSubtitleTitle:v10];
  }

  else
  {
    if (v5)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Profile data installed", v11, 2u);
    }

    [*(id *)(a1 + 40) _enrollmentComplete];
  }

id sub_10002AB44(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enrollmentComplete];
}

void sub_10002ABB0(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityIndicatorContainerView]);
  [v1 setAlpha:1.0];
}

void sub_10002AC78(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityIndicatorContainerView]);
  [v1 setAlpha:0.0];
}

uint64_t sub_10002AF30()
{
  if (qword_100109848 != -1) {
    dispatch_once(&qword_100109848, &stru_1000C9C18);
  }
  return byte_100109840;
}

void sub_10002AF70(id a1)
{
  byte_100109840 = MGGetBoolAnswer(@"apple-internal-install");
}

id sub_10002AF94()
{
  if (qword_100109858 != -1) {
    dispatch_once(&qword_100109858, &stru_1000C9C38);
  }
  return (id)qword_100109850;
}

void sub_10002AFD4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy", "TVSetup");
  uint64_t v2 = (void *)qword_100109850;
  qword_100109850 = (uint64_t)v1;
}

id sub_10002B004()
{
  if (qword_100109868 != -1) {
    dispatch_once(&qword_100109868, &stru_1000C9C58);
  }
  return (id)qword_100109860;
}

void sub_10002B044(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVAirplay2");
  uint64_t v2 = (void *)qword_100109860;
  qword_100109860 = (uint64_t)v1;
}

id sub_10002B074()
{
  if (qword_100109878 != -1) {
    dispatch_once(&qword_100109878, &stru_1000C9C78);
  }
  return (id)qword_100109870;
}

void sub_10002B0B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVChooseSetupStep");
  uint64_t v2 = (void *)qword_100109870;
  qword_100109870 = (uint64_t)v1;
}

id sub_10002B0E4()
{
  if (qword_100109888 != -1) {
    dispatch_once(&qword_100109888, &stru_1000C9C98);
  }
  return (id)qword_100109880;
}

void sub_10002B124(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVExpressTapToSetupStep");
  uint64_t v2 = (void *)qword_100109880;
  qword_100109880 = (uint64_t)v1;
}

id sub_10002B154()
{
  if (qword_100109898 != -1) {
    dispatch_once(&qword_100109898, &stru_1000C9CB8);
  }
  return (id)qword_100109890;
}

void sub_10002B194(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVInternationalUtility");
  uint64_t v2 = (void *)qword_100109890;
  qword_100109890 = (uint64_t)v1;
}

id sub_10002B1C4()
{
  if (qword_1001098A8 != -1) {
    dispatch_once(&qword_1001098A8, &stru_1000C9CD8);
  }
  return (id)qword_1001098A0;
}

void sub_10002B204(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVRecognizeMyVoiceStep");
  uint64_t v2 = (void *)qword_1001098A0;
  qword_1001098A0 = (uint64_t)v1;
}

uint64_t sub_10002B234(void *a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002B2B4;
  v4[3] = &unk_1000C9D00;
  id v5 = a1;
  id v1 = v5;
  uint64_t v2 = os_state_add_handler(&_dispatch_main_q, v4);

  return v2;
}

_DWORD *sub_10002B2B4(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if ([v2 length])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v2,  100LL,  0LL,  0LL));
    uint64_t v4 = calloc(1uLL, (size_t)[v3 length] + 200);
    id v5 = v4;
    if (v4)
    {
      _DWORD *v4 = 1;
      v4[1] = [v3 length];
      id v6 = v3;
      memcpy(v5 + 50, [v6 bytes], (size_t)objc_msgSend(v6, "length"));
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

Block_layout *sub_10002B4D0()
{
  return &stru_1000C9DC8;
}

id sub_10002B4DC(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bs_map:", &stru_1000C9D48));
    id v2 = [v1 count];
    else {
      uint64_t v3 = 7LL - (void)v2;
    }
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSHome suggestedRoomNames:existingRoomNames:]( &OBJC_CLASS___TVCSHome,  "suggestedRoomNames:existingRoomNames:",  v3,  v1));
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSHome suggestedRoomNames:](&OBJC_CLASS___TVCSHome, "suggestedRoomNames:", 7LL));
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bs_map:", &stru_1000C9D88));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_1000C9DC8]);

  return v6;
}

NSString *__cdecl sub_10002B59C(id a1, SATVAirplay2DataSourceObject *a2)
{
  return (NSString *)-[SATVAirplay2DataSourceObject name](a2, "name");
}

SATVAirplay2DataSourceObject *__cdecl sub_10002B5A4(id a1, NSString *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"__SATVAirplay2SuggestedRoom__%@",  v2));
  uint64_t v4 = -[SATVAirplay2SuggestedRoom initWithUniqueIdentifier:name:]( objc_alloc(&OBJC_CLASS___SATVAirplay2SuggestedRoom),  "initWithUniqueIdentifier:name:",  v3,  v2);

  return (SATVAirplay2DataSourceObject *)v4;
}

int64_t sub_10002B660(id a1, SATVAirplay2DataSourceObject *a2, SATVAirplay2DataSourceObject *a3)
{
  uint64_t v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2DataSourceObject name](a2, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2DataSourceObject name](v4, "name"));

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10002B8B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10002B8D0(uint64_t a1, char a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002B954;
  v4[3] = &unk_1000C9520;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v6 = a2;
  id v3 = WeakRetained;
  dispatch_async(&_dispatch_main_q, v4);
}

void sub_10002B954(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);

  if (v2)
  {
    id v3 = (void (**)(id, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) completionHandler]);
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));
  }

void sub_10002BB9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = sub_10002AF94();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "Timeout request timer fired. Still couldn't refresh the accoount properties..",  v6,  2u);
    }

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);
    if (v4)
    {
      id v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);
      v5[2](v5, 0LL);
    }

    [WeakRetained _cancelRequestTimeoutTimer];
  }
}

LABEL_15:
  id v13 = 0LL;
LABEL_17:

  return v13;
}

  return v9;
}

void sub_10002C4E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10002C500(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStep];
}

void sub_10002C794( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_10002C7BC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _cellForRowAtIndexPath:v7 itemIdentifier:v6]);

  return v9;
}

id sub_10002C9BC(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 uniqueIdentifier]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) uniqueIdentifier]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

NSString *__cdecl sub_10002D1C4(id a1, SATVAirplay2DataSourceObject *a2)
{
  id v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2DataSourceObject uniqueIdentifier](v2, "uniqueIdentifier"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2DataSourceObject name](v2, "name"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v4));
  return (NSString *)v5;
}

NSString *__cdecl sub_10002D244(id a1, SATVAirplay2DataSourceObject *a2)
{
  return (NSString *)-[SATVAirplay2DataSourceObject uniqueIdentifier](a2, "uniqueIdentifier");
}

id sub_10002DB28(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

id sub_10002DBDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

void sub_10002F5C0(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SATVAuthenticationManager);
  id v2 = (void *)qword_1001098C0;
  qword_1001098C0 = (uint64_t)v1;
}

void sub_10002F7D0(_Unwind_Exception *a1)
{
}

void sub_10002F7E4(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10002F85C;
  v3[3] = &unk_1000C98E8;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(&_dispatch_main_q, v3);
}

uint64_t sub_10002F85C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void sub_10002F870(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 64);
    if (v4 == 2)
    {
      [WeakRetained _authenticateiCloudAccountWithUsername:*(void *)(a1 + 32) password:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }

    else if (v4 == 1)
    {
      [WeakRetained _authenticateStoreAccountWithUsername:*(void *)(a1 + 32) password:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }

    else if (v4)
    {
      id v5 = sub_10002AF94();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000770B4((uint64_t *)(a1 + 64), a1, v6);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }

    else
    {
      [WeakRetained _authenticateAppleIDWithUsername:*(void *)(a1 + 32) password:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
  }
}

void sub_10002FB6C(_Unwind_Exception *a1)
{
}

void sub_10002FB80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    switch(v3)
    {
      case 2LL:
        id v4 = WeakRetained;
        [WeakRetained _logOutiCloudAccount];
        goto LABEL_9;
      case 1LL:
        id v4 = WeakRetained;
        [WeakRetained _logOutiTunesStoreAccount];
        goto LABEL_9;
      case 0LL:
        id v4 = WeakRetained;
        [WeakRetained _logOutiCloudAccount];
        [v4 _logOutiTunesStoreAccount];
LABEL_9:
        id WeakRetained = v4;
        break;
    }
  }
}

void sub_10002FDA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10002FDC4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationPasswordKey]);
    uint64_t v8 = v7;
    if (a2 && [v7 length])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10002FEF8;
      v9[3] = &unk_1000C9F60;
      objc_copyWeak(&v12, (id *)(a1 + 40));
      id v10 = v5;
      id v11 = *(id *)(a1 + 32);
      [WeakRetained _performiCloudAuthenticationWithDictionary:v10 completion:v9];

      objc_destroyWeak(&v12);
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }
}

void sub_10002FEE4(_Unwind_Exception *a1)
{
}

void sub_10002FEF8(id *a1, int a2)
{
  id v4 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (a2)
    {
      id v6 = a1[4];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100030020;
      v9[3] = &unk_1000C9F38;
      objc_copyWeak(&v12, v4);
      id v10 = a1[4];
      id v11 = a1[5];
      [WeakRetained _performiTunesStoreAuthenticationWithDictionary:v6 completion:v9];

      objc_destroyWeak(&v12);
    }

    else
    {
      id v7 = sub_10002AF94();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100077140();
      }

      (*((void (**)(void))a1[5] + 2))();
    }
  }
}

void sub_10003000C(_Unwind_Exception *a1)
{
}

void sub_100030020(uint64_t a1, unint64_t a2)
{
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 >= 2)
    {
      if (a2 == 2)
      {
        id v7 = sub_10002AF94();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10007716C();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }

    else
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10003013C;
      v9[3] = &unk_1000C9F10;
      objc_copyWeak(&v11, v4);
      id v10 = *(id *)(a1 + 40);
      [WeakRetained _performHomeSharingEnablementWithDictionary:v6 completion:v9];

      objc_destroyWeak(&v11);
    }
  }
}

void sub_100030128(_Unwind_Exception *a1)
{
}

void sub_10003013C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id WeakRetained = v3;
  }
}

void sub_100030268( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100030284(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10003038C;
      v7[3] = &unk_1000C9F38;
      objc_copyWeak(&v10, (id *)(a1 + 40));
      id v8 = v5;
      id v9 = *(id *)(a1 + 32);
      [WeakRetained _performiTunesStoreAuthenticationWithDictionary:v8 completion:v7];

      objc_destroyWeak(&v10);
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }
}

void sub_100030378(_Unwind_Exception *a1)
{
}

void sub_10003038C(uint64_t a1, unint64_t a2)
{
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 >= 2)
    {
      if (a2 == 2)
      {
        id v7 = sub_10002AF94();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100077198();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      }
    }

    else
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000304A8;
      v9[3] = &unk_1000C9F10;
      objc_copyWeak(&v11, v4);
      id v10 = *(id *)(a1 + 40);
      [WeakRetained _performHomeSharingEnablementWithDictionary:v6 completion:v9];

      objc_destroyWeak(&v11);
    }
  }
}

void sub_100030494(_Unwind_Exception *a1)
{
}

void sub_1000304A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    id WeakRetained = v3;
  }
}

void sub_1000305D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000305F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000306AC;
    v7[3] = &unk_1000C9910;
    id v8 = *(id *)(a1 + 32);
    [WeakRetained _performiCloudAuthenticationWithDictionary:v5 completion:v7];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

uint64_t sub_1000306AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10003079C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000307B8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100030870;
      v7[3] = &unk_1000C9910;
      id v8 = *(id *)(a1 + 32);
      [WeakRetained _performHomeSharingEnablementWithDictionary:v5 completion:v7];
    }

    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }
}

uint64_t sub_100030870(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = sub_10002AF94();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000771C4();
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100030A8C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100030B48;
  block[3] = &unk_1000C9FB0;
  id v10 = a3;
  id v6 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v5;
  id v8 = v10;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_100030B48(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  if (!*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  id v3 = sub_10002AF94();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100077228(v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100030D9C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100030E30;
  v4[3] = &unk_1000C9FD8;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

void sub_100030E30(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
  if (([v2 isActive] & 1) == 0)
  {
    [v2 setActive:1];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    [v3 saveAccount:v2 withCompletionHandler:0];
  }

  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "iTunes Authentication successful.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100030EFC(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100030F90;
  v4[3] = &unk_1000C9FD8;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

uint64_t sub_100030F90(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domain]);
  if ([v3 isEqualToString:AMSServerErrorDomain])
  {
    id v4 = [*v2 code];

    if (v4 == (id)5304)
    {
      id v5 = sub_10002AF94();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Skipping iTunes Store authentication -- the account has not been set up for the store.",  v11,  2u);
      }

      id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
      return v7();
    }
  }

  else
  {
  }

  id v8 = sub_10002AF94();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000772B0(v2);
  }

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  return v7();
}

void sub_10003119C(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100031244;
  block[3] = &unk_1000CA050;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100031244(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v2 = [[CDPContext alloc] initWithAuthenticationResults:*(void *)(a1 + 40)];
    id v3 = [[CDPStateController alloc] initWithContext:v2];
    id v4 = objc_alloc_init(&OBJC_CLASS___CDPTVUIController);
    [v3 setUiProvider:v4];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100031344;
    v5[3] = &unk_1000CA028;
    id v6 = *(id *)(a1 + 48);
    char v7 = 1;
    [v3 handleCloudDataProtectionStateWithCompletion:v5];
  }

void sub_100031344(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6 = a4;
  if (v6 || (a3 & 1) == 0)
  {
    id v7 = sub_10002AF94();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      id v10 = [v6 code];
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedDescription]);
      *(_DWORD *)buf = 67109890;
      int v16 = a3;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2048;
      id v20 = v10;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CDP failed. {cdpEnabled: %{BOOL}d, error_domain=%{public}@, error_code=%ld, error=%@}",  buf,  0x26u);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000314C4;
  v12[3] = &unk_1000C98E8;
  id v13 = *(id *)(a1 + 32);
  char v14 = *(_BYTE *)(a1 + 40);
  dispatch_async(&_dispatch_main_q, v12);
}

uint64_t sub_1000314C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void sub_1000315CC(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100031644;
  v3[3] = &unk_1000C98E8;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(&_dispatch_main_q, v3);
}

uint64_t sub_100031644(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void sub_1000317CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  id v10 = sub_10002AF94();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9 == 1)
  {
    if (!v12) {
      goto LABEL_13;
    }
    LOWORD(v17) = 0;
    id v13 = "Refreshed the account properties successfully...";
    char v14 = v11;
    uint32_t v15 = 2;
  }

  else
  {
    if (!v12) {
      goto LABEL_13;
    }
    int v17 = 138412290;
    id v18 = v7;
    id v13 = "Could not refresh the account properties successfully. Error %@";
    char v14 = v11;
    uint32_t v15 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
LABEL_13:

  uint64_t v16 = *(void *)(a1 + 32);
  if (v16) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 16))(v16, v9);
  }
}

void sub_100031964( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000319A0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_1000319D0()
{
  return [*v0 code];
}

LABEL_35:
        uint64_t v25 = 0LL;
LABEL_36:
        __int16 v21 = v25;
        id v5 = v21;
        goto LABEL_37;
      }

LABEL_32:
      id v26 = (os_log_s *)qword_1001098D0;
      if (os_log_type_enabled((os_log_t)qword_1001098D0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "We don't have a view controller. Will create and display a view controller for this step.",  (uint8_t *)&v29,  2u);
      }

      -[SATVWhatsNewStep _displayWhatsNewViewController](self, "_displayWhatsNewViewController");
      int v17 = 0LL;
      goto LABEL_35;
    }

    id v5 = (void *)v18;
  }

  id v20 = (os_log_s *)qword_1001098D0;
  if (os_log_type_enabled((os_log_t)qword_1001098D0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Done executing this step. No need to show UI",  (uint8_t *)&v29,  2u);
  }

  __int16 v21 = (id)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
LABEL_37:
  BOOL v27 = v21;

  return v27;
}

void sub_100031EC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100031EE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _completeStep];
    id WeakRetained = v2;
  }
}

void sub_1000320D4(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003260C;
  block[3] = &unk_1000CA0C0;
  void block[4] = a2;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_10003240C(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032614;
  block[3] = &unk_1000CA0C0;
  void block[4] = a2;
  dispatch_async(&_dispatch_main_q, block);
}

id sub_10003260C(uint64_t a1)
{
  return [*(id *)(a1 + 32) languageDidChange];
}

id sub_100032614(uint64_t a1)
{
  return [*(id *)(a1 + 32) localeDidChange];
}

void sub_100032B60(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) view]);
  [v1 setAlpha:0.0];
}

void sub_100032B94(id a1, BOOL a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
  [v2 commitLanguage];
}

void sub_1000333B4(id a1)
{
  id v1 = -[SATVActivationManager _init](objc_alloc(&OBJC_CLASS___SATVActivationManager), "_init");
  id v2 = (void *)qword_1001098D8;
  qword_1001098D8 = (uint64_t)v1;
}

id sub_1000334F4()
{
  if (qword_1001098F0 != -1) {
    dispatch_once(&qword_1001098F0, &stru_1000CA140);
  }
  return (id)qword_1001098E8;
}

void sub_100033C98(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.activation", "ActivationManager");
  id v2 = (void *)qword_1001098E8;
  qword_1001098E8 = (uint64_t)v1;
}

void sub_100033EB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100033EE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);

  if (v1)
  {
    id v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);
    v2[2]();
  }
}

void sub_100033F40(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (a2) {
      [WeakRetained _showTapToSetupViewController];
    }
    else {
      [WeakRetained _didSelectManualFlow];
    }
    id WeakRetained = v4;
  }
}

void sub_100034254( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100034274(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained internalNavigationController]);
    id v3 = [v2 popToRootViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}

void sub_100034C2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_100034C5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v4 = *(void *)(v3 + 24);
    if ((v4 | 4) == 4)
    {
      *(void *)(v3 + 24) = v4 + 1;
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v4 = *(void *)(v3 + 24);
    }

    if (v4 == 6)
    {
      *(void *)(v3 + 24) = 7LL;
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    }

    id v5 = WeakRetained;
    if (v4 > 6) {
      [WeakRetained _wizardComplete];
    }
    else {
      objc_msgSend(WeakRetained, "_beginWizardFlowForOption:");
    }
    id WeakRetained = v5;
  }
}

id sub_100035040(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"opacity"));
  [v5 setTimingFunction:v4];
  id v6 = [v3 mode];
  if (v6)
  {
    if (v6 == (id)1)
    {
      a2 = a2 + 0.35;
      id v7 = &off_1000D1140;
      BOOL v8 = &off_1000D1130;
    }

    else
    {
      BOOL v8 = 0LL;
      id v7 = 0LL;
    }
  }

  else
  {
    a2 = a2 + 0.3;
    id v7 = &off_1000D1130;
    BOOL v8 = &off_1000D1140;
  }

  [v5 setFromValue:v8];
  [v5 setToValue:v7];
  [v5 setValue:@"opacity" forKey:@"id"];
  [v5 setDuration:0.0833];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v9 convertTime:0 fromLayer:a2];
  objc_msgSend(v5, "setBeginTime:");

  [v5 setFillMode:kCAFillModeBoth];
  [v5 setDelegate:v3];

  return v5;
}

id sub_1000351A4(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CABasicAnimation animationWithKeyPath:]( &OBJC_CLASS___CABasicAnimation,  "animationWithKeyPath:",  @"transform.scale"));
  [v5 setTimingFunction:v4];
  id v6 = [v3 mode];
  double v7 = a2 + 0.25;
  double v8 = a2 + 0.375;
  uint64_t v9 = &off_1000D1140;
  id v10 = &off_1000D1150;
  if (v6 != (id)1)
  {
    id v10 = 0LL;
    uint64_t v9 = 0LL;
    double v8 = a2;
  }

  if (v6) {
    id v11 = v10;
  }
  else {
    id v11 = &off_1000D1140;
  }
  if (v6) {
    BOOL v12 = v9;
  }
  else {
    BOOL v12 = &off_1000D1150;
  }
  if (v6) {
    double v13 = v8;
  }
  else {
    double v13 = a2 + 0.25;
  }
  objc_msgSend(v5, "setFromValue:", v11, v7, v8);
  [v5 setToValue:v12];
  [v5 setValue:@"scale" forKey:@"id"];
  [v5 setDuration:0.125];
  char v14 = (void *)objc_claimAutoreleasedReturnValue([v3 layer]);
  [v14 convertTime:0 fromLayer:v13];
  objc_msgSend(v5, "setBeginTime:");

  [v5 setFillMode:kCAFillModeBoth];
  [v5 setDelegate:v3];

  return v5;
}

double sub_100035300(void *a1)
{
  id v1 = [a1 mode];
  double result = 0.0;
  if (v1 == (id)1) {
    return 1.0;
  }
  return result;
}

double sub_100035324(void *a1)
{
  id v1 = [a1 mode];
  double result = 0.97;
  if (v1) {
    return 1.0;
  }
  return result;
}

void sub_1000360E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100036108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  switch(a2)
  {
    case 0LL:
      if (a3 == 10) {
        [WeakRetained _presentDateAndTimeErrorController];
      }
      else {
        [WeakRetained _presentActivationErrorController];
      }
      goto LABEL_10;
    case 1LL:
      double v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

      id WeakRetained = v9;
      if (v8) {
        goto LABEL_8;
      }
      break;
    case 2LL:
      id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      [v6 suspend];
      goto LABEL_9;
    case 3LL:
      double v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

      id WeakRetained = v9;
      if (v7)
      {
LABEL_8:
        id v6 = (void (**)(void))objc_claimAutoreleasedReturnValue([v9 completionHandler]);
        v6[2]();
LABEL_9:

LABEL_10:
        id WeakRetained = v9;
      }

      break;
    default:
      break;
  }
}

void sub_1000367FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
}

void sub_100036878(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _attemptActivation];
    id WeakRetained = v2;
  }
}

void sub_1000368A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _forgetCurrentWiFiNetworkIfNeeded];
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandler]);

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completionHandler]);
      v3[2](v3, 0LL);

      id WeakRetained = v4;
    }
  }
}

void sub_10003691C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentNetworkConfigurationController];
    id WeakRetained = v2;
  }
}

void sub_100036D70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_100036DCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _beginProcess];
    id WeakRetained = v2;
  }
}

void sub_100036DFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _forgetCurrentWiFiNetworkIfNeeded];
    id v2 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandler]);

    id WeakRetained = v4;
    if (v2)
    {
      id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v4 completionHandler]);
      v3[2](v3, 0LL);

      id WeakRetained = v4;
    }
  }
}

void sub_1000371A8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100037374( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100037394(id a1, SATVAirplay2HomeTheaterSpeaker *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(&OBJC_CLASS___TVSUIHomeTheaterSpeaker);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeTheaterSpeaker name](v2, "name"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeTheaterSpeaker type](v2, "type"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2HomeTheaterSpeaker audioDestinationIdentifier](v2, "audioDestinationIdentifier"));
  id v7 = -[SATVAirplay2HomeTheaterSpeaker homePodVariant](v2, "homePodVariant");

  id v8 = [v3 initWithName:v4 type:v5 destinationIdentifier:v6 homePodVariant:v7];
  return v8;
}

void sub_100037444(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[1];
    if (v5)
    {
      if (v8)
      {
        id v6 = (void *)v4[2];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_100037524;
        v9[3] = &unk_1000CA200;
        id v10 = v8;
        id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_firstObjectPassingTest:", v9));
        (*(void (**)(void))(v4[1] + 16LL))();
      }

      else
      {
        (*(void (**)(void))(v5 + 16))();
      }
    }
  }
}

id sub_100037524(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 audioDestinationIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) destinationIdentifier]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_100037864( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100037884(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 step:WeakRetained didCompleteWithResult:v1];
  }
}

NSDictionary *__cdecl sub_10003803C(id a1)
{
  id v2 = @"type";
  id v3 = @"device";
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL));
}

NSDictionary *__cdecl sub_1000380EC(id a1)
{
  id v2 = @"type";
  id v3 = @"manual";
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL));
}

void sub_1000394D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000394EC(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = sub_10002AF94();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v6)
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetch succeeded. Display the options..",  v8,  2u);
    }

    [WeakRetained _dismissActivityIndicatorView];
    [WeakRetained _showOptionsView];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained view]);
    [v7 setNeedsLayout];
  }

  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Couldn't fetch information from CloudKit effectively. Skip showing..",  buf,  2u);
    }

    [WeakRetained _dismissActivityIndicatorView];
    [WeakRetained _enableOrDisableHomeScreenSync:0];
  }
}

LABEL_23:
  return (id)v19;
}

void sub_100039D84(_Unwind_Exception *a1)
{
}

void sub_100039DB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100039E00(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleSelectedCity:v3];
}

void sub_10003A4C0(_Unwind_Exception *a1)
{
}

void sub_10003A4F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10003A53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleActivationResult:a2 shouldFinishSetup:a3];
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_autoreleasePoolPush();
  UIApplicationMain(a1, a2, @"Application", @"Application");
  objc_autoreleasePoolPop(v4);
  return 0LL;
}

void sub_10003BC64( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10003BFE8(_Unwind_Exception *a1)
{
}

void sub_10003C018(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10003C064(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConsent:a2];
}

void sub_10003C78C(_Unwind_Exception *a1)
{
}

void sub_10003C7BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10003C808(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithAnalyticsConsent:a2];
}

void sub_10003D8E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10003D990;
    v4[3] = &unk_1000C9910;
    id v5 = *(id *)(a1 + 32);
    [WeakRetained _performReachabilityRequestWithRetryCount:v3 completion:v4];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

void sub_10003D990(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10003DA08;
  v3[3] = &unk_1000C98E8;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(&_dispatch_main_q, v3);
}

uint64_t sub_10003DA08(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void sub_10003DBE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10003DC14(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    id v23 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    goto LABEL_26;
  }

  id v9 = [v6 length];
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0LL;
  }
  uint64_t v11 = !v10;
  if (v7)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    if ([v12 isEqualToString:NSURLErrorDomain])
    {
      id v13 = [v7 code];

      if (v13 != (id)-1001LL) {
        goto LABEL_17;
      }
      id v14 = sub_10002AF94();
      uint32_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[SATVNetworkReachability _performReachabilityRequestWithRetryCount:completion:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s: reachability timed out", buf, 0xCu);
      }

      +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
      double v17 = vabdd_f64(v16, *(double *)(a1 + 48));
      if (v17 < 600.0) {
        goto LABEL_21;
      }
      id v18 = sub_10002AF94();
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SATVNetworkReachability _performReachabilityRequestWithRetryCount:completion:]_block_invoke";
        __int16 v35 = 2048;
        double v36 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_INFO,  "%s: timeout occurred.  Elapsed time was preposterous. Wallclock was changed.  Retrying.  (delta %2.2fs)",  buf,  0x16u);
      }
    }
  }

LABEL_21:
  id v20 = sub_10002AF94();
  __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[SATVNetworkReachability _performReachabilityRequestWithRetryCount:completion:]_block_invoke_2";
    __int16 v35 = 2048;
    double v36 = *(double *)&v11;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: completion block firing with reachable value %lu",  buf,  0x16u);
  }

  uint64_t v22 = *(void *)(a1 + 32);
  if (v22)
  {
    id v23 = *(void (**)(void))(v22 + 16);
LABEL_26:
    v23();
  }

    -[SATVRegionStep _resetRegionIfRequiredForContext:](self, "_resetRegionIfRequiredForContext:", v4);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 stepViewController]);
    id v24 = objc_opt_class(&OBJC_CLASS___SATVRegionViewController);
    uint64_t v25 = v23;
    dispatch_time_t v26 = v25;
    if (v24)
    {
      if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0) {
        BOOL v27 = v26;
      }
      else {
        BOOL v27 = 0LL;
      }
    }

    else
    {
      BOOL v27 = 0LL;
    }

    id v28 = v27;

    if (!v28)
    {
      uint64_t v29 = (os_log_s *)qword_100109A00;
      if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
      {
        v31[0] = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Present a view controller for this step..",  (uint8_t *)v31,  2u);
      }

      -[SATVRegionStep _showRegionViewController](self, "_showRegionViewController");
    }

    goto LABEL_30;
  }

  char v19 = (os_log_s *)qword_100109A00;
  if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v33 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We are moving forward in the flow and seems like the region has already been configured..",  v33,  2u);
  }

  -[SATVRegionStep _updatePreferredLanguages](self, "_updatePreferredLanguages");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
LABEL_31:

  return v18;
}

LABEL_30:
}

id sub_10003DF68(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performReachabilityRequestWithRetryCount:*(void *)(a1 + 48) - 1 completion:*(void *)(a1 + 40)];
}

double sub_10003EC60()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](&OBJC_CLASS___NSLocale, "autoupdatingCurrentLocale"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 countryCode]);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    char v5 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "SATVDisplayModeLocaleRefreshRate countryCode = %@",  (uint8_t *)&v4,  0xCu);
  }

  double refreshed = PBSPreferredRefreshRateForCountryCode(v1);

  return refreshed;
}

id sub_10003ED38()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 currentDisplayMode]);
  id v2 = [v1 copy];

  [v2 setRefreshRate:sub_10003EC60()];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10003EDF8;
  v6[3] = &unk_1000CA378;
  id v7 = v2;
  id v3 = v2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v0 findFirstMode:v6]);

  return v4;
}

id sub_10003EDF8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

void sub_10003FBD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10003FBF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStep];
}

void sub_10004010C(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SATVTouchRemoteSetupManager);
  id v2 = (void *)qword_100109938;
  qword_100109938 = (uint64_t)v1;
}

void sub_1000407D0(_Unwind_Exception *a1)
{
}

CFStringRef sub_100040868(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _start];

  return @"Starting";
}

__CFString *sub_10004089C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setRetryCount:0];
    [v5 _cancelScheduledRetry];
    [v5 _stop];
    uint64_t v6 = @"Stopped";
  }

  else
  {
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  return v6;
}

NSString *__cdecl sub_10004091C(id a1, TVSStateMachine *a2, NSString *a3, id a4, NSDictionary *a5)
{
  return (NSString *)@"Started";
}

__CFString *sub_100040928(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Error"]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    if ([v11 isEqualToString:NSOSStatusErrorDomain])
    {
      id v12 = [v10 code];

      if (v12 != (id)-6721LL)
      {
LABEL_12:
        [WeakRetained _notifyDelegateDidFailToStartSetupWithError:v10];
        double v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 currentState]);
LABEL_13:

        goto LABEL_14;
      }

      id v13 = (char *)[WeakRetained retryCount];
      id v14 = sub_10002B074();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v15 = os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT);
      if ((unint64_t)v13 <= 2)
      {
        if (v15)
        {
          int v18 = 134217984;
          char v19 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Received SATVTouchRemoteSetupManagerEventDidFailToStartSetup while trying to start TTSU. Will retry. retryCount=%lu",  (uint8_t *)&v18,  0xCu);
        }

        [WeakRetained setRetryCount:v13 + 1];
        [WeakRetained _scheduleRetry];
        double v16 = @"WaitingToRetry";
        goto LABEL_13;
      }

      if (v15)
      {
        LOWORD(v1_Block_object_dispose(va, 8) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "Received SATVTouchRemoteSetupManagerEventDidFailToStartSetup but exhausted retries. Will *NOT* retry.",  (uint8_t *)&v18,  2u);
      }
    }

    goto LABEL_12;
  }

  double v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 currentState]);
LABEL_14:

  return v16;
}

id sub_100040AF8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = sub_10002B074();
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
    int v16 = 138412290;
    double v17 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received SATVTouchRemoteSetupManagerEventDidFailToStartSetup in an unexpected state. state=%@",  (uint8_t *)&v16,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Error"]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateDidFailToStartSetupWithError:v12];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  return v14;
}

__CFString *sub_100040C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _stop];
    [v5 _start];
    uint64_t v6 = @"Starting";
  }

  else
  {
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  return v6;
}

void sub_100041858( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100041888(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _completeSilentActivationWithSuccessType:a2 failureReason:a3 error:v7];
}

uint64_t sub_1000419B0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_100041B1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
LABEL_12:
    v8();
    goto LABEL_13;
  }

  if (!v6)
  {
LABEL_11:
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
    goto LABEL_12;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned int v10 = [v9 isMDMConfiguration];

  id v11 = sub_10002B074();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "An cloud configuration was found but it was not for MDM. Touch Setup can coninue.",  (uint8_t *)buf,  2u);
    }

    goto LABEL_11;
  }

  if (v13)
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Failing Touch Setup because an MDM cloud configuration was found",  (uint8_t *)buf,  2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  [*(id *)(a1 + 32) stop];
  [*(id *)(*(void *)(a1 + 32) + 40) updateAdvertisingState:0];
  id v14 = sub_10000D7CC(@"CLOUD_CONFIG_TTSU_ERROR_TITLE", @"Localizable");
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_10000D7CC(@"CLOUD_CONFIG_TTSU_ERROR_DESCRIPTION", @"Localizable");
  double v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  int v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v15,  v17,  1LL));
  objc_initWeak(buf, *(id *)(a1 + 32));
  id v19 = sub_10000D7CC(@"OK", @"Localizable");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100041E30;
  v27[3] = &unk_1000CA450;
  objc_copyWeak(&v28, buf);
  v27[4] = *(void *)(a1 + 32);
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v20,  1LL,  v27));
  [v18 addAction:v21];

  uint64_t v22 = *(void **)(a1 + 32);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userInterfaceDelegate]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100041EE4;
  v25[3] = &unk_1000CA478;
  v25[4] = *(void *)(a1 + 32);
  id v24 = v18;
  id v26 = v24;
  [v22 _checkTarget:v23 forSelector:"tapToSetupManager:presentErrorAlert:" performBlockOnMainThread:v25];

  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);

LABEL_13:
}

void sub_100041E08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_100041E30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained userInterfaceDelegate]);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100041ED0;
    v5[3] = &unk_1000CA428;
    void v5[4] = *(void *)(a1 + 32);
    [v3 _checkTarget:v4 forSelector:"tapToSetupManager:didFailSetupWithError:" performBlockOnMainThread:v5];
  }
}

id sub_100041ED0(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(*(void *)(a1 + 32) + 40) didFailSetupWithError:0];
}

id sub_100041EE4(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(*(void *)(a1 + 32) + 40) presentErrorAlert:*(void *)(a1 + 40)];
}

void sub_100042400(_Unwind_Exception *a1)
{
}

void sub_10004241C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateDisplayPostFetchWithStatus:a2 viewController:v10 error:v7];
  }
}

void sub_100042490(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (os_log_s *)qword_100109948;
  if (os_log_type_enabled((os_log_t)qword_100109948, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Dimiss WN with result: %@",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(a1 + 32) _callCompletionHandler];
}

LABEL_9:
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerLabel](self, "footerLabel"));
    [v13 setHidden:0];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerLabel](self, "footerLabel"));
    [v14 setText:(&self->super.super.super.isa)[v11]];

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
LABEL_13:
    int v18 = v15;
    [v15 setHidden:1];

    goto LABEL_14;
  }

  id v11 = 11LL;
  if (self->_secondOptionFooterText) {
    goto LABEL_9;
  }
  id v12 = 14LL;
LABEL_11:
  if ((&self->super.super.super.isa)[v12])
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
    [v16 setHidden:1];

    objc_storeStrong((id *)&self->_footerView, (&self->super.super.super.isa)[v12]);
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
    [v17 setHidden:0];

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerLabel](self, "footerLabel"));
    goto LABEL_13;
  }

  id v12 = 0LL;
LABEL_24:

  return (id)v12;
}
}

void sub_100044B8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100044BA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMenu];
}

void sub_10004564C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id sub_10004567C()
{
  if (qword_100109958 != -1) {
    dispatch_once(&qword_100109958, &stru_1000CA538);
  }
  return (id)qword_100109950;
}

void sub_1000456BC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = sub_10004567C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Downloaded iCloud Terms. {data=%{public}@, error=%{public}@}",  buf,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v7) {
      [WeakRetained _getFallbackTermsAndFreeze];
    }
    else {
      [WeakRetained _decodeTermsData:v6];
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000457F8;
    block[3] = &unk_1000C9468;
    void block[4] = v11;
    dispatch_async(&_dispatch_main_q, block);
  }
}

id sub_1000457F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadCompleted];
}

void sub_100045F1C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:NSLocaleIdentifier]);

  int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathExtension:@"lproj"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([@"/var/mobile/Library/Legal" stringByAppendingPathComponent:v5]);

  id v20 = 0LL;
  LODWORD(v5) = [v2 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v7 = v20;
  if ((_DWORD)v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingPathExtension:@"txt"]);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v8]);

    id v10 = *(void **)(a1 + 40);
    id v19 = v7;
    unsigned int v11 = [v10 writeToFile:v9 atomically:1 encoding:4 error:&v19];
    id v12 = v19;

    id v13 = sub_10004567C();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    __int16 v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Wrote terms to %@", buf, 0xCu);
      }
    }

    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      sub_10007782C();
    }
  }

  else
  {
    id v16 = sub_10004567C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10007788C();
    }
    id v12 = v7;
  }

  id v17 = sub_10004567C();
  int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100077738(a1, v18);
  }
}

void sub_10004635C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) termsDetailsViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  [v3 setHidden:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) consentViewController]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 setHidden:1];
}

void sub_100046570(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) termsDetailsViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 view]);
  [v3 setHidden:1];

  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) consentViewController]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
  [v4 setHidden:0];
}

void sub_100046784(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVTermsViewController");
  uint64_t v2 = (void *)qword_100109950;
  qword_100109950 = (uint64_t)v1;
}

void sub_1000467B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_100046CD8(_Unwind_Exception *a1)
{
}

void sub_100046D18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100046D64(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithCloudConfigSuccess:0];
}

void sub_100046D94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _notifyTriggerStatusChangeAndReset:0];
    [v2 _completeStepWithCloudConfigSuccess:1];
    id WeakRetained = v2;
  }
}

SATVAirplay2TapToSetupDataSourceObject *sub_100047534(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = -[SATVAirplay2TapToSetupDataSourceObject initWithHomeKitObject:]( objc_alloc(&OBJC_CLASS___SATVAirplay2TapToSetupDataSourceObject),  "initWithHomeKitObject:",  v3);
  id v5 = *(id *)(a1 + 32);

  if (v5 == v3) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16LL), v4);
  }
  return v4;
}

SATVAirplay2DataSourceObject *__cdecl sub_10004767C(id a1, TVSKTapToSetupHomeKitRoom *a2)
{
  id v2 = a2;
  id v3 = -[SATVAirplay2TapToSetupDataSourceObject initWithHomeKitObject:]( objc_alloc(&OBJC_CLASS___SATVAirplay2TapToSetupDataSourceObject),  "initWithHomeKitObject:",  v2);

  return (SATVAirplay2DataSourceObject *)v3;
}

void sub_100047EF0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = a3;
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  [v4 addObject:v7];
}

void sub_10004862C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TriageKit", "Internal");
  id v2 = (void *)qword_100109968;
  qword_100109968 = (uint64_t)v1;
}

void sub_10004900C(_Unwind_Exception *a1)
{
}

void sub_10004903C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeStepWithConsentForSiri:a2 consentForDictation:a2 typeToSiri:0 TTSUDeviceSiriLanguage:*(void *)(a1 + 32)];
}

void sub_100049088(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeStepWithConsentForSiri:0 consentForDictation:a2 typeToSiri:0 TTSUDeviceSiriLanguage:*(void *)(a1 + 32)];
}

void sub_1000490D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100049D18(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVBundlePrefetchStep");
  uint64_t v2 = (void *)qword_100109980;
  qword_100109980 = (uint64_t)v1;
}

id sub_100049EE0()
{
  if (qword_100109998 != -1) {
    dispatch_once(&qword_100109998, &stru_1000CA650);
  }
  return (id)qword_100109990;
}

void sub_100049F20(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "FlowDescriptionProviderFactory");
  uint64_t v2 = (void *)qword_100109990;
  qword_100109990 = (uint64_t)v1;
}

CFStringRef sub_100049F54(uint64_t a1)
{
  else {
    return *(&off_1000CA690 + a1 - 1);
  }
}

uint64_t sub_100049F7C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 activeAccount]);

  id v2 = [v1 paidPurchasesPasswordSetting];
  if (v1) {
    BOOL v3 = v2 == (id)1;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v6 = !v3 && v2 != (id)2 && v2 != (id)3;

  return v6;
}

void sub_100049FDC(uint64_t a1)
{
  id v2 = sub_10002AF94();
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    uint64_t v13 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Attempting to update purchases password setting to: %lu",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);

  if (v5)
  {
    [v5 setPaidPurchasesPasswordSetting:a1];
    if (![v5 freeDownloadsPasswordSetting])
    {
      id v6 = sub_10002AF94();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218242;
        uint64_t v13 = 3LL;
        __int16 v14 = 2112;
        __int16 v15 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating free download password setting to: %lu for account: %@",  (uint8_t *)&v12,  0x16u);
      }

      [v5 setFreeDownloadsPasswordSetting:3];
    }

    id v8 = sub_10002AF94();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      uint64_t v13 = a1;
      __int16 v14 = 2112;
      __int16 v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating purchases password setting to: %lu for account: %@",  (uint8_t *)&v12,  0x16u);
    }

    id v10 = objc_alloc_init(&OBJC_CLASS___SSMutableURLRequestProperties);
    [v10 setValue:@"true" forRequestParameter:@"setup"];
    [v5 updateAccountPasswordSettingsWithRequestProperties:v10 completionBlock:&stru_1000CA670];
  }

  else
  {
    id v11 = sub_10002AF94();
    id v10 = (id)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_1000779B0((os_log_t)v10);
    }
  }
}

void sub_10004A1F4(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10002AF94();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Update of purchases password setting completed. error: %@",  (uint8_t *)&v5,  0xCu);
  }
}

uint64_t sub_10004B2C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 40));
}

void sub_10004B980( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

BOOL sub_10004B9B8(id a1, SATVAirplay2HomeTheaterSpeaker *a2)
{
  return -[SATVAirplay2HomeTheaterSpeaker supportsAudioDestination](a2, "supportsAudioDestination");
}

void sub_10004B9C0(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setProceedingToNextStep:1];
    [v4 _updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:v5];
  }
}

void sub_10004BA1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _childNavigationController]);
    id v3 = [v2 popViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}

void sub_10004BC64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10004BC80(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v6)
    {
      [WeakRetained _showHomeTheaterSpeakerPickerIfRequiredForRoomNamed:*(void *)(a1 + 32) inHome:*(void *)(a1 + 40)];
      goto LABEL_9;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    if ([v4 isEqualToString:@"com.apple.purplebuddy.Airplay2DataSource"])
    {
      id v5 = [v6 code];

      if (v5 == (id)1)
      {
        [WeakRetained _presentCreateRoomFailedViewControllerWithError:v6];
        goto LABEL_9;
      }
    }

    else
    {
    }

    [WeakRetained _updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:0];
  }

void sub_10004C008(_Unwind_Exception *a1)
{
}

void sub_10004C090(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained(v4);
  LODWORD(v4) = [v5 isEqualToString:@"Ready"];

  if ((_DWORD)v4)
  {
    [WeakRetained _setLoadingTimer:0];
    [WeakRetained _showPickerViewControllers];
  }

  else
  {
    [WeakRetained _scheduleLoadingTimer];
    [WeakRetained _showLoadingViewController];
  }
}

CFStringRef sub_10004C110(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _dataSource]);
  unsigned int v3 = [v2 isReady];

  id v4 = sub_10002B004();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SATVAirplay2ViewController _dataSourceStateMachine]_block_invoke_2";
    __int16 v9 = 1024;
    unsigned int v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Data source ready state did change. isReady: %{BOOL}d",  (uint8_t *)&v7,  0x12u);
  }

  if (v3) {
    return @"Ready";
  }
  else {
    return @"Loading";
  }
}

CFStringRef sub_10004C208(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _dataSource]);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 homes]);
  id v4 = [v3 count];

  if (!v4) {
    [WeakRetained _showPickerViewControllers];
  }

  return @"Ready";
}

CFStringRef sub_10004C274(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPickerViewControllers];

  return @"Ready";
}

void sub_10004C390(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _makeLoadingViewController]);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _childNavigationController]);
  id v5 = v2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  [v3 setViewControllers:v4 animated:1];
}

void sub_10004C4A8(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _makePickerViewControllers]);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _childNavigationController]);
  [v2 setViewControllers:v3 animated:1];
}

void sub_10004C564(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _dataSourceStateMachine]);
  [v1 postEvent:@"LoadingTimerFired"];
}

void sub_10004C684(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _dataSourceStateMachine]);
  [v1 postEvent:@"DataSourceReadyStateDidChange"];
}

void sub_10004C8F8(uint64_t a1)
{
  id v2 = sub_10002B004();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[SATVAirplay2ViewController homePickerViewController:didSelectHome:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Home picker did select home. home=%@",  (uint8_t *)&v7,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _makeRoomPickerViewControllerForHome:*(void *)(a1 + 32)]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) navigationController]);
  [v6 pushViewController:v5 animated:1];
}

void sub_10004CA9C(uint64_t a1)
{
  id v2 = sub_10002B004();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 136315394;
    __int16 v9 = "-[SATVAirplay2ViewController roomPickerViewController:didSelectExistingRoom:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Room picker did select existing room. room=%@",  (uint8_t *)&v8,  0x16u);
  }

  id v5 = *(void **)(a1 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) home]);
  [v5 _moveOrAddLocalAccessoryToRoomNamed:v6 inHome:v7];
}

void sub_10004CC4C(uint64_t a1)
{
  id v2 = sub_10002B004();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 136315394;
    __int16 v9 = "-[SATVAirplay2ViewController roomPickerViewController:didSelectSuggestedRoom:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Room picker did select suggested room. room=%@",  (uint8_t *)&v8,  0x16u);
  }

  id v5 = *(void **)(a1 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) name]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) home]);
  [v5 _moveOrAddLocalAccessoryToRoomNamed:v6 inHome:v7];
}

void sub_10004CF44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10004CF6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472LL;
  activity_block[2] = sub_10004D030;
  activity_block[3] = &unk_1000C93F0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  _os_activity_initiate((void *)&_mh_execute_header, "did add new room", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v8);
}

void sub_10004D030(uint64_t a1)
{
  id v2 = sub_10002B004();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[SATVAirplay2ViewController roomPickerViewControllerWantsNewRoomViewController:]_block_invoke_2";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Room picker did add new room.",  (uint8_t *)&v7,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) home]);
  [WeakRetained _moveOrAddLocalAccessoryToRoomNamed:v5 inHome:v6];
}

id sub_10004D704(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 _processHIDEvent:a4];
}

void sub_10004E234( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_10004E254()
{
  if (qword_1001099B0 != -1) {
    dispatch_once(&qword_1001099B0, &stru_1000CABC8);
  }
  return (id)qword_1001099A8;
}

void sub_10004E294(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleSetupServiceProgressEvent:a2 info:v5];
}

void sub_10004E780(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10004E254();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Activator hook finished", v10, 2u);
    }

    __int16 v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100077AB8();
    }

    __int16 v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v9();
}

void sub_10004EE00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10004EE24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained userInterfaceDelegate]);
  if ((objc_opt_respondsToSelector(v7, "tapToSetupManager:didFinishAuthenticationForAccount:withResult:error:") & 1) != 0)
  {
    [v7 tapToSetupManager:WeakRetained didFinishAuthenticationForAccount:*(void *)(a1 + 48) withResult:a2 error:v5];
    id v8 = sub_10004E254();
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = TRStringFromSetupAccountType(*(void *)(a1 + 48));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v18 = 138543362;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Informing the delegate that auth finished for account type %{public}@",  (uint8_t *)&v18,  0xCu);
    }
  }

  id v12 = sub_10004E254();
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = TRStringFromSetupAccountType(*(void *)(a1 + 48));
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = [v5 code];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    int v18 = 138544130;
    id v19 = v15;
    __int16 v20 = 1024;
    int v21 = a2;
    __int16 v22 = 2048;
    id v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Auth finished for account type %{public}@, didAuthenticate: %{BOOL}d, errorCode: %lu, error: %@",  (uint8_t *)&v18,  0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10004F788(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10004E254();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Activator hook finished", v10, 2u);
    }

    __int16 v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100077AB8();
    }

    __int16 v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  }

  v9();
}

void sub_10004FE34(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = AKAuthenticationUsernameKey;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationPasswordKey]);

  id v9 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v9 setAuthenticationType:1];
  [v9 setCanMakeAccountActive:1];
  id v10 = [[AMSAuthenticateTask alloc] initWithAccount:0 options:v9];
  [v10 setUsername:v6];
  [v10 setAltDSID:v7];
  [v10 setPassword:v8];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 performAuthentication]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10004FFFC;
  v14[3] = &unk_1000CA800;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  [v11 addSuccessBlock:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000501B0;
  v12[3] = &unk_1000C9898;
  id v13 = *(id *)(a1 + 40);
  [v11 addErrorBlock:v12];
}

void sub_10004FFFC(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000500A4;
  block[3] = &unk_1000CA050;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_1000500A4(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
  if (([v2 isActive] & 1) == 0)
  {
    [v2 setActive:1];
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    [v3 saveAccount:v2 withCompletionHandler:0];
  }

  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "iTunes Authentication successful. {accountID=%@}",  (uint8_t *)&v7,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000501B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100077FB4();
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100050274;
  v8[3] = &unk_1000C9AC0;
  id v6 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(&_dispatch_main_q, v8);
}

uint64_t sub_100050274(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void sub_100050430( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100050454(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:AKAuthenticationUsernameKey]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained iCloudAccountManager]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005054C;
    v10[3] = &unk_1000C9898;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v8 signInWithUsername:v7 password:v9 completion:v10];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10005054C(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000505E0;
  v4[3] = &unk_1000C9FD8;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

uint64_t sub_1000505E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = sub_10004E254();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100078030();
    }

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "iCloud authentication successful.", v8, 2u);
    }

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  return v6();
}

void sub_10005086C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100050930;
  v9[3] = &unk_1000CA878;
  id v10 = a3;
  id v6 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 40);
  id v7 = v5;
  id v8 = v10;
  dispatch_async(&_dispatch_main_q, v9);
}

uint64_t sub_100050930(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if (!*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  id v3 = sub_10004E254();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000780D0(a1, v2, v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_100050AB4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100050BA8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, [a2 isAuthenticated], v5);
  }

uint64_t sub_100050D40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

id sub_100050E58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 112);
  *(void *)(v2 + 112) = 0LL;

  return [*(id *)(a1 + 32) didFailSetupWithErrorCode:0];
}

void sub_1000512E0(id a1, TRRequestMessage *a2, id a3)
{
  uint64_t v3 = (void (**)(id, void, id))a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___TRHandshakeResponse);
  [v4 setProtocolVersion:0];
  v3[2](v3, 0LL, v4);
}

id sub_100051340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleConfigurationRequest:a2 withResponseHandler:a3];
}

id sub_100051350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleActivationRequest:a2 withResponseHandler:a3];
}

id sub_100051360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleNetworkRequest:a2 withResponseHandler:a3];
}

id sub_100051370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompanionAuthenticateWithRequest:a2 withResponseHandler:a3];
}

id sub_100051380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleProxyDeviceRequest:a2 withResponseHandler:a3];
}

id sub_100051390(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleProxyAuthenticationRequest:a2 withResponseHandler:a3];
}

id sub_1000513A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompletionRequest:a2 withResponseHandler:a3];
}

id sub_1000513B0(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManagerDidPromptToBeginSetup:*(void *)(a1 + 32)];
}

void sub_100051688(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 deviceName]);
  [v4 tapToSetupManager:v2 didBeginSetupWithDeviceName:v5 isNewFlow:1];
}

void sub_100051898(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___TRSetupActivationResponse);
  [v6 setActivated:a2];
  id v7 = sub_10004E254();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Activator hook finished", v10, 2u);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100077AB8();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100051B0C(uint64_t a1, int a2)
{
  uint64_t v3 = +[TVSNetworkUtilities internetAvailable](&OBJC_CLASS___TVSNetworkUtilities, "internetAvailable") & a2;
  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"Does not have";
    if ((_DWORD)v3) {
      id v6 = @"Has";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Network/Lang/Region config request handled. %@ internet. Sending response.",  buf,  0xCu);
  }

  id v7 = *(void **)(a1 + 32);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInterfaceDelegate]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100051C78;
  v10[3] = &unk_1000CA958;
  char v11 = v3;
  void v10[4] = *(void *)(a1 + 32);
  [v7 _checkTarget:v8 forSelector:"tapToSetupManager:didBeginConfigurationPhase:withMetadata:" performBlockOnMainThread:v10];

  id v9 = objc_alloc_init(&OBJC_CLASS___TRSetupNetworkResponse);
  [v9 setHasNetwork:v3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

id sub_100051C78(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 40)) {
    uint64_t v2 = 2LL;
  }
  else {
    uint64_t v2 = 3LL;
  }
  return [a2 tapToSetupManager:*(void *)(a1 + 32) didBeginConfigurationPhase:v2 withMetadata:0];
}

id sub_1000520A4(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(a1 + 32) didReceivePreAuthInfo:*(void *)(a1 + 40)];
}

id sub_1000520B0(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(a1 + 32) didReceiveSetupInfo:*(void *)(a1 + 40)];
}

void sub_10005230C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100052330(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v7 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) anyObject]);
    id v9 = objc_msgSend(v7, "_serviceTypeForAccountService:", objc_msgSend(v8, "unsignedIntegerValue"));

    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) companionDevice]);
    id v11 = objc_alloc(&OBJC_CLASS___TRAnisetteDataProvider);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained activeSession]);
    id v13 = [v11 initWithSession:v12];

    uint64_t v14 = *(void *)(a1 + 56);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000524E0;
    v15[3] = &unk_1000CA9D0;
    objc_copyWeak(&v19, (id *)(a1 + 72));
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 64);
    [WeakRetained _authenticateAccount:v14 forServiceType:v9 withCompanionDevice:v10 anisetteDataProvider:v13 completion:v15];

    objc_destroyWeak(&v19);
  }

  else
  {
    [*(id *)(a1 + 32) _completedCompanionAuthenticationRequest:*(void *)(a1 + 40) unauthenticatedAccountServices:*(void *)(a1 + 48) withResponseHandler:*(void *)(a1 + 64)];
  }
}

void sub_1000524CC(_Unwind_Exception *a1)
{
}

void sub_1000524E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10005262C;
    v11[3] = &unk_1000CA9A8;
    objc_copyWeak(&v14, (id *)(a1 + 56));
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [WeakRetained _authenticateWithAccountServices:v8 usingAuthenticationResults:v5 completion:v11];

    objc_destroyWeak(&v14);
  }

  else
  {
    id v9 = sub_10004E254();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100078200(v6);
    }

    [WeakRetained _completedCompanionAuthenticationRequest:*(void *)(a1 + 32) unauthenticatedAccountServices:*(void *)(a1 + 40) withResponseHandler:*(void *)(a1 + 48)];
  }
}

void sub_100052618(_Unwind_Exception *a1)
{
}

void sub_10005262C(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _completedCompanionAuthenticationRequest:*(void *)(a1 + 32) unauthenticatedAccountServices:v4 withResponseHandler:*(void *)(a1 + 40)];
}

void sub_100052928(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) anyObject]);
    id v5 = objc_msgSend(v3, "_serviceTypeForAccountService:", objc_msgSend(v4, "unsignedIntegerValue"));

    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 64);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100052A38;
    v9[3] = &unk_1000CAA48;
    uint64_t v8 = *(void **)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    id v11 = v8;
    id v12 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 72);
    [v10 _authenticateAccount:v6 forServiceType:v5 withPassword:v7 completion:v9];
  }

  else
  {
    [*(id *)(a1 + 32) _completedProxyAuthenticationRequest:*(void *)(a1 + 40) unauthenticatedAccountServices:*(void *)(a1 + 48) withResponseHandler:*(void *)(a1 + 72)];
  }

void sub_100052A38(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100052B2C;
    v10[3] = &unk_1000CAA20;
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    id v13 = *(id *)(a1 + 56);
    [v11 _authenticateWithAccountServices:v7 usingAuthenticationResults:a2 completion:v10];
  }

  else
  {
    id v8 = sub_10004E254();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000782A4();
    }

    [*(id *)(a1 + 32) _completedProxyAuthenticationRequest:*(void *)(a1 + 40) unauthenticatedAccountServices:*(void *)(a1 + 48) withResponseHandler:*(void *)(a1 + 56)];
  }
}

id sub_100052B2C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedProxyAuthenticationRequest:*(void *)(a1 + 40) unauthenticatedAccountServices:a2 withResponseHandler:*(void *)(a1 + 48)];
}

void sub_100052C34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Informing the delegate that setup finished",  v8,  2u);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 deviceInfo]);
  [v3 tapToSetupManagerDidFinishSetup:v6 deviceInfo:v7];
}

void sub_100052D60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 134217984;
    uint64_t v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Informing the delegate that setup failed (error #: %ld).",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  TRDeviceSetupErrorDomain,  *(void *)(a1 + 40),  0LL));
  [v3 tapToSetupManager:*(void *)(a1 + 32) didFailSetupWithError:v7];
}

void sub_100052EFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Informing the delegate that setup fail to start (error #: %@).",  (uint8_t *)&v7,  0xCu);
  }

  [v3 tapToSetupManager:*(void *)(a1 + 40) didFailToStartSetupWithError:*(void *)(a1 + 32)];
}

void sub_100053110(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if ((a2 & 1) != 0)
  {
    id v7 = sub_10004E254();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v9;
      id v10 = "Save of verified account successful; %@.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0xCu);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  id v11 = [v5 code];
  id v12 = sub_10004E254();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v8 = v13;
  if (v11 == (id)5)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v14;
      id v10 = "Account already existed %@.";
      goto LABEL_7;
    }

void sub_1000535BC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10004E254();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = StringFromTRAccountService(*(void *)(a1 + 64));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v13 = 138543362;
      uint64_t v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Successfully authenticated. {accountService=%{public}@}",  (uint8_t *)&v13,  0xCu);
    }

    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:AKAuthenticationUsernameKey]);
    if (v8) {
      +[TIRecentInputs storeInput:forSystemIdentifier:]( &OBJC_CLASS___TIRecentInputs,  "storeInput:forSystemIdentifier:",  v8,  TIEmailRecentInputIdentifier);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1000783B0(a1, v5, v8);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", *(void *)(a1 + 40)));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 64)));
  [v11 removeObject:v12];

  [*(id *)(a1 + 48) _authenticateWithAccountServices:v11 usingAuthenticationResults:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
}

void sub_100053878(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_100053908;
    v4[3] = &unk_1000C9938;
    id v5 = *(id *)(a1 + 48);
    [v2 _authenticateHomeSharingWithAuthenticationResults:v3 completionHandler:v4];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void sub_100053908(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10004E254();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100078500();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100053C90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id location)
{
}

id sub_100053CAC(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(a1 + 32) didBeginConfigurationPhase:5 withMetadata:*(void *)(a1 + 40)];
}

void sub_100053CBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100053D3C;
  v3[3] = &unk_1000C9A00;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained _promptForASNSettingWithCompletion:v3];
}

uint64_t sub_100053D3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100053D50(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053DF8;
  block[3] = &unk_1000CA050;
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_100053DF8(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) account]);
  unsigned __int8 v3 = [v2 isActive];
  id v4 = sub_10004E254();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "iTunes successfully authenticated. (%@).",  buf,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "iTunes successfully authenticated but not activated. Making active. (%@).",  buf,  0xCu);
    }

    [v2 setActive:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100053F88;
    v10[3] = &unk_1000C9938;
    id v11 = *(id *)(a1 + 48);
    [v9 saveAccount:v2 withCompletionHandler:v10];
  }
}

void sub_100053F88(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053FF0;
  block[3] = &unk_1000C9A00;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_100053FF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100053FFC(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000540A4;
  block[3] = &unk_1000C9FB0;
  id v5 = a2;
  id v7 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t sub_1000540A4(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) domain]);
  if ([v3 isEqualToString:AMSServerErrorDomain])
  {
    id v4 = [*v2 code];

    if (v4 == (id)5304)
    {
      id v5 = sub_10004E254();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Skipping iTunes Store authentication -- the account has not been set up for the store.",  v11,  2u);
      }

      id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL);
      return v7();
    }
  }

  else
  {
  }

  id v8 = sub_10004E254();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100078590(a1, v2, v9);
  }

  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL);
  return v7();
}

id sub_1000544A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setAsnPaidSetting:a2];
}

uint64_t sub_1000544B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100054600(id a1, NSError *a2)
{
  if (a2) {
    -[NSError code](a2, "code");
  }
}

id sub_1000547BC(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(a1 + 32) didBeginConfigurationPhase:6 withMetadata:*(void *)(a1 + 40)];
}

uint64_t sub_1000547CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100054984(uint64_t a1, void *a2)
{
  return [a2 tapToSetupManager:*(void *)(a1 + 32) didBeginConfigurationPhase:7 withMetadata:*(void *)(a1 + 40)];
}

void sub_100054994(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, [a2 isAuthenticated], v5);
  }

uint64_t sub_100054B30(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100054DB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVSetup", "SATVTapToSetupManager");
  id v2 = (void *)qword_1001099A8;
  qword_1001099A8 = (uint64_t)v1;
}

  ;
}

  ;
}

void sub_100054E30( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100054E40()
{
  return [v0 code];
}

  ;
}

  ;
}

  ;
}

void sub_100054E94(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100054EA0()
{
  return v0;
}

id sub_100054EAC()
{
  return [v0 code];
}

void sub_100054EB4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_1000550A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000550CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _attemptSilentActivationIfPossible];
}

id sub_1000550F8(uint64_t a1, void *a2)
{
  return [a2 _autoAdvanceNow];
}

void sub_1000554D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100055510(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  switch(a2)
  {
    case 0LL:
      id v4 = (os_log_s *)qword_1001099B8;
      if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        id v5 = "Silent activation failed";
        id v6 = (uint8_t *)&v9;
        goto LABEL_9;
      }

      break;
    case 1LL:
      id v7 = (os_log_s *)qword_1001099B8;
      if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Silent activation succeeded (Regular Activation). Trying to retrieve cloud config details...",  buf,  2u);
      }

      [WeakRetained _retrieveCloudConfigurationDetails];
      break;
    case 2LL:
      id v4 = (os_log_s *)qword_1001099B8;
      if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        id v5 = "Silent activation succeeded (Factory Activated). Nothing more to do.";
        id v6 = v12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      }

      break;
    case 3LL:
      id v8 = (os_log_s *)qword_1001099B8;
      if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Silent activation succeeded (Demo). Should finish buddy flow...",  v11,  2u);
      }

      [WeakRetained _completeStepWithSuccess:1 finishSetup:1];
      break;
    default:
      break;
  }
}

void sub_1000557E0(_Unwind_Exception *a1)
{
}

void sub_10005580C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000558A8;
  v4[3] = &unk_1000CAC18;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v3 retrieveCloudConfigurationDetailsShouldForce:a2 completionBlock:v4];
  objc_destroyWeak(&v5);
}

void sub_100055894(_Unwind_Exception *a1)
{
}

void sub_1000558A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (os_log_s *)qword_1001099B8;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Fetched cloud config details. Will try to auto advance",  buf,  2u);
    }

    [WeakRetained _autoAdvanceIfNeeded];
  }

  else if (v6)
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "No cloud config details. Nothing more to do.",  v7,  2u);
  }
}

void sub_100055960(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = (os_log_s *)qword_1001099B8;
  if (os_log_type_enabled((os_log_t)qword_1001099B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Return to Service finished. Error: %{public}@",  buf,  0xCu);
  }

  if (v3)
  {
    [*(id *)(a1 + 32) endReturnToService];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100055A80;
    block[3] = &unk_1000C9468;
    void block[4] = WeakRetained;
    dispatch_async(&_dispatch_main_q, block);
  }
}

id sub_100055A80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _autoAdvanceIfNeeded];
}

void sub_100056038( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100056054(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _invalidateAllTimers];
    [v2 _completeStepWithSuccess:1 finishSetup:0];
    id WeakRetained = v2;
  }
}

id sub_10005671C()
{
  if (qword_1001099C8 != -1) {
    dispatch_once(&qword_1001099C8, &stru_1000CAC88);
  }
  return (id)qword_1001099C0;
}

void sub_100056998(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stepDelegate]);
  [v2 step:*(void *)(a1 + 32) didCompleteWithResult:*(void *)(a1 + 40)];
}

void sub_100056A30(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stepDelegate]);
  [v2 didCancelStep:*(void *)(a1 + 32)];
}

void sub_100056AEC(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stepDelegate]);
  [v2 step:*(void *)(a1 + 32) displayViewController:*(void *)(a1 + 40)];
}

void sub_100056BD4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stepDelegate]);
  [v2 step:*(void *)(a1 + 32) triggerStatusDidChangeForTriggers:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
}

void sub_100056EB0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVBundleStep");
  id v2 = (void *)qword_1001099C0;
  qword_1001099C0 = (uint64_t)v1;
}

void sub_1000570F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100057114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _menuSelected];
}

void sub_100058058( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20, id *a21, id *a22, id *a23)
{
}

void sub_100058210()
{
}

void sub_100058218(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setDidLoginOrSkipFromAppleID:1];
    [v2 _loginCompleteWithResult:1];
    id WeakRetained = v2;
  }
}

CFStringRef sub_100058258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained clientMenuHandler]);

    if (v3)
    {
      id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue([v2 clientMenuHandler]);
      v4[2]();
    }
  }

  return @"SATVLoginStateMachineStateAppleIDPass";
}

CFStringRef sub_1000582C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showActivityIndicator];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _usernameText]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _passwordText]);
    [v2 _authenticateAppleIDWithUsername:v3 password:v4];
  }

  return @"SATVLoginStateMachineStateAppleIDAttemptingLogin";
}

CFStringRef sub_10005833C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_5;
  }
  if (!sub_100049F7C())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_5:
    id v3 = @"SATVLoginStateMachineStateLoginComplete";
    goto LABEL_6;
  }

  [WeakRetained _showPasswordSettingPrompt];
  id v3 = @"SATVLoginStateMachineStateAppleIDPromptingForPasswordSetting";
LABEL_6:

  return v3;
}

CFStringRef sub_1000583A0(uint64_t a1)
{
  return @"SATVLoginStateMachineStateLoginComplete";
}

CFStringRef sub_1000583C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    [v2 logOutAccountType:0];

    [WeakRetained _showAppleIDUsernameScreen];
    [WeakRetained _hideActivityIndicator];
  }

  return @"SATVLoginStateMachineStateAppleIDPass";
}

CFStringRef sub_100058428(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _usernameText]);
    [v2 setAppleIDUsername:v3];

    [v2 _showiCloudUsernameScreen];
  }

  return @"SATVLoginStateMachineStateiCloudAuthentication";
}

CFStringRef sub_100058484(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    [v2 logOutAccountType:0];

    [WeakRetained setAppleIDUsername:0];
    [WeakRetained setDidLoginOrSkipFromAppleID:1];
    [WeakRetained _loginCompleteWithResult:0];
  }

  return @"SATVLoginStateMachineStateLoginComplete";
}

CFStringRef sub_1000584FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showActivityIndicator];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _usernameText]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _passwordText]);
    [v2 _authenticateiCloudAccountWithUsername:v3 password:v4];
  }

  return @"SATVLoginStateMachineStateiCloudAttemptingLogin";
}

CFStringRef sub_100058578(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setICloudLoggedIn:1];
    [v2 _showiTunesUsernameScreen];
    [v2 _hideActivityIndicator];
  }

  return @"SATVLoginStateMachineStateiTunesAuthentication";
}

CFStringRef sub_1000585C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showiCloudUsernameScreen];
    [v2 _hideActivityIndicator];
  }

  return @"SATVLoginStateMachineStateiCloudAuthentication";
}

CFStringRef sub_10005860C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setICloudUsername:0];
    [v2 _showAppleIDUsernameScreen];
  }

  return @"SATVLoginStateMachineStateAppleIDPass";
}

CFStringRef sub_100058654(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _usernameText]);
    [v2 setICloudUsername:v3];

    [v2 _showiTunesUsernameScreen];
  }

  return @"SATVLoginStateMachineStateiTunesAuthentication";
}

CFStringRef sub_1000586B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showActivityIndicator];
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _usernameText]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _passwordText]);
    [v2 _authenticateStoreAccountWithUsername:v3 password:v4];
  }

  return @"SATVLoginStateMachineStateiTunesAttemptingLogin";
}

CFStringRef sub_10005872C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _showiTunesUsernameScreen];
    [v2 _hideActivityIndicator];
  }

  return @"SATVLoginStateMachineStateiTunesAuthentication";
}

CFStringRef sub_100058770(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    [v2 logOutAccountType:2];

    [WeakRetained setITunesUsername:0];
    [WeakRetained _showiCloudUsernameScreen];
  }

  return @"SATVLoginStateMachineStateiCloudAuthentication";
}

CFStringRef sub_1000587D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_5;
  }
  if (!sub_100049F7C())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
LABEL_5:
    id v3 = @"SATVLoginStateMachineStateLoginComplete";
    goto LABEL_6;
  }

  [WeakRetained _showPasswordSettingPrompt];
  id v3 = @"SATVLoginStateMachineStateiTunesPromptingForPasswordSetting";
LABEL_6:

  return v3;
}

CFStringRef sub_10005883C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _loginCompleteWithResult:3];
  }

  return @"SATVLoginStateMachineStateLoginComplete";
}

CFStringRef sub_10005887C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setITunesUsername:0];
    [v2 _loginCompleteWithResult:2];
  }

  return @"SATVLoginStateMachineStateLoginComplete";
}

CFStringRef sub_1000588C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v3 = [WeakRetained didLoginOrSkipFromAppleID];
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    id v5 = v4;
    if (v3)
    {
      [v4 logOutAccountType:0];

      [v2 _hideActivityIndicator];
      [v2 _showAppleIDUsernameScreen];
      [v2 setDidLoginOrSkipFromAppleID:0];
      BOOL v6 = @"SATVLoginStateMachineStateAppleIDPass";
    }

    else
    {
      [v4 logOutAccountType:1];

      [v2 _hideActivityIndicator];
      [v2 _showiTunesUsernameScreen];
      BOOL v6 = @"SATVLoginStateMachineStateiTunesAuthentication";
    }
  }

  else
  {
    BOOL v6 = 0LL;
  }

  return v6;
}

CFStringRef sub_100058984(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    unsigned __int8 v3 = [v2 iTunesAndiCloudAccountsMatch];

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SATVAuthenticationManager sharedInstance]( &OBJC_CLASS___SATVAuthenticationManager,  "sharedInstance"));
    id v5 = v4;
    if ((v3 & 1) == 0)
    {
      [v4 logOutAccountType:1];

      [WeakRetained _hideActivityIndicator];
      [WeakRetained _showiTunesUsernameScreen];
      BOOL v6 = @"SATVLoginStateMachineStateiTunesAuthentication";
      goto LABEL_6;
    }

    [v4 logOutAccountType:0];
  }

  BOOL v6 = @"SATVLoginStateMachineStateAppleIDPass";
LABEL_6:

  return v6;
}

void sub_100058F44(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  [v2 setAlpha:0.0];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityIndicatorViewController]);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 setAlpha:1.0];
}

void sub_100059068(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  [v2 setAlpha:1.0];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityIndicatorViewController]);
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 setAlpha:0.0];
}

void sub_100059138(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  [v1 setAlpha:0.0];
}

id sub_100059220(uint64_t a1)
{
  id v2 = sub_10000D7CC(@"AUTH_APPLE_ID_TITLE", @"Localizable");
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  id v6 = sub_10000D7CC(@"AUTH_APPLE_ID_SUBTITLE", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
  [v9 setText:v7];

  [*(id *)(a1 + 32) _clearTextFields];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appleIDUsername]);
  [v10 setUsernameText:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 skipButton]);
  [v13 setHidden:0];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 useSeparateIDsButton]);
  [v15 setHidden:0];

  return [*(id *)(a1 + 32) _reloadForStateChange];
}

void sub_100059484( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000594A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained loginStateMachine]);
    [v2 postEvent:@"SATVLoginStateMachineEventPasswordSettingPromptSelected"];

    id WeakRetained = v3;
  }
}

id sub_100059544(uint64_t a1)
{
  id v2 = sub_10000D7CC(@"AUTH_ITUNES_ID_TITLE", @"Localizable");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  id v6 = sub_10000D7CC(@"AUTH_ITUNES_ID_SUBTITLE", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
  [v9 setText:v7];

  [*(id *)(a1 + 32) _clearTextFields];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iTunesUsername]);
  [v10 setUsernameText:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 skipButton]);
  [v13 setHidden:0];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 useSeparateIDsButton]);
  [v15 setHidden:1];

  return [*(id *)(a1 + 32) _reloadForStateChange];
}

id sub_1000596F0(uint64_t a1)
{
  id v2 = sub_10000D7CC(@"AUTH_ICLOUD_ID_TITLE", @"Localizable");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  id v6 = sub_10000D7CC(@"AUTH_ICLOUD_ID_SUBTITLE", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
  [v9 setText:v7];

  [*(id *)(a1 + 32) _clearTextFields];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) iCloudUsername]);
  [v10 setUsernameText:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 skipButton]);
  [v13 setHidden:0];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 useSeparateIDsButton]);
  [v15 setHidden:1];

  return [*(id *)(a1 + 32) _reloadForStateChange];
}

void sub_1000598F8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  [v1 setAlpha:0.0];
}

id sub_10005992C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000599A8;
  v3[3] = &unk_1000C9468;
  void v3[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.3);
}

void sub_1000599A8(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) authenticationView]);
  [v1 setAlpha:1.0];
}

void sub_100059AE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100059B0C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _postAuthenticationResults:a2 forEmailAddress:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

void sub_100059C60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100059C84(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _postAuthenticationResults:a2 forEmailAddress:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

void sub_100059DD8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100059DFC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _postAuthenticationResults:a2 forEmailAddress:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

void sub_10005A9F8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SATViCloudServicesManager);
  id v2 = (void *)qword_1001099D0;
  qword_1001099D0 = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATViCloudServicesManager");
  id v4 = (void *)qword_1001099E0;
  qword_1001099E0 = (uint64_t)v3;
}

void sub_10005AE98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10005AED4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005AFA0;
  block[3] = &unk_1000C9A70;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = WeakRetained;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_10005AFA0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _zoneNameWithiCloudCredentials]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _desiredZoneIDWithName:v3 fromMapping:*(void *)(a1 + 40)]);

  if (!v4) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _desiredZoneIDWithName:@"OneHomeScreen_V2" fromMapping:*(void *)(a1 + 40)]);
  }
  if (*(void *)(a1 + 48)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0LL;
  }
  uint64_t v6 = !v5;
  id v7 = (void *)qword_1001099E0;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      id v9 = v7;
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
      int v16 = 138412290;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully fetched zone with name %@",  (uint8_t *)&v16,  0xCu);
    }

    [*(id *)(a1 + 32) setOperationError:0];
    id v11 = *(void **)(a1 + 32);
    id v12 = v4;
  }

  else
  {
    if (v8)
    {
      uint64_t v13 = *(void *)(a1 + 48);
      int v16 = 138412546;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Fetching zone information from CloudKit failed. {desiredZoneID=%@, error=%@}",  (uint8_t *)&v16,  0x16u);
    }

    [*(id *)(a1 + 32) setOperationError:*(void *)(a1 + 48)];
    id v11 = *(void **)(a1 + 32);
    id v12 = 0LL;
  }

  [v11 setCloudKitZoneIDForUser:v12];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchRequestCompletionHandler]);

  if (v14)
  {
    int v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchRequestCompletionHandler]);
    v15[2](v15, v6);

    [*(id *)(a1 + 32) setFetchRequestCompletionHandler:0];
  }
}

void sub_10005B544(uint64_t a1)
{
  id v2 = (os_log_s *)qword_1001099E0;
  if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Timeout request timer fired. Check if we are still in the process of fetching information from CloudKit..",  v13,  2u);
  }

  if ([*(id *)(a1 + 32) isFetchOperationInFlight])
  {
    os_log_t v3 = (os_log_s *)qword_1001099E0;
    if (os_log_type_enabled((os_log_t)qword_1001099E0, OS_LOG_TYPE_FAULT)) {
      sub_1000788FC(v3);
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) ckOperationsQueue]);
    [v4 cancelAllOperations];

    [*(id *)(a1 + 32) setIsFetchOperationInFlight:0];
    [*(id *)(a1 + 32) setCloudKitZoneIDForUser:0];
    v14[0] = NSLocalizedDescriptionKey;
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"Operation was unsuccessful." value:&stru_1000CB560 table:0]);
    v15[0] = v6;
    v14[1] = NSLocalizedFailureReasonErrorKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"Request timed out." value:&stru_1000CB560 table:0]);
    v15[1] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CloudKit Domain",  101LL,  v9));
    [*(id *)(a1 + 32) setOperationError:v10];
    id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchRequestCompletionHandler]);

    if (v11)
    {
      id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fetchRequestCompletionHandler]);
      v12[2](v12, 0LL);

      [*(id *)(a1 + 32) setFetchRequestCompletionHandler:0];
    }

    [*(id *)(a1 + 32) _cancelRequestTimeoutTimer];
  }

void sub_10005C06C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10005C08C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animate];
}

id sub_10005C338(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:1.0];
}

id sub_10005C4C8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:1.0];
}

id sub_10005C4E0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setAlpha:0.0];
}

void sub_10005C528(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  os_log_t v3 = *(void **)(a1 + 32);
  if (v3[7]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = WeakRetained == 0LL;
  }
  id v5 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "helloAnimatingHeaderViewControllerDidCompleteLanguagesCycle:");
    os_log_t v3 = *(void **)(a1 + 32);
  }

  [v3 _animateNextLanguage];
}

void sub_10005CC9C(_Unwind_Exception *a1)
{
}

void sub_10005CCCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10005CD18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConsent];
}

id sub_10005E0C0()
{
  if (qword_1001099F8 != -1) {
    dispatch_once(&qword_1001099F8, &stru_1000CADA8);
  }
  return (id)qword_1001099F0;
}

void sub_10005E310(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10005E0C0();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "User profile deleted. {identifier=%{public}@}",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100078B68(a1, (uint64_t)v5, v8);
  }

  if (*(void *)(a1 + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005E44C;
    block[3] = &unk_1000C9A00;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(&_dispatch_main_q, block);
  }
}

uint64_t sub_10005E44C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10005E458(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVUserProfileUtilities");
  id v2 = (void *)qword_1001099F0;
  qword_1001099F0 = (uint64_t)v1;
}

id sub_10005F04C(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector(a2, "stableIdentifier") & 1) != 0) {
    return [a2 stableIdentifier];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[stepClass respondsToSelector:@selector(stableIdentifier)]"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079360(a1);
  }
  id result = (id) _bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

id sub_10005F1F4(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector(a2, "stableIdentifier") & 1) != 0) {
    return [a2 stableIdentifier];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[stepClass respondsToSelector:@selector(stableIdentifier)]"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079424(a1);
  }
  id result = (id) _bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

uint64_t sub_10005F4F8(uint64_t a1, uint64_t a2)
{
  return objc_opt_class(*(void *)(v2 + 32), a2);
}

void sub_100060A7C(_Unwind_Exception *a1)
{
}

void sub_100060AAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_100060AF8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRegionSelection:v3];
}

LABEL_19:
      if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
      {
        int v15 = (os_log_s *)qword_100109A00;
        if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v23 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Explicitly adding English because no Latin script languages are enabled",  v23,  2u);
        }

        [v2 addPreferredLanguage:@"en" withVariants:0];
      }
    }

    int v16 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Applying preferred languages changes",  v23,  2u);
    }

    [v2 applyPreferredLanguagesChanges];

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    uint64_t v13 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Multilingual feature is disabled.",  (uint8_t *)&buf,  2u);
    }
  }

  -[RUIPage setLoading:](self->_loadingPage, "setLoading:", 0LL);
  loadingPage = self->_loadingPage;
  self->_loadingPage = 0LL;
}

void sub_1000610D4(_Unwind_Exception *a1)
{
}

void sub_100061104(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  if ([v6 hasSuffix:@"Wubihua"])
  {
    id v7 = (os_log_s *)qword_100109A00;
    if (os_log_type_enabled((os_log_t)qword_100109A00, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "English will not be explicitly added because %{public}@ input mode is enabled",  (uint8_t *)&v8,  0xCu);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_100061398( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_1000613BC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id, BOOL))v5 + 2))(v5, a2 == 0);
    BOOL v4 = v5;
  }
}

uint64_t sub_10006141C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10006149C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___SATVSiriSettings);
  uint64_t v2 = (void *)qword_100109A08;
  qword_100109A08 = (uint64_t)v1;
}

id sub_10006173C()
{
  if (qword_100109A20 != -1) {
    dispatch_once(&qword_100109A20, &stru_1000CAE60);
  }
  return (id)qword_100109A18;
}

void sub_100061DA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVSiriSettings");
  uint64_t v2 = (void *)qword_100109A18;
  qword_100109A18 = (uint64_t)v1;
}

LABEL_41:
  return v9;
}

void sub_100062CBC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100062CDC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleLanguageSelection:v3];
}

void sub_100063CF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_100063D20(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _cellForRowAtIndexPath:v7 itemIdentifier:v6]);

  return v9;
}

NSString *__cdecl sub_1000641A0(id a1, SATVAirplay2DataSourceObject *a2)
{
  uint64_t v2 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2DataSourceObject uniqueIdentifier](v2, "uniqueIdentifier"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVAirplay2DataSourceObject name](v2, "name"));

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v4));
  return (NSString *)v5;
}

LABEL_26:
  __int16 v35 = objc_opt_respondsToSelector(v43, "auxiliaryButtonTextForChoiceView:");
  double v36 = objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
  [(id)v36 setHidden:(v35 & 1) == 0];

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
  LOBYTE(v36) = [v37 isHidden];

  if ((v36 & 1) == 0)
  {
    v38 = objc_claimAutoreleasedReturnValue([v43 auxiliaryButtonTextForChoiceView:self]);
    if (v38)
    {
      v39 = (void *)v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
      v41 = objc_opt_class(&OBJC_CLASS___UIButton);
      if ((objc_opt_isKindOfClass(v40, v41) & 1) == 0) {
        sub_1000794E8();
      }
      [v40 setTitle:v39 forState:0];

      goto LABEL_34;
    }
  }

  if ((objc_opt_respondsToSelector(v43, "auxiliaryButtonViewForChoiceView:") & 1) != 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue([v43 auxiliaryButtonViewForChoiceView:self]);
    v39 = v42;
    if (v42)
    {
      [v42 setHidden:0];
      -[SATVChoiceView addSubview:](self, "addSubview:", v39);
      -[SATVChoiceView setAuxiliaryButton:](self, "setAuxiliaryButton:", v39);
    }

    else
    {
      -[UIView setHidden:](self->_auxiliaryButton, "setHidden:", 1LL);
    }

  id v31 = objc_alloc_init(&OBJC_CLASS___TVSKStepExecutionRecord);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepExecutionRecordByIdentifier](self, "stepExecutionRecordByIdentifier"));
  [v32 setObject:v31 forKey:v12];

  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v11 executeStepForContext:v6]);
  v34 = (os_log_s *)qword_100109A38;
  __int16 v35 = os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v49 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Step has finished executing immediately. %{public}@",  buf,  0xCu);
    }

    double v36 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager metricsController](self, "metricsController"));
    [v36 appendMetricsForCompletedStep:v11 stepResult:v33 completedSynchronously:1];

    if (-[SATVFlowManager _handleFlowOptions:](self, "_handleFlowOptions:", [v33 flowOptions]))
    {
      v37 = [v6 isNavigationFlowForward];
      v38 = @"Previous";
      if (v37) {
        v38 = @"Next";
      }
      v39 = v38;
      v40 = [v6 isNavigationFlowForward] ^ 1;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stateMachine](self, "stateMachine"));
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10006E658;
      v45[3] = &unk_1000CB0C8;
      v45[4] = self;
      v46 = v39;
      v47 = v40;
      v42 = v39;
      [v41 executeBlockAfterCurrentStateTransition:v45];
    }
  }

  else
  {
    if (v35)
    {
      *(_DWORD *)buf = 138543362;
      v49 = a3;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Step is executing. %{public}@", buf, 0xCu);
    }

    if (([v6 isNavigationFlowForward] & 1) == 0)
    {
      v43 = (os_log_s *)qword_100109A38;
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Navigation flow is backwards so will pop the nav stack to the view controller for this step.",  buf,  2u);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager uiFlowController](self, "uiFlowController"));
      [v44 popToStepViewControllerForStep:v11];

      -[SATVFlowManager _updateFlowStepsTillStep:](self, "_updateFlowStepsTillStep:", a3);
    }
  }
}

LABEL_34:
  }

  -[SATVChoiceView setNeedsLayout](self, "setNeedsLayout");
}

void sub_1000668F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100066914(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleExpressSetupConsent:itemTypes:", a2, objc_msgSend(*(id *)(a1 + 32), "itemTypes"));
}

CFStringRef sub_100066B48(uint64_t a1)
{
  else {
    return off_1000CAEA0[a1 - 1];
  }
}

id sub_1000678FC(uint64_t a1)
{
  return [*(id *)(a1 + 40) _updateBackdropViewAfterSettingPreviewViewIfNessecary];
}

id sub_100067B4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_100067B58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  double v3 = *(double *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100067BF8;
  v4[3] = &unk_1000C9468;
  id v5 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v4, v3);
}

id sub_100067BF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_100067F44(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:*(double *)(a1 + 40)];
}

void sub_1000682D4(_Unwind_Exception *a1)
{
}

void sub_1000682F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBackdropViewAfterSettingPreviewViewIfNessecary];
}

LABEL_13:
  }

LABEL_36:
    uint64_t v25 = 0LL;
    goto LABEL_37;
  }

  uint64_t v19 = (os_log_s *)qword_100109A30;
  if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We are moving forwards and this is an update flow...",  (uint8_t *)v34,  2u);
  }

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[SATVSiriSettings sharedInstance](&OBJC_CLASS___SATVSiriSettings, "sharedInstance"));
  int v21 = [v20 offeredDataSharing];

  if (!v21) {
    goto LABEL_36;
  }
  __int16 v22 = (os_log_s *)qword_100109A30;
  if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v34[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "We have previously offered to enable Siri data sharing. Will skip",  (uint8_t *)v34,  2u);
  }

  id v23 = objc_claimAutoreleasedReturnValue(+[TVSKConsentStepResult successResult](&OBJC_CLASS___TVSKConsentStepResult, "successResult"));
LABEL_35:
  uint64_t v25 = v23;
LABEL_37:
  if (!(v25 | v17))
  {
    uint64_t v32 = (os_log_s *)qword_100109A30;
    if (os_log_type_enabled((os_log_t)qword_100109A30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Will create and show a view controller for this step.",  (uint8_t *)v34,  2u);
    }

    -[SATVSiriDiagnosticsStep _showSiriDiagnosticsViewController:]( self,  "_showSiriDiagnosticsViewController:",  [v18 isUpdate]);
  }

LABEL_42:
  return (id)v25;
}

void sub_100069414(_Unwind_Exception *a1)
{
}

void sub_100069444(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v3 = WeakRetained;
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
      [v2 didCancelStep:v3];

      id WeakRetained = v3;
    }
  }

void sub_1000694A8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completeStepWithSiriDiagnosticsConsent:a2];
}

void sub_100069890(_Unwind_Exception *a1)
{
}

void sub_1000698BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);

  if (v1)
  {
    uint64_t v2 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);
    v2[2]();
  }
}

void sub_10006991C(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000699BC;
  block[3] = &unk_1000CAF58;
  void block[4] = WeakRetained;
  v6[1] = a2;
  objc_copyWeak(v6, v3);
  dispatch_async(&_dispatch_main_q, block);
  objc_destroyWeak(v6);
}

void sub_1000699BC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 == 2)
    {
      uint64_t v4 = 1LL;
      uint64_t v5 = 1LL;
      goto LABEL_6;
    }

    if (!v3)
    {
      uint64_t v4 = 0LL;
      uint64_t v5 = 0LL;
LABEL_6:
      [v2 _callCompletionHandlerWithSuccess:v4 shouldFinishSetup:v5];
      return;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100069AA8;
    v7[3] = &unk_1000CAC18;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    [v6 retrieveCloudConfigurationDetailsCompletionBlock:v7];
    objc_destroyWeak(&v8);
  }

void sub_100069A94(_Unwind_Exception *a1)
{
}

void sub_100069AA8(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069B4C;
  v4[3] = &unk_1000CAF30;
  id v5 = a2;
  id v3 = v5;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(&_dispatch_main_q, v4);
  objc_destroyWeak(&v6);
}

void sub_100069B4C(uint64_t a1)
{
  BOOL v1 = *(void *)(a1 + 32) == 0LL;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _callCompletionHandlerWithSuccess:v1 shouldFinishSetup:0];
}

id sub_10006A6F4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 8LL) = 1;
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void *sub_10006A718(void *result, int a2)
{
  uint64_t v2 = result;
  if (a2)
  {
    id v3 = (void *)result[4];
    [v3 highlightProgress];
    objc_msgSend(v3, "primaryHighlightAlphaForHighlightProgress:");
    id result = objc_msgSend(v3, "setAlpha:");
  }

  *(_BYTE *)(v2[4] + 8LL) = 0;
  return result;
}

void sub_10006BF40(_Unwind_Exception *a1)
{
}

void sub_10006BF6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue([WeakRetained menuHandler]);

  uint64_t v2 = v3;
  if (v3)
  {
    (*((void (**)(id))v3 + 2))(v3);
    uint64_t v2 = v3;
  }
}

void sub_10006BFC0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

  uint64_t v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, a2);
    uint64_t v4 = v5;
  }
}

id sub_10006C3DC(uint64_t a1)
{
  uint64_t v2 = -[SATVLogBuilder initWithContext:name:]( objc_alloc(&OBJC_CLASS___SATVLogBuilder),  "initWithContext:name:",  @"TVSetup",  @"SATVFlowManager");
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) breadcrumbs]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder jsonForArray:](v2, "jsonForArray:", v3));

  return v4;
}

void sub_10006D134(_Unwind_Exception *a1)
{
  id v7 = v1;
  objc_destroyWeak(v7);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v6 - 136));
  _Unwind_Resume(a1);
}

void sub_10006D1B4( id a1, TVSStateMachine *a2, NSString *a3, NSString *a4, NSString *a5, id a6, NSDictionary *a7)
{
  uint64_t v13 = a2;
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  if (-[NSString isEqualToString:](v10, "isEqualToString:", @"Next")
    || -[NSString isEqualToString:](v10, "isEqualToString:", @"Start")
    || -[NSString isEqualToString:](v10, "isEqualToString:", @"Previous"))
  {
    -[TVSStateMachine postEvent:withContext:userInfo:]( v13,  "postEvent:withContext:userInfo:",  @"Active",  v11,  v12);
  }
}

id sub_10006D26C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained setupSession]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userInputConfiguration]);

    if ([v7 supportsRemote]
      && [v7 forceRemoteProximityPairing])
    {
      id v8 = (os_log_s *)qword_100109A38;
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Forcing proximity pairing....", v12, 2u);
      }

      notify_post("com.apple.PineBoard.DidReceivePeripheralPairingRequest");
    }

    id v9 = NSStringFromClass(*(Class *)(a1 + 40));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  return v10;
}

id sub_10006D370(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _nextState]);
    if ([v6 length])
    {
      id v7 = v6;
    }

    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10006D454;
      v10[3] = &unk_1000C9468;
      id v8 = v3;
      id v11 = v8;
      [v8 executeBlockAfterCurrentStateTransition:v10];
      id v7 = (id)objc_claimAutoreleasedReturnValue([v8 currentState]);
    }
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v3 currentState]);
  }

  return v7;
}

id sub_10006D454(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Finishing buddy flow because we don't have any more steps to go forward...",  v4,  2u);
  }

  return [*(id *)(a1 + 32) postEvent:@"Finish"];
}

id sub_10006D4C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _previousState]);

  if ([v5 length])
  {
    id v6 = v5;
  }

  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10006D594;
    v9[3] = &unk_1000C9468;
    id v7 = v3;
    id v10 = v7;
    [v7 executeBlockAfterCurrentStateTransition:v9];
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v6;
}

id sub_10006D594(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Finishing buddy flow because we don't have any more steps to go backward...",  v4,  2u);
  }

  return [*(id *)(a1 + 32) postEvent:@"Finish"];
}

__CFString *sub_10006D608(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v15 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _commitStepExecutionRecordsToDefaults];
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 metricsController]);
    [v16 reportMetrics];

    id v17 = -[SATVLogBuilder initWithContext:name:]( objc_alloc(&OBJC_CLASS___SATVLogBuilder),  "initWithContext:name:",  @"TVSetup",  @"SATVFlowManager");
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder logger](v17, "logger"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) breadcrumbs]);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLogBuilder jsonForArray:](v17, "jsonForArray:", v19));
      *(_DWORD *)buf = 138412290;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v21 setupAssistantDidFinish];

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    [v22 endReturnToService];

    [v9 deregisterHandlers];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10006D8BC;
    v27[3] = &unk_1000C93A0;
    objc_copyWeak(&v28, v13);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10006D914;
    v25[3] = &unk_1000C93C8;
    objc_copyWeak(&v26, v13);
    +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v27,  v25,  0.2);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);

    id v23 = @"SATVFlowDefaultState";
  }

  else
  {
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 currentState]);
  }

  return v23;
}

void sub_10006D898(_Unwind_Exception *a1)
{
}

void sub_10006D8BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 view]);
  [v2 setAlpha:0.0];
}

void sub_10006D914(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue([WeakRetained completionHandler]);

  uint64_t v2 = v3;
  if (v3)
  {
    (*((void (**)(id))v3 + 2))(v3);
    uint64_t v2 = v3;
  }
}

id sub_10006D968(id a1, Class a2)
{
  return NSStringFromClass(a2);
}

id sub_10006D970(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = a2;
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 currentState]);
  id v10 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    int v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Current step is %{public}@",  (uint8_t *)&v14,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processAndHandleCurrentStepForClass:NSClassFromString(v9) withUserInfo:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);
  return v12;
}

void sub_10006DC20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10006DC48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained setupSession]);
    [v6 setTapToSetupDeviceInfo:v3];
    [v5 _saveTapToSetupDeviceInfo:v3];
    id v7 = (os_log_s *)qword_100109A38;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Tap-to-setup has been enabled. The express setup step will check if we have enough data for express setup.",  buf,  2u);
      }

      uint64_t v9 = 0LL;
    }

    else
    {
      if (v8)
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Tap-to-setup has been declined. Express setup step will be skipped.",  v11,  2u);
      }

      uint64_t v9 = 1LL;
    }

    [v6 setExpressTapToSetupState:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 activeStep]);
    [v10 didPerformTapToSetupWithDeviceInfo:v3];
  }
}

void sub_10006E658(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stateMachine]);
  id v6 = @"SATVNavigationFlowKey";
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  *(void *)(a1 + 48)));
  id v7 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  [v2 postEvent:v3 withContext:0 userInfo:v5];
}

void sub_10006EFE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 serializableRepresentation]);
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v5];
  }

  else if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR))
  {
    sub_100079888();
  }
}

void sub_10006F4FC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_10006F538(uint64_t a1, void *a2)
{
  return a2;
}

LABEL_25:
        id v12 = 0LL;
LABEL_26:

        goto LABEL_27;
      }

      if (v13)
      {
        [v13 reset];
        -[SATVLoginStep _notifyTriggerStatusChangeAndReset:](self, "_notifyTriggerStatusChangeAndReset:", 1LL);
        goto LABEL_25;
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
    goto LABEL_26;
  }

  id v7 = (os_log_s *)qword_100109A40;
  if (os_log_type_enabled((os_log_t)qword_100109A40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Tap-to-setup is enabled. Nothing to do on this step.",  buf,  2u);
  }

  BOOL v8 = objc_claimAutoreleasedReturnValue(+[TVSKBasicStepResult successResult](&OBJC_CLASS___TVSKBasicStepResult, "successResult"));
LABEL_9:
  id v12 = (void *)v8;
LABEL_27:

  return v12;
}

void sub_10006F9A8(_Unwind_Exception *a1)
{
}

void sub_10006F9D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stepDelegate]);
    [v2 didCancelStep:v3];

    id WeakRetained = v3;
  }
}

void sub_10006FA24(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLoginWithResult:a2];
}

id sub_100070000(uint64_t a1, void *a2)
{
  return [a2 _activationStateChanged];
}

void sub_100070474( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
}

CFStringRef sub_10007051C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"ERROR"]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"REASON"]);
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"REASON"]);
    uint64_t v10 = (uint64_t)[v9 integerValue];
  }

  else
  {
    uint64_t v10 = 8LL;
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleActivationFailureWithError:v7 reason:v10];

  return @"Activation Failed";
}

CFStringRef sub_1000705DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([(id)objc_opt_class(WeakRetained) isDeviceActivated])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    uint8_t v12[2] = sub_100070734;
    v12[3] = &unk_1000C9468;
    id v13 = v3;
    [v3 executeBlockAfterCurrentStateTransition:v12];

    id v5 = @"Activating";
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
    char v7 = objc_opt_respondsToSelector(v6, "activatorDidBeginSettingTime:");

    if ((v7 & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100070744;
      block[3] = &unk_1000C9468;
      void block[4] = WeakRetained;
      dispatch_async(&_dispatch_main_q, block);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100070784;
    v9[3] = &unk_1000C9BA0;
    void v9[4] = WeakRetained;
    id v10 = v3;
    [v3 executeBlockAfterCurrentStateTransition:v9];

    id v5 = @"Setting System Time";
  }

  return v5;
}

id sub_100070734(uint64_t a1)
{
  return [*(id *)(a1 + 32) postEvent:@"Succeeded"];
}

void sub_100070744(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 activatorDidBeginSettingTime:*(void *)(a1 + 32)];
}

void sub_100070784(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000707F0;
  v2[3] = &unk_1000CB138;
  BOOL v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _setTimeWithCompletion:v2];
}

void sub_1000707F0(uint64_t a1, int a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = a3;
    [v3 postEvent:@"Succeeded"];
  }

  else
  {
    id v6 = @"ERROR";
    char v7 = a3;
    id v5 = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
    [v3 postEvent:@"Failed" withContext:0 userInfo:v4];
  }
}

CFStringRef sub_1000708C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
  char v6 = objc_opt_respondsToSelector(v5, "activatorDidBeginActivation:");

  if ((v6 & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000709A4;
    block[3] = &unk_1000C9468;
    void block[4] = WeakRetained;
    dispatch_async(&_dispatch_main_q, block);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000709E4;
  v8[3] = &unk_1000C9468;
  void v8[4] = WeakRetained;
  [v3 executeBlockAfterCurrentStateTransition:v8];

  return @"Activating";
}

void sub_1000709A4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 activatorDidBeginActivation:*(void *)(a1 + 32)];
}

id sub_1000709E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startActivation];
}

__CFString *sub_1000709EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[4] setLoading:0];
  id v10 = WeakRetained[4];
  WeakRetained[4] = 0LL;

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  if (v11)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"RESPONSE"]);
    id v13 = *(void **)(*(void *)(a1 + 32) + 16LL);
    if (!v13)
    {
      int v14 = objc_alloc_init(&OBJC_CLASS___RemoteUIController);
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(v15 + 16);
      *(void *)(v15 + 16) = v14;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
      id v17 = *(void **)(*(void *)(a1 + 32) + 16LL);
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[RUIStyle frontRowStyle](&OBJC_CLASS___RUIStyle, "frontRowStyle"));
      [v17 setStyle:v18];

      uint64_t v19 = *(void **)(a1 + 32);
      __int16 v20 = (void *)v19[2];
      int v21 = (void *)objc_claimAutoreleasedReturnValue([v19 navigationController]);
      [v20 setNavigationController:v21];

      id v13 = *(void **)(*(void *)(a1 + 32) + 16LL);
    }

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained[1] sessionConfiguration]);
    [v13 setSessionConfiguration:v22];

    id v23 = *(void **)(*(void *)(a1 + 32) + 16LL);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v12 data]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v12 baseURL]);
    [v23 loadData:v24 baseURL:v25];

    id v26 = @"Showing Remote UI";
  }

  else
  {
    id v27 = sub_10002555C();
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v30 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Cannot display remote UI because no navigation controller was set",  v30,  2u);
    }

    [v7 postEvent:@"Failed"];
    id v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 currentState]);
  }

  return v26;
}

CFStringRef sub_100070C00(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"RESPONSE"]);
  if (!v13) {
    sub_1000799A8();
  }
  int v14 = (void *)v13;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100070D1C;
  v17[3] = &unk_1000C9640;
  objc_copyWeak(&v19, (id *)(a1 + 32));
  id v15 = v14;
  id v18 = v15;
  [v9 executeBlockAfterCurrentStateTransition:v17];

  objc_destroyWeak(&v19);
  return @"Activating";
}

void sub_100070D08(_Unwind_Exception *a1)
{
}

void sub_100070D1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _activateDeviceWithResponse:*(void *)(a1 + 32)];
}

CFStringRef sub_100070D58(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_100070E38;
  v14[3] = &unk_1000C93A0;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  [v9 executeBlockAfterCurrentStateTransition:v14];
  objc_destroyWeak(&v15);

  return @"Loading Cloud Config";
}

void sub_100070E24(_Unwind_Exception *a1)
{
}

void sub_100070E38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadCloudConfig];
}

CFStringRef sub_100070E64(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  void v14[2] = sub_100070F44;
  v14[3] = &unk_1000C93A0;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  [v9 executeBlockAfterCurrentStateTransition:v14];
  objc_destroyWeak(&v15);

  return @"Activated";
}

void sub_100070F30(_Unwind_Exception *a1)
{
}

void sub_100070F44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _activationSucceeded];
}

uint64_t sub_1000711D8(uint64_t a1, uint64_t a2)
{
  id v4 = sub_10002555C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = a2
       ? (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed (%@)",  a2))
       : @"succeeded";
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Set Time %@", buf, 0xCu);
    if (a2) {
  }
    }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

void sub_1000717D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_1000717FC(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([&off_1000D11D0 count])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v6 allHTTPHeaderFields]);
    id v4 = [v3 mutableCopy];

    [v4 addEntriesFromDictionary:&off_1000D11D0];
    [v6 setAllHTTPHeaderFields:v4];
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void sub_100071894(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = sub_10002555C();
  int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v19 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: try activate completeion",  v19,  2u);
  }

  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained stateMachine]);
    __int16 v20 = @"ERROR";
    id v21 = v12;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    [v17 postEvent:@"Failed" withContext:0 userInfo:v18];

LABEL_7:
    goto LABEL_8;
  }

  if (v9)
  {
    id WeakRetained = (id)objc_opt_new(&OBJC_CLASS___SATVActivationResponse, v15);
    [WeakRetained setData:v9];
    [WeakRetained setHeaders:v10];
    [WeakRetained setBaseURL:v11];
    [*(id *)(a1 + 32) _handleActivationResponse:WeakRetained];
    goto LABEL_7;
  }

void sub_100071C80(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v15 = a2;
  id v9 = a3;
  id v10 = a4;
  id v12 = a5;
  if (v12)
  {
    [*(id *)(a1 + 32) _handleActivationFailureWithError:v12 reason:4];
  }

  else if (v15)
  {
    id v13 = (void *)objc_opt_new(&OBJC_CLASS___SATVActivationResponse, v11);
    [v13 setData:v15];
    [v13 setHeaders:v9];
    [v13 setBaseURL:v10];
    [*(id *)(a1 + 32) _handleActivationResponse:v13];
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, id, id, id))(v14 + 16))(v14, v15, v9, v10, v12);
  }
}

void sub_1000726E4(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 activator:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
}

void sub_100072A04(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  objc_msgSend( v2,  "activator:didSucceedWithType:",  *(void *)(a1 + 32),  objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "_successTypeForActivationState:", *(void *)(a1 + 40)));
}

void sub_100072C20(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 activator:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
}

id sub_100072F4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkActivationFailIfBricked:0];
}

void sub_100073128(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    id v4 = @"Failed";
  }
  else {
    id v4 = @"Succeeded";
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000731D0;
  block[3] = &unk_1000C9A70;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v5;
  uint64_t v11 = v4;
  id v6 = v3;
  id v7 = v4;
  dispatch_async(&_dispatch_main_q, block);
}

void sub_1000731D0(void *a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (a1[4])
  {
    [v2 setObject:&off_1000D0E20 forKey:@"REASON"];
    [v2 setObject:a1[4] forKey:@"ERROR"];
  }

  [*(id *)(a1[5] + 64) postEvent:a1[6] withContext:0 userInfo:v2];
}

id sub_10007406C(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector(a2, "stableIdentifier") & 1) != 0) {
    return [a2 stableIdentifier];
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[providerClass respondsToSelector:@selector(stableIdentifier)]"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100079A70(a1, (uint64_t)v5);
  }
  id result = (id) _bs_set_crash_log_message([v5 UTF8String]);
  __break(0);
  return result;
}

void sub_1000749C4(_Unwind_Exception *a1)
{
}

void sub_100074A1C()
{
}

CFStringRef sub_100074A24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
    id v4 = [v3 popViewControllerAnimated:1];
  }

  return @"SATVCloudLoginStateUsername";
}

CFStringRef sub_100074A7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _textFieldText]);
    [v2 setUsername:v3];

    [v2 _showPasswordScreen];
  }

  return @"SATVCloudLoginStatePassword";
}

CFStringRef sub_100074AD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _textFieldText]);
    [v2 setPassword:v3];

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 username]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v2 password]);
    [v2 _authenticateWithUsername:v4 password:v5];
  }

  return @"SATVCloudLoginStateAttemptingLogin";
}

CFStringRef sub_100074B6C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _showUsernameScreen];
  }

  return @"SATVCloudLoginStateUsername";
}

void sub_100075130(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  [v2 setAlpha:0.0];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityIndicatorViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 setAlpha:1.0];
}

void sub_100075248(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  [v2 setAlpha:1.0];

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) activityIndicatorViewController]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  [v3 setAlpha:0.0];
}

void sub_100075318(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  [v1 setAlpha:0.0];
}

id sub_100075574(uint64_t a1)
{
  id v2 = sub_10000D7CC(@"CLOUD_CONFIG_LOGIN_TITLE", @"Localizable");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) customPrompt]);
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 customPrompt]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subtitleLabel]);
    [v10 setText:v8];
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 organizationName]);
    id v12 = [v11 length];

    if (!v12)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
      [v9 setText:&stru_1000CB560];
      goto LABEL_6;
    }

    id v13 = sub_10000D7CC(@"CLOUD_CONFIG_LOGIN_PROMPT_%@", @"Localizable");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) organizationName]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 subtitleLabel]);
    [v15 setText:v10];
  }

LABEL_6:
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 textField]);
  [v17 setSecureTextEntry:0];

  id v18 = *(void **)(a1 + 32);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 username]);
  [v18 _setTextFieldText:v19];

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 textField]);
  [v21 setKeyboardType:7];

  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 skipButton]);
  [v23 setHidden:1];

  __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 useSeparateIDsButton]);
  [v25 setHidden:1];

  [*(id *)(a1 + 32) _setUsernamePlaceholder];
  return [*(id *)(a1 + 32) _reloadForStateChange];
}

id sub_100075840(uint64_t a1)
{
  id v2 = sub_10000D7CC(@"CLOUD_CONFIG_PASSWORD_TITLE", @"Localizable");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  id v6 = sub_10000D7CC(@"CLOUD_CONFIG_PASSWORD_PROMPT_%@", @"Localizable");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) username]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 subtitleLabel]);
  [v11 setText:v9];

  id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 textField]);
  [v13 setSecureTextEntry:1];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 textField]);
  [v15 setKeyboardType:0];

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 skipButton]);
  [v17 setHidden:1];

  id v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 useSeparateIDsButton]);
  [v19 setHidden:1];

  [*(id *)(a1 + 32) _setPasswordPlaceholder];
  [*(id *)(a1 + 32) _reloadForStateChange];
  return [*(id *)(a1 + 32) _clearTextField];
}

void sub_100075B94(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  [v1 setAlpha:0.0];
}

id sub_100075BC8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100075C44;
  v3[3] = &unk_1000C9468;
  void v3[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:animations:](&OBJC_CLASS___UIView, "animateWithDuration:animations:", v3, 0.3);
}

void sub_100075C44(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) loginView]);
  [v1 setAlpha:1.0];
}

void sub_100075E88(id a1)
{
  os_log_t v1 = os_log_create("com.apple.purplebuddy", "SATVCloudLoginStateMachine");
  id v2 = (void *)qword_100109A50;
  qword_100109A50 = (uint64_t)v1;
}

void sub_100075EB8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = TRStringFromSetupAccountType(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = [a3 code];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a3 localizedDescription]);
  int v10 = 136315906;
  uint64_t v11 = "-[SATVTapToSetupController tapToSetupManager:didFinishAuthenticationForAccount:withResult:error:]";
  __int16 v12 = 2112;
  id v13 = v7;
  __int16 v14 = 2048;
  id v15 = v8;
  __int16 v16 = 2112;
  id v17 = v9;
  _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "%s: accountType: %@, errorCode: %lu, error: %@",  (uint8_t *)&v10,  0x2Au);
}

void sub_100075FB0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Touch remote manager won't start, controller is missing after clean up.",  v1,  2u);
}

void sub_100075FF0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  int v6 = 138412802;
  if (v3) {
    uint64_t v5 = @"enable";
  }
  else {
    uint64_t v5 = @"disable";
  }
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to %@ RMV for %@ with error %{public}@",  (uint8_t *)&v6,  0x20u);
}

void sub_1000760A0()
{
}

void sub_100076100()
{
}

void sub_100076160()
{
}

void sub_1000761C0()
{
}

void sub_100076220()
{
}

void sub_100076280(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Marker not found in string! marker=%{public}@, sourceString=%{public}@",  (uint8_t *)&v3,  0x16u);
  sub_10000D790();
}

void sub_100076300(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to get default authorization for %@. Identifier is not known",  (uint8_t *)&v2,  0xCu);
}

void sub_100076374(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Retrieved an invalid authorization mask value for %@. Value=%@. Will set to value to kCLAuthorizationStatusNotDetermined",  (uint8_t *)&v3,  0x16u);
}

void sub_1000763F8()
{
  __assert_rtn( "-[SATVCyclingFooterView initWithStrings:languageCodes:]",  "SATVCyclingFooterView.m",  40,  "numberOfLanguageCodes == numberOfContentStrings");
}

void sub_100076420()
{
  __assert_rtn( "-[SATVCyclingHeaderView initWithTitleStrings:subtitleStrings:languageCodes:]",  "SATVCyclingHeaderView.m",  44,  "numberOfLanguageCodes == numberOfTitleStrings");
}

void sub_100076448()
{
  __assert_rtn( "-[SATVCyclingHeaderView initWithTitleStrings:subtitleStrings:languageCodes:]",  "SATVCyclingHeaderView.m",  43,  "numberOfTitleStrings == numberOfSubtitleStrings");
}

void sub_100076470()
{
}

void sub_1000764DC()
{
}

void sub_100076548()
{
}

void sub_1000765B4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "No language information at all from iOS Device. Fallback to %{public}@.",  (uint8_t *)&v2,  0xCu);
}

void sub_100076628(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  int v5 = 138543874;
  uint64_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 code];
  __int16 v9 = 2112;
  __int16 v10 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to create primary profile. {errorDomain=%{public}@, errorCode=%ld, error=%@}",  (uint8_t *)&v5,  0x20u);
}

void sub_1000766E8(const char *a1)
{
  int v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  int v5 = (objc_class *)sub_100020108(v3, v4);
  uint64_t v6 = NSStringFromClass(v5);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100076794(const char *a1)
{
  int v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  int v5 = (objc_class *)sub_100020108(v3, v4);
  uint64_t v6 = NSStringFromClass(v5);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100076840(const char *a1)
{
  int v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  int v5 = (objc_class *)sub_100020108(v3, v4);
  uint64_t v6 = NSStringFromClass(v5);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_1000768EC(const char *a1, uint64_t a2, uint64_t a3)
{
  int v5 = NSStringFromSelector(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v8 = (objc_class *)objc_opt_class(a2, v7);
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = 138544642;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  __int16 v14 = v10;
  __int16 v15 = 2048;
  uint64_t v16 = a2;
  __int16 v17 = 2114;
  id v18 = @"SATVPasswordSettingStep.m";
  __int16 v19 = 1024;
  int v20 = 52;
  __int16 v21 = 2114;
  uint64_t v22 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v11,  0x3Au);
}

void sub_1000769E8(const char *a1, uint64_t a2, uint64_t a3)
{
  int v5 = NSStringFromSelector(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v8 = (objc_class *)objc_opt_class(a2, v7);
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = 138544642;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  __int16 v14 = v10;
  __int16 v15 = 2048;
  uint64_t v16 = a2;
  __int16 v17 = 2114;
  id v18 = @"SATVAppleTVFlowDescriptionProvider.m";
  __int16 v19 = 1024;
  int v20 = 92;
  __int16 v21 = 2114;
  uint64_t v22 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v11,  0x3Au);
}

void sub_100076AE4(const char *a1)
{
  int v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  int v5 = (objc_class *)sub_100020108(v3, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100076B90(const char *a1)
{
  int v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  int v5 = (objc_class *)sub_100020108(v3, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100076C3C(const char *a1)
{
  int v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  int v5 = (objc_class *)sub_100020108(v3, v4);
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100076CE8()
{
  __assert_rtn( "-[SATVActivationEngine _newActivationRequestWithOptions:sessionData:error:]",  "SATVActivationEngine.m",  111,  "[NSThread isMainThread] == NO");
}

void sub_100076D10()
{
  __assert_rtn( "-[SATVActivationEngine _newActivationRequestWithOptions:sessionData:error:]",  "SATVActivationEngine.m",  115,  "sessionData != nil");
}

void sub_100076D38()
{
  __assert_rtn( "-[SATVActivationEngine _newActivationRequestWithOptions:sessionData:error:]",  "SATVActivationEngine.m",  119,  "mobileActivationUserAgent != nil");
}

void sub_100076D60(void *a1, uint64_t a2)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([a1 jsonForError:a2]);
  int v5 = 138412290;
  uint64_t v6 = v2;
  sub_100026CC4((void *)&_mh_execute_header, v3, v4, "%@", (uint8_t *)&v5);

  sub_100026CE8();
}

void sub_100076DE4(void *a1)
{
  int v5 = sub_10002AF30();
  if ((v5 & 1) == 0)
  {
    objc_claimAutoreleasedReturnValue([a1 domain]);
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v1,  sub_100026CF4());
    a1 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  int v7 = 138543362;
  uint64_t v8 = a1;
  sub_100026CC4( (void *)&_mh_execute_header,  v3,  v4,  "Buddy Activate: Failed session request: %{public}@",  (uint8_t *)&v7);
  if (!v5)
  {
  }

  sub_100026CD4();
}

void sub_100076EB0(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Buddy Activate: Session request returned HTTP %ld",  (uint8_t *)&v2,  0xCu);
}

void sub_100076F24()
{
}

void sub_100076F4C(void *a1)
{
  int v5 = sub_10002AF30();
  if ((v5 & 1) == 0)
  {
    objc_claimAutoreleasedReturnValue([a1 domain]);
    uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v1,  sub_100026CF4());
    a1 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  int v7 = 138543362;
  uint64_t v8 = a1;
  sub_100026CC4( (void *)&_mh_execute_header,  v3,  v4,  "Buddy Activate: Failed to create sesison URL request: %{public}@",  (uint8_t *)&v7);
  if (!v5)
  {
  }

  sub_100026CD4();
}

void sub_100077018(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unknown step passed to metrics controller. step=%@",  (uint8_t *)&v2,  0xCu);
}

void sub_10007708C()
{
}

void sub_1000770B4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 32);
  int v5 = 134218242;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Authentication failed, unknown account type. {accountType=%ld, username=%@}",  (uint8_t *)&v5,  0x16u);
}

void sub_100077140()
{
  sub_100031964( (void *)&_mh_execute_header,  v0,  v1,  "IDMS->iCloud authentication failed. {iCloudSucceeded=false}",  v2,  v3,  v4,  v5,  v6);
  sub_100031998();
}

void sub_10007716C()
{
  sub_100031964( (void *)&_mh_execute_header,  v0,  v1,  "IDMS->iCloud->iTunes authentication failed. {itunesStoreStatus=SATViTunesStoreAuthenticationFailed}",  v2,  v3,  v4,  v5,  v6);
  sub_100031998();
}

void sub_100077198()
{
  sub_100031964( (void *)&_mh_execute_header,  v0,  v1,  "IDMS->iTunes authentication failed. {iTunesStoreStatus=SATViTunesStoreAuthenticationFailed}",  v2,  v3,  v4,  v5,  v6);
  sub_100031998();
}

void sub_1000771C4()
{
  sub_100031964( (void *)&_mh_execute_header,  v0,  v1,  "IDMS->HomeSharing enablement failed. {IDMSSucceeded=false}",  v2,  v3,  v4,  v5,  v6);
  sub_100031998();
}

void sub_1000771F0()
{
}

void sub_100077228(id *a1)
{
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "IDMS authentication failed. {errorDomain=%{public}@, errorCode=%ld, error=%@}",  v4,  v5,  v6,  v7,  v8);

  sub_1000319C0();
}

void sub_1000772B0(id *a1)
{
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "iTunes authentication failed. {errorDomain=%{public}@, errorCode=%ld, error=%@}",  v4,  v5,  v6,  v7,  v8);

  sub_1000319C0();
}

void sub_100077338()
{
}

void sub_100077364()
{
  sub_1000371A8( (void *)&_mh_execute_header,  v0,  v1,  "Failed to create semaphore %{public}s for first boot token. Error = %d",  v2,  v3,  v4,  v5,  2u);
  sub_100026CE8();
}

void sub_1000773E0()
{
  sub_1000371A8( (void *)&_mh_execute_header,  v0,  v1,  "Failed to delete semaphore %{public}s for first boot token. Error = %d",  v2,  v3,  v4,  v5,  2u);
  sub_100026CE8();
}

void sub_10007745C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000774C4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10007752C()
{
  __assert_rtn( "-[SATVNetworkReachability _performReachabilityRequestWithRetryCount:completion:]",  "SATVNetworkReachability.m",  66,  "[NSThread isMainThread] == NO");
}

void sub_100077554(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "unable to load What's New %@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000775C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Shouldn't show What's New", v1, 2u);
}

void sub_100077608()
{
}

void sub_100077668()
{
}

void sub_1000776C8(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "ERROR: missing terms for %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_10000D790();
}

void sub_100077738(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) length];
  id v6 = [*(id *)(a1 + 40) length];
  uint64_t v7 = *(void **)(a1 + 40);
  int v8 = 138412802;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  id v11 = v5;
  __int16 v12 = 2112;
  uint8_t v13 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "\nType: %@\nLength: %lu\n%@\n",  (uint8_t *)&v8,  0x20u);
}

void sub_10007782C()
{
}

void sub_10007788C()
{
}

void sub_1000778EC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Error generating JSON representation of dictionary=%@, error=%@",  (uint8_t *)&v3,  0x16u);
}

void sub_100077970(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Bundle step does not conform to TVSKPrefetchStep!",  v1,  2u);
}

void sub_1000779B0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to update purchases password setting. We do not have an active account",  v1,  2u);
}

void sub_1000779F0()
{
}

void sub_100077A1C()
{
}

void sub_100077A48()
{
}

void sub_100077AB8()
{
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "Activator hook failed. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v4,  v5,  v6,  v7,  v8);

  sub_1000319C0();
}

void sub_100077B34()
{
  sub_100054E30((void *)&_mh_execute_header, v0, v1, "Setup already in progress; returning.", v2, v3, v4, v5, v6);
  sub_100031998();
}

void sub_100077B60()
{
}

void sub_100077B8C()
{
  id v2 = [(id)sub_100054EA0() localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100054DE8();
  sub_1000319A0( (void *)&_mh_execute_header,  v4,  v5,  "Setup failed. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v6,  v7,  v8,  v9,  v10);

  sub_1000319C0();
}

void sub_100077C1C(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v9 = 138413058;
  uint64_t v10 = a1;
  sub_100054E4C();
  sub_100054E94( (void *)&_mh_execute_header,  a3,  v8,  "Failed to find network. {networkName=%@, errorDomain=%{public}@, errorCode=%lu, error=%@",  (uint8_t *)&v9);

  sub_100054E74();
}

void sub_100077CD4()
{
}

void sub_100077D00(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 networkName]);
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 domain]);
  sub_100054EAC();
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v9 = 138413058;
  uint64_t v10 = v5;
  sub_100054E4C();
  sub_100054E94( (void *)&_mh_execute_header,  a3,  v8,  "Did fail to connect to network. {networkName=%@, errorDomain=%{public}@, errorCode=%lu, error=%@}",  (uint8_t *)&v9);

  sub_100054E74();
}

void sub_100077DC4()
{
  id v2 = [(id)sub_100054EA0() localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100054DE8();
  sub_1000319A0( (void *)&_mh_execute_header,  v4,  v5,  "Network connection failed. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v6,  v7,  v8,  v9,  v10);

  sub_1000319C0();
}

void sub_100077E54()
{
}

void sub_100077E80()
{
  id v2 = [(id)sub_100054EA0() localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100054DE8();
  sub_1000319A0( (void *)&_mh_execute_header,  v4,  v5,  "Did fail setup. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v6,  v7,  v8,  v9,  v10);

  sub_1000319C0();
}

void sub_100077F10()
{
  uint64_t v3 = TRStringFromSetupAccountType(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100054EC0();
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "Unrecognized account type %{public}@ (enum: %lu).",  v5,  0x16u);
}

void sub_100077FB4()
{
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "iTunes authentication failed. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v4,  v5,  v6,  v7,  v8);

  sub_1000319C0();
}

void sub_100078030()
{
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "iCloud authentication failed. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v4,  v5,  v6,  v7,  2u);

  sub_1000319C0();
}

void sub_1000780D0(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  objc_claimAutoreleasedReturnValue([*a2 domain]);
  id v7 = sub_1000319D0();
  id v8 = *a2;
  int v10 = 134218754;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint8_t v13 = v3;
  __int16 v14 = 2048;
  id v15 = v7;
  __int16 v16 = 2112;
  id v17 = v8;
  sub_100054E94( (void *)&_mh_execute_header,  a3,  v9,  "IDMS authentication failed. {serviceType=%ld, errorDomain=%{public}@, errorCode=%ld, error=%@}",  (uint8_t *)&v10);
}

void sub_100078198()
{
  sub_100054EB4((void *)&_mh_execute_header, v0, v1, "SetupService: session error. info=%@", v2);
}

void sub_100078200(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 domain]);
  sub_100054EAC();
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "No companion authentication results. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v4,  v5,  v6,  v7,  2u);

  sub_1000319C0();
}

void sub_1000782A4()
{
  sub_1000319A0( (void *)&_mh_execute_header,  v2,  v3,  "No proxy authentication results. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v4,  v5,  v6,  v7,  v8);

  sub_1000319C0();
}

void sub_100078320()
{
  id v2 = [(id)sub_100054EA0() localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100054DE8();
  sub_1000319A0( (void *)&_mh_execute_header,  v4,  v5,  "Save of account failed. This will stop further attempts as this should not fail. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v6,  v7,  v8,  v9,  v10);

  sub_1000319C0();
}

void sub_1000783B0(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = StringFromTRAccountService(*(void *)(a1 + 64));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 domain]);
  sub_100054EAC();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v10 = 138544130;
  uint64_t v11 = v6;
  sub_100054E4C();
  sub_100054E94( (void *)&_mh_execute_header,  a3,  v9,  "Error authenticating. {accountService=%{public}@, errorDomain=%{public}@, errorCode=%lu, error=%@}",  (uint8_t *)&v10);

  sub_100054E74();
}

void sub_100078478(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = StringFromTRAccountService(a1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100054EC0();
  sub_100054EB4((void *)&_mh_execute_header, a2, v5, "Unknown account services. {accountService=%{public}@", v6);
}

void sub_100078500()
{
  id v2 = [(id)sub_100054EA0() localizedDescription];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100054DE8();
  sub_1000319A0( (void *)&_mh_execute_header,  v4,  v5,  "Error authenticating with Home Sharing. {errorDomain=%{public}@, errorCode=%lu, error=%@}",  v6,  v7,  v8,  v9,  v10);

  sub_1000319C0();
}

void sub_100078590(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  objc_claimAutoreleasedReturnValue([*a2 domain]);
  id v7 = sub_1000319D0();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*a2 localizedDescription]);
  int v10 = 138413058;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint8_t v13 = v3;
  __int16 v14 = 2048;
  id v15 = v7;
  __int16 v16 = 2112;
  id v17 = v8;
  sub_100054E94( (void *)&_mh_execute_header,  a3,  v9,  "iTunes authentication failed. {username=%@, errorDomain=%{public}@, errorCode=%lu, error=%@}",  (uint8_t *)&v10);

  sub_100054E74();
}

void sub_100078664()
{
}

void sub_100078690()
{
}

void sub_1000786B8()
{
}

void sub_100078720(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundlePath]);
  sub_100054EC0();
  sub_100054EB4( (void *)&_mh_execute_header,  a2,  v4,  "Unable to retrieve a valid stable identifier for bundle at path: %@",  v5);
}

void sub_1000787A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to execute as we don't have a valid step",  v1,  2u);
}

void sub_1000787E8()
{
}

void sub_100078850(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v5 = [(id)objc_opt_class(a1) bundlePath];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100054EC0();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Unable to load bundle at path: %@. error=%@",  v7,  0x16u);
}

void sub_1000788FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "Query hasn't finished executing until now. We cancel the query....",  v1,  2u);
}

void sub_10007893C()
{
  __assert_rtn( "-[SATVHelloAnimatingHeaderViewController init]",  "SATVHelloAnimatingHeaderViewController.m",  56,  "_languageCodes.count == _subtitleStrings.count");
}

void sub_100078964(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  id v5 = (objc_class *)sub_100020108(v3, v4);
  uint8_t v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078A10(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  id v5 = (objc_class *)sub_100020108(v3, v4);
  uint8_t v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078ABC(const char *a1)
{
  uint64_t v2 = NSStringFromSelector(a1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  id v5 = (objc_class *)sub_100020108(v3, v4);
  uint8_t v6 = NSStringFromClass(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078B68(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to delete user profile. {identifier=%{public}@, error=%{public}@}",  (uint8_t *)&v4,  0x16u);
}

void sub_100078BF0()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078CA0()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078D50()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078E00()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078EB0()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100078F60()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100079010()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_1000790C0()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100079168()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100079210()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_1000792B8()
{
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_100020108(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_1000200C0();
  sub_100020114();
  sub_100020124();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100079360(uint64_t a1)
{
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_10005F4F8(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10005F4D0();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_100079424(uint64_t a1)
{
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v5 = (objc_class *)sub_10005F4F8(v3, v4);
  __int16 v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  sub_10005F4D0();
  sub_1000200E8( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v9,  v10,  v11,  v12,  v13);

  sub_1000200F8();
}

void sub_1000794E8()
{
}

void sub_100079510()
{
}

void sub_100079538(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = NSStringFromSelector(a1);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v8 = (objc_class *)objc_opt_class(a2, v7);
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  int v11 = 138544642;
  uint64_t v12 = v6;
  __int16 v13 = 2114;
  __int16 v14 = v10;
  __int16 v15 = 2048;
  uint64_t v16 = a2;
  __int16 v17 = 2114;
  id v18 = @"SATVExpressTapToSetupStep.m";
  __int16 v19 = 1024;
  int v20 = 38;
  __int16 v21 = 2114;
  uint64_t v22 = a3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v11,  0x3Au);
}

void sub_100079634()
{
}

void sub_10007965C()
{
}

void sub_100079684()
{
}

void sub_1000796E4(uint64_t a1, void *a2, void *a3)
{
  id v4 = sub_10006F538(a1, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 activeStep]);
  sub_10006F510();
  sub_10006F4FC( (void *)&_mh_execute_header,  v6,  v7,  "Step %{public}@ is not the same as the currently active step %{public}@. Invalid call..",  v8,  v9,  v10,  v11,  v12);

  sub_10006F528();
}

void sub_100079770(uint64_t a1, void *a2, void *a3)
{
  id v4 = sub_10006F538(a1, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 activeStep]);
  sub_10006F510();
  sub_10006F4FC( (void *)&_mh_execute_header,  v6,  v7,  "Step %{public}@ is not the same as the currently active step %{public}@. Invalid trigger status change callback..",  v8,  v9,  v10,  v11,  v12);

  sub_10006F528();
}

void sub_1000797FC(uint64_t a1, void *a2, void *a3)
{
  id v4 = sub_10006F538(a1, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 activeStep]);
  sub_10006F510();
  sub_10006F4FC( (void *)&_mh_execute_header,  v6,  v7,  "Step %{public}@ is not the same as the currently active step %{public}@. Invalid call for menu pressed..",  v8,  v9,  v10,  v11,  v12);

  sub_10006F528();
}

void sub_100079888()
{
}

void sub_1000798E8()
{
  sub_10003BC64((void *)&_mh_execute_header, v0, v1, "Failed to archive device info. {error = %@}", v2, v3, v4, v5, v6);
  sub_10000D790();
}

void sub_100079948()
{
  sub_10003BC64( (void *)&_mh_execute_header,  v0,  v1,  "Failed to unarchive device info. {error = %@}",  v2,  v3,  v4,  v5,  v6);
  sub_10000D790();
}

void sub_1000799A8()
{
  __assert_rtn("-[SATVActivator _configureStateMachine]_block_invoke", "SATVActivator.m", 281, "response != nil");
}

void sub_1000799D0()
{
  __assert_rtn("-[SATVActivator _activateDeviceWithResponse:]", "SATVActivator.m", 462, "response.headers != nil");
}

void sub_1000799F8()
{
  __assert_rtn("-[SATVActivator _handleActivationResponse:]", "SATVActivator.m", 484, "response.data != nil");
}

void sub_100079A20()
{
  __assert_rtn( "-[SATVActivator remoteUIController:shouldLoadRequest:redirectResponse:]",  "SATVActivator.m",  661,  "_loadingPage == nil");
}

void sub_100079A48()
{
}

void sub_100079A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v7 = (objc_class *)objc_opt_class(*(void *)(a1 + 32), v6);
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = *(void *)(a1 + 32);
  int v11 = 138544642;
  uint8_t v12 = v5;
  __int16 v13 = 2114;
  __int16 v14 = v9;
  __int16 v15 = 2048;
  uint64_t v16 = v10;
  __int16 v17 = 2114;
  id v18 = @"SATVExpressTapToSetupStepConfiguration.m";
  __int16 v19 = 1024;
  int v20 = 37;
  __int16 v21 = 2114;
  uint64_t v22 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v11,  0x3Au);
}

id objc_msgSend__authenticateAccount_forServiceType_withCompanionDevice_anisetteDataProvider_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_authenticateAccount:forServiceType:withCompanionDevice:anisetteDataProvider:completion:");
}

id objc_msgSend__completeStepWithConsentForSiri_consentForDictation_typeToSiri_TTSUDeviceSiriLanguage_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeStepWithConsentForSiri:consentForDictation:typeToSiri:TTSUDeviceSiriLanguage:");
}

id objc_msgSend__completeStepWithEnableLocationServices_locationServicesAuthorizationInfo_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeStepWithEnableLocationServices:locationServicesAuthorizationInfo:");
}

id objc_msgSend__completedCompanionAuthenticationRequest_unauthenticatedAccountServices_withResponseHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_completedCompanionAuthenticationRequest:unauthenticatedAccountServices:withResponseHandler:");
}

id objc_msgSend__completedProxyAuthenticationRequest_unauthenticatedAccountServices_withResponseHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completedProxyAuthenticationRequest:unauthenticatedAccountServices:withResponseHandler:");
}

id objc_msgSend__handleSiriConsent_dictationConsent_typeToSiriEnabled_TTSUDeviceSiriLanguage_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleSiriConsent:dictationConsent:typeToSiriEnabled:TTSUDeviceSiriLanguage:");
}

id objc_msgSend__notifyDeviceActivationTriggerStatusChangeWithReset_didConsentToExpressSetup_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyDeviceActivationTriggerStatusChangeWithReset:didConsentToExpressSetup:");
}

id objc_msgSend__updateItemsWithTapToSetupDeviceInfo_expressTapToSetupItemProviderClasses_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateItemsWithTapToSetupDeviceInfo:expressTapToSetupItemProviderClasses:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_initWithStepClasses_prefetchStepClasses_tapToSetupEnablingStepClasses_autoAdvancingStepClasses_userInputConfiguration_theme_overrideStringsFileName_configurationByStepIdentifier_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithStepClasses:prefetchStepClasses:tapToSetupEnablingStepClasses:autoAdvancingStepClasses:userInputConfi guration:theme:overrideStringsFileName:configurationByStepIdentifier:");
}

id objc_msgSend_setImageViewFrameFromChooseOptionViewFrame_withinBounds_layoutIsRightToLeft_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageViewFrameFromChooseOptionViewFrame:withinBounds:layoutIsRightToLeft:");
}

id objc_msgSend_setMediaServerDiscoveryConfigurationWithMode_homeSharingAccountName_homeSharingPassword_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setMediaServerDiscoveryConfigurationWithMode:homeSharingAccountName:homeSharingPassword:completionHandler:");
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_updateLocalAccessoryAudioDestination_forceUpdateWithUnavailableDestination_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "updateLocalAccessoryAudioDestination:forceUpdateWithUnavailableDestination:completionHandler:");
}

id objc_msgSend_updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker_completionHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLocalAccessoryAudioDestinationWithHomeTheaterSpeaker:completionHandler:");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}