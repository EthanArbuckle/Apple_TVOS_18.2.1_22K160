void sub_2A9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2ABC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_2ACC(uint64_t a1)
{
}

void sub_2AD4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0LL;
  id v7 = a4;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_2E5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_2E74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0LL;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_2F18( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_2F28( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_2F90( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_signOutContexts(void *a1, const char *a2, ...)
{
  return [a1 signOutContexts];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_personID"));

  return v15;
}

- (void)signInService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v41 handleFailureInMethod:a2, self, @"AACloudServiceOwner.m", 75, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v42 handleFailureInMethod:a2, self, @"AACloudServiceOwner.m", 76, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v13 = [(id)objc_opt_class(self) _serviceTypeForPlatform];
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned __int8 v15 = [v9 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v43 handleFailureInMethod:a2, self, @"AACloudServiceOwner.m", 77, @"Unexpected service type: %@", v9 object file lineNumber description];
  }

  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = sub_2ABC;
  v51 = sub_2ACC;
  id v52 = objc_alloc_init(&OBJC_CLASS___AASignInFlowController);
  [(id)v48[5] setShouldAutomaticallySaveSignInResults:1];
  v16 = (void *)v48[5];
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 cdpUiProvider]);
  [v16 setCdpUIProvider:v17];

  v18 = (void *)v48[5];
  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 signInContexts]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:AIDAServiceTypeCloud]);
  [v18 setDelegate:v20];

  if ((objc_opt_respondsToSelector(v10, "_telemetryTimeSeries") & 1) != 0)
  {
    uint64_t v21 = _AALogSystem();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_2F28((uint64_t)v10, v22, v23, v24, v25, v26, v27, v28);
    }

    v29 = (void *)v48[5];
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 _telemetryTimeSeries]);
    [v29 setTelemetryTimeSeries:v30];
  }

  else
  {
    uint64_t v31 = _AALogSystem();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_2F90((uint64_t)v10, v30, v32, v33, v34, v35, v36, v37);
    }
  }

  v38 = (void *)v48[5];
  v39 = (void *)objc_claimAutoreleasedReturnValue([v10 authenticationResults]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_2AD4;
  v44[3] = &unk_4150;
  v46 = &v47;
  id v40 = v12;
  id v45 = v40;
  [v38 signInWithIDMSAuthenticationResults:v39 completion:v44];

  _Block_object_dispose(&v47, 8);
}

- (void)signOutService:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void, void, void))v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v26 handleFailureInMethod:a2, self, @"AACloudServiceOwner.m", 98, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v27 handleFailureInMethod:a2, self, @"AACloudServiceOwner.m", 99, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v13 = [(id)objc_opt_class(self) _serviceTypeForPlatform];
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  unsigned __int8 v15 = [v9 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v28 handleFailureInMethod:a2, self, @"AACloudServiceOwner.m", 100, @"Unexpected service type: %@", v9 object file lineNumber description];
  }

  uint64_t v16 = _AALogSystem();
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Cloud service owner called to sign out account...", buf, 2u);
  }

  uint64_t v18 = AIDAServiceTypeCloud;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AACloudServiceOwner accountForService:](self, "accountForService:", AIDAServiceTypeCloud));
  if (v19)
  {
    *(void *)buf = 0LL;
    uint64_t v33 = buf;
    uint64_t v34 = 0x3032000000LL;
    uint64_t v35 = sub_2ABC;
    uint64_t v36 = sub_2ACC;
    id v37 = [[AASignOutFlowController alloc] initWithContext:v10];
    v20 = (void *)*((void *)v33 + 5);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v10 signOutContexts]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v18]);
    [v20 setDelegate:v22];

    uint64_t v23 = (void *)*((void *)v33 + 5);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_2E74;
    v29[3] = &unk_4178;
    uint64_t v31 = buf;
    v30 = v12;
    [v23 signOutAppleAccount:v19 completion:v29];

    _Block_object_dispose(buf, 8);
  }

  else
  {
    uint64_t v24 = _AALogSystem();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "No active store account, skipping sign out!", buf, 2u);
    }

    v12[2](v12, 1LL, 0LL);
  }
}

+ (id)_serviceTypeForPlatform
{
  return AIDAServiceTypeCloud;
}

- (void).cxx_destruct
{
}

@end